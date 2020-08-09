--------------### database schema ###--------------
Employees
-
emp_no INTEGER PK
emp_title_id VARCHAR FK >- Titles.title_id
birth_date DATE
first_name VARCHAR
last_name VARCHAR	
sex VARCHAR
hire_date DATE

Department_Employee
-
emp_no INTEGER FK >- Employees.emp_no
dept_no VARCHAR FK >- Departments.dept_no

Department_Manager
-
emp_no INTEGER FK >- Employees.emp_no
dept_no VARCHAR FK >- Departments.dept_no

Departments
-
dept_no VARCHAR PK
dept_name VARCHAR

Salaries
-
emp_no INTEGER FK >- Employees.emp_no	
salary INTEGER

Titles
-
title_id VARCHAR PK 
title VARCHAR