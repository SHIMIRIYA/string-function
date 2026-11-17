 -- Display the first names of all students in capital letters.
 use college_db;
 select first_name,upper(first_name) from students;
-- Display the last names of all students in small letters.
select last_name,lower(last_name) from students;
 -- Display the full name of every student (first name, a space, then last name) with the heading 
 select concat(first_name,' ',last_name) as full_name from students;
-- Display each student’s first name along with the number of letters in it.
select first_name,length(first_name) as no_of_letter from students;
-- Display the first three letters of each student’s first name.
select first_name,substring(first_name,1,3) from students;
-- Display each student’s initials, made of the first letter of the first name followed by the first letter of the last name, with the heading .
select concat(substring(first_name,1,1),' ',substring(last_name,1,1)) as initial from students;
-- Display the first names of students whose first name has more than 6 letters.
select first_name,length(first_name) from students where length(first_name)>6; 
 -- Display a student code for every student, made of the first four letters of the department in capital letters followed by the student ID (for example COMP1), with the heading .
 select concat(upper(left(department,4)),student_id) as 'student_code'from students;
-- Display the text Route Academy (with 3 spaces on each side) after removing the extra spaces, and also display its length before and after removing the spaces.
select concat('   ','Route Academy','   ');
select length(concat('   ','Route Academy','   '));
select trim(concat('   ','Route Academy','   '));
-- Display each student’s first name along with the year of birth.
select first_name ,year(date_of_birth) as 'date_year' from students;
-- Display each student’s first name along with the month of birth as a number.
select first_name ,month(date_of_birth) as 'date_month' from students;
-- Display the first name and date of birth of students born in March.
select first_name,month(date_of_birth) from students where month(date_of_birth)=3;
-- Display each student’s date of birth in the form 12-03-2004 (day, month, year).
select first_name,date_of_birth,date_format(date_of_birth,'%d-%m-%y') from students;
-- Display each student’s date of birth in the form 12 March 2004.
select first_name,date_format(date_of_birth,'%d %M %y') from students;
-- Display each student’s first name along with the number of days from the date of birth to 1 January 2026.
select first_name,date_of_birth,datediff('2026-01-01',date_of_birth) from students;
-- Display the number of students born in each year.
select year(date_of_birth) as year_born ,count(student_id)from students group by year(date_of_birth) order by year (date_of_birth) asc;
-- For students born in 2004, display the departments that have at least 5 such students, along with the number of students.
select department,count(*) from students where year(date_of_birth) =2004 group by department having count(*)>=5;
