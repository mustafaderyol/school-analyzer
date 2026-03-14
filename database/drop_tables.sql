-- =====================================================
-- DROP TABLES - Bağımlılık sırasına göre silme
-- =====================================================

-- Many-to-Many ilişki tabloları
DROP TABLE IF EXISTS school_answer_options CASCADE;
DROP TABLE IF EXISTS school_answers CASCADE;
DROP TABLE IF EXISTS school_accreditations CASCADE;
DROP TABLE IF EXISTS school_course_types CASCADE;
DROP TABLE IF EXISTS school_accommodation_types CASCADE;
DROP TABLE IF EXISTS school_facilities CASCADE;
DROP TABLE IF EXISTS school_support_services CASCADE;
DROP TABLE IF EXISTS school_activities CASCADE;
DROP TABLE IF EXISTS school_dietary_options CASCADE;

-- Soru tabloları
DROP TABLE IF EXISTS question_options CASCADE;
DROP TABLE IF EXISTS questions CASCADE;
DROP TABLE IF EXISTS subcategories CASCADE;
DROP TABLE IF EXISTS categories CASCADE;

-- Lookup tabloları
DROP TABLE IF EXISTS answer_types CASCADE;
DROP TABLE IF EXISTS accreditation_bodies CASCADE;
DROP TABLE IF EXISTS teacher_certifications CASCADE;
DROP TABLE IF EXISTS teaching_methodologies CASCADE;
DROP TABLE IF EXISTS course_types CASCADE;
DROP TABLE IF EXISTS accommodation_types CASCADE;
DROP TABLE IF EXISTS london_areas CASCADE;
DROP TABLE IF EXISTS metro_lines CASCADE;
DROP TABLE IF EXISTS meal_plans CASCADE;
DROP TABLE IF EXISTS facility_types CASCADE;
DROP TABLE IF EXISTS support_service_types CASCADE;
DROP TABLE IF EXISTS activity_types CASCADE;
DROP TABLE IF EXISTS dietary_options CASCADE;
DROP TABLE IF EXISTS cancellation_policies CASCADE;

-- Ana tablo
DROP TABLE IF EXISTS schools CASCADE;
