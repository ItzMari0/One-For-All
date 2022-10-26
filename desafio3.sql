SELECT u.user_name AS usuario, COUNT(h.user_id) AS qt_de_musicas_ouvidas, ROUND(SUM(song_duration) / 60, 2) AS total_minutos FROM SpotifyClone.user AS u
  INNER JOIN SpotifyClone.history AS h ON u.user_id = h.user_id
  INNER JOIN SpotifyClone.song AS s ON h.song_id = s.song_id
  GROUP BY usuario ORDER BY usuario ASC;