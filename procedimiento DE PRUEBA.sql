create or replace PROCEDURE PR_PRUEBA(in_employee_id IN number)     
IS
   --variables

BEGIN
    
    
     UPDATE employees
        SET
            employees.name_person = 'prueba'
        WHERE
            employees.employee_id = in_employee_id;
EXCEPTION

    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Sucedio un error');

END PR_PRUEBA;