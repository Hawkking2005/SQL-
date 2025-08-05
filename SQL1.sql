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


