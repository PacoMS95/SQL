--Boletin 8.2
--Consultas sobre una sola Tabla con agregados

--Escribe el c�digo SQL necesario para realizar las siguientes operaciones
--sobre la base de datos "pubs�
use pubs
go

--1. Numero de libros que tratan de cada tema

select distinct COUNT(type), type from titles group by type

--2. N�mero de autores diferentes en cada ciudad y estado

select distinct COUNT (au_id) as [N�mero de autores], city, state from authors group by city, state

--3. Nombre, apellidos, nivel y antig�edad en la empresa de los empleados con un nivel entre 100 y 150.

select * from employee

select fname, lname, job_lvl, DATEDIFF() from employee
--4. N�mero de editoriales en cada pa�s. Incluye el pa�s.



--5. N�mero de unidades vendidas de cada libro en cada a�o (title_id, unidades y a�o).



--6. N�mero de autores que han escrito cada libro (title_id y numero de autores).



--7. ID, Titulo, tipo y precio de los libros cuyo adelanto inicial (advance) tenga un valor superior a $7.000, ordenado por tipo y t�tulo

