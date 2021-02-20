--listing employee number, last name, first name, sex, and salay
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
inner join salaries as s on
e.emp_no = s.emp_no;

--listing first name, last name, and hire date for employees hired in 1986
select first_name, last_name, hire_date from employees
where hire_date between '1985-12-31' and '1986-12-31';

--listing department name, department number, manager of department, manager's employee number, last name, first name
--from departments get the dept_name, and dept_no
--from dept_managers, you get employee number of manager based on dept_no, so want to match on dept_no
--then use employee number of dept_managers to match employee number in employees
--from employees, match emp_no to list first and last name
select d.dept_name, d.dept_no, e.emp_no, e.last_name, e.first_name
from departments as d
inner join dept_managers as m on
m.dept_no = d.dept_no
inner join employees as e on
e.emp_no = m.emp_no;

--listing department of each employee, plus emp_no, last_name, first_name, dept_name
--so want from departments, dept_name and dept_no
--then match that to dept_no in dept_emp 
--from dept_emp, match emp_no to employee emp_no
select d.dept_name, e.emp_no, e.last_name, e.first_name
from departments as d 
inner join dept_emp as p on
d.dept_no = p.dept_no
inner join employees as e on
p.emp_no = e.emp_no;

--using employees, want first_name, last_name, sex with first_name = Hercules and last_name starts with B
select first_name, last_name, sex from employees
where first_name = 'Hercules' and last_name like 'B%';

--if employee is in sales department, list emp_no, last_name, first_name, dept_name
--from department, match dept_name to sale
--take dept_no to match to dept_emp dept_no
--from dept_emp, match emp_no to employee emp_no
select e.emp_no, e.last_name, e.first_name, d.dept_name
from departments as d
inner join dept_emp as p on
d.dept_no = p.dept_no
inner join employees as e on
p.emp_no = e.emp_no
where d.dept_name = 'Sales';

--listing employees in Sales and Development
--want dept_name, emp_no, first_name, last_name
--same as earlier attempt, just added or to include development department
select e.emp_no, e.last_name, e.first_name, d.dept_name
from departments as d
inner join dept_emp as p on
d.dept_no = p.dept_no
inner join employees as e on
p.emp_no = e.emp_no
where d.dept_name = 'Sales' or d.dept_name = 'Development';

--count of employees that share last names per last_name in desc order
select last_name, count(last_name) as last_name_count
from employees
group by last_name
order by last_name_count desc;
