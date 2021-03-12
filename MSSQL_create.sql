
-- Table: Osoba
CREATE TABLE Osoba (
    id_osoba INT NOT NULL,
    Imie varchar(20) NOT NULL,
    Nazwisko varchar(20) NOT NULL,
    CONSTRAINT Osoba_pk PRIMARY KEY (id_osoba)
);

-- Table: Pracownik
CREATE TABLE Pracownik (
    id_pracownik INT NOT NULL,
    stanowisko varchar(20) NOT NULL,
    pensja INT NOT NULL,
    data_zatrudnienia DATETIME NOT NULL,
    CONSTRAINT Pracownik_pk PRIMARY KEY (id_pracownik)
);

-- Table: Typ
CREATE TABLE Typ (
    id_typ int NOT NULL,
    nazwa varchar(20) NOT NULL,
    CONSTRAINT Typ_pk PRIMARY KEY (id_typ)
);

-- Table: Wyrob
CREATE TABLE Wyrob (
    id_wyrob INT NOT NULL,
    nazwa varchar(10) NOT NULL,
    cena INT NOT NULL,
    id_typ INT NOT NULL,
    CONSTRAINT Wyrob_pk PRIMARY KEY (id_wyrob)
);

-- Table: Zamowienie
CREATE TABLE Zamowienie (
    id_zamowienie INT NOT NULL,
    data_zamownienia DATETIME NOT NULL,
    id_osoba INT NOT NULL,
    id_pracownik INT NOT NULL,
    CONSTRAINT Zamowienie_pk PRIMARY KEY (id_zamowienie)
);

-- Table: ZamowienieWyrob
CREATE TABLE ZamowienieWyrob (
    id_zamowienie INT NOT NULL,
    id_wyrob INT NOT NULL,
    ilosc_wyrobu INT NOT NULL,
    CONSTRAINT ZamowienieWyrob_pk PRIMARY KEY (id_zamowienie,id_wyrob)
);

-- End of file.

