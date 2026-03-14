-- =====================================================
-- SORULAR - Bölüm 5: Yaşam, Kritik, Stratejik Analiz
-- =====================================================

-- Yaşam Maliyeti (subcategory_id = 30)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(30, (SELECT id FROM answer_types WHERE code='number'), 'Bölgede ortalama aylık yaşam maliyeti ne kadar?', 1, FALSE, 'lower_better', '£'),
(30, (SELECT id FROM answer_types WHERE code='number'), 'Market/yemek alışverişi aylık ortalama ne kadar?', 2, FALSE, 'lower_better', '£'),
(30, (SELECT id FROM answer_types WHERE code='number'), 'Dışarıda yemek ortalama ne kadar?', 3, FALSE, 'lower_better', '£'),
(30, (SELECT id FROM answer_types WHERE code='number'), 'Aylık ulaşım kartı ne kadar?', 4, FALSE, 'lower_better', '£'),
(30, (SELECT id FROM answer_types WHERE code='number'), 'Telefon/mobil internet aylık ne kadar?', 5, FALSE, 'lower_better', '£'),
(30, (SELECT id FROM answer_types WHERE code='number'), 'Sosyalleşme/eğlence aylık ortalama ne kadar?', 6, FALSE, 'neutral', '£'),
(30, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğrenci indirimleri var mı?', 7, FALSE, 'neutral', NULL),
(30, (SELECT id FROM answer_types WHERE code='text'), 'En uygun alışveriş bölgeleri neresi?', 8, FALSE, 'neutral', NULL);

-- Çalışma İzni ve Part-time İş (subcategory_id = 31)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(31, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğrenci vizesi ile çalışma hakkı var mı?', 1, TRUE, 'neutral', NULL),
(31, (SELECT id FROM answer_types WHERE code='number'), 'Haftalık çalışma saati limiti nedir?', 2, FALSE, 'neutral', 'saat'),
(31, (SELECT id FROM answer_types WHERE code='boolean'), 'Okul iş bulma desteği veriyor mu?', 3, FALSE, 'neutral', NULL),
(31, (SELECT id FROM answer_types WHERE code='boolean'), 'Staj imkanı var mı?', 4, FALSE, 'neutral', NULL),
(31, (SELECT id FROM answer_types WHERE code='boolean'), 'Okuldaki iş ilanı panosu var mı?', 5, FALSE, 'neutral', NULL),
(31, (SELECT id FROM answer_types WHERE code='rating'), 'Bölgede part-time iş imkanları nasıl?', 6, FALSE, 'higher_better', NULL),
(31, (SELECT id FROM answer_types WHERE code='text'), 'Hangi sektörlerde part-time iş bulunuyor?', 7, FALSE, 'neutral', NULL);

-- Ulaşım (subcategory_id = 32)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode) VALUES
(32, (SELECT id FROM answer_types WHERE code='text'), 'En yakın havaalanı hangisi?', 1, FALSE, 'neutral'),
(32, (SELECT id FROM answer_types WHERE code='text'), 'Havaalanından okula nasıl ulaşılır?', 2, FALSE, 'neutral'),
(32, (SELECT id FROM answer_types WHERE code='text'), 'Oyster card nedir ve nasıl alınır?', 3, FALSE, 'neutral'),
(32, (SELECT id FROM answer_types WHERE code='boolean'), 'Contactless ödeme ile ulaşım mümkün mü?', 4, FALSE, 'neutral'),
(32, (SELECT id FROM answer_types WHERE code='boolean'), 'Gece metrosu çalışıyor mu?', 5, FALSE, 'neutral'),
(32, (SELECT id FROM answer_types WHERE code='boolean'), 'Bisiklet kiralama var mı?', 6, FALSE, 'neutral'),
(32, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğrenci ulaşım indirimi var mı?', 7, FALSE, 'neutral');

-- Kritik Sorular (subcategory_id = 33)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(33, (SELECT id FROM answer_types WHERE code='boolean'), 'Okulun akreditasyonu var mı?', 1, TRUE, 'neutral', NULL),
(33, (SELECT id FROM answer_types WHERE code='number'), 'Ortalama sınıf mevcudu kaç?', 2, TRUE, 'lower_better', 'kişi'),
(33, (SELECT id FROM answer_types WHERE code='number'), 'Türk öğrenci oranı ne?', 3, TRUE, 'lower_better', '%'),
(33, (SELECT id FROM answer_types WHERE code='text'), 'Öğretmenlerin sertifikaları ne?', 4, TRUE, 'neutral', NULL),
(33, (SELECT id FROM answer_types WHERE code='number'), 'Haftada kaç saat ders var?', 5, TRUE, 'higher_better', 'saat'),
(33, (SELECT id FROM answer_types WHERE code='text'), 'Okul hangi bölgede?', 6, TRUE, 'neutral', NULL),
(33, (SELECT id FROM answer_types WHERE code='number'), 'Konaklama okula kaç dakika?', 7, TRUE, 'lower_better', 'dakika'),
(33, (SELECT id FROM answer_types WHERE code='boolean'), 'Aile yanında İngilizce konuşuluyor mu?', 8, TRUE, 'neutral', NULL),
(33, (SELECT id FROM answer_types WHERE code='number'), 'Haftalık toplam maliyet ne?', 9, TRUE, 'lower_better', '£'),
(33, (SELECT id FROM answer_types WHERE code='rating'), 'Okul öğrenci memnuniyeti nasıl?', 10, TRUE, 'higher_better', NULL);

-- Öğrenme Verimliliği (subcategory_id = 34)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(34, (SELECT id FROM answer_types WHERE code='number'), 'Mezun öğrencilerin ortalama IELTS skor artışı nedir?', 1, FALSE, 'higher_better', 'puan'),
(34, (SELECT id FROM answer_types WHERE code='number'), '12 haftada ortalama seviye artışı nedir?', 2, FALSE, 'higher_better', 'seviye'),
(34, (SELECT id FROM answer_types WHERE code='number'), 'Öğrenci devam oranı nedir?', 3, FALSE, 'higher_better', '%'),
(34, (SELECT id FROM answer_types WHERE code='number'), 'Öğrenci tamamlama oranı nedir?', 4, FALSE, 'higher_better', '%'),
(34, (SELECT id FROM answer_types WHERE code='number'), 'Öğrenci hedeflerine ulaşma oranı nedir?', 5, FALSE, 'higher_better', '%');

-- Mezun Sonuçları (subcategory_id = 35)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode) VALUES
(35, (SELECT id FROM answer_types WHERE code='text'), 'Öğrenciler hangi üniversitelere geçiş yapıyor?', 1, FALSE, 'neutral'),
(35, (SELECT id FROM answer_types WHERE code='boolean'), 'Üniversite pathway programı var mı?', 2, FALSE, 'neutral'),
(35, (SELECT id FROM answer_types WHERE code='number'), 'Mezunların yüzde kaçı hedef seviyeye ulaşıyor?', 3, FALSE, 'higher_better'),
(35, (SELECT id FROM answer_types WHERE code='boolean'), 'Mezun referans programı var mı?', 4, FALSE, 'neutral');

-- Öğrenci Memnuniyeti (subcategory_id = 36)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(36, (SELECT id FROM answer_types WHERE code='number'), 'Net promoter score nedir?', 1, FALSE, 'higher_better', NULL),
(36, (SELECT id FROM answer_types WHERE code='text'), 'Öğrenci yorumları nerede yayınlanıyor?', 2, FALSE, 'neutral', NULL),
(36, (SELECT id FROM answer_types WHERE code='boolean'), 'Mezun öğrenciler okulu tekrar öneriyor mu?', 3, FALSE, 'neutral', NULL),
(36, (SELECT id FROM answer_types WHERE code='number'), 'Google/Trustpilot puanı kaç?', 4, FALSE, 'higher_better', '/5'),
(36, (SELECT id FROM answer_types WHERE code='text'), 'Şikayet çözüm süreci nasıl?', 5, FALSE, 'neutral', NULL),
(36, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğrenci memnuniyet anketi sonuçları paylaşılıyor mu?', 6, FALSE, 'neutral', NULL);

-- Risk Analizi (subcategory_id = 37)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(37, (SELECT id FROM answer_types WHERE code='number'), 'Okul kaç yıldır faaliyet gösteriyor?', 1, FALSE, 'higher_better', 'yıl'),
(37, (SELECT id FROM answer_types WHERE code='boolean'), 'Finansal olarak güçlü mü?', 2, FALSE, 'neutral', NULL),
(37, (SELECT id FROM answer_types WHERE code='boolean'), 'Pandemi döneminde kapanma yaşadı mı?', 3, FALSE, 'lower_better', NULL),
(37, (SELECT id FROM answer_types WHERE code='single_choice'), 'Öğrenci sayısı trendi nasıl?', 4, FALSE, 'neutral', NULL),
(37, (SELECT id FROM answer_types WHERE code='boolean'), 'Okul zinciri mi bağımsız mı?', 5, FALSE, 'neutral', NULL),
(37, (SELECT id FROM answer_types WHERE code='number'), 'Zincir ise kaç şubesi var?', 6, FALSE, 'neutral', 'şube');

-- Rekabet Analizi (subcategory_id = 38)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode) VALUES
(38, (SELECT id FROM answer_types WHERE code='text'), 'Aynı bölgedeki rakip okullarla farkı nedir?', 1, FALSE, 'neutral'),
(38, (SELECT id FROM answer_types WHERE code='text'), 'Okulun öne çıkan güçlü yönü nedir?', 2, FALSE, 'neutral'),
(38, (SELECT id FROM answer_types WHERE code='text'), 'Okulun bilinen zayıf yönleri nelerdir?', 3, FALSE, 'neutral'),
(38, (SELECT id FROM answer_types WHERE code='rating'), 'Fiyat/kalite oranı nasıl?', 4, FALSE, 'higher_better');

-- =====================================================
-- QUESTION OPTIONS (Seçenekli sorular için)
-- =====================================================

-- Öğretmen çalışma durumu seçenekleri
INSERT INTO question_options (question_id, option_text, option_value, display_order) 
SELECT q.id, opt.text, opt.value, opt.ord
FROM questions q
CROSS JOIN (VALUES 
    ('Tam zamanlı', 'full_time', 1),
    ('Yarı zamanlı', 'part_time', 2),
    ('Karma', 'mixed', 3)
) AS opt(text, value, ord)
WHERE q.question_text = 'Öğretmenlerin çoğu tam zamanlı mı yarı zamanlı mı?';

-- Placement test seçenekleri
INSERT INTO question_options (question_id, option_text, option_value, display_order) 
SELECT q.id, opt.text, opt.value, opt.ord
FROM questions q
CROSS JOIN (VALUES 
    ('Online', 'online', 1),
    ('Yüz yüze', 'face_to_face', 2),
    ('Her ikisi', 'both', 3)
) AS opt(text, value, ord)
WHERE q.question_text = 'Placement test online mı yüz yüze mi?';

-- Ders zamanı seçenekleri
INSERT INTO question_options (question_id, option_text, option_value, display_order) 
SELECT q.id, opt.text, opt.value, opt.ord
FROM questions q
CROSS JOIN (VALUES 
    ('Sabah', 'morning', 1),
    ('Öğleden sonra', 'afternoon', 2),
    ('Her ikisi', 'both', 3),
    ('Değişken', 'variable', 4)
) AS opt(text, value, ord)
WHERE q.question_text = 'Sabah mı öğleden sonra mı dersler?';

-- Oda tipi seçenekleri
INSERT INTO question_options (question_id, option_text, option_value, display_order) 
SELECT q.id, opt.text, opt.value, opt.ord
FROM questions q
CROSS JOIN (VALUES 
    ('Tek kişilik', 'single', 1),
    ('Çift kişilik', 'double', 2),
    ('Her ikisi mevcut', 'both', 3)
) AS opt(text, value, ord)
WHERE q.question_text = 'Tek kişilik mi çift kişilik mi?';

-- Yatak boyutu seçenekleri
INSERT INTO question_options (question_id, option_text, option_value, display_order) 
SELECT q.id, opt.text, opt.value, opt.ord
FROM questions q
CROSS JOIN (VALUES 
    ('Single', 'single', 1),
    ('Double', 'double', 2),
    ('King', 'king', 3)
) AS opt(text, value, ord)
WHERE q.question_text = 'Yatak boyutu nedir?';

-- Bina tipi seçenekleri
INSERT INTO question_options (question_id, option_text, option_value, display_order) 
SELECT q.id, opt.text, opt.value, opt.ord
FROM questions q
CROSS JOIN (VALUES 
    ('Apartman', 'apartment', 1),
    ('Müstakil ev', 'house', 2),
    ('Diğer', 'other', 3)
) AS opt(text, value, ord)
WHERE q.question_text = 'Apartman mı müstakil ev mi?';

-- Okul binası seçenekleri
INSERT INTO question_options (question_id, option_text, option_value, display_order) 
SELECT q.id, opt.text, opt.value, opt.ord
FROM questions q
CROSS JOIN (VALUES 
    ('Tarihi', 'historic', 1),
    ('Modern', 'modern', 2),
    ('Karma', 'mixed', 3)
) AS opt(text, value, ord)
WHERE q.question_text = 'Okul binası tarihi mi modern mi?';

-- Sertifika format seçenekleri
INSERT INTO question_options (question_id, option_text, option_value, display_order) 
SELECT q.id, opt.text, opt.value, opt.ord
FROM questions q
CROSS JOIN (VALUES 
    ('Dijital', 'digital', 1),
    ('Basılı', 'printed', 2),
    ('Her ikisi', 'both', 3)
) AS opt(text, value, ord)
WHERE q.question_text = 'Sertifika dijital mi basılı mı?';

-- Öğrenci trendi seçenekleri
INSERT INTO question_options (question_id, option_text, option_value, display_order) 
SELECT q.id, opt.text, opt.value, opt.ord
FROM questions q
CROSS JOIN (VALUES 
    ('Artıyor', 'increasing', 1),
    ('Sabit', 'stable', 2),
    ('Azalıyor', 'decreasing', 3)
) AS opt(text, value, ord)
WHERE q.question_text = 'Öğrenci sayısı trendi nasıl?';

-- Kurs tipi: Genel/Akademik seçenekleri
INSERT INTO question_options (question_id, option_text, option_value, display_order) 
SELECT q.id, opt.text, opt.value, opt.ord
FROM questions q
CROSS JOIN (VALUES 
    ('Genel İngilizce', 'general', 1),
    ('Akademik İngilizce', 'academic', 2),
    ('Her ikisi', 'both', 3)
) AS opt(text, value, ord)
WHERE q.question_text = 'Genel İngilizce mi yoksa akademik İngilizce mi?';

-- Öğrenci profili seçenekleri
INSERT INTO question_options (question_id, option_text, option_value, display_order) 
SELECT q.id, opt.text, opt.value, opt.ord
FROM questions q
CROSS JOIN (VALUES 
    ('Üniversite öğrencileri', 'university', 1),
    ('Profesyoneller', 'professional', 2),
    ('Karma', 'mixed', 3)
) AS opt(text, value, ord)
WHERE q.question_text = 'Üniversite öğrencileri mi profesyoneller mi?';

-- Dönem seçenekleri
INSERT INTO question_options (question_id, option_text, option_value, display_order) 
SELECT q.id, opt.text, opt.value, opt.ord
FROM questions q
CROSS JOIN (VALUES 
    ('Uzun dönem (12+ hafta)', 'long_term', 1),
    ('Kısa dönem (1-4 hafta)', 'short_term', 2),
    ('Karma', 'mixed', 3)
) AS opt(text, value, ord)
WHERE q.question_text = 'Uzun dönem öğrenciler mi kısa dönem öğrenciler mi?';
