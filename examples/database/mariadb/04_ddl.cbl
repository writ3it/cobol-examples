       IDENTIFICATION DIVISION.
       PROGRAM-ID. 02_ddl.

       DATA DIVISION.
           WORKING-STORAGE SECTION.
           EXEC SQL BEGIN DECLARE SECTION END-EXEC.
           01  HOSTVARS.
               05 BUFFER               PIC X(1024).
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

           MOVE SPACES TO BUFFER.
           
           STRING 'CREATE TABLE testtable('
               'id INT NOT NULL AUTO_INCREMENT,'
               'name VARCHAR(100) NOT NULL,'
               'PRIMARY KEY (id) )'
               INTO BUFFER.
           
           EXEC SQL
               EXECUTE IMMEDIATE :BUFFER
           END-EXEC.

           IF SQLSTATE='42S01'
               DISPLAY 'Table testtable already exists.'
           ELSE
               PERFORM SQLSTATE-CHECK
               DISPLAY 'table testtable created'
           END-IF.

           MOVE SPACES TO BUFFER.
           STRING 'DROP TABLE testtable'
               INTO BUFFER.

           EXEC SQL
               EXECUTE IMMEDIATE :BUFFER
           END-EXEC.
           
           PERFORM SQLSTATE-CHECK.
           DISPLAY 'table testtable dropped'

           EXEC SQL
               EXECUTE IMMEDIATE :BUFFER
           END-EXEC.

           EXEC SQL
               CONNECT RESET
           END-EXEC.
           PERFORM SQLSTATE-CHECK.
       STOP RUN.

       COPY 'SQLSTATE-CHECK.cpy'.


       