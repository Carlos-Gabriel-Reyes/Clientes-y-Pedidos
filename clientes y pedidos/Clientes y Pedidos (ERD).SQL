create table clientes(cliente_id INT primary key,nombre VARCHAR(50), direccion VARCHAR(50), telefono INT );
create table pedidos(id_pedidos INT primary key, fecha DATETIME, total FLOAT, cliente_id INT, foreign key(cliente_id) references clientes (cliente_id));


insert into clientes (cliente_id, nombre, direccion, telefono) values
(1, "ELAYNE" , "av.tamarindo", 538939),
(2, "Santiago" , "av.los tambores", 53890177),
(3, "juan alberto" , "calle los leones", 588139),
(4, "julieta" , "av. ivanco", 5389739),
(5, "maria" , "av.jose", 5389066);


insert into pedidos(id_pedidos, fecha, total, cliente_id) VALUES 
(101, '2025-09-01', 15000, 1),
(102, '2025-09-02', 20000, 2),
(103, '2025-09-03', 18000, 3),
(104, '2025-09-04', 22000, 1),
(105, '2025-09-05', 17000, 4),
(106, '2025-09-06', 25000, 5),
(107, '2025-09-07', 16000, 2),
(108, '2025-09-08', 19000, 3),
(109, '2025-09-09', 21000, 1),
(110, '2025-09-10', 23000, 5);

SELECT * from pedidos;

select * from clientes;

SELECT * FROM pedidos where cliente_id = 1;

SELECT c.cliente_id, c.nombre, p.id_pedidos, p.fecha, p.total
FROM clientes c
LEFT JOIN pedidos p ON c.cliente_id = p.cliente_id;

SELECT c.cliente_id, c.nombre, SUM(p.total) AS total_pedidos
FROM clientes c
JOIN pedidos p ON c.cliente_id = p.cliente_id
GROUP BY c.cliente_id, c.nombre;

DELETE FROM pedidos WHERE cliente_id = 3;
DELETE FROM clientes WHERE cliente_id = 3;


SELECT c.cliente_id, c.nombre, COUNT(p.id_pedidos) AS cantidad_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.cliente_id = p.cliente_id
GROUP BY c.cliente_id, c.nombre
ORDER BY cantidad_pedidos DESC;