       IDENTIFICATION DIVISION.
       PROGRAM-ID. 01_select.

       DATA DIVISION.
           WORKING-STORAGE SECTION.
           EXEC SQL BEGIN DECLARE SECTION END-EXEC.
           01  HOSTVARS.
               05 BUFFER               PIC X(1024).
               05 king.
                   10 king-id              PIC 9(10).
                   10 filler               PIC XXX VALUE " | ".
                   10 king-name            PIC X(50).
           EXEC SQL END DECLARE SECTION END-EXEC.

       PROCEDURE DIVISION.
           
           STRING 'DRIVER={MariaDB ODBC 3.0 Driver};'
                  'SERVER=10.0.1.2;'
                  'PORT=3306;'
                  'DATABASE=coboldb;'
                  'USER=cobolusr;'
                  'PASSWORD=cobolExamplePassword;'
                  'COMPERSSED_PROTO=0;'
                  'TRACE=0'
           INTO BUFFER.

           EXEC SQL 
               CONNECT TO :BUFFER
           END-EXEC.

           PERFORM SQLSTATE-CHECK

           EXEC SQL
               DECLARE CURR_KINGS CURSOR FOR
               SELECT id, name FROM kings_of_poland
           END-EXEC.

           PERFORM SQLSTATE-CHECK

           EXEC SQL
               OPEN CURR_KINGS
           END-EXEC.

           PERFORM SQLSTATE-CHECK

           PERFORM UNTIL SQLCODE = 100
               EXEC SQL 
                   FETCH CURR_KINGS
                   INTO
                       :king-id, 
                       :king-name
               END-EXEC
               PERFORM SQLSTATE-CHECK
               IF SQLCODE NOT = 100
                   DISPLAY king
               END-IF
           END-PERFORM.

           EXEC SQL
               CONNECT RESET
           END-EXEC.
           PERFORM SQLSTATE-CHECK.
       STOP RUN.

       SQLSTATE-CHECK SECTION.
           IF SQLCODE < 0
                      DISPLAY 'SQLSTATE='  SQLSTATE,
                              ', SQLCODE=' SQLCODE
              IF SQLERRML > 0
                 DISPLAY 'SQL Error message:' SQLERRMC(1:SQLERRML)
              END-IF
              MOVE SQLCODE TO RETURN-CODE
              STOP RUN
           ELSE IF SQLCODE > 0 AND NOT = 100
                      DISPLAY 'SQLSTATE='  SQLSTATE,
                              ', SQLCODE=' SQLCODE
              IF SQLERRML > 0
                 DISPLAY 'SQL Warning message:' SQLERRMC(1:SQLERRML)
              END-IF
           END-IF.


       