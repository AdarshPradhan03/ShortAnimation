     H OPTION(*SRCSTMT) DFTACTGRP(*NO)
     FTSTAD     cf   e             workstn indds(inddata)
     D inddata         ds
     D flow                   50     50N
     D exit                   03     03N
     D runinst1               51     51N
     D runinst2               52     52N
     D runinst3               53     53N
     D runinst4               54     54N
     D runinst5               55     55N
     D runinst6               56     56N
     D reached                57     57N
     D pee                    58     58N

     D itr             s             10i 0 inz(0)
     d sleep           pr            10i 0 ExtProc( 'sleep' )
     d  seconds                      10u 0 Value
      *
      *-----------------------------------------------------------
      * Main Line
      *-----------------------------------------------------------
      /free
        dou itr = 10;
          exsr clear_running_instance;
          itr += 1;
          if %rem(itr:2) = 0;
            flow = *off;
          else;
            flow = *on;
          endif;

          select;
          when itr = 2;
            runinst1 = *on;
          when itr = 3;
            runinst2 = *on;
          when itr = 4;
            runinst3 = *on;
          when itr = 5;
            runinst4 = *on;
          when itr = 6;
            runinst5 = *on;
          when itr = 7;
            runinst6 = *on;
          when itr = 8;
            reached  = *on;
          when itr = 9 or itr = 10;
            reached  = *on;
            pee      = *on;
          endsl;
          write stickman;
          sleep(1);
        enddo;

        dow exit = *off;
          write footer;
          exfmt endgame;
          select;
            when exit = *on;
              leave;
          endsl;
        enddo;

        *inlr = *on;


       //-----------------------------------------------------
        begsr clear_running_instance;
          runinst1 = *off;
          runinst2 = *off;
          runinst3 = *off;
          runinst4 = *off;
          runinst5 = *off;
          runinst6 = *off;
        endsr;







      /end-free
