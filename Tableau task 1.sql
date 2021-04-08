use employees_mod;



SELECT 
    YEAR(de.from_date) as calendar_year, 
    e.gender,
    COUNT(de.emp_no) as no_of_employees
FROM
    t_dept_emp de
    join t_employees e on de.emp_no=e.emp_no
WHERE
    YEAR(from_date) >= 1990
GROUP BY YEAR(from_date), gender
ORDER BY de.from_date, e.gender;



#same output


SELECT 
    YEAR(d.from_date) AS calendar_year,
    e.gender,
    COUNT(e.emp_no) AS num_of_employees
FROM
    t_employees e
        JOIN
    t_dept_emp d ON d.emp_no = e.emp_no
GROUP BY calendar_year , e.gender
HAVING calendar_year >= 1990
ORDER BY calendar_year , gender;