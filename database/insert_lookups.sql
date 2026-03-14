-- =====================================================
-- Dil Okulu Karşılaştırma - INSERT LOOKUPS & QUESTIONS
-- =====================================================

-- =====================================================
-- LOOKUP VERİLERİ
-- =====================================================

INSERT INTO answer_types (code, label_tr, description_tr) VALUES
('text', 'Metin', 'Serbest metin cevabı'),
('number', 'Sayı', 'Sayısal değer'),
('boolean', 'Evet/Hayır', 'Evet veya hayır cevabı'),
('single_choice', 'Tek Seçim', 'Tek bir seçenek seçilir'),
('multi_choice', 'Çoklu Seçim', 'Birden fazla seçenek seçilebilir'),
('rating', 'Puanlama', '1-5 arası puanlama');

INSERT INTO accreditation_bodies (name, country, website) VALUES
('British Council', 'UK', 'https://www.britishcouncil.org'),
('English UK', 'UK', 'https://www.englishuk.com'),
('Accreditation UK', 'UK', NULL),
('Quality English', 'International', 'https://www.quality-english.com'),
('IALC', 'International', 'https://www.ialc.org'),
('EAQUALS', 'International', 'https://www.eaquals.org'),
('Trinity College London', 'UK', 'https://www.trinitycollege.com'),
('Cambridge Assessment', 'UK', 'https://www.cambridgeenglish.org'),
('ISI (Independent Schools Inspectorate)', 'UK', NULL),
('Ofsted', 'UK', 'https://www.gov.uk/government/organisations/ofsted');

INSERT INTO teacher_certifications (name, full_name, level) VALUES
('CELTA', 'Certificate in Teaching English to Speakers of Other Languages', 'entry'),
('DELTA', 'Diploma in Teaching English to Speakers of Other Languages', 'advanced'),
('TESOL', 'Teaching English to Speakers of Other Languages', 'entry'),
('MA TESOL', 'Master of Arts in TESOL', 'master'),
('PGCE', 'Postgraduate Certificate in Education', 'advanced'),
('Trinity CertTESOL', 'Trinity Certificate in TESOL', 'entry'),
('Trinity DipTESOL', 'Trinity Diploma in TESOL', 'advanced'),
('PhD Applied Linguistics', 'Doctorate in Applied Linguistics', 'master'),
('CELT-P', 'Certificate in English Language Teaching - Primary', 'entry'),
('CELT-S', 'Certificate in English Language Teaching - Secondary', 'entry');

INSERT INTO teaching_methodologies (name, description) VALUES
('Communicative Language Teaching', 'İletişimsel dil öğretimi - gerçek yaşam iletişimine odaklanır'),
('Task-Based Learning', 'Görev tabanlı öğrenme - pratik görevlerle dil öğretimi'),
('Grammar-Translation', 'Gramer-çeviri metodu - dilbilgisi kuralları ve çeviri odaklı'),
('Blended Learning', 'Karma öğrenme - yüz yüze ve online eğitimin birleşimi'),
('Direct Method', 'Doğrudan yöntem - sadece hedef dilde eğitim'),
('Total Physical Response', 'Fiziksel tepki yöntemi - hareket ile öğrenme'),
('Lexical Approach', 'Sözcüksel yaklaşım - kelime grupları ve kalıplara odaklanır'),
('Content-Based Instruction', 'İçerik tabanlı öğretim - dil bir konu üzerinden öğretilir');

INSERT INTO course_types (name, description) VALUES
('General English', 'Genel İngilizce - tüm becerileri kapsar'),
('Intensive English', 'Yoğun İngilizce - haftada 25+ saat'),
('Academic English', 'Akademik İngilizce - üniversite hazırlık'),
('Business English', 'İş İngilizcesi - profesyonel iletişim'),
('IELTS Preparation', 'IELTS sınav hazırlık'),
('Cambridge Exam Preparation', 'Cambridge sınav hazırlık (FCE, CAE, CPE)'),
('TOEFL Preparation', 'TOEFL sınav hazırlık'),
('OET Preparation', 'OET sağlık sektörü İngilizce sınav hazırlık'),
('One-to-One', 'Birebir özel ders'),
('English for Specific Purposes', 'Sektöre özel İngilizce (Tıp, Hukuk, IT)'),
('Evening Course', 'Akşam kursu'),
('Online Course', 'Online kurs'),
('Exam Preparation General', 'Genel sınav hazırlık');

INSERT INTO accommodation_types (name, description) VALUES
('Homestay', 'Aile yanı konaklama'),
('Student Residence', 'Öğrenci yurdu'),
('Shared House', 'Paylaşımlı ev'),
('Studio Apartment', 'Stüdyo daire'),
('School Residence', 'Okul rezidansı'),
('Private Apartment', 'Özel daire'),
('Hotel/Hostel', 'Otel veya hostel');

INSERT INTO london_areas (name, zone, safety_rating) VALUES
('Camden', '1-2', 3),
('Greenwich', '2-3', 4),
('Hammersmith', '2', 4),
('Westminster', '1', 4),
('Kensington', '1-2', 5),
('Islington', '1-2', 3),
('Southwark', '1-2', 3),
('Tower Hamlets', '2', 3),
('Hackney', '2', 3),
('Lambeth', '1-2', 3),
('Bloomsbury', '1', 4),
('Covent Garden', '1', 4),
('Euston', '1', 3),
('Victoria', '1', 4),
('Oxford Circus', '1', 4),
('Notting Hill', '1-2', 4),
('Shoreditch', '1-2', 3),
('Canary Wharf', '2', 4),
('Wimbledon', '3', 5),
('Richmond', '3-4', 5);

INSERT INTO metro_lines (name, color) VALUES
('Central', 'Red'),
('Northern', 'Black'),
('Piccadilly', 'Dark Blue'),
('Victoria', 'Light Blue'),
('Jubilee', 'Silver'),
('Elizabeth', 'Purple'),
('Metropolitan', 'Magenta'),
('Bakerloo', 'Brown'),
('Circle', 'Yellow'),
('District', 'Green'),
('Hammersmith & City', 'Pink'),
('Waterloo & City', 'Turquoise'),
('DLR', 'Teal'),
('Overground', 'Orange'),
('Thameslink', 'Pink');

INSERT INTO meal_plans (name, description) VALUES
('Self-Catering', 'Yemeksiz - kendi yemeğinizi kendiniz hazırlarsınız'),
('Breakfast Only', 'Sadece kahvaltı dahil'),
('Half Board', 'Kahvaltı ve akşam yemeği dahil'),
('Full Board', 'Üç öğün dahil');

INSERT INTO facility_types (name, icon, description) VALUES
('Kütüphane', 'library', 'Kitap ve kaynak materyallere erişim'),
('Çalışma Odası', 'study', 'Sessiz çalışma alanı'),
('Bilgisayar Lab', 'computer', 'Bilgisayar erişimi'),
('Öğrenci Lounge', 'lounge', 'Sosyalleşme alanı'),
('Wi-Fi', 'wifi', 'Kablosuz internet erişimi'),
('Sessiz Çalışma Alanı', 'quiet', 'Sessiz bireysel çalışma'),
('Kafeterya', 'cafe', 'Kahve ve atıştırmalık'),
('Öğrenci Mutfağı', 'kitchen', 'Yemek hazırlama imkanı'),
('Yazıcı/Fotokopi', 'printer', 'Yazıcı ve fotokopi'),
('Engelli Erişimi', 'accessible', 'Rampa, asansör vb.'),
('Bahçe/Dış Alan', 'garden', 'Açık hava alanı'),
('Dua/Meditasyon Odası', 'prayer', 'Dua ve meditasyon için alan'),
('Bisiklet Parkı', 'bike', 'Bisiklet park alanı'),
('Kilitli Dolap', 'locker', 'Kişisel eşya saklama'),
('Smartboard', 'smartboard', 'İnteraktif beyaz tahta'),
('Klima/Isıtma', 'climate', 'İklimlendirme sistemi');

INSERT INTO support_service_types (name, description) VALUES
('Havaalanı Transferi', 'Havaalanından konaklama adresine transfer'),
('Öğrenci Danışmanı', 'Akademik ve kişisel danışmanlık'),
('CV Hazırlama Desteği', 'CV yazma ve kariyer danışmanlığı'),
('Part-time İş Bulma', 'İş arama desteği'),
('Psikolojik Destek', 'Ruh sağlığı danışmanlığı'),
('Acil Durum Hattı', '7/24 acil durum telefonu'),
('Banka Hesabı Açma', 'UK banka hesabı açma desteği'),
('GP Kaydı', 'Doktor kaydı desteği'),
('NI Numarası Başvurusu', 'National Insurance başvuru desteği'),
('BRP Teslim Adresi', 'Okulun BRP teslim adresi olarak kullanımı'),
('Vize Danışmanlığı', 'Vize başvuru desteği'),
('Konaklama Bulma', 'Bağımsız konaklama arama desteği'),
('Üniversite Başvuru Desteği', 'Üniversite application desteği'),
('Türkçe Konuşan Personel', 'Türkçe dil desteği'),
('WhatsApp/Telegram Grubu', 'Dijital iletişim grubu');

INSERT INTO activity_types (name, is_free, description) VALUES
('Şehir Gezisi', FALSE, 'Londra şehir içi turlar'),
('Hafta Sonu Gezisi', FALSE, 'Oxford, Cambridge, Brighton vb.'),
('Pub Night', TRUE, 'Sosyal pub buluşmaları'),
('Spor Aktivitesi', NULL, 'Futbol, voleybol vb.'),
('Film/Belgesel Gösterimi', TRUE, 'Film gecesi etkinliği'),
('Yemek Pişirme', NULL, 'Cooking event'),
('Müze/Galeri Ziyareti', NULL, 'Kültürel ziyaretler'),
('Networking Etkinliği', TRUE, 'Öğrenciler arası networking'),
('Üniversite Ziyareti', TRUE, 'Üniversite kampüs turları'),
('Gönüllülük Programı', TRUE, 'Volunteering'),
('Tandem Partner', TRUE, 'Dil değişim partneri programı'),
('Speaking Club', TRUE, 'Ekstra konuşma kulübü'),
('Kültürel Etkinlik', NULL, 'Festival, fuar vb.');

INSERT INTO dietary_options (name) VALUES
('Vejetaryen'),
('Vegan'),
('Helal'),
('Glutensiz'),
('Koşer'),
('Laktozsuz'),
('Fındık/Nut-free');

INSERT INTO cancellation_policies (name, description) VALUES
('Tam İade', 'Kurs başlamadan iptal halinde tam iade'),
('Kısmi İade', 'Kalan süre üzerinden kısmi iade'),
('İade Yok', 'İade yapılmaz'),
('Kredi Transferi', 'Ücret başka bir tarihe/kursa aktarılır'),
('Ders Dondurma', 'Kalan dersler dondurulup ileri tarihe ertelenir'),
('Vize Reddi İadesi', 'Vize reddinde tam iade');

-- =====================================================
-- KATEGORİLER
-- =====================================================

INSERT INTO categories (name, display_order, icon, description) VALUES
('Dil Okulu Hakkında', 1, 'school', 'Okul kalitesi, eğitim ve imkanlar'),
('Konaklama Hakkında', 2, 'home', 'Konaklama seçenekleri ve detayları'),
('Yaşam ve Pratik Bilgiler', 3, 'life', 'Günlük yaşam, çalışma, ulaşım'),
('Kritik Sorular', 4, 'alert', 'Hızlı eleme için en önemli 10 soru'),
('Stratejik Analiz', 5, 'chart', 'Uzman düzeyinde analiz soruları');

-- =====================================================
-- ALT KATEGORİLER
-- =====================================================

-- Kategori 1: Dil Okulu Hakkında
INSERT INTO subcategories (category_id, name, display_order, icon) VALUES
(1, 'Akreditasyon ve Resmiyet', 1, 'badge'),
(1, 'Öğretmen Kalitesi', 2, 'teacher'),
(1, 'Sınıf Yapısı', 3, 'classroom'),
(1, 'Eğitim Programı', 4, 'curriculum'),
(1, 'Seviye Sistemi', 5, 'levels'),
(1, 'Ders İçeriği', 6, 'content'),
(1, 'Ders Saatleri', 7, 'clock'),
(1, 'Okul İmkanları', 8, 'facility'),
(1, 'Sosyal Aktiviteler', 9, 'social'),
(1, 'Öğrenci Profili', 10, 'people'),
(1, 'Okul Lokasyonu', 11, 'location'),
(1, 'Destek Hizmetleri', 12, 'support'),
(1, 'Ücretler', 13, 'money'),
(1, 'İade ve İptal Politikası', 14, 'refund'),
(1, 'Vize Desteği', 15, 'visa'),
(1, 'Sertifika ve Diploma', 16, 'certificate'),
(1, 'Online ve Hibrit Eğitim', 17, 'online');

-- Kategori 2: Konaklama Hakkında
INSERT INTO subcategories (category_id, name, display_order, icon) VALUES
(2, 'Konaklama Türü', 1, 'house'),
(2, 'Aile Yanı Konaklama', 2, 'family'),
(2, 'Oda Özellikleri', 3, 'room'),
(2, 'Ev Kuralları', 4, 'rules'),
(2, 'Konaklama Lokasyonu', 5, 'map'),
(2, 'Ev Sahibi', 6, 'host'),
(2, 'Yemek', 7, 'food'),
(2, 'Güvenlik', 8, 'security'),
(2, 'Temizlik', 9, 'cleaning'),
(2, 'Konaklama Fiyatı', 10, 'price'),
(2, 'Konaklama Sözleşmesi', 11, 'contract'),
(2, 'Sağlık ve Sigorta', 12, 'health');

-- Kategori 3: Yaşam ve Pratik Bilgiler
INSERT INTO subcategories (category_id, name, display_order, icon) VALUES
(3, 'Yaşam Maliyeti', 1, 'wallet'),
(3, 'Çalışma İzni ve Part-time İş', 2, 'work'),
(3, 'Ulaşım', 3, 'transport');

-- Kategori 4: Kritik Sorular
INSERT INTO subcategories (category_id, name, display_order, icon) VALUES
(4, 'Hızlı Eleme Soruları', 1, 'filter');

-- Kategori 5: Stratejik Analiz
INSERT INTO subcategories (category_id, name, display_order, icon) VALUES
(5, 'Öğrenme Verimliliği', 1, 'efficiency'),
(5, 'Mezun Sonuçları', 2, 'graduation'),
(5, 'Öğrenci Memnuniyeti', 3, 'satisfaction'),
(5, 'Risk Analizi', 4, 'risk'),
(5, 'Rekabet Analizi', 5, 'competition');
