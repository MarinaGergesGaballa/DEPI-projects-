-------------create database employeesD_B---------

create database employeesD_B

use employeesD_B

------------create table department -------------

create table department   

(

dep_id int primary key identity (1001,1),

dep_name varchar (20) not null,

dep_locatin varchar (15)

)


-------------------------------------------------------
insert into department ( dep_name, dep_locatin) values 

('FINANCE', 'SYDNEY'),( 'AUDIT', 'MELBOURNE'),('MARKETING', 'PERTH'),('RODUCTION', 'BRISBANE') 
 
 -------------------------------
 select * from department

 --------------------------------------------------------------------------------------------------------------

 ---------------create table2 employees-----------------------------
 
 create table employees

 (

 emp_id int primary key identity (60001,1),

  emp_name varchar (15) not null,
  
  job_name varchar (10)not null,
  
  manager_id int,
  
  hire_date date not null,
  
  salary decimal (10,2) not null,
  
  commission decimal (7,2)

  )

  ------------------------------------------

  insert into employees (emp_name, job_name, manager_id, hire_date, salary, commission) values
  ('KAYLING','PRESIDENT', null,'1991/11/18', 6000, null),
  ('BLAZE', 'MANAGER', 60001, '1991/5/1', 2750, null),
  ('CLARE','MANAGER', 60001, '1991/6/9', 2550, null),
  ('JONAS',' MANAGER', 60001,'1991/4/2', 2957, null),
  ('SCARLET',' ANALYST',60004,'1997/4/19', 3100, null),
  ('FRANK', 'ANALYST', 60004,'1991/12/3', 3100,null),
  ('SANDRINE','CLERK', 60004,'1990/12/18', 900, null),
  ('ADELYN','SALESMAN',60007, '1991/2/20', 1700, 400),
  (' WADE', 'SALESMAN', 60007, '1991/2/22', 1350, 600),
  ('MADDEN',' SALESMAN',60007, '1991/9/28', 1350, 1500),
  (' TUCKER',' SALESMAN', 60007,'1991/9/8', 1600, 0),
  (' ADNRES',' CLERK', 60001,'1997/5/23', 1200, null),
  (' JULIUS', 'CLERK', 60001,'1991/12/3',1050, null),
  (' MARKER', 'CLERK', 60001,'1992/1/23', 1400, null)

select * from  employees
  ------------------------------------------------------------------------------------------------

  select * from department
  select * from  employees

  ------------------------------------------------------------------

  alter table employees
  drop constraint PK__employee__1299A861B10E0080

  alter table employees
  drop column emp_id

  alter table employees
  add emp_id int identity (1,1)

  alter table employees
  drop column emp_id

  alter table employees
  add emp_id int identity (60001,1)

  alter table employees
  drop column emp_id

  alter table employees
  add emp_id int primary key identity (60001,1)

  ------------------------------------------------------------------------------------------------------
  drop table employees --------drop table with its data

  delete from employees --------delete all data only and keep table empty

insert into employees (emp_name, job_name, manager_id, hire_date, salary, commission) values
  ('KAYLING','PRESIDENT', null,'1991/11/18', 6000, null),
  ('BLAZE', 'MANAGER', 60001, '1991/5/1', 2750, null)

  delete from employees where emp_id=60023 --------------delete row-----------------

  select * from employees

  truncate table employees--------delete all data but keep attributes(index zero)


  select * from employees

  -----------------------------------------------------------------------------------------------------------------------
  select emp_name as 'Employee name', hire_date as 'Join date' from employees

  select emp_name as 'Employee name', format (hire_date, 'dd/MM/yyyy') as 'Join date' from employees

  select emp_name as 'Employee name', format (hire_date, 'MMMM/dd/yyyy') as 'Join date' from employees

  select emp_name as 'Employee name', format (hire_date, 'MMMM/dd/yyyy') as 'Join date' from employees

  select emp_name as 'Employee name', format (hire_date, 'MMM/dd/yyyy') as 'Join date' from employees

  select emp_name as 'Employee name', format (hire_date, 'MM/ddd/yyyy') as 'Join date' from employees

  select emp_name as 'Employee name', format (hire_date, 'MM/dddd/yyyy') as 'Join date' from employees

  select emp_name as 'Employee name', format (hire_date, 'ddd/MM/yyyy') as 'Join date' from employees

  select emp_name as 'Employee name', format (hire_date, 'dd/MM/yyyy') as 'Join date',format (hire_date, 'MMMM') as 'Join month'
  from employees

  select emp_id , emp_name as 'Employee name', format (hire_date, 'dd/MM/yyyy') as 'Join date',format (hire_date, 'dddd') as 'Join day',
  format (hire_date, 'MMMM') as 'Join moth', format (hire_date, 'yyyy') as 'join year'
  from employees

  alter table employees
  add dep_id int 

  -----------------------------------------------------------------------------------------------------

  select *from employees
  select *from department

  --------------------------------------------------------------------------------------------------------------

  alter table employees
  add constraint department_id_fk
  foreign key (dep_id)
  references department (dep_id)

  ----------------------------------------------------------------------------------------------------

  update employees
  set dep_id=1001
  where emp_id=60001

  update employees
set dep_id=1001
where emp_id=60001

update employees
set dep_id=1003
where emp_id=60002

update employees
set dep_id=1003
where emp_id=60003

update employees
set dep_id=1002
where emp_id=60004

update employees
set dep_id=1002
where emp_id=60005

update employees
set dep_id=1002
where emp_id=60006

update employees
set dep_id=1002
where emp_id=60007

update employees
set dep_id=1003
where emp_id=60008

update employees
set dep_id=1003
where emp_id=60009

update employees
set dep_id=1003
where emp_id=60010

update employees
set dep_id=1003
where emp_id=60011

update employees
set dep_id=1002
where emp_id=60012

update employees
set dep_id=1003
where emp_id=60013

update employees
set dep_id=1001
where emp_id=60014

--------------------------------------------------------------------------------------

-------------------------------------------Join----------------------------------------

select employees.emp_name , department.dep_name from employees inner join department
on employees.dep_id = department.dep_id

-----------------------------لو بدلنا اسماء الكولومس-----------------

select department.dep_name , employees.emp_name from employees inner join department
on employees.dep_id = department.dep_id

-------------------------ادينا اسم لل كولومس و اسم للتيبل---------------------------

select emp.emp_name'employeename' , dep.dep_name 'departmentname'  from employees as emp inner join department as dep
on emp.dep_id = dep.dep_id
---------------------------------------------------------------------------------------
select employees.emp_name , department.dep_name from employees left join department
on employees.dep_id = department.dep_id

select employees.emp_name , department.dep_name from employees right join department
on employees.dep_id = department.dep_id

select employees.emp_name , department.dep_name from employees full join department
on employees.dep_id = department.dep_id

-------------------------------------------------------------------------------------

------------------------------في حالة عاوزه اظهر ال id------------------------
select employees.emp_name , department.dep_id from employees full join department
on employees.dep_id = department.dep_id

--------------------------------------------------------------------------------------
----------------------------------------self join--------------------------

select  emp1.emp_name as 'EmployeeName', emp2.emp_name as 'ManagerName' from employees as emp1  inner join employees as emp2
on emp1.emp_id = emp2.manager_id

select * from employees
select * from department
---------------------------------------------------------------------------------------------
select count(emp_name) as 'Total employees' from employees

select sum (salary) as 'Total salary' from employees

select emp_name from employees where year(hire_date)<'1991'

select avg (salary) as 'average salary' from employees where job_name ='ANALYST'

select emp_name , salary/30 as 'sal per day'  from employees 

-------------------------------------Order by ascending  تنازلي  ----------------------------

select emp_name , salary from employees order by salary asc 

-------------------------------------Order by descending  تصاعدي ---------------------------

select emp_name, salary from employees order by salary desc

------------------------------------------------------------------------------------------------------------------

--------------------------------------تاريخ التعيين-----------------

select emp_name, year(hire_date) as Hiredate from employees

select year(getdate()) as Thisyear

select(getdate()) as Thisyear

select format(hire_date,'dd/MM/yyyy') as Hiredate from employees

select format(getdate(),'dd/MM/yyyy') as Thisyear

----------------------------عدد سنوات الخبرة-------------------------

select emp_name, year(getdate())-year(hire_date) as Experience from employees
order by Experience asc

select emp_name, format(getdate(),'yyyy')-year(hire_date) as ExperienceYears from employees
order by ExperienceYears desc

------------------------------------------------------------------------------------------------------------
select * from employees
select * from department

-------------------------------------------Group by------------------------------------------
   
----------------------------------aggrigation function---------------------

select sum(salary) from employees

select avg(salary) from employees 

select max(salary) from employees

-------------------------------------------------------------------------------------------------------------------
-------------------------------عند استخدام اجريجيشن فنكشن مع كولوم اخر يجب استخدام جروووب باي------------
select job_name, avg(salary) from employees group by job_name

select job_name, max(salary)from employees group by job_name

select job_name, sum(salary)from employees group by job_name

   ------------------------------total salary in every department and order by----------------------

select dep.dep_name, sum(emp.salary) as 'Total Salary' from department as dep inner join employees as emp
on dep.dep_id=emp.dep_id
group by dep.dep_name 
order by 'Total Salary' desc

----------------------------------------------------Having------------------------------------------------------
------------------------ عند وضع شرط مع جروب باي في وجودالاجريجيشن فانكشن نستخدم هافنج---------------

select avg(salary) from employees

SELECT job_name , max(salary) as 'Max salary' from employees group by job_name 
having max(salary) <(select avg(salary) from employees)

 
SELECT job_name , max(salary) as 'Max salary' from employees 
group by job_name 
having max(salary) <2000 
order by max(salary) asc

-----------------------------------------------------------------------------------------------------------















