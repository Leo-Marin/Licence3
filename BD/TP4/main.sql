



CREATE OR REPLACE PROCEDURE ADD_NBEMPRUNT() 
IS 

NB_EMPR NUMERIC,
EXIST_O_PO NUMERIC,
NBABA := &NBABA;

BEGIN
	SELECT COUNT(*) INTO EXIST_O_PO
	FROM ABONNE
	WHERE NUM_AB=NBABA;

	IF EXIST_O_PO>0 THEN
	SELECT COUNT(*) INTO NB_EMPR
	FROM EMPRUNT WHERE NB_AB=NBABA;
	END IF;

END;
/
SHOW ERRORS


INSERT INTO AB_NB VALUES(NBABA, NB_EMPR);