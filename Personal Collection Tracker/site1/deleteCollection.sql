SET SERVEROUTPUT ON;
SET VERIFY OFF;

BEGIN
	DBMS_OUTPUT.PUT_LINE(chr(10)||chr(10)||'Please Enter your Choice to delete anything from collection:');
	DBMS_OUTPUT.PUT_LINE('1. Delete stamp from before 2010+ collection');
	DBMS_OUTPUT.PUT_LINE('2. Delete stamp from after 2010 collection');
	DBMS_OUTPUT.PUT_LINE('3. Delete book from before 2010+ collection');
	DBMS_OUTPUT.PUT_LINE('4. Delete book from after 2010 collection');
END;
/
DECLARE
	CHOICE NUMBER := &YOUR_CHOICE;
	B_ID BOOKS.BOOKS_ID%TYPE;
	B_NAME BOOKS.BOOKS_NAME%TYPE;
	
	S_ID STAMPS.STAMP_ID%TYPE;
	S_CODE STAMPS.STAMP_CODE%TYPE;
	
	CHOICE_OUT_OF_BOUND EXCEPTION;
	
BEGIN
	IF CHOICE= 1 THEN
		DBMS_OUTPUT.PUT_LINE('===================================================');
		DBMS_OUTPUT.PUT_LINE('STAMP COLLECTION BEFORE 2010:');
		DBMS_OUTPUT.PUT_LINE('===================================================');
		DBMS_OUTPUT.PUT_LINE('ID' || chr(9) || 'STAMP CODE');
		DBMS_OUTPUT.PUT_LINE('---------------------------------------------------');
		FOR R IN (SELECT * FROM STAMPS@SITE1) LOOP
			S_ID := R.STAMP_ID;
			S_CODE := R.STAMP_CODE;
			DBMS_OUTPUT.PUT_LINE(S_ID || chr(9) || S_CODE);
		END LOOP;	    
	END IF;
	IF CHOICE= 2 THEN
		DBMS_OUTPUT.PUT_LINE('===================================================');
		DBMS_OUTPUT.PUT_LINE('STAMP COLLECTION AFTER 2010:');
		DBMS_OUTPUT.PUT_LINE('===================================================');
		DBMS_OUTPUT.PUT_LINE('ID' || chr(9) || 'STAMP CODE');
		DBMS_OUTPUT.PUT_LINE('---------------------------------------------------');
		FOR R IN (SELECT * FROM STAMPS) LOOP
			S_ID := R.STAMP_ID;
			S_CODE := R.STAMP_CODE;
			DBMS_OUTPUT.PUT_LINE(S_ID || chr(9) || S_CODE);
		END LOOP;	    
	END IF;
	IF CHOICE= 3 THEN
		DBMS_OUTPUT.PUT_LINE('===================================================');
		DBMS_OUTPUT.PUT_LINE('BOOK COLLECTION BEFORE 2010:');
		DBMS_OUTPUT.PUT_LINE('===================================================');
		DBMS_OUTPUT.PUT_LINE('BOOK ID' || chr(9) || 'BOOK NAME');
		DBMS_OUTPUT.PUT_LINE('---------------------------------------------------');
		FOR R IN (SELECT * FROM BOOKS@SITE1) LOOP
			B_ID := R.BOOKS_ID;
			B_NAME := R.BOOKS_NAME;
			DBMS_OUTPUT.PUT_LINE(B_ID || chr(9) || B_NAME);
		END LOOP;	    
	ELSIF CHOICE= 4 THEN
		DBMS_OUTPUT.PUT_LINE('===================================================');
		DBMS_OUTPUT.PUT_LINE('BOOK COLLECTION AFTER 2010:');
		DBMS_OUTPUT.PUT_LINE('===================================================');
		DBMS_OUTPUT.PUT_LINE('BOOK ID' || chr(9) || 'BOOK NAME');
		DBMS_OUTPUT.PUT_LINE('---------------------------------------------------');
		FOR R IN (SELECT * FROM BOOKS) LOOP
			B_ID := R.BOOKS_ID;
			B_NAME := R.BOOKS_NAME;
			DBMS_OUTPUT.PUT_LINE(B_ID || chr(9) || B_NAME);
		END LOOP;
	    
	END IF;
	
	IF CHOICE > 4 OR CHOICE < 1 THEN
		RAISE CHOICE_OUT_OF_BOUND;
	END IF;
	
	EXCEPTION
		WHEN CHOICE_OUT_OF_BOUND THEN 
			DBMS_OUTPUT.PUT_LINE(chr(10) || 'WRONG CHOICE OPTION SELECTED!');
	
	
END;
/

BEGIN
	DBMS_OUTPUT.PUT_LINE(chr(10) || 'CHOOSE THE BOOK OR STAMP ID TO DELETE AS YOUR CHOICE' || chr(10));
	DBMS_OUTPUT.PUT_LINE('--------------PLEASE FILL UP ALL FIELDS---------' || chr(10));
	
END;
/

DECLARE
	CHOICES NUMBER := &YOUR_PREVIOUS_CHOICE;
	BID NUMBER := &BOOK_OR_STAMP_ID;
	CHOICE_OUT_OF_BOUND EXCEPTION;
 
BEGIN
	IF CHOICES = 1 THEN
		DEL_UP_COL.ALL_COL(CHOICES, BID);
	ELSIF CHOICES = 2 THEN
		DEL_UP_COL.ALL_COL(CHOICES, BID);	
	ELSIF CHOICES = 3 THEN
		DEL_UP_COL.ALL_COL(CHOICES, BID);
	ELSIF CHOICES = 4 THEN
		DEL_UP_COL.ALL_COL(CHOICES, BID);
	END IF;
	
	IF CHOICES > 4 OR CHOICES < 1 THEN
		RAISE CHOICE_OUT_OF_BOUND;
	END IF;
	
	EXCEPTION
		WHEN CHOICE_OUT_OF_BOUND THEN 
			DBMS_OUTPUT.PUT_LINE(chr(10) || 'WRONG CHOICE OPTION SELECTED!');
END;
/
