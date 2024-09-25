# utl-add-sequence-numbers-to-a-sas-table-with-and-without-sas-monotonic
Add sequence numbers to a sas table with and without sas monotonic
    %let pgm=utl-add-sequence-numbers-to-a-sas-table-with-and-without-sas-monotonic;

    Add sequence numbers to a sas table with and without sas monotonic

    github
    https://tinyurl.com/yc5hvtft
    https://github.com/rogerjdeangelis/utl-add-sequence-numbers-to-a-sas-table-with-and-without-sas-monotonic

    related repos
    https://github.com/rogerjdeangelis/utl-adding-sequence-numbers-and-partitions-in-SAS-sql-without-using-monotonic
    https://github.com/rogerjdeangelis/utl-lags-in-proc-sql-monotonic-datastep-is-preferred
    https://github.com/rogerjdeangelis/utl-sas-keep-only-monotonic-increasing-sequences-by-group

    /**************************************************************************************************************************/
    /*                             |                                                                                          */
    /*     INPUT                   |  PROCESS & OUTPUT                                                                        */
    /*                             |                                                                                          */
    /* SD1.HAVE total obs=9        |                                                                                          */
    /*                             |                                                                                          */
    /*                             |                     ADD                                                                  */
    /*                             |                     THIS                                                                 */
    /*  Obs    COL1    COL2        |     COL1    COL2    SEQ                                                                  */
    /*                             |                                                                                          */
    /*   1      A        1         |      A        1      1                                                                   */
    /*   2      D        3         |      D        3      2                                                                   */
    /*   3      B        5         |      B        5      3                                                                   */
    /*   4      E        4         |      E        4      4                                                                   */
    /*   5      A        3         |      A        3      5                                                                   */
    /*   6      G        1         |      G        1      6                                                                   */
    /*   7      G        1         |      G        1      7                                                                   */
    /*   8      E        5         |      E        5      8                                                                   */
    /*   9      G        5         |      G        5      9                                                                   */
    /*                             |                                                                                          */
    /*                             |                                                                                          */
    /* libname sd1 "d:/sd1"        |     USING MONOTONIC                                                                      */
    /* data sd1.have;              |     ===============                                                                      */
    /* input  col1$ col2;          |                                                                                          */
    /* cards4;                     |     proc sql;                                                                            */
    /* A 1                         |        create                                                                            */
    /* D 3                         |            table want as                                                                 */
    /* B 5                         |        select                                                                            */
    /* E 4                         |             col1                                                                         */
    /* A 3                         |            ,col2                                                                         */
    /* G 1                         |            ,monotonic() as seq                                                           */
    /* G 1                         |        from                                                                              */
    /* E 5                         |            sd1.have                                                                      */
    /* G 5                         |     ;quit;                                                                               */
    /* ;;;;                        |                                                                                          */
    /* run;quit;                   |     USING MACRO PROCESSSOR                                                               */
    /*                             |     ======================                                                               */
    /*                             |                                                                                          */
    /*                             |     %let seq=0;                                                                          */
    /*                             |     proc sql;                                                                            */
    /*                             |        create                                                                            */
    /*                             |            table want as                                                                 */
    /*                             |        select                                                                            */
    /*                             |             col1                                                                         */
    /*                             |            ,col2                                                                         */
    /*                             |            ,resolve('%let seq=%eval(&seq+1);') as tmp                                    */
    /*                             |            ,symget('seq') as seq length=2                                                */
    /*                             |        from                                                                              */
    /*                             |            sd1.have                                                                      */
    /*                             |     ;quit;                                                                               */
    /*                             |                                                                                          */
    /**************************************************************************************************************************/

    /*              _
      ___ _ __   __| |
     / _ \ `_ \ / _` |
    |  __/ | | | (_| |
     \___|_| |_|\__,_|

    */
