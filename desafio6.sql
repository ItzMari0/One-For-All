SELECT 
    MIN(subscription_cost) AS faturamento_minimo,
    MAX(subscription_cost) AS faturamento_maximo,
    ROUND(AVG(s.subscription_cost), 2) AS faturamento_medio,
    ROUND(SUM(s.subscription_cost), 2) AS faturamento_total
FROM
    SpotifyClone.subscription AS s
        INNER JOIN
    SpotifyClone.user AS u ON s.subscription_id = u.subscription_id;