

Create proc sp_insertProducto 
@Producto nvarchar(70),
@Precio decimal,
@Stock int,
@CodCat int = 1,
@CodMarca int = 1,
@CodProv int = 1
as
    insert into Productos 
    VALUES(
        @Producto,
        @Precio ,
        @Stock ,
        @CodCat ,
        @CodMarca ,
        @CodProv
    )
go
