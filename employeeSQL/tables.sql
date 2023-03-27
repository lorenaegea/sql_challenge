DROP TABLE IF EXISTS titles CASCADE;

-- create titles table
CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(30)
);

-- check if data loaded properly
SELECT * FROM titles;

DROP TABLE IF EXISTS employees CASCADE;

-- create employees table
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(10) NOT NULL,
	birth_date VARCHAR(20),
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(5),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- check if data loaded properly
SELECT * FROM employees;

DROP TABLE IF EXISTS departments CASCADE;

-- create departments table
CREATE TABLE departments (
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(30)
);

-- check if data loaded properly
SELECT * FROM departments;

DROP TABLE IF EXISTS dept_manager;

-- create dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(10),
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

-- check if data loaded properly
SELECT * FROM dept_manager;

DROP TABLE IF EXISTS dept_emp;

-- create dept_emp table
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(10),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- check if data loaded properly
SELECT * FROM dept_emp;

DROP TABLE IF EXISTS salaries;

-- create salaries table
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- check if data loaded properly
SELECT * FROM salaries;
