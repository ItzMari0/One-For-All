SELECT 
    Song_name AS nome_musica,
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(song_name,
                        'The Bard’s Song',
                        'The QA’s Song'),
                    'O Medo de Amar é o Medo de Ser Livre',
                    'O Medo de Code Review é o Medo de Ser Livre'),
                'Como Nossos Pais',
                'Como Nossos Pull Requests'),
            'BREAK MY SOUL',
            'BREAK MY CODE'),
        'ALIEN SUPERSTAR',
        'ALIEN SUPERDEV') AS novo_nome
FROM
    SpotifyClone.song
GROUP BY song_name
HAVING novo_nome <> nome_musica
ORDER BY nome_musica DESC;
