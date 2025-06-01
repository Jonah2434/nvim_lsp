# SQL Befehls-Referenz

## Datenabfrage (SELECT)

| Befehl | Syntax | Beschreibung | Beispiel |
|--------|--------|--------------|----------|
| SELECT | `SELECT spalte1, spalte2 FROM tabelle` | Daten aus Tabelle abfragen | `SELECT name, alter FROM kunden` |
| SELECT * | `SELECT * FROM tabelle` | Alle Spalten auswählen | `SELECT * FROM produkte` |
| WHERE | `SELECT * FROM tabelle WHERE bedingung` | Daten mit Bedingung filtern | `SELECT * FROM kunden WHERE alter > 18` |
| ORDER BY | `SELECT * FROM tabelle ORDER BY spalte ASC/DESC` | Ergebnisse sortieren | `SELECT * FROM kunden ORDER BY name ASC` |
| GROUP BY | `SELECT spalte, COUNT(*) FROM tabelle GROUP BY spalte` | Daten gruppieren | `SELECT stadt, COUNT(*) FROM kunden GROUP BY stadt` |
| HAVING | `SELECT spalte, COUNT(*) FROM tabelle GROUP BY spalte HAVING COUNT(*) > 1` | Gruppierte Daten filtern | `SELECT stadt, COUNT(*) FROM kunden GROUP BY stadt HAVING COUNT(*) > 5` |
| LIMIT | `SELECT * FROM tabelle LIMIT anzahl` | Anzahl Ergebnisse begrenzen | `SELECT * FROM kunden LIMIT 10` |
| DISTINCT | `SELECT DISTINCT spalte FROM tabelle` | Doppelte Werte entfernen | `SELECT DISTINCT stadt FROM kunden` |

## Datenmanipulation (DML)

| Befehl | Syntax | Beschreibung | Beispiel |
|--------|--------|--------------|----------|
| INSERT | `INSERT INTO tabelle (spalte1, spalte2) VALUES (wert1, wert2)` | Neue Daten einfügen | `INSERT INTO kunden (name, alter) VALUES ('Max', 25)` |
| UPDATE | `UPDATE tabelle SET spalte = wert WHERE bedingung` | Daten aktualisieren | `UPDATE kunden SET alter = 26 WHERE name = 'Max'` |
| DELETE | `DELETE FROM tabelle WHERE bedingung` | Daten löschen | `DELETE FROM kunden WHERE alter < 18` |

## Tabellendefinition (DDL)

| Befehl | Syntax | Beschreibung | Beispiel |
|--------|--------|--------------|----------|
| CREATE TABLE | `CREATE TABLE tabelle (spalte1 datentyp, spalte2 datentyp)` | Neue Tabelle erstellen | `CREATE TABLE kunden (id INT PRIMARY KEY, name VARCHAR(50))` |
| ALTER TABLE | `ALTER TABLE tabelle ADD COLUMN spalte datentyp` | Tabelle ändern | `ALTER TABLE kunden ADD COLUMN email VARCHAR(100)` |
| DROP TABLE | `DROP TABLE tabelle` | Tabelle löschen | `DROP TABLE alte_tabelle` |
| TRUNCATE | `TRUNCATE TABLE tabelle` | Alle Daten löschen (Struktur bleibt) | `TRUNCATE TABLE temp_daten` |

## JOINs (Verknüpfungen)

| Befehl | Syntax | Beschreibung | Beispiel |
|--------|--------|--------------|----------|
| INNER JOIN | `SELECT * FROM tabelle1 INNER JOIN tabelle2 ON bedingung` | Nur übereinstimmende Datensätze | `SELECT * FROM kunden INNER JOIN bestellungen ON kunden.id = bestellungen.kunde_id` |
| LEFT JOIN | `SELECT * FROM tabelle1 LEFT JOIN tabelle2 ON bedingung` | Alle Datensätze aus linker Tabelle | `SELECT * FROM kunden LEFT JOIN bestellungen ON kunden.id = bestellungen.kunde_id` |
| RIGHT JOIN | `SELECT * FROM tabelle1 RIGHT JOIN tabelle2 ON bedingung` | Alle Datensätze aus rechter Tabelle | `SELECT * FROM kunden RIGHT JOIN bestellungen ON kunden.id = bestellungen.kunde_id` |
| FULL JOIN | `SELECT * FROM tabelle1 FULL JOIN tabelle2 ON bedingung` | Alle Datensätze aus beiden Tabellen | `SELECT * FROM kunden FULL JOIN bestellungen ON kunden.id = bestellungen.kunde_id` |

## Aggregatfunktionen

| Funktion | Syntax | Beschreibung | Beispiel |
|----------|--------|--------------|----------|
| COUNT | `SELECT COUNT(*) FROM tabelle` | Anzahl Datensätze zählen | `SELECT COUNT(*) FROM kunden` |
| SUM | `SELECT SUM(spalte) FROM tabelle` | Summe berechnen | `SELECT SUM(preis) FROM bestellungen` |
| AVG | `SELECT AVG(spalte) FROM tabelle` | Durchschnitt berechnen | `SELECT AVG(alter) FROM kunden` |
| MIN | `SELECT MIN(spalte) FROM tabelle` | Minimalwert finden | `SELECT MIN(preis) FROM produkte` |
| MAX | `SELECT MAX(spalte) FROM tabelle` | Maximalwert finden | `SELECT MAX(preis) FROM produkte` |

## Bedingte Operatoren

| Operator | Syntax | Beschreibung | Beispiel |
|----------|--------|--------------|----------|
| = | `WHERE spalte = wert` | Gleich | `WHERE alter = 25` |
| != oder <> | `WHERE spalte != wert` | Ungleich | `WHERE stadt != 'Berlin'` |
| > | `WHERE spalte > wert` | Größer als | `WHERE preis > 100` |
| < | `WHERE spalte < wert` | Kleiner als | `WHERE alter < 30` |
| >= | `WHERE spalte >= wert` | Größer oder gleich | `WHERE datum >= '2024-01-01'` |
| <= | `WHERE spalte <= wert` | Kleiner oder gleich | `WHERE bewertung <= 5` |
| LIKE | `WHERE spalte LIKE muster` | Textmuster suchen | `WHERE name LIKE 'M%'` |
| IN | `WHERE spalte IN (wert1, wert2)` | Wert in Liste | `WHERE stadt IN ('Berlin', 'Hamburg')` |
| BETWEEN | `WHERE spalte BETWEEN wert1 AND wert2` | Wert zwischen Grenzen | `WHERE alter BETWEEN 18 AND 65` |
| IS NULL | `WHERE spalte IS NULL` | Null-Werte prüfen | `WHERE email IS NULL` |
| IS NOT NULL | `WHERE spalte IS NOT NULL` | Nicht-Null-Werte prüfen | `WHERE telefon IS NOT NULL` |

## Logische Operatoren

| Operator | Syntax | Beschreibung | Beispiel |
|----------|--------|--------------|----------|
| AND | `WHERE bedingung1 AND bedingung2` | Beide Bedingungen müssen erfüllt sein | `WHERE alter > 18 AND stadt = 'Berlin'` |
| OR | `WHERE bedingung1 OR bedingung2` | Eine der Bedingungen muss erfüllt sein | `WHERE stadt = 'Berlin' OR stadt = 'Hamburg'` |
| NOT | `WHERE NOT bedingung` | Bedingung darf nicht erfüllt sein | `WHERE NOT stadt = 'Berlin'` |

## Unterabfragen (Subqueries)

| Typ | Syntax | Beschreibung | Beispiel |
|-----|--------|--------------|----------|
| Einfache Unterabfrage | `SELECT * FROM tabelle WHERE spalte = (SELECT ...)` | Einzelwert-Unterabfrage | `SELECT * FROM kunden WHERE id = (SELECT kunde_id FROM bestellungen WHERE id = 1)` |
| EXISTS | `SELECT * FROM tabelle WHERE EXISTS (SELECT ...)` | Prüft Existenz von Datensätzen | `SELECT * FROM kunden WHERE EXISTS (SELECT 1 FROM bestellungen WHERE kunde_id = kunden.id)` |
| IN Unterabfrage | `SELECT * FROM tabelle WHERE spalte IN (SELECT ...)` | Mehrwert-Unterabfrage | `SELECT * FROM kunden WHERE id IN (SELECT kunde_id FROM bestellungen)` |

## Datentypen (häufig verwendete)

| Datentyp | Beschreibung | Beispiel |
|----------|--------------|----------|
| INT | Ganze Zahlen | `ALTER = INT` |
| VARCHAR(n) | Variable Zeichenkette (max. n Zeichen) | `NAME VARCHAR(50)` |
| TEXT | Lange Zeichenkette | `BESCHREIBUNG TEXT` |
| DATE | Datum | `GEBURTSDATUM DATE` |
| DATETIME | Datum und Zeit | `ERSTELLT_AM DATETIME` |
| DECIMAL(p,s) | Dezimalzahl (p Stellen, s Nachkommastellen) | `PREIS DECIMAL(10,2)` |
| BOOLEAN | Wahrheitswert | `AKTIV BOOLEAN` |

## Constraints (Einschränkungen)

| Constraint | Syntax | Beschreibung | Beispiel |
|------------|--------|--------------|----------|
| PRIMARY KEY | `spalte INT PRIMARY KEY` | Primärschlüssel | `id INT PRIMARY KEY` |
| FOREIGN KEY | `FOREIGN KEY (spalte) REFERENCES tabelle(spalte)` | Fremdschlüssel | `FOREIGN KEY (kunde_id) REFERENCES kunden(id)` |
| NOT NULL | `spalte datentyp NOT NULL` | Wert darf nicht leer sein | `name VARCHAR(50) NOT NULL` |
| UNIQUE | `spalte datentyp UNIQUE` | Wert muss eindeutig sein | `email VARCHAR(100) UNIQUE` |
| CHECK | `spalte datentyp CHECK (bedingung)` | Wert muss Bedingung erfüllen | `alter INT CHECK (alter >= 0)` |
| DEFAULT | `spalte datentyp DEFAULT wert` | Standardwert setzen | `status VARCHAR(20) DEFAULT 'aktiv'` |

## Index-Verwaltung

| Befehl | Syntax | Beschreibung | Beispiel |
|--------|--------|--------------|----------|
| CREATE INDEX | `CREATE INDEX indexname ON tabelle (spalte)` | Index erstellen | `CREATE INDEX idx_name ON kunden (name)` |
| DROP INDEX | `DROP INDEX indexname` | Index löschen | `DROP INDEX idx_name` |

## Transaktionen

| Befehl | Syntax | Beschreibung | Beispiel |
|--------|--------|--------------|----------|
| BEGIN | `BEGIN` | Transaktion starten | `BEGIN;` |
| COMMIT | `COMMIT` | Änderungen bestätigen | `COMMIT;` |
| ROLLBACK | `ROLLBACK` | Änderungen rückgängig machen | `ROLLBACK;` |

## Häufige String-Funktionen

| Funktion | Syntax | Beschreibung | Beispiel |
|----------|--------|--------------|----------|
| UPPER | `SELECT UPPER(spalte) FROM tabelle` | In Großbuchstaben umwandeln | `SELECT UPPER(name) FROM kunden` |
| LOWER | `SELECT LOWER(spalte) FROM tabelle` | In Kleinbuchstaben umwandeln | `SELECT LOWER(name) FROM kunden` |
| LENGTH | `SELECT LENGTH(spalte) FROM tabelle` | Länge des Strings | `SELECT LENGTH(name) FROM kunden` |
| CONCAT | `SELECT CONCAT(spalte1, spalte2) FROM tabelle` | Strings verbinden | `SELECT CONCAT(vorname, ' ', nachname) FROM kunden` |
| SUBSTRING | `SELECT SUBSTRING(spalte, start, länge) FROM tabelle` | Teil eines Strings extrahieren | `SELECT SUBSTRING(name, 1, 3) FROM kunden` |

## Datum/Zeit-Funktionen

| Funktion | Syntax                             | Beschreibung             | Beispiel                                       |
|----------|------------------------------------|--------------------------|------------------------------------------------|
| NOW      | `SELECT NOW()`                     | Aktuelles Datum und Zeit | `SELECT NOW()`                                       |
| CURDATE  | `SELECT CURDATE()`                 | Aktuelles Datum          | `SELECT CURDATE()`                                   |
| CURTIME  | `SELECT CURTIME()`                 | Aktuelle Zeit            | `SELECT CURTIME()`                                   |
| YEAR     | `SELECT YEAR(datum) FROM tabelle`  | Jahr extrahieren         | `SELECT YEAR(geburtsdatum) FROM kunden`              |
| MONTH    | `SELECT MONTH(datum) FROM tabelle` | Monat extrahieren        | `SELECT MONTH(bestelldatum) FROM bestellungen` |
| DAY      | `SELECT DAY(datum) FROM tabelle`   | Tag extrahieren          | `SELECT DAY(datum) FROM ereignisse`            |
