-- List the employee number, last name, first name, sex, and salary of each employee.
Select
	e.emp_no,
	e.first_name,
	e.last_name,
	e.sex,
	s.salary
From
	employees as e
	join salaries as s on e.emp_no = s.emp_no
ORDER BY
	s.salary DESC

-- List the first name, last name, and hire date for the employees who were hired in 1986.
Select
	first_name,
	last_name,
	hire_date
FROM
	employees
WHERE
	DATE_PART('year', hire_date) = 1986
ORDER BY
	hire_date ASC
;
-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select
	m.dept_no,
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
From
	dept_manager as m
	join departments as d on m.dept_no = d.dept_no
	join employees as e on m.emp_no = e.emp_no
;


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
	de.dept_no,
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM 
	dept_emp as de
	join employees as e on de.emp_no = e.emp_no
	join departments as d on de.dept_no = d.dept_no
;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	first_name,
	last_name,
	sex
FROM 
	employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
;

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	e.first_name,
	e.last_name,
	e.emp_no,
	d.dept_name
FROM 
	dept_emp as de
	join employees as e on de.emp_no = e.emp_no
	join departments as d on de.dept_no = d.dept_no
WHERE dept_name = 'Sales'
;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM 
	dept_emp as de
	join employees as e on de.emp_no = e.emp_no
	join departments as d on de.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'
;
-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
	last_name,
COUNT
	(last_name)
FROM 
	employees
GROUP BY
	last_name
ORDER BY COUNT(last_name) DESC
;

