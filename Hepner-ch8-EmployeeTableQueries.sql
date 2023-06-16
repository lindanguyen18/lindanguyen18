/* Database Systems, Coronel/Morris */
/* Type of SQL : MySQL  */


/* HEPNER CHANGES TO STUDENT DOWNLOADS */
/* The following statements will delete/clear the database so you can run this script multiple times */

DROP DATABASE if exists CH7;
CREATE DATABASE CH7;
USE CH7;

/* END OF HEPNER CHANGES */


/* -- CREATE THE JOB TABLE -- */
CREATE TABLE JOB (
  JOB_CODE        VARCHAR(3),
  JOB_DESCRIPTION VARCHAR(25),
  JOB_CHG_HOUR    DECIMAL(8,2),
  JOB_LAST_UPDATE DATETIME,
  PRIMARY KEY(JOB_CODE)
);

/* -- INSERT DATA INTO THE JOB TABLE -- */
/*--                   JOB_CODE, JOB_DESCRIPTION, JOB_CHG_HOUR, JOB_LAST_UPDATE) --*/

INSERT INTO JOB VALUES('500','Programmer',           '35.75','2017-11-20');
INSERT INTO JOB VALUES('501','Systems Analyst',      '96.75','2017-11-20');
INSERT INTO JOB VALUES('502','Database Designer',    '125',  '2018-3-24');
INSERT INTO JOB VALUES('503','Electrical Engineer',  '84.5', '2017-11-20');
INSERT INTO JOB VALUES('504','Mechanical Engineer',  '67.9', '2017-11-20');
INSERT INTO JOB VALUES('505','Civil Engineer',       '55.78','2017-11-20');
INSERT INTO JOB VALUES('506','Clerical Support',     '26.87','2017-11-20');
INSERT INTO JOB VALUES('507','DSS Analyst',          '45.95','2017-11-20');
INSERT INTO JOB VALUES('508','Applications Designer','48.1', '2018-3-24');
INSERT INTO JOB VALUES('509','Bio Technician',       '34.55','2017-11-20');
INSERT INTO JOB VALUES('510','General Support',      '18.36','2017-11-20');


/* -- CREATE AN EMPLOYEE TABLE -- */ 
CREATE TABLE EMPLOYEE (
  EMP_NUM       VARCHAR(3),
  EMP_LNAME     VARCHAR(15)	NOT NULL, /* NOT NULL REQUIRES THAT A VALUE BE ENTERED, THIS IS CALLED A CONSTRAINT */ 
  EMP_FNAME     VARCHAR(15)	NOT NULL,
  EMP_INITIAL   VARCHAR(1),      /* NOTICE BELOW THAT EMP_NUM 110 HAS A NULL INITIAL. PLACE NOT NULL BETWEEN THE DATA TYPE AND , */ 
  EMP_HIREDATE  DATETIME	NOT NULL,               /* THEN RE-RUN THIS ENTIRE SCRIPT */ 
  JOB_CODE      VARCHAR(3),
  EMP_YEARS     INT,  				
  PRIMARY KEY(EMP_NUM),
  FOREIGN KEY (JOB_CODE) REFERENCES JOB(JOB_CODE)   /* on delete cascade */
  ,
  check (emp_years < 40) /*  /* Try this constraint, check (EMP_Years < 40) */
 );

 insert into employee values ('110','hepner','michelle',null,'2000-11-08','500','44'); 
 
  INSERT INTO EMPLOYEE VALUES('101','Tester','Tester','A','2000-11-8',null,'4'); 
  select * from employee;
 INSERT INTO EMPLOYEE VALUES('102','Tester','Tester','A','2000-11-8','700','4');  
 insert into employee values('103','Test','Cascade','A','2000-11-8','510','10');   /* see on delete cascade note above */

insert into employee values('104','Adams','Adam','A','2020-01-01','501','5');
 select * from employee; 
  /* now attempt to delete the general support job */ 
 delete from job where job_code = '510';

/* difference between a left join and a right join */
 select employee.job_code, job.job_description, employee.EMP_LNAME, employee.EMP_FNAME, employee.emp_num 
 from job 
  left join employee
 on job.job_code = employee.job_code
 order by job.job_code;
 
 select * from job;
 
 
 