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
	
	CREATE TABLE ACCOUNT(acc_id int Primary key, Name Varchar(10),
						 phone int,
						 email Varchar(50),
						district_of_search Varchar (50),
						 worker_id int)
						
						ALTER TABLE ACCOUNT ADD CONSTRAINT distfk  FOREIGN KEY (worker_id) REFERENCES Resume (worker_id); 
						
	CREATE TABLE Resume (worker_id int Primary key, last_name Varchar(10),
						first_name Varchar(10),
						 phone int,
						city_of_living Varchar(10),
						 data_of_birth Date,
						sex Varchar(10),
						 citizen Boolean,
						 stage_of_work int)
						
	CREATE TABLE Otclick(ot_id int Primary key,
						active Boolean,
						 deactive Boolean,
						 archieve Boolean,
						 worker_id int,
						 prof_id int)
						 
				
						ALTER TABLE Otclick ADD foreign key (worker_id) REFERENCES Resume(worker_id)
						
						ALTER TABLE Otclick ADD foreign key (prof_id) REFERENCES Proffesions_vacancy(prof_id)
						
	CREATE TABLE Interviewer (interview_id int Primary key, 
						last_name Varchar(10),
						first_name Varchar(10),
						 phone int,
						Company_of_entertaining Varchar(10),
						 worker_id int,
						comp_id int)
					
						ALTER TABLE Interviewer ADD foreign key (worker_id) REFERENCES Resume(worker_id)
					
						ALTER TABLE Interviewer ADD foreign key (comp_id) REFERENCES Company(comp_id)
						
	CREATE TABLE Proffesions_vacancy(prof_id int Primary key,
						Name Varchar(10),
						 prof_name Varchar(10),
						prof_salary int,
						search_id int)
						
						ALTER TABLE Proffesions_vacancy ADD foreign key (search_id) REFERENCES Searchh(search_id)
						
	CREATE TABLE Searchh (search_id int Primary key,
						  vacancies_name Varchar (10),
						 salary int,
						stage_of_work int,
						city Varchar(10),
						  region Varchar (10),
						kind_of_company Varchar (10))
						
						
	CREATE TABLE Company (comp_id int Primary key, 
						 comp_name Varchar (10),
						 stage_on_market int,
						 activity Boolean,
						comp_email Varchar (60),
						 comp_phone int)
						 
						 
		select * from ACCOUNT
		select * from Resume
		select * from Otclick
		select * from Interviewer
		select * from Proffesions_vacancy
		select * from Searchh
		select * from Company
		
		insert into ACCOUNT 
		values(1,'Davlat',34412,'dushurbakiev@gmail.com','Almaty',2),
		(2,'Akim',34412,'dushurbakiev@gmail.com','Almaty',3),
		(3,'Baha',34412,'dushurbakiev@gmail.com','Almaty',4),
		(4,'Alan',34412,'dushurbakiev@gmail.com','Almaty',5),
		(5,'Raf',34412,'dushurbakiev@gmail.com','Almaty',6),
		(6,'Aldik',34412,'dushurbakiev@gmail.com','Almaty',7),
		(7,'Karim',34412,'dushurbakiev@gmail.com','Almaty',8),
		(8,'Alduin',34412,'dushurbakiev@gmail.com','Almaty',9),
		(9,'Anduin',34412,'dushurbakiev@gmail.com','Almaty',10),
		(10,'Arduino',34412,'dushurbakiev@gmail.com','Almaty',11),
		(11,'Nariman',34412,'dushurbakiev@gmail.com','Almaty',12),
		(12,'Nazugum',34412,'dushurbakiev@gmail.com','Almaty',13),
		(13,'Zulfira',34412,'dushurbakiev@gmail.com','Almaty',14),
		(14,'Dilnaz',34412,'dushurbakiev@gmail.com','Almaty',15),
		(15,'Danik',34412,'dushurbakiev@gmail.com','Almaty',1)
		
		insert into Resume 
		values(1,'Davlat','adsd',23123,'Almaty','19.03.2000','man',true,2),
		(2,'Akim','adsd',23123,'Almaty','19.03.2000','man',true,3),
		(3,'Baha','adsd',23123,'Almaty','19.03.2000','man',true,4),
		(4,'Alan','adsd',23123,'Almaty','19.03.2000','man',true,5),
		(5,'Raf','adsd',23123,'Almaty','19.03.2000','man',true,6),
		(6,'Aldik','adsd',23123,'Almaty','19.03.2000','man',true,7),
		(7,'Karim','adsd',23123,'Almaty','19.03.2000','man',true,8),
		(8,'Alduin','adsd',23123,'Almaty','19.03.2000','man',true,9),
		(9,'Anduin','adsd',23123,'Almaty','19.03.2000','man',true,10),
		(10,'Arduino','adsd',23123,'Almaty','19.03.2000','man',true,11),
		(11,'Nariman','adsd',23123,'Almaty','19.03.2000','man',true,12),
		(12,'Nazugum','adsd',23123,'Almaty','19.03.2000','man',true,13),
		(13,'Zulfira','adsd',23123,'Almaty','19.03.2000','man',true,14),
		(14,'Dilnaz','adsd',23123,'Almaty','19.03.2000','man',true,15),
		(15,'Danik','adsd',23123,'Almaty','19.03.2000','man',true,1)
		
		insert into Otclick 
		values(2,true,false,false,2,2),
		(1,true,false,false,1,1),
		(3,true,false,false,3,3),
		(4,true,false,false,4,4),
		(5,true,false,false,5,5),
		(6,true,false,false,6,6),
		(7,true,false,false,7,7),
		(8,true,false,false,8,8),
		(9,true,false,false,9,9),
		(10,true,false,false,10,10),
		(11,true,false,false,11,11),
		(12,true,false,false,12,12),
		(13,true,false,false,13,13),
		(14,true,false,false,14,14),
		(15,true,false,false,15,15)
		
		insert into Interviewer 
		values(1,'Davlat','Davlat',34412,'dushu',2,2),
		(2,'Akim','Davlat',34412,'dushu',3,3),
		(3,'Baha','Davlat',34412,'dushu',4,4),
		(4,'Alan','Davlat',34412,'dushu',5,5),
		(5,'Raf','Davlat',34412,'dushu',6,6),
		(6,'Aldik','Davlat',34412,'dushu',7,7),
		(7,'Karim','Davlat',34412,'dushu',8,8),
		(8,'Alduin','Davlat',34412,'dushu',9,9),
		(9,'Anduin','Davlat',34412,'dushu',10,10),
		(10,'Arduino','Davlat',34412,'dushu',11,11),
		(11,'Nariman','Davlat',34412,'dushu',12,12),
		(12,'Nazugum','Davlat',34412,'dushu',13,13),
		(13,'Zulfira','Davlat',34412,'dushu',14,14),
		(14,'Dilnaz','Davlat',34412,'dushu',15,15),
		(15,'Danik','Davlat',34412,'dushu',1,1)
		
		insert into Proffesions_vacancy 
		values(1,'Davlat','DXD',2,2),
		(2,'Akim','DXD',3,3),
		(3,'Baha','DXD',4,4),
		(4,'Alan','DXD',5,5),
		(5,'Raf','DXD',6,6),
		(6,'Aldik','DXD',7,7),
		(7,'Karim','DXD',8,8),
		(8,'Alduin','DXD',9,9),
		(9,'Anduin','DXD',10,10),
		(10,'Arduino','DXD',11,11),
		(11,'Nariman','DXD',12,12),
		(12,'Nazugum','DXD',13,13),
		(13,'Zulfira','DXD',14,14),
		(14,'Dilnaz','DXD',15,15),
		(15,'Danik','DXD',1,1)
		
			insert into Searchh 
		values(1,'CSSE',34412,10,'Almaty','Asia','IT'),
		(2,'CSSI',34412,10,'Almaty','Asia','IT'),
		(3,'CSS',34412,10,'Almaty','Asia','IT'),
		(4,'CS',34412,10,'Almaty','Asia','IT'),
		(5,'ML',34412,10,'Almaty','Asia','IT'),
		(6,'AM',34412,10,'Almaty','Asia','IT'),
		(7,'LA',34412,10,'Almaty','Asia','IT'),
		(8,'RR',34412,10,'Almaty','Asia','IT'),
		(9,'RP',34412,10,'Almaty','Asia','IT'),
		(10,'CSSE',34412,10,'Almaty','Asia','IT'),
		(11,'CSSE',34412,10,'Almaty','Asia','IT'),
		(12,'CSSE',34412,10,'Almaty','Asia','IT'),
		(13,'CSSE',34412,10,'Almaty','Asia','IT'),
		(14,'CSSE',34412,10,'Almaty','Asia','IT'),
		(15,'CSSE',34412,10,'Almaty','Asia','IT')
		
			insert into Company 
		values(1,'GOOGLE',20,true,'google.com',0001),
		(2,'facebook',14,true,'facebook.com',0002),
		(3,'amazon',25,true,'amazon.com',0003),
		(4,'prime',10,true,'prime.com',0004),
		(5,'linux',24,true,'linux.com',0005),
		(6,'Microsoft',20,true,'Microsoft.com',0006),
		(7,'Huawei',21,true,'Huawei.com',0007),
		(8,'Apple',26,true,'Apple.com',0008),
		(9,'Samsung',24,true,'Samsung.com',0009),
		(10,'Helios',10,true,'Helios.com',00010),
		(11,'Atlant',5,true,'Atlant.com',00011),
		(12,'Sony',28,true,'Sony.com',00012),
		(13,'Vitex',24,true,'Vitex.com',00013),
		(14,'OMEGA',1,true,'OMEGA.com',00014),
		(15,'KtK',2,true,'KtK.com',00015)