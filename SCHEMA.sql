-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
DROP TABLE "dep_emp";
DROP TABLE "salaries" ;
DROP TABLE "dep_manager";
DROP TABLE "employee" ;
DROP TABLE "departments";
DROP TABLE "titles" ;

CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE "employee" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
	PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "departments" (
    "dep_no" VARCHAR   NOT NULL,
    "dep_name" VARCHAR   NOT NULL,
	PRIMARY KEY (dep_no)
);

CREATE TABLE "dep_manager" (
    "dep_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee (emp_no), 
	FOREIGN KEY (dep_no) REFERENCES departments (dep_no), 
    PRIMARY KEY (emp_no,dep_no) 
);

CREATE TABLE "dep_emp" (
    "emp_no" INT   NOT NULL,
    "dep_no" VARCHAR   NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES employee (emp_no), 
	FOREIGN KEY (dep_no) REFERENCES departments (dep_no), 
    PRIMARY KEY (emp_no,dep_no)
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee (emp_no), 
	PRIMARY KEY (emp_no)
);

