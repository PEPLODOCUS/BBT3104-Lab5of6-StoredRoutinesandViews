-- (i) A Procedure called PROC_LAB5
DELIMITER $$
CREATE PROCEDURE PROC_LAB5()
BEGIN
    SELECT 
        e.employee_name,
        d.department_name,
        (e.salary * 12) AS yearly_salary
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id;
END $$
DELIMITER;
-- (ii) A Function called FUNC_LAB5
DELIMITER $$
CREATE FUNCTION FUNC_LAB5(department_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE avg_salary DECIMAL(10,2);
    SELECT AVG(salary)
    INTO avg_salary
    FROM employees
    WHERE department_id = department_id;
    RETURN avg_salary;
END $$
DELIMITER;
-- (iii) A View called VIEW_LAB5
CREATE VIEW VIEW_LAB5 AS
SELECT d.department_name, SUM(e.salary) AS total_salary
FROM employees e
    JOIN departments d ON e.department_id = d.department_id
GROUP BY
    d.department_name;
