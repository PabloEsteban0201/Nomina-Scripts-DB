create or replace NONEDITIONABLE PROCEDURE PR_DELETE_PAYMENTS_BY_DATE(p_fecha_limite IN VARCHAR2)

AS

var_date DATE := TO_DATE(p_fecha_limite, 'DD-MM-YYYY');

BEGIN
     --delete the payment concepts
    DELETE FROM paymentconcepts
    WHERE paymentconcepts.payment_fk IN (SELECT payments.payment_id
                                 FROM payments
                                 WHERE payments.pay_date < var_date);
    --Delete the payments                            
    DELETE FROM payments
    WHERE pay_date < var_date;

END PR_DELETE_PAYMENTS_BY_DATE;