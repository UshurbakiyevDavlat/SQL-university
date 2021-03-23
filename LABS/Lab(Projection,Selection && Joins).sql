-- Database: lab6

-- DROP DATABASE lab6;

CREATE DATABASE lab6
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Kazakh_Kazakhstan.utf8'
    LC_CTYPE = 'Kazakh_Kazakhstan.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	CREATE TABLE Students(
	stud_id int PRIMARY KEY,
	fname varchar(20),
	lname varchar(20)
	);

	CREATE TABLE Departments(
	dep_id int PRIMARY KEY,
	name varchar(10)
	);
	
	CREATE TABLE Teachers(
	teach_id int PRIMARY KEY,
	fname varchar(20),
	lname varchar(20),
	dep_id int REFERENCES Departments(dep_id)
	);

INSERT INTO Students VALUES (1,'A','A'), (2,'B','B');
INSERT INTO Departments VALUES (1,'AAA'), (2,'BBB');
INSERT INTO Teachers VALUES (1,'B','B', 2), (2,'C','C', 2), (3,'D','D', null);
select *from Departments
//2
Select * FROM Students;
SELECT lname  FROM Students;
//3
Select * FROM Teachers;
SELECT lname FROM Teachers;

//4
SELECT fname,lname FROM Students 
UNION
SELECT fname,lname FROM Teachers;
//5
SELECT fname,lname FROM Students
EXCEPT 
SELECT fname,lname FROM Teachers;

//6
SELECT fname,lname FROM Students
INTERSECT 
SELECT fname,lname FROM Teachers;

//7
SELECT Teachers.lname,Departments.name
FROM Teachers
INNER JOIN Departments
ON Teachers.dep_id = Departments.dep_id;

///8

SELECT Teachers.lname,Departments.name
FROM Teachers
LEFT JOIN Departments
ON Teachers.dep_id = Departments.dep_id;

///9
SELECT Teachers.lname,Departments.name
FROM Teachers
RIGHT JOIN Departments
ON Teachers.dep_id = Departments.dep_id;

///10
SELECT Teachers.lname,Departments.name
FROM Teachers
FULL OUTER JOIN Departments
ON Teachers.dep_id = Departments.dep_id;
select *from Departments
SELECT *FROM Students
/////7 lab
//1
SELECT *FROM Teachers teacher
//2
SELECT name FROM Teachers t INNER JOIN Departments d ON t.dep_id = d.dep_id;

//3 
SELECT fname || lname AS Result FROM Teachers  

//4
SELECT DISTINCT name FROM Departments Teachers

//5
SELECT dep_id FROM Teachers Where dep_id IS NULL
Select dep_id FROM Teachers Where dep_id IS NOT NULL

//6
SELECT dep_id from Teachers where dep_id >= 2 AND dep_id <10

//7
SELECT dep_id from Teachers where dep_id BETWEEN 2.0 AND 4.0


//8
Select fname from Teachers where fname LIKE 'B%'

//9
Select name from Departments where name LIKE '_AA'

//10
SELECT CAST ('2'AS INTEGER)