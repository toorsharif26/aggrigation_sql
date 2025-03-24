--SELECT * from hr.EMPLOYEES;

--select count(*) from hr.employees;

--exploratory data analysis
-- select department_id,avg(salary),MEDIAN(salary),STDDEV(salary),VARIANCE(salary),max(salary),min(salary) FROM
-- hr.EMPLOYEES

-- select department_id,count(*)as employees from HR.EMPLOYEES
-- group by department_id;

-- select DEPARTMENT_ID,avg(salary) as avg_salary from 
-- HR.EMPLOYEES;

-- select department_id, count(DISTINCT JOB_ID) from HR.EMPLOYEES
-- group by department_id;

-- select department_id,avg(salary),MEDIAN(salary),STDDEV(salary),VARIANCE(salary),max(salary),min(salary) FROM
-- hr.EMPLOYEES
-- group by DEPARTMENT_ID;

-- select department_id,count(department_id) from HR.EMPLOYEES
-- group by DEPARTMENT_ID;

-- select department_id,count(department_id) as No_Employee from HR.EMPLOYEES
-- group by DEPARTMENT_ID
-- HAVING No_Employee >= 5;

-- select department_id,avg(salary) as avg_salary from HR.EMPLOYEES 
-- group by DEPARTMENT_ID
-- HAVING avg_salary BETWEEN 5000 and 9000;

-- SELECT department_id,avg(salary) as avg_salary from HR.EMPLOYEES
-- group by DEPARTMENT_ID
-- HAVING count(DISTINCT JOB_ID)>=3;

--select employee_id,salary from HR.EMPLOYEES order by SALARY desc;

-- select department_id,sum(salary) as total_salary from HR.EMPLOYEES 
-- group by DEPARTMENT_ID 
-- HAVING total_salary BETWEEN 10000 and 20000;    

-- select department_id,salary from HR.EMPLOYEES
-- group by DEPARTMENT_ID,SALARY
-- HAVING min(SALARY)>5000 and max(SALARY)<250000
-- order by min(salary) asc

