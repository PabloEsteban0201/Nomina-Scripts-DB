
--consultar empresa dado el id de un empleado

select comp.name_company 
from companies comp, employees e
where &id_empleado=e.employee_id and
e.company_fk = comp.company_id;

SELECT COMP.name_company FROM companies COMP, employees E
WHERE 1 LIKE E.employee_id AND 
E.company_fk LIKE COMP.company_id;

--Get the object company in spring
SELECT comp.company_id , comp.name_company FROM companies COMP, employees E
WHERE 1 LIKE E.employee_id AND 
E.company_fk LIKE COMP.company_id;

-- Get the name charge by the employee id
SELECT cha.name_charge FROM charges CHA, employees E WHERE
23 LIKE e.employee_id AND 
e.charge_fk LIKE cha.charge_id;


-- get all the atributes for the employeeDto
SELECT e.name_person,e.lastname, e.personal_number, com.name_company, 
cha.name_charge, e.salary, e.email, e.state
FROM employees E 
INNER JOIN charges CHA ON e.charge_fk = cha.charge_id
INNER JOIN companies COM ON e.company_fk = com.company_id ; 

--PAGINATION
SELECT e.name_person,e.lastname, e.personal_number, com.name_company, 
cha.name_charge, e.salary, e.email, e.state
FROM employees E 
INNER JOIN charges CHA ON e.charge_fk = cha.charge_id
INNER JOIN companies COM ON e.company_fk = com.company_id order by e.employee_id OFFSET (&pageindex*2) ROWS FETCH NEXT 2 ROWS ONLY ; 

--
-- get all the atributes for the employeeDto BY AN ID_EMPLOYEE
SELECT e.name_person,e.lastname, e.personal_number, com.name_company, 
cha.name_charge, e.salary, e.email, e.state
FROM employees E 
INNER JOIN charges CHA ON e.charge_fk = cha.charge_id
INNER JOIN companies COM ON e.company_fk = com.company_id 
WHERE e.employee_id=1;



/* SELECT suppliers.supplier_id, suppliers.supplier_name, orders.order_date
FROM suppliers 
INNER JOIN orders
ON suppliers.supplier_id = orders.supplier_id; */



select e.employee_id, e.personal_number ,e.name_person, e.lastname, e.salary, e.email, e.state from employees E 
inner join payments P on e.employee_id = p.employee_fk 
where
e.company_fk=1;

select * from payments where payments.employee_fk = 81; 

select from employees where ; 

select * from payments where payments.employee_fk = 81 and finished = 0;

select pc.amount, tc.name_concept from paymentconcepts PC
inner join type_concept TC ON pc.type_concept_fk = tc.concept_id
where pc.payment_fk=33 and
pc.concept_id=70;

--INNER JOIN charges CHA ON e.charge_fk = cha.charge_id

SELECT  pc.concept_id from paymentconcepts PC, type_concept TC where pc.payment_fk=33 and
pc.type_concept_fk=tc.concept_id;


--Obtener el paymentDetailDto

select p.payment_id as paymentId, e.name_person as namePerson,
e.lastname as lastname, 
e.personal_number as personalNumber,
e.salary as salary,
p.total_retentions + p.total_taxes as discounts,
p.total_benefits+p.total_licenses as additions,
p.total as total
from employees E inner join payments P ON e.employee_id = p.employee_fk 
where e.personal_number = 123;

--Get the employeesDto selected
SELECT e.name_person,e.lastname, e.personal_number, com.name_company, 
cha.name_charge, e.salary, e.email, e.state
FROM employees E 
INNER JOIN charges CHA ON e.charge_fk = cha.charge_id
INNER JOIN companies COM ON e.company_fk = com.company_id and 
e.personal_number = 123; 


--Get the total of registers
SELECT COUNT(*) FROM employees;

--get All Name Benefits
select name_concept from type_concept where name_type ='PRESTACIONES';

--get liquidations dto
SELECT
    e.name_person     AS nameperson,
    e.lastname        AS lastname,
    e.personal_number AS personalnumber,
    e.salary          AS salary
FROM
    employees e
WHERE
    e.personal_number = 4562;

--Get the concepts dto by name type
select pc.amount, tc.name_concept from paymentconcepts PC
inner join type_concept TC ON pc.type_concept_fk = tc.concept_id
where pc.payment_fk=41 and tc.name_type='RETENCIONES';
