SELECT 
    e.gender,
    d.dept_name,
    ROUND(AVG(s.salary), 2),
    YEAR(s.from_date) AS calendar_year
FROM
    t_employees e
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
        JOIN
    t_dept_emp de ON e.emp_no = de.emp_no
        JOIN
    t_departments d ON de.dept_no = d.dept_no
GROUP BY calendar_year , e.gender , d.dept_name
HAVING calendar_year <= 2002
ORDER BY  e.gender, de.dept_no, calendar_year
;


use employees_mod;
