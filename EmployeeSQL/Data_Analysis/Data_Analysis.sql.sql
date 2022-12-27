
--DATA ANALYSIS

--1. List the employee number, last name, first name, sex, and salary of each employee.

select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary

	from employees
	join salaries on employees.emp_no=salaries.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT * FROM employees;

select first_name, last_name, hire_date
from employees 
where hire_date in 
(
	select hire_date from employees where extract(year from hire_date) = 1986);


--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.	

select titles.title, departments.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name 
	from departments
	join dept_manager on departments.dept_no = dept_manager.dept_no
	join employees on employees.emp_no = dept_manager.emp_no
	join titles on titles.title_id = employees.emp_title_id

where title in 
(
	select title from titles where title  LIKE '%Manager%');

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select departments.dept_no, employees.emp_no,employees.last_name, employees.first_name, departments.dept_name
	from departments
	join dept_emp on dept_emp.dept_no = departments.dept_no
	join employees on employees.emp_no = dept_emp.emp_no;
	
--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.	

select first_name, last_name, sex
from employees 
where first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name.

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	from departments
	join dept_emp on dept_emp.dept_no = departments.dept_no
	join employees on employees.emp_no = dept_emp.emp_no
where dept_name in 
(
	select dept_name from departments where dept_name = 'Sales');
	
	
-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	from departments
	join dept_emp on dept_emp.dept_no = departments.dept_no
	join employees on employees.emp_no = dept_emp.emp_no

where dept_name in 
(
	select dept_name from departments where dept_name = 'Sales' OR dept_name ='Development');
	
--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select last_name, count(last_name) as "last_name count" 
	from employees 
	group by last_name
	order by "last_name count" DESC;
