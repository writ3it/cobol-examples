      * Rewrite SampleData/persons.txt to build/output.txt
      * but output.txt is indexed file
       IDENTIFICATION DIVISION.
       PROGRAM-ID. 02_WRITE.

       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
               FILE-CONTROL.
               SELECT PERSON-IN ASSIGN TO '../SampleData/persons.txt'
                   ORGANIZATION IS LINE SEQUENTIAL.

               SELECT PERSON-OUT ASSIGN TO 'output.dat'
                   ORGANIZATION IS INDEXED
                   ACCESS IS DYNAMIC
                   RECORD KEY IS FO_PERSON-ID.
              

       DATA DIVISION.
           FILE SECTION.
           FD PERSON-IN.
               01 FI_PERSON.
                  02 FI_PERSON-ID PIC 999.
                  02 FI_PERSON-NAME PIC X(16).
                  02 FI_PERSON-SURNAME PIC X(25).
           
           FD PERSON-OUT.
               01 FO_PERSON.
                  02 FO_PERSON-ID PIC 999.
                  02 FO_PERSON-NAME PIC X(16).
                  02 FO_PERSON-SURNAME PIC X(25).

           WORKING-STORAGE SECTION.
               01 S_PERSON.
                   02 S_PERSON-ID PIC 999.
                   02 S_PERSON-NAME PIC X(16).
                   02 S_PERSON-SURNAME PIC X(25).
               01 B_EOF PIC A(1) VALUE 'F'.

       PROCEDURE DIVISION.
           OPEN INPUT PERSON-IN.
           OPEN OUTPUT PERSON-OUT.
           CLOSE PERSON-OUT.
           OPEN I-O PERSON-OUT.

               PERFORM UNTIL B_EOF = 'T'
                   READ PERSON-IN INTO FO_PERSON
                       AT END MOVE 'T' TO B_EOF
                       NOT AT END DISPLAY FO_PERSON
                   END-READ
                   IF NOT B_EOF = 'T' THEN
                       WRITE FO_PERSON 
                       END-WRITE
                   END-IF
               END-PERFORM.

           CLOSE PERSON-OUT.
           CLOSE PERSON-IN.


       STOP RUN.


       