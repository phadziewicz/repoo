create database serwiskomputerowy;
use serwiskomputerowy;
CREATE TABLE pracownik
(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Imie VARCHAR(30)NOT NULL,
    Nazwisko VARCHAR(50)NOT NULL,
    Nr_telefon VARCHAR(9)NOT NULL,
    Adres VARCHAR(50)NOT NULL,
    Miasto VARCHAR(20)NOT NULL
);

CREATE TABLE sprzet
(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nazwa VARCHAR(30)NOT NULL
);

CREATE TABLE odbior
(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Czy_odebrano BOOL NOT NULL
);

CREATE TABLE klient
(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Imie VARCHAR(30)NOT NULL,
    Nazwisko VARCHAR(50)NOT NULL,
    Nr_telefon VARCHAR(9)NOT NULL,
    Adres VARCHAR(50)NOT NULL,
    Miasto VARCHAR(20)NOT NULL,
    Sprzet INT NOT NULL,
    FOREIGN KEY (Sprzet)REFERENCES Sprzet(Id)ON DELETE CASCADE
);

CREATE TABLE zlecenie
(
    Id_zlecenie INT AUTO_INCREMENT PRIMARY KEY,
    KlientId INT NOT NULL,
    PracownikId INT NOT NULL,
    Data_przyjecia DATE NOT NULL,
    Czynnosc VARCHAR(20)NOT NULL,
    Data_odbioru DATE NOT NULL,
    OdbiorId INT NOT NULL,
    Cena INT NOT NULL,
    FOREIGN KEY (OdbiorId)REFERENCES Odbior(Id)ON DELETE CASCADE,
    FOREIGN KEY (KlientId)REFERENCES Klient(Id)ON DELETE CASCADE,
	FOREIGN KEY (PracownikId)REFERENCES Pracownik(Id)ON DELETE CASCADE
);

INSERT INTO pracownik (Imie,Nazwisko,Nr_telefon,Adres,Miasto)
VALUES 
('Jacek', 'Cyk', '123456789', 'Krótka 5', 'Ełk'),
('Paweł', 'Pyk', '987654321', 'Długa 3', 'Warszawa'),
('Adam', 'Makłowiecki', '987123654', 'Ładna7', 'Olsztyn'),
('Kacper', 'Kondrat', '990876222', 'Brzydka 9', 'Kraków'),
('Piotr', 'Konieczny', '666479421', 'Bohaterska 1', 'Radom'),
('Hubert', 'Zawodowiec', '997998999', 'Miła 21', 'Ostróda'),
('Leon', 'Zawodowiec', '111765908', 'Cicha 13', 'Ostróda'),
('Bartek', 'Mały', '543889662', 'Fajna 75', 'Gniezno'),
('Szymon', 'Nygol', '145098267', 'Bema8', 'Malbork'),
('Dawid', 'Pacek', '774860152', 'Bema 10', 'Wrocław');

INSERT INTO sprzet (Nazwa)
VALUES 
('laptop'),
('komputer'),
('monitor'),
('drukarka');

INSERT INTO odbior (Czy_odebrano)
VALUES 
(false),
(true);

INSERT INTO klient (Imie,Nazwisko,Nr_telefon,Adres,Miasto,Sprzet)
VALUES 
('Jacek', 'Jakotaki', '623456789', 'Krótka 15', 'Ełk', '1'),
('Paweł', 'Ryk', '387654321', 'Długa 13', 'Warszawa', '2'),
('Adam', 'Makowiecki', '187123654', 'Ładna 17', 'Olsztyn', '3'),
('Kacper', 'Miłoszewski', '290876222', 'Brzydka 19', 'Kraków', '4'),
('Piotr', 'Niekonieczny', '966479421', 'Bohaterska 11', 'Radom', '3'),
('Hubert', 'Amatorski', '697998999', 'Miła 1', 'Ostróda', '4'),
('Leon', 'Amatorski', '411765908', 'Cicha 3', 'Ostróda', '1'),
('Bartek', 'Duży', '343889662', 'Fajna 5', 'Gniezno', '2'),
('Szymon', 'Nogelik', '845098267', 'Bema 18', 'Malbork', '2'),
('Dawid', 'Placek', '274860152', 'Bema 6', 'Wrocław', '3');

INSERT INTO zlecenie (KlientId,PracownikId,Data_przyjecia,Czynnosc,Data_odbioru,OdbiorId,Cena)
VALUES 
(5, 1, '2020-10-12', 'usuwanie wirusów', '2020-10-19', 1, 200),
(3, 7, '2020-10-13', 'instalacja aplikacji', '2020-10-20', 2, 250),
(7, 2, '2020-10-14', 'wymiana matrycy', '2020-10-21', 2, 150),
(1, 10, '2020-10-15', 'czyszczenie głowic', '2020-10-22', 2, 100),
(9, 3, '2020-10-16', 'wymiana matrycy', '2020-10-23', 1, 150),
(2, 5, '2020-10-17', 'czyszczenie głowic', '2020-10-24', 2, 100),
(4, 4, '2020-10-18', 'usuwanie wirusów', '2020-10-25', 2, 200),
(10, 6, '2020-10-19', 'instalacja aplikacji', '2020-10-26', 2, 250),
(8, 9, '2020-10-20', 'instalacja aplikacji', '2020-10-27', 2, 250),
(6, 8, '2020-10-21', 'wymiana matrycy', '2020-10-28', 2, 150);