SELECT
	s.song_name AS nome,
    CASE
    WHEN u.subscription_id = 1 THEN COUNT(h.song_id)
    WHEN u.subscription_id = 3 THEN COUNT(h.song_id)
    END AS reproducoes
    FROM SpotifyClone.song AS s
		INNER JOIN
        SpotifyClone.history AS h ON s.song_id = h.song_id
        INNER JOIN
        SpotifyClone.user AS u ON u.user_id = h.user_id GROUP BY s.song_name, u.subscription_id HAVING reproducoes > 0 ORDER BY nome ASC;
        