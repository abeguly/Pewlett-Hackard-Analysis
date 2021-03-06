--------------------------------------------------------------------------
-- List of retirement_titles
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles 
ORDER BY emp_no, to_date DESC;

-- List of retiring_titles
SELECT count(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;


-- List of mentorship_eligibility
SELECT DISTINCT on (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e
JOIN dept_emp as de
	ON e.emp_no = de.emp_no
JOIN titles as t
	ON (e.emp_no = t.emp_no)
WHERE t.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'	
ORDER BY e.emp_no;
	
-- Count eligible mentors born in 1965
SELECT COUNT(emp_no)
FROM mentorship_eligibility;

-- List of mentorship_eligibility
SELECT DISTINCT on (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility_1956_1964
FROM employees as e
JOIN dept_emp as de
	ON e.emp_no = de.emp_no
JOIN titles as t
	ON (e.emp_no = t.emp_no)
WHERE t.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1956-01-01' AND '1964-12-31'	
ORDER BY e.emp_no;

-- Count eligible mentors born in 1956-1964
SELECT COUNT(emp_no)
FROM mentorship_eligibility_1956_1964;
