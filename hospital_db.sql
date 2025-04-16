DROP TABLE IF EXISTS ��������;
DROP TABLE IF EXISTS ���������;
DROP TABLE IF EXISTS ��������;
DROP TABLE IF EXISTS ��������;

CREATE TABLE �������� (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ��� NVARCHAR(50) NOT NULL,
    ������� NVARCHAR(50) NOT NULL,
    ��������� NVARCHAR(50) NOT NULL,
    ����_�������� DATE,
    �������� DECIMAL(10, 2)
);

CREATE TABLE �������� (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ��� NVARCHAR(50) NOT NULL,
    ������� NVARCHAR(50) NOT NULL,
    ����_�������� DATE,
    ����� NVARCHAR(100),
    ������� NVARCHAR(15)
);

CREATE TABLE ��������� (
    id INT IDENTITY(1,1) PRIMARY KEY,
    �������� NVARCHAR(100) NOT NULL,
    ������������� NVARCHAR(100),
    ���� DECIMAL(10, 2),
    ���������� INT
);

CREATE TABLE �������� (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ���������_id INT,
    ����_�������� DATE,
    ���������� INT,
    FOREIGN KEY (���������_id) REFERENCES ���������(id)
);

INSERT INTO �������� (���, �������, ���������, ����_��������, ��������)
VALUES 
('����', '������', '����', '1980-05-15', 75000.00),
('�����', '�������', '���������', '1990-08-22', 45000.00),
('�������', '�������', '�������������', '1985-03-10', 60000.00);

INSERT INTO �������� (���, �������, ����_��������, �����, �������)
VALUES 
('����', '���������', '1975-11-20', '��. ������, 15', '+79123456789'),
('����', '��������', '1968-07-05', '��. �����������, 45', '+79098765432'),
('�����', '��������', '1992-02-14', '��. ���������, 8', '+79152345678');

INSERT INTO ��������� (��������, �������������, ����, ����������)
VALUES 
('�������', '������������', 50.00, 200),
('�����������', '����', 30.00, 300),
('�������', 'Reckitt Benckiser', 120.00, 150);

INSERT INTO �������� (���������_id, ����_��������, ����������)
VALUES 
(1, '2023-10-01', 50),
(2, '2023-10-02', 100),
(3, '2023-10-03', 75);

SELECT * FROM ��������;

UPDATE ��������
SET ��� = '����', ������� = '���������'
WHERE id = 1;

SELECT * FROM ��������;
SELECT * FROM ��������;
SELECT * FROM ���������;	
SELECT * FROM ��������;

SELECT ���������.��������, ��������.����������, ��������.����_�������� 
FROM �������� INNER JOIN ��������� ON ���������.id = ��������.���������_id;

select * from ��������� where id = 1;

select sum(����) as [���� ��������] from ���������;

select count(����������) as [���������� ��������] from ���������;

select * from ��������� where �������� like '%�%';

SELECT ��������
FROM ���������
WHERE ���� = (SELECT MIN(����) FROM ���������);

select * from ��������� where ���� > 100;

