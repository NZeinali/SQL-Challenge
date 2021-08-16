---------------------------------------------------------------
-- Deleting Tables if exist
---------------------------------------------------------------

DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;

---------------------------------------------------------------
-- Creating Tables
---------------------------------------------------------------

CREATE TABLE departments (
	dept_no VARCHAR(10) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no));
	
---------------------------------------------------------------

CREATE TABLE titles (
	title_id VARCHAR(10) NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id));
	
---------------------------------------------------------------

CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title VARCHAR(10) NOT NULL,
	birth_date VARCHAR(10) NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date VARCHAR(10) NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title) REFERENCES titles(title_id));
	
---------------------------------------------------------------

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no));
	
---------------------------------------------------------------

CREATE TABLE dept_manager (
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no));
	
---------------------------------------------------------------

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
	
---------------------------------------------------------------
-- Displaying tables
---------------------------------------------------------------

SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

---------------------------------------------------------------
-- Converting hire_ and birth_date columns formats from VARCHAR to DATE
---------------------------------------------------------------

ALTER TABLE employees
ALTER COLUMN hire_date TYPE DATE 
USING TO_DATE(hire_date , 'MM/DD/YYYY');	

------------------------------------------

ALTER TABLE employees
ALTER COLUMN birth_date TYPE DATE 
USING TO_DATE(birth_date , 'MM/DD/YYYY');