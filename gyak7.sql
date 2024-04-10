/*1. Készítsünk nézetet VSZOBA néven, amely megjeleníti a szobák adatai mellett a megfelelő szálláshely nevét, helyét és a csillagok számát is!

Az oszlopoknak nem szükséges külön nevet adni!
Teszteljük is a nézetet, pl: SELECT * FROM UJAENB_VSZOBA*/


/*2 Készítsen tárolt eljárást SPUgyfelFoglalasok, amely a paraméterként megkapott ügyfél azonosítóhoz tartozó foglalások adatait listázza!
Teszteljük a tárolt eljárás működését, pl: EXEC UJAENB_SPUgyfelFoglalasok 'laszlo2'
*/
create or ALTER proc SPUgyfelfoglalasok
-- paraméterek
@ugyfel nvarchar(100)
as 
BEGIN
	SELECT *
    from Foglalas
    WHERE ugyfel_fk = @ugyfel
END
/*
3. Készítsen skalár értékű függvényt UDFFerohely néven, amely visszaadja, hogy a paraméterként megkapott foglalás azonosítóhoz hány férőhelyes szoba tartozik!
a. Teszteljük a függvény működését!
*/
create or alter FUNCTION UDFFerohely
(
	@fid int
)
RETURNS int
AS
BEGIN
	DECLARE @ferohely int
	SELECT @ferohely=sz.FEROHELY
    FROM foglalas f join szoba sz on f.SZOBA_FK = sz.SZOBA_ID
    return @ferohely
END