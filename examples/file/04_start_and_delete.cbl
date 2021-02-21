      * Before this execute 02_write.cbl
       IDENTIFICATION DIVISION.
       PROGRAM-ID. 04_START_AND_DELETE.

       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
               FILE-CONTROL.
               SELECT PERSON-IN ASSIGN TO 'output.dat'
                   ORGANIZATION IS INDEXED
                   ACCESS IS DYNAMIC
                   RECORD KEY IS FI_PERSON-ID.

       DATA DIVISION.
           FILE SECTION.
           FD PERSON-IN.
           01 FI_PERSON.
              02 FI_PERSON-ID PIC 999.
              02 FI_PERSON-NAME PIC X(16).
              02 FI_PERSON-SURNAME PIC X(25).

           WORKING-STORAGE SECTION.
               01 S_PERSON.
                   02 S_PERSON-ID PIC 999.
                   02 S_PERSON-NAME PIC X(16).
                   02 S_PERSON-SURNAME PIC X(25).
               01 B_EOF PIC A(1) VALUE 'F'.
               01 COUNTER PIC 99 VALUE 0.

       PROCEDURE DIVISION.

           OPEN I-O PERSON-IN.

           MOVE 10 TO FI_PERSON-ID.

           START PERSON-IN KEY IS GREATER THAN FI_PERSON-ID
           END-START.
               
               PERFORM UNTIL B_EOF = 'T'

                   READ PERSON-IN NEXT RECORD INTO S_PERSON
                       AT END MOVE 'T' TO B_EOF
                   END-READ

                   IF NOT B_EOF = 'T' THEN
                       DISPLAY "Removing"S_PERSON
                       DELETE PERSON-IN record
                       END-DELETE
                   END-IF

               END-PERFORM.

           CLOSE PERSON-IN.

       STOP RUN.