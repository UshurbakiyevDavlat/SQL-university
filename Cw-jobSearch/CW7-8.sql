-- Database: jobSearch

-- DROP DATABASE "jobSearch";

CREATE DATABASE "jobSearch"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Kazakh_Kazakhstan.utf8'
    LC_CTYPE = 'Kazakh_Kazakhstan.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	SELECT *FROM account
	SELECT *FROM interviewer 
	SELECT *FROM resume
	SELECT *FROM company
	SELECT *FROM otclick
	
	
	
	//First query about how to integrate data from two tables to one
	SELECT name,phone,email FROM account
	UNION
	SELECT last_name,phone,company_of_entertaining FROM interviewer
	
	//2 query about how to integrate data to table without data from definite table 
	SELECT name,phone,email FROM account
	EXCEPT
	SELECT last_name,phone,company_of_entertaining FROM interviewer
	
	//3 query about how to show the correlate data between bind tables
	
	
	SELECT  resume.sex,account.name,account.phone
	FROM account
	INNER JOIN resume 
	ON account.worker_id = resume.worker_id
	
	
	//4 query about how integrate data for each row by crossing them
	
	SELECT resume.data_of_birth,account.name,account.phone
	FROM account
	CROSS  JOIN resume
	
	//5 query about how to use Aliasing and also group data with help of it
	SELECT c.comp_name,c.stage_on_market, i.last_name
	FROM company c,interviewer i
	WHERE c.comp_id = i.comp_id
	
	//6 query is about how to manage data according to different attributes
	
	SELECT comp_name 
	FROM company
	WHERE stage_on_market BETWEEN 10 and 30
	
	
	//7 query  is about how to sort string datatype by first letter 
	SELECT last_name 
	FROM resume 
	WHERE last_name LIKE 'D%'
	
	//8 query is about how to change datatype from one to another
	SELECT CAST(stage_on_market AS VARCHAR(20)) 
	FROM company 
	
	//9 query is about how to union attributes to one with saving data to it
	
	SELECT  active, deactive || ' ' || archieve AS inactive 
	FROM otclick 
	
	
	//10 query is about how to show grouped data by different attributes 
	SELECT a.name, a.phone, a.email, a.district_of_search
	FROM account a
	GROUP BY a.name,a.phone,a.email,a.district_of_search
	
	

	