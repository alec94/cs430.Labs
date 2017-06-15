SELECT first_name as 'First Name',last_name as 'Last Name',salary as 'Salary' FROM employees LEFT JOIN (salaries)ON (salaries.emp_no=employees.emp_no) where to_date = '9999-01-01' and salary > 90000;

select first_name as 'First Name',last_name as 'Last Name',dept_name as 'Department Name' from employees natural join (current_dept_emp natural join departments) where (dept_no='d008' or dept_no='d009') and to_date='9999-01-01';

select first_name as 'First Name', last_name as 'Last Name', title as 'Title' from employees natural join (titles natural join current_dept_emp) where title = 'Technique Leader' and gender = 'F' and to_date = '9999-01-01';

SELECT first_name as 'First Name',last_name as 'Last Name',salary as 'Salary' FROM employees inner join(salaries, titles) on (employees.emp_no=salaries.emp_no AND titles.emp_no=salaries.emp_no) where salaries.to_date = '9999-01-01' and titles.title <> 'Senior Engineer' group by employees.emp_no order by salaries.salary ASC;

select first_name as 'First Name', last_name as 'Last Name', birth_date as 'Birthday' from employees order by birth_date DESC;

select first_name as 'First Name', last_name as 'Last Name' from employees left join dept_manager on employees.emp_no = dept_manager.emp_no where dept_manager.to_date = '9999-01-01';

select MAX(salary) as 'Salary', employees.first_name as 'First Name', dept_name as 'Current Department' from employees inner join current_dept_emp on employees.emp_no=current_dept_emp.emp_no inner join departments on current_dept_emp.dept_no=departments.dept_no inner join salaries on salaries.emp_no=employees.emp_no;