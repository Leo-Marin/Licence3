/*
Suppression des relations 
*/
/*
*************************************************
ATTENTION NE PAS TOUCHER AUX LIGNES SUIVANTES
ELLES PERMETTENT DE SUPPRIMER PROPREMENT LES RELATIONS
*************************************************
*/
prompt "Suppression des relations"
BEGIN
EXECUTE IMMEDIATE 'DROP TABLE EMPRUNT';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE ECRIT';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/
BEGIN
EXECUTE IMMEDIATE 'DROP TABLE CARACTERISE';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE EXEMPLAIRE';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE ABONNE';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/
BEGIN
EXECUTE IMMEDIATE 'DROP TABLE AUTEUR';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/
BEGIN
EXECUTE IMMEDIATE 'DROP TABLE MOT_CLEF';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE LIVRE';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

/*
*************************************************
*/


/*
Création des relations 
*/

prompt "Création des relations"

CREATE TABLE LIVRE (
	ISBN VARCHAR(15),
	TITRE VARCHAR(50) CONSTRAINT LITITRE NOT NULL, 
	SIECLE NUMERIC(2,0) CHECK (SIECLE BETWEEN 0 and 21),
	CATEGORIE VARCHAR(16),
	CONSTRAINT pk_isbn PRIMARY KEY (ISBN)
);

CREATE TABLE ABONNE (
	NUM_AB  NUMERIC(6,0),
	NOM VARCHAR(15) CONSTRAINT ABNOM NOT NULL, 
	PRENOM VARCHAR(20), 
	VILLE VARCHAR(13), 
	AGE NUMERIC(3,0)  ,
 	TARIF NUMERIC(3,0) ,
 	REDUC NUMERIC(3,0) ,
 	CONSTRAINT PK_NUMAB PRIMARY KEY (NUM_AB),
	CONSTRAINT DOM_AGE CHECK (AGE BETWEEN 0 AND 120)
	);

CREATE TABLE EXEMPLAIRE (
	NUMERO NUMERIC(4,0),
	DATE_ACHAT DATE, 
	PRIX NUMERIC(5,2), 
	CODE_PRET VARCHAR(20) ,
	ETAT VARCHAR(15) CHECK (ETAT IN ('BON','ABIME','EN_REPARATION')), 
	ISBN  VARCHAR(15),
	CONSTRAINT FK_ISBN FOREIGN KEY (ISBN) REFERENCES LIVRE (ISBN),
	CONSTRAINT PK_NUM PRIMARY KEY (NUMERO),
	CONSTRAINT DOM_CODE_PRET CHECK (CODE_PRET IN ('EXCLU','EMPRUNTABLE','CONSULTABLE')) 
);

CREATE TABLE MOT_CLEF (
	MOT VARCHAR(25),
	CONSTRAINT PK_MOT PRIMARY KEY (MOT)
);

CREATE TABLE EMPRUNT (
	NUM_AB  NUMERIC(6,0),
	NUM_EX NUMERIC (4,0),
	D_EMPRUNT DATE, 
	D_RETOUR DATE, 
	D_RET_REEL DATE, 
	NB_RELANCE NUMERIC(1,0) CHECK (NB_RELANCE IN (1,2,3)),
	CONSTRAINT FK_EMPR_EX FOREIGN KEY (NUM_EX) REFERENCES EXEMPLAIRE (NUMERO),
	CONSTRAINT FK_EMPR_AB FOREIGN KEY (NUM_AB) REFERENCES ABONNE (NUM_AB),
	CONSTRAINT PK_EMPRUNT PRIMARY KEY (NUM_AB,NUM_EX,D_EMPRUNT)
);

CREATE TABLE CARACTERISE (
	ISBN VARCHAR(20),
	MOT VARCHAR(20),
	CONSTRAINT FK_CARAC_ISBN FOREIGN KEY (ISBN) REFERENCES LIVRE (ISBN),
	CONSTRAINT FK_CARAC_MOT FOREIGN KEY (MOT) REFERENCES MOT_CLEF (MOT),
	CONSTRAINT PK_CARAC PRIMARY KEY (ISBN,MOT)
);

