select *,
iif(month(mettol) >= 6 and month(mettol <= 8, 'igen'. 'nem') as 'nyári-e
from foglalas
where ugyfel_fk = 'laszlo2' and gyermek_szam = 0



 SELECT szh.TIPUS, YEAR(f.METTOL) AS 'Év', MONTH(f.METTOL) AS 'Hónap', count(*)
 FROM Foglalas f JOIN Szoba sz ON f.SZOBA_FK = sz.SZOBA_ID 
                JOIN Szallashely szh on sz.szallas_fk = szh.szallas_id
WHERE datediff(day, f.mettol, f.meddig) >=5 
 GROUP BY szh.TIPUS, year(f.mettol), month(f.mettol)
