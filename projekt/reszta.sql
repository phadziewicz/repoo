#trigger1
delimiter |
create trigger wyzwalacz1 
before insert on zlecenie 
for each row BEGIN

set NEW.Data_przyjecia = 2020-10-10;

end|
#trigger2
delimiter |
create trigger wyzwalacz2 
before update on zlecenie 
for each row BEGIN

set new.Cena = 2*old.Cena;

end|
#procedura
delimiter |
create procedure lepsza_cena(v_Cena int)
begin
declare Rabat int;
set Rabat = Cena*0.7;
update zlecenie
set Cena = Rabat;
end|