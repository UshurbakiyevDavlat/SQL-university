-- Database: UniversityForLab8

-- DROP DATABASE "UniversityForLab8";

CREATE DATABASE "UniversityForLab8"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Kazakh_Kazakhstan.utf8'
    LC_CTYPE = 'Kazakh_Kazakhstan.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	
	SELECT *FROM students
	SELECT *FROM groups
	SELECT *FROM majors
	SELECT *FROM progress
	SELECT *FROM teachers
	SELECT *FROM departments
	SELECT *FROM ed_process
	
	INSERT INTO teachers VALUES(5,'Moldir','Aristanovna',234567,'mold2000@gmail.com','Senior lecturer',2);
	INSERT INTO teachers VALUES(6,'Togzhan','Turan',562673,'turantxx2000@gmail.com','Senior lecturer',2),(7,'Malika','Tokhtieva',341241,'nellieva@gmail.com','Senior lecturer',2);
	INSERT INTO teachers VALUES(8,'Moldir','Aristanovna',234567,'mold2000@gmail.com','Senior lecturer',3),
	(9,'Alina','Baibulat',123,'animeGirls@gmail.com','Senior lecturer',3),
	(10,'Saida','Khalim',24421,'Ujs@gmail.com','Senior lecturer',3),
	(11,'Sofiya','Aliyanova',5625234,'NoErke@gmail.com','Senior lecturer',3);
	
	INSERT INTO students VALUES(9,'ALLADIN','ALLLLLAADIIIINOOOVKO',null,241241,'al@gmail.com',9);
	
	INSERT INTO progress VALUES
	(5,4,8,76,75,75,80,75),
	(6,4,6,30,30,30,30,30),
	(7,4,5,80,80,80,90,85),
	(8,4,4,100,100,100,100,100)
	
	
	
	//1
	SELECT s.lname, g.group_name
	FROM students s ,groups g
	WHERE s.group_id = g.group_id
	AND g.major_id IN (
	SELECT m.major_id 
		FROM majors m
		WHERE g.major_id = m.major_id AND m.major_name = 'CSSE'
	)		
	
	//2 
	
	SELECT s.stud_id, p.final
	FROM students s , progress p 
	WHERE s.stud_id = p.stud_id 
	AND p.final > (SELECT avg(p.final) FROM progress p)
	
	//3 
	
	SELECT t.lname, d.dep_name
	FROM teachers t, departments d
	WHERE t.dep_id = d.dep_id
	AND t.dep_id IN(
	SELECT d.dep_id 
		FROM departments d
		 WHERE d.dep_id = 1 or d.dep_id = 2 
	)
	
	// 4
	SELECT s.lname,p.final
	FROM students s , progress p
	WHERE p.stud_id = s.stud_id
	and p.final NOT IN(
	SELECT p.final 
		FROM progress p
		WHERE p.final < 50
	)
	UNION 
	SELECT s.lname,p.final
	FROM students s , progress p
	WHERE p.stud_id = s.stud_id
	and p.final  IN(
	SELECT p.final 
		FROM progress p
		WHERE p.final < 50
	)
	
	
//5
SELECT s.lname
FROM students s 
WHERE length(s.lname) > ALL(SELECT length(t.lname) FROM teachers t)  

	
	
	
	