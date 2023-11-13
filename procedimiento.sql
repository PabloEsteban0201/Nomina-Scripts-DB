create or replace NONEDITIONABLE PROCEDURE PR_AMOUNT_PAYCONCEPT (in_employee_id NUMBER)     
IS
   --variables
    var_salary employees.salary%type;
    var_rate type_concept.rate%type;

    CURSOR c_pay_concepts IS
    SELECT concept_id, amount, type_concept_fk FROM paymentconcepts WHERE payment_fk = in_pay_id;

BEGIN

    select salary into var_salary from employees where in_personal_number = personal_number;

    DBMS_OUTPUT.PUT_LINE('var salary: '||var_salary);

    for pconcept in c_pay_concepts loop
        select rate into var_rate from type_concept where pconcept.type_concept_fk = concept_id;
        var_rate:=var_rate/100;
        DBMS_OUTPUT.PUT_LINE('concepto de pago numero: '||pconcept.concept_id);
        DBMS_OUTPUT.PUT_LINE('var rate: '||var_rate);
        update paymentconcepts set amount= (var_rate*var_salary) 
        where pconcept.concept_id = concept_id ;
    end loop;

EXCEPTION

    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Sucedio un error');

END PR_AMOUNT_PAYCONCEPT;