create or replace NONEDITIONABLE PROCEDURE PR_DELETE_OLD_PAYMENTS

AS

--variables
    p_fecha_limite DATE := TO_DATE('31-12-2021', 'DD-MM-YYYY');

BEGIN
     --delete the payment concepts
    DELETE FROM paymentconcepts
    WHERE paymentconcepts.payment_fk IN (SELECT payments.payment_id
                                 FROM payments
                                 WHERE payments.pay_date < p_fecha_limite);
    --Delete the payments                            
    DELETE FROM payments
    WHERE pay_date < p_fecha_limite;

END PR_DELETE_OLD_PAYMENTS;