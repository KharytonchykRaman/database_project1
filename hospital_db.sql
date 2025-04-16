DROP TABLE IF EXISTS поставки;
DROP TABLE IF EXISTS лекарства;
DROP TABLE IF EXISTS пациенты;
DROP TABLE IF EXISTS персонал;

CREATE TABLE персонал (
    id INT IDENTITY(1,1) PRIMARY KEY,
    имя NVARCHAR(50) NOT NULL,
    фамилия NVARCHAR(50) NOT NULL,
    должность NVARCHAR(50) NOT NULL,
    дата_рождения DATE,
    зарплата DECIMAL(10, 2)
);

CREATE TABLE пациенты (
    id INT IDENTITY(1,1) PRIMARY KEY,
    имя NVARCHAR(50) NOT NULL,
    фамилия NVARCHAR(50) NOT NULL,
    дата_рождения DATE,
    адрес NVARCHAR(100),
    телефон NVARCHAR(15)
);

CREATE TABLE лекарства (
    id INT IDENTITY(1,1) PRIMARY KEY,
    название NVARCHAR(100) NOT NULL,
    производитель NVARCHAR(100),
    цена DECIMAL(10, 2),
    количество INT
);

CREATE TABLE поставки (
    id INT IDENTITY(1,1) PRIMARY KEY,
    лекарство_id INT,
    дата_поставки DATE,
    количество INT,
    FOREIGN KEY (лекарство_id) REFERENCES лекарства(id)
);

INSERT INTO персонал (имя, фамилия, должность, дата_рождения, зарплата)
VALUES 
('Иван', 'Иванов', 'Врач', '1980-05-15', 75000.00),
('Мария', 'Петрова', 'Медсестра', '1990-08-22', 45000.00),
('Алексей', 'Сидоров', 'Администратор', '1985-03-10', 60000.00);

INSERT INTO пациенты (имя, фамилия, дата_рождения, адрес, телефон)
VALUES 
('Анна', 'Кузнецова', '1975-11-20', 'ул. Лесная, 15', '+79123456789'),
('Петр', 'Васильев', '1968-07-05', 'ул. Центральная, 45', '+79098765432'),
('Елена', 'Морозова', '1992-02-14', 'ул. Солнечная, 8', '+79152345678');

INSERT INTO лекарства (название, производитель, цена, количество)
VALUES 
('Аспирин', 'Фармстандарт', 50.00, 200),
('Парацетамол', 'Озон', 30.00, 300),
('Нурофен', 'Reckitt Benckiser', 120.00, 150);

INSERT INTO поставки (лекарство_id, дата_поставки, количество)
VALUES 
(1, '2023-10-01', 50),
(2, '2023-10-02', 100),
(3, '2023-10-03', 75);

SELECT * FROM персонал;

UPDATE персонал
SET имя = 'Петр', фамилия = 'Сидоренко'
WHERE id = 1;

SELECT * FROM персонал;
SELECT * FROM пациенты;
SELECT * FROM лекарства;	
SELECT * FROM поставки;

SELECT лекарства.название, поставки.количество, поставки.дата_поставки 
FROM поставки INNER JOIN лекарства ON лекарства.id = поставки.лекарство_id;

select * from лекарства where id = 1;

select sum(цена) as [цена лекарств] from лекарства;

select count(количество) as [количество лекарств] from лекарства;

select * from лекарства where название like '%а%';

SELECT название
FROM лекарства
WHERE цена = (SELECT MIN(цена) FROM лекарства);

select * from лекарства where цена > 100;

