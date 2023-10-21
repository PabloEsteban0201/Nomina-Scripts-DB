--INSERT CURRENCIES

insert into CURRENCY values (170,'PESO COLOMBIANO','COP','$');
insert into CURRENCY values (32,'PESO ARGENTINO','ARS','$');
insert into CURRENCY values (152,'PESO CHILENO','CLP','$');
insert into CURRENCY values (484,'PESO MEXICANO','MXN','$');

--Inserts in countries
insert into countries values (170,'COL','COLOMBIA',170);
insert into countries values (32,'ARG','ARGENTINA',32);
insert into countries values (152,'CHL','CHILE',152);
insert into countries values (484,'MEX','MEXICO',484);

--INSERTS IN COMPANIES
insert into companies values (1,'Open SAS',170);
insert into companies values (2,'Close SAS',484);
insert into companies values (3,'Segures SAS',32);

--INSERTS IN CHARGES
insert into charges values (1,'Gerente');
insert into charges values (2,'Subgerente');
insert into charges values (3,'Desarrollador');
insert into charges values (4,'Project Manager');
insert into charges values (5,'Quality Assurance');


-- INSERTS IN TYPE PERIOD
INSERT INTO type_period VALUES (1,'QUI','QUINCENAL');
INSERT INTO type_period VALUES (2,'MEN','MENSUAL');
INSERT INTO type_period VALUES (3,'TRI','TRIMESTRAL');
INSERT INTO type_period VALUES (4,'SEM','SEMESTRAL');


-- INSERTS IN TYPE_CONCEPT
INSERT INTO type_concept VALUES (1,'Seguridad social',4.0,'PRESTACIONES');
INSERT INTO type_concept VALUES (2,'Cesantias',6.0,'PRESTACIONES');

INSERT INTO type_concept VALUES (3,'Vacaciones',70.0,'LICENCIAS');
INSERT INTO type_concept VALUES (4,'Licencia de maternidad',80.0,'LICENCIAS');
INSERT INTO type_concept VALUES (5,'Licencia de incapacidad',80.0,'LICENCIAS');

--Insert in user

INSERT into usermanager values (1,'NominaGestor','abril2');

--Insert in employee personalnumber, name, lastname, salary, email, state, charge, company
insert into employees values ('',1000123,'Pablo','Espinosa',3500000,'pablo@correo.com',1,3,1);

insert into employees values ('',123,'Esteban','Espinosa',3500000,'esteban@correo.com',1,3,1);

insert into employees values ('',124,'Sara','Espinosa',3500000,'sara@correo.com',1,4,1);

insert into employees values ('',125,'Henry','Montes',3500000,'henry@correo.com',1,1,1);


