-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/lNYvgT
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

drop table if exists Titles cascade;
drop table if exists Employees cascade;
drop table if exists Departments cascade;
drop table if exists DeptEmployee cascade;
drop table if exists DeptManager cascade;
drop table if exists Salaries cascade;


CREATE TABLE Titles (
    emp_title_id VARCHAR(100)   NOT NULL,
    title VARCHAR(100)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        emp_title_id
     )
);

CREATE TABLE Employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR(100)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(100)   NOT NULL,
    last_name VARCHAR(100)   NOT NULL,
    sex CHAR(1)   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Departments (
    dept_no VARCHAR(25)   NOT NULL,
    dept_name VARCHAR(100)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE DeptEmployee (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(25)   NOT NULL
);

CREATE TABLE DeptManager (
    dept_no VARCHAR(25)   NOT NULL,
    emp_no INT   NOT NULL,
    CONSTRAINT pk_DeptManager PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        emp_no
     )
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Titles (emp_title_id);

ALTER TABLE DeptEmployee ADD CONSTRAINT fk_DeptEmployee_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE DeptEmployee ADD CONSTRAINT fk_DeptEmployee_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE DeptManager ADD CONSTRAINT fk_DeptManager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

