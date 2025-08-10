CREATE DATABASE DB;
USE DB;

-- Table definitions
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
INSERT INTO students (student_id, name, age, gender, course) VALUES
    (1, 'Amit Sharma', 19, 'M', 'BSc Computer Science'),
    (2, 'Priya Patel', 20, 'F', 'BCom'),
    (3, 'Rahul Verma', NULL, 'M', 'BA History'), -- Missing age
    (4, 'Sneha Iyer', 21, NULL, 'BSc Physics'), -- Missing gender
    (5, 'Rakesh Singh', 22, 'M', NULL); -- Missing course

-- Insert employees
INSERT INTO employees (employee_id, name, designation, department) VALUES
    (201, 'Suman Gupta', 'Clerk', 'Administration'),
    (202, 'Deepak Joshi', NULL, 'Library'), -- Missing designation
    (203, 'Neha Desai', 'Receptionist', NULL); -- Missing department

-- Insert teachers
INSERT INTO teachers (teacher_id, employee_id, subject) VALUES
    (301, 201, 'Mathematics'),
    (302, 202, NULL), -- Missing subject
    (303, 203, 'English');

-- Data cleaning/updates
UPDATE students SET course = 'BBA' WHERE student_id = 5;
UPDATE employees SET department = 'Front Office' WHERE department IS NULL;
UPDATE teachers SET subject = 'Library Science' WHERE subject IS NULL;

-- Deletes
DELETE FROM students WHERE age IS NULL;
DELETE FROM employees WHERE department = 'Administration';
DELETE FROM teachers WHERE subject = 'English';

-- SELECTs: *, specific columns, WHERE/AND/OR/LIKE/BETWEEN, ORDER BY

-- SELECT * (all columns)
SELECT * FROM students;
SELECT * FROM employees;
SELECT * FROM teachers;

-- Specific columns
SELECT student_id, name, course FROM students;
SELECT employee_id, name, department FROM employees;

-- Join teachers with employees for teacher names
SELECT t.teacher_id, e.name AS teacher_name, t.subject
FROM teachers t
JOIN employees e ON t.employee_id = e.employee_id;

-- WHERE with equality
SELECT * FROM students
WHERE course = 'BSc Computer Science';

-- AND condition
SELECT * FROM employees
WHERE department = 'Library' AND designation IS NOT NULL;

-- OR condition
SELECT * FROM students
WHERE course = 'BCom' OR course = 'BBA';

-- LIKE pattern
SELECT * FROM students
WHERE name LIKE 'A%'; -- names starting with A

SELECT * FROM employees
WHERE department LIKE '%Office%'; -- contains 'Office'

-- BETWEEN range
SELECT * FROM students
WHERE age BETWEEN 18 AND 21;

-- Combining AND/OR with parentheses
SELECT * FROM employees
WHERE (department = 'Administration' OR department = 'Library')
AND designation IS NULL;

-- NULL checks
SELECT * FROM teachers
WHERE subject IS NULL;

-- ORDER BY sorting
SELECT student_id, name, age, course
FROM students
ORDER BY age; -- ascending

SELECT employee_id, name, department, designation
FROM employees
ORDER BY department DESC; -- descending

SELECT student_id, name, age, course
FROM students
ORDER BY course ASC, age DESC; -- multi-column

-- Filter + sort with JOIN
SELECT e.employee_id, e.name, e.department, t.subject
FROM teachers t
JOIN employees e ON t.employee_id = e.employee_id
WHERE t.subject LIKE '%Math%'
ORDER BY e.name ASC;

-- AGGREGATE FUNCTIONS, GROUP BY, HAVING

-- 1. Aggregate functions on numeric columns
SELECT COUNT(*) AS total_students FROM students;
SELECT AVG(age) AS average_age FROM students;
SELECT MIN(age) AS youngest_age, MAX(age) AS oldest_age FROM students;

-- 2. GROUP BY to categorize
SELECT course, COUNT(*) AS student_count FROM students GROUP BY course;
SELECT course, AVG(age) AS average_age FROM students GROUP BY course;
SELECT department, COUNT(*) AS employee_count FROM employees GROUP BY department;

-- 3. Filter groups using HAVING
SELECT course, COUNT(*) AS student_count FROM students GROUP BY course HAVING COUNT(*) > 1;
SELECT course, AVG(age) AS average_age FROM students GROUP BY course HAVING AVG(age) > 20;
SELECT department, COUNT(*) AS employee_count FROM employees GROUP BY department HAVING COUNT(*) > 1;

-- Combined GROUP BY & HAVING example
SELECT course, COUNT(*) AS student_count, AVG(age) AS average_age
FROM students
GROUP BY course
HAVING COUNT(*) > 1;
