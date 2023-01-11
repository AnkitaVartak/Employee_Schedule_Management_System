use ist659ajvartak
go

Drop table if exists students
   go
Create Table students(
student_SUID int NOT NULL,
student_firstname varchar(50) NOT NULL,
student_lastname varchar(50) NOT NULL,
student_hiredate date NOT NULL,
student_jobtitle varchar(50) NOT NULL,
student_payrate Int NOT NULL,
student_employer_name VARCHAR(50) NOT NULL,
student_workstation_name varchar(50) NOT NULL

Constraint students_PK Primary Key(student_SUID)
)
ALTER table students 
ADD Constraint students_UK UNIQUE (student_employer_name,student_workstation_name)
GO


Drop table if exists employers
   go
Create Table employers (
employer_name varchar(50) NOT NULL,
employer_address varchar(25) NOT NULL,
employer_contact bigint NOT NULL
 
Constraint employers_PK Primary Key(employer_name),
CONSTRAINT employers_UK UNIQUE (employer_contact)          
)

Drop table if exists workstations
  go
Create Table workstations (
workstation_name varchar(50) NOT NULL,
    
Constraint workstation_PK Primary Key(workstation_name),
Constraint workstation_UK Unique (workstation_name)
)

ALTER table students 
ADD Constraint students_FK1 Foreign Key(student_employer_name) References employers(employer_name),
Constraint students_FK2 Foreign Key(student_workstation_name) References workstations(workstation_name)
GO

Drop table if exists schedules
   go
Create Table schedules (
schedule_id int identity,
schedule_from time NOT NULL,
schedule_to time NOT NULL,
schedule_date date NOT NULL,
schedule_day VARCHAR(50) NOT NULL
    
Constraint schedules_PK Primary Key(schedule_id)
)

--paychecks Table

Drop table if exists paychecks
   go
Create Table paychecks (
paycheck_id int NOT NULL identity,
paycheck_hours int NOT NULL,
paycheck_period datetime default getdate(),
paycheck_amount int NOT NULL,
paycheck_student_SUID int NOT NULL,
paycheck_note VARCHAR(25) NULL
    
Constraint paychecks_PK Primary Key(paycheck_id)
Constraint paychecks_FK Foreign Key(paycheck_student_SUID) References students(student_SUID)

)

--ratings Table

Drop table if exists ratings
   go
Create Table ratings (

rating_id int NOT NULL identity,   
ratings varchar(50),  
remark VARCHAR(50) 
Constraint ratings_PK Primary Key(rating_id)

)

-- jobtitles Table

Drop table if exists jobtitles
   go
Create table jobtitles (
jobtitle_id int NOT NULL,   
jobtitle_name varchar(50) NOT NULL,
Constraint jobtitles_UK Unique(jobtitle_name),   
Constraint jobtile_PK Primary Key(jobtitle_id)
)
-- student_schedules Table

Drop table if exists student_schedules
   go
Create Table student_schedules(
schedule_id int NOT NULL,   
student_SUID int NOT NULL, 
student_schedule VARCHAR(50) Null,    
CONSTRAINT student_schedules_PK PRIMARY KEY(schedule_id, student_SUID),
CONSTRAINT student_schedules_FK1 FOREIGN KEY (schedule_id) REFERENCES schedules (schedule_id),
CONSTRAINT student_schedules_FK2 FOREIGN KEY (student_SUID) REFERENCES students (student_SUID)
)



-- student_ratings Table

Drop table if exists student_ratings
go
Create Table student_ratings(
rating_id int NOT NULL IDENTITY,   
student_SUID int NOT NULL,  
ratings FLOAT Not Null,  
remark varchar(50),
CONSTRAINT student_ratings_PK PRIMARY KEY(rating_id, student_SUID),
CONSTRAINT student_ratings_FK2 FOREIGN KEY (student_SUID) REFERENCES students (student_SUID)
)

-- student_jobtitles Table

Drop table if exists student_jobtitles
   go
Create Table student_jobtitles(
student_SUID int NOT NULL,   
jobtitle_id int NOT NULL,     
CONSTRAINT student_jobtitles_PK PRIMARY KEY(student_SUID, jobtitle_id),
CONSTRAINT student_jobtitles_FK1 FOREIGN KEY (jobtitle_id) REFERENCES jobtitles (jobtitle_id),
CONSTRAINT student_jobtitles_FK2 FOREIGN KEY (student_SUID) REFERENCES students (student_SUID)
)
-- workstation_schedules Table

Drop table if exists workstation_schedules
  go
Create Table workstation_schedules(
workstation_name VARCHAR(50) NOT NULL,  
schedule_id int NOT NULL,    
CONSTRAINT workstation_schedules_PK PRIMARY KEY(workstation_name, schedule_id),
CONSTRAINT workstation_schedules_FK1 FOREIGN KEY (workstation_name) REFERENCES workstations (workstation_name), 
CONSTRAINT workstation_schedules_FK2 FOREIGN KEY (schedule_id) REFERENCES schedules (schedule_id)
)


select * from students
select * from employers
select * from workstations
select * from schedules
select * from paychecks
select * from ratings
select * from jobtitles
select * from student_schedules
select * from student_jobtitles
select * from student_ratings
select * from workstation_schedules



INSERT INTO jobtitles VALUES (1, 'General Employee')
INSERT INTO jobtitles VALUES (2, 'Supervisor')


INSERT INTO workstations VALUES ('Deli')
INSERT INTO workstations VALUES ('Hotline')
INSERT INTO workstations VALUES ('Salads')
INSERT INTO workstations VALUES ('Vegan')
INSERT INTO workstations VALUES ('Dishroom')
INSERT INTO workstations VALUES ('Dining Room')
INSERT INTO workstations VALUES ('Express')
INSERT INTO workstations VALUES ('Dessert')
INSERT INTO workstations VALUES ('Beverages')
INSERT INTO workstations VALUES ('Gluten Free')


INSERT INTO employers VALUES( 'Sadler Dining', 'Sims Drive street', 6809108108)
--Update employers set employer_contact=6809108108 where employer_id=1
INSERT INTO employers ( employer_name, employer_address, employer_contact) VALUES ( 'Graham Dining',' Comstock street',  6809108121)
INSERT INTO employers (employer_name, employer_address, employer_contact) VALUES ( 'Ernie Davis Dining',' University Ave',  6803434565)
INSERT INTO employers (employer_name, employer_address, employer_contact) VALUES ( 'Shaw Dining',' Euclid street',  6809809977)
INSERT INTO employers ( employer_name, employer_address, employer_contact) VALUES ( 'Brockway Dining',' Van Buren street',  6801133242)

INSERT into students values (358554918,	'Ankita',	'Vartak',	'08/30/2021',	'General Employee',15,'Sadler Dining','Deli')
INSERT into students values (660307939,	'Chaitanya','Attarde',	'09/02/2021',	'General Employee',	15,'Sadler Dining', 'Salads')																		
INSERT into students values (859436780,	'Aishwary',	'Patel',	'09/04/2021',	'General Employee',	15,	'Ernie Davis Dining', 'Vegan')																		
INSERT into students values (812995446,	'Shivani',   'Pol',	    '09/01/2021',	'General Employee',	15,	'Graham Dining', 'Salads')																		
INSERT into students values (955036125,	'Vamsy',   'Krishna',	'08/31/2021',	'Supervisor',       17,	'Ernie Davis Dining', 'Dishroom')																		
INSERT into students values (411946624,	'Nivesh',	'Vaze',	    '09/05/2021',	'General Employee',	15,	'Brockway Dining', 'Hotline')																		
INSERT into students values (475885683,	'Anushree',	 'Keni',	'10/03/2021',	'General Employee',	15,	'Shaw Dining', 'Deli')																		
INSERT into students values (324669421,	'Abhijeet',	'Gokhale',	'08/28/2021',	'Supervisor',	    17,	'Sadler Dining', 'Vegan')																		
INSERT into students values (452175821,	'Nikita',	'Sirwani',	'09/03/2021',	'General Employee',	15,	'Graham Dining', 'Hotline')																		
INSERT into students values (458231945,	'Ruzan',	'Shaikh',	'09/15/2021',	'Student Manager',	18,	'Graham Dining', 'Dishroom')


INSERT into schedules values( '09:00:00','13:00:00', '2021-11-22', 'Monday')
INSERT into schedules values( '13:00:00','17:00:00', '2021-11-22', 'Monday')
INSERT into schedules values( '17:00:00','21:00:00', '2021-11-22', 'Monday')
INSERT into schedules values( '09:00:00','13:00:00', '2021-11-23', 'Tuesday')
INSERT into schedules values( '13:00:00','17:00:00', '2021-11-23', 'Tuesday')
INSERT into schedules values( '17:00:00','21:00:00', '2021-11-23', 'Tuesday')
INSERT into schedules values( '09:00:00','13:00:00', '2021-11-24', 'Wednesday')
INSERT into schedules values( '13:00:00','17:00:00', '2021-11-24', 'Wednesday')
INSERT into schedules values('17:00:00','21:00:00', '2021-11-24', 'Wednesday')
INSERT into schedules values( '09:00:00','13:00:00', '2021-11-25', 'Thursday')
INSERT into schedules values( '13:00:00','17:00:00', '2021-11-25', 'Thursday')
INSERT into schedules values( '17:00:00','21:00:00', '2021-11-25', 'Thursday')
INSERT into schedules values( '09:00:00','13:00:00', '2021-11-26', 'Friday')
INSERT into schedules values( '13:00:00','17:00:00', '2021-11-26', 'Friday')
INSERT into schedules values( '17:00:00','21:00:00', '2021-11-26', 'Friday')
INSERT into schedules values( '09:00:00','13:00:00', '2021-11-27', 'Saturday')
INSERT into schedules values( '13:00:00','17:00:00', '2021-11-27', 'Saturday')
INSERT into schedules values( '17:00:00','21:00:00', '2021-11-27', 'Saturday')
INSERT into schedules values( '09:00:00','13:00:00', '2021-11-28', 'Sunday')
INSERT into schedules values( '13:00:00','17:00:00', '2021-11-28', 'Sunday')
INSERT into schedules values( '17:00:00','21:00:00', '2021-11-28', 'Sunday')


INSERT into workstation_schedules values('Deli',1)
select * from workstation_schedules


/*select * from students s 
join workstations w on s.student_workstation_ID = w.workstation_id
join workstation_schedules ws on w.workstation_id = ws.workstation_id
join schedules ss on ws.schedule_id = ss.schedule_id where student_employer_ID=1;*/

INSERT into student_schedules VALUES(1,358554918, 'Ankita_shift')
INSERT into student_schedules VALUES(2,458231945, 'Ruz shift')
Insert into student_ratings VALUES(358554918, 4, 'By Abhijeet')
Insert into student_ratings VALUES(358554918, 5, 'By Abhijeet')



INSERT into paychecks(paycheck_hours, paycheck_amount, paycheck_student_SUID, paycheck_note) VALUES(4, 60, 358554918, 'abhijeet paycheck');
INSERT into paychecks(paycheck_hours, paycheck_amount, paycheck_student_SUID, paycheck_note) VALUES(4, 60, 358554918, 'Ankita paycheck');
INSERT into paychecks(paycheck_hours, paycheck_amount, paycheck_student_SUID, paycheck_note) VALUES(4, 60, 458231945, 'Abhijeet paycheck');



--Drop Views(list of schedules) if exist

if exists(select * from sys.objects where name='Sadler Schedule')
	drop view [Sadler Schedule]

if exists(select * from sys.objects where name='Graham Schedule')
	drop view [Graham Schedule]

if exists(select * from sys.objects where name='Ernie Davis Schedule')
	drop view [Ernie Davis Schedule]

if exists(select * from sys.objects where name='Shaw Schedule')
	drop view [Shaw Schedule]

if exists(select * from sys.objects where name='Brockway Schedule')
	drop view [Brockway Schedule]

--Drop Views(list of employee) if exist

if exists(select * from sys.objects where name='Sadler Students')
	drop view [Sadler Students]

if exists(select * from sys.objects where name='Graham Students')
	drop view [Graham Students]

if exists(select * from sys.objects where name='Ernie Davis Students')
	drop view [Ernie Davis Students]

if exists(select * from sys.objects where name='Shaw Students')
	drop view [Shaw Students]

if exists(select * from sys.objects where name='Brockway Students')
	drop view [Brockway Students]

--Current schedule of Sadler Dining--
CREATE VIEW [Sadler Schedule] AS
select s.student_SUID, s.student_firstname +' '+s.student_lastname as student_name, s.student_jobtitle, e.employer_name, w.workstation_name, sc.schedule_from, sc.schedule_to, schedule_date, sc.schedule_day
from students s
join employers e on s.student_employer_name = e.employer_name
join workstations w on s.student_workstation_name = w.workstation_name
join student_schedules ss on s.student_SUID = ss.student_SUID
join schedules sc on ss.schedule_id = sc.schedule_id
where e.employer_name='Sadler Dining';

--Current schedule of Graham Dining--
CREATE VIEW [Graham Schedule] AS
select s.student_SUID, s.student_firstname +' '+s.student_lastname as student_name, s.student_jobtitle, e.employer_name, w.workstation_name, sc.schedule_from, sc.schedule_to, schedule_date, sc.schedule_day
from students s
join employers e on s.student_employer_name = e.employer_name
join workstations w on s.student_workstation_name = w.workstation_name
join student_schedules ss on s.student_SUID = ss.student_SUID
join schedules sc on ss.schedule_id = sc.schedule_id
where e.employer_name='Graham Dining';

--Current schedule of Ernie Davis Dining--
CREATE VIEW [Ernie Davis Schedule] AS
select s.student_SUID, s.student_firstname +' '+s.student_lastname as student_name, s.student_jobtitle, e.employer_name, w.workstation_name, sc.schedule_from, sc.schedule_to, schedule_date, sc.schedule_day
from students s
join employers e on s.student_employer_name = e.employer_name
join workstations w on s.student_workstation_name = w.workstation_name
join student_schedules ss on s.student_SUID = ss.student_SUID
join schedules sc on ss.schedule_id = sc.schedule_id
where e.employer_name='Ernie Davis Dining';


--Current schedule of Shaw Dining Dining--
CREATE VIEW [Shaw Schedule] AS
select s.student_SUID, s.student_firstname +' '+s.student_lastname as student_name, s.student_jobtitle, e.employer_name, w.workstation_name, sc.schedule_from, sc.schedule_to, schedule_date, sc.schedule_day
from students s
join employers e on s.student_employer_name = e.employer_name
join workstations w on s.student_workstation_name = w.workstation_name
join student_schedules ss on s.student_SUID = ss.student_SUID
join schedules sc on ss.schedule_id = sc.schedule_id
where e.employer_name='Shaw Dining';


--Current schedule of Brockway Dining--
CREATE VIEW [Brockway Schedule] AS
select s.student_SUID, s.student_firstname +' '+s.student_lastname as student_name, s.student_jobtitle, e.employer_name, w.workstation_name, sc.schedule_from, sc.schedule_to, schedule_date, sc.schedule_day
from students s
join employers e on s.student_employer_name = e.employer_name
join workstations w on s.student_workstation_name = w.workstation_name
join student_schedules ss on s.student_SUID = ss.student_SUID
join schedules sc on ss.schedule_id = sc.schedule_id
where e.employer_name='Brockway Dining';

--View for list of employees at specific dining 

--Total students at Sadler Dining--
CREATE VIEW [Sadler Students] AS
select * from students 
join employers on student_employer_name = employer_name
where employer_name='Sadler Dining';


--Total students at Graham Dining--
CREATE VIEW [Graham Students] AS
select * from students 
join employers on student_employer_name = employer_name
where employer_name='Graham Dining';


--Total students at Ernie Davis Dining--
CREATE VIEW [Ernie Davis Students] AS
select * from students 
join employers on student_employer_name = employer_name
where employer_name='Ernie Davis Dining';

--Total students at Shaw Dining--
CREATE VIEW [Shaw Students] AS
select * from students 
join employers on student_employer_name = employer_name
where employer_name='Shaw Dining';


--Total students at Brockway Dining--
CREATE VIEW [Brockway Students] AS
select * from students 
join employers on student_employer_name = employer_name
where employer_name='Brockway Dining';


----------Create View for rating----

Create view [V1_Student Ratings] AS
select sr.student_SUID, student_firstname,student_lastname, ratings, remark from students s 
join student_ratings sr 
on s.student_SUID = sr.student_SUID;

select * from [Sadler Students]
select * from [Graham students]
select * from [Ernie Davis students]
select * from [Shaw Students]
select * from [Brockway Students]

--Details about a particular employee--
Create view  [StudentDetails] AS
select s.student_SUID, s.student_firstname +' '+ s.student_lastname as [Employee Name], s.student_employer_name, s.student_workstation_name, sc.schedule_day, sc.schedule_date, sc.schedule_from, sc.schedule_to   from students s
join student_schedules ss on s.student_SUID = ss.student_SUID
join schedules sc on ss.schedule_id = sc.schedule_id
where s.student_SUID = '358554918';

--All details including total pay amount--
select s.student_SUID, s.student_firstname +' '+ s.student_lastname as [Employee Name], s.student_employer_name, 
s.student_workstation_name, sc.schedule_day, sc.schedule_date, sc.schedule_from, sc.schedule_to, sum(paycheck_amount) from students s
join student_schedules ss on s.student_SUID = ss.student_SUID
join schedules sc on ss.schedule_id = sc.schedule_id
join paychecks p on s.student_SUID = p.paycheck_student_SUID 
--where s.student_SUID = '358554918'
group by p.paycheck_student_SUID, s.student_SUID, s.student_firstname, s.student_lastname, s.student_employer_name,
s.student_workstation_name, sc.schedule_day, sc.schedule_date, sc.schedule_from, sc.schedule_to



--Paycheck details--
Create view [Paycheck Data] AS
select student_firstname+' '+student_lastname as[Student Name],student_employer_name, paycheck_student_SUID, sum(paycheck_amount) as [Total paycheck amount] from paychecks 
join students on paycheck_student_SUID = student_SUID
group by paycheck_student_SUID, student_firstname, student_lastname, student_employer_name;


--View the average rating of an employee--
Create View [Average Rating View] AS
select s.student_firstname+' '+s.student_lastname as [Student Name], s.student_SUID, AVG(ratings) as [Average Rating], s.student_employer_name from student_ratings sr
join students s on s.student_SUID = sr.student_SUID
group by sr.student_SUID, student_firstname, student_lastname, s.student_SUID, s.student_employer_name;

select * from workstations
select * from students




select * from [Sadler Schedule]
