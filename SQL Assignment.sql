/* Database Systems, Coronel/Morris */
/* Type of SQL : MySQL  */


/* HEPNER CHANGES TO STUDENT DOWNLOADS */
/* The following statements will delete/clear the database so you can run this script multiple times */

DROP DATABASE if exists CH7;
CREATE DATABASE CH7;
USE CH7;

/* END OF HEPNER CHANGES */


/* NOTE: Char fields are right padded with spaces to the specified length. */
/*   when the char values are retrieved the trailing spaces are removed unless specified to be retained */ 
/*        Varchar fields are variable length, and typically more memory efficient for variable length fields. */
/*        varchar fields and char fields generate errors if the value is too long */
/*        
/* -- CREATE THE JOB TABLE -- */
CREATE TABLE JOB (
  JOB_CODE        CHAR(3),     
  JOB_DESCRIPTION VARCHAR(25),    /* we should use varchar anytime we think the fields will vary in length */ 
  JOB_CHG_HOUR    DECIMAL(8,2) NOT NULL,
  JOB_LAST_UPDATE DATE,	          
  PRIMARY KEY(JOB_CODE)
);

INSERT INTO JOB VALUES('100','JOB JUN15-ENID','15.00','2022-08-30');
INSERT INTO JOB VALUES('200','JOB JUL30-GUTHRIE','21.50','2022-08-01');
INSERT INTO JOB VALUES('300','JOB OCT01-EDMOND','28.00','2022-09-28');
INSERT INTO JOB VALUES('350','JOB OCT22-OKLACITY','25.00','2022-10-17');

/* 1. WRITE A SELECT STATEMENT THAT DISPLAYS THE JOB TABLE 4 points*/
select * from job;

/* 2. WRITE A SELECT STATEMENT THAT DISPLAYS ALL JOBS WITH A JOB CODE BEGINNING WITH 3 (4 points)*/
select * from job where job_code like '%3%';

/* 3. WRITE A VERY SIMPLE UPDATE STATEMENT TO UPDATE THE CHARGE RATE FOR JOB OCT22-OKLACITY TO 25.75 (4 points ) */
update job
set job_chg_hour = '25.75' 
where job_description = 'JOB OCT22-OKLACITY';

/* 4. THE FOLLOWING GENERATES AN ERROR	(4 points) */
/*     IDENTIFY THE ERROR AND FIX THE STATEMENT SO THAT IT WILL WORK */
/*     WRITE A COMMENT EXPLAINING WHAT YOU CHANGED AND WHY */
 insert into job values ('304','JOB SEP01-TULSA', '120.00','2021-11-01');  
 /* I change the job_code value from 6304 to 304 because it violate the rule char(3) in create table section


/* 5. THE FOLLOWING GENERATES AN ERROR	(4 points) */
/*     IDENTIFY THE ERROR AND FIX THE STATEMENT SO THAT IT WILL WORK */
/*     WRITE A COMMENT EXPLAINING WHAT YOU CHANGED AND WHY */
insert into job values(601,'JOB MAY15-GUYMON','123456.2','2017-11-01'); 
/* I change the Job_chg_hour to 123456.2 to match the rule decimal(8,2) 

/* 6. THE FOLLOWING GENERATES AN ERROR (2 points)*/
/*     IDENTIFY THE ERROR AND FIX THE STATEMENT SO THAT IT WILL WORK */
/*     WRITE A COMMENT EXPLAINING WHAT YOU CHANGED AND WHY */

insert into job values ('505', 'JOB APR01-WATONGA','23.5', null); 
/* I detele these terms: job_code word, job_description, job_last_update, put in value for job_chg_hour to make it not null because it cannot be null
/* I can either put date in or not because it's not required. 

/* 7. WRITE A DELETE STATEMENT TO DELETE JOB 100 FROM THE JOB TABLE (2 points) */
delete from job where job_code = '100';

/* 8. EXECUTE THIS STATEMENT (1 point + 1 bonus point) */
/* VIEW THE JOB TABLE AGAIN AND DISCUSS HOW THE JOB_CODE VALUE OF 99 IS STORED IN THE TABLE */
insert into job values('99','JOB MAR28-WOODWARD',15.50,'2018-10-10');
/* it is stored at the end of the table, all the values of all collumn line up correctly in that last row


