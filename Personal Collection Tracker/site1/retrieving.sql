SET SERVEROUTPUT ON;
SET VERIFY OFF;

SET LINESIZE 500;
SET PAGESIZE 500;
SELECT * FROM BOOKS_RETRIEVER;
SELECT * FROM STAMPS_RETRIEVER;
BEGIN
	DBMS_OUTPUT.PUT_LINE(chr(10)||chr(10)||'Please Enter your Choice:');
	DBMS_OUTPUT.PUT_LINE('1. Retrieve data in Stamps Collection');
	DBMS_OUTPUT.PUT_LINE('2. Retrieve data in Books Collection');
END;
/

DECLARE
	CHOICE NUMBER := &RETRIEVING_STAMPS_OR_BOOKS; 
	ID NUMBER := &CHOOSEN_ID;
	NUM NUMBER;
	NUM2 NUMBER;
	S_ID NUMBER;
	B_ID NUMBER;
	RT_CODE STAMPS.STAMP_CODE%TYPE;
	RT_COUNTRY STAMPS.COUNTRY%TYPE;
	RT_YEAR STAMPS.STAMP_YEAR%TYPE;
	RT_PRICE STAMPS.PRICE%TYPE;
	RT_DATE STAMPS.S_ENTRY_DATE%TYPE;
	
	RTB_NAME BOOKS.BOOKS_NAME%TYPE;
	RTB_GENRE BOOKS.BOOK_GENRE%TYPE;
	RTB_AUTHOR BOOKS.AUTHOR%TYPE;
	RTB_DATE BOOKS.B_ENTRY_DATE%TYPE;
	
BEGIN 
	IF CHOICE = 1 THEN 
		SELECT COUNT(STAMP_ID) INTO NUM FROM STAMP_COLLECTION;
		S_ID:= NUM+1;
		FOR R IN (SELECT * FROM STAMPS_RETRIEVER WHERE STAMP_ID= ID) LOOP
		
			RT_CODE := R.STAMP_CODE;
			RT_COUNTRY := R.COUNTRY;
			RT_YEAR := R.STAMP_YEAR;
			RT_PRICE := R.PRICE;
			RT_DATE := R.S_ENTRY_DATE;
			
			INSERT INTO STAMPS VALUES(S_ID,RT_CODE,RT_COUNTRY,RT_YEAR,RT_PRICE,RT_DATE);
			
			DELETE FROM STAMPS_RETRIEVER
			WHERE STAMP_ID = ID;
			COMMIT;
		END LOOP;
	ELSIF CHOICE = 2 THEN 
		SELECT COUNT(BOOKS_ID) INTO NUM2 FROM BOOK_COLLECTION;
		B_ID:= NUM2+1;
		FOR R IN (SELECT * FROM BOOKS_RETRIEVER WHERE BOOKS_ID= ID) LOOP
		
			RTB_NAME := R.BOOKS_NAME;
			RTB_GENRE := R.BOOK_GENRE;
			RTB_AUTHOR := R.AUTHOR;
			RTB_DATE := R.B_ENTRY_DATE;
			
			INSERT INTO BOOKS VALUES(B_ID,RTB_NAME,RTB_GENRE,RTB_AUTHOR,RTB_DATE);
			
			DELETE FROM BOOKS_RETRIEVER
			WHERE BOOKS_ID = ID;
			COMMIT;
		END LOOP;
	END IF;

END;
/