--titles datatable
--remove table if it exists
DROP TABLE IF EXISTS titles CASCADE;

--create table
CREATE TABLE titles (
    title_id VARCHAR(5)   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);
--insert csv data
COPY titles(title_id, title)
FROM 'D:\GitHub\Employee_Database\data\titles.csv'
DELIMITER ','
CSV HEADER;

--employees datatable
--remove table if it exists
DROP TABLE IF EXISTS employees CASCADE;

--create table
CREATE TABLE employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR(5)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    sex VARCHAR(1)   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);
--insert csv data
COPY employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM 'D:\GitHub\Employee_Database\data\employees.csv'
DELIMITER ','
CSV HEADER;

--departments datatable
--remove table if it exists
DROP TABLE IF EXISTS departments CASCADE;

--create table
CREATE TABLE departments (
    dept_no VARCHAR(5)   NOT NULL,
    dept_name VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);
--insert csv data
COPY departments(dept_no, dept_name)
FROM 'D:\GitHub\Employee_Database\data\departments.csv'
DELIMITER ','
CSV HEADER;

--dept_managers datatable
--remove table if it exists
DROP TABLE IF EXISTS dept_managers CASCADE;

--create table
CREATE TABLE dept_managers (
    dept_no VARCHAR(5)   NOT NULL,
    emp_no INT   NOT NULL
);
--insert csv data
COPY dept_managers(dept_no, emp_no)
FROM 'D:\GitHub\Employee_Database\data\dept_manager.csv'
DELIMITER ','
CSV HEADER;

--dept_employees datatable
--remove table if it exists
DROP TABLE IF EXISTS dept_employees CASCADE;

--create table
CREATE TABLE dept_employees (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(5)   NOT NULL
);
--insert csv data
COPY dept_employees(emp_no, dept_no)
FROM 'D:\GitHub\Employee_Database\data\dept_emp.csv'
DELIMITER ','
CSV HEADER;

--salaries datatable
--remove table if it exists
DROP TABLE IF EXISTS salaries CASCADE;

--create table
CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL
);
--insert csv data
COPY salaries(emp_no, salary)
FROM 'D:\GitHub\Employee_Database\data\salaries.csv'
DELIMITER ','
CSV HEADER;

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE dept_managers ADD CONSTRAINT fk_dept_managers_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_managers ADD CONSTRAINT fk_dept_managers_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_employees ADD CONSTRAINT fk_dept_employees_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_employees ADD CONSTRAINT fk_dept_employees_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);
