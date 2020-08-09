--------------### drop tables ###--------------
drop table Employees
drop table Department_Employee 
drop table Department_Manager 
drop table Departments 
drop table Salaries 
drop table Titles 

--------------### create tables ###--------------
create table Titles (
	title_id VARCHAR not null,  
	title VARCHAR not null,
	primary key (title_id)

);

create table Employees (
	emp_no INTEGER not null,
	emp_title_id VARCHAR not null,
	birth_date DATE not null,
	first_name VARCHAR not null,
	last_name VARCHAR not null,	
	sex VARCHAR not null,
	hire_date DATE not null,
	primary key (emp_no),
	foreign key (emp_title_id) references Titles (title_id)
);


create table Departments (
	dept_no VARCHAR not null,
	dept_name VARCHAR not null,
	primary key (dept_no)

);

create table Department_Employee (
	emp_no INTEGER not null,
	dept_no VARCHAR not null,
	foreign key (emp_no) references Employees (emp_no),
	foreign key (dept_no) references Departments (dept_no)	
);

create table Department_Manager (
	dept_no VARCHAR not null, 
	emp_no INTEGER not null,
	foreign key (dept_no) references Departments (dept_no),	
	foreign key (emp_no) references Employees (emp_no)
);

create table Salaries (
	emp_no INTEGER not null,
	salary INTEGER not null,
	foreign key (emp_no) references Employees (emp_no)
);

--List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from Employees as e 
join Salaries as s
on (e.emp_no=s.emp_no);

--List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date 
from Employees 
where hire_date between '$1986-01-01' and '$1986-12-31'

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from Employees as e 
join Department_Manager as dm
on (e.emp_no=dm.emp_no)
	join Departments as d
	on (dm.dept_no=d.dept_no);


--List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from Employees as e 
join Department_Employee as de
on (e.emp_no=de.emp_no)
	join Departments as d
	on (de.dept_no=d.dept_no);

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from Employees
where first_name = 'Hercules' and last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from Employees as e
join Department_Employee as de
on (e.emp_no=de.emp_no)
join Departments as d
on (de.dept_no=d.dept_no)
where dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from Employees as e
join Department_Employee as de
on (e.emp_no=de.emp_no)
join Departments as d
on (de.dept_no=d.dept_no)
where dept_name = 'Sales' or dept_name = 'Development' ;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name)
from Employees
group by last_name
order by count desc ;