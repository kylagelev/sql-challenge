create table departments(
	dept_no VARCHAR(255) NOT NULL,
	dept_name VARCHAR(255),
	PRIMARY KEY(dept_no)
);

create table titles(
	title_id VARCHAR(255),
	title VARCHAR(255),
	PRIMARY KEY(title_id)
);

create table employees(
	emp_no INT,
	emp_title_id VARCHAR(255),
	FOREIGN KEY(emp_title_id) REFERENCES titles(title_id),
	birth_date DATE,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex VARCHAR(25),
	hire_date DATE,
	PRIMARY KEY(emp_no)
);

create table dept_managers(
	dept_no VARCHAR(255),
	emp_no INT,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no)
);

create table dept_emp(
	emp_no INT,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(255),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY(emp_no, dept_no)
);

create table salaries(
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT	
);
