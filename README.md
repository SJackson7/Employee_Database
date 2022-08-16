## Employee Database Analysis

Note: If using dark mode, due to the transparency of the charts, it is best to use either light mode or open the images in a separate tab. 

### Task
Using six CSV files containing mock employee data for people employed during the 1980s and 1990s, create a data model to store the CSV files, import the CSV files into a SQL database and answer questions about the data (data modelling, data engineering and data analysis, respectively). 

### Data Modelling
After inspecting the CSV files, I created the following ERD to map out the data relationships.
![erd](https://user-images.githubusercontent.com/104914008/184976866-f2d4a003-456e-4aae-be8c-d29b4d4163f0.png)

### Data Engineering
I created table schemas (file included) for each of the six CSV files. Due to the relationships between tables and to better answer the questions, the tables were loaded into the SQL database in the following order: titles, employees, departments, department managers, department employees, salaries. Each schema in the schema.sql will do the following as well for each table/csv: 
* Drop each respective table if previously exists to allow to re-run table schemas if needed
* Create a table identifying data types, primary keys, foreign keys and other constraints (handled by the ERD)
  * Verify that the primary key column is unique or create a composite key (handled by the ERD).
* Insert the CSV file into the table

### Data Analysis
I answered the statements/questions below as per the task using a query (file included). Due to the number of rows, I limited the results of each statement/question to 10.

* List the employee number, last name, first name, sex, and salary of each employee.
![employee_details](https://user-images.githubusercontent.com/104914008/184978449-7b1fb750-069b-4ee2-856f-daea40788cfd.png)

* List the first name, last name, and hire date for the employees who were hired in 1986.
![hired_in_1986](https://user-images.githubusercontent.com/104914008/184978499-40d88f3a-f488-479e-a291-939c71ddb1d5.png)

* List the manager of each department along with their department number, department name, employee number, last name, and first name.
![manager_details](https://user-images.githubusercontent.com/104914008/184978551-b790af7d-e5e2-4398-b417-12f238e5e5fc.png)

* List the department number for each employee along with the employee’s employee number, last name, first name, and department name.
![employee_by_dept](https://user-images.githubusercontent.com/104914008/184979073-45342ea2-3edb-451f-80f5-e6bf56dfccba.png)

* List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
![named_hercules](https://user-images.githubusercontent.com/104914008/184978618-d5b7f368-e1e0-4e26-be79-f14bcc2c2394.png)

* List each employee in the Sales department, including their employee number, last name, and first name.
![sales_dept_employees](https://user-images.githubusercontent.com/104914008/184978713-5324847e-974c-43e4-baed-233190050944.png)

* List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
![sales_and_development_depts_employees](https://user-images.githubusercontent.com/104914008/184978731-351a3db7-7e8e-4961-b807-8be12e6b6c8c.png)

* List the frequency counts, in descending order, of all the employee last names.
![last_name_freq](https://user-images.githubusercontent.com/104914008/184978770-f0b0a025-187c-4e48-98cb-88f30edbceaf.png)

#### Further Analysis
I completed a further analysis of the data by importing the SQL database into Pandas to visualize employee salary ranges and average salary by title. The data could be suspect given the high distribution of salaries near $40,000 and that the average salaries by title are not only close, but that a senior engineer should be making way more than an average of just under $50,000 and not less on average than an assistant engineer. Histogram for salary distribution and bar chart for average salaries by title. 
![salary_distribution](https://user-images.githubusercontent.com/104914008/184980383-5a5ae49c-4edb-4146-9425-df0a35916cae.png)
![title_average_salary](https://user-images.githubusercontent.com/104914008/184980395-b8a8e120-6538-4941-9faf-00781ff3a879.png)


#### Included Files:
##### SQL:
* query.sql
* schema.sql

##### Jupyter Notebook (for Further Analysis)
salary_ana.ipynb
##### data folder:
* CSV files

##### images folder:
* All images in this README.md
