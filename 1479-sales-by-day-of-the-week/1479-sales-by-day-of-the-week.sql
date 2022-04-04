SELECT  b.Category as Category,
        SUM(b.Monday) as Monday,
        SUM(b.Tuesday) as Tuesday,
        SUM(b.Wednesday) as Wednesday,
        SUM(b.Thursday) as Thursday,
        SUM(b.Friday) as Friday,
        SUM(b.Saturday) as Saturday,
        SUM(b.Sunday) as Sunday
        
FROM (
    SELECT  i.item_category as Category,
            SUM(CASE WHEN DATE_FORMAT(o.order_date, "%W") = 'Monday' THEN o.quantity ELSE 0 END) as Monday,
            SUM(CASE WHEN DATE_FORMAT(o.order_date, "%W") = 'Tuesday' THEN o.quantity ELSE 0 END) as Tuesday,
            SUM(CASE WHEN DATE_FORMAT(o.order_date, "%W") = 'Wednesday' THEN o.quantity ELSE 0 END) as Wednesday,
            SUM(CASE WHEN DATE_FORMAT(o.order_date, "%W") = 'Thursday' THEN o.quantity ELSE 0 END) as Thursday,
            SUM(CASE WHEN DATE_FORMAT(o.order_date, "%W") = 'Friday' THEN o.quantity ELSE 0 END) as Friday,
            SUM(CASE WHEN DATE_FORMAT(o.order_date, "%W") = 'Saturday' THEN o.quantity ELSE 0 END) as Saturday,
            SUM(CASE WHEN DATE_FORMAT(o.order_date, "%W") = 'Sunday' THEN o.quantity ELSE 0 END) as Sunday
    FROM    Orders o, Items i
    WHERE   o.item_id = i.item_id
    GROUP BY    Category

    UNION

    SELECT  DISTINCT(item_category) as Category,
            0 as Monday,
            0 as Tuesday,
            0 as Wednesday,
            0 as Thursday,
            0 as Friday,
            0 as Saturday,
            0 as Sunday
    FROM    Items ) b
GROUP BY    b.Category
ORDER BY    b.Category ASC