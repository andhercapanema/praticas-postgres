SELECT * FROM clientes WHERE id NOT IN (
    SELECT id_cliente FROM compras WHERE clientes.id = compras.id_cliente
);

SELECT * FROM clientes WHERE id NOT IN (
    SELECT id_cliente FROM compras
);
