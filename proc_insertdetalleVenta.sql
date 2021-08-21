


create proc sp_insertarDetalleVenta
@CodVenta UNIQUEIDENTIFIER,
@CodProd INT,
@Cant int,
@Precio float
as
insert into Detalle_Venta 
values(
    @CodVenta,
    @CodProd ,
    @Cant ,
    @Precio 
)
go