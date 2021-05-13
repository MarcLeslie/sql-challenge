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