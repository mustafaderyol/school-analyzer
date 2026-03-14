from flask import Blueprint, render_template, request, redirect, url_for, flash, jsonify
from app import db
from app.models import School, LondonArea

schools_bp = Blueprint('schools', __name__)


@schools_bp.route('/')
def index():
    from app.models import Question, SchoolAnswer
    schools = School.query.order_by(School.created_at.desc()).all()
    stats = {
        'total_schools': len(schools),
        'total_areas': LondonArea.query.count(),
        'total_questions': Question.query.count(),
        'total_answers': SchoolAnswer.query.count()
    }
    return render_template('index.html', schools=schools, stats=stats)


@schools_bp.route('/schools/new', methods=['GET', 'POST'])
def new_school():
    if request.method == 'POST':
        school = School(
            name=request.form.get('name'),
            website=request.form.get('website'),
            email=request.form.get('email'),
            phone=request.form.get('phone'),
            city=request.form.get('city', 'London'),
            country=request.form.get('country', 'United Kingdom'),
            address=request.form.get('address'),
            area_id=request.form.get('area_id') or None,
            year_founded=request.form.get('year_founded') or None,
            is_chain=request.form.get('is_chain') == 'on',
            chain_name=request.form.get('chain_name'),
            chain_branch_count=request.form.get('chain_branch_count') or None,
            google_rating=request.form.get('google_rating') or None,
            trustpilot_rating=request.form.get('trustpilot_rating') or None,
            notes=request.form.get('notes'),
        )
        db.session.add(school)
        
        db.session.commit()
        flash(f'"{school.name}" başarıyla eklendi!', 'success')
        return redirect(url_for('schools.detail', school_id=school.id))

    areas = LondonArea.query.order_by(LondonArea.name).all()
    
    return render_template('school_form.html', school=None, areas=areas)


@schools_bp.route('/schools/<int:school_id>')
def detail(school_id):
    school = School.query.get_or_404(school_id)
    from app.models import Category
    categories = Category.query.order_by(Category.display_order).all()
    answer_map = {}
    for ans in school.answers:
        answer_map[ans.question_id] = ans
    return render_template('school_detail.html', school=school, categories=categories, answer_map=answer_map)


@schools_bp.route('/schools/<int:school_id>/edit', methods=['GET', 'POST'])
def edit_school(school_id):
    school = School.query.get_or_404(school_id)
    if request.method == 'POST':
        school.name = request.form.get('name')
        school.website = request.form.get('website')
        school.email = request.form.get('email')
        school.phone = request.form.get('phone')
        school.city = request.form.get('city', 'London')
        school.country = request.form.get('country', 'United Kingdom')
        school.address = request.form.get('address')
        school.area_id = request.form.get('area_id') or None
        school.year_founded = request.form.get('year_founded') or None
        school.is_chain = request.form.get('is_chain') == 'on'
        school.chain_name = request.form.get('chain_name')
        school.chain_branch_count = request.form.get('chain_branch_count') or None
        school.google_rating = request.form.get('google_rating') or None
        school.trustpilot_rating = request.form.get('trustpilot_rating') or None
        school.notes = request.form.get('notes')

        db.session.commit()
        flash(f'"{school.name}" güncellendi.', 'success')
        return redirect(url_for('schools.detail', school_id=school.id))

    from app.models import LondonArea
    areas = LondonArea.query.order_by(LondonArea.name).all()
    
    return render_template('school_form.html', school=school, areas=areas)


@schools_bp.route('/schools/<int:school_id>/delete', methods=['POST'])
def delete_school(school_id):
    school = School.query.get_or_404(school_id)
    name = school.name
    db.session.delete(school)
    db.session.commit()
    flash(f'"{name}" silindi!', 'warning')
    return redirect(url_for('schools.index'))


@schools_bp.route('/schools/<int:school_id>/full_report')
def full_report(school_id):
    school = School.query.get_or_404(school_id)
    from app.models import Category
    categories = Category.query.order_by(Category.display_order).all()
    answer_map = {}
    for ans in school.answers:
        answer_map[ans.question_id] = ans
    return render_template('school_report.html', school=school, categories=categories, answer_map=answer_map)

