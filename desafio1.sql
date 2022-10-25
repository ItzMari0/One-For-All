DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.subscription(
    subscription_id INT PRIMARY KEY,
    subscription_type VARCHAR(50) NOT NULL,
    subscription_cost DECIMAL(4, 2)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.subscription(subscription_id, subscription_type, subscription_cost)
    VALUES
      (1, 'gratuito', 0.00),
      (2, 'universitário', 5.99),
      (3, 'pessoal', 6.99),
      (4, 'familiar', 7.99);

  CREATE TABLE SpotifyClone.user(
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    user_age VARCHAR(10),
    subscription_date DATE,
    subscription_id INT NOT NULL, FOREIGN KEY(subscription_id) REFERENCES subscription(subscription_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.user(user_id, user_name, user_age, subscription_date, subscription_id)
    VALUES
      (1, 'Barbara Liskov', '82', '2019-10-20', 1),
      (2, 'Robert Cecil Martin', '58', '2017-01-06', 1),
      (3, 'Ada Lovelace', '37', '2017-12-30', 4),
      (4, 'Martin Fowler', '46', '2017-01-17', 4),
      (5, 'Sandi Metz', '58', '2018-04-29', 4),
      (6, 'Paulo Freire', '19', '2018-02-14', 2),
      (7, 'Bell Hooks', '26', '2018-01-05', 2),
      (8, 'Christopher Alexander', '85', '2019-06-05', 3),
      (9, 'Judith Butler', '45', '2020-05-13', 3),
      (10, 'Jorge Amado', '58', '2017-02-17', 3);

  CREATE TABLE SpotifyClone.artist(
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(50) NOT NULL
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.artist(artist_id, artist_name)
    VALUES
      (1, 'Beyoncé'),
      (2, 'Queen'),
      (3, 'Elis Regina'),
      (4, 'Baco Exu do Blues'),
      (5, 'Blind Guardian'),
      (6, 'Nina Simone');

  CREATE TABLE SpotifyClone.album(
    album_id INT PRIMARY KEY,
    album_name VARCHAR(100) NOT NULL,
    release_date YEAR,
    artist_id INT, FOREIGN KEY(artist_id) REFERENCES artist(artist_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.album(album_id, album_name, release_date, artist_id)
    VALUES
      (1, 'Renaissance', '2022', 1),
      (2, 'Jazz', '1978', 2),
      (3, 'Hot Space', '1982', 2),
      (4, 'Falso Brilhante', '1998', 3),
      (5, 'Vento de Maio', '2001', 3),
      (6, 'QVVJFA?', '2003', 4),
      (7, 'Somewhere Far Beyond', '2007', 5),
      (8, 'I Put A Spell On You', '2012', 6);

  CREATE TABLE SpotifyClone.song(
    song_id INT PRIMARY KEY,
    song_name VARCHAR(100) NOT NULL,
    song_duration INT,
    album_id INT NOT NULL, FOREIGN KEY(album_id) REFERENCES album(album_id),
    artist_id INT, FOREIGN KEY(artist_id) REFERENCES artist(artist_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.song(song_id, song_name, song_duration, album_id, artist_id)
    VALUES
      (1, 'BREAK MY SOUL', 279, 1, 1),
      (2, 'VIRGO´S GROOVE', 369, 1, 1),
      (3, 'ALIEN SUPERSTAR', 116, 1, 1),
      (4, 'Don´t Stop Me Now', 203, 2, 2),
      (5, 'Under Pressure', 152, 3, 2),
      (6, 'Como Nossos Pais', 105, 4, 3),
      (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 5, 3),
      (8, 'Samba em Paris', 267, 6, 4),
      (9, 'The Bard´s Song', 244, 7, 5),
      (10, 'Feeling Good', 100, 8, 6);

  CREATE TABLE SpotifyClone.following(
    following_id INT,
    user_id INT NOT NULL, FOREIGN KEY(user_id) REFERENCES user(user_id),
    artist_id INT, FOREIGN KEY(artist_id) REFERENCES artist(artist_id),
    PRIMARY KEY(following_id, user_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.following(following_id, user_id, artist_id)
    VALUES
      (1, 1, 1),
      (2, 1, 2),
      (3, 1, 3),
      (4, 2, 1),
      (5, 2, 3),
      (6, 3, 2),
      (7, 4, 4),
      (8, 5, 5),
      (9, 5, 6),
      (10, 6, 1),
      (11, 6, 6),
      (12, 7, 6),
      (13, 9, 3),
      (14, 10, 2);

  CREATE TABLE SpotifyClone.history(
    history_id INT,
    user_id INT NOT NULL, FOREIGN KEY(user_id) REFERENCES user(user_id),
    song_id INT NOT NULL, FOREIGN KEY(song_id) REFERENCES song(song_id),
    reproduction_date DATETIME,
    PRIMARY KEY (history_id, song_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.history(history_id, user_id, song_id, reproduction_date)
    VALUES
      (1, 1, 8, '2022-02-28 10:45:55'),
      (2, 1, 2, '2020-05-02 05:30:35'),
      (3, 1, 10, '2020-03-06 11:22:33'),
      (4, 2, 10, '2022-08-05 08:05:17'),
      (5, 2, 7, '2020-01-02 07:40:33'),
      (6, 3, 10, '2020-11-13 16:55:13'),
      (7, 3, 2, '2020-12-05 18:38:30'),
      (8, 4, 8, '2021-08-15 17:10:10'),
      (9, 5, 8, '2022-01-09 01:44:33'),
      (10, 5, 5, '2020-08-06 15:23:43'),
      (11, 6, 7, '2017-01-24 00:31:17'),
      (12, 6, 1, '2017-10-12 12:35:20'),
      (13, 7, 4, '2011-12-15 22:30:49'),
      (14, 8, 4, '2012-03-17 14:56:41'),
      (15, 9, 9, '2022-02-24 21:14:22'),
      (16, 10, 3, '2015-12-13 08:30:22');
