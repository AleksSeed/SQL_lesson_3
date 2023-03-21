--Задание 1
--1)
CREATE TABLE city (city_id BIGSERIAL NOT NULL PRIMARY KEY, city_name VARCHAR(50) NOT NULL);
--2)
ALTER TABLE employee ADD city_id BIGINT;
--3)
ALTER TABLE employee ADD FOREIGN KEY (city_id) REFERENCES city (city_id);
--4)
INSERT INTO city (city_name) VALUES ('Псков');
UPDATE employee SET city_id = (SELECT c.city_id FROM city c WHERE c.city_name = 'Псков') WHERE last_name = 'Pushkin';

INSERT INTO city (city_name) VALUES ('Великий Новгород');
UPDATE employee SET city_id = (SELECT c.city_id FROM city c WHERE c.city_name = 'Великий Новгород') WHERE last_name = 'Sestricova';

INSERT INTO city (city_name) VALUES ('Орёл');
UPDATE employee SET city_id = (SELECT c.city_id FROM city c WHERE c.city_name = 'Орёл') WHERE last_name = 'Kozulin';

INSERT INTO city (city_name) VALUES ('Москва');
UPDATE employee SET city_id = (SELECT c.city_id FROM city c WHERE c.city_name = 'Москва') WHERE last_name = 'Pupkin';

INSERT INTO city (city_name) VALUES ('Тверь');
UPDATE employee SET city_id = (SELECT c.city_id FROM city c WHERE c.city_name = 'Тверь') WHERE last_name = 'Potapov';

INSERT INTO city (city_name) VALUES ('Валдай');

--Задание 2
--1)
SELECT e.first_name Имя, e.last_name  Фамилия, c.city_name  Город FROM employee e
	LEFT JOIN city c ON e.city_id = c.city_id;
--2)
SELECT c.city_name  Город, e.first_name Имя, e.last_name  Фамилия FROM employee e
    RIGHT JOIN city c ON e.city_id = c.city_id;
--3)
SELECT c.city_name  Город, e.first_name Имя, e.last_name  Фамилия FROM employee e
    FULL JOIN city c ON e.city_id = c.city_id;
--4)
SELECT e.first_name Имя, e.last_name  Фамилия, c.city_name  Город FROM employee e
    CROSS JOIN city c ORDER BY Фамилия;
--5)
select * from city
left join employee using (city_id) where id is null


