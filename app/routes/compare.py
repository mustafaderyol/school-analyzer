from flask import Blueprint, render_template, request, jsonify
from app.models import School, Category, Subcategory, Question, SchoolAnswer

compare_bp = Blueprint('compare', __name__)


@compare_bp.route('/compare')
def compare():
    schools = School.query.order_by(School.name).all()
    selected_ids = request.args.getlist('ids', type=int)
    selected_schools = []
    comparison_data = {}

    if len(selected_ids) >= 2:
        selected_schools = School.query.filter(School.id.in_(selected_ids)).all()
        categories = Category.query.order_by(Category.display_order).all()

        for category in categories:
            comparison_data[category.id] = {
                'category': category,
                'subcategories': {}
            }
            for sub in category.subcategories:
                questions_data = []
                for question in sub.questions:
                    q_data = {
                        'question': question,
                        'answers': {}
                    }
                    for school in selected_schools:
                        ans = SchoolAnswer.query.filter_by(
                            school_id=school.id,
                            question_id=question.id
                        ).first()
                        q_data['answers'][school.id] = ans
                    questions_data.append(q_data)

                comparison_data[category.id]['subcategories'][sub.id] = {
                    'subcategory': sub,
                    'questions': questions_data
                }

    return render_template('compare.html',
                           schools=schools,
                           selected_schools=selected_schools,
                           selected_ids=selected_ids,
                           comparison_data=comparison_data)


@compare_bp.route('/api/compare')
def api_compare():
    ids = request.args.getlist('ids', type=int)
    if len(ids) < 2:
        return jsonify({'error': 'En az 2 okul seçmelisiniz'}), 400

    schools = School.query.filter(School.id.in_(ids)).all()
    result = {'schools': [], 'categories': []}

    for school in schools:
        result['schools'].append({
            'id': school.id,
            'name': school.name,
            'city': school.city,
            'website': school.website
        })

    categories = Category.query.order_by(Category.display_order).all()
    for cat in categories:
        cat_data = {'name': cat.name, 'subcategories': []}
        for sub in cat.subcategories:
            sub_data = {'name': sub.name, 'questions': []}
            for q in sub.questions:
                q_data = {
                    'question': q.question_text,
                    'type': q.answer_type.code,
                    'unit': q.unit,
                    'is_critical': q.is_critical,
                    'comparison_mode': q.comparison_mode,
                    'answers': {}
                }
                for school in schools:
                    ans = SchoolAnswer.query.filter_by(
                        school_id=school.id, question_id=q.id
                    ).first()
                    q_data['answers'][str(school.id)] = ans.display_value if ans else '-'
                sub_data['questions'].append(q_data)
            cat_data['subcategories'].append(sub_data)
        result['categories'].append(cat_data)

    return jsonify(result)


@compare_bp.route('/critical_compare')
def critical_compare():
    schools = School.query.order_by(School.name).all()
    # Sadece kritik işaretlenmiş sorular
    critical_questions = Question.query.filter_by(is_critical=True).order_by(Question.display_order).all()
    
    question_data = []
    for q in critical_questions:
        q_info = {'question': q, 'answers': {}}
        for s in schools:
            ans = SchoolAnswer.query.filter_by(school_id=s.id, question_id=q.id).first()
            q_info['answers'][s.id] = ans
        question_data.append(q_info)
        
    return render_template('critical_compare.html', schools=schools, question_data=question_data)
