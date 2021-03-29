SET SERVEROUTPUT ON;
SET VERIFY OFF;


CREATE OR REPLACE PACKAGE MY_PACK_COL AS
	
	PROCEDURE SHOW_STAMP_COL;
	FUNCTION SHOW_BOOK_COL
	RETURN NUMBER;
	
	
END MY_PACK_COL;
/

CREATE OR REPLACE PACKAGE BODY MY_PACK_COL AS 

	---------------------------SHOW COLLECTION OF STAMPS------------------------------------------
	
	PROCEDURE SHOW_STAMP_COL
	IS

	S_CODE STAMPS.STAMP_CODE%TYPE;
	S_COUNTRY STAMPS.COUNTRY%TYPE;
	S_YEAR STAMPS.STAMP_YEAR%TYPE;
	S_PRICE STAMPS.PRICE%TYPE;
	S_DATE STAMPS.S_ENTRY_DATE%TYPE;
	NUM NUMBER;
	
	BEGIN
		FOR R IN (SELECT * FROM STAMP_COLLECTION@SERVER1) LOOP
			DBMS_OUTPUT.PUT_LINE('===================================================' );
			S_CODE := R.STAMP_CODE;
			S_COUNTRY := R.COUNTRY;
			S_YEAR := R.STAMP_YEAR; 
			S_PRICE := R.PRICE;
			S_DATE := R.S_ENTRY_DATE;
			DBMS_OUTPUT.PUT_LINE('Stamp Code: ' || S_CODE || chr(10) || 'Country: ' || S_COUNTRY || chr(10) || 'Year: ' ||S_YEAR || chr(10) || 'Price$: ' || S_PRICE || chr(10) || 'Entry Date: ' || S_DATE );
			DBMS_OUTPUT.PUT_LINE('===================================================' );
			
		END LOOP;
		SELECT COUNT(*) INTO NUM FROM STAMP_COLLECTION@SERVER1;
		DBMS_OUTPUT.PUT_LINE(chr(10) || 'There are ' || NUM || ' Stamps in Collection');
		
	END SHOW_STAMP_COL;
	
	--------------------------------SHOW COLLECTION OF BOOKS-----------------------------
	
	FUNCTION SHOW_BOOK_COL
	RETURN NUMBER
	IS
	B_NAME BOOKS.BOOKS_NAME%TYPE;
	B_GENRE BOOKS.BOOK_GENRE%TYPE;
	B_AUTHOR BOOKS.AUTHOR%TYPE;
	B_DATE BOOKS.B_ENTRY_DATE%TYPE;
	NUM NUMBER;
	
	
	BEGIN
		FOR R IN (SELECT * FROM BOOK_COLLECTION@SERVER1) LOOP
			DBMS_OUTPUT.PUT_LINE('===================================================' );
			B_NAME := R.BOOKS_NAME;
			B_GENRE := R.BOOK_GENRE;
			B_AUTHOR := R.AUTHOR; 
			B_DATE := R.B_ENTRY_DATE;
			DBMS_OUTPUT.PUT_LINE('Book Name: ' || B_NAME ||  chr(10) || 'Genre: ' || B_GENRE || chr(10) || 'Author: ' || B_AUTHOR || chr(10) || 'Entry Date: ' || B_DATE );
			DBMS_OUTPUT.PUT_LINE('===================================================' );
			
		END LOOP;
		SELECT COUNT(*) INTO NUM FROM BOOK_COLLECTION@SERVER1;
		DBMS_OUTPUT.PUT_LINE(chr(10) || 'There are ' || NUM || ' Books in Collection');
		
		RETURN 1;
	END SHOW_BOOK_COL;
	
	
END MY_PACK_COL;
/


