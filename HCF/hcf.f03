! H.C.F. (Highest Common Factor)
! Input: ANUM, BNUM
! Output: HCF
program hcf

   integer ANUM, BNUM;
   integer MODNUM, FACTOR;
   
   write(*,*) 'A: ';
   read(*,*) ANUM;
   write(*,*) 'B: ';
   read(*,*) BNUM;
   
   if (ANUM > BNUM) then
      MODNUM = BNUM;
      FACTOR = ANUM;
   else
      MODNUM = ANUM;
      FACTOR = BNUM;
   endif
   

   do 
      ANUM = FACTOR;
      FACTOR = MODNUM;
      MODNUM = MOD(ANUM , FACTOR);
      
      if(MODNUM == 0) then
         write(*,1001) 'H.C.F.: ', FACTOR;
         exit;
      endif
      
   end do
   
   1001  format(A, I3);

end program hcf