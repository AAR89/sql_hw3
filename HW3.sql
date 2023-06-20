CREATE DATABASE IF NOT EXISTS lesson3; -- создание БД если она не существует.
USE lesson3;
DROP TABLE IF EXISTS staff;
CREATE TABLE staff

(
	id INT PRIMARY KEY AUTO_INCREMENT,
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	post VARCHAR(45),
	seniority INT,
    salary DECIMAL(8,2),
    age INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', 40, 100000, 60),
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Шура', 'Сапсасин', 'Инженер', 2, 56000, 23),
('Сагашвили', 'Сасучевара', 'Инженер', 1, 53000, 24),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
SELECT * FROM staff;

-- ORDER BY _ сортировка , GROUP BY _ группировка

SELECT
	id,
	salary,
    post,
	CONCAT(firstname," ", lastname) AS fullname -- "Вася" + " " + "Петров" = "Вася Петров"
FROM staff
ORDER BY salary DESC -- Автоматически идет сортировка по воз-ю, DESC - по убыванию
LIMIT 5;

SELECT
id,
salary,
firstname,
lastname
FROM staff
ORDER BY lastname DESC,firstname DESC, salary;


-- Выведите 5 максимальных заработных плат (saraly)
SELECT DISTINCT lastname
FROM staff
ORDER BY lastname
LIMIT 5;

-- Группировка
-- Для каждой отдельно взятой должности найдем 
-- среднюю ЗП, мин и макс ЗП, разницу между макс и мин ЗП, количество сотрудников 

SELECT
	post,
    ROUND(AVG(salary), 2) AS avg_s,
    ROUND(SUM(salary)) AS sum_s,
    COUNT(salary) AS count_s,
MAX(salary),
MIN(salary),
MAX(salary) - MIN(salary) AS Difference
FROM staff
WHERE post NOT IN ("Уборщик") -- post != "Начальник" OR post != "Уборщик"
GROUP BY post
HAVING AVG(salary) > 25000;


-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
select * From staff
WHERE post = "РАбочий" AND age >= 24 and age <= 49;


-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT
	post,
    ROUND(AVG(salary), 2) AS avg_s,
    ROUND(SUM(salary)) AS sum_s,
    COUNT(salary) AS count_s,
MAX(salary),
MIN(salary),
MAX(salary) - MIN(salary) AS Difference
FROM staff
GROUP BY post;

--  Найдите количество специальностей
SELECT DISTINCT post
FROM staff
ORDER BY post;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
SELECT
	post,
    ROUND(AVG(age)) AS avg_s
FROM staff
GROUP BY post
HAVING AVG(age) < 30;