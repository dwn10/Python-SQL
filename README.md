# SQL - LT4V2 - Projekt
Verwendete Technologien:

```javascript
const Projects = {
  	code: ["HTML", "CSS", "Javascript", "SQL"],
	technologies: {
	devTool: ["VS-Code", "PHP MyAdmin", "Xampp", "DB-Diagram"]
	}
}
```


## Quellen für dieses Projekt
<ul>
	<li><a href="https://www.iso.org/standard/76583.html">ISO-Org</a></li>
	<li><a href="https://dbdiagram.io/">DB-Diagram</a></li>
	<li><a href="https://dev.mysql.com/downloads/mysql/">MySQL</a></li>
	<li><a href="https://www.apachefriends.org/index.html">XAMPP</a></li>
</ul>

## Projektbeschreibung
- (Optional) Der Kundenwunsch, der noch nicht datenbank-gerecht formuliert ist. Anhand dessen können Sie die Normalisierung demonstrieren (ähnlich Folie 28 und folgende, aber wahrscheinlich komplizierter).
- Erstellen Sie ein ER-Diagramm.
- Erstellen Sie ein Relation-Modell.
- Erstellen Sie ein physikalisches Modell (das Relationenmodell, aber mit Datentypen).
- Erstellen Sie ein SQL-Skript, das die Datenbank erzeugt.
- Erstellen Sie ein SQL-Skript, das die Datenbank mit Beispieldaten füllt.
- Erstellen Sie verschiedene SQL-Statements mit Abfragen, die Fragen zum Datenbestand beantworten
- Dokumentation, welche die User-Story beschreibt und die Besonderheiten, und in der die Diagramme zu finden sind.
- Erstellen Sie ein Applikation mit html, css und javascript, um Daten einzugeben, zu ändern, löschen und Abfragen zu tätigen

## Erstellen Sie ein Relation-Modell:

<a href="#"><img src="#" style="height: 80%; width:80%;"/></a>

## Erstellen Sie ein SQL-Skript, das die Datenbank erzeugt:
<a href="#"><img src="#" style="height: 80%; width:80%;"/></a>
```sql
-- Datenbank erstellen
CREATE DATABASE IF NOT EXISTS IT_System_GmbH;

-- Datenbank nutzen
USE IT_System_GmbH;

-- Tabelle Abteilung
CREATE TABLE Abteilung (
    id_Abteilung INT PRIMARY KEY AUTO_INCREMENT,
    Bezeichnung VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
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

-- Geben Sie Daten in die Tabelle ein
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

-- Tabellen zeigen
SELECT * FROM `abteilung` WHERE 1;
SELECT * FROM `abteilung` WHERE `id_Abteilung`= 1;
```
## Erstellen Sie ein CRUD-Applikation: 
`>> IMG + VIDEO <<`

<a href="#"><img src="#" style="height: 80%; width:80%;"/></a>

## Mini-CRUD-App | Formular zur Datenverwaltung:
Mit der Anwendung können Benutzer Datensätze in einer Tabelle erstellen, bearbeiten und löschen die Tabelle im PDF-Format generieren.
<ul>
	<li><a href="https://github.com/dwn10/Python-SQL/tree/main/Mini-CRUD">ZUM CODE</a></li>
</ul>

## Credits:

**Author:**

```bash
  Darwin Paz
```
**Unter der Leitung von:**
```bash
  Norbert Maier
```

```http
  Abgabetermin:
```

| Stadt: | Datum:     | Bis:                       |
| :-------- | :------- | :-------------------------------- |
| `Darmstadt`      | `Fr - 15.03.2024` | **16:30 Uhr**  |
