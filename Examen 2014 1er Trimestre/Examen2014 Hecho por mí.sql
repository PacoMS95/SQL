Create database acuaristas
go
use acuaristas
go

--

create table bomba (
marca_modelo nvarchar (30)
, caudal real
, consumo real
, CONSTRAINT PK_marca_modelo PRIMARY KEY (marca_modelo)
)
go

create table ser_vivo (

)


create table socio_acuario (
numero_de_socio smallint
, nombre nvarchar (15)
, apellidos nvarchar (30)
, direccion nvarchar (30)
, email nvarchar (40)
, telefono smallint
, marca_modelo nvarchar (30)
, capacidad real
, alto real 
, ancho real
, largo real
, temperatura tinyint
, CONSTRAINT PK_numero_de_socio PRIMARY KEY (numero_de_socio)
, CONSTRAINT FK_marca_modelo FOREIGN KEY (marca_modelo) REFERENCES bomba (marca_modelo)
)
go
