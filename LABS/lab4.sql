-- Database: University

-- DROP DATABASE "University";

CREATE DATABASE "University"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Kazakh_Kazakhstan.utf8'
    LC_CTYPE = 'Kazakh_Kazakhstan.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	CREATE table Students1(stud_id int Primary key,
						  	first_name Varchar(50),
							last_name Varchar(50),
						  	student_GPA integer,
						 	group_id integer,
						  	gen_id integer);
						 	FOREIGN key (group_id) REFERENCES Groups(group_id);
							FOREIGN key (gen_id) REFERENCES General_information(gen_id);
							
							
							
							CREATE table Groups (group_id int Primary key,
						  	group_name Varchar(50),
						  	Amount_of_students integer,
						 	group_activity integer,
						  	gen_id integer,
							stud_id integer);
						 	FOREIGN key (stud_id) REFERENCES Students(stud_id);
							FOREIGN key (gen_id) REFERENCES General_information(gen_id);
							
							CREATE table Phone (Phone_id int Primary key,
						  	phone_num integer,
						 	stud_id integer,
						  	ad_id integer);
						 	FOREIGN key (stud_id) REFERENCES Students1(stud_id),
							FOREIGN key (ad_id) REFERENCES Advisors(ad_id));					
							
							
							
							CREATE table Advisors (add_id int Primary key,
						  	department Varchar(50),
						  	student_GPA integer,
						 	group_id integer);
						 	FOREIGN key (group_id) REFERENCES Groups(group_id));
							/**/
							
							CREATE table General_information(gen_id int Primary key,
						  	first_name Varchar(50),
							last_name Varchar(50),
							date_of_birth Date,
						  	stud_id integer,
						 	ad_id integer,
						  	teacher_id integer);
						 	FOREIGN key (stud_id) REFERENCES Students1(stud_id),
							FOREIGN key (ad_id) REFERENCES Advisors(ad_id),
							FOREIGN key (teacher_id) REFERENCES Teachers(teacher_id));									 
							
							CREATE table Teachers (teacher_id int Primary key,
						  	salary integer,
							stage integer,
							stud_id integer,					   
						 	group_id integer,
						  	gen_id integer,
							fac_id integer,
							sub_id integer);
												   
						 	FOREIGN key (stud_id) REFERENCES Students1(stud_id),
							FOREIGN key (gen_id) REFERENCES General_information(gen_id),
							FOREIGN key (fac_id) REFERENCES Faculties(fac_id),
							FOREIGN key (sub_id) REFERENCES Faculties(sub_id),
							FOREIGN key (group_id) REFERENCES Groups(group_id));					   
							
							CREATE table Faculties (fac_id int Primary key,
						  	fac_name Varchar(50),
							fac_leader Varchar(50),
							fac_location Varchar(50),
							fac_priority Boolean,						
						 	sub_id integer,
						  	teacher_id integer);
						 	FOREIGN key (sub_id) REFERENCES Faculties(sub_id),
							FOREIGN key (teacher_id) REFERENCES Teachers(teacher_id));	
													
							CREATE table Subjects (sub_id int Primary key,
						  	first_name Varchar(50),
							sub_name Varchar(50),
						  	sub_credits integer,
						 	teachers_id integer);
						 	FOREIGN key (teacher_id) REFERENCES Teachers(teacher_id));
							
	
	
	
	delete  from Students
	
	ALTER TABLE  Students RENAME TO Students
	
	ALTER TABLE Students ADD COLUMN group_id int;
	ALTER TABLE Students ADD COLUMN gen_id int;
	ALTER TABLE Phone ADD COLUMN ad_id int;
	ALTER TABLE Groups ADD COLUMN group_id int Primary key;
	ALTER TABLE Subjects RENAME COLUMN teachers_id to teacher_id;
	ALTER TABLE Students ADD CONSTRAINT distfk  FOREIGN KEY (group_id) REFERENCES Groups (group_id);
	ALTER TABLE Students ADD CONSTRAINT distfk  FOREIGN key (gen_id) REFERENCES General_information(gen_id);
	
	ALTER TABLE Groups ADD CONSTRAINT distfk 	FOREIGN key (stud_id) REFERENCES Students(stud_id);						
	ALTER TABLE Groups ADD CONSTRAINT distfk 	FOREIGN key (gen_id) REFERENCES General_information(gen_id);
	
	ALTER TABLE Phone ADD CONSTRAINT distfk 	FOREIGN key (stud_id) REFERENCES Students(stud_id);
	ALTER TABLE Phone ADD CONSTRAINT distfk		FOREIGN key (ad_id) REFERENCES Advisors(ad_id);
	
	ALTER TABLE Advisors ADD CONSTRAINT distfk	FOREIGN key (group_id) REFERENCES Groups(group_id);
	
	ALTER TABLE General_information ADD CONSTRAINT distfk	FOREIGN key (stud_id) REFERENCES Students(stud_id);						
	ALTER TABLE General_information ADD CONSTRAINT distfk	FOREIGN key (ad_id) REFERENCES Advisors(ad_id);
	ALTER TABLE General_information ADD CONSTRAINT distfk	FOREIGN key (teacher_id) REFERENCES Teachers(teacher_id);

	ALTER TABLE Teachers ADD CONSTRAINT distfk  FOREIGN key (stud_id) REFERENCES Students(stud_id);
	ALTER TABLE Teachers ADD CONSTRAINT distfk	FOREIGN key (gen_id) REFERENCES General_information(gen_id);
	ALTER TABLE Teachers ADD CONSTRAINT distfk	FOREIGN key (fac_id) REFERENCES Faculties(fac_id);
	ALTER TABLE Teachers ADD CONSTRAINT distfk  FOREIGN key (sub_id) REFERENCES Faculties(sub_id);
	ALTER TABLE Teachers ADD CONSTRAINT distfk	FOREIGN key (group_id) REFERENCES Groups(group_id));
	
	ALTER TABLE Faculties ADD CONSTRAINT distfk	FOREIGN key (sub_id) REFERENCES Subjects(sub_id);
	ALTER TABLE Faculties ADD CONSTRAINT distfk FOREIGN key (teacher_id) REFERENCES Teachers(teacher_id);	
	
	ALTER TABLE Subjects ADD CONSTRAINT distfk	FOREIGN key (teacher_id) REFERENCES Teachers(teacher_id);
	
	
	ALTER TABLE Students DROP COLUMN stud_id RESTRICT;
	ALTER TABLE Students DROP COLUMN gen_id RESTRICT;
	
	ALTER TABLE Groups DROP COLUMN group_id RESTRICT;
	ALTER TABLE Advisors DROP COLUMN ad_id RESTRICT;
	ALTER TABLE Groups DROP COLUMN gen_id RESTRICT;
	ALTER TABLE Subjects DROP COLUMN first_name RESTRICT;
	
	insert into Students values(1,'Davlat','Ushurbakiev',4)
	insert into Students values(3,'Rafael','Toijanov',4)
	
	
	
	ALTER TABLE Students ADD foreign key (group_id) REFERENCES Groups(group_id)
	ALTER TABLE Students ADD foreign key (gen_id) REFERENCES General_information(gen_id)
	ALTER TABLE Groups ADD FOREIGN key (stud_id) REFERENCES Students(stud_id)
	ALTER TABLE Groups ADD foreign key (group_id) REFERENCES Groups(group_id)
	
	ALTER TABLE Phone ADD 	FOREIGN key (stud_id) REFERENCES Students(stud_id);
	ALTER TABLE Phone ADD 	FOREIGN key (ad_id) REFERENCES Advisors(add_id);
	
	ALTER TABLE Advisors ADD 	FOREIGN key (group_id) REFERENCES Groups(group_id);
	
	ALTER TABLE General_information ADD 	FOREIGN key (stud_id) REFERENCES Students(stud_id);						
	ALTER TABLE General_information ADD 	FOREIGN key (ad_id) REFERENCES Advisors(add_id);
	ALTER TABLE General_information ADD 	FOREIGN key (teacher_id) REFERENCES Teachers(teacher_id);

	ALTER TABLE Teachers ADD    FOREIGN key (stud_id) REFERENCES Students(stud_id);
	ALTER TABLE Teachers ADD 	FOREIGN key (gen_id) REFERENCES General_information(gen_id);
	ALTER TABLE Teachers ADD 	FOREIGN key (fac_id) REFERENCES Faculties(fac_id);
	ALTER TABLE Teachers ADD    FOREIGN key (sub_id)  REFERENCES Subjects(sub_id);
	ALTER TABLE Teachers ADD 	FOREIGN key (group_id) REFERENCES Groups(group_id);
	
	ALTER TABLE Faculties ADD  	FOREIGN key (sub_id) REFERENCES Subjects(sub_id);
	ALTER TABLE Faculties ADD   FOREIGN key (teacher_id) REFERENCES Teachers(teacher_id);	
	
	ALTER TABLE Subjects ADD 	FOREIGN key (teacher_id) REFERENCES Teachers(teacher_id);
	
	
	
	
	
	
	
	
	
	insert into Students values(4,'Aldiyar','Tagaibekov',3,null,null)
		insert into Students values(5,'Aldiyar','Orazbek',4,null,null)
		insert into Students values(6,'Elvira','Nugmanova',4,null,null)
			insert into Students values(7,'Sanya','sasha',1,null,null)
				insert into Students values(8,'Karim','Ilyasov',3,null,null)
					insert into Students values(9,'Amirlan','Mukhitdinov',3,null,null)
						insert into Students values(10,'Yaly','Kazanova',1,null,null)
							insert into Students values(11,'Mariza','Sharipova',0,null,null)
								insert into Students values(12,'Malika','Mallim',0,null,null)
									insert into Students values(13,'Malika','Tokhtieva',4,null,null)
									
	insert into Groups values('ITSE1910',10,12,null,2),('ITSE1908',10,12,null,3),('ITSE1907',10,12,null,4),('ITSE1906',10,12,null,5),
	('ITSE1905',10,12,null,6),('ITSE1904',10,12,null,7),('ITSE1903',10,12,null,8),('ITSE1902',10,12,null,9),('ITSE1901',10,12,null,10)
	
	insert into Phone values(0,2696264),(2,1696964),(3,2496964),(4,2696964),(5,2696664),(6,2456964),(7,26953964),(8,26196964),(9,422696964),(10,260096964)
	
	insert into Advisors values(2,'Kabib'),(3,'Kaiab'),(4,'Kasib'),(5,'Kacib'),(6,'Kaib'),(7,'zKaib'),(8,'Kaib'),(9,'Kcaib'),(10,'Kaib'),(11,'Kai2b')
	
	insert into General_information values(2,'Davlzat','Ushurbakiev','19.03.2000'),(3,'Davlaat','Ushurbakiev','19.03.2000'),(4,'Davlaaat','Ushurbakiev','19.03.2000'),
	(5,'aDavlat','Ushurbakiev','19.03.2000'),(6,'Daaavvlat','Ushurbakiev','19.03.2000'),(7,'Daaavlat','Ushurbakiev','19.03.2000'),(8,'Daaavlat','Ushurbakiev','19.03.2000'),
	(9,'Daaavlat','Ushurbakiev','19.03.2000'),(10,'aaaDavlat','Ushurbakiev','19.03.2000')
	
	insert into Teachers values(2,10000,10),(3,10000,10),(4,10000,10),(5,10000,10),(6,10000,10),(7,10000,10),(8,10000,10),(9,10000,10),(10,10000,10)
	
	insert into Faculties values(2,'Vtipo','Davlat','IITU',TRUE),(3,'ads','Davlat','IITU',TRUE),(4,'asdsa','Davlat','IITU',TRUE),(5,'ads','Davlat','IITU',TRUE),
	(6,'Kiasb','Davlat','IITU',TRUE),
	(7,'Kidsb','Davlat','IITU',TRUE),
	(8,'Kisadb','Davlat','IITU',TRUE),
	(9,'Kadib','Davlat','IITU',TRUE),
	(10,'asdKib','Davlat','IITU',TRUE),
	(11,'as','Davlat','IITU',TRUE)
										
	insert into Subjects values(2,'SQL',3),	(3,'SQL1',3),(4,'SQ2L',3),(5,'SQ3L',3),(6,'SQ4L',3),(7,'SQ5L',3),(8,'SQ6L',3),(9,'SQ7L',3),(10,'SQ8L',3),(11,'SQL9',3)
	
	update Students set first_name = 'DavlatUshurbakievsadsad' where stud_id = 1
	update General_information set last_name = 'Ushurbakiyev111' where gen_id = 2
	update Advisors set department = 'Demons' where add_id = 3
	
	delete from Students where stud_id = null
	delete from Phone where phone_id = 9
	delete from Subjects where sub_credits=3 and sub_name='SQ4L'
	
	select * from Students
	select * from Groups
	select * from Phone
	select * from Advisors
	select * from General_information
	select * from Teachers
	select * from Faculties
	select * from Subjects
	