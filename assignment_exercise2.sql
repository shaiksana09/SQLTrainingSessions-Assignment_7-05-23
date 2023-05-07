create table contact(
Id int primary key not null,
Email varchar(30) not null,
fname varchar(30) not null,
Iname varchar(30) not null,
company varchar(20)  not null,
Active_flag int not null,
opt_out int not null
);
insert into contact values
(123, "a@a.com", "Kian", "Seth", "ABC", 1, 1),
(133, "b@a.com", "Neha", "Seth", "ABC", 1, 0),
(234, "c@c.com", "Puru", "Malik", "CDF", 0, 0),
(342, "d@d.com", "Sid", "Maan", "TEG", 1, 0);
select * from contact;

-- queries
-- Select all columns from the contact table where the active flag is 1
select * from contact where Active_flag = 1;

-- Deactivate contacts who are opted out 
update Contact set Active_flag = 0 where opt_out = 1;

-- Delete all the contacts who have the company name as ‘ABC’
delete from contact where company = "ABC";

-- Insert a new row with id as 658, name as ‘mili’, email as ‘mili@gmail.com’, the company as ‘DGH’, active flag as 1, opt-out flag as 1
insert into contact values
(658, "mili@gmail.com", "mili", "Seth", "DGH", 1, 1);
select * from contact;

-- Pull out the unique values of the company column 
select distinct(company) from contact ;

-- Update name “mili” to “niti”.
update contact set fname = "niti" where fname = "mili";
select * from contact;


