      * PHP code alternatives
      *----------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. 01_READ_FILE.

       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
               FILE-CONTROL.
                   SELECT PERSON ASSIGN TO '../SampleData/persons.txt'
                   ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
           FILE SECTION.
           FD PERSON.
           01 F_PERSON.
              02 F_PERSON-ID PIC 999.
              02 F_PERSON-NAME PIC X(16).
              02 F_PERSON-SURNAME PIC X(25).

           WORKING-STORAGE SECTION.
           01 S_PERSON.
               02 S_PERSON-ID PIC 999.
               02 S_PERSON-NAME PIC X(16).
               02 S_PERSON-SURNAME PIC X(25).
           01 B_EOF PIC A(1) VALUE 'F'.

       PROCEDURE DIVISION.
      *    $fd = fopen();
           OPEN INPUT PERSON.
      *        while (! $B_EOF == 'T' ){
               PERFORM UNTIL B_EOF = 'T'
      *            $s_person = fgetcsv($fd); // cobol reads directly to the structure
                   READ PERSON INTO S_PERSON
      *                $B_EOF = 'T';
                       AT END MOVE 'T' TO B_EOF
      *                echo implode(' ', $s_person)."\n"; 
                       NOT AT END DISPLAY S_PERSON
                   END-READ
               END-PERFORM.
      *    fclode($fd);
           CLOSE PERSON.


       STOP RUN.


       