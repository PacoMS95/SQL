--Boletin 7.2
--Consultas sobre una sola Tabla sin agregados

--Sobre la base de datos "pubs� (En la plataforma aparece como "Ejemplos 2000").
use pubs
go
--    T�tulo, precio y notas de los libros (titles) que tratan de cocina, ordenados de mayor a menor precio.

select title, price, notes from titles where type = 'trad_cook' or type = 'mod_cook'

--TAMBI�N SE POD�A HABER HECHO

SELECT title,price,notes
FROM titles
WHERE type IN ('trad_cook','mod_cook')

--    ID, descripci�n y nivel m�ximo y m�nimo de los puestos de trabajo (jobs) que pueden tener un nivel 110.

select * from jobs where min_lvl<=110 AND max_lvl>=110

--	TAMBI�N SE PODR�A HACER AS�

select * from jobs where 110 between min_lvl and max_lvl

--    T�tulo, ID y tema de los libros que contengan la palabra "and� en las notas

select title, pub_id, type from titles where notes like '%and%'

--    Nombre y ciudad de las editoriales (publishers) de los Estados Unidos que no est�n en California ni en Texas

select pub_name, city from publishers where country = 'USA' and state != 'TX' and state != 'CA' 

--    T�tulo, precio, ID de los libros que traten sobre psicolog�a o negocios y cuesten entre diez y 20 d�lares.

select title, price, title_id from titles where type in ('psychology','business')and (price between 10 and 20)

--    Nombre completo (nombre y apellido) y direcci�n completa de todos los autores que no viven en California ni en Oreg�n.

select au_fname, au_lname, address, city,state, zip from authors where state not in ('CA','OR') -- Importante: has intentado not in 'CA' and not in 'OR', pero por lo visto hay que hacerlo as�

--    Nombre completo y direcci�n completa de todos los autores cuyo apellido empieza por D, G o S.

select au_fname, au_lname, address, city, state, zip from authors where au_lname like 'D%' or au_lname like 'G%' or au_lname like 'S%'

--    ID, nivel y nombre completo de todos los empleados con un nivel inferior a 100, ordenado alfab�ticamente
select emp_id, job_lvl, lname, fname from employee where job_lvl < 100 order by lname asc

--Modificaciones de datos

--    Inserta un nuevo autor.
BEGIN TRANSACTION
INSERT INTO authors (au_id,au_lname,au_fname,phone,address,city,state,zip,contract) VALUES ('172-32-1177','Esteban','Bel�n','666666666','Calle Nieve', 'San Jose', 'CA','95128','true')
COMMIT
--    Inserta dos libros, escritos por el autor que has insertado antes y publicados por la editorial "Ramona publishers�.
select * from titles

begin transaction
insert into titles (title_id, title, type, pub_id, price, advance, royalty, ytd_sales, notes, pubdate) values ('TW6666','Confesiones', 'no', 123423, 55, 8999, NULL, 2987, 'me aburro mucho', CURRENT_TIMESTAMP )
commit transaction

--    Modifica la tabla jobs para que el nivel m�nimo sea 90.
alter table jobs with nocheck add constraint CK_nivelMinimo90 check (min_lvl > 90)
--    Crea una nueva editorial (publihers) con ID 9908, nombre Mostachon Books y sede en Utrera.

--    Cambia el nombre de la editorial con sede en Alemania para que se llame "Machen W�cher" y traslasde su sede a Stuttgart

