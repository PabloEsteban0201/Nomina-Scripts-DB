CREATE OR REPLACE PROCEDURE PR_CALC_PAYMENT_BY_COMPANY(
    p_cursor OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_cursor FOR
    SELECT
        com.name_company,
        SUM(p.total) AS suma_total,
        e.abb_currency
    FROM
        companies com
    INNER JOIN
        employees e ON e.company_fk = com.company_id
    INNER JOIN
        payments p ON p.employee_fk = e.employee_id
    GROUP BY
        com.name_company, e.abb_currency;
END PR_CALC_PAYMENT_BY_COMPANY;