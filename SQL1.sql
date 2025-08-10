CREATE DATABASE DB;
USE DB;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    course VARCHAR(100)
);
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    designation VARCHAR(100),
    department VARCHAR(100)
);
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    employee_id INT,
    subject VARCHAR(100),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
-- Insert students
INSERT INTO students (student_id, name, age, gender, course)
VALUES (1, 'Amit Sharma', 19, 'M', 'BSc Computer Science');

INSERT INTO students (student_id, name, age, gender, course)
VALUES (2, 'Priya Patel', 20, 'F', 'BCom');

INSERT INTO students (student_id, name, age, gender, course)
VALUES (3, 'Rahul Verma', NULL, 'M', 'BA History'); -- Missing age

INSERT INTO students (student_id, name, age, gender, course)
VALUES (4, 'Sneha Iyer', 21, NULL, 'BSc Physics'); -- Missing gender

INSERT INTO students (student_id, name, age, gender, course)
VALUES (5, 'Rakesh Singh', 22, 'M', NULL); -- Missing course

-- Insert employees
INSERT INTO employees (employee_id, name, designation, department)
VALUES (201, 'Suman Gupta', 'Clerk', 'Administration');

INSERT INTO employees (employee_id, name, designation, department)
VALUES (202, 'Deepak Joshi', NULL, 'Library'); -- Missing designation

INSERT INTO employees (employee_id, name, designation, department)
VALUES (203, 'Neha Desai', 'Receptionist', NULL); -- Missing department

-- Insert teachers (employee_id must exist in employees)
INSERT INTO teachers (teacher_id, employee_id, subject)
VALUES (301, 201, 'Mathematics');

INSERT INTO teachers (teacher_id, employee_id, subject)
VALUES (302, 202, NULL); -- Missing subject

INSERT INTO teachers (teacher_id, employee_id, subject)
VALUES (303, 203, 'English');
-- Update student course where student_id is 5
UPDATE students
SET course = 'BBA'
WHERE student_id = 5;

-- Update employee's department if missing (NULL)
UPDATE employees
SET department = 'Front Office'
WHERE department IS NULL;

-- Set subject to 'Library Science' for teacher where subject is missing
UPDATE teachers
SET subject = 'Library Science'
WHERE subject IS NULL;
-- Delete students who have not declared their age (NULL)
DELETE FROM students
WHERE age IS NULL;

-- Delete employees working in 'Administration' department
DELETE FROM employees
WHERE department = 'Administration';

-- Delete teachers who teach English
DELETE FROM teachers
    
WHERE subject = 'English';
 SELECTs: *, specific columns, WHERE/AND/OR/LIKE/BETWEEN, ORDER BY

--  SELECT * (all columns)
SELECT * FROM students;
SELECT * FROM employees;
SELECT * FROM teachers;

--  Specific columns
SELECT student_id, name, course FROM students;
SELECT employee_id, name, department FROM employees;

-- Join teachers with employees for teacher names
SELECT t.teacher_id, e.name AS teacher_name, t.subject
FROM teachers t
JOIN employees e ON t.employee_id = e.employee_id;

--  WHERE with equality
SELECT * FROM students
WHERE course = 'BSc Computer Science';

--  AND condition
SELECT * FROM employees
WHERE department = 'Library' AND designation IS NOT NULL;

--  OR condition
SELECT * FROM students
WHERE course = 'BCom' OR course = 'BBA';

--  LIKE pattern
SELECT * FROM students
WHERE name LIKE 'A%'; -- names starting with A

SELECT * FROM employees
WHERE department LIKE '%Office%'; -- contains 'Office'

--  BETWEEN range
SELECT * FROM students
WHERE age BETWEEN 18 AND 21;

--  Combining AND/OR with parentheses
SELECT * FROM employees
WHERE (department = 'Administration' OR department = 'Library')
AND designation IS NULL;

--  NULL checks
SELECT * FROM teachers
WHERE subject IS NULL;

--  ORDER BY sorting
SELECT student_id, name, age, course
FROM students
ORDER BY age; -- ascending

SELECT employee_id, name, department, designation
FROM employees
ORDER BY department DESC; -- descending

SELECT student_id, name, age, course
FROM students
ORDER BY course ASC, age DESC; -- multi-column

--  Filter + sort with JOIN
SELECT e.employee_id, e.name, e.department, t.subject
FROM teachers t
JOIN employees e ON t.employee_id = e.employee_id
WHERE t.subject LIKE '%Math%'
ORDER BY e.name ASC;


