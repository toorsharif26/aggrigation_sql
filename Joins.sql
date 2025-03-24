-- 1. Retrieve employee names and their department names using INNER JOIN
SELECT e.employee_id, e.employee_name, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d ON e.department_id = d.department_id;

-- 2. Retrieve all employees and their respective department names (including those without a department) using LEFT JOIN
SELECT e.employee_id, e.employee_name, d.department_name
FROM hr.employees e
LEFT JOIN hr.departments d ON e.department_id = d.department_id;

-- 3. Retrieve all departments and employees (including departments without employees) using RIGHT JOIN
SELECT e.employee_id, e.employee_name, d.department_name
FROM hr.employees e
RIGHT JOIN hr.departments d ON e.department_id = d.department_id;

-- 4. Retrieve all employees and their department names using FULL OUTER JOIN
SELECT e.employee_id, e.employee_name, d.department_name
FROM hr.employees e
FULL OUTER JOIN hr.departments d ON e.department_id = d.department_id;

-- 5. Retrieve employees who do not belong to any department using LEFT JOIN with NULL check
SELECT e.employee_id, e.employee_name
FROM hr.employees e
LEFT JOIN hr.departments d ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- 6. Retrieve departments that have no employees using RIGHT JOIN with NULL check
SELECT d.department_id, d.department_name
FROM hr.employees e
RIGHT JOIN hr.departments d ON e.department_id = d.department_id
WHERE e.employee_id IS NULL;

-- 7. Retrieve employees along with their manager names using SELF JOIN
SELECT e.employee_id, e.employee_name, m.employee_name AS manager_name
FROM hr.employees e
LEFT JOIN hr.employees m ON e.manager_id = m.employee_id;

-- 8. Retrieve employees along with their job title using INNER JOIN
SELECT e.employee_id, e.employee_name, j.job_title
FROM hr.employees e
INNER JOIN jobs j ON e.job_id = j.job_id;

-- 9. Retrieve employees along with the location of their department using INNER JOIN
SELECT e.employee_id, e.employee_name, d.department_name, l.city
FROM hr.employees e
INNER JOIN hr.departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id;

-- 10. Retrieve employees and the projects they are assigned to using INNER JOIN
SELECT e.employee_id, e.employee_name, p.project_name
FROM hr.employees e
INNER JOIN hr.projects p ON e.employee_id = p.employee_id;

-- 11. Retrieve employees who have not been assigned to any project using LEFT JOIN
SELECT e.employee_id, e.employee_name
FROM hr.employees e
LEFT JOIN hr.projects p ON e.employee_id = p.employee_id
WHERE p.project_id IS NULL;

-- 12. Retrieve project names along with the department handling them using INNER JOIN
SELECT p.project_name, d.department_name
FROM hr.projects p
INNER JOIN hr.departments d ON p.department_id = d.department_id;

-- 13. Retrieve employees along with the names of their training programs using INNER JOIN
SELECT e.employee_id, e.employee_name, t.training_name
FROM hr.employees e
INNER JOIN hr.training_programs t ON e.training_id = t.training_id;

-- 14. Retrieve employees who have not attended any training programs using LEFT JOIN
SELECT e.employee_id, e.employee_name
FROM hr.employees e
LEFT JOIN hr.training_programs t ON e.training_id = t.training_id
WHERE t.training_id IS NULL;

-- 15. Retrieve employee names and their assigned shifts using INNER JOIN
SELECT e.employee_id, e.employee_name, s.shift_timing
FROM hr.employees e
INNER JOIN hr.shifts s ON e.shift_id = s.shift_id;

-- 16. Retrieve employees who do not have an assigned shift using LEFT JOIN
SELECT e.employee_id, e.employee_name
FROM employees e
LEFT JOIN shifts s ON e.shift_id = s.shift_id
WHERE s.shift_id IS NULL;

-- 17. Retrieve employees, their department names, and their assigned project names using multiple INNER JOINs
SELECT e.employee_id, e.employee_name, d.department_name, p.project_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN projects p ON e.employee_id = p.employee_id;