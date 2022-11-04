localhost/phpMyAdmin

DROP TABLE  bibliotheques, auteurs, genres

CREATE TABLE bibliotheques
(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titre NOT NULL VARCHAR (250),
    auteur_id INT NOT NULL,
    genre_id INT NOT NULL
);

CREATE TABLE auteurs
(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR (250) NOT NULL
);

CREATE TABLE genres
(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    genre VARCHAR (250) NOT NULL
);

ALTER TABLE bibliotheques
ADD CONSTRAINT fk_auteur_id
FOREIGN KEY (auteur_id) REFERENCES auteurs(id);

ALTER TABLE bibliotheques
ADD CONSTRAINT fk_genres_id
FOREIGN KEY (genre_id) REFERENCES auteurs(id);

INSERT INTO auteurs (nom)
VALUES
('Charles baudelaire'),
('J.K. Rowling');

INSERT INTO genres (genre)
VALUES
('Poesie'),
('Science-fiction');

INSERT INTO `bibliotheques` (`id`, `titre`, `auteur_id`,`genre_id`) 
VALUES (NULL, 'Les Fleurs du mal', '1', '1');

INSERT INTO `bibliotheques` (`id`, `titre`, `auteur_id`,`genre_id`) 
VALUES (NULL, 'Harry Potter a l ecole des sorciers', '2', '2');

-- DELETE FROM `date`
-- WHERE condition

-- ALTER COLUMN date_id
-- ADD CONSTRAINT fk_date_id

-- SELECT * 
-- FROM `bibliothèques` 
-- WHERE `genre_id`


-- UPDATE auteur
-- SET auteur = 'Charles BAUDELAIRE'
-- WHERE id = 1


CREATE USER 'neuneu' IDENTIFIED BY 'neuneu';

SELECT genres.genre AS GENRES, auteurs.nom AS AUTEURS, bibliotheques.titre AS LIVRES
FROM bibliotheques 
INNER JOIN auteurs, genres
WHERE genres.id = genre_id AND auteurs.id = auteur_id 
OR ()

SELECT * 
FROM bibliotheques
WHERE `auteur_id` = (
    SELECT `id`
    FROM `auteurs`
    WHERE 	nom = "Charles baudelaire"
)