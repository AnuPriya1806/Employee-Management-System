CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    join_date DATE,
    department_id INT,
    job_id INT,
    salary_id INT
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE jobs (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(100)
);

INSERT INTO departments (department_id, department_name) VALUES (1, 'HR'), (2, 'Engineering');
INSERT INTO jobs (job_id, job_title) VALUES (1, 'Software Engineer'), (2, 'HR Manager');
INSERT INTO employees (employee_id, first_name, last_name, dob, join_date, department_id, job_id, salary_id) 
VALUES (101, 'John', 'Doe', '1990-05-15', '2024-11-01', 2, 1, 1);
INSERT INTO salaries (salary_id, employee_id, salary) VALUES (1, 101, 50000);

-- Retrieve Employees by Department:
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- Find Employees with Highest Salary:
SELECT e.first_name, e.last_name, s.salary
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
WHERE s.salary = (SELECT MAX(salary) FROM salaries);

-- Employees Who Joined in the Last 30 Days:
SELECT first_name, last_name, join_date
FROM employees
WHERE join_date >= CURRENT_DATE - INTERVAL 30 DAY;

-- Average Salary by Department:
SELECT d.department_name, AVG(s.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN salaries s ON e.employee_id = s.employee_id
GROUP BY d.department_name;

-- Total Salary Expense by Department:
SELECT d.department_name, SUM(s.salary) AS total_salary_expense
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN salaries s ON e.employee_id = s.employee_id
GROUP BY d.department_name;

Project Title: Employee Management System
    
Description: 
Designed a relational database using MySQL to manage employee records, departments, job roles, and salaries. 
Wrote optimized SQL queries for complex reporting, including salary analysis and department-level insights.
Implemented transaction handling, indexing, and stored procedures for data consistency and performance.





