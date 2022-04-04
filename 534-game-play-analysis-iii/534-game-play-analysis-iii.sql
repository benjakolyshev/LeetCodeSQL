# Write your MySQL query statement below
SELECT  player_id,
        event_date,
        sum(games_played) over(PARTITION BY player_id ORDER BY event_date) as games_played_so_far
FROM Activity
ORDER BY player_id, games_played_so_far