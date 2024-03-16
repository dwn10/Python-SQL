-- Active: 1709243375470@@127.0.0.1@3306@it_system_gmbh

-- Tabelle Abteilung
CREATE TABLE Abteilung (
    id_Abteilung INT PRIMARY KEY AUTO_INCREMENT,
    Bezeichnung VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabelle Mitarbeiter
CREATE TABLE Mitarbeiter (
    id_Mitarbeiter INT PRIMARY KEY AUTO_INCREMENT,
    Familienname VARCHAR(255) NOT NULL,
    Vorname VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_Abteilung INT,
    FOREIGN KEY (id_Abteilung) REFERENCES Abteilung(id_Abteilung)
);

-- Tabelle Projekt
CREATE TABLE Projekt (
    id_Projekt INT PRIMARY KEY AUTO_INCREMENT,
    Bezeichnung VARCHAR(255) NOT NULL
);

-- Tabelle Vorgang
CREATE TABLE Vorgang (
    id_Vorgang INT PRIMARY KEY AUTO_INCREMENT,
    id_Projekt INT,
    id_Mitarbeiter INT,
    Bezeichnung VARCHAR(255) NOT NULL,
    Beginn DATE,
    Ende DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_Projekt) REFERENCES Projekt(id_Projekt),
    FOREIGN KEY (id_Mitarbeiter) REFERENCES Mitarbeiter(id_Mitarbeiter)
);

-- Tabelle Freelancer
CREATE TABLE Freelancer (
    id_Freelancer INT PRIMARY KEY AUTO_INCREMENT,
    Adresse VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Stundensatz FLOAT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabelle Freelancerauftrag
CREATE TABLE Freelancerauftrag (
    id_Freelancerauftrag INT PRIMARY KEY AUTO_INCREMENT,
    id_Freelancer INT,
    id_Vorgang INT,
    Beschreibung VARCHAR(255) NOT NULL,
    Arbeitsstunden FLOAT NOT NULL,
    Dokument VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_Freelancer) REFERENCES Freelancer(id_Freelancer),
    FOREIGN KEY (id_Vorgang) REFERENCES Vorgang(id_Vorgang)
);

-- Beziehungen
ALTER TABLE Mitarbeiter ADD FOREIGN KEY (id_Abteilung) REFERENCES Abteilung(id_Abteilung);

ALTER TABLE Vorgang ADD FOREIGN KEY (id_Projekt) REFERENCES Projekt(id_Projekt);

ALTER TABLE Vorgang ADD FOREIGN KEY (id_Mitarbeiter) REFERENCES Mitarbeiter(id_Mitarbeiter);

ALTER TABLE Freelancerauftrag ADD FOREIGN KEY (id_Freelancer) REFERENCES Freelancer(id_Freelancer);

ALTER TABLE Freelancerauftrag ADD FOREIGN KEY (id_Vorgang) REFERENCES Vorgang(id_Vorgang);



INSERT INTO `abteilung` (`id_Abteilung`, `Bezeichnung`, `created_at`) VALUES (NULL, 'IT', CURRENT_TIMESTAMP);
INSERT INTO `abteilung` (`id_Abteilung`, `Bezeichnung`, `created_at`) VALUES (NULL, 'Marketing', CURRENT_TIMESTAMP);
INSERT INTO `abteilung` (`id_Abteilung`, `Bezeichnung`, `created_at`) VALUES (NULL, 'HR', CURRENT_TIMESTAMP);
INSERT INTO `abteilung` (`id_Abteilung`, `Bezeichnung`, `created_at`) VALUES (NULL, 'Entwicklung', CURRENT_TIMESTAMP);

SELECT * FROM `Vorgang` WHERE 1;
SELECT * FROM `abteilung` WHERE `id_Abteilung`= 1;

SELECT * FROM `abteilung` WHERE 1;

-- Mitarbeiter 1
INSERT INTO Mitarbeiter (Familienname, Vorname, id_Abteilung)
VALUES ('Mustermann', 'Jim', 1);
SELECT * FROM `Projekt` WHERE 1;

-- Abteilung IT = 1
INSERT INTO Abteilung (Bezeichnung)
VALUES ("IT");
-- Abteilung Marketing = 2
INSERT INTO Abteilung (Bezeichnung)
VALUES ("Marketing");

-- Abteilung HR = 3
INSERT INTO Abteilung (Bezeichnung)
VALUES ("HR");

-- Abteilung Entwicklung = 4
INSERT INTO Abteilung (Bezeichnung)
VALUES ("Entwicklung");

-- Abteilung Support = 5
INSERT INTO Abteilung (Bezeichnung)
VALUES ("Support");


-- Mitarbeiter Abt = 4 
INSERT INTO Mitarbeiter (Familienname, Vorname, id_Abteilung)
VALUES ('Paz', 'Dwn', 4);

-- Projekt
INSERT INTO Projekt (Bezeichnung)
VALUES ("Mini-CRUD-App");

-- Vorgang
INSERT INTO Vorgang (
    id_Projekt,
    id_Mitarbeiter,
    Bezeichnung,
    Beginn,
    Ende
)
VALUES (
    1, 2, 'App-Test', '2024-03-06', '2024-03-08'
);

-- Freelancer
INSERT INTO Freelancer (Adresse, Email, Stundensatz)
VALUES ('Casino Str.80', 'dwn1080@ec.com', 80.10);

-- Freelancerauftrag
INSERT INTO Freelancerauftrag (id_Freelancer, id_Vorgang, Beschreibung, Arbeitsstunden, Dokument)
VALUES (1, 1, 'Development of new website features', 80.10, 'website_features_doc.pdf');