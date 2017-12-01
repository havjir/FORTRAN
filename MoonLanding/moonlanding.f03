program moonlanding

 real alt;  ! Altitude
 real spd;  ! Speed
        real fuel; ! Fuel mass [kg]
        real thr;  ! Max engine throhlthle [%]
        real wgh;  ! Module weight [kg]
        real pwr;  ! Engine power [%] 
        real ftmp; ! supplementary
        
        write(*,*) "--- MOON LANDING ---";
        
        alt = 50.0;
        spd = 8.0;
        fuel = 90.0;
        thr = 35.0;
        wgh = 8000.0;
        
        do while (alt >= 0)
          write(*,1001) 'Vyska: ', alt;
          write(*,1001) 'Rychlost: ', spd;
          write(*,1001) 'Palivo:', fuel;

          write(*,*) 'Zadej tah: ';
          read(*, 1002) pwr;
        
          write(*,*) '========================================';
          
          ftmp = 1.62 - 10.0 * ((pwr * thr) / wgh);
          alt = alt - spd - (ftmp / 2);
          spd = spd + ftmp;
          fuel = fuel - (thr * pwr / 240.0);
          
          if(fuel <= 0) then
            fuel = 0;
            thr = 0;
          endif
          
        end do

        if( spd <= 2.0 ) then 
          write(*,1003) 'Vyborne: ', spd, ' m/s';
        elseif ( spd > 2.0 .and. spd <= 4.0 ) then
          write(*,1003) 'Lehke poskozeni: ', spd, ' m/s';
        elseif ( spd  > 4.0 .and. spd <= 6.0 ) then
          write(*,1003) 'Stredni poskozeni: ', spd, ' m/s';
        elseif ( spd > 6.0 .and. spd <= 8.0 ) then
          write(*,1003) 'Vazne poskozeni: ', spd, ' m/s';
        else
          write(*,1003) 'Modul znicen: ', spd, ' m/s';
        endif

        
1001  format(a,f8.2)

1002  format(f6.2)

1003  format(a,f8.2,a)

end program moonlanding



