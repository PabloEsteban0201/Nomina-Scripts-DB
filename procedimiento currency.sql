create or replace PROCEDURE PR_SET_CURRENCY (in_employee_id NUMBER)     
IS
   --variables
    var_curr employees.abb_currency%type;

BEGIN
    
    SELECT curr.abbreviation into var_curr FROM employees E 
    INNER JOIN companies COM ON e.company_fk = com.company_id 
    inner join countries COUN on com.country_code_fk = coun.code_id 
    inner join currency CURR on coun.code_curr_fk = curr.code_curr_id 
    where e.employee_id =  in_employee_id;

    DBMS_OUTPUT.PUT_LINE(' var_curr: '||var_curr);
     UPDATE employees
        SET
            employees.abb_currency = var_curr
        WHERE
            employees.employee_id = in_employee_id;
EXCEPTION

    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Sucedio un error');

END PR_SET_CURRENCY;