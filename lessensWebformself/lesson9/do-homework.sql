-- 1 Èç òàáëèöû orders âûáåðèòå âñå ñóììû äî 1000. Èñïîëüçóéòå ôóíêöèþ REGEXP. Ïîñòàðàéòåñü ïîëó÷èòü ðåçóëüòàò, èñïîëüçóÿ 2 ðàçíûõ øàáëîíà.
SELECT amt FROM orders WHERE amt REGEXP '^.{1,6}$';
SELECT amt FROM orders WHERE amt REGEXP '^[0-9]{1,3}\.[0-9]{2}$';

-- 2 Èç òàáëèöû salers âûáåðèòå âñå ãîðîäà, ñîñòîÿùèå èç äâóõ ñëîâ.
SELECT DISTINCT city FROM salers WHERE city REGEXP ' ';

-- 3 Èç òàáëèöû salers ïîëó÷èòå âñå ðÿäû, ãäå èìåíà ïðîäàâöîâ è íàçâàíèÿ ãîðîäîâ íå ïðåâûøàþò 6 ñèìâîëîâ
-- SELECT * FROM salers WHERE sname REGEXP '^.{1,6}$' AND city REGEXP '^.{1,6}$';
SELECT * FROM salers WHERE sname REGEXP '^([a-z]{1,6}|[à-ÿÀ-ß]{1,12})$' AND city REGEXP '^([a-z]{1,6}|[à-ÿÀ-ß]{1,12})$';
SELECT * FROM salers WHERE (sname REGEXP '^[a-z]{1,6}$' AND city REGEXP '^[a-z]{1,6}$') OR (sname REGEXP '^[à-ÿÀ-ß]{1,12}$' AND city REGEXP '^[à-ÿÀ-ß]{1,12}$');

-- 4 Ïîëó÷èòå èç òàáëèöû orders âñå ñóììû áåç äðîáíîé ÷àñòè (ñ îêðóãëåíèåì)
SELECT amt, ROUND(amt, 0) FROM orders;

-- 5 Ïîëó÷èòå èç òàáëèöû orders âñå ñóììû áåç äðîáíîé ÷àñòè (áåç îêðóãëåíèÿ)
SELECT amt, TRUNCATE(amt, 0) FROM orders;