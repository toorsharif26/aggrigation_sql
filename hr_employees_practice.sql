select department_id, count(*) AS total_employees
from hr.employees
GROUP BY  department_id;
-- this will give total number of employees in a department

select department_id, avg(salary) as avg_salary
from hr.EMPLOYEES
group by DEPARTMENT_ID;
-- give average salary each department

select department_id, MAX(salary) as max_salary , MIN(salary) as min_salary
from hr.EMPLOYEES
group by DEPARTMENT_ID ;
--this will give max salary in each department 

select department_id,  MIN(salary) as min_salary
from hr.EMPLOYEES
group by DEPARTMENT_ID ;
--this will give min salary in each department 

select departmnet_id , sum(salary) from hr.EMPLOYEES
group by DEPARTMENT_ID;
-- this will give sum of salaries in each department

select EXTRACT(year from hire_date) as hire_year, count(*) as number_of_hire
from hr.employees
group by hire_year
order by hire_year;
--give the number of hire each year in ascending 

SELECT dpt.location_id, SUM(emp.salary) AS total_salary
FROM hr.employees emp
JOIN hr.departments dpt ON emp.department_id = dpt.department_id
GROUP BY dpt.location_id;

-- give sum total salary in each loaction

select manager_id, count(*) as num_employee from hr.EMPLOYEES
where manager_id is not null
group by manager_id;
-- give number of employeees under each manager where manager is not null

select manager_id, max(salary) as max_salary from hr.EMPLOYEES
where manager_id is not null
group by MANAGER_ID;
-- give max salary of employeees under each manager where manager is not null

SELECT manager_id, AVG(salary) AS avg_salary
FROM hr.employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;
--give avg salary under each manager where id is not null

SELECT EXTRACT(MONTH FROM hire_date) AS hire_month, COUNT(*) AS total_hired
FROM hr.employees
GROUP BY hire_month
ORDER BY hire_month;
-- gives total number of hire in each months

SELECT department_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
ORDER BY total_salary DESC
FETCH FIRST 1 ROW ONLY;

--gives max sum of salary department have

SELECT job_id, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY job_id
ORDER BY avg_salary DESC
FETCH FIRST 1 ROW ONLY;

--gives max avg salary employee have 

SELECT loc.city, COUNT(*) AS total_employees
FROM hr.employees emp
JOIN hr.departments dpt ON emp.department_id = dpt.department_id
JOIN hr.locations loc ON dpt.location_id = loc.location_id
GROUP BY loc.city;

-- gives the employee count by each city

SELECT department_id, COUNT(*) AS employees_with_commission
FROM hr.employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;

-- gives numver of employee with commission by each department

SELECT department_id, SUM(salary) AS total_salary_with_commission
FROM hr.employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;

--gives sum of salary each department where commission is not null