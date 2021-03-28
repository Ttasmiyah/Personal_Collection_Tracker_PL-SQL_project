SET SERVEROUTPUT ON;
SET VERIFY OFF;


CREATE OR REPLACE PACKAGE MY_PACK_COL AS
	
	PROCEDURE SHOW_STAMP_COL;
	PROCEDURE SHOW_BOOK_COL;
	
	PROCEDURE SEARCH_STAMP_COL(ST_CODE IN STAMPS.STAMP_CODE%TYPE, ST_COUNTRY IN STAMPS.COUNTRY%TYPE, 
	                           ST_YEAR IN STAMPS.STAMP_YEAR%TYPE, ST_PRICE IN STAMPS.PRICE%TYPE, 
							   ST_DATE IN STAMPS.S_ENTRY_DATE%TYPE);
							   
	PROCEDURE SEARCH_BOOK_COL(BK_NAME IN BOOKS.BOOKS_NAME%TYPE, BK_GENRE IN BOOKS.BOOK_GENRE%TYPE, 
	                           BK_AUTHOR IN BOOKS.AUTHOR%TYPE, BK_DATE IN BOOKS.B_ENTRY_DATE%TYPE);
	
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
		FOR R IN (SELECT * FROM STAMP_COLLECTION) LOOP
			DBMS_OUTPUT.PUT_LINE('===================================================' );
			S_CODE := R.STAMP_CODE;
			S_COUNTRY := R.COUNTRY;
			S_YEAR := R.STAMP_YEAR; 
			S_PRICE := R.PRICE;
			S_DATE := R.S_ENTRY_DATE;
			DBMS_OUTPUT.PUT_LINE('Stamp Code: ' || S_CODE || chr(10) || 'Country: ' || S_COUNTRY || chr(10) || 'Year: ' ||S_YEAR || chr(10) || 'Price$: ' || S_PRICE || chr(10) || 'Entry Date: ' || S_DATE );
			DBMS_OUTPUT.PUT_LINE('===================================================' );
			
		END LOOP;
		SELECT COUNT(*) INTO NUM FROM STAMP_COLLECTION;
		DBMS_OUTPUT.PUT_LINE(chr(10) || 'There are ' || NUM || ' Stamps in Collection');
		
	END SHOW_STAMP_COL;
	
	--------------------------------SHOW COLLECTION OF BOOKS-----------------------------
	
	PROCEDURE SHOW_BOOK_COL
	IS
	B_NAME BOOKS.BOOKS_NAME%TYPE;
	B_GENRE BOOKS.BOOK_GENRE%TYPE;
	B_AUTHOR BOOKS.AUTHOR%TYPE;
	B_DATE BOOKS.B_ENTRY_DATE%TYPE;
	NUM NUMBER;
	
	
	BEGIN
		FOR R IN (SELECT * FROM BOOK_COLLECTION) LOOP
			DBMS_OUTPUT.PUT_LINE('===================================================' );
			B_NAME := R.BOOKS_NAME;
			B_GENRE := R.BOOK_GENRE;
			B_AUTHOR := R.AUTHOR; 
			B_DATE := R.B_ENTRY_DATE;
			DBMS_OUTPUT.PUT_LINE('Book Name: ' || B_NAME ||  chr(10) || 'Genre: ' || B_GENRE || chr(10) || 'Author: ' || B_AUTHOR || chr(10) || 'Entry Date: ' || B_DATE );
			DBMS_OUTPUT.PUT_LINE('===================================================' );
			
		END LOOP;
		SELECT COUNT(*) INTO NUM FROM BOOK_COLLECTION;
		DBMS_OUTPUT.PUT_LINE(chr(10) || 'There are ' || NUM || ' Books in Collection');
	END SHOW_BOOK_COL;
	
	-------------------------------SEARCH COLLECTION FOR STAMPS----------------------------------
	
	PROCEDURE SEARCH_STAMP_COL(ST_CODE IN STAMPS.STAMP_CODE%TYPE, ST_COUNTRY IN STAMPS.COUNTRY%TYPE, 
	                           ST_YEAR IN STAMPS.STAMP_YEAR%TYPE, ST_PRICE IN STAMPS.PRICE%TYPE, 
							   ST_DATE IN STAMPS.S_ENTRY_DATE%TYPE)
	IS
	
	FLAG NUMBER := 0;
	
	BEGIN
		DBMS_OUTPUT.PUT_LINE(chr(10) ||'***********Searched by ' || ST_CODE || ' ' || ST_COUNTRY || ' ' || ST_YEAR || ' ' || ST_PRICE || ' ' || ST_DATE || '***********');
		FOR R IN (SELECT * FROM STAMP_COLLECTION WHERE STAMP_CODE LIKE '%' || ST_CODE || '%' AND COUNTRY LIKE '%' || ST_COUNTRY|| '%' AND 
		          STAMP_YEAR LIKE '%' || ST_YEAR || '%' AND PRICE LIKE '%' || ST_PRICE || '%' AND S_ENTRY_DATE LIKE '%' || ST_DATE || '%') LOOP
			DBMS_OUTPUT.PUT_LINE('===================================================');
			DBMS_OUTPUT.PUT_LINE('Stamp Code: ' || R.STAMP_CODE);
			DBMS_OUTPUT.PUT_LINE('Stamp Country: ' || R.COUNTRY);
			DBMS_OUTPUT.PUT_LINE('Stamp Year: ' || R.STAMP_YEAR);
			DBMS_OUTPUT.PUT_LINE('Stamp Price($): ' || R.PRICE);
			DBMS_OUTPUT.PUT_LINE('Stamp Entry Date: ' || R.S_ENTRY_DATE);
			DBMS_OUTPUT.PUT_LINE('===================================================');
			FLAG:= 1;
			
		END LOOP;
		IF FLAG = 0 THEN 
			DBMS_OUTPUT.PUT_LINE(chr(10) || 'No stamps found according to your search!');
		END IF;
		
	END SEARCH_STAMP_COL;
	
	-------------------------------SEARCH COLLECTION FOR BOOKS----------------------------------
	
	PROCEDURE SEARCH_BOOK_COL(BK_NAME IN BOOKS.BOOKS_NAME%TYPE, BK_GENRE IN BOOKS.BOOK_GENRE%TYPE, 
	                           BK_AUTHOR IN BOOKS.AUTHOR%TYPE, BK_DATE IN BOOKS.B_ENTRY_DATE%TYPE)
	IS
		FLAG NUMBER := 0;
		
	BEGIN
		DBMS_OUTPUT.PUT_LINE(chr(10) ||'***********     Searched by    ' || BK_NAME || ' ' || BK_GENRE || ' ' || BK_AUTHOR || ' ' || BK_DATE || '***********');
		FOR S IN (SELECT * FROM BOOK_COLLECTION WHERE BOOKS_NAME LIKE '%' || BK_NAME || '%' AND BOOK_GENRE LIKE '%' || BK_GENRE|| '%' AND 
		          AUTHOR LIKE '%' || BK_AUTHOR || '%' AND B_ENTRY_DATE LIKE '%' || BK_DATE || '%') LOOP
			DBMS_OUTPUT.PUT_LINE('===================================================');
			DBMS_OUTPUT.PUT_LINE('Book Name: ' || S.BOOKS_NAME);
			DBMS_OUTPUT.PUT_LINE('Book Genre: ' || S.BOOK_GENRE);
			DBMS_OUTPUT.PUT_LINE('Author: ' || S.AUTHOR);
			DBMS_OUTPUT.PUT_LINE('Book Entry Date: ' || S.B_ENTRY_DATE);
			DBMS_OUTPUT.PUT_LINE('===================================================');
			FLAG:= 1;
			
		END LOOP;
		IF FLAG = 0 THEN 
			DBMS_OUTPUT.PUT_LINE(chr(10) || 'No books found according to your search!');
		END IF;
	END SEARCH_BOOK_COL;
	
END MY_PACK_COL;
/


