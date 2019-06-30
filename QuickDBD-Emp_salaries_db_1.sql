-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/3764Gv
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "new_dept_emp_indv_salaries" (
    "dept_no" varchar(15)   NOT NULL,
    "emp_no" int   NOT NULL,
    "salary" decimal   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    "salary_ID" int   NOT NULL
);

CREATE TABLE "new_emp_salaries" (
    "emp_no" int   NOT NULL,
    "salary" decimal   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    "salary_id" int   NOT NULL,
    CONSTRAINT "pk_new_emp_salaries" PRIMARY KEY (
        "salary_id"
     )
);

CREATE TABLE "departments" (
    "dept_no" varchar(15)   NOT NULL,
    "dept_name" varchar(25)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "emp_title_standard" (
    "ID" int   NOT NULL,
    "title" varchar(25)   NOT NULL,
    CONSTRAINT "pk_emp_title_standard" PRIMARY KEY (
        "ID"
     )
);

DROP TABLE public.fact_employee;
CREATE TABLE "fact_employee" (
	"emp_no" int   NOT NULL,
    "dept_no" varchar(15)   NOT NULL,
    "title_id" int   NOT NULL,
    "salary_ID" varchar   NOT NULL,
    "title" varchar(25)   NOT NULL,
    "salary" decimal   NOT NULL,
    "title_from_date" date   NOT NULL,
    "title_to_date" date   NOT NULL,
    "salary_from_date" date   NOT NULL,
    "salary_to_date" date   NOT NULL
);

CREATE TABLE "employee" (
    "emp_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "gender" varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "title" (
    "emp_no" int   NOT NULL,
    "title" varchar(35)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "dep_emp_manager" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(15)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

ALTER TABLE "new_dept_emp_indv_salaries" ADD CONSTRAINT "fk_new_dept_emp_indv_salaries_salary_ID" FOREIGN KEY("salary_ID")
REFERENCES "new_emp_salaries" ("salary_id");

ALTER TABLE "new_emp_salaries" ADD CONSTRAINT "fk_new_emp_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "new_dept_emp_indv_salaries" ("emp_no");

ALTER TABLE "new_emp_salaries" ADD CONSTRAINT "fk_new_emp_salaries_salary_id" FOREIGN KEY("salary_id")
REFERENCES "fact_employee" ("salary_ID");

ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dep_emp_manager" ("dept_no");

ALTER TABLE "emp_title_standard" ADD CONSTRAINT "fk_emp_title_standard_ID" FOREIGN KEY("ID")
REFERENCES "fact_employee" ("title_id");

ALTER TABLE "fact_employee" ADD CONSTRAINT "fk_fact_employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "fact_employee" ("emp_no");

ALTER TABLE "title" ADD CONSTRAINT "fk_title_emp_no" FOREIGN KEY("emp_no")
REFERENCES "new_emp_salaries" ("emp_no");

