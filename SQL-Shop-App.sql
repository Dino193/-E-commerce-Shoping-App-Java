CREATE DATABASE BazaAplicationShoping;

USE BazaAplicationShoping;

SELECT  k.imeKategorije, p.Ime_Proizvoda
FROM kategorija k
JOIN Proizvod p ON k.kategorijaID = p.kategorija_ID
where (Cena_Proizvoda  BETWEEN 50 and 150)
AND (imeKategorije = "Kosilice");

-- Create Kategorija Table
CREATE TABLE kategorija (
    kategorijaID INT PRIMARY KEY AUTO_INCREMENT,
    imeKategorije VARCHAR(255) NOT NULL,
    opisKategorije VARCHAR(255)
);

INSERT INTO kategorija (imeKategorije, opisKategorije)
VALUES
    ('Alati', 'za rucni rad alati'),
    ('Kosilice', 'za baste alati'),
    ('Sredstva za prskanje', 'sredstva za zastitu protiv insekata'),
    ('Djubrivo', 'supstance za zemljista'),
    ('Oprema', 'radna oprema');

-- Create Brand Table
CREATE TABLE Brand (
    Brand_ID INT PRIMARY KEY AUTO_INCREMENT,
    Ime_Brenda VARCHAR(255) NOT NULL,
    Opis_Brenda VARCHAR(255)
);

INSERT INTO Brand (Ime_Brenda, Opis_Brenda)
VALUES
    ('Stihl', 'prskalica'),
    ('Villager', 'kosilica'),
    ('Womax', 'oprema');


-- Create SkladisteProizvoda Table
CREATE TABLE SkladisteProizvoda (
    Skladiste_ID INT PRIMARY KEY AUTO_INCREMENT,
    Naziv_Skladista VARCHAR(255) NOT NULL,
    Adressa VARCHAR(255),
    Grad VARCHAR(255),
    BrojTelefona VARCHAR(255)
);

-- Insert initial data into SkladisteProizvoda
INSERT INTO SkladisteProizvoda (Naziv_Skladista, Adressa, Grad, BrojTelefona)
VALUES
    ('Simanovci', 'Proleterska bb', 'Simanovci', '234324'),
    ('Banovi', 'Sumska 13', 'Novi Banovci', '49-2009321'),
    ('Pazova', 'Ribarska 14', 'Nova Pazova', '31249-421'),
    ('Dobanovci', 'Letnja 50', 'Dobanovci', '342-4342');


-- Create Proizvod Table
CREATE TABLE Proizvod (
    Proizvod_ID INT PRIMARY KEY AUTO_INCREMENT,
    Ime_Proizvoda VARCHAR(255) NOT NULL,
    Slika_Proizvoda LONGBLOB,
    Opis_Proizvoda VARCHAR(255),
    Cena_Proizvoda DECIMAL(10, 2) NOT NULL,
    Kategorija_ID INT NOT NULL,
    Brand_ID INT NOT NULL,
    Skladiste_ID INT NOT NULL,
    FOREIGN KEY (Kategorija_ID) REFERENCES kategorija(kategorijaID) ON DELETE CASCADE,
    FOREIGN KEY (Brand_ID) REFERENCES Brand(Brand_ID) ON DELETE CASCADE,
    FOREIGN KEY (Skladiste_ID) REFERENCES SkladisteProizvoda(Skladiste_ID) ON DELETE CASCADE
);


/* Za kategoriju Alati START */

INSERT INTO Proizvod (Ime_Proizvoda, Slika_Proizvoda, Opis_Proizvoda, Cena_Proizvoda, Kategorija_ID, Brand_ID, Skladiste_ID)
VALUES ('Cekic Sa Zaobljenom Glavom', LOAD_FILE(''), 'alatka za rad u basti', 50.00, 1, 1, 1);

INSERT INTO Proizvod (Ime_Proizvoda, Slika_Proizvoda, Opis_Proizvoda, Cena_Proizvoda, Kategorija_ID, Brand_ID, Skladiste_ID)
VALUES ('Lopata', LOAD_FILE(''), 'alatka za rad', 30.00, 1, 2, 1);

INSERT INTO Proizvod (Ime_Proizvoda, Slika_Proizvoda, Opis_Proizvoda, Cena_Proizvoda, Kategorija_ID, Brand_ID, Skladiste_ID)
VALUES ('Busilica', LOAD_FILE(''), 'alatka za rad', 157.00, 1, 3, 1);

INSERT INTO Proizvod (Ime_Proizvoda, Slika_Proizvoda, Opis_Proizvoda, Cena_Proizvoda, Kategorija_ID, Brand_ID, Skladiste_ID)
VALUES ('Rukavice', LOAD_FILE(''), 'alatka za rad', 15.00, 1, 3, 1);

/* Za kategoriju Alati END */

/* Za kategoriju kosilica START */

INSERT INTO Proizvod (Ime_Proizvoda, Slika_Proizvoda, Opis_Proizvoda, Cena_Proizvoda, Kategorija_ID, Brand_ID, Skladiste_ID)
VALUES ('Elektricna Kosilica Za Travu', LOAD_FILE(''), 'kosilica', 150.00, 2, 2, 2);

INSERT INTO Proizvod (Ime_Proizvoda, Slika_Proizvoda, Opis_Proizvoda, Cena_Proizvoda, Kategorija_ID, Brand_ID, Skladiste_ID)
VALUES ('Traktorska Kosilica', LOAD_FILE(''), 'rad u basti', 150.00, 2, 2, 2);

INSERT INTO Proizvod (Ime_Proizvoda, Slika_Proizvoda, Opis_Proizvoda, Cena_Proizvoda, Kategorija_ID, Brand_ID, Skladiste_ID)
VALUES ('Benziska Kosilica', LOAD_FILE(''), 'rad u basti', 500.00, 2, 2, 2);

/* Za kategoriju kosilica END */

/* Za kategoriju sredstva za prskanje START */

INSERT INTO Proizvod (Ime_Proizvoda, Slika_Proizvoda, Opis_Proizvoda, Cena_Proizvoda, Kategorija_ID, Brand_ID, Skladiste_ID)
VALUES ('Plavo Ulje Za Zimsko Prskanje', LOAD_FILE(''), 'sredstva za prskanje', 100.00, 3, 3, 3);

INSERT INTO Proizvod (Ime_Proizvoda, Slika_Proizvoda, Opis_Proizvoda, Cena_Proizvoda, Kategorija_ID, Brand_ID, Skladiste_ID)
VALUES ('Pistolj Za Prskanje Voca', LOAD_FILE(''), 'sredstva za prskanje', 50.00, 3, 3, 3);

INSERT INTO Proizvod (Ime_Proizvoda, Slika_Proizvoda, Opis_Proizvoda, Cena_Proizvoda, Kategorija_ID, Brand_ID, Skladiste_ID)
VALUES ('Posuda Za Prskanje', LOAD_FILE(''), 'sredstva za prskanje', 10.00, 3, 3, 3);

/* Za kategoriju sredstva za prskanje END */

/* Za Kategorija djubrivo START */

INSERT INTO Proizvod (Ime_Proizvoda, Slika_Proizvoda, Opis_Proizvoda, Cena_Proizvoda, Kategorija_ID, Brand_ID, Skladiste_ID)
VALUES ('Prihrana za svece', LOAD_FILE(''), 'sredstva za djubrenje', 115.00, 4, 3, 4);

INSERT INTO Proizvod (Ime_Proizvoda, Slika_Proizvoda, Opis_Proizvoda, Cena_Proizvoda, Kategorija_ID, Brand_ID, Skladiste_ID)
VALUES ('Djubrivo za paradajiz', LOAD_FILE(''), 'sredstva za djubrenje', 200.00, 4, 3, 4);

INSERT INTO Proizvod (Ime_Proizvoda, Slika_Proizvoda, Opis_Proizvoda, Cena_Proizvoda, Kategorija_ID, Brand_ID, Skladiste_ID)
VALUES ('Djubrivo za papriku', LOAD_FILE(''), 'sredstva za djubrenje', 300.00, 4, 3, 4);

/* Za Kategorija djubrivo END */

/* Za kategoriju oprema START */

INSERT INTO Proizvod (Ime_Proizvoda, Slika_Proizvoda, Opis_Proizvoda, Cena_Proizvoda, Kategorija_ID, Brand_ID, Skladiste_ID)
VALUES ('Rukavice', LOAD_FILE(''), 'oprema', 150.00, 5, 3, 3);

INSERT INTO Proizvod (Ime_Proizvoda, Slika_Proizvoda, Opis_Proizvoda, Cena_Proizvoda, Kategorija_ID, Brand_ID, Skladiste_ID)
VALUES ('Zastitne naocare', LOAD_FILE(''), 'oprema', 179.00, 5, 3, 3);

INSERT INTO Proizvod (Ime_Proizvoda, Slika_Proizvoda, Opis_Proizvoda, Cena_Proizvoda, Kategorija_ID, Brand_ID, Skladiste_ID)
VALUES ('Cizme', LOAD_FILE(''), 'oprema', 192.00, 5, 3, 3);

/* Za kategoriju oprema END */


-- Create Role Table
CREATE TABLE roles (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO roles (name) VALUES ('ADMIN');
INSERT INTO roles (name) VALUES ('USER');

select * from users;
-- Create User Table
CREATE TABLE users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

INSERT INTO users (name, city, email, password)
VALUES ('Dino', 'Fethiye', 'dino.bogdanovicc@gmail.com', 'ageoforton3');

SET GLOBAL max_allowed_packet = 67108864;

SHOW VARIABLES LIKE 'max_allowed_packet';

-- Create users_roles Table (Many-to-Many relationship)
CREATE TABLE users_roles (
    USER_ID BIGINT NOT NULL,
    ROLE_ID BIGINT NOT NULL,
    PRIMARY KEY (USER_ID, ROLE_ID),
    FOREIGN KEY (USER_ID) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (ROLE_ID) REFERENCES roles(id) ON DELETE CASCADE
);

INSERT INTO users_roles (USER_ID, ROLE_ID)
VALUES (31, 1);



CREATE TABLE user_orders (
    user_id BIGINT NOT NULL,
    proizvod_id INT NOT NULL,
    PRIMARY KEY (user_id, proizvod_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (proizvod_id) REFERENCES Proizvod(Proizvod_ID) ON DELETE CASCADE
);



select * from users;
select * from Proizvod;
