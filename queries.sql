--This script performs the following queries:

--DONEList the following details of each employee: employee number, last name, first name, sex, and salary.
--DONEList first name, last name, and hire date for employees who were hired in 1986.
--DONEList the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
--DONEList the department of each employee with the following information: employee number, last name, first name, and department name.
--DONEList first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
--DONEList all employees in the Sales department, including their employee number, last name, first name, and department name.
--DONEList all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
--DONEIn descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

--show available data in each table, limited to first 10 entires
SELECT * FROM titles LIMIT (10);
SELECT * FROM employees LIMIT (10);
SELECT * FROM departments LIMIT (10);
SELECT * FROM dept_managers LIMIT (10);
SELECT * FROM dept_employees LIMIT (10);
SELECT * FROM salaries LIMIT (10);

---------------------------------------------------------------------
--Employee details: employee number, last name, first name, sex, salary
SELECT employees.emp_no AS Employee_Number, employees.last_name, employees.first_name, employees.sex AS gender, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
LIMIT (10);

--Employees' name and hire date for those hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE employees.hire_date > '1986-1-1'::date AND employees.hire_date < '1987-1-1'::date
LIMIT (10);

--Department manager details: department number, department name, manager's employee number, last name, first name.
SELECT dept_managers.dept_no, departments.dept_name, dept_managers.emp_no, employees.last_name, employees.first_name
FROM dept_managers
JOIN employees
ON dept_managers.emp_no = employees.emp_no
JOIN departments
ON dept_managers.dept_no = departments.dept_no
LIMIT (10);

--Employee by department details: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_employees
ON employees.emp_no = dept_employees.emp_no
JOIN departments
ON dept_employees.dept_no = departments.dept_no
LIMIT (10);

--Find first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex AS gender
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
LIMIT (10);

--Sales department employee details: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_employees 
ON employees.emp_no = dept_employees.emp_no
JOIN departments 
ON dept_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
LIMIT (10);

--Sales and Development departments employees: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_employees 
ON employees.emp_no = dept_employees.emp_no
JOIN departments 
ON dept_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
LIMIT (10);

--Frequency count of employee last names in descending order.
SELECT employees.last_name, Count (*)
FROM employees
GROUP BY employees.last_name
ORDER BY Count (*) DESC
LIMIT (10);
