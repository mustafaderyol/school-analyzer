# 1. PostgreSQL veritabanı oluştur
createdb school_analyzer_db

# 2. Tabloları oluştur
psql -d school_analyzer_db -f database/create_tables.sql

# 3. Lookup verileri ve soruları yükle
psql -d school_analyzer_db -f database/insert_lookups.sql
psql -d school_analyzer_db -f database/insert_questions_part1.sql
psql -d school_analyzer_db -f database/insert_questions_part2.sql
psql -d school_analyzer_db -f database/insert_questions_part3.sql
psql -d school_analyzer_db -f database/insert_questions_part4.sql
psql -d school_analyzer_db -f database/insert_questions_part5.sql




# 1. Virtual environment (opsiyonel)
python3 -m venv venv && source venv/bin/activate

# 2. Bağımlılıkları yükle
pip install -r requirements.txt

# 3. DB bağlantısını ayarla (gerekirse)
export DATABASE_URL="postgresql+psycopg://admin:admin@localhost:5556/school_analyzer_db"

# 4. Çalıştır
python run.py
# → http://localhost:5000
