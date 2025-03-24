-- --1. Find the total number of employees in each department.
SELECT department_id, COUNT(*) AS total_employees
FROM employees
GROUP BY department_id;

-- --2: Avgerage salary by department
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

-- --3: Get sum of salary by department
SELECT department_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
ORDER BY total_salary DESC
FETCH FIRST 1 ROW ONLY;

-- --4: Highest and lowest salary by Job_Id
select JOB_ID,max(salary) max_salary,min(salary) min_salary from HR.EMPLOYEES
group by JOB_ID;

-- --5: Hired employeed by year
select EXTRACT(year from hire_date) year_of_hire,count(*) employess 
from hr.EMPLOYEES
group by year_of_hire;

`
-- --6: Uses RANK() to assign ranks based on salary in each department.
select department_id, DENSE_RANK() over(partition by DEPARTMENT_ID order by salary)
 as ranks from hr.EMPLOYEES;

-- --7: Uses RANK() to rank employees based on salary and filters top 3.
select employee_id,department_id,salary FROM
(select department_id,employee_id,salary, rank() over(partition by department_id order by salary DESC)as ranks from hr.employees)
 where ranks <= 3;

-- --8: Uses DENSE_RANK() to identify employees with the second-highest salary per department.
select employee_id,department_id,salary from 
(select department_id,employee_id,salary, DENSE_RANK() over(partition by department_id order by salary DESC) ranks from hr.employees) 
where ranks = 2;

-- --9. Compute the cumulative total salary of employees ordered by hire date.
select employee_id,hire_date,salary,
sum(salary) over(ORDER by hire_date) cumulative_total_salary
from hr.EMPLOYEES

-- --10. Assign a row number to each employee in each department.
select department_id,employee_id,
    ROW_NUMBER() over(PARTITION by department_id order by employee_id )as row_num
from hr.employees;

-- --11. Find the salary difference between each employee and the next highest-paid employee.
select department_id,employee_id,
    salary - lead(salary) over(order by salary desc) as salary_diff
    from hr.EMPLOYEES;

-- --12: calculate previous months salary for each employee
SELECT employee_id, salary, hire_date, 
       LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) AS prev_salary
FROM hr.employees;

-- --13: Identify employee whose salary incresed over time
select employee_id,salary,hire_date,
    lag(salary) over(partition by employee_id order by hire_date) as prev_salary,
    case when salary>lag(salary) over(partition by employee_id order by hire_date) then 'Increased' else 'decreased' end as salary_trend
from hr.employees

-- --14. Find the average salary of employees who joined in each year.
select EXTRACT(year from hire_date) hire_year,round(avg(salary),2) avg_salary
from hr.employees
group by hire_year
order by hire_year;


-- --15. Count the number of employees in each job role.
select distinct JOB_ID,count(*) no_of_emply from hr.employees
group by JOB_ID; 


-- -- 16. Find the total salary expenditure for each manager's team.
select manager_id,sum(salary) from HR.employees
group by manager_id;

-- --17. Find the highest-paid employee in each department.
select department_id,max(salary)max_salary from HR.EMPLOYEES
group by department_id;


-- 18. Calculate the running total of salaries for employees hired in each department.
select department_id,employee_id
,sum(salary) over(partition by department_id order by hire_date) as running_total
from hr.EMPLOYEES

-- --19. Find the employees who earn above the average salary of their department.
select employee_id,department_id,salary 
from hr.employees
where salary>(select avg(salary) from hr.employees e where department_id = e.department_id)

-- --20.Rank employees within their department based on experience.
select employee_id,department_id,hire_date,
Rank() over(partition by department_id order by hire_date asc) as experience_rank
from hr.employees;


-- --21. Find the difference between each employee’s salary and the department average.

SELECT employee_id, department_id, salary, 
       salary - AVG(salary) OVER (PARTITION BY department_id) AS salary_diff
    FROM hr.employees;


-- --22. Find the department where the most employees have been hired.
select department_id,count(*) as no_of_emply_hired
from hr.employees
group by department_id
order by no_of_emply_hired DESC
fetch first 1 row only;


-- -- 23. Identify employees who were hired in the same month and year as someone else.
select employee_id,hire_date,
count(*) over(partition by EXTRACT(MONTH from hire_date),EXTRACT(year from hire_date)) as same_month_hire
from HR.EMPLOYEES;

-- -- 24. Calculate the moving average salary over the last 3 employees ordered by hire date.

SELECT employee_id, hire_date, salary, 
       AVG(salary) OVER (ORDER BY hire_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_salary
FROM hr.employees;

-- --25. Find employees whose salary is greater than that of the average of their manager’s team.
SELECT e.employee_id, e.manager_id, e.salary
FROM HR.employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE manager_id = e.manager_id);