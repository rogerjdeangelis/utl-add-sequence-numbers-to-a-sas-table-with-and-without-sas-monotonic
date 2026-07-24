/* Add sequence numbers to a SAS table USING MONOTONIC                        */
/* Source: utl-add-sequence-numbers-to-a-sas-table-with-and-without-sas-      */
/* monotonic.sas (rogerjdeangelis). WORK.have substituted for the sd1 libname */
/* originally at d:/sd1; the monotonic() SQL logic is unchanged.              */

data have;
  input col1 $ col2;
cards4;
A 1
D 3
B 5
E 4
A 3
G 1
G 1
E 5
G 5
;;;;
run;

proc sql;
   create
       table want as
   select
        col1
       ,col2
       ,monotonic() as seq
   from
       have
   ;
quit;

proc print data=want;
run;
