       IDENTIFICATION DIVISION.
       PROGRAM-ID. 02_insert_update.

       DATA DIVISION.
           WORKING-STORAGE SECTION.
           EXEC SQL BEGIN DECLARE SECTION END-EXEC.
           01  HOSTVARS.
               05 BUFFER               PIC X(1024).
               05 cnt-old              PIC 9(4).
               05 cnt-new              PIC 9(4).
               05 filter-king-name     PIC X(50).
               05 king.
                   10 king-id              PIC 9(10).
                   10 filler               PIC XXX VALUE " | ".
                   10 king-name            PIC X(50).
                   10 filler               PIC XXX VALUE " | ".
                   10 king-year_of_birth   PIC 9(4).
                   10 filler               PIC XXX VALUE " | ".
                   10 king-year_of_death   PIC 9(4).
                   10 filler               PIC XXX VALUE " | ".
                   10 king-reign_year_start PIC 9(4).
                   10 filler               PIC XXX VALUE " | ".
                   10 king-reign_year_end  PIC 9(4).
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

           PERFORM SQLSTATE-CHECK.

           EXEC SQL
               SELECT count(*) INTO :cnt-old
                FROM kings_of_poland
           END-EXEC.

           DISPLAY "Rows number before insertion: "cnt-old.

           MOVE 'rudolf xyz' TO king-name.
           MOVE 1281 TO king-year_of_birth.
           MOVE 1307 TO king-year_of_death.
           MOVE 1306 TO king-reign_year_start.
           MOVE 1307 TO king-reign_year_end.

           PERFORM SQLSTATE-CHECK.

           EXEC SQL
               INSERT INTO kings_of_poland (name, 
                                           year_of_birth,
                                           year_of_death,
                                           reign_year_start,
                                           reign_year_end)
               VALUES (:king-name, 
                       :king-year_of_birth,
                       :king-year_of_death,
                       :king-reign_year_start,
                       :king-reign_year_end)
           END-EXEC.


           PERFORM SQLSTATE-CHECK.

           EXEC SQL
               SELECT count(*) INTO :cnt-new
                FROM kings_of_poland
           END-EXEC.

           DISPLAY "Rows number after insertion: "cnt-new.

           IF cnt-new > cnt-old THEN
               DISPLAY "SUCESS!"
           ELSE    
               DISPLAY "FAILD!"
           END-IF.

           MOVE king-name TO filter-king-name.
           MOVE 'Rudolf' TO king-name.

           EXEC SQL
               UPDATE kings_of_poland 
               SET name = :king-name
               WHERE name = :filter-king-name
           END-EXEC.

           DISPLAY "Try 01_select to check the updated king."


           PERFORM SQLSTATE-CHECK.

           EXEC SQL
               CONNECT RESET
           END-EXEC.
           PERFORM SQLSTATE-CHECK.
       STOP RUN.

       COPY 'SQLSTATE-CHECK.cpy'.

       