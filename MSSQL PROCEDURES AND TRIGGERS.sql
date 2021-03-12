--Wypisanie liczby zlozonych zamowien dla klienta o podanym nazwisku
ALTER PROCEDURE liczbaZamowien
@nazwisko VARCHAR(20)
AS BEGIN
DECLARE @liczbaZamowien INT
SELECT @liczbaZamowien = COUNT(*) FROM Zamowienie WHERE id_osoba = (SELECT id_osoba FROM osoba WHERE nazwisko = @nazwisko)
PRINT  ' Liczba zamowien osoby o nazwisku : ' + @nazwisko  + ' wynosi ' + CONVERT(VARCHAR, @liczbaZamowien)
END
GO

--Wypisanie wszystkich wyrobów i ich ceny dla zadanego typu
ALTER PROCEDURE wyboryTypu
@typ VARCHAR(20)
AS BEGIN
SELECT nazwa, cena FROM Wyrob WHERE (SELECT id_typ FROM typ WHERE @typ = nazwa) = id_typ
END
GO

-- Wyzwalacz niepozwalajacy wykonaæ operacji DELETE, jeœli usuwany jest jakiœ wyrob, który zosta³ zamowiony
CREATE TRIGGER wyrobZamowiony
ON Wyrob
FOR DELETE 
AS
IF (SELECT id_wyrob FROM deleted) IN (SELECT id_wyrob FROM ZamowienieWyrob)
ROLLBACK
GO

-- Wyzwalacz niepozwalajacy na wpisanie nowego wyrobu o nazwie juz isteniejacej. Blokuje tylko nieprawid³owe wiersze. 
CREATE TRIGGER wyrobIstnieje
ON Wyrob
FOR INSERT
AS
DECLARE @id INTEGER
DECLARE kursor CURSOR FOR SELECT id_wyrob FROM inserted i WHERE EXISTS (SELECT nazwa FROM Wyrob WHERE nazwa = i.nazwa  AND id_wyrob != i.id_wyrob)
OPEN kursor
FETCH NEXT FROM kursor INTO @id
WHILE @@FETCH_STATUS = 0
BEGIN
	DELETE FROM Wyrob WHERE id_wyrob = @id
	FETCH NEXT FROM kursor INTO @id
END
CLOSE kursor
DEALLOCATE kursor
GO
