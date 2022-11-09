CREATE TABLE Autos ( 
    ID_Registro bigint NOT NULL AUTO_INCREMENT,
    Punto varchar(50),
    Patente varchar(25),
    Marca   varchar(25),
    Modelo  varchar(25),
    Fecha   date,
    dia     integer,
    Hora    time,
    Franja  varchar(50),
    Tipo_auto varchar(20),
    Año_Auto    integer,
    Largo       integer,
    Clasificacion varchar(32),
    primary key(ID_Registro)
    
);

ALTER TABLE Autos ADD Dia integer;

CREATE TABLE Calculador (
    id_patente bigint NOT NULL AUTO_INCREMENT,
    Patente     varchar(25),
    Pasante     int,
    ViveL       int,
    ViveR       int,
    Visita      int,
    Unico       int,
    Seteo       int,
    Clasificacion varchar(32),

    primary key(id_patente)

);


call CargarDia("2022-11-07");
call franja("2022-11-07");
call tipo_auto("2022-11-07");
call año_auto("2022-11-07");



DELIMITER // 
CREATE PROCEDURE CargarDia(in f varchar(20))
BEGIN

declare fecha2 date;
declare Numero int;
SELECT fecha into fecha2 from autos where fecha = f limit 1;
Select fecha2 as Esta_Es_La_Fecha;
SELECT DAYOFWEEK(fecha2) into Numero;
update autos set dia = Numero where fecha =f;

END
//
DELIMITER ;


-- PROCEDURA PARA CREAR FRANJA HORARIA
DELIMITER // 
CREATE PROCEDURE Franja(in f varchar(20))
BEGIN
    update autos set franja = "Mañana" where (hora between "05:00"  and "11:00") and    fecha = f ;
    update autos set franja = "MedioDia" where (hora between "11:00:01"  and "15:00") and   fecha = f ;
    update autos set franja = "Tarde" where (hora between "15:00:01"  and "20:00")  and     fecha = f     ;
    update autos set franja = "Noche" where (hora between "20:00:01"  and "23:59") and      fecha = f ;
    update autos set franja = "Noche" where (hora between "00:00:01"  and "04:59:59") and   fecha = f  ;

END
//
DELIMITER ;

-- Proedimiento para el viejo/nuevo

DELIMITER // 
CREATE PROCEDURE Tipo_auto(in f varchar(20))
BEGIN




    update autos set Tipo_auto = "Viejo" where Largo = 6 and fecha =f ;
    update autos set Tipo_auto = "Nuevo" where Largo = 7 and fecha =f;
    update autos set Tipo_auto = "Viejo" where Largo = 7 and patente like 'aa%' and fecha =f ;
    update autos set Tipo_auto = "Viejo" where Largo = 7 and patente like 'ab%' and fecha =f ;
    delete from autos where largo>7;
    delete from autos where largo<6;


END
//
DELIMITER ;


-- Sacar años de autos
DELIMITER // 
CREATE PROCEDURE año_auto(in f varchar(25))
BEGIN
   
    update autos set Año_Auto = 2016  where Largo = 7  and patente like 'AA%' and fecha =f     ;
    update autos set Año_Auto = 2016  where Largo = 7  and patente like 'AA0%'  and fecha =f;
    update autos set Año_Auto = 2017  where Largo = 7  and patente like 'AA9%' and fecha =f;
    update autos set Año_Auto = 2017  where Largo = 7  and patente like 'AB%' and fecha =f;
    update autos set Año_Auto = 2017  where Largo = 7  and patente like 'AC%' and fecha =f;
    update autos set Año_Auto = 2017  where Largo = 7  and patente like 'AC0%' and fecha =f;
    update autos set Año_Auto = 2018  where Largo = 7  and patente like 'AC2%' and fecha =f;
    update autos set Año_Auto = 2018  where Largo = 7  and patente like 'AD%' and fecha =f;
    update autos set Año_Auto = 2019  where Largo = 7  and patente like 'AD4%' and fecha =f;
    update autos set Año_Auto = 2020  where Largo = 7  and patente like 'AE%' and fecha =f;
    update autos set Año_Auto = 2019  where Largo = 7  and patente like 'AE0%' and fecha =f;
    update autos set Año_Auto = 2021  where Largo = 7  and patente like 'AE6%' and fecha =f;
    update autos set Año_Auto = 2021  where Largo = 7  and patente like 'AF%' and fecha =f;
    update autos set Año_Auto = 2022  where Largo = 7  and patente like 'AG%' and fecha =f;


    
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'P%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'PM%' and fecha =f;

    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'O%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'N%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'M%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'K%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'l%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'J%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'I%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'H%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'G%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'F%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'E%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'D%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'C%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'B%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'DX%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'DO%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'DC%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'CM%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'BU%' and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'BD%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'AFN%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'AH%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'AN%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'AB%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'AD%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'AP%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'AV%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'AC%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'AG%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'AAA%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'AX%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'AJ%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'AAL%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'Q%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6  and patente like 'afx%'  and fecha =f;


    update autos set Año_Auto = 2000 where Largo = 6 and patente like 'X%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6 and patente like 'U%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6 and patente like 'W%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6 and patente like 'S%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6 and patente like 'T%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6 and patente like 'R%'  and fecha =f;
    update autos set Año_Auto = 2000 where Largo = 6 and patente like 'V%'  and fecha =f;

    DELETE FROM AUTOS WHERE Patente LIKE 'VVC%';
    DELETE from autos where (patente like 'au%') and largo =7;
    delete from autos where año_auto is null;
END
//
DELIMITER ;



--- CLASIFICACION DE VIVE


delimiter //
create procedure Vive(in f varchar(20))
begin


declare p varchar(30);
declare paten varchar(20);
declare Seto int;
declare ID_alto bigint;
declare ID_bajo bigint;
declare HoraSal time;
declare HoraEntrada time;
declare HoraResultado time;
declare prox varchar(30);

declare verificarPatente varchar(30);

select id_registro into ID_alto from autos where fecha = f order by id_registro desc limit 1;
select id_registro into ID_bajo from autos where fecha = f order by id_registro asc limit 1;

update Calculador set Seteo = 0;
select ID_alto;
select id_bajo;


set seto = 0;


 while ID_bajo  < ID_alto do

    set verificarPatente =null;

    select  punto into p from autos where id_registro =ID_alto;

    select patente into paten from autos where id_registro = ID_alto;
    select patente into verificarPatente from Calculador where patente = paten;

    select ID_alto;
    select verificarPatente;

    if verificarPatente is null then

        INSERT INTO Calculador (patente, pasante, ViveL,ViveR, visita, Unico, Seteo) VALUES (paten,0,0,0,0,0,0);
        select 'entre cuando no existe patente';

    end if;

    select Seteo into seto from Calculador where patente = paten;
    select hora into HoraSal from autos where id_registro=ID_alto;

    if seto  = 0 and p= "Circunvalacion Salida"  then

            update Calculador set Seteo = 1 where patente = paten;
            select punto into prox from autos where patente = paten and hora > HoraSal and fecha  = f order by hora asc limit 1;
        
            
            if prox = "Circunvalacion Entrada" or prox = "Molino Entrada" then

                select hora into HoraEntrada from autos where patente = paten and hora > HoraSal and fecha  = f order by hora asc limit 1;              

                select hora into HoraEntrada from autos where patente = paten and hora > HoraSal and fecha  = f order by hora asc limit 1;
                
                select TIMEDIFF(HoraEntrada, Horasal) INTO HoraResultado;

                if HoraResultado <"02:20:00" then

                    update Calculador set ViveR = ViveR +1 where patente =paten;
                
                else

                    update Calculador set ViveL = ViveL +1 where patente =paten;

                end if;

            end if;
                
    else
        
        if seto =  0 and p= "Molino Salida"  then

            update Calculador set Seteo = 1 where patente = paten;
            select punto into prox from autos where patente = paten and hora > HoraSal and fecha  = f order by hora asc limit 1;

        if prox = "Circunvalacion Entrada" or prox = "Molino Entrada" then

                select hora into HoraEntrada from autos where patente = paten and hora > HoraSal and fecha  = f order by hora asc limit 1;

                select hora into HoraEntrada from autos where patente = paten and hora > HoraSal and fecha  = f order by hora asc limit 1;
                
                select TIMEDIFF(HoraEntrada, Horasal) INTO HoraResultado;
                

                if HoraResultado <"01:00:00" then

                    update Calculador set ViveR = ViveR +1 where patente =paten;
                
                else

                    update Calculador set ViveL = ViveL +1 where patente =paten;

                end if;
            end if;
            

        end if;

    end if;

    set ID_alto = ID_alto - 1 ;
    update Calculador set Seteo = 1 where patente = paten;
    set prox =null;
    set p =null;
    set Horasal =null;
    set HoraEntrada =null;

 end while;

end;
//
delimiter ;


--------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------
if miVar = 12 then
         select 'verdadero' ;
 else
         select 'falso' ;
 end if;



-- Pasante sale x el otro
-- Visista puede salir por cualquiera
--Visitas de noches :) tener en cuenta para otro dia 
-- ViveR en 2 horas. 
--

---------------------------------------------------------------------------------------------

DELIMITER // 
CREATE PROCEDURE visit(in f varchar(20))
BEGIN

declare v int;
declare p varchar(30);
declare paten varchar(20);
declare Seto int;
declare ID_alto bigint;
declare ID_bajo bigint;
declare HoraEntrada time;
declare HoraSal time;
declare HoraResultado time;
declare prox varchar(30);
declare verificarPatente varchar(30);

select id_registro into ID_alto from autos where fecha = f order by id_registro desc limit 1;
select id_registro into ID_bajo from autos where fecha = f order by id_registro asc limit 1;

update Calculador set Seteo = 0;
select f;
set seto = 0;
set v = 2;

 while  id_bajo < ID_alto do

    set    prox =null;
    set  verificarPatente =null;
    select punto into p from autos where id_registro =ID_alto; 
    select patente into paten from autos where id_registro = ID_alto;
    select Seteo into seto from Calculador where patente = paten;
    select hora into HoraEntrada from autos where id_registro=ID_alto;
    select hora into HoraSal from autos where patente = paten and hora > HoraEntrada and fecha  = f order by hora asc limit 1;
    select patente into verificarPatente from Calculador where patente = paten;



    if verificarPatente is null then

        INSERT INTO Calculador (patente, pasante, ViveL,ViveR, visita,Unico, Seteo) VALUES (paten,0,0,0,0,0,0);
        select 'entre cuando no existe patente';

    end if;

    select p;
    select ID_alto;
    select HoraEntrada;
    select paten;


    if seto  = 0 and p= "Circunvalacion Entrada" then

        update Calculador set Seteo = 1 where patente = paten;
        select punto into prox from autos where patente = paten and hora > HoraEntrada and fecha = f order by hora asc limit 1;
        select patente as patenteSalidaaaaaaaaaaaaa from autos where patente = paten and hora > HoraEntrada and fecha = f order by hora asc limit 1;

        select prox as proximo_punto;
        select P AS PUNTOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO;
        
        if prox = "Molino salida" or prox = "Circunvalacion salida" then

            
            select TIMEDIFF(Horasal, HoraEntrada) into HoraResultado;
            select Horasal;
            SELECT HoraResultado AS HORAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAATARDADA;

            if HoraResultado > "00:09:00" then

                update Calculador set visita = visita +1 where patente = paten;
            end if;
        end if;
    else

        if seto = 0 and p = "Molino Entrada" then
            select punto into prox from autos where patente = paten and hora > HoraEntrada and fecha = f order by hora asc limit 1;
            select prox;
            if prox = "Molino salida" or prox = "Circunvalacion salida" then
                select TIMEDIFF(Horasal, HoraEntrada) into HoraResultado;
                if HoraResultado >"00:09:00" then
                     update Calculador set visita = visita +1 where patente = paten;
                end if;
            end if;
        end if;
    end if;

    set ID_alto = ID_alto - 1;
    update Calculador set Seteo = 1 where patente = paten;    
    set p =null;
    set Horasal =null;
    set HoraEntrada =null;
 end while;
end;
//
DELIMITER ;

---------------------------------------

DELIMITER // 
CREATE PROCEDURE Pasante(in f varchar(20))
BEGIN

declare v int;
declare p varchar(30);
declare paten varchar(20);
declare Seto int;
declare ID_alto bigint;
declare ID_bajo bigint;
declare HoraEntrada time;
declare HoraSal time;
declare HoraResultado time;
declare prox varchar(30);
declare verificarPatente varchar(30);

select id_registro into ID_alto from autos where fecha = f order by id_registro desc limit 1;
select id_registro into ID_bajo from autos where fecha = f order by id_registro asc limit 1;

update Calculador set Seteo = 0;
select f;
set seto = 0;
set v = 2;

 while  id_bajo < ID_alto do

    set    prox =null;
    set  verificarPatente =null;
    select punto into p from autos where id_registro =ID_alto; 
    select patente into paten from autos where id_registro = ID_alto;
    select Seteo into seto from Calculador where patente = paten;
    select hora into HoraEntrada from autos where id_registro=ID_alto;
    select hora into HoraSal from autos where patente = paten and hora > HoraEntrada and fecha  = f order by hora asc limit 1;
    select patente into verificarPatente from Calculador where patente = paten;



    if verificarPatente is null then

        INSERT INTO Calculador (patente, pasante, ViveL,ViveR, visita,Unico, Seteo) VALUES (paten,0,0,0,0,0,0);
        select 'entre cuando no existe patente';

    end if;

    select p;
    select ID_alto;
    select HoraEntrada;
    select paten;


    if seto  = 0 and p= "Circunvalacion Entrada" then

        select 'ENTREEEEEEEEA UN IFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF 1';

        update Calculador set Seteo = 1 where patente = paten;
        select punto into prox from autos where patente = paten and hora > HoraEntrada and fecha = f order by hora asc limit 1;
        select patente as patenteSalidaaaaaaaaaaaaa from autos where patente = paten and hora > HoraEntrada and fecha = f order by hora asc limit 1;

        select prox as proximo_punto;
        select P AS PUNTOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO;
        
        if prox = "Molino salida" then

            select TIMEDIFF(Horasal, HoraEntrada) into HoraResultado;
            select Horasal;
            SELECT HoraResultado AS HORAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAATARDADA;
            
            if HoraResultado <"00:09:00" then

                    SELECT '1.2222222222222222222222222222222222222222222222222222222222222222';
                update Calculador set pasante =pasante + 1 where patente =paten;
            end if;
        end if;

    else

        if seto = 0 and p = "Molino Entrada" then

            select punto into prox from autos where patente = paten and hora > HoraEntrada and fecha = f order by hora asc limit 1;
            select prox;

            if prox = "Circunvalacion salida" then

                select TIMEDIFF(Horasal, HoraEntrada) into HoraResultado;

                if HoraResultado <"00:09:00" then

                     update Calculador set pasante =pasante + 1 where patente =paten;

                end if;

            end if;
        end if;
    end if;

    set ID_alto = ID_alto - 1;
    update Calculador set Seteo = 1 where patente = paten;    
    set p =null;
    set Horasal =null;
    set HoraEntrada =null;

 end while;

end;
//
DELIMITER ;

------------------------------------------------------------------
----PARA AUTO UNICO


DELIMITER // 
CREATE PROCEDURE UNICO(in f varchar(20))
BEGIN

declare v int;
declare p varchar(30);
declare paten varchar(20);
declare Seto int;
declare ID_alto bigint;
declare ID_bajo bigint;
declare HoraEntrada time;
declare HoraSal time;
declare HoraResultado time;
declare prox varchar(30);
declare verificarPatente varchar(30);

select id_registro into ID_alto from autos where fecha = f order by id_registro desc limit 1;
select id_registro into ID_bajo from autos where fecha = f order by id_registro asc limit 1;

update Calculador set Seteo = 0;
select f;
set seto = 0;
set v = 2;

 while  id_bajo < ID_alto do

    set    prox =null;
    set  verificarPatente =null;
    select punto into p from autos where id_registro =ID_alto; 
    select patente into paten from autos where id_registro = ID_alto;
    select Seteo into seto from Calculador where patente = paten;
    select hora into HoraEntrada from autos where id_registro=ID_alto;
    select hora into HoraSal from autos where patente = paten and hora > HoraEntrada and fecha  = f order by hora asc limit 1;
    select patente into verificarPatente from Calculador where patente = paten;



    if verificarPatente is null then

        INSERT INTO Calculador (patente, pasante, ViveL,ViveR, visita,Unico, Seteo) VALUES (paten,0,0,0,0,0,0);
        select 'entre cuando no existe patente';

    end if;

    select p;
    select ID_alto;
    select HoraEntrada;
    select paten;


    if seto  = 0 and p= "Circunvalacion Entrada" then
    
        update Calculador set Seteo = 1 where patente = paten;
        select punto into prox from autos where patente = paten and hora > HoraEntrada and fecha = f order by hora asc limit 1;
        select patente as patenteSalidaaaaaaaaaaaaa from autos where patente = paten and hora > HoraEntrada and fecha = f order by hora asc limit 1;

        select prox as proximo_punto;
        select P AS PUNTOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO;
        
        if prox = "Molino salida" then

            select TIMEDIFF(Horasal, HoraEntrada) into HoraResultado;
            select Horasal;
            SELECT HoraResultado AS HORAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAATARDADA;
            
            if HoraResultado <"00:09:00" then

                    SELECT '1.2222222222222222222222222222222222222222222222222222222222222222';
                update Calculador set pasante =pasante + 1 where patente =paten;
            end if;
        end if;

    else

        if seto = 0 and p = "Molino Entrada" then

            select punto into prox from autos where patente = paten and hora > HoraEntrada and fecha = f order by hora asc limit 1;
            select prox;

            if prox = "Circunvalacion salida" then

                select TIMEDIFF(Horasal, HoraEntrada) into HoraResultado;

                if HoraResultado <"00:09:00" then

                     update Calculador set pasante =pasante + 1 where patente =paten;

                end if;

            end if;
        end if;
    end if;

    set ID_alto = ID_alto - 1;
    update Calculador set Seteo = 1 where patente = paten;    
    set p =null;
    set Horasal =null;
    set HoraEntrada =null;

 end while;

end;
//
DELIMITER ;


---CLASIFICAR PATRON ------------


DELIMITER // 
CREATE PROCEDURE Clasificacion()
BEGIN

    declare unic integer;
    declare pasant integer;
    declare vil integer;
    declare vir integer;
    declare vis integer;
    declare id integer;

    select count(id_patente) into id from Calculador;
    
    while 0 < id do

        select Unico into unic from Calculador where id_patente = id;
        select pasante into pasant from Calculador where id_patente = id;
        select vivel into vil from Calculador where id_patente = id;
        select ViveR into vir from Calculador where id_patente = id;
        select visita into vis from Calculador where id_patente = id;

        if unic> pasant and unic>vil  and unic>vir and unic>vis then
            select 'GRANDE';


        end if;



        
    end while;

END
//
DELIMITER ;
