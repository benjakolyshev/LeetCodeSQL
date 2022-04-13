/*
SELECT ROUND( sum(case when sub_query.min_date + 1 = a.event_date then 1
    else 0 end) / count(distinct sub_query.player_id), 2 ) as fraction
FROM  ( select  player_id, min(event_date) as min_date from Activity group by 1 ) as sub_query
JOIN    Activity a ON sub_query.player_id = a.player_id

*/
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