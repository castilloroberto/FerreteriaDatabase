create view ventasView
as
select v.Codigofactura as Factura,
        e.NomEmpleado as Empleado,
        v.Cod_Cliente as [DNI Cliente],
        c.Nom_Cliente + ' ' + c.Cod_Cliente as Cliente,
        c.Telefono as [Tel Cliente],
        p.Producto,
        dv.Cantidad,
        dv.Precio,
        dv.Cantidad*dv.Precio as Subtotal,
        v.Fecha 
    from ventas v
    INNER JOIN Clientes c on c.Cod_Cliente = v.Cod_Cliente  
    INNER JOIN Detalle_Venta dv on dv.Cod_Venta = v.Cod_Venta  
    INNER JOIN Productos p on p.Cod_Producto = dv.Cod_Producto  
    INNER JOIN Usuarios u on u.Nom_Usuario = v.Nom_Usuario  
    INNER JOIN Empleados e on e.Cod_Empleado = u.Cod_Empleado  
go
