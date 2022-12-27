
--TABLE SCHEMATA

create table departments (
	dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(20) NOT NULL
);

create table titles (
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(20) NOT NULL
)
;

create table employees (
	emp_no INTEGER PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL, 
	FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)

);


create table dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(4) NOT NULL, 
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no, dept_no) 
)
;

create table dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INTEGER NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
)
;

create table salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
)
;