-- =====================================================
-- SORULAR - Bölüm 4: Konaklama (subcategory 18-29) + Sağlık
-- =====================================================

-- Konaklama Türü (subcategory_id = 18)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode) VALUES
(18, (SELECT id FROM answer_types WHERE code='multi_choice'), 'Hangi konaklama türleri mevcut?', 1, FALSE, 'neutral'),
(18, (SELECT id FROM answer_types WHERE code='boolean'), 'Konaklama okul tarafından mı organize ediliyor?', 2, FALSE, 'neutral'),
(18, (SELECT id FROM answer_types WHERE code='boolean'), 'Bağımsız konaklama bulma desteği var mı?', 3, FALSE, 'neutral');

-- Aile Yanı Konaklama (subcategory_id = 19)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(19, (SELECT id FROM answer_types WHERE code='number'), 'Evde kaç öğrenci kalıyor?', 1, FALSE, 'lower_better', 'kişi'),
(19, (SELECT id FROM answer_types WHERE code='boolean'), 'Aynı milletten öğrenciler aynı evde kalıyor mu?', 2, FALSE, 'lower_better', NULL),
(19, (SELECT id FROM answer_types WHERE code='boolean'), 'Yemek dahil mi?', 3, FALSE, 'neutral', NULL),
(19, (SELECT id FROM answer_types WHERE code='number'), 'Haftada kaç öğün?', 4, FALSE, 'higher_better', 'öğün'),
(19, (SELECT id FROM answer_types WHERE code='boolean'), 'Ev sahibi çalışıyor mu?', 5, FALSE, 'neutral', NULL),
(19, (SELECT id FROM answer_types WHERE code='boolean'), 'Ev sahibi öğrencilerle iletişim kuruyor mu?', 6, FALSE, 'neutral', NULL),
(19, (SELECT id FROM answer_types WHERE code='boolean'), 'Evcil hayvan var mı?', 7, FALSE, 'neutral', NULL),
(19, (SELECT id FROM answer_types WHERE code='boolean'), 'Evde sigara içiliyor mu?', 8, FALSE, 'lower_better', NULL),
(19, (SELECT id FROM answer_types WHERE code='boolean'), 'Evde alkol tüketiliyor mu?', 9, FALSE, 'neutral', NULL),
(19, (SELECT id FROM answer_types WHERE code='boolean'), 'Mutfak kullanımı serbest mi?', 10, FALSE, 'neutral', NULL),
(19, (SELECT id FROM answer_types WHERE code='boolean'), 'Ev sahibi DBS kontrolünden geçirilmiş mi?', 11, FALSE, 'neutral', NULL),
(19, (SELECT id FROM answer_types WHERE code='text'), 'Aile ne sıklıkla denetleniyor?', 12, FALSE, 'neutral', NULL),
(19, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğrenci memnuniyeti anketleri yapılıyor mu?', 13, FALSE, 'neutral', NULL),
(19, (SELECT id FROM answer_types WHERE code='text'), 'Aile değiştirmek istesem süreç nasıl işliyor?', 14, FALSE, 'neutral', NULL);

-- Oda Özellikleri (subcategory_id = 20)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(20, (SELECT id FROM answer_types WHERE code='single_choice'), 'Tek kişilik mi çift kişilik mi?', 1, FALSE, 'neutral', NULL),
(20, (SELECT id FROM answer_types WHERE code='boolean'), 'Özel banyo var mı?', 2, FALSE, 'neutral', NULL),
(20, (SELECT id FROM answer_types WHERE code='number'), 'Oda büyüklüğü ne kadar?', 3, FALSE, 'higher_better', 'm²'),
(20, (SELECT id FROM answer_types WHERE code='boolean'), 'Çalışma masası var mı?', 4, FALSE, 'neutral', NULL),
(20, (SELECT id FROM answer_types WHERE code='boolean'), 'Dolap var mı?', 5, FALSE, 'neutral', NULL),
(20, (SELECT id FROM answer_types WHERE code='rating'), 'İnternet hızı nasıl?', 6, FALSE, 'higher_better', NULL),
(20, (SELECT id FROM answer_types WHERE code='boolean'), 'Odada ısıtma sistemi var mı?', 7, FALSE, 'neutral', NULL),
(20, (SELECT id FROM answer_types WHERE code='boolean'), 'Pencere var mı, oda aydınlık mı?', 8, FALSE, 'neutral', NULL),
(20, (SELECT id FROM answer_types WHERE code='single_choice'), 'Yatak boyutu nedir?', 9, FALSE, 'neutral', NULL),
(20, (SELECT id FROM answer_types WHERE code='boolean'), 'Nevresim/battaniye sağlanıyor mu?', 10, FALSE, 'neutral', NULL),
(20, (SELECT id FROM answer_types WHERE code='boolean'), 'Havlu sağlanıyor mu?', 11, FALSE, 'neutral', NULL);

-- Ev Kuralları (subcategory_id = 21)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode) VALUES
(21, (SELECT id FROM answer_types WHERE code='boolean'), 'Giriş çıkış saati var mı?', 1, FALSE, 'neutral'),
(21, (SELECT id FROM answer_types WHERE code='boolean'), 'Misafir kabul ediliyor mu?', 2, FALSE, 'neutral'),
(21, (SELECT id FROM answer_types WHERE code='boolean'), 'Evde sigara içiliyor mu?', 3, FALSE, 'lower_better'),
(21, (SELECT id FROM answer_types WHERE code='boolean'), 'Mutfak kullanımı serbest mi?', 4, FALSE, 'neutral'),
(21, (SELECT id FROM answer_types WHERE code='boolean'), 'Gürültü kısıtlaması var mı?', 5, FALSE, 'neutral'),
(21, (SELECT id FROM answer_types WHERE code='boolean'), 'Oda arkadaşı getirmek mümkün mü?', 6, FALSE, 'neutral');

-- Konaklama Lokasyonu (subcategory_id = 22)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(22, (SELECT id FROM answer_types WHERE code='number'), 'Okula uzaklık ne kadar?', 1, TRUE, 'lower_better', 'dakika'),
(22, (SELECT id FROM answer_types WHERE code='number'), 'Toplu taşıma ile kaç dakika?', 2, FALSE, 'lower_better', 'dakika'),
(22, (SELECT id FROM answer_types WHERE code='boolean'), 'Yürüyerek gidilebilir mi?', 3, FALSE, 'neutral', NULL),
(22, (SELECT id FROM answer_types WHERE code='boolean'), 'Gece ulaşımı güvenli mi?', 4, FALSE, 'neutral', NULL),
(22, (SELECT id FROM answer_types WHERE code='text'), 'Metro hattı hangisi?', 5, FALSE, 'neutral', NULL),
(22, (SELECT id FROM answer_types WHERE code='boolean'), 'Otobüs hattı var mı?', 6, FALSE, 'neutral', NULL),
(22, (SELECT id FROM answer_types WHERE code='text'), 'Zone kaç?', 7, FALSE, 'lower_better', NULL),
(22, (SELECT id FROM answer_types WHERE code='number'), 'Aylık ulaşım maliyeti ne kadar?', 8, FALSE, 'lower_better', '£');

-- Ev Sahibi (subcategory_id = 23)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode) VALUES
(23, (SELECT id FROM answer_types WHERE code='boolean'), 'Aile İngiliz mi?', 1, FALSE, 'neutral'),
(23, (SELECT id FROM answer_types WHERE code='boolean'), 'Evde İngilizce konuşuluyor mu?', 2, TRUE, 'neutral'),
(23, (SELECT id FROM answer_types WHERE code='boolean'), 'Daha önce öğrenci ağırlamışlar mı?', 3, FALSE, 'neutral'),
(23, (SELECT id FROM answer_types WHERE code='boolean'), 'Ev sahibi öğrencilerle yemek yiyor mu?', 4, FALSE, 'neutral'),
(23, (SELECT id FROM answer_types WHERE code='text'), 'Ev sahibinin mesleği nedir?', 5, FALSE, 'neutral'),
(23, (SELECT id FROM answer_types WHERE code='boolean'), 'Evde çocuk var mı?', 6, FALSE, 'neutral');

-- Yemek (subcategory_id = 24)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode) VALUES
(24, (SELECT id FROM answer_types WHERE code='boolean'), 'Kahvaltı dahil mi?', 1, FALSE, 'neutral'),
(24, (SELECT id FROM answer_types WHERE code='boolean'), 'Akşam yemeği var mı?', 2, FALSE, 'neutral'),
(24, (SELECT id FROM answer_types WHERE code='boolean'), 'Vejetaryen seçenek var mı?', 3, FALSE, 'neutral'),
(24, (SELECT id FROM answer_types WHERE code='boolean'), 'Vegan seçenek var mı?', 4, FALSE, 'neutral'),
(24, (SELECT id FROM answer_types WHERE code='boolean'), 'Helal yemek mümkün mü?', 5, FALSE, 'neutral'),
(24, (SELECT id FROM answer_types WHERE code='boolean'), 'Glutensiz seçenek var mı?', 6, FALSE, 'neutral'),
(24, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğle yemeği paketi yapılıyor mu?', 7, FALSE, 'neutral'),
(24, (SELECT id FROM answer_types WHERE code='boolean'), 'Yemek saatleri esnek mi?', 8, FALSE, 'neutral');

-- Güvenlik (subcategory_id = 25)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode) VALUES
(25, (SELECT id FROM answer_types WHERE code='boolean'), 'Ev güvenli bölgede mi?', 1, FALSE, 'neutral'),
(25, (SELECT id FROM answer_types WHERE code='single_choice'), 'Apartman mı müstakil ev mi?', 2, FALSE, 'neutral'),
(25, (SELECT id FROM answer_types WHERE code='boolean'), 'Güvenlik kamerası var mı?', 3, FALSE, 'neutral'),
(25, (SELECT id FROM answer_types WHERE code='boolean'), 'Gece güvenli mi?', 4, FALSE, 'neutral'),
(25, (SELECT id FROM answer_types WHERE code='boolean'), 'Anahtar/kart ile giriş mi?', 5, FALSE, 'neutral'),
(25, (SELECT id FROM answer_types WHERE code='boolean'), 'Oda kilitlenebiliyor mu?', 6, FALSE, 'neutral'),
(25, (SELECT id FROM answer_types WHERE code='boolean'), 'Değerli eşya için kasa var mı?', 7, FALSE, 'neutral');

-- Temizlik (subcategory_id = 26)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(26, (SELECT id FROM answer_types WHERE code='text'), 'Temizlik kim tarafından yapılıyor?', 1, FALSE, 'neutral', NULL),
(26, (SELECT id FROM answer_types WHERE code='number'), 'Haftada kaç kez temizlik?', 2, FALSE, 'higher_better', 'kez'),
(26, (SELECT id FROM answer_types WHERE code='boolean'), 'Çarşaf değişimi var mı?', 3, FALSE, 'neutral', NULL),
(26, (SELECT id FROM answer_types WHERE code='boolean'), 'Çamaşır makinesi var mı?', 4, FALSE, 'neutral', NULL),
(26, (SELECT id FROM answer_types WHERE code='boolean'), 'Kurutma makinesi var mı?', 5, FALSE, 'neutral', NULL),
(26, (SELECT id FROM answer_types WHERE code='boolean'), 'Ütü sağlanıyor mu?', 6, FALSE, 'neutral', NULL),
(26, (SELECT id FROM answer_types WHERE code='boolean'), 'Temizlik malzemeleri sağlanıyor mu?', 7, FALSE, 'neutral', NULL);

-- Konaklama Fiyatı (subcategory_id = 27)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(27, (SELECT id FROM answer_types WHERE code='number'), 'Haftalık konaklama ücreti', 1, TRUE, 'lower_better', '£'),
(27, (SELECT id FROM answer_types WHERE code='text'), 'Fiyata dahil olanlar', 2, FALSE, 'neutral', NULL),
(27, (SELECT id FROM answer_types WHERE code='number'), 'Depozito var mı?', 3, FALSE, 'lower_better', '£'),
(27, (SELECT id FROM answer_types WHERE code='text'), 'Depozito iadesi nasıl oluyor?', 4, FALSE, 'neutral', NULL),
(27, (SELECT id FROM answer_types WHERE code='boolean'), 'Ekstra fatura var mı?', 5, FALSE, 'lower_better', NULL),
(27, (SELECT id FROM answer_types WHERE code='boolean'), 'Faturalar fiyata dahil mi?', 6, FALSE, 'neutral', NULL),
(27, (SELECT id FROM answer_types WHERE code='boolean'), 'Council tax öğrenciden alınıyor mu?', 7, FALSE, 'lower_better', NULL),
(27, (SELECT id FROM answer_types WHERE code='boolean'), 'Yaz dönemi fiyat farkı var mı?', 8, FALSE, 'neutral', NULL);

-- Konaklama Sözleşmesi (subcategory_id = 28)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(28, (SELECT id FROM answer_types WHERE code='number'), 'Minimum konaklama süresi', 1, FALSE, 'neutral', 'hafta'),
(28, (SELECT id FROM answer_types WHERE code='boolean'), 'Erken çıkış cezası var mı?', 2, FALSE, 'lower_better', NULL),
(28, (SELECT id FROM answer_types WHERE code='boolean'), 'Ev değişimi mümkün mü?', 3, FALSE, 'neutral', NULL),
(28, (SELECT id FROM answer_types WHERE code='boolean'), 'Alternatif konaklama sunuluyor mu?', 4, FALSE, 'neutral', NULL),
(28, (SELECT id FROM answer_types WHERE code='boolean'), 'Sözleşme İngilizce mi?', 5, FALSE, 'neutral', NULL),
(28, (SELECT id FROM answer_types WHERE code='text'), 'Sözleşme fesih süreci nasıl?', 6, FALSE, 'neutral', NULL),
(28, (SELECT id FROM answer_types WHERE code='boolean'), 'Uzatma opsiyonu var mı?', 7, FALSE, 'neutral', NULL);

-- Sağlık ve Sigorta (subcategory_id = 29)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode) VALUES
(29, (SELECT id FROM answer_types WHERE code='boolean'), 'Okul sağlık sigortası düzenliyor mu?', 1, FALSE, 'neutral'),
(29, (SELECT id FROM answer_types WHERE code='boolean'), 'Sağlık sigortası zorunlu mu?', 2, FALSE, 'neutral'),
(29, (SELECT id FROM answer_types WHERE code='boolean'), 'NHS kaydı konusunda yardım var mı?', 3, FALSE, 'neutral'),
(29, (SELECT id FROM answer_types WHERE code='boolean'), 'İlk yardım eğitimli personel var mı?', 4, FALSE, 'neutral'),
(29, (SELECT id FROM answer_types WHERE code='boolean'), 'Okulda ilk yardım seti/odası var mı?', 5, FALSE, 'neutral'),
(29, (SELECT id FROM answer_types WHERE code='number'), 'En yakın hastane/klinik uzaklığı?', 6, FALSE, 'lower_better'),
(29, (SELECT id FROM answer_types WHERE code='boolean'), 'Diş sağlığı sigortası dahil mi?', 7, FALSE, 'neutral');
