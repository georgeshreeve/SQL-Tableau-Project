drop procedure if exists avg_salary_range;


delimiter $$
create procedure avg_salary_range(IN p_lower_bound FLOAT, IN p_upper_bound FLOAT)
begin
SELECT 
    e.gender,
    d.dept_name,
    ROUND(AVG(s.salary), 2)
FROM
    t_employees e
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
        JOIN
    t_dept_emp de ON e.emp_no = de.emp_no
        JOIN
    t_departments d ON de.dept_no = d.dept_no
    where s.salary between p_lower_bound and p_upper_bound
GROUP BY d.dept_name, e.gender
ORDER BY d.dept_name, e.gender
;
end $$

delimiter ;


call avg_salary_range(50000,90000);