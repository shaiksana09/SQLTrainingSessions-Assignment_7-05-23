create database assignment;

-- creating doctor table
create table doctor(
id int primary key not null,
name varchar(30) not null,
specialization varchar(20) not null
);
insert into doctor values(1, "Asish", "Cardiologist"),
(2, "Reza", "Dermatologist"),
(3, "Kashish", "Psychologist"),
(4, "Pooja", "Cardiologist"),
(5, "Emma", "Neurologist");


-- creating appoiintment table
create table appointment(
appoint_num int primary key not null,
doctor_id int not null,
patient_name varchar(30) not null
);
insert into appointment values(100, 1, "Sheela"), 
(101, 1, "Leela"), 
(103, 2, "Hamza"), 
(104, 3, "Saba"), 
(105, 5, "Zoya");


-- creating patient table
create table patient(
name varchar(30) not null,
age int not null,
gender varchar(10) not null
);
insert into patient values("Sheela", 29, "Female"),
("Leela", 59, "Female"),
("Hamza", 30, "Male"),
("Saba", 21, "Female"),
("Zoya", 20, "Female");


-- creating reviews table
create table review(
doctor_id int not null,
patient_name varchar(30) not null, 
patient_review varchar(150) not null
);
insert into review values(1, "Sheela", "The doctor I met was super good"),
(1, "Leela", "The doctor I met was super good"),
(2, "Hamza", "Good understanding, communication"),
(3, "Saba", "Overall, good treatment"),
(5, "Zoya", "There was no proper communication");

-- displaying all the tables
select * from doctor;
select * from appointment;
select * from patient;
select * from review;









