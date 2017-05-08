--Boletin 9.3
--Unidad 9. Boletin 4

--Escribe las siguientes consultas sobre la base de datos pubs.
use pubs
go
--Pon el enunciado como comentario junta a cada una
--Consultas

--    T�tulo y tipo de todos los libros en los que alguno de los autores vive en California (CA).

select distinct title, type from titles as t 
inner join titleauthor as ta on t.title_id = ta.title_id
inner join authors as a on ta.au_id = a.au_id
where state = 'CA';


--    T�tulo y tipo de todos los libros en los que ninguno de los autores vive en California (CA).

select distinct title, type from titles as t 
inner join titleauthor as ta on t.title_id = ta.title_id
inner join authors as a on ta.au_id = a.au_id
where state != 'CA';

--    N�mero de libros en los que ha participado cada autor, incluidos los que no han publicado nada.

select count(title_id), A.au_id from authors as A
left join titleauthor as TA on A.au_id=TA.au_id
group by A.au_id

--    N�mero de libros que ha publicado cada editorial, incluidas las que no han publicado ninguno.

select count(title_id), pub_name from titles as T
right join publishers as P on T.pub_id = P.pub_id
group by pub_name

--    N�mero de empleados de cada editorial.

select count(emp_id) as [N�mero de empleados], pub_name from employee as E
inner join publishers as P on E.pub_id= P.pub_id
group by pub_name

--Hubiera sido m�s correcto con un full join, pero la verdad es que da los mismos resultados...


Select p.pub_name,
	   count(e.emp_id) as [N�mero de empleados]
from employee as e
full join publishers as p
on e.pub_id=p.pub_id
group by p.pub_name

--    Calcular la relaci�n entre n�mero de ejemplares publicados y 
-- n�mero de empleados de cada editorial, incluyendo el nombre de la misma.


--    Nombre, Apellidos y ciudad de todos los autores que han trabajado para la editorial 
-- "Binnet & Hardley� o "Five Lakes Publishing�

select au_fname, au_lname, A.city, pub_name from authors as A
inner join titleauthor as TA on A.au_id = TA.au_id
inner join titles as T on TA.title_id = T.title_id
inner join publishers as P on T.pub_id = P.pub_id
where pub_name in ('Binnet & Hardley' , 'Five Lakes Publishing')

-- Empleados que est�n trabajando en alguna editorial que haya publicado 
-- alg�n libro en el que alguno de los autores fuera Marjorie Green o Michael O'Leary.

select fname, lname, pub_name from employee as E 
inner join publishers as P on E.pub_id = P.pub_id
where pub_id in (select pub_id from publishers where pub)




(select T.title_id from titles as T 
inner join titleauthor as TA on T.title_id = TA.title_id
inner join authors as A on TA.au_id=A.au_id
where au_lname = 'Green' or au_lname = '%Leary');


-- N�mero de ejemplares vendidos de cada libro, especificando el t�tulo y el tipo.

select sum(qty) as [numero de ventas], title, type from sales as S
inner join titles as T on S.title_id = T.title_id
group by title, type

--10.  N�mero de ejemplares que ha vendido cada autor de todos sus libros.

select sum() 

--11.  N�mero de empleados de cada categor�a (jobs).

--12.  N�mero de empleados de cada categor�a (jobs) que tiene cada editorial, incluyendo aquellas categor�as en las que no haya ning�n empleado.

--13.  Autores que han escrito libros de dos o m�s tipos diferentes

--14.  Empleados que no trabajan en editoriales que han publicado libros cuya columna notes contenga la palabra "and�