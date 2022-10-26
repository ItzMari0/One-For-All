SELECT 
    art.artist_name AS artista,
    alb.album_name AS album,
    COUNT(f.artist_id) AS seguidores
FROM
    SpotifyClone.artist AS art
        INNER JOIN
    SpotifyClone.album AS alb ON art.artist_id = alb.artist_id
        INNER JOIN
    SpotifyClone.following AS f ON alb.artist_id = f.artist_id
GROUP BY art.artist_name , alb.album_name
ORDER BY seguidores DESC , artista ASC , album ASC;