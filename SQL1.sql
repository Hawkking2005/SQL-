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

