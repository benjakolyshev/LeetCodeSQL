SELECT  p.name,
        COALESCE(SUM(i.rest),0) as rest,
        COALESCE(SUM(i.paid),0) as paid,
        COALESCE(SUM(i.canceled),0) as canceled,
        COALESCE(SUM(i.refunded),0) as refunded
FROM    
(
    SELECT *
    FROM Product) p
LEFT JOIN
(
    SELECT *
    FROM Invoice) i
ON   i.product_id = p.product_id
GROUP BY    p.name
ORDER BY    p.name