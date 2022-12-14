SELECT * FROM produtos WHERE id IN (
    SELECT id_produto FROM compras WHERE compras.id_cliente = 2
);

SELECT * FROM produtos WHERE id IN (
    SELECT id_produto FROM compras WHERE id_cliente IN (
        SELECT id FROM clientes WHERE nome = 'Benício Freire Sampaio'
    )
);

/* SELECT *
FROM receitas
JOIN "categoriasReceitas"
ON receitas.id="categoriasReceitas"."idReceita"
    JOIN categorias
    ON categorias.id="categoriasReceitas"."idCategoria" */