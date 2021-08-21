


create view ProductosView
as
    select Cod_Producto CodigoProducto,
            p.Producto,
            p.Precio,
            p.Stock,
            c.Nom_Categoria Categoria,
            m.Marca,
            pv.Nomb_Empresa Proveedor
     from Productos p
    INNER JOIN Categorias c on c.Cod_Categoria = p.Cod_Categoria
    INNER JOIN Proveedor pv on pv.Cod_Proveedor = p.Cod_Proveedor
    INNER JOIN Marcas m on m.Cod_Marca = p.Cod_Marca
go