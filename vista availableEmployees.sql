CREATE VIEW availableEmployees AS
SELECT e.name_person as namePerson, e.lastname as lastname, 
       e.personal_number as personalNumber, com.name_company as nameCompany, 
       cha.name_charge as nameCharge, e.salary as salary, e.abb_currency as currency, 
       e.email as email, e.state as state 
FROM employees e  
INNER JOIN charges cha ON e.charge_fk = cha.charge_id 
INNER JOIN companies com ON e.company_fk = com.company_id  
LEFT JOIN payments p ON e.employee_id = p.employee_fk 
MINUS 
SELECT e.name_person, e.lastname, e.personal_number, com.name_company,  
       cha.name_charge, e.salary, e.abb_currency, e.email, e.state 
FROM employees e 
INNER JOIN charges cha ON e.charge_fk = cha.charge_id 
INNER JOIN companies com ON e.company_fk = com.company_id  
INNER JOIN payments p ON e.employee_id = p.employee_fk 
WHERE p.finished = 0;