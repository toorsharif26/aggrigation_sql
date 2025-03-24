-- SELECT department_id, COUNT(*) AS total_employees
-- FROM employees
-- GROUP BY department_id;

-- SELECT department_id, AVG(salary) AS avg_salary
-- FROM employees
-- GROUP BY department_id;

-- SELECT department_id, SUM(salary) AS total_salary
-- FROM hr.employees
-- GROUP BY department_id
-- ORDER BY total_salary DESC
-- FETCH FIRST 1 ROW ONLY;

-- select JOB_ID,max(salary) max_salary,min(salary) min_salary from HR.EMPLOYEES
-- group by JOB_ID;

-- select EXTRACT(year from hire_date) year_of_hire,count(*) employess 
-- from hr.EMPLOYEES
-- group by year_of_hire;


-- Uses RANK() to assign ranks based on salary in each department.
-- select department_id, DENSE_RANK() over(partition by DEPARTMENT_ID order by salary)
--  as ranks from hr.EMPLOYEES;

 -- Uses RANK() to rank employees based on salary and filters top 3.

-- select employee_id,department_id,salary FROM
-- (select department_id,employee_id,salary, rank() over(partition by department_id order by salary DESC)as ranks from hr.employees)
--  where ranks <= 3;

-- Uses DENSE_RANK() to identify employees with the second-highest salary per department.
-- select employee_id,department_id,salary from 
-- (select department_id,employee_id,salary, DENSE_RANK() over(partition by department_id order by salary DESC) ranks from hr.employees) 
-- where ranks = 2;

-- 9. Compute the cumulative total salary of employees ordered by hire date.
-- select employee_id,hire_date,salary,
-- sum(salary) over(ORDER by hire_date) cumulative_total_salary
-- from hr.EMPLOYEES

-- 10. Assign a row number to each employee in each department.
-- select department_id,employee_id,
--     ROW_NUMBER() over(PARTITION by department_id order by employee_id )as row_num
-- from hr.employees;

-- 11. Find the salary difference between each employee and the next highest-paid employee.

select department_id,employee_id,
    salary - lead(salary) over(order by salary desc) as salary_diff
    from hr.EMPLOYEES;