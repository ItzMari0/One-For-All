SELECT 
    u.user_name AS usuario,
    IF(MAX(YEAR(reproduction_date)) >= 2021,
        'Usuário ativo',
        'Usuário inativo') AS status_usuario
FROM
    SpotifyClone.user AS u
        INNER JOIN
    SpotifyClone.history AS h ON u.user_id = h.user_id
GROUP BY u.user_id
ORDER BY usuario ASC;