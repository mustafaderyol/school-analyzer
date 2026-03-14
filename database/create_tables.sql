-- =====================================================
-- Dil Okulu Karşılaştırma - CREATE TABLES
-- PostgreSQL 14+
-- =====================================================

-- =====================================================
-- 1. LOOKUP / ENUM TABLOLARI
-- =====================================================

CREATE TABLE answer_types (
    id              SERIAL PRIMARY KEY,
    code            VARCHAR(20) UNIQUE NOT NULL,
    label_tr        VARCHAR(50) NOT NULL,
    description_tr  VARCHAR(200)
);

CREATE TABLE accreditation_bodies (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) UNIQUE NOT NULL,
    country     VARCHAR(50),
    website     VARCHAR(200)
);

CREATE TABLE teacher_certifications (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(50) UNIQUE NOT NULL,
    full_name   VARCHAR(200),
    level       VARCHAR(20)  -- entry, advanced, master
);

CREATE TABLE teaching_methodologies (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) UNIQUE NOT NULL,
    description VARCHAR(500)
);

CREATE TABLE course_types (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) UNIQUE NOT NULL,
    description VARCHAR(300)
);

CREATE TABLE accommodation_types (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) UNIQUE NOT NULL,
    description VARCHAR(300)
);

CREATE TABLE london_areas (
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(100) UNIQUE NOT NULL,
    zone            VARCHAR(10),
    safety_rating   SMALLINT,  -- 1-5
    description     VARCHAR(300)
);

CREATE TABLE metro_lines (
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(50) UNIQUE NOT NULL,
    color   VARCHAR(20)
);

CREATE TABLE meal_plans (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(50) UNIQUE NOT NULL,
    description VARCHAR(200)
);

CREATE TABLE facility_types (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) UNIQUE NOT NULL,
    icon        VARCHAR(50),
    description VARCHAR(200)
);

CREATE TABLE support_service_types (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) UNIQUE NOT NULL,
    description VARCHAR(300)
);

CREATE TABLE activity_types (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) UNIQUE NOT NULL,
    is_free     BOOLEAN DEFAULT NULL,
    description VARCHAR(300)
);

CREATE TABLE dietary_options (
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE cancellation_policies (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) UNIQUE NOT NULL,
    description VARCHAR(300)
);

-- =====================================================
-- 2. ANA TABLOLAR
-- =====================================================

CREATE TABLE schools (
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(200) NOT NULL,
    website         VARCHAR(300),
    email           VARCHAR(200),
    phone           VARCHAR(50),
    city            VARCHAR(100) DEFAULT 'London',
    country         VARCHAR(100) DEFAULT 'United Kingdom',
    address         TEXT,
    area_id         INTEGER REFERENCES london_areas(id) ON DELETE SET NULL,
    year_founded    INTEGER,
    is_chain        BOOLEAN DEFAULT FALSE,
    chain_name      VARCHAR(200),
    chain_branch_count INTEGER,
    google_rating   NUMERIC(2,1),
    trustpilot_rating NUMERIC(2,1),
    notes           TEXT,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_schools_name ON schools(name);
CREATE INDEX idx_schools_area ON schools(area_id);

-- =====================================================
-- 3. KATEGORİ VE SORU TABLOLARI
-- =====================================================

CREATE TABLE categories (
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(200) NOT NULL,
    display_order   INTEGER NOT NULL DEFAULT 0,
    icon            VARCHAR(50),
    description     VARCHAR(500)
);

CREATE TABLE subcategories (
    id              SERIAL PRIMARY KEY,
    category_id     INTEGER NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
    name            VARCHAR(200) NOT NULL,
    display_order   INTEGER NOT NULL DEFAULT 0,
    icon            VARCHAR(50),
    description     VARCHAR(500)
);

CREATE INDEX idx_subcategories_category ON subcategories(category_id);

CREATE TABLE questions (
    id                  SERIAL PRIMARY KEY,
    subcategory_id      INTEGER NOT NULL REFERENCES subcategories(id) ON DELETE CASCADE,
    answer_type_id      INTEGER NOT NULL REFERENCES answer_types(id),
    question_text       TEXT NOT NULL,
    question_text_en    TEXT,
    help_text           TEXT,
    display_order       INTEGER NOT NULL DEFAULT 0,
    is_critical         BOOLEAN DEFAULT FALSE,
    is_comparable       BOOLEAN DEFAULT TRUE,
    unit                VARCHAR(30),       -- £, saat, dakika, %, kişi, vb.
    min_value           NUMERIC,
    max_value           NUMERIC,
    comparison_mode     VARCHAR(20) DEFAULT 'neutral',  -- higher_better, lower_better, neutral
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_questions_subcategory ON questions(subcategory_id);
CREATE INDEX idx_questions_answer_type ON questions(answer_type_id);
CREATE INDEX idx_questions_critical ON questions(is_critical);

CREATE TABLE question_options (
    id              SERIAL PRIMARY KEY,
    question_id     INTEGER NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    option_text     VARCHAR(300) NOT NULL,
    option_value    VARCHAR(100),
    display_order   INTEGER NOT NULL DEFAULT 0,
    score           INTEGER  -- opsiyonel puanlama
);

CREATE INDEX idx_qoptions_question ON question_options(question_id);

-- =====================================================
-- 4. CEVAP TABLOLARI
-- =====================================================

CREATE TABLE school_answers (
    id              SERIAL PRIMARY KEY,
    school_id       INTEGER NOT NULL REFERENCES schools(id) ON DELETE CASCADE,
    question_id     INTEGER NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    answer_text     TEXT,
    answer_number   NUMERIC,
    answer_boolean  BOOLEAN,
    notes           TEXT,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(school_id, question_id)
);

CREATE INDEX idx_answers_school ON school_answers(school_id);
CREATE INDEX idx_answers_question ON school_answers(question_id);

CREATE TABLE school_answer_options (
    id              SERIAL PRIMARY KEY,
    answer_id       INTEGER NOT NULL REFERENCES school_answers(id) ON DELETE CASCADE,
    option_id       INTEGER NOT NULL REFERENCES question_options(id) ON DELETE CASCADE,
    UNIQUE(answer_id, option_id)
);

-- =====================================================
-- 5. MANY-TO-MANY İLİŞKİ TABLOLARI
-- =====================================================

CREATE TABLE school_accreditations (
    id                      SERIAL PRIMARY KEY,
    school_id               INTEGER NOT NULL REFERENCES schools(id) ON DELETE CASCADE,
    accreditation_body_id   INTEGER NOT NULL REFERENCES accreditation_bodies(id) ON DELETE CASCADE,
    accredited_since        DATE,
    last_inspection_date    DATE,
    last_inspection_result  VARCHAR(100),
    notes                   TEXT,
    UNIQUE(school_id, accreditation_body_id)
);

CREATE TABLE school_course_types (
    id              SERIAL PRIMARY KEY,
    school_id       INTEGER NOT NULL REFERENCES schools(id) ON DELETE CASCADE,
    course_type_id  INTEGER NOT NULL REFERENCES course_types(id) ON DELETE CASCADE,
    weekly_hours    NUMERIC(4,1),
    price_per_week  NUMERIC(10,2),
    notes           TEXT,
    UNIQUE(school_id, course_type_id)
);

CREATE TABLE school_accommodation_types (
    id                      SERIAL PRIMARY KEY,
    school_id               INTEGER NOT NULL REFERENCES schools(id) ON DELETE CASCADE,
    accommodation_type_id   INTEGER NOT NULL REFERENCES accommodation_types(id) ON DELETE CASCADE,
    price_per_week          NUMERIC(10,2),
    distance_to_school_min  INTEGER,  -- dakika
    notes                   TEXT,
    UNIQUE(school_id, accommodation_type_id)
);

CREATE TABLE school_facilities (
    id                  SERIAL PRIMARY KEY,
    school_id           INTEGER NOT NULL REFERENCES schools(id) ON DELETE CASCADE,
    facility_type_id    INTEGER NOT NULL REFERENCES facility_types(id) ON DELETE CASCADE,
    is_available        BOOLEAN DEFAULT TRUE,
    notes               TEXT,
    UNIQUE(school_id, facility_type_id)
);

CREATE TABLE school_support_services (
    id                      SERIAL PRIMARY KEY,
    school_id               INTEGER NOT NULL REFERENCES schools(id) ON DELETE CASCADE,
    support_service_type_id INTEGER NOT NULL REFERENCES support_service_types(id) ON DELETE CASCADE,
    is_free                 BOOLEAN,
    price                   NUMERIC(10,2),
    notes                   TEXT,
    UNIQUE(school_id, support_service_type_id)
);

CREATE TABLE school_activities (
    id                  SERIAL PRIMARY KEY,
    school_id           INTEGER NOT NULL REFERENCES schools(id) ON DELETE CASCADE,
    activity_type_id    INTEGER NOT NULL REFERENCES activity_types(id) ON DELETE CASCADE,
    frequency           VARCHAR(50),  -- weekly, monthly, daily
    is_free             BOOLEAN,
    price               NUMERIC(10,2),
    notes               TEXT,
    UNIQUE(school_id, activity_type_id)
);

CREATE TABLE school_dietary_options (
    id                  SERIAL PRIMARY KEY,
    school_id           INTEGER NOT NULL REFERENCES schools(id) ON DELETE CASCADE,
    dietary_option_id   INTEGER NOT NULL REFERENCES dietary_options(id) ON DELETE CASCADE,
    is_available        BOOLEAN DEFAULT TRUE,
    notes               TEXT,
    UNIQUE(school_id, dietary_option_id)
);
