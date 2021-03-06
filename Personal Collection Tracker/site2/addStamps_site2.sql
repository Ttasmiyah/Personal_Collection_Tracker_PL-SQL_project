SET SERVEROUTPUT ON;
SET VERIFY OFF;

BEGIN
	DBMS_OUTPUT.PUT_LINE('PLEASE INSERT PROPER INFORMATION!');
END;
/

ACCEPT A CHAR PROMPT 'Stamp Code = '
ACCEPT B CHAR PROMPT 'Country = '
ACCEPT C CHAR PROMPT 'Stamp Year = '
ACCEPT E CHAR PROMPT '$Price = '
ACCEPT D CHAR PROMPT 'Entry Date(YYYY/MM/DD) = '

DECLARE
	NUM NUMBER;
	S_ID STAMPS.STAMP_ID%TYPE;
	S_CODE STAMPS.STAMP_CODE%TYPE;
	S_COUNTRY STAMPS.COUNTRY%TYPE;
	S_YEAR STAMPS.STAMP_YEAR%TYPE;
	S_PRICE STAMPS.PRICE%TYPE;
	S_DATE STAMPS.S_ENTRY_DATE%TYPE;

BEGIN

	S_CODE := '&A';
	S_COUNTRY := '&B';
	S_YEAR := '&C';
	S_PRICE := &E;
	S_DATE := TO_DATE('&D', 'YYYY/MM/DD');
	
	SELECT COUNT(STAMP_ID) INTO NUM FROM STAMP_COLLECTION@SERVER1;
	S_ID := NUM+1;
	
	IF S_DATE >= TO_DATE('2010/01/01', 'YYYY/MM/DD')THEN
		INSERT INTO STAMPS@SERVER1 VALUES(S_ID, UPPER(S_CODE), UPPER(S_COUNTRY), S_YEAR, S_PRICE, S_DATE);
	ELSE 
		INSERT INTO STAMPS VALUES(S_ID, UPPER(S_CODE), UPPER(S_COUNTRY), S_YEAR, S_PRICE, S_DATE);
	END IF;
	
	EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('FORMAT WRONG! PLEASE USE INSTRUCTED FORMAT.');
END;
/
COMMIT;

