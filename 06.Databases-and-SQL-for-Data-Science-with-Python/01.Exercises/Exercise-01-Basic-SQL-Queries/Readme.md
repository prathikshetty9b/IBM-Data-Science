## Basic SQL Queries

### Task List

**Task 0:** Drop the table INSTRUCTOR from the database in case it already exists, so that we start from a clean state.

(Hint: Ignore the undefined error if this table does not already exist in your database)

**Task 1:** Create the INSTRUCTOR table as defined above. Have the ins_id be the primary key, and ensure the lastname and firstname are not null.

(Hint: ins_id is of type INTEGER, country of type CHAR(2), and rest of the fields VARCHAR)

**Task 2A:** Insert one row into the INSTRUCTOR table for the the instructor Rav Ahuja.

(Hint: values for the character fields require a singe quotation mark (') before and after each value)

**Task 2B:** Insert two rows at once in the INSTRUCTOR table for instructors Raul Chong and Hima Vasudevan.

(Hint: list the values for the second row after the first row)

**Task 3:** Select all rows from the INSTRUCTOR table.

**Task 3B:** Select the firstname, lastname and country where the city is Toronto

**Task 4:** Update the row for Rav Ahuja and change his city to Markham.

**Task 5:** Delete the row for Raul Chong from the table.

**Task 5B:** Retrieve all rows in the INSTRUCTOR table

## Solution

**Task 0:** Drop the table INSTRUCTOR from the database in case it already exists, so that we start from a clean state.

```sql
-- 0. Drop table INSTRUCTOR in case it already exists
drop table INSTRUCTOR
;
```

**Task 1:** Create the INSTRUCTOR table as defined above. Have the ins_id be the primary key, and ensure the lastname and firstname are not null.

```sql
--1. Create table INSTRUCTOR
CREATE TABLE INSTRUCTOR
  (ins_id INTEGER PRIMARY KEY NOT NULL, 
   lastname VARCHAR(15) NOT NULL, 
   firstname VARCHAR(15) NOT NULL, 
   city VARCHAR(15), 
   country CHAR(2)
  )
;
```

**Task 2A:** Insert one row into the INSTRUCTOR table for the the instructor Rav Ahuja.

```sql
--2A. Insert single row for Rav Ahuja
INSERT INTO INSTRUCTOR
  (ins_id, lastname, firstname, city, country)
  VALUES 
  (1, 'Ahuja', 'Rav', 'Toronto', 'CA')
;
```

**Task 2B:** Insert two rows at once in the INSTRUCTOR table for instructors Raul Chong and Hima Vasudevan.

```sql
--2B. Insert the two rows for Raul and Hima
INSERT INTO INSTRUCTOR
  VALUES
  (2, 'Chong', 'Raul', 'Toronto', 'CA'),
  (3, 'Vasudevan', 'Hima', 'Chicago', 'US')
;
```

**Task 3:** Select all rows from the INSTRUCTOR table.

```sql
--3. Select all rows in the table
SELECT * FROM INSTRUCTOR
;
```

**Task 3B:** Select the firstname, lastname and country where the city is Toronto

```sql
--3b. Select firstname, lastname and country where city is Toronto
SELECT firstname, lastname, country from INSTRUCTOR where city='Toronto'
;
```

**Task 4:** Update the row for Rav Ahuja and change his city to Markham.

```sql
--4. Change the city for Rav to Markham
UPDATE INSTRUCTOR SET city='Markham' where ins_id=1
;
```

**Task 5:** Delete the row for Raul Chong from the table.

```sql

--5. Delete the row for Raul Chong
DELETE FROM INSTRUCTOR where ins_id=2
;

```

**Task 5B:** Retrieve all rows in the INSTRUCTOR table

```sql
--5b. Retrieve all rows from the table
SELECT * FROM INSTRUCTOR 
;
```