/* -----------------------CHAPTER 7 AND 8 SQL PRACTICE -------------------*/ 
/* REMINDER
•	SELECT—specifies the attributes to be returned by the query
•	FROM—specifies the table(s) from which the data will be retrieved
•	WHERE—filters the rows of data based on provided criteria
•	GROUP BY—groups the rows of data into collections based on sharing the same values in one or more attributes
•	HAVING—filters the groups formed in the GROUP BY clause based on provided criteria
•	ORDER BY—sorts the final query result rows in ascending or descending order based on the values of one or more attributes.

/*------------------------------------------------------------------------*/ 
select * from job; 
select * from employee; 
/* USING THE DATE FUNCTION */ 
/* SELECT ALL JOBS THAT WERE UPDATED ON NOVEMBER 20, 2017 */ 
select * from job where date(JOB_LAST_UPDATE) = "2017-11-20";
select * from job where job_code = "500";

/* USING THE DATE FUNCTION WITH BETWEEN */ 
select * from job where (JOB_LAST_UPDATE) between "2017-11-20" and "2018-12-24";
select * from job where JOB_CODE >= "500" and JOB_CODE <= "505";

/* EXAMPLE USES OF MYSQL NOT  */
/* != OR <> MEANS NOT EQUAL */ 
select * from job where DATE(JOB_LAST_UPDATE) != "2017-11-20";
select * from job where date(job_last_update) <> "2017-11-20";
/* using NOT as a logical operator */ 
SELECT * FROM JOB WHERE not(JOB_DESCRIPTION = "Programmer");

/* EXAMPLE OF USING OR */ 
select * from job where JOB_DESCRIPTION = "Programmer" or JOB_DESCRIPTION = "General Support";

/* EXAMPLE OF USING AND ... WITH LIKE FOR STRING SEARCHING */ 
/* LIKE: IF THE FIELD BEGINS WITH YOUR SEARCH STRING THEN USE ... LIKE 'SEARCHSTRING%' */
select * from employee where emp_lname like 'smith%' and emp_years > 0;
/* LIKE: IF THE FIELD ENDS WITH YOUR SEARCH STRING THEN USE ....  LIKE '%SEARCHSTRING' */
select * from employee where job_code > 502 and EMP_LNAME like '%son';
/* LIKE: IF THE FIELD CONTAINS YOUR SEARCH STRING ANYWHERE IN THE FIELD, THEN USE .... LIKE '%SEARCHSTRING%' */
select * from job where JOB_CHG_HOUR > 60 AND JOB_DESCRIPTION LIKE  '%engineer%'; 

/* EXAMPLE OF USING IN */ 
select * from job where JOB_CHG_HOUR in (84.50,55.78,67.90); 
/* EXAMPLE OF USING IS NULL */
select EMPLOYEE.EMP_NUM, EMP_LNAME AS Last, EMP_FNAME as First, PROJ_NUM 
from EMPLOYEE 
left join ASSIGNMENT on EMPLOYEE.EMP_NUM = ASSIGNMENT.EMP_NUM 
where PROJ_NUM is null
order by EMP_NUM; 

/* IS NOT NULL */
select EMPLOYEE.EMP_NUM, EMP_LNAME AS Last, EMP_FNAME as First, PROJ_NUM 
from EMPLOYEE left join ASSIGNMENT on EMPLOYEE.EMP_NUM = ASSIGNMENT.EMP_NUM 
where PROJ_NUM is not null
order by EMP_NUM; 

/* --------------------------AGGREGATE FUNCTIONS COUNT, MIN, MAX, SUM, AVG ----------------------------------------*/ 
/* EXAMPLE OF COUNT */
SELECT COUNT(EMP_NUM) AS "NUMBER OF EMPLOYEES" FROM EMPLOYEE; 

/* EXAMPLE OF MIN */ 
select EMPLOYEE.EMP_NUM, EMP_LNAME AS Last, EMP_FNAME as First, 
PROJ_NUM, min(assignment.assign_hours) as LeastHours
from EMPLOYEE 
left join ASSIGNMENT on EMPLOYEE.EMP_NUM = ASSIGNMENT.EMP_NUM 
where PROJ_NUM is not null
order by EMP_NUM; 

/* EXAMPLE USING SUM, GROUP_BY, AND ORDER_BY */ 
select EMPLOYEE.EMP_NUM, EMP_LNAME AS Last, EMP_FNAME as First, PROJ_NUM, 
sum(assignment.assign_hours) as TotalHours
from EMPLOYEE 
left join ASSIGNMENT 
on EMPLOYEE.EMP_NUM = ASSIGNMENT.EMP_NUM 
where PROJ_NUM is not null
group by employee.emp_num
order by TotalHours asc; 

/* EXAMPLE USING HAVING */ 
select EMPLOYEE.EMP_NUM, EMP_LNAME AS Last, EMP_FNAME as First, PROJ_NUM, 
sum(assignment.assign_hours) as TotalHours
from EMPLOYEE 
left join ASSIGNMENT on EMPLOYEE.EMP_NUM = ASSIGNMENT.EMP_NUM 
where PROJ_NUM is not null
group by employee.emp_num
order by TotalHours asc; 

/* -------------------------------------SUBQUERIES----------------------------------------------- */
/* EXAMPLE:  SUBQUERY IN WHERE */
/*           FIRST TEST THE SUBQUERY RETURNS ONLY ONE ANSWER */ 
select avg(assignment.assign_hours) from assignment  ;
/*            NOW SELECT ALL THE EMPLOYEES WHOSE ASSIGN_HOURS ARE GREATER THAN THE AVERAGE */ 
select EMPLOYEE.EMP_NUM, EMP_LNAME AS Last, EMP_FNAME as First, PROJ_NUM, sum(assign_hours)
from EMPLOYEE 
left join ASSIGNMENT on EMPLOYEE.EMP_NUM = ASSIGNMENT.EMP_NUM 
where (PROJ_NUM is not null) and (assign_hours > (Select avg(assignment.assign_hours) from assignment ))
group by employee.emp_num
order by  EMP_Lname asc;

/* EXAMPLE USING SUBQUERIES IN HAVING CLAUSE */ 
/* TEST THE SUBQUERY */ 
select avg(assign_hours) from assignment;

/* USE THE QUERY IN A HAVING CLAUSE AS A SUBQUERY */ 
select assignment.emp_num, employee.EMP_FNAME as First, employee.EMP_LNAME as Last, assign_hours
from assignment 
join employee on assignment.emp_num = employee.emp_num
group by emp_num
having assign_hours > (select avg(assign_hours) from assignment)
order by Last;

/* EXAMPLE USING ANY */ 
select emp_num, EMP_FNAME, EMP_LNAME 
from employee 
where (emp_num = any (select emp_num from assignment));

/* EXAMPLE USING NOT AND IN  */ 
select emp_num, EMP_FNAME, EMP_LNAME 
from employee 
where  (emp_num NOT IN (select emp_num from assignment));

/* EXAMPLE OF A SUBQUERY IN A FROM CLAUSE */
select sum(assign_hours) as hours from assignment group by emp_num;
/* now using the subquery */ 
select max(hours), min(hours), avg(hours)
from 
(select sum(assign_hours) as hours from assignment group by emp_num) as emp_hours;


/* EXAMPLE OF CONCAT FUNCTION */ 
select concat(Emp_fname," ",emp_lname) as ProjectManager, proj_name as ProjectName
from project
join employee 
on employee.emp_num = project.emp_num;

/* EXAMPLE OF CREATING A NEW TABLE */
create table payroll as
select assignment.emp_num, employee.EMP_FNAME as First, employee.EMP_LNAME as Last, SUM(assign_hours)
from assignment 
join employee on assignment.emp_num = employee.emp_num
group by emp_num
order by Last;

select * from payroll;


/* EXAMPLE OF UPDATING A TABLE */ 
update employee
set Emp_years = (datediff(sysdate(),emp_hiredate)/365)
where emp_num in (select emp_num from assignment);
select * from employee;
/*--------------------------------------------------------------------------------------*/

 



