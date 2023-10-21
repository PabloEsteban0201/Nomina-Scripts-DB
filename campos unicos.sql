ALTER TABLE employees
ADD CONSTRAINT personal_number_unique UNIQUE (personal_number);

ALTER TABLE employees
ADD CONSTRAINT email_unique UNIQUE (email);