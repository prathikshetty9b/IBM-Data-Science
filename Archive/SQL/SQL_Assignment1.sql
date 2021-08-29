--Task 0: Drop the table INSTRUCTOR from the database in case it already exists
drop table INSTRUCTOR
;
--Task 1:Create the INSTRUCTOR table
create table INSTRUCTOR
(
ins_id integer not null,
lastname varchar(24) not null,
firstname varchar(24) not null,
city varchar(24),
country char(2),
primary key(ins_id)
)
--Task2A: Insert one row into the INSTRUCTOR table
;
INSERT INTO INSTRUCTOR
(ins_id,lastname,firstname,city,country)
VALUES
(1,'Ahuja','Rav','Toronto','CA')
;
--Task2B: Insert the two rows for Raul and Hima
insert into INSTRUCTOR
(ins_id,lastname,firstname,city,country)
values
(2,'Chong','Raul','Toronto','CA'),
(3,'Vasudevan','Hima','Chicago','US')
;
--Task3: Select all rows from the INSTRUCTOR table
select * from INSTRUCTOR
;
--Task4: Select the firstname, lastname and country where the city is Toronto
select firstname,lastname,country from INSTRUCTOR
	where city='Toronto'
;
--Task4: Update the row for Rav Ahuja and change his city to Markham.
update INSTRUCTOR
	set city='Markham'
	where firstname='Rav' and lastname='Ahuja'
;
--Task5:  Delete the row for Raul Chong from the table
delete from INSTRUCTOR
	where firstname='Raul' and lastname='Chong'
;
--Task5B: Retrieve all rows in the INSTRUCTOR table
select * from INSTRUCTOR
;