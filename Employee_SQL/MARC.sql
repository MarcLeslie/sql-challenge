--DROP TABLE IF EXISTS departments; 
--DROP TABLE IF EXISTS dept_emp; 
--DROP TABLE IF EXISTS dept_manager; 
--DROP TABLE IF EXISTS employees; 
--DROP TABLE IF EXISTS salaries; 
--DROP TABLE IF EXISTS titles; 

--DEPARTMENTS------------------------------------------------------------------------------------------------------
CREATE TABLE departments (
dept_no VARCHAR(4) NOT NULL,
dept_name TEXT NOT NULL
);

SELECT * FROM departments; 

--DEPT_EMP------------------------------------------------------------------------------------------------------
CREATE TABLE dept_emp (
emp_no INT NOT NULL PRIMARY KEY,
dept_no VARCHAR(4) NOT NULL
);

ALTER TABLE dept_emp ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no); 

SELECT * FROM dept_emp; 

--DEPT_MANAGER------------------------------------------------------------------------------------------------------
CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
emp_no INT NOT NULL
); 

ALTER TABLE dept_manager ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no); 

SELECT * FROM dept_manager; 

--EMPLOYEES------------------------------------------------------------------------------------------------------
CREATE TABLE employees(
emp_no INT NOT NULL,
emp_title VARCHAR(5),
birth_date DATE,
first_name VARCHAR(50),
last_name VARCHAR(50), 
sex VARCHAR(1),
hire_date DATE
);

ALTER TABLE employees ADD PRIMARY KEY (emp_no);

SELECT * FROM employees; 

--Salaries------------------------------------------------------------------------------------------------------
CREATE TABLE salaries(
emp_no INT NOT NULL,
salary INT
);

ALTER TABLE salaries ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no); 

SELECT * FROM salaries; 


--TITLES------------------------------------------------------------------------------------------------------
CREATE TABLE titles(
title_id VARCHAR(5),
title VARCHAR
);

SELECT * FROM titles; 

-----------------------------------------------------------------------------------------------------------------
--Specific Questions
-----------------------------------------------------------------------------------------------------------------


--QUERY 1
--For each employee, list EMP_NO, L NAME, F NAME, SEX (all from employees table) and salary (from salaries table)
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary FROM employees 
INNER JOIN salaries ON employees.emp_no = salaries.emp_no; 

--QUERY 2
-- For employees hired in 1986 (hire_date from employees): List first name, last name, and hire date (al of which is in employees )
SELECT employees.first_name, employees.last_name, employees.hire_date 
FROM employees 
WHERE employees.hire_date >='1986-01-01' and employees.hire_date <= '1986-12-31'; 

--QUERY 3
-- List managers for each department with: dept_no (dept_manager), dept name (departments), manager’s emp_no (dept_manager), last name, first name (employees)
--dept_no is in both dept_manager and departments

SELECT dept_manager.dept_no, dept_manager.emp_no, departments.dept_name, employees.last_name, employees.first_name 
FROM dept_manager
INNER JOIN employees 
	ON dept_manager.emp_no = employees.emp_no
INNER JOIN departments
	ON dept_manager.dept_no = departments.dept_no;

--QUERY 4
--List the department of each employee with the following information: employee number (employees and dept_emp), last name  (employees), 
--first name (employees), and dept name (departments).
-- "departments" has dept_no, which is also in "dept_emp"; "dept_emp" had emp_no which is also in "employees"

SELECT dept_emp.emp_no, employees.last_name, employees.first_name,  departments.dept_name
FROM employees
INNER JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments
	ON departments.dept_no = dept_emp.dept_no;
	
--QUERY 5
--List first name (employees), last name (employees), and sex (employees) for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.last_name, employees.first_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' and employees.last_name LIKE'B%'; 

--QUERY 6
-- List all Sales dept employees (departments) with: employee number (employees) , last name (employees), first name (employees), dept name (departments)
-- "departments" has dept_no, which is also in "dept_emp"; "dept_emp" had emp_no which is also in "employees"

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
	ON employees.emp_no =  dept_emp.emp_no
INNER JOIN departments
	ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

--QUERY 7
--List all Sales Dept and Development Dept employees (departments) with: employee number (employees) , last name (employees), first name (employees), dept name (departments)
---- "departments" has dept_no, which is also in "dept_emp"; "dept_emp" had emp_no which is also in "employees"

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
	ON employees.emp_no =  dept_emp.emp_no
INNER JOIN departments
	ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' or departments.dept_name = 'Development';

