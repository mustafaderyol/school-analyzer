from flask import Blueprint, render_template, request, redirect, url_for, flash
from app import db
from app.models import School, Category, Subcategory, Question, AnswerType, LondonArea

admin_bp = Blueprint('admin', __name__)

@admin_bp.route('/')
def dashboard():
    """Admin dashboard with summary statistics."""
    from app.models import (
        AccreditationBody, TeacherCertification, TeachingMethodology,
        CourseType, AccommodationType, MetroLine, MealPlan, FacilityType,
        SupportServiceType, ActivityType, DietaryOption, CancellationPolicy
    )
    stats = {
        'schools_count': School.query.count(),
        'categories_count': Category.query.count(),
        'subcategories_count': Subcategory.query.count(),
        'questions_count': Question.query.count(),
        'answer_types_count': AnswerType.query.count(),
        'areas_count': LondonArea.query.count(),
        # New definition counts
        'definitions_total': (
            AccreditationBody.query.count() + TeacherCertification.query.count() +
            TeachingMethodology.query.count() + CourseType.query.count() +
            AccommodationType.query.count() + MetroLine.query.count() +
            MealPlan.query.count() + FacilityType.query.count() +
            SupportServiceType.query.count() + ActivityType.query.count() +
            DietaryOption.query.count() + CancellationPolicy.query.count()
        )
    }
    return render_template('admin/dashboard.html', stats=stats)


@admin_bp.route('/definitions')
def global_definitions():
    """A hub to manage all lookup tables."""
    from app.models import (
        AccreditationBody, TeacherCertification, TeachingMethodology,
        CourseType, AccommodationType, MetroLine, MealPlan, FacilityType,
        SupportServiceType, ActivityType, DietaryOption, CancellationPolicy
    )
    definitions = [
        {'name': 'Akreditasyon Kurumları', 'count': AccreditationBody.query.count(), 'url': 'admin.accreditation_list', 'icon': '📜'},
        {'name': 'Öğretmen Sertifikaları', 'count': TeacherCertification.query.count(), 'url': 'admin.certification_list', 'icon': '👨‍🏫'},
        {'name': 'Eğitim Metodolojileri', 'count': TeachingMethodology.query.count(), 'url': 'admin.methodology_list', 'icon': '🧠'},
        {'name': 'Kurs Türleri', 'count': CourseType.query.count(), 'url': 'admin.course_type_list', 'icon': '📚'},
        {'name': 'Konaklama Türleri', 'count': AccommodationType.query.count(), 'url': 'admin.accommodation_type_list', 'icon': '🏠'},
        {'name': 'Metro Hattları', 'count': MetroLine.query.count(), 'url': 'admin.metro_line_list', 'icon': '🚇'},
        {'name': 'Yemek Planları', 'count': MealPlan.query.count(), 'url': 'admin.meal_plan_list', 'icon': '🍽️'},
        {'name': 'Tesis Türleri', 'count': FacilityType.query.count(), 'url': 'admin.facility_type_list', 'icon': '🏗️'},
        {'name': 'Destek Hizmetleri', 'count': SupportServiceType.query.count(), 'url': 'admin.support_service_list', 'icon': '🤝'},
        {'name': 'Aktivite Türleri', 'count': ActivityType.query.count(), 'url': 'admin.activity_list', 'icon': '🎾'},
        {'name': 'Diyet Seçenekleri', 'count': DietaryOption.query.count(), 'url': 'admin.dietary_option_list', 'icon': '🥗'},
        {'name': 'İptal Politikaları', 'count': CancellationPolicy.query.count(), 'url': 'admin.cancellation_policy_list', 'icon': '📄'},
    ]
    return render_template('admin/global_definitions.html', definitions=definitions)


# --- Accreditation Body Management ---

@admin_bp.route('/definitions/accreditations')
def accreditation_list():
    from app.models import AccreditationBody
    items = AccreditationBody.query.order_by(AccreditationBody.name).all()
    return render_template('admin/def_list_simple.html', items=items, title='Akreditasyon Kurumları', type='accreditations', fields=['name', 'country', 'website'])

@admin_bp.route('/definitions/accreditations/new', methods=['GET', 'POST'])
@admin_bp.route('/definitions/accreditations/<int:id>/edit', methods=['GET', 'POST'])
def accreditation_edit(id=None):
    from app.models import AccreditationBody
    item = AccreditationBody.query.get(id) if id else None
    if request.method == 'POST':
        if not item:
            item = AccreditationBody()
            db.session.add(item)
        item.name = request.form.get('name')
        item.country = request.form.get('country')
        item.website = request.form.get('website')
        db.session.commit()
        flash('Akreditasyon kurumu kaydedildi.', 'success')
        return redirect(url_for('admin.accreditation_list'))
    return render_template('admin/def_form_simple.html', item=item, title='Akreditasyon Kurumu', type='accreditations', fields=[
        {'name': 'name', 'label': 'Kurum Adı', 'type': 'text', 'required': True},
        {'name': 'country', 'label': 'Ülke', 'type': 'text'},
        {'name': 'website', 'label': 'Web Sitesi', 'type': 'url'}
    ])

@admin_bp.route('/definitions/accreditations/<int:id>/delete', methods=['POST'])
def accreditation_delete(id):
    from app.models import AccreditationBody
    item = AccreditationBody.query.get_or_404(id)
    db.session.delete(item)
    db.session.commit()
    flash('Kayıt silindi.', 'warning')
    return redirect(url_for('admin.accreditation_list'))


# --- Teacher Certification Management ---

@admin_bp.route('/definitions/certifications')
def certification_list():
    from app.models import TeacherCertification
    items = TeacherCertification.query.order_by(TeacherCertification.name).all()
    return render_template('admin/def_list_simple.html', items=items, title='Öğretmen Sertifikaları', type='certifications', fields=['name', 'full_name', 'level'])

@admin_bp.route('/definitions/certifications/new', methods=['GET', 'POST'])
@admin_bp.route('/definitions/certifications/<int:id>/edit', methods=['GET', 'POST'])
def certification_edit(id=None):
    from app.models import TeacherCertification
    item = TeacherCertification.query.get(id) if id else None
    if request.method == 'POST':
        if not item:
            item = TeacherCertification()
            db.session.add(item)
        item.name = request.form.get('name')
        item.full_name = request.form.get('full_name')
        item.level = request.form.get('level')
        db.session.commit()
        flash('Sertifika kaydedildi.', 'success')
        return redirect(url_for('admin.certification_list'))
    return render_template('admin/def_form_simple.html', item=item, title='Öğretmen Sertifikası', type='certifications', fields=[
        {'name': 'name', 'label': 'Kısa Ad (örn: CELTA)', 'type': 'text', 'required': True},
        {'name': 'full_name', 'label': 'Tam Adı', 'type': 'text'},
        {'name': 'level', 'label': 'Seviye (Entry/Advanced/Master)', 'type': 'text'}
    ])

@admin_bp.route('/definitions/certifications/<int:id>/delete', methods=['POST'])
def certification_delete(id):
    from app.models import TeacherCertification
    item = TeacherCertification.query.get_or_404(id)
    db.session.delete(item)
    db.session.commit()
    flash('Kayıt silindi.', 'warning')
    return redirect(url_for('admin.certification_list'))


# --- Teaching Methodology Management ---

@admin_bp.route('/definitions/methodologies')
def methodology_list():
    from app.models import TeachingMethodology
    items = TeachingMethodology.query.order_by(TeachingMethodology.name).all()
    return render_template('admin/def_list_simple.html', items=items, title='Eğitim Metodolojileri', type='methodologies', fields=['name', 'description'])

@admin_bp.route('/definitions/methodologies/new', methods=['GET', 'POST'])
@admin_bp.route('/definitions/methodologies/<int:id>/edit', methods=['GET', 'POST'])
def methodology_edit(id=None):
    from app.models import TeachingMethodology
    item = TeachingMethodology.query.get(id) if id else None
    if request.method == 'POST':
        if not item:
            item = TeachingMethodology()
            db.session.add(item)
        item.name = request.form.get('name')
        item.description = request.form.get('description')
        db.session.commit()
        flash('Metodoloji kaydedildi.', 'success')
        return redirect(url_for('admin.methodology_list'))
    return render_template('admin/def_form_simple.html', item=item, title='Eğitim Metodolojisi', type='methodologies', fields=[
        {'name': 'name', 'label': 'Metod Adı', 'type': 'text', 'required': True},
        {'name': 'description', 'label': 'Açıklama', 'type': 'textarea'}
    ])

@admin_bp.route('/definitions/methodologies/<int:id>/delete', methods=['POST'])
def methodology_delete(id):
    from app.models import TeachingMethodology
    item = TeachingMethodology.query.get_or_404(id)
    db.session.delete(item)
    db.session.commit()
    flash('Kayıt silindi.', 'warning')
    return redirect(url_for('admin.methodology_list'))


# --- Course Type Management ---

@admin_bp.route('/definitions/course_types')
def course_type_list():
    from app.models import CourseType
    items = CourseType.query.order_by(CourseType.name).all()
    return render_template('admin/def_list_simple.html', items=items, title='Kurs Türleri', type='course_types', fields=['name', 'description'])

@admin_bp.route('/definitions/course_types/new', methods=['GET', 'POST'])
@admin_bp.route('/definitions/course_types/<int:id>/edit', methods=['GET', 'POST'])
def course_type_edit(id=None):
    from app.models import CourseType
    item = CourseType.query.get(id) if id else None
    if request.method == 'POST':
        if not item:
            item = CourseType()
            db.session.add(item)
        item.name = request.form.get('name')
        item.description = request.form.get('description')
        db.session.commit()
        flash('Kurs türü kaydedildi.', 'success')
        return redirect(url_for('admin.course_type_list'))
    return render_template('admin/def_form_simple.html', item=item, title='Kurs Türü', type='course_types', fields=[
        {'name': 'name', 'label': 'Kurs Türü', 'type': 'text', 'required': True},
        {'name': 'description', 'label': 'Açıklama', 'type': 'textarea'}
    ])

@admin_bp.route('/definitions/course_types/<int:id>/delete', methods=['POST'])
def course_type_delete(id):
    from app.models import CourseType
    item = CourseType.query.get_or_404(id)
    db.session.delete(item)
    db.session.commit()
    flash('Kayıt silindi.', 'warning')
    return redirect(url_for('admin.course_type_list'))


# --- Accommodation Type Management ---

@admin_bp.route('/definitions/accommodation_types')
def accommodation_type_list():
    from app.models import AccommodationType
    items = AccommodationType.query.order_by(AccommodationType.name).all()
    return render_template('admin/def_list_simple.html', items=items, title='Konaklama Türleri', type='accommodation_types', fields=['name', 'description'])

@admin_bp.route('/definitions/accommodation_types/new', methods=['GET', 'POST'])
@admin_bp.route('/definitions/accommodation_types/<int:id>/edit', methods=['GET', 'POST'])
def accommodation_type_edit(id=None):
    from app.models import AccommodationType
    item = AccommodationType.query.get(id) if id else None
    if request.method == 'POST':
        if not item:
            item = AccommodationType()
            db.session.add(item)
        item.name = request.form.get('name')
        item.description = request.form.get('description')
        db.session.commit()
        flash('Konaklama türü kaydedildi.', 'success')
        return redirect(url_for('admin.accommodation_type_list'))
    return render_template('admin/def_form_simple.html', item=item, title='Konaklama Türü', type='accommodation_types', fields=[
        {'name': 'name', 'label': 'Konaklama Türü', 'type': 'text', 'required': True},
        {'name': 'description', 'label': 'Açıklama', 'type': 'textarea'}
    ])

@admin_bp.route('/definitions/accommodation_types/<int:id>/delete', methods=['POST'])
def accommodation_type_delete(id):
    from app.models import AccommodationType
    item = AccommodationType.query.get_or_404(id)
    db.session.delete(item)
    db.session.commit()
    flash('Kayıt silindi.', 'warning')
    return redirect(url_for('admin.accommodation_type_list'))


# --- Metro Line Management ---

@admin_bp.route('/definitions/metro_lines')
def metro_line_list():
    from app.models import MetroLine
    items = MetroLine.query.order_by(MetroLine.name).all()
    return render_template('admin/def_list_simple.html', items=items, title='Metro Hattları', type='metro_lines', fields=['name', 'color'])

@admin_bp.route('/definitions/metro_lines/new', methods=['GET', 'POST'])
@admin_bp.route('/definitions/metro_lines/<int:id>/edit', methods=['GET', 'POST'])
def metro_line_edit(id=None):
    from app.models import MetroLine
    item = MetroLine.query.get(id) if id else None
    if request.method == 'POST':
        if not item:
            item = MetroLine()
            db.session.add(item)
        item.name = request.form.get('name')
        item.color = request.form.get('color')
        db.session.commit()
        flash('Metro hattı kaydedildi.', 'success')
        return redirect(url_for('admin.metro_line_list'))
    return render_template('admin/def_form_simple.html', item=item, title='Metro Hattı', type='metro_lines', fields=[
        {'name': 'name', 'label': 'Hat Adı', 'type': 'text', 'required': True},
        {'name': 'color', 'label': 'Hat Rengi', 'type': 'color'}
    ])

@admin_bp.route('/definitions/metro_lines/<int:id>/delete', methods=['POST'])
def metro_line_delete(id):
    from app.models import MetroLine
    item = MetroLine.query.get_or_404(id)
    db.session.delete(item)
    db.session.commit()
    flash('Kayıt silindi.', 'warning')
    return redirect(url_for('admin.metro_line_list'))


# --- Meal Plan Management ---

@admin_bp.route('/definitions/meal_plans')
def meal_plan_list():
    from app.models import MealPlan
    items = MealPlan.query.order_by(MealPlan.name).all()
    return render_template('admin/def_list_simple.html', items=items, title='Yemek Planları', type='meal_plans', fields=['name', 'description'])

@admin_bp.route('/definitions/meal_plans/new', methods=['GET', 'POST'])
@admin_bp.route('/definitions/meal_plans/<int:id>/edit', methods=['GET', 'POST'])
def meal_plan_edit(id=None):
    from app.models import MealPlan
    item = MealPlan.query.get(id) if id else None
    if request.method == 'POST':
        if not item:
            item = MealPlan()
            db.session.add(item)
        item.name = request.form.get('name')
        item.description = request.form.get('description')
        db.session.commit()
        flash('Yemek planı kaydedildi.', 'success')
        return redirect(url_for('admin.meal_plan_list'))
    return render_template('admin/def_form_simple.html', item=item, title='Yemek Planı', type='meal_plans', fields=[
        {'name': 'name', 'label': 'Plan Adı (örn: Yarım Pansiyon)', 'type': 'text', 'required': True},
        {'name': 'description', 'label': 'Açıklama', 'type': 'textarea'}
    ])

@admin_bp.route('/definitions/meal_plans/<int:id>/delete', methods=['POST'])
def meal_plan_delete(id):
    from app.models import MealPlan
    item = MealPlan.query.get_or_404(id)
    db.session.delete(item)
    db.session.commit()
    flash('Kayıt silindi.', 'warning')
    return redirect(url_for('admin.meal_plan_list'))


# --- Facility Type Management ---

@admin_bp.route('/definitions/facilities')
def facility_type_list():
    from app.models import FacilityType
    items = FacilityType.query.order_by(FacilityType.name).all()
    return render_template('admin/def_list_simple.html', items=items, title='Tesis Türleri', type='facility_types', fields=['name', 'icon', 'description'])

@admin_bp.route('/definitions/facilities/new', methods=['GET', 'POST'])
@admin_bp.route('/definitions/facilities/<int:id>/edit', methods=['GET', 'POST'])
def facility_type_edit(id=None):
    from app.models import FacilityType
    item = FacilityType.query.get(id) if id else None
    if request.method == 'POST':
        if not item:
            item = FacilityType()
            db.session.add(item)
        item.name = request.form.get('name')
        item.icon = request.form.get('icon')
        item.description = request.form.get('description')
        db.session.commit()
        flash('Tesis türü kaydedildi.', 'success')
        return redirect(url_for('admin.facility_type_list'))
    return render_template('admin/def_form_simple.html', item=item, title='Tesis Türü', type='facility_types', fields=[
        {'name': 'name', 'label': 'Tesis Adı', 'type': 'text', 'required': True},
        {'name': 'icon', 'label': 'İkon (Emoji veya Class)', 'type': 'text'},
        {'name': 'description', 'label': 'Açıklama', 'type': 'textarea'}
    ])

@admin_bp.route('/definitions/facilities/<int:id>/delete', methods=['POST'])
def facility_type_delete(id):
    from app.models import FacilityType
    item = FacilityType.query.get_or_404(id)
    db.session.delete(item)
    db.session.commit()
    flash('Kayıt silindi.', 'warning')
    return redirect(url_for('admin.facility_type_list'))


# --- Support Service Management ---

@admin_bp.route('/definitions/services')
def support_service_list():
    from app.models import SupportServiceType
    items = SupportServiceType.query.order_by(SupportServiceType.name).all()
    return render_template('admin/def_list_simple.html', items=items, title='Destek Hizmetleri', type='support_services', fields=['name', 'description'])

@admin_bp.route('/definitions/services/new', methods=['GET', 'POST'])
@admin_bp.route('/definitions/services/<int:id>/edit', methods=['GET', 'POST'])
def support_service_edit(id=None):
    from app.models import SupportServiceType
    item = SupportServiceType.query.get(id) if id else None
    if request.method == 'POST':
        if not item:
            item = SupportServiceType()
            db.session.add(item)
        item.name = request.form.get('name')
        item.description = request.form.get('description')
        db.session.commit()
        flash('Hizmet türü kaydedildi.', 'success')
        return redirect(url_for('admin.support_service_list'))
    return render_template('admin/def_form_simple.html', item=item, title='Destek Hizmeti', type='support_services', fields=[
        {'name': 'name', 'label': 'Hizmet Adı', 'type': 'text', 'required': True},
        {'name': 'description', 'label': 'Açıklama', 'type': 'textarea'}
    ])

@admin_bp.route('/definitions/services/<int:id>/delete', methods=['POST'])
def support_service_delete(id):
    from app.models import SupportServiceType
    item = SupportServiceType.query.get_or_404(id)
    db.session.delete(item)
    db.session.commit()
    flash('Kayıt silindi.', 'warning')
    return redirect(url_for('admin.support_service_list'))


# --- Activity Management ---

@admin_bp.route('/definitions/activities')
def activity_list():
    from app.models import ActivityType
    items = ActivityType.query.order_by(ActivityType.name).all()
    return render_template('admin/def_list_simple.html', items=items, title='Aktivite Türleri', type='activities', fields=['name', 'is_free', 'description'])

@admin_bp.route('/definitions/activities/new', methods=['GET', 'POST'])
@admin_bp.route('/definitions/activities/<int:id>/edit', methods=['GET', 'POST'])
def activity_edit(id=None):
    from app.models import ActivityType
    item = ActivityType.query.get(id) if id else None
    if request.method == 'POST':
        if not item:
            item = ActivityType()
            db.session.add(item)
        item.name = request.form.get('name')
        item.is_free = request.form.get('is_free') == 'on'
        item.description = request.form.get('description')
        db.session.commit()
        flash('Aktivite türü kaydedildi.', 'success')
        return redirect(url_for('admin.activity_list'))
    return render_template('admin/def_form_simple.html', item=item, title='Aktivite Türü', type='activities', fields=[
        {'name': 'name', 'label': 'Aktivite Adı', 'type': 'text', 'required': True},
        {'name': 'is_free', 'label': 'Ücretsiz mi?', 'type': 'checkbox'},
        {'name': 'description', 'label': 'Açıklama', 'type': 'textarea'}
    ])

@admin_bp.route('/definitions/activities/<int:id>/delete', methods=['POST'])
def activity_delete(id):
    from app.models import ActivityType
    item = ActivityType.query.get_or_404(id)
    db.session.delete(item)
    db.session.commit()
    flash('Kayıt silindi.', 'warning')
    return redirect(url_for('admin.activity_list'))


# --- Dietary Option Management ---

@admin_bp.route('/definitions/dietary_options')
def dietary_option_list():
    from app.models import DietaryOption
    items = DietaryOption.query.order_by(DietaryOption.name).all()
    return render_template('admin/def_list_simple.html', items=items, title='Diyet Seçenekleri', type='dietary_options', fields=['name'])

@admin_bp.route('/definitions/dietary_options/new', methods=['GET', 'POST'])
@admin_bp.route('/definitions/dietary_options/<int:id>/edit', methods=['GET', 'POST'])
def dietary_option_edit(id=None):
    from app.models import DietaryOption
    item = DietaryOption.query.get(id) if id else None
    if request.method == 'POST':
        if not item:
            item = DietaryOption()
            db.session.add(item)
        item.name = request.form.get('name')
        db.session.commit()
        flash('Diyet seçeneği kaydedildi.', 'success')
        return redirect(url_for('admin.dietary_option_list'))
    return render_template('admin/def_form_simple.html', item=item, title='Diyet Seçeneği', type='dietary_options', fields=[
        {'name': 'name', 'label': 'Seçenek Adı (örn: Vegan)', 'type': 'text', 'required': True}
    ])

@admin_bp.route('/definitions/dietary_options/<int:id>/delete', methods=['POST'])
def dietary_option_delete(id):
    from app.models import DietaryOption
    item = DietaryOption.query.get_or_404(id)
    db.session.delete(item)
    db.session.commit()
    flash('Kayıt silindi.', 'warning')
    return redirect(url_for('admin.dietary_option_list'))


# --- Cancellation Policy Management ---

@admin_bp.route('/definitions/cancellation_policies')
def cancellation_policy_list():
    from app.models import CancellationPolicy
    items = CancellationPolicy.query.order_by(CancellationPolicy.name).all()
    return render_template('admin/def_list_simple.html', items=items, title='İptal Politikaları', type='cancellation_policies', fields=['name', 'description'])

@admin_bp.route('/definitions/cancellation_policies/new', methods=['GET', 'POST'])
@admin_bp.route('/definitions/cancellation_policies/<int:id>/edit', methods=['GET', 'POST'])
def cancellation_policy_edit(id=None):
    from app.models import CancellationPolicy
    item = CancellationPolicy.query.get(id) if id else None
    if request.method == 'POST':
        if not item:
            item = CancellationPolicy()
            db.session.add(item)
        item.name = request.form.get('name')
        item.description = request.form.get('description')
        db.session.commit()
        flash('Politika kaydedildi.', 'success')
        return redirect(url_for('admin.cancellation_policy_list'))
    return render_template('admin/def_form_simple.html', item=item, title='İptal Politikası', type='cancellation_policies', fields=[
        {'name': 'name', 'label': 'Politika Adı', 'type': 'text', 'required': True},
        {'name': 'description', 'label': 'Açıklama', 'type': 'textarea'}
    ])

@admin_bp.route('/definitions/cancellation_policies/<int:id>/delete', methods=['POST'])
def cancellation_policy_delete(id):
    from app.models import CancellationPolicy
    item = CancellationPolicy.query.get_or_404(id)
    db.session.delete(item)
    db.session.commit()
    flash('Kayıt silindi.', 'warning')
    return redirect(url_for('admin.cancellation_policy_list'))

# --- Category Management ---

@admin_bp.route('/categories')
def category_list():
    categories = Category.query.order_by(Category.display_order).all()
    return render_template('admin/category_list.html', categories=categories)


@admin_bp.route('/categories/new', methods=['GET', 'POST'])
def category_new():
    if request.method == 'POST':
        new_cat = Category(
            name=request.form.get('name'),
            display_order=request.form.get('display_order', type=int) or 0,
            icon=request.form.get('icon'),
            description=request.form.get('description')
        )
        db.session.add(new_cat)
        db.session.commit()
        flash('Kategori eklendi.', 'success')
        return redirect(url_for('admin.category_list'))
    return render_template('admin/category_form.html', category=None)


@admin_bp.route('/categories/<int:cat_id>/edit', methods=['GET', 'POST'])
def category_edit(cat_id):
    category = Category.query.get_or_404(cat_id)
    if request.method == 'POST':
        category.name = request.form.get('name')
        category.display_order = request.form.get('display_order', type=int) or 0
        category.icon = request.form.get('icon')
        category.description = request.form.get('description')
        db.session.commit()
        flash('Kategori güncellendi.', 'success')
        return redirect(url_for('admin.category_list'))
    return render_template('admin/category_form.html', category=category)


@admin_bp.route('/categories/<int:cat_id>/delete', methods=['POST'])
def category_delete(cat_id):
    category = Category.query.get_or_404(cat_id)
    if category.subcategories:
        flash('Hata: Bu kategoriye bağlı alt kategoriler var. Lütfen önce onları silin.', 'danger')
    else:
        db.session.delete(category)
        db.session.commit()
        flash('Kategori başarıyla silindi.', 'success')
    return redirect(url_for('admin.category_list'))


# --- Subcategory Management ---

@admin_bp.route('/subcategories')
def subcategory_list():
    subcategories = Subcategory.query.join(Category).order_by(Category.display_order, Subcategory.display_order).all()
    return render_template('admin/subcategory_list.html', subcategories=subcategories)


@admin_bp.route('/subcategories/new', methods=['GET', 'POST'])
def subcategory_new():
    if request.method == 'POST':
        new_sub = Subcategory(
            category_id=request.form.get('category_id', type=int),
            name=request.form.get('name'),
            display_order=request.form.get('display_order', type=int) or 0,
            icon=request.form.get('icon'),
            description=request.form.get('description')
        )
        db.session.add(new_sub)
        db.session.commit()
        flash('Alt kategori eklendi.', 'success')
        return redirect(url_for('admin.subcategory_list'))
    categories = Category.query.order_by(Category.display_order).all()
    return render_template('admin/subcategory_form.html', subcategory=None, categories=categories)


@admin_bp.route('/subcategories/<int:sub_id>/edit', methods=['GET', 'POST'])
def subcategory_edit(sub_id):
    subcategory = Subcategory.query.get_or_404(sub_id)
    if request.method == 'POST':
        subcategory.category_id = request.form.get('category_id', type=int)
        subcategory.name = request.form.get('name')
        subcategory.display_order = request.form.get('display_order', type=int) or 0
        subcategory.icon = request.form.get('icon')
        subcategory.description = request.form.get('description')
        db.session.commit()
        flash('Alt kategori güncellendi.', 'success')
        return redirect(url_for('admin.subcategory_list'))
    categories = Category.query.order_by(Category.display_order).all()
    return render_template('admin/subcategory_form.html', subcategory=subcategory, categories=categories)


@admin_bp.route('/subcategories/<int:sub_id>/delete', methods=['POST'])
def subcategory_delete(sub_id):
    subcategory = Subcategory.query.get_or_404(sub_id)
    if subcategory.questions:
        flash('Hata: Bu alt kategoriye bağlı sorular bulunuyor. Lütfen önce onları silin.', 'danger')
    else:
        db.session.delete(subcategory)
        db.session.commit()
        flash('Alt kategori başarıyla silindi.', 'success')
    return redirect(url_for('admin.subcategory_list'))


# --- Question Management ---

@admin_bp.route('/questions')
def question_list():
    questions = Question.query.join(Subcategory).join(Category).order_by(
        Category.display_order, Subcategory.display_order, Question.display_order
    ).all()
    return render_template('admin/question_list.html', questions=questions)


@admin_bp.route('/questions/new', methods=['GET', 'POST'])
def question_new():
    if request.method == 'POST':
        new_q = Question(
            subcategory_id=request.form.get('subcategory_id', type=int),
            answer_type_id=request.form.get('answer_type_id', type=int),
            question_text=request.form.get('question_text'),
            question_text_en=request.form.get('question_text_en'),
            help_text=request.form.get('help_text'),
            display_order=request.form.get('display_order', type=int) or 0,
            is_critical=request.form.get('is_critical') == 'on',
            is_comparable=request.form.get('is_comparable') == 'on',
            unit=request.form.get('unit'),
            min_value=float(request.form.get('min_value')) if request.form.get('min_value') else None,
            max_value=float(request.form.get('max_value')) if request.form.get('max_value') else None,
            comparison_mode=request.form.get('comparison_mode', 'neutral')
        )
        db.session.add(new_q)
        db.session.commit()
        flash('Soru eklendi.', 'success')
        return redirect(url_for('admin.question_list'))
        
    subcategories = Subcategory.query.join(Category).order_by(Category.display_order, Subcategory.display_order).all()
    answer_types = AnswerType.query.order_by(AnswerType.id).all()
    return render_template('admin/question_form.html', question=None, subcategories=subcategories, answer_types=answer_types)


@admin_bp.route('/questions/<int:q_id>/edit', methods=['GET', 'POST'])
def question_edit(q_id):
    question = Question.query.get_or_404(q_id)
    if request.method == 'POST':
        question.subcategory_id = request.form.get('subcategory_id', type=int)
        question.answer_type_id = request.form.get('answer_type_id', type=int)
        question.question_text = request.form.get('question_text')
        question.question_text_en = request.form.get('question_text_en')
        question.help_text = request.form.get('help_text')
        question.display_order = request.form.get('display_order', type=int) or 0
        question.is_critical = request.form.get('is_critical') == 'on'
        question.is_comparable = request.form.get('is_comparable') == 'on'
        question.unit = request.form.get('unit')
        
        min_v = request.form.get('min_value')
        question.min_value = float(min_v) if min_v else None
        
        max_v = request.form.get('max_value')
        question.max_value = float(max_v) if max_v else None
        
        question.comparison_mode = request.form.get('comparison_mode', 'neutral')
        
        db.session.commit()
        flash('Soru güncellendi.', 'success')
        return redirect(url_for('admin.question_list'))
        
    subcategories = Subcategory.query.join(Category).order_by(Category.display_order, Subcategory.display_order).all()
    answer_types = AnswerType.query.order_by(AnswerType.id).all()
    return render_template('admin/question_form.html', question=question, subcategories=subcategories, answer_types=answer_types)


@admin_bp.route('/questions/<int:q_id>/delete', methods=['POST'])
def question_delete(q_id):
    question = Question.query.get_or_404(q_id)
    from app.models import SchoolAnswer
    answers_exist = SchoolAnswer.query.filter_by(question_id=q_id).first()
    if answers_exist or question.options:
        flash('Hata: Bu soruya verilmiş okul cevapları veya soru seçenekleri bulunuyor. Lütfen önce onları silin.', 'danger')
    else:
        db.session.delete(question)
        db.session.commit()
        flash('Soru başarıyla silindi.', 'success')
    return redirect(url_for('admin.question_list'))


# --- London Area Management ---

@admin_bp.route('/areas')
def area_list():
    from app.models import LondonArea
    areas = LondonArea.query.order_by(LondonArea.name).all()
    return render_template('admin/area_list.html', areas=areas)

@admin_bp.route('/areas/new', methods=['GET', 'POST'])
def area_new():
    from app.models import LondonArea
    if request.method == 'POST':
        new_area = LondonArea(
            name=request.form.get('name'),
            zone=request.form.get('zone'),
            safety_rating=request.form.get('safety_rating', type=int) or None,
            description=request.form.get('description')
        )
        db.session.add(new_area)
        db.session.commit()
        flash('Bölge başarıyla eklendi.', 'success')
        return redirect(url_for('admin.area_list'))
    return render_template('admin/area_form.html', area=None)

@admin_bp.route('/areas/<int:area_id>/edit', methods=['GET', 'POST'])
def area_edit(area_id):
    from app.models import LondonArea
    area = LondonArea.query.get_or_404(area_id)
    if request.method == 'POST':
        area.name = request.form.get('name')
        area.zone = request.form.get('zone')
        area.safety_rating = request.form.get('safety_rating', type=int) or None
        area.description = request.form.get('description')
        db.session.commit()
        flash('Bölge güncellendi.', 'success')
        return redirect(url_for('admin.area_list'))
    return render_template('admin/area_form.html', area=area)

@admin_bp.route('/areas/<int:area_id>/delete', methods=['POST'])
def area_delete(area_id):
    from app.models import LondonArea, School
    area = LondonArea.query.get_or_404(area_id)
    schools_exist = School.query.filter_by(area_id=area_id).first()
    if schools_exist:
        flash('Hata: Bu bölgeye bağlı okullar mevcut. Lütfen önce okulları silin veya bölgeyi değiştirin.', 'danger')
    else:
        db.session.delete(area)
        db.session.commit()
        flash('Bölge başarıyla silindi.', 'success')
    return redirect(url_for('admin.area_list'))


# --- Answer Type Management ---

@admin_bp.route('/answer_types')
def answer_type_list():
    from app.models import AnswerType
    answer_types = AnswerType.query.order_by(AnswerType.id).all()
    return render_template('admin/answer_type_list.html', answer_types=answer_types)


# --- Question Option Management ---

@admin_bp.route('/questions/<int:q_id>/options')
def option_list(q_id):
    from app.models import Question, QuestionOption
    question = Question.query.get_or_404(q_id)
    options = QuestionOption.query.filter_by(question_id=q_id).order_by(QuestionOption.display_order).all()
    return render_template('admin/option_list.html', question=question, options=options)


@admin_bp.route('/questions/<int:q_id>/options/new', methods=['GET', 'POST'])
def option_new(q_id):
    from app.models import Question, QuestionOption
    question = Question.query.get_or_404(q_id)
    if request.method == 'POST':
        new_opt = QuestionOption(
            question_id=q_id,
            option_text=request.form.get('option_text'),
            option_value=request.form.get('option_value'),
            display_order=request.form.get('display_order', type=int) or 0,
            score=request.form.get('score', type=int) or None
        )
        db.session.add(new_opt)
        db.session.commit()
        flash('Seçenek eklendi.', 'success')
        return redirect(url_for('admin.option_list', q_id=q_id))
    return render_template('admin/option_form.html', question=question, option=None)


@admin_bp.route('/options/<int:opt_id>/edit', methods=['GET', 'POST'])
def option_edit(opt_id):
    from app.models import QuestionOption
    option = QuestionOption.query.get_or_404(opt_id)
    if request.method == 'POST':
        option.option_text = request.form.get('option_text')
        option.option_value = request.form.get('option_value')
        option.display_order = request.form.get('display_order', type=int) or 0
        option.score = request.form.get('score', type=int) or None
        db.session.commit()
        flash('Seçenek güncellendi.', 'success')
        return redirect(url_for('admin.option_list', q_id=option.question_id))
    return render_template('admin/option_form.html', question=option.question, option=option)


@admin_bp.route('/options/<int:opt_id>/delete', methods=['POST'])
def option_delete(opt_id):
    from app.models import QuestionOption
    option = QuestionOption.query.get_or_404(opt_id)
    q_id = option.question_id
    db.session.delete(option)
    db.session.commit()
    flash('Seçenek silindi.', 'success')
    return redirect(url_for('admin.option_list', q_id=q_id))
