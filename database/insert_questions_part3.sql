-- =====================================================
-- SORULAR - Bölüm 3: Sosyal Aktiviteler - Destek - Ücretler - İade - Vize - Sertifika - Online
-- =====================================================

-- Sosyal Aktiviteler (subcategory_id = 9)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode) VALUES
(9, (SELECT id FROM answer_types WHERE code='boolean'), 'Haftalık aktivite programı var mı?', 1, FALSE, 'neutral'),
(9, (SELECT id FROM answer_types WHERE code='boolean'), 'Aktiviteler ücretsiz mi?', 2, FALSE, 'neutral'),
(9, (SELECT id FROM answer_types WHERE code='boolean'), 'Şehir gezileri düzenleniyor mu?', 3, FALSE, 'neutral'),
(9, (SELECT id FROM answer_types WHERE code='boolean'), 'Networking etkinlikleri var mı?', 4, FALSE, 'neutral'),
(9, (SELECT id FROM answer_types WHERE code='boolean'), 'Spor aktiviteleri var mı?', 5, FALSE, 'neutral'),
(9, (SELECT id FROM answer_types WHERE code='boolean'), 'Pub night etkinlikleri var mı?', 6, FALSE, 'neutral'),
(9, (SELECT id FROM answer_types WHERE code='boolean'), 'Kültürel etkinlikler var mı?', 7, FALSE, 'neutral'),
(9, (SELECT id FROM answer_types WHERE code='boolean'), 'Üniversite ziyaretleri düzenleniyor mu?', 8, FALSE, 'neutral'),
(9, (SELECT id FROM answer_types WHERE code='boolean'), 'Hafta sonu gezileri düzenleniyor mu?', 9, FALSE, 'neutral'),
(9, (SELECT id FROM answer_types WHERE code='boolean'), 'Film/belgesel gösterimi var mı?', 10, FALSE, 'neutral'),
(9, (SELECT id FROM answer_types WHERE code='boolean'), 'Yemek pişirme etkinliği var mı?', 11, FALSE, 'neutral'),
(9, (SELECT id FROM answer_types WHERE code='boolean'), 'Gönüllülük programları var mı?', 12, FALSE, 'neutral'),
(9, (SELECT id FROM answer_types WHERE code='boolean'), 'Müze/galeri ziyaretleri düzenleniyor mu?', 13, FALSE, 'neutral'),
(9, (SELECT id FROM answer_types WHERE code='boolean'), 'Tandem partner programı var mı?', 14, FALSE, 'neutral');

-- Öğrenci Profili (subcategory_id = 10)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(10, (SELECT id FROM answer_types WHERE code='number'), 'Öğrencilerin yaş ortalaması nedir?', 1, FALSE, 'neutral', 'yaş'),
(10, (SELECT id FROM answer_types WHERE code='text'), 'En çok hangi ülkelerden öğrenci geliyor?', 2, FALSE, 'neutral', NULL),
(10, (SELECT id FROM answer_types WHERE code='number'), 'Türk öğrenci oranı nedir?', 3, TRUE, 'lower_better', '%'),
(10, (SELECT id FROM answer_types WHERE code='single_choice'), 'Üniversite öğrencileri mi profesyoneller mi?', 4, FALSE, 'neutral', NULL),
(10, (SELECT id FROM answer_types WHERE code='text'), 'Ortalama yaş aralığı nedir?', 5, FALSE, 'neutral', NULL),
(10, (SELECT id FROM answer_types WHERE code='single_choice'), 'Uzun dönem öğrenciler mi kısa dönem öğrenciler mi?', 6, FALSE, 'neutral', NULL),
(10, (SELECT id FROM answer_types WHERE code='text'), 'Dil seviyesi dağılımı nasıl?', 7, FALSE, 'neutral', NULL),
(10, (SELECT id FROM answer_types WHERE code='number'), 'Toplam aktif öğrenci sayısı nedir?', 8, FALSE, 'neutral', 'kişi'),
(10, (SELECT id FROM answer_types WHERE code='number'), 'Yaz döneminde öğrenci sayısı ne kadar artıyor?', 9, FALSE, 'neutral', '%'),
(10, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğrenci sirkülasyonu yüksek mi?', 10, FALSE, 'lower_better', NULL);

-- Okul Lokasyonu (subcategory_id = 11)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(11, (SELECT id FROM answer_types WHERE code='text'), 'Okul hangi bölgede?', 1, TRUE, 'neutral', NULL),
(11, (SELECT id FROM answer_types WHERE code='number'), 'Merkeze uzaklığı ne kadar?', 2, FALSE, 'lower_better', 'dakika'),
(11, (SELECT id FROM answer_types WHERE code='rating'), 'Toplu taşıma erişimi nasıl?', 3, FALSE, 'higher_better', NULL),
(11, (SELECT id FROM answer_types WHERE code='boolean'), 'Güvenli bir bölgede mi?', 4, FALSE, 'neutral', NULL),
(11, (SELECT id FROM answer_types WHERE code='number'), 'Metro istasyonuna kaç dakika?', 5, FALSE, 'lower_better', 'dakika'),
(11, (SELECT id FROM answer_types WHERE code='text'), 'Hangi metro hattı?', 6, FALSE, 'neutral', NULL),
(11, (SELECT id FROM answer_types WHERE code='boolean'), 'Çevrede kafe ve restoran var mı?', 7, FALSE, 'neutral', NULL),
(11, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğrenci yoğun bir bölge mi?', 8, FALSE, 'neutral', NULL),
(11, (SELECT id FROM answer_types WHERE code='boolean'), 'Çevrede market/süpermarket var mı?', 9, FALSE, 'neutral', NULL),
(11, (SELECT id FROM answer_types WHERE code='single_choice'), 'Okul binası tarihi mi modern mi?', 10, FALSE, 'neutral', NULL),
(11, (SELECT id FROM answer_types WHERE code='boolean'), 'Park/yeşil alan yakın mı?', 11, FALSE, 'neutral', NULL),
(11, (SELECT id FROM answer_types WHERE code='rating'), 'Hava kalitesi nasıl?', 12, FALSE, 'higher_better', NULL);

-- Destek Hizmetleri (subcategory_id = 12)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode) VALUES
(12, (SELECT id FROM answer_types WHERE code='boolean'), 'Havaalanı transferi var mı?', 1, FALSE, 'neutral'),
(12, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğrenci danışmanı var mı?', 2, FALSE, 'neutral'),
(12, (SELECT id FROM answer_types WHERE code='boolean'), 'CV hazırlama desteği var mı?', 3, FALSE, 'neutral'),
(12, (SELECT id FROM answer_types WHERE code='boolean'), 'Part-time iş bulma desteği var mı?', 4, FALSE, 'neutral'),
(12, (SELECT id FROM answer_types WHERE code='boolean'), 'Psikolojik destek var mı?', 5, FALSE, 'neutral'),
(12, (SELECT id FROM answer_types WHERE code='boolean'), 'Acil durum hattı var mı?', 6, FALSE, 'neutral'),
(12, (SELECT id FROM answer_types WHERE code='boolean'), 'Banka hesabı açma desteği var mı?', 7, FALSE, 'neutral'),
(12, (SELECT id FROM answer_types WHERE code='boolean'), 'GP kaydı desteği var mı?', 8, FALSE, 'neutral'),
(12, (SELECT id FROM answer_types WHERE code='boolean'), 'NI numarası başvuru desteği var mı?', 9, FALSE, 'neutral'),
(12, (SELECT id FROM answer_types WHERE code='boolean'), 'BRP teslim adresi olarak okul kullanılabiliyor mu?', 10, FALSE, 'neutral'),
(12, (SELECT id FROM answer_types WHERE code='boolean'), 'Türkçe konuşan personel var mı?', 11, FALSE, 'neutral'),
(12, (SELECT id FROM answer_types WHERE code='boolean'), 'WhatsApp/Telegram destek grubu var mı?', 12, FALSE, 'neutral');

-- Ücretler (subcategory_id = 13)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode, unit) VALUES
(13, (SELECT id FROM answer_types WHERE code='number'), 'Kurs ücreti haftalık ne kadar?', 1, TRUE, 'lower_better', '£'),
(13, (SELECT id FROM answer_types WHERE code='number'), 'Kayıt ücreti var mı?', 2, FALSE, 'lower_better', '£'),
(13, (SELECT id FROM answer_types WHERE code='number'), 'Materyal ücreti var mı?', 3, FALSE, 'lower_better', '£'),
(13, (SELECT id FROM answer_types WHERE code='boolean'), 'Aktivite ücretleri ekstra mı?', 4, FALSE, 'lower_better', NULL),
(13, (SELECT id FROM answer_types WHERE code='boolean'), 'Uzun dönem indirimleri var mı?', 5, FALSE, 'neutral', NULL),
(13, (SELECT id FROM answer_types WHERE code='boolean'), 'Erken kayıt indirimi var mı?', 6, FALSE, 'neutral', NULL),
(13, (SELECT id FROM answer_types WHERE code='boolean'), 'Acenta indirimi var mı?', 7, FALSE, 'neutral', NULL),
(13, (SELECT id FROM answer_types WHERE code='boolean'), 'Ödeme planı var mı?', 8, FALSE, 'neutral', NULL),
(13, (SELECT id FROM answer_types WHERE code='boolean'), 'Kur farkı riski var mı?', 9, FALSE, 'neutral', NULL),
(13, (SELECT id FROM answer_types WHERE code='boolean'), 'Kredi kartı ile ödeme yapılabiliyor mu?', 10, FALSE, 'neutral', NULL),
(13, (SELECT id FROM answer_types WHERE code='boolean'), 'Taksit seçeneği var mı?', 11, FALSE, 'neutral', NULL),
(13, (SELECT id FROM answer_types WHERE code='boolean'), 'Fiyata KDV dahil mi?', 12, FALSE, 'neutral', NULL),
(13, (SELECT id FROM answer_types WHERE code='boolean'), 'Gizli ücret var mı?', 13, FALSE, 'lower_better', NULL),
(13, (SELECT id FROM answer_types WHERE code='boolean'), 'Fiyat garantisi var mı?', 14, FALSE, 'neutral', NULL);

-- İade ve İptal Politikası (subcategory_id = 14)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode) VALUES
(14, (SELECT id FROM answer_types WHERE code='boolean'), 'Kurs başlamadan iptal edersem tam iade var mı?', 1, FALSE, 'neutral'),
(14, (SELECT id FROM answer_types WHERE code='text'), 'Kurs başladıktan sonra iade politikası nedir?', 2, FALSE, 'neutral'),
(14, (SELECT id FROM answer_types WHERE code='number'), 'Kaç gün önceden iptal bildirimi gerekiyor?', 3, FALSE, 'lower_better'),
(14, (SELECT id FROM answer_types WHERE code='boolean'), 'Vize reddinde tam iade var mı?', 4, TRUE, 'neutral'),
(14, (SELECT id FROM answer_types WHERE code='boolean'), 'Hastalık durumunda ders dondurma mümkün mü?', 5, FALSE, 'neutral'),
(14, (SELECT id FROM answer_types WHERE code='boolean'), 'Kalan süre başka tarihe aktarılabiliyor mu?', 6, FALSE, 'neutral'),
(14, (SELECT id FROM answer_types WHERE code='number'), 'İade süreci kaç gün sürüyor?', 7, FALSE, 'lower_better');

-- Vize Desteği (subcategory_id = 15)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode) VALUES
(15, (SELECT id FROM answer_types WHERE code='boolean'), 'Öğrenci vizesi için belge veriliyor mu?', 1, TRUE, 'neutral'),
(15, (SELECT id FROM answer_types WHERE code='boolean'), 'Vize reddinde ücret iadesi var mı?', 2, TRUE, 'neutral'),
(15, (SELECT id FROM answer_types WHERE code='boolean'), 'Vize danışmanlığı veriliyor mu?', 3, FALSE, 'neutral'),
(15, (SELECT id FROM answer_types WHERE code='boolean'), 'Sponsor letter veriliyor mu?', 4, FALSE, 'neutral'),
(15, (SELECT id FROM answer_types WHERE code='boolean'), 'CAS düzenleniyor mu?', 5, FALSE, 'neutral'),
(15, (SELECT id FROM answer_types WHERE code='boolean'), 'Okulun Student Route sponsor lisansı var mı?', 6, TRUE, 'neutral'),
(15, (SELECT id FROM answer_types WHERE code='boolean'), 'Devam takibi UKVI''ye bildiriliyor mu?', 7, FALSE, 'neutral'),
(15, (SELECT id FROM answer_types WHERE code='boolean'), 'Vize uzatma desteği var mı?', 8, FALSE, 'neutral');

-- Sertifika ve Diploma (subcategory_id = 16)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode) VALUES
(16, (SELECT id FROM answer_types WHERE code='boolean'), 'Kurs sonunda sertifika veriliyor mu?', 1, FALSE, 'neutral'),
(16, (SELECT id FROM answer_types WHERE code='boolean'), 'Sertifika uluslararası geçerliliği var mı?', 2, FALSE, 'neutral'),
(16, (SELECT id FROM answer_types WHERE code='boolean'), 'Sertifikada seviye ve saat bilgisi yazıyor mu?', 3, FALSE, 'neutral'),
(16, (SELECT id FROM answer_types WHERE code='boolean'), 'Attendance certificate ayrıca veriliyor mu?', 4, FALSE, 'neutral'),
(16, (SELECT id FROM answer_types WHERE code='single_choice'), 'Sertifika dijital mi basılı mı?', 5, FALSE, 'neutral'),
(16, (SELECT id FROM answer_types WHERE code='boolean'), 'Üniversite başvurularında geçerli mi?', 6, FALSE, 'neutral');

-- Online ve Hibrit Eğitim (subcategory_id = 17)
INSERT INTO questions (subcategory_id, answer_type_id, question_text, display_order, is_critical, comparison_mode) VALUES
(17, (SELECT id FROM answer_types WHERE code='boolean'), 'Online ders seçeneği var mı?', 1, FALSE, 'neutral'),
(17, (SELECT id FROM answer_types WHERE code='boolean'), 'Hibrit model var mı?', 2, FALSE, 'neutral'),
(17, (SELECT id FROM answer_types WHERE code='boolean'), 'Devamsızlık yapılan derslerin kaydı izlenebilir mi?', 3, FALSE, 'neutral'),
(17, (SELECT id FROM answer_types WHERE code='boolean'), 'Kurs öncesi online hazırlık programı var mı?', 4, FALSE, 'neutral'),
(17, (SELECT id FROM answer_types WHERE code='boolean'), 'Kurs sonrası online follow-up var mı?', 5, FALSE, 'neutral'),
(17, (SELECT id FROM answer_types WHERE code='boolean'), 'Online platformda ödev takibi yapılıyor mu?', 6, FALSE, 'neutral'),
(17, (SELECT id FROM answer_types WHERE code='boolean'), 'Mobil uygulama var mı?', 7, FALSE, 'neutral');
