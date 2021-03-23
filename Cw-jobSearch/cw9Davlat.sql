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
	SELECT *FROM resume
	SELECT *FROM searchh
	
	///1  Well, we can use some kind of ariphmetic operations with the attribute that we want to use for achieve some definite result like this:
	
	SELECT last_name 
	FROM resume 
	WHERE worker_id = (
	SELECT worker_id-1
		FROM account
		WHERE acc_id = 1
	)
	
	/////2)For example we need to find all names and sex of those people whose stage of work less than 5 to make some research work.
	SELECT a.name, r.sex
	FROM account a , resume r
	WHERE a.worker_id = r.worker_id 
	AND r.worker_id IN (
		SELECT r.worker_id
		FROM resume r
		WHERE r.stage_of_work < 5
	)
	
	///// 3) For example we need to find the person with exactly amount of stage in this sphere of work, so we can do it like this
	SELECT a.name, r.sex 
	FROM account a , resume r
	WHERE a.worker_id = r.worker_id
	AND EXISTS(
	SELECT*
		FROM account ,resume 
		WHERE r.stage_of_work = 10 
	)
	
	
		///// 4) Let`s consider this situation when we need to find Any people from Almaty for example
	SELECT a.name, r.city_of_living ,r.sex
	FROM account a , resume r
	WHERE a.worker_id = r.worker_id 
	AND a.district_of_search = ANY(
		SELECT a.district_of_search
		FROM  account a
		WHERE a.district_of_search = 'Almaty'
)
	
		///// 5) Let`s consider this situation when we need to find All people from Almaty for example
	SELECT a.name, r.sex
	FROM account a , resume r
	WHERE a.worker_id = r.worker_id 
	AND r.sex = ALL(
		SELECT r.sex
		FROM  resume r
		WHERE r.sex = 'man'
)

// 6) Look, we can use subquery in FROM operator like this and for help of it we can choose what we need to find using alias of FROM operator
SELECT name_of_worker 
FROM (
SELECT a.name AS name_of_worker
	FROM account a
	GROUP BY a.name
) WorkerNum

//7) We need to paste the information about workers into account , not a problem we can do it ,but we need to be more accurate because of type of data and number of keys.
INSERT INTO account(acc_id,name,phone,email,district_of_search,worker_id)
	(SELECT worker_id+15,last_name,phone,first_name,city_of_living,worker_id
	FROM resume WHERE citizen = true
	)
	
	/////8) We need to delete some account because user decided to remove it from our site, well we can do it in one query with his id and account table
DELETE 
FROM account 
WHERE acc_id  = (
SELECT acc_id FROM account 
	WHERE acc_id = 15
)


/// 9) For example we need to update id of some sort of users and we can do it like this 
UPDATE account 
SET acc_id = acc_id +101
WHERE acc_id = ANY(
	SELECT acc_id 
	FROM account
	WHERE acc_id > 15
)