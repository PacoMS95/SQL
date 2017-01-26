--Boletin 8.2
--Consultas sobre una sola Tabla con agregados

--Escribe el código SQL necesario para realizar las siguientes operaciones
--sobre la base de datos "pubs”
use pubs
go

--1. Numero de libros que tratan de cada tema

select distinct COUNT(type), type from titles group by type

--2. Número de autores diferentes en cada ciudad y estado

select distinct COUNT (au_id) as [Número de autores], city, state from authors group by city, state

--3. Nombre, apellidos, nivel y antigüedad en la empresa de los empleados con un nivel entre 100 y 150.

select * from employee

select fname, lname, job_lvl, DATEDIFF() from employee
--4. Número de editoriales en cada país. Incluye el país.



--5. Número de unidades vendidas de cada libro en cada año (title_id, unidades y año).



--6. Número de autores que han escrito cada libro (title_id y numero de autores).



--7. ID, Titulo, tipo y precio de los libros cuyo adelanto inicial (advance) tenga un valor superior a $7.000, ordenado por tipo y título

