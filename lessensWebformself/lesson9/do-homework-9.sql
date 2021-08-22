-- 1 Самостоятельно рассмотрите функции TO_DAYS() и DATEDIFF()

-- 2 Найдите количество дней между датами первой и последней продаж таблицы orders. Результат постарайтесь получить двумя различными способами
SELECT DATEDIFF(MAX(odate), MIN(odate)) AS res FROM orders;
SELECT (TO_DAYS(MAX(odate)) - TO_DAYS(MIN(odate))) AS res FROM orders;

-- 3 Из таблицы orders получите результат в 2 колонки: в первой даты должны находиться в исходном виде, во второй они должны иметь вид - 10 Марта 1990 года. Результат должен быть примерно таким: 1990-03-10 | 10 Марта 1990 года
SET lc_time_names = 'ru_RU';
SELECT odate, CONCAT(DATE_FORMAT(odate, '%e %M %Y'), ' года') FROM orders;

-- 4 Подсчитайте сколько дней прошло с начала Нового года и до текущего момента. Результат получите двумя способами
SELECT DATEDIFF(NOW(), '2012-01-01');
SELECT TO_DAYS(NOW()) - TO_DAYS('2012-01-01');