--Tables were normalized by using Pandas and Excel
--created a fact table as Junction table to link the tables

--#1
SELECT
  e.emp_no,
  e.last_name,
  e.first_name,
  e.gender,
  ne.salary
FROM
  employees e
LEFT JOIN new_emp_salaries ne ON e.emp_no = ne.emp_no;

--#2
SELECT emp_no,last_name,first_name,gender,hire_date
from employees
WHERE EXTRACT(YEAR FROM hire_date)= 1986

--3#
select em.emp_no,em.dept_no,d.dept_name,em.title,es.first_name,es.last_name,
em.salary_from_date as "start employment date",em.salary_to_date as "end employment date"
from fact_employee em
left join departments as d on em.dept_no = d.dept_no
left join employees as es on es.emp_no = em.emp_no
where em.title = 'Manager'

--4
select distinct em.emp_no,em.dept_no,d.dept_name,es.first_name,es.last_name
from fact_employee em
left join departments as d on em.dept_no = d.dept_no
left join employees as es on es.emp_no = em.emp_no


--5
select * from employees
where first_name = 'Hercules'
and last_name like 'B%'

--6
select em.emp_no,e.first_name,e.last_name, d.dept_name
from fact_employee em, departments d, employees e
where em.emp_no = e.emp_no 
and d.dept_no =em.dept_no
and dept_name ='Sales'

--7
select em.emp_no,e.first_name,e.last_name, d.dept_name
from fact_employee em, departments d, employees e
where em.emp_no = e.emp_no 
and d.dept_no =em.dept_no
and dept_name in ('Sales','Development')

--8
select last_name,first_name,count(*)
from employees
group by last_name,first_name
order by last_name desc


                                      

