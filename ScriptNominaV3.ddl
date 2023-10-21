-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2023-10-19 14:45:52 COT
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE charges (
    charge_id   NUMBER(20) NOT NULL,
    name_charge VARCHAR2(50) NOT NULL
);

ALTER TABLE charges ADD CONSTRAINT charges_pk PRIMARY KEY ( charge_id );

CREATE TABLE companies (
    company_id      NUMBER NOT NULL,
    name_company    VARCHAR2(30) NOT NULL,
    country_code_fk VARCHAR2(5) NOT NULL
);

ALTER TABLE companies ADD CONSTRAINT companies_pk PRIMARY KEY ( company_id );

CREATE TABLE countries (
    code_id          VARCHAR2(5) NOT NULL,
    name_country     VARCHAR2(20) NOT NULL,
    currency_code_fk NUMBER NOT NULL
);

ALTER TABLE countries ADD CONSTRAINT countries_pk PRIMARY KEY ( code_id );

CREATE TABLE currency (
    code_curr_id  NUMBER NOT NULL,
    name_currency VARCHAR2(50) NOT NULL,
    abbreviation  VARCHAR2(5) NOT NULL,
    symbol        VARCHAR2(3) NOT NULL
);

ALTER TABLE currency ADD CONSTRAINT currency_pk PRIMARY KEY ( code_curr_id );

CREATE TABLE employees (
    personal_id   NUMBER(12) NOT NULL,
    name_person   VARCHAR2(15) NOT NULL,
    lastname      VARCHAR2(25) NOT NULL,
    salary        NUMBER(9) NOT NULL,
    email         VARCHAR2(50) NOT NULL,
    state         NUMBER NOT NULL,
    charge_id_fk  NUMBER(20) NOT NULL,
    company_id_fk NUMBER NOT NULL
);

ALTER TABLE employees ADD CONSTRAINT employees_pk PRIMARY KEY ( personal_id );

CREATE TABLE paymentconcepts (
    concept_id         NUMBER NOT NULL,
    amount             NUMBER(10) NOT NULL,
    type_concept_id_fk NUMBER NOT NULL,
    payment_id_fk      NUMBER NOT NULL
);

ALTER TABLE paymentconcepts ADD CONSTRAINT paymentconcepts_pk PRIMARY KEY ( concept_id );

CREATE TABLE payments (
    payment_id        NUMBER NOT NULL,
    pay_date          DATE NOT NULL,
    total_benefits    NUMBER(9) NOT NULL,
    total_retentios   NUMBER(9) NOT NULL,
    total_licenses    NUMBER(9) NOT NULL,
    total_taxes       NUMBER(9) NOT NULL,
    total             NUMBER(9) NOT NULL,
    period            NUMBER NOT NULL,
    personal_id_fk    NUMBER(12) NOT NULL,
    type_period_id_fk NUMBER
);

ALTER TABLE payments ADD CONSTRAINT payments_pk PRIMARY KEY ( payment_id );

CREATE TABLE type_concept (
    concept_id   NUMBER NOT NULL,
    name_concept VARCHAR2(50) NOT NULL,
    rate         NUMBER(4, 2) NOT NULL,
    type         VARCHAR2(15) NOT NULL
);

ALTER TABLE type_concept ADD CONSTRAINT type_concept_pk PRIMARY KEY ( concept_id );

CREATE TABLE type_period (
    period_id   NUMBER NOT NULL,
    code_period VARCHAR2(5) NOT NULL,
    description VARCHAR2(20) NOT NULL
);

ALTER TABLE type_period ADD CONSTRAINT type_period_pk PRIMARY KEY ( period_id );

CREATE TABLE usermanager (
    user_id  NUMBER NOT NULL,
    username VARCHAR2(15) NOT NULL,
    password VARCHAR2(15) NOT NULL
);

ALTER TABLE usermanager ADD CONSTRAINT usermanager_pk PRIMARY KEY ( user_id );

ALTER TABLE companies
    ADD CONSTRAINT companies_countries_fk FOREIGN KEY ( country_code_fk )
        REFERENCES countries ( code_id );

ALTER TABLE paymentconcepts
    ADD CONSTRAINT concepts_typeconcept_fk FOREIGN KEY ( type_concept_id_fk )
        REFERENCES type_concept ( concept_id );

ALTER TABLE countries
    ADD CONSTRAINT country_currency_fk FOREIGN KEY ( currency_code_fk )
        REFERENCES currency ( code_curr_id );

ALTER TABLE employees
    ADD CONSTRAINT employees_charges_fk FOREIGN KEY ( charge_id_fk )
        REFERENCES charges ( charge_id );

ALTER TABLE employees
    ADD CONSTRAINT employees_companies_fk FOREIGN KEY ( company_id_fk )
        REFERENCES companies ( company_id );

ALTER TABLE paymentconcepts
    ADD CONSTRAINT payments_concepts_fk FOREIGN KEY ( payment_id_fk )
        REFERENCES payments ( payment_id );

ALTER TABLE payments
    ADD CONSTRAINT payments_employees_fk FOREIGN KEY ( personal_id_fk )
        REFERENCES employees ( personal_id );

ALTER TABLE payments
    ADD CONSTRAINT payments_type_period_fk FOREIGN KEY ( type_period_id_fk )
        REFERENCES type_period ( period_id );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             18
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
