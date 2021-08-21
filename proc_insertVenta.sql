

create proc sp_insertVenta
@CodVenta UNIQUEIDENTIFIER,
@CodCliente NVARCHAR(13),
@NomUsuario nvarchar(20)
as
insert into Ventas(Cod_Venta,Cod_Cliente,Nom_Usuario) 
VALUES(
    @CodVenta ,
    @CodCliente ,
    @NomUsuario 
)
go