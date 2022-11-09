


delimiter //
create procedure Unica(in f varchar(20))
begin


declare p varchar(30);
declare paten varchar(20);
declare Seto int;
declare ID_alto bigint;
declare ID_bajo bigint;
declare HoraSal time;
declare HoraEntrada time;
declare HoraResultado time;
declare HoraSal2 time;
declare HoraEntrada2 time;
declare HoraResultado2 time;
declare HoraEntrada3 time;
declare Horasal3 time;
declare HoraResultado3 time;
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

            select punto into prox from autos where patente = paten and hora > HoraSal and fecha  = f order by hora asc limit 1;
        
            
            if prox = "Circunvalacion Entrada" or prox = "Molino Entrada" then

                select hora into HoraEntrada from autos where patente = paten and hora > HoraSal and fecha  = f order by hora asc limit 1;              

                select hora into HoraEntrada from autos where patente = paten and hora > HoraSal and fecha  = f order by hora asc limit 1;
                
                select TIMEDIFF(HoraEntrada, Horasal) INTO HoraResultado;

                if HoraResultado <"02:20:00" then

                    update Calculador set ViveR = ViveR +1 where patente =paten;
                    update Calculador set Seteo = 1 where patente = paten;
                
                else

                    update Calculador set ViveL = ViveL +1 where patente =paten;
                    update Calculador set Seteo = 1 where patente = paten;

                end if;

            end if;
                
    else
        
        if seto =  0 and p= "Molino Salida"  then

            
            select punto into prox from autos where patente = paten and hora > HoraSal and fecha  = f order by hora asc limit 1;

        if prox = "Circunvalacion Entrada" or prox = "Molino Entrada" then

                select hora into HoraEntrada from autos where patente = paten and hora > HoraSal and fecha  = f order by hora asc limit 1;

                select hora into HoraEntrada from autos where patente = paten and hora > HoraSal and fecha  = f order by hora asc limit 1;
                
                select TIMEDIFF(HoraEntrada, Horasal) INTO HoraResultado;
                

                if HoraResultado <"01:00:00" then

                    update Calculador set ViveR = ViveR +1 where patente =paten;
                    update Calculador set Seteo = 1 where patente = paten;
                
                else

                    update Calculador set ViveL = ViveL +1 where patente =paten;
                    update Calculador set Seteo = 1 where patente = paten;

                end if;
            end if;
            

        end if;

    end if;

     set Horasal =null;
    set HoraEntrada =null;
    set HoraResultado=null;


    select Seteo into seto from Calculador where patente = paten;
    select hora into HoraEntrada2 from autos where id_registro=ID_alto;
    select hora into HoraSal2 from autos where patente = paten and hora > HoraEntrada2 and fecha  = f order by hora asc limit 1;

    if seto  = 0 and p= "Circunvalacion Entrada" then

        
        select punto into prox from autos where patente = paten and hora > HoraEntrada2 and fecha = f order by hora asc limit 1;
        select patente as patenteSalidaaaaaaaaaaaaa from autos where patente = paten and hora > HoraEntrada2 and fecha = f order by hora asc limit 1;

        select prox as proximo_punto;
        select P AS PUNTOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO;
        
        if prox = "Molino salida" or prox = "Circunvalacion salida" then

            
            select TIMEDIFF(HoraSal2, HoraEntrada2) into HoraResultado2;

            if HoraResultado2 > "00:09:00" then
                update Calculador set Seteo = 1 where patente = paten;
                update Calculador set visita = visita +1 where patente = paten;
            end if;
        end if;
    else

        if seto = 0 and p = "Molino Entrada" then
            select punto into prox from autos where patente = paten and hora > HoraEntrada2 and fecha = f order by hora asc limit 1;
            select prox;
            if prox = "Molino salida" or prox = "Circunvalacion salida" then
                select TIMEDIFF(Horasal2, HoraEntrada2) into HoraResultado2;
                if HoraResultado2 >"00:09:00" then
                     update Calculador set Seteo = 1 where patente = paten;
                     update Calculador set visita = visita +1 where patente = paten;
                end if;
            end if;
        end if;
    end if;

    set Horasal2 =null;
    set HoraEntrada2 =null;
    set HoraResultado2 =null;
    select Seteo into seto from Calculador where patente = paten;
    select hora into HoraEntrada3 from autos where id_registro=ID_alto;
    select hora into HoraSal3 from autos where patente = paten and hora > HoraEntrada3 and fecha  = f order by hora asc limit 1;

    if seto  = 0 and p= "Circunvalacion Entrada" then

        
        select punto into prox from autos where patente = paten and hora > HoraEntrada3 and fecha = f order by hora asc limit 1;
        select patente as patenteSalidaaaaaaaaaaaaa from autos where patente = paten and hora > HoraEntrada3 and fecha = f order by hora asc limit 1;

        
        if prox = "Molino salida" then

            select TIMEDIFF(Horasal3, HoraEntrada3) into HoraResultado;
        
            SELECT HoraResultado AS HORAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAATARDADA;
            
            if HoraResultado <"00:09:00" then

                update Calculador set Seteo = 1 where patente = paten;
                update Calculador set pasante =pasante + 1 where patente =paten;
            end if;
        end if;

    else

        if seto = 0 and p = "Molino Entrada" then

            select punto into prox from autos where patente = paten and hora > HoraEntrada3 and fecha = f order by hora asc limit 1;
            select prox;

            if prox = "Circunvalacion salida" then

                select TIMEDIFF(Horasal3, HoraEntrada3) into HoraResultado;

                if HoraResultado <"00:09:00" then

                     update Calculador set Seteo = 1 where patente = paten;
                     update Calculador set pasante =pasante + 1 where patente =paten;

                end if;

            end if;
        end if;
    end if;


    select Seteo into seto from Calculador where patente = paten;

    if Seto = 0 then

        update Calculador set Seteo = 1 where patente = paten;
        update Calculador set Unico =Unico + 1 where patente =paten;

    end if;


    set ID_alto = ID_alto - 1 ;
    set prox =null;
    set p =null;
    set HoraSal3 =null;
    set HoraEntrada3 =null;
    set HoraResultado3 =null;

 end while;

end;
//
delimiter ;


update Calculador SET Pasante =0;
update Calculador SET VIVEL =0;

update Calculador SET VIVER =0;

update Calculador SET UNICO =0;

update Calculador SET VISITA =0;
