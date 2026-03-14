from flask import Blueprint, render_template, request, redirect, url_for, flash
from app import db
from app.models import School, Category, Subcategory, Question, SchoolAnswer, SchoolAnswerOption, QuestionOption

answers_bp = Blueprint('answers', __name__)


@answers_bp.route('/schools/<int:school_id>/answer/<int:subcategory_id>', methods=['GET', 'POST'])
def answer_subcategory(school_id, subcategory_id):
    school = School.query.get_or_404(school_id)
    subcategory = Subcategory.query.get_or_404(subcategory_id)
    questions = Question.query.filter_by(subcategory_id=subcategory_id).order_by(Question.display_order).all()

    if request.method == 'POST':
        for question in questions:
            field_name = f'q_{question.id}'
            answer_type = question.answer_type.code

            existing = SchoolAnswer.query.filter_by(
                school_id=school_id, question_id=question.id
            ).first()

            if not existing:
                existing = SchoolAnswer(school_id=school_id, question_id=question.id)
                db.session.add(existing)

            if answer_type == 'boolean':
                val = request.form.get(field_name)
                if val == 'true':
                    existing.answer_boolean = True
                elif val == 'false':
                    existing.answer_boolean = False
                else:
                    existing.answer_boolean = None

            elif answer_type == 'number':
                val = request.form.get(field_name)
                existing.answer_number = float(val) if val else None

            elif answer_type == 'rating':
                val = request.form.get(field_name)
                existing.answer_number = int(val) if val else None

            elif answer_type == 'single_choice':
                val = request.form.get(field_name)
                SchoolAnswerOption.query.filter_by(answer_id=existing.id).delete() if existing.id else None
                db.session.flush()
                if val:
                    option = QuestionOption.query.get(int(val))
                    if option:
                        existing.answer_text = option.option_text
                        sao = SchoolAnswerOption(answer_id=existing.id, option_id=option.id)
                        db.session.add(sao)

            elif answer_type == 'multi_choice':
                vals = request.form.getlist(field_name)
                SchoolAnswerOption.query.filter_by(answer_id=existing.id).delete() if existing.id else None
                db.session.flush()
                texts = []
                for v in vals:
                    option = QuestionOption.query.get(int(v))
                    if option:
                        texts.append(option.option_text)
                        sao = SchoolAnswerOption(answer_id=existing.id, option_id=option.id)
                        db.session.add(sao)
                existing.answer_text = ', '.join(texts)

            else:
                existing.answer_text = request.form.get(field_name)

            notes_field = f'notes_{question.id}'
            existing.notes = request.form.get(notes_field)

        db.session.commit()
        flash(f'"{subcategory.name}" cevapları kaydedildi!', 'success')

        # Sonraki alt kategoriye yönlendir
        next_sub = Subcategory.query.filter(
            Subcategory.category_id == subcategory.category_id,
            Subcategory.display_order > subcategory.display_order
        ).order_by(Subcategory.display_order).first()

        if next_sub:
            return redirect(url_for('answers.answer_subcategory',
                                    school_id=school_id, subcategory_id=next_sub.id))
        return redirect(url_for('schools.detail', school_id=school_id))

    # GET: mevcut cevapları yükle
    answer_map = {}
    for q in questions:
        ans = SchoolAnswer.query.filter_by(school_id=school_id, question_id=q.id).first()
        if ans:
            answer_map[q.id] = ans

    # Sidebar: tüm kategorileri ve alt kategorileri listele
    categories = Category.query.order_by(Category.display_order).all()

    # Önceki ve sonraki subcategory
    prev_sub = Subcategory.query.filter(
        Subcategory.category_id == subcategory.category_id,
        Subcategory.display_order < subcategory.display_order
    ).order_by(Subcategory.display_order.desc()).first()

    next_sub = Subcategory.query.filter(
        Subcategory.category_id == subcategory.category_id,
        Subcategory.display_order > subcategory.display_order
    ).order_by(Subcategory.display_order).first()

    return render_template('answer_form.html',
                           school=school,
                           subcategory=subcategory,
                           questions=questions,
                           answer_map=answer_map,
                           categories=categories,
                           prev_sub=prev_sub,
                           next_sub=next_sub)
