SELECT
  order_id,
  LISTAGG(id, ', ') WITHIN GROUP (ORDER BY id) AS ids
FROM table
GROUP BY order_id;
