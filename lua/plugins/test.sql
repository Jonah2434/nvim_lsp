-- example.sql
-- Datenbank erstellen
CREATE DATABASE IF NOT EXISTS beispiel_db;

USE beispiel_db;

-- Tabelle erstellen
CREATE TABLE IF NOT EXISTS kunden (
  id INT AUTO_INCREMENT PRIMARY KEY,
  vorname VARCHAR(50),
  nachname VARCHAR(50),
  email VARCHAR(100)
);

-- Daten einfügen
INSERT INTO
  kunden (vorname, nachname, email)
VALUES
  ('Max', 'Mustermann', 'max@example.com'),
  ('Erika', 'Musterfrau', 'erika@example.com'),
  ('John', 'Doe', 'john.doe@example.com');
