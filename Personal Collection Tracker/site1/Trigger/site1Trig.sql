SET SERVEROUTPUT ON;
SET VERIFY OFF;

--------------------------UPDATE TRIGGER------------------------------

CREATE OR REPLACE TRIGGER updateCollectionStamp
AFTER UPDATE 
OF S_ENTRY_DATE
ON STAMPS
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'Data Updated in STAMP Collection Table');
END;
/
CREATE OR REPLACE TRIGGER updateCollectionBook
AFTER UPDATE 
OF B_ENTRY_DATE
ON BOOKS
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'Data Updated in Book Collection Table');
END;
/

--------------------------INSERT TRIGGER------------------------------

CREATE OR REPLACE TRIGGER insertCollectionStamp
BEFORE INSERT 
ON STAMPS
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'Data Inserted in STAMP Collection Table');
END;
/
CREATE OR REPLACE TRIGGER insertCollectionBook
BEFORE INSERT 
ON BOOKS
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'Data Inserted in Book Collection Table');
END;
/


--------------------------DELETE TRIGGER------------------------------

CREATE OR REPLACE TRIGGER deleteCollectionStamp
AFTER DELETE
ON STAMPS
FOR EACH ROW
DECLARE
	I STAMPS.STAMP_ID%TYPE;
	A STAMPS.STAMP_CODE%TYPE;
	B STAMPS.COUNTRY%TYPE;
	C STAMPS.STAMP_YEAR%TYPE;
	D STAMPS.PRICE%TYPE;
	E STAMPS.S_ENTRY_DATE%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'Data Deleted in STAMP Collection Table');
	I := :OLD.STAMP_ID;
	A := :OLD.STAMP_CODE;
	B := :OLD.COUNTRY;
	C := :OLD.STAMP_YEAR;
	D := :OLD.PRICE;
	E := :OLD.S_ENTRY_DATE;
	INSERT INTO STAMPS_RETRIEVER VALUES(I, A, B, C, D, E);
END;
/
CREATE OR REPLACE TRIGGER deleteCollectionBook
AFTER DELETE
ON BOOKS
FOR EACH ROW
DECLARE
	I BOOKS.BOOKS_ID%TYPE;
	A BOOKS.BOOKS_NAME%TYPE;
	B BOOKS.BOOK_GENRE%TYPE;
	C BOOKS.AUTHOR%TYPE;
	E BOOKS.B_ENTRY_DATE%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'Data Deleted in Book Collection Table');
	I := :OLD.BOOKS_ID;
	A := :OLD.BOOKS_NAME;
	B := :OLD.BOOK_GENRE;
	C := :OLD.AUTHOR;
	E := :OLD.B_ENTRY_DATE;
	INSERT INTO BOOKS_RETRIEVER VALUES(I, A, B, C, E);
	
END;
/