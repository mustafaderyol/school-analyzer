-- =====================================================
-- SORULAR - Bölüm 2: Seviye Sistemi - Ders Saatleri - Okul İmkanları
-- =====================================================

-- Seviye Sistemi (subcategory_id = 5)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(5, (SELECT id FROM answer_types WHERE code='number'), 'Kaç farklı İngilizce seviyesi var?', 1, FALSE, 'higher_better', 'seviye'),
(5, (SELECT id FROM answer_types WHERE code='number'), 'Seviye atlama ortalama kaç hafta sürüyor?', 2, FALSE, 'lower_better', 'hafta'),
(5, (SELECT id FROM answer_types WHERE code='text'), 'Seviye değerlendirmeleri nasıl yapılıyor?', 3, FALSE, 'neutral', NULL),
(5, (SELECT id FROM answer_types WHERE code='text'), 'Placement test nasıl yapılıyor?', 4, FALSE, 'neutral', NULL),
(5, (SELECT id FROM answer_types WHERE code='text'), 'Seviye atlamak için sınav mı proje mi gerekiyor?', 5, FALSE, 'neutral', NULL),
(5, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğrenci istediğinde seviye değiştirebilir mi?', 6, FALSE, 'neutral', NULL),
(5, (SELECT id FROM answer_types WHERE code='boolean'), 'CEFR seviye sistemi kullanılıyor mu?', 7, FALSE, 'neutral', NULL),
(5, (SELECT id FROM answer_types WHERE code='boolean'), 'Seviye atlayamayanlar için ek destek var mı?', 8, FALSE, 'neutral', NULL),
(5, (SELECT id FROM answer_types WHERE code='single_choice'), 'Placement test online mı yüz yüze mi?', 9, FALSE, 'neutral', NULL);

-- Ders İçeriği (subcategory_id = 6)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(6, (SELECT id FROM answer_types WHERE code='single_choice'), 'Genel İngilizce mi yoksa akademik İngilizce mi?', 1, FALSE, 'neutral', NULL),
(6, (SELECT id FROM answer_types WHERE code='boolean'), 'İş İngilizcesi seçenekleri var mı?', 2, FALSE, 'neutral', NULL),
(6, (SELECT id FROM answer_types WHERE code='boolean'), 'IELTS hazırlık var mı?', 3, TRUE, 'neutral', NULL),
(6, (SELECT id FROM answer_types WHERE code='boolean'), 'Cambridge Exam hazırlık var mı?', 4, FALSE, 'neutral', NULL),
(6, (SELECT id FROM answer_types WHERE code='boolean'), 'TOEFL hazırlık var mı?', 5, FALSE, 'neutral', NULL),
(6, (SELECT id FROM answer_types WHERE code='boolean'), 'OET hazırlık var mı?', 6, FALSE, 'neutral', NULL),
(6, (SELECT id FROM answer_types WHERE code='boolean'), 'Speaking club var mı?', 7, FALSE, 'neutral', NULL),
(6, (SELECT id FROM answer_types WHERE code='boolean'), 'Writing workshop var mı?', 8, FALSE, 'neutral', NULL),
(6, (SELECT id FROM answer_types WHERE code='boolean'), 'Pronunciation sınıfları var mı?', 9, FALSE, 'neutral', NULL),
(6, (SELECT id FROM answer_types WHERE code='boolean'), 'Presentation training var mı?', 10, FALSE, 'neutral', NULL),
(6, (SELECT id FROM answer_types WHERE code='boolean'), 'Debate class var mı?', 11, FALSE, 'neutral', NULL),
(6, (SELECT id FROM answer_types WHERE code='boolean'), 'One-to-one ders seçeneği var mı?', 12, FALSE, 'neutral', NULL),
(6, (SELECT id FROM answer_types WHERE code='number'), 'Birebir ders ücreti ne kadar?', 13, FALSE, 'lower_better', '£'),
(6, (SELECT id FROM answer_types WHERE code='boolean'), 'Sektöre özel İngilizce var mı?', 14, FALSE, 'neutral', NULL),
(6, (SELECT id FROM answer_types WHERE code='boolean'), 'Akademik yazma dersi var mı?', 15, FALSE, 'neutral', NULL),
(6, (SELECT id FROM answer_types WHERE code='boolean'), 'Listening/comprehension odaklı ders var mı?', 16, FALSE, 'neutral', NULL);

-- Ders Saatleri (subcategory_id = 7)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(7, (SELECT id FROM answer_types WHERE code='single_choice'), 'Sabah mı öğleden sonra mı dersler?', 1, FALSE, 'neutral', NULL),
(7, (SELECT id FROM answer_types WHERE code='boolean'), 'Ders saatleri sabit mi değişiyor mu?', 2, FALSE, 'neutral', NULL),
(7, (SELECT id FROM answer_types WHERE code='boolean'), 'Yoğun program seçenekleri var mı?', 3, FALSE, 'neutral', NULL),
(7, (SELECT id FROM answer_types WHERE code='boolean'), 'Haftasonu dersleri var mı?', 4, FALSE, 'neutral', NULL),
(7, (SELECT id FROM answer_types WHERE code='number'), 'Ders kaç dakika sürüyor?', 5, FALSE, 'neutral', 'dakika'),
(7, (SELECT id FROM answer_types WHERE code='boolean'), 'Ders iptali durumunda telafi yapılıyor mu?', 6, FALSE, 'neutral', NULL),
(7, (SELECT id FROM answer_types WHERE code='boolean'), 'Akşam dersleri var mı?', 7, FALSE, 'neutral', NULL),
(7, (SELECT id FROM answer_types WHERE code='boolean'), 'Part-time program seçeneği var mı?', 8, FALSE, 'neutral', NULL),
(7, (SELECT id FROM answer_types WHERE code='number'), 'Ders arası kaç dakika?', 9, FALSE, 'neutral', 'dakika'),
(7, (SELECT id FROM answer_types WHERE code='boolean'), 'Bayram/tatil günlerinde ders yapılıyor mu?', 10, FALSE, 'neutral', NULL),
(7, (SELECT id FROM answer_types WHERE code='number'), 'Yıllık kaç hafta tatil var?', 11, FALSE, 'neutral', 'hafta');

-- Okul İmkanları (subcategory_id = 8)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode) VALUES
(8, (SELECT id FROM answer_types WHERE code='boolean'), 'Kütüphane var mı?', 1, FALSE, 'neutral'),
(8, (SELECT id FROM answer_types WHERE code='boolean'), 'Çalışma odası var mı?', 2, FALSE, 'neutral'),
(8, (SELECT id FROM answer_types WHERE code='boolean'), 'Bilgisayar lab var mı?', 3, FALSE, 'neutral'),
(8, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğrenci lounge alanı var mı?', 4, FALSE, 'neutral'),
(8, (SELECT id FROM answer_types WHERE code='rating'), 'Wi-Fi kalitesi nasıl?', 5, FALSE, 'higher_better'),
(8, (SELECT id FROM answer_types WHERE code='boolean'), 'Sessiz çalışma alanı var mı?', 6, FALSE, 'neutral'),
(8, (SELECT id FROM answer_types WHERE code='boolean'), 'Kafeterya var mı?', 7, FALSE, 'neutral'),
(8, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğrenci mutfağı var mı?', 8, FALSE, 'neutral'),
(8, (SELECT id FROM answer_types WHERE code='boolean'), 'Yazıcı/fotokopi imkanı var mı?', 9, FALSE, 'neutral'),
(8, (SELECT id FROM answer_types WHERE code='boolean'), 'Engelli erişimi var mı?', 10, FALSE, 'neutral'),
(8, (SELECT id FROM answer_types WHERE code='boolean'), 'Bahçe/dış alan var mı?', 11, FALSE, 'neutral'),
(8, (SELECT id FROM answer_types WHERE code='boolean'), 'Dua/meditasyon odası var mı?', 12, FALSE, 'neutral'),
(8, (SELECT id FROM answer_types WHERE code='boolean'), 'Bisiklet park alanı var mı?', 13, FALSE, 'neutral'),
(8, (SELECT id FROM answer_types WHERE code='boolean'), 'Kilitli dolap (locker) var mı?', 14, FALSE, 'neutral');
