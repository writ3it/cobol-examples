      * Execute files/02_write.cbl first

       IDENTIFICATION DIVISION.
       PROGRAM-ID. 01_SORT.
       
       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT F-INPUT ASSIGN TO '../SampleData/persons.txt'
                   ORGANIZATION IS LINE SEQUENTIAL.
               SELECT F-OUTPUT ASSIGN TO 'sortedOutput.dat'
                   ORGANIZATION IS LINE SEQUENTIAL.
               SELECT F-WORK ASSIGN TO 'work.tmp'.
           

       DATA DIVISION.
           FILE SECTION.
           FD F-INPUT.
               01 INPUT-PERSON.
                   02 IN_PERSON-ID PIC 999.
                   02 IN_PERSON-NAME PIC X(16).
                   02 IN_PERSON-SURNAME PIC X(25).

           FD F-OUTPUT.
               01 OUTPUT-PERSON.
                   02 OUT_PERSON-ID PIC 999.
                   02 OUT_PERSON-NAME PIC X(16).
                   02 OUT_PERSON-SURNAME PIC X(25).

           SD F-WORK.
               01 WORK-PERSON.
                   02 WO_PERSON-ID PIC 999.
                   02 WO_PERSON-NAME PIC X(16).
                   02 WO_PERSON-SURNAME PIC X(25).

           01 B_EOF PIC A(1) VALUE 'F'.

           WORKING-STORAGE SECTION.
           01 S-PERSON.
               02 S_PERSON-ID PIC 999.
               02 S_PERSON-NAME PIC X(16).
               02 S_PERSON-SURNAME PIC X(25).

       PROCEDURE DIVISION.


           
           SORT F-WORK ON ASCENDING KEY OUT_PERSON-SURNAME
           USING F-INPUT GIVING F-OUTPUT.
           DISPLAY 'Finished!'.

           OPEN INPUT F-OUTPUT.

            PERFORM UNTIL B_EOF = 'T'
               READ F-OUTPUT INTO S-PERSON
                   AT END MOVE 'T' TO B_EOF
                   NOT AT END DISPLAY S-PERSON
               END-READ
           END-PERFORM.

           CLOSE F-OUTPUT.

       STOP RUN.
