SELECT  ROUND(t1.logged_back/t2.total, 2) as fraction
FROM
( SELECT  COUNT(a1.player_id) as logged_back
FROM    Activity a1, (  SELECT  DISTINCT(player_id),
                                min(event_date) as min_date
                        from Activity
                        GROUP BY    player_id ) a2
WHERE   a1.event_date = a2.min_date + 1 AND a1.player_id = a2.player_id ) as t1,
( SELECT  COUNT(DISTINCT(player_id)) as total
FROM    Activity ) as t2