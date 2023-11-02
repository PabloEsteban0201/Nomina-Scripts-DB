CREATE OR REPLACE PROCEDURE pr_calc_payment (
    in_pay_id NUMBER
) IS
   --variables
    var_benefits   payments.total_benefits%TYPE := 0;
    var_retentions payments.total_retentions%TYPE := 0;
    var_licenses   payments.total_licenses%TYPE := 0;
    var_taxes      payments.total_taxes%TYPE := 0;
    var_amount     paymentconcepts.amount%TYPE;
    var_type       type_concept.name_type%TYPE;
    var_salary employees.salary%type;
    
    CURSOR c_pay_concepts IS
    SELECT
        concept_id,
        amount,
        type_concept_fk
    FROM
        paymentconcepts
    WHERE
        payment_fk = in_pay_id;

BEGIN

    --Obtener para cada variable según el tipo de concepto asociado a cada concepto de pago

    FOR pconcept IN c_pay_concepts LOOP
        SELECT
            name_type
        INTO var_type
        FROM
            type_concept
        WHERE
            pconcept.type_concept_fk = concept_id;
        
        dbms_output.put_line('tipo a procesar ' || var_type);
        
        
        
        SELECT
            amount
        INTO var_amount
        FROM
            paymentconcepts
        WHERE
            pconcept.concept_id = concept_id;
        
        dbms_output.put_line('Monto: ' || var_amount);
        
        CASE var_type
            WHEN 'PRESTACIONES' THEN
                var_benefits := var_benefits + var_amount;
            WHEN 'LICENCIAS' THEN
                var_licenses := var_licenses + var_amount;
            WHEN 'IMPUESTOS' THEN
                var_taxes := var_taxes + var_amount;
             WHEN 'RETENCIONES' THEN
                var_retentions := var_retentions + var_amount;    
        END CASE;
        
        dbms_output.put_line('var_benefits: ' || var_benefits);
        dbms_output.put_line('var_licenses: ' || var_licenses);
        dbms_output.put_line('var_taxes: ' || var_taxes);
        dbms_output.put_line('var_retentions: ' || var_retentions);
        
    END LOOP;
    
    select salary into var_salary from employees E, payments P where e.employee_id=p.employee_fk and
    p.payment_id=in_pay_id;
    
    
    UPDATE payments
        SET
            TOTAL_BENEFITS = (var_benefits),
            TOTAL_LICENSES = (var_licenses),
            TOTAL_RETENTIONS = (var_retentions),
            TOTAL_TAXES = (var_taxes),
            total = (var_salary+var_benefits+var_licenses+var_retentions+var_taxes)
        WHERE
            payment_id = in_pay_id;
    
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Sucedio un error');
END pr_calc_payment;