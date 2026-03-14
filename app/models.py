from app import db
from datetime import datetime


class AnswerType(db.Model):
    __tablename__ = 'answer_types'
    id = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.String(20), unique=True, nullable=False)
    label_tr = db.Column(db.String(50), nullable=False)
    description_tr = db.Column(db.String(200))


class Category(db.Model):
    __tablename__ = 'categories'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(200), nullable=False)
    display_order = db.Column(db.Integer, default=0)
    icon = db.Column(db.String(50))
    description = db.Column(db.String(500))
    subcategories = db.relationship('Subcategory', backref='category', order_by='Subcategory.display_order', lazy=True)


class Subcategory(db.Model):
    __tablename__ = 'subcategories'
    id = db.Column(db.Integer, primary_key=True)
    category_id = db.Column(db.Integer, db.ForeignKey('categories.id'), nullable=False)
    name = db.Column(db.String(200), nullable=False)
    display_order = db.Column(db.Integer, default=0)
    icon = db.Column(db.String(50))
    description = db.Column(db.String(500))
    questions = db.relationship('Question', backref='subcategory', order_by='Question.display_order', lazy=True)


class Question(db.Model):
    __tablename__ = 'questions'
    id = db.Column(db.Integer, primary_key=True)
    subcategory_id = db.Column(db.Integer, db.ForeignKey('subcategories.id'), nullable=False)
    answer_type_id = db.Column(db.Integer, db.ForeignKey('answer_types.id'), nullable=False)
    question_text = db.Column(db.Text, nullable=False)
    question_text_en = db.Column(db.Text)
    help_text = db.Column(db.Text)
    display_order = db.Column(db.Integer, default=0)
    is_critical = db.Column(db.Boolean, default=False)
    is_comparable = db.Column(db.Boolean, default=True)
    unit = db.Column(db.String(30))
    min_value = db.Column(db.Numeric)
    max_value = db.Column(db.Numeric)
    comparison_mode = db.Column(db.String(20), default='neutral')
    answer_type = db.relationship('AnswerType', lazy=True)
    options = db.relationship('QuestionOption', backref='question', order_by='QuestionOption.display_order', lazy=True)


class QuestionOption(db.Model):
    __tablename__ = 'question_options'
    id = db.Column(db.Integer, primary_key=True)
    question_id = db.Column(db.Integer, db.ForeignKey('questions.id'), nullable=False)
    option_text = db.Column(db.String(300), nullable=False)
    option_value = db.Column(db.String(100))
    display_order = db.Column(db.Integer, default=0)
    score = db.Column(db.Integer)


class LondonArea(db.Model):
    __tablename__ = 'london_areas'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True, nullable=False)
    zone = db.Column(db.String(10))
    safety_rating = db.Column(db.SmallInteger)
    description = db.Column(db.String(300))


class AccreditationBody(db.Model):
    __tablename__ = 'accreditation_bodies'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True, nullable=False)
    country = db.Column(db.String(50))
    website = db.Column(db.String(200))


class TeacherCertification(db.Model):
    __tablename__ = 'teacher_certifications'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), unique=True, nullable=False)
    full_name = db.Column(db.String(200))
    level = db.Column(db.String(20))


class TeachingMethodology(db.Model):
    __tablename__ = 'teaching_methodologies'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True, nullable=False)
    description = db.Column(db.String(500))


class CourseType(db.Model):
    __tablename__ = 'course_types'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True, nullable=False)
    description = db.Column(db.String(300))


class AccommodationType(db.Model):
    __tablename__ = 'accommodation_types'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True, nullable=False)
    description = db.Column(db.String(300))


class MetroLine(db.Model):
    __tablename__ = 'metro_lines'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), unique=True, nullable=False)
    color = db.Column(db.String(20))


class MealPlan(db.Model):
    __tablename__ = 'meal_plans'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), unique=True, nullable=False)
    description = db.Column(db.String(200))


class FacilityType(db.Model):
    __tablename__ = 'facility_types'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True, nullable=False)
    icon = db.Column(db.String(50))
    description = db.Column(db.String(200))


class SupportServiceType(db.Model):
    __tablename__ = 'support_service_types'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True, nullable=False)
    description = db.Column(db.String(300))


class ActivityType(db.Model):
    __tablename__ = 'activity_types'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True, nullable=False)
    is_free = db.Column(db.Boolean)
    description = db.Column(db.String(300))


class DietaryOption(db.Model):
    __tablename__ = 'dietary_options'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), unique=True, nullable=False)


class CancellationPolicy(db.Model):
    __tablename__ = 'cancellation_policies'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True, nullable=False)
    description = db.Column(db.String(300))


class School(db.Model):
    __tablename__ = 'schools'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(200), nullable=False)
    website = db.Column(db.String(300))
    email = db.Column(db.String(200))
    phone = db.Column(db.String(50))
    city = db.Column(db.String(100), default='London')
    country = db.Column(db.String(100), default='United Kingdom')
    address = db.Column(db.Text)
    area_id = db.Column(db.Integer, db.ForeignKey('london_areas.id'))
    year_founded = db.Column(db.Integer)
    is_chain = db.Column(db.Boolean, default=False)
    chain_name = db.Column(db.String(200))
    chain_branch_count = db.Column(db.Integer)
    google_rating = db.Column(db.Numeric(2, 1))
    trustpilot_rating = db.Column(db.Numeric(2, 1))
    notes = db.Column(db.Text)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
    area = db.relationship('LondonArea', lazy=True)
    answers = db.relationship('SchoolAnswer', backref='school', cascade='all, delete-orphan', lazy=True)
    
    # Relationships for M2M mappings
    accreditations = db.relationship('SchoolAccreditation', backref='school', cascade='all, delete-orphan', lazy=True)
    courses = db.relationship('SchoolCourseType', backref='school', cascade='all, delete-orphan', lazy=True)
    accommodations = db.relationship('SchoolAccommodationType', backref='school', cascade='all, delete-orphan', lazy=True)
    facilities = db.relationship('SchoolFacility', backref='school', cascade='all, delete-orphan', lazy=True)
    services = db.relationship('SchoolSupportService', backref='school', cascade='all, delete-orphan', lazy=True)
    activities = db.relationship('SchoolActivity', backref='school', cascade='all, delete-orphan', lazy=True)
    dietary_options = db.relationship('SchoolDietaryOption', backref='school', cascade='all, delete-orphan', lazy=True)

    @property
    def answer_count(self):
        return len(self.answers)

    @property
    def total_questions(self):
        return Question.query.count()

    @property
    def completion_percentage(self):
        total = self.total_questions
        if total == 0:
            return 0
        return round((self.answer_count / total) * 100)

    @property
    def facilities_list(self):
        return [f.facility_type for f in self.facilities]

    @property
    def activities_list(self):
        return [a.activity_type for a in self.activities]

    @property
    def dietary_options_list(self):
        return [d.dietary_option for d in self.dietary_options]


class SchoolAnswer(db.Model):
    __tablename__ = 'school_answers'
    id = db.Column(db.Integer, primary_key=True)
    school_id = db.Column(db.Integer, db.ForeignKey('schools.id'), nullable=False)
    question_id = db.Column(db.Integer, db.ForeignKey('questions.id'), nullable=False)
    answer_text = db.Column(db.Text)
    answer_number = db.Column(db.Numeric)
    answer_boolean = db.Column(db.Boolean)
    notes = db.Column(db.Text)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
    question = db.relationship('Question', lazy=True)
    selected_options = db.relationship('SchoolAnswerOption', backref='answer', lazy=True)

    @property
    def display_value(self):
        q_type = self.question.answer_type.code
        if q_type == 'boolean':
            if self.answer_boolean is True:
                return 'Evet ✅'
            elif self.answer_boolean is False:
                return 'Hayır ❌'
            return '-'
        elif q_type == 'number':
            if self.answer_number is not None:
                unit = self.question.unit or ''
                return f"{self.answer_number} {unit}".strip()
            return '-'
        elif q_type == 'rating':
            if self.answer_number is not None:
                stars = '★' * int(self.answer_number) + '☆' * (5 - int(self.answer_number))
                return stars
            return '-'
        elif q_type in ('single_choice', 'multi_choice'):
            if self.selected_options:
                return ', '.join([so.option.option_text for so in self.selected_options])
            return self.answer_text or '-'
        else:
            return self.answer_text or '-'


class SchoolAnswerOption(db.Model):
    __tablename__ = 'school_answer_options'
    id = db.Column(db.Integer, primary_key=True)
    answer_id = db.Column(db.Integer, db.ForeignKey('school_answers.id'), nullable=False)
    option_id = db.Column(db.Integer, db.ForeignKey('question_options.id'), nullable=False)
    option = db.relationship('QuestionOption', lazy=True)


# --- Many-to-Many Bridge Models ---

class SchoolAccreditation(db.Model):
    __tablename__ = 'school_accreditations'
    id = db.Column(db.Integer, primary_key=True)
    school_id = db.Column(db.Integer, db.ForeignKey('schools.id'), nullable=False)
    accreditation_body_id = db.Column(db.Integer, db.ForeignKey('accreditation_bodies.id'), nullable=False)
    accredited_since = db.Column(db.Date)
    last_inspection_date = db.Column(db.Date)
    last_inspection_result = db.Column(db.String(100))
    notes = db.Column(db.Text)
    body = db.relationship('AccreditationBody', lazy=True)


class SchoolCourseType(db.Model):
    __tablename__ = 'school_course_types'
    id = db.Column(db.Integer, primary_key=True)
    school_id = db.Column(db.Integer, db.ForeignKey('schools.id'), nullable=False)
    course_type_id = db.Column(db.Integer, db.ForeignKey('course_types.id'), nullable=False)
    weekly_hours = db.Column(db.Numeric(4, 1))
    price_per_week = db.Column(db.Numeric(10, 2))
    notes = db.Column(db.Text)
    course_type = db.relationship('CourseType', lazy=True)


class SchoolAccommodationType(db.Model):
    __tablename__ = 'school_accommodation_types'
    id = db.Column(db.Integer, primary_key=True)
    school_id = db.Column(db.Integer, db.ForeignKey('schools.id'), nullable=False)
    accommodation_type_id = db.Column(db.Integer, db.ForeignKey('accommodation_types.id'), nullable=False)
    price_per_week = db.Column(db.Numeric(10, 2))
    distance_to_school_min = db.Column(db.Integer)
    notes = db.Column(db.Text)
    accommodation_type = db.relationship('AccommodationType', lazy=True)


class SchoolFacility(db.Model):
    __tablename__ = 'school_facilities'
    id = db.Column(db.Integer, primary_key=True)
    school_id = db.Column(db.Integer, db.ForeignKey('schools.id'), nullable=False)
    facility_type_id = db.Column(db.Integer, db.ForeignKey('facility_types.id'), nullable=False)
    is_available = db.Column(db.Boolean, default=True)
    notes = db.Column(db.Text)
    facility_type = db.relationship('FacilityType', lazy=True)


class SchoolSupportService(db.Model):
    __tablename__ = 'school_support_services'
    id = db.Column(db.Integer, primary_key=True)
    school_id = db.Column(db.Integer, db.ForeignKey('schools.id'), nullable=False)
    support_service_type_id = db.Column(db.Integer, db.ForeignKey('support_service_types.id'), nullable=False)
    is_free = db.Column(db.Boolean)
    price = db.Column(db.Numeric(10, 2))
    notes = db.Column(db.Text)
    service_type = db.relationship('SupportServiceType', lazy=True)


class SchoolActivity(db.Model):
    __tablename__ = 'school_activities'
    id = db.Column(db.Integer, primary_key=True)
    school_id = db.Column(db.Integer, db.ForeignKey('schools.id'), nullable=False)
    activity_type_id = db.Column(db.Integer, db.ForeignKey('activity_types.id'), nullable=False)
    frequency = db.Column(db.String(50))
    is_free = db.Column(db.Boolean)
    price = db.Column(db.Numeric(10, 2))
    notes = db.Column(db.Text)
    activity_type = db.relationship('ActivityType', lazy=True)


class SchoolDietaryOption(db.Model):
    __tablename__ = 'school_dietary_options'
    id = db.Column(db.Integer, primary_key=True)
    school_id = db.Column(db.Integer, db.ForeignKey('schools.id'), nullable=False)
    dietary_option_id = db.Column(db.Integer, db.ForeignKey('dietary_options.id'), nullable=False)
    is_available = db.Column(db.Boolean, default=True)
    notes = db.Column(db.Text)
    dietary_option = db.relationship('DietaryOption', lazy=True)
