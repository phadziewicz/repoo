#zapytanie1: klienci, którzy nie odebrali sprzętu
create view zapytanie1 as select klient.*, zlecenie.Cena from klient inner join zlecenie on klient.Id = zlecenie.KlientId where (zlecenie.OdbiorId = 1);
#zapytanie2: wybrani pracownicy i ich zlecenia
create view zapytanie2 as select pracownik.*, zlecenie.* from pracownik right join zlecenie on pracownik.Id = zlecenie.PracownikId where (zlecenie.PracownikId in (3,6,7));
#zapytanie3: suma cen zleceń z przedziału
create view zapytanie3 as select SUM(Cena) as Suma_cen_zlecen from zlecenie where (day(Data_przyjecia)>13) and (day(Data_przyjecia)<20);
#zapytanie4: średnia cen wszystkich zleceń
create view zapytanie4 as select avg(Cena) as Srednia_cen_zlecen from zlecenie;
#zapytanie5: pracownik z ceną za zlecenie = 100
create view zapytanie5 as select * from pracownik where Id = (select PracownikId from zlecenie where (Cena = 100) and (PracownikId > 5));
#zapytanie6: klienci z danym sprzętem
create view zapytanie6 as select klient.*,sprzet.Nazwa from klient left join sprzet on klient.Sprzet = sprzet.Id where klient.Sprzet = 2;
#zapytanie7: pierwsze przyjęte zlecenie
create view zapytanie7 as select * from zlecenie where Data_przyjecia = (select min(Data_przyjecia) from zlecenie);
#zapytanie8: ostatnie przyjęte zlecenie
create view zapytanie8 as select * from zlecenie where Data_przyjecia = (select max(Data_przyjecia) from zlecenie);
#zapytanie9: rabat dla klientów
create view zapytanie9 as select *, Cena*0.9 as Cena_z_rabatem from zlecenie;
#zapytanie10: miasta, w których mieszka więcej niż jeden klient
create view zapytanie10 as select Miasto from klient group by Miasto having count(Miasto)>1;