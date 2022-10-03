-- Use Dictinct with Orderby to remove duplicate rows
--Create a Retirement Titles table that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955
--Create a table that has the number of retirement-age employees by most recent job title.
SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
ORDER BY e.emp_no, ti.to_date DESC;

SELECT * FROM retirement_titles;

-- unique titles table
SELECT DISTINCT ON (e.emp_no)
e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO unique_titles
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (ti.to_date = '9999-01-01')
ORDER BY e.emp_no, ti.to_date DESC;

SELECT * FROM unique_titles;

--retiring titles table

SELECT COUNT (u.title), u.title
INTO retiring_titles
FROM unique_titles as u
GROUP BY u.title
ORDER BY COUNT (u.title) DESC;

--mentorship eligibility table

SELECT DISTINCT ON (e.emp_no)
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de 
ON (de.emp_no = e.emp_no)
INNER JOIN titles AS ti 
ON (ti.emp_no = e.emp_no)
WHERE de.to_date = '9999-01-01' 
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no, ti.to_date DESC;
