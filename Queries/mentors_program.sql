
-- Mentors program
SELECT DISTINCT ON (e.emp_no)
e.emp_no,
e.first_name, 
e.last_name,
e.birth_date,
e.hire_date,
d.dept_name,
ti.title
FROM employees AS e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
INNER JOIN departments as d
ON d.dept_no = de.dept_no
WHERE (birth_date BETWEEN '1956-01-01' AND '1965-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1995-12-31')
AND (ti.to_date= '9999-01-01');

-- Mentors group by title
SELECT DISTINCT ON (e.emp_no)
e.emp_no,
e.first_name, 
e.last_name,
e.birth_date,
e.hire_date,
d.dept_name,
ti.title
FROM employees AS e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
INNER JOIN departments as d
ON d.dept_no = de.dept_no
WHERE (birth_date BETWEEN '1956-01-01' AND '1965-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1995-12-31')
AND (ti.to_date= '9999-01-01');

-- Mentors count per title
SELECT COUNT (DISTINCT e.emp_no), ti.title
FROM employees AS e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
INNER JOIN departments as d
ON d.dept_no = de.dept_no
WHERE (birth_date BETWEEN '1956-01-01' AND '1965-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1995-12-31')
AND (ti.to_date= '9999-01-01')
GROUP BY ti.title
ORDER BY COUNT (DISTINCT e.emp_no);

-- Mentors departments count
SELECT COUNT (DISTINCT e.emp_no), d.dept_name
FROM employees AS e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
INNER JOIN departments as d
ON d.dept_no = de.dept_no
WHERE (birth_date BETWEEN '1956-01-01' AND '1965-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1995-12-31')
AND (ti.to_date= '9999-01-01')
GROUP BY d.dept_name
ORDER BY COUNT (DISTINCT e.emp_no);



-- retirement sales and development departments count table
SELECT COUNT (DISTINCT ce.emp_no), d.dept_name
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON(ce.emp_no=de.emp_no)
INNER JOIN departments AS d
ON(de.dept_no= d.dept_no)
WHERE d.dept_name IN ('Sales','Development')
GROUP BY d.dept_name
ORDER BY COUNT (DISTINCT ce.emp_no);