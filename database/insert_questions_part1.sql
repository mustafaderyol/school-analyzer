-- =====================================================
-- SORULAR - Bölüm 1: Dil Okulu (Akreditasyon - Eğitim Programı)
-- Subcategory ID'leri insert_lookups.sql sırasına göre
-- =====================================================

-- Akreditasyon ve Resmiyet (subcategory_id = 1)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode) VALUES
(1, (SELECT id FROM answer_types WHERE code='multi_choice'), 'Okul hangi kurumlar tarafından akredite edilmiş?', 1, TRUE, 'neutral'),
(1, (SELECT id FROM answer_types WHERE code='boolean'), 'British Council akreditasyonu var mı?', 2, TRUE, 'neutral'),
(1, (SELECT id FROM answer_types WHERE code='boolean'), 'English UK üyesi mi?', 3, FALSE, 'neutral'),
(1, (SELECT id FROM answer_types WHERE code='boolean'), 'Accreditation UK onaylı mı?', 4, FALSE, 'neutral'),
(1, (SELECT id FROM answer_types WHERE code='boolean'), 'Quality English üyesi mi?', 5, FALSE, 'neutral'),
(1, (SELECT id FROM answer_types WHERE code='boolean'), 'IALC üyesi mi?', 6, FALSE, 'neutral'),
(1, (SELECT id FROM answer_types WHERE code='boolean'), 'Eğitim bakanlığı tarafından tanınıyor mu?', 7, FALSE, 'neutral'),
(1, (SELECT id FROM answer_types WHERE code='text'), 'Denetimler ne sıklıkla yapılıyor?', 8, FALSE, 'neutral'),
(1, (SELECT id FROM answer_types WHERE code='text'), 'En son denetim sonucu nedir?', 9, FALSE, 'neutral'),
(1, (SELECT id FROM answer_types WHERE code='boolean'), 'Denetim raporları kamuya açık mı?', 10, FALSE, 'neutral'),
(1, (SELECT id FROM answer_types WHERE code='boolean'), 'Fee protection (finansal koruma) var mı?', 11, FALSE, 'neutral'),
(1, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğrenciler için finansal koruma programı var mı?', 12, FALSE, 'neutral');

-- Öğretmen Kalitesi (subcategory_id = 2)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(2, (SELECT id FROM answer_types WHERE code='number'), 'Öğretmenlerin ortalama deneyimi kaç yıl?', 1, FALSE, 'higher_better', 'yıl'),
(2, (SELECT id FROM answer_types WHERE code='multi_choice'), 'Öğretmenlerin sertifikaları neler?', 2, TRUE, 'neutral', NULL),
(2, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğretmenlerin ana dili İngilizce mi?', 3, FALSE, 'neutral', NULL),
(2, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğretmen değişimi sık oluyor mu?', 4, FALSE, 'lower_better', NULL),
(2, (SELECT id FROM answer_types WHERE code='number'), 'Öğretmen başına düşen öğrenci sayısı nedir?', 5, FALSE, 'lower_better', 'kişi'),
(2, (SELECT id FROM answer_types WHERE code='single_choice'), 'Öğretmenlerin çoğu tam zamanlı mı yarı zamanlı mı?', 6, FALSE, 'neutral', NULL),
(2, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğretmenlerin eğitim içi gelişim programı var mı?', 7, FALSE, 'neutral', NULL),
(2, (SELECT id FROM answer_types WHERE code='text'), 'Öğretmen performansı nasıl değerlendiriliyor?', 8, FALSE, 'neutral', NULL),
(2, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğrenci geri bildirimleri öğretmen değerlendirmesinde kullanılıyor mu?', 9, FALSE, 'neutral', NULL),
(2, (SELECT id FROM answer_types WHERE code='text'), 'Öğretmenlerin akademik geçmişi nedir?', 10, FALSE, 'neutral', NULL),
(2, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğretmenler farklı aksanlara maruz bırakıyor mu?', 11, FALSE, 'neutral', NULL),
(2, (SELECT id FROM answer_types WHERE code='text'), 'Deneyimli öğretmenler hangi seviyelerde ders veriyor?', 12, FALSE, 'neutral', NULL);

-- Sınıf Yapısı (subcategory_id = 3)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(3, (SELECT id FROM answer_types WHERE code='number'), 'Maksimum sınıf mevcudu kaç kişi?', 1, TRUE, 'lower_better', 'kişi'),
(3, (SELECT id FROM answer_types WHERE code='number'), 'Ortalama sınıf mevcudu kaç?', 2, TRUE, 'lower_better', 'kişi'),
(3, (SELECT id FROM answer_types WHERE code='boolean'), 'Aynı milletten öğrenciler sınıfta yoğun mu?', 3, FALSE, 'lower_better', NULL),
(3, (SELECT id FROM answer_types WHERE code='text'), 'Milliyet dengesi nasıl sağlanıyor?', 4, FALSE, 'neutral', NULL),
(3, (SELECT id FROM answer_types WHERE code='boolean'), 'Sınıflar seviyeye göre mi belirleniyor?', 5, FALSE, 'neutral', NULL),
(3, (SELECT id FROM answer_types WHERE code='boolean'), 'Aynı ülkeden öğrenci için sınıf kotası var mı?', 6, FALSE, 'neutral', NULL),
(3, (SELECT id FROM answer_types WHERE code='number'), 'Sınıf içi konuşma oranı ne kadar?', 7, FALSE, 'higher_better', '%'),
(3, (SELECT id FROM answer_types WHERE code='boolean'), 'Küçük grup çalışmaları var mı?', 8, FALSE, 'neutral', NULL),
(3, (SELECT id FROM answer_types WHERE code='boolean'), 'Sınıflar modern ekipmanlara sahip mi?', 9, FALSE, 'neutral', NULL),
(3, (SELECT id FROM answer_types WHERE code='boolean'), 'İnteraktif beyaz tahta (smartboard) var mı?', 10, FALSE, 'neutral', NULL),
(3, (SELECT id FROM answer_types WHERE code='boolean'), 'Sınıflarda klima/ısıtma var mı?', 11, FALSE, 'neutral', NULL),
(3, (SELECT id FROM answer_types WHERE code='boolean'), 'Sınıf mevcudu düşerse sınıflar birleştiriliyor mu?', 12, FALSE, 'lower_better', NULL);

-- Eğitim Programı (subcategory_id = 4)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(4, (SELECT id FROM answer_types WHERE code='number'), 'Haftada kaç saat ders var?', 1, TRUE, 'higher_better', 'saat'),
(4, (SELECT id FROM answer_types WHERE code='number'), 'Derslerin kaçı konuşma ağırlıklı?', 2, FALSE, 'neutral', 'saat'),
(4, (SELECT id FROM answer_types WHERE code='number'), 'Derslerin kaçı grammar odaklı?', 3, FALSE, 'neutral', 'saat'),
(4, (SELECT id FROM answer_types WHERE code='boolean'), 'Ders materyalleri dahil mi?', 4, FALSE, 'neutral', NULL),
(4, (SELECT id FROM answer_types WHERE code='boolean'), 'Ders kitapları ücretli mi?', 5, FALSE, 'lower_better', NULL),
(4, (SELECT id FROM answer_types WHERE code='multi_choice'), 'Dersler hangi metodoloji ile veriliyor?', 6, FALSE, 'neutral', NULL),
(4, (SELECT id FROM answer_types WHERE code='boolean'), 'Derslerde teknoloji kullanılıyor mu?', 7, FALSE, 'neutral', NULL),
(4, (SELECT id FROM answer_types WHERE code='boolean'), 'Online destek platformu var mı?', 8, FALSE, 'neutral', NULL),
(4, (SELECT id FROM answer_types WHERE code='boolean'), 'Ders dışı öğrenme materyalleri var mı?', 9, FALSE, 'neutral', NULL),
(4, (SELECT id FROM answer_types WHERE code='text'), 'Müfredat ne sıklıkla güncelleniyor?', 10, FALSE, 'neutral', NULL),
(4, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğrencilere bireysel öğrenme planı oluşturuluyor mu?', 11, FALSE, 'neutral', NULL),
(4, (SELECT id FROM answer_types WHERE code='text'), 'Progress report ne sıklıkla veriliyor?', 12, FALSE, 'neutral', NULL),
(4, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğrenci portfolyosu tutuluyor mu?', 13, FALSE, 'neutral', NULL);
