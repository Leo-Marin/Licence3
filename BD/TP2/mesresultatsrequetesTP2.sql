/*
USAGE :
Utiliser ce fichier pour répondre aux différentes questions. Penser à remplir les champs Numéro carte, nom, prénom, date.
Pour chaque requete vous avez le résultat que vous devez obtenir.
Les questions sont entre commentaires (sauf la première). 
Attention sous ORACLE pour les marques des commentaires (le slash et l'étoile) doivent être seuls sur une ligne.
*/


/*
Numéro de carte étudiant : 
Nom : 
Prénom : 
Date : 
*/

/*
Mise en page - Ne pas toucher
*/
CLEAR SCREEN
SET PAGESIZE 30
COLUMN COLUMN_NAME FORMAT A30
SET LINESIZE 300


prompt --- Q1 : Quels sont les noms et prénoms des abonnés domiciliés à Montpellier ?

SELECT nom, prenom
FROM abonne
WHERE ville='MONTPELLIER';


/*
Résultat attendu :

NOM	     PRENOM
------------ ----------
LEVEQUE      PIERRE
DUPONT	     MARIE
RENARD	     ALBERT
DUPONT	     ANTOINE
DUPONT	     SYLVIE
DUPONT	     JEAN
MEUNIER      LUC
LUCAS	     PAUL
REVEST	     ANNIE
ANTON	     JEANNE

10 lignes selectionnees.

*/

prompt ---- Q2 : Donner toutes les informations sur les exemplaires dont le code de prêt est : « EMPRUNTABLE ».


SELECT * 
FROM Exemplaire
WHERE code_pret='EMPRUNTABLE';

/*
Résultat attendu :
     NUMERO DATE_ACHAT	    PRIX CODE_PRET	      ETAT	      ISBN
---------- ---------- ---------- -------------------- --------------- ---------------
      1010 10/04/2015	      55 EMPRUNTABLE	      BON	      0_18_47892_2
      1011 10/04/2015	      55 EMPRUNTABLE	      BON	      0_18_47892_2
      1012 20/05/2015	     112 EMPRUNTABLE	      BON	      3_505_13700_5
      2909 30/03/2017	      35 EMPRUNTABLE	      BON	      3_505_13700_5
      2673 15/03/2018	      42 EMPRUNTABLE	      ABIME	      3_505_13700_5
      2711 20/06/2014	     270 EMPRUNTABLE	      BON	      0_8_7707_2
      3016 15/09/2017	     420 EMPRUNTABLE	      BON	      0_201_14439_5
      3702 20/02/2019	     210 EMPRUNTABLE	      BON	      1_22_1721_3
      4111 03/01/2021	      48 EMPRUNTABLE	      BON	      1_22_1721_3
      4203 29/11/2019	      35 EMPRUNTABLE	      BON	      1_104_1050_2
      4204 29/11/2019	      35 EMPRUNTABLE	      ABIME	      1_104_1050_2
      5003 10/06/2020	      39 EMPRUNTABLE	      BON	      1_104_1050_2
      5004 10/06/2020	      41 EMPRUNTABLE	      BON	      0_15_270500_3
      5005 10/06/2020	      41 EMPRUNTABLE	      BON	      0_15_270500_3
      5104 20/12/2017	     470 EMPRUNTABLE	      BON	      0_12_27550_2
      6006 15/02/2021	      33 EMPRUNTABLE	      BON	      0_85_4107_3
      6007 15/02/2021	      33 EMPRUNTABLE	      BON	      0_85_4107_3
      5202 18/10/2020	      40 EMPRUNTABLE	      BON	      0_18_47892_2
      7001 01/09/2016	     420 EMPRUNTABLE	      BON	      2_7296_0040
      1109 30/05/2016	     170 EMPRUNTABLE	      BON	      9_782070_36

20 lignes selectionnees.
*/



prompt ---- Q3 : Donner la liste des ouvrages (ISBN, TITRE, CATEGORIE), dont le titre inclut le mot ‘ROSE’, triée par ordre décroissant de numéro.


SELECT isbn, titre, categorie
FROM Livre
WHERE titre LIKE '%ROSE%'
ORDER BY isbn DESC;

/*
Résultat attendu :
ISBN		TITRE						   CATEGORIE
--------------- -------------------------------------------------- ----------------
1_22_1721_3	LE NOM DE LA ROSE				   ROMAN
0_18_47892_2	UNE ROSE POUR MORRISSON 			   ROMAN
0_15_270500_3	LE MIRACLE DE LA ROSE				   ROMAN
*/


prompt ---- Q4 : Donner la liste des livres (leur titre et catégorie) de toutes les catégories sauf MEDECINE, SCIENCES et LOISIRS. Cette liste sera donnée triée par ordre alphabétique selon la catégorie.

SELECT titre, categorie
FROM Livre
WHERE isbn NOT IN (SELECT isbn
                    FROM Livre
                    WHERE categorie= 'MEDECINE'
                            OR categorie='SCIENCES'
                            OR categorie='LOISIRS')
ORDER BY categorie;

/*
Résultat attendu :
TITRE						   CATEGORIE
-------------------------------------------------- ----------
GODEL ESCHER BACH : LES BRINS D UNE GUIRLANDE	   HISTOIRE
LE MUR						   NOUVELLE
POESIES COMPLETES				   POEME
UNE ROSE POUR MORRISSON 			   ROMAN
LA PERLE					   ROMAN
LE GRAND VESTIAIRE				   ROMAN
L ENFANT					   ROMAN
LE MIRACLE DE LA ROSE				   ROMAN
LE NOM DE LA ROSE				   ROMAN

9 lignes selectionnees.

*/



prompt ---- Q5 :	Donner toutes les informations sur les emprunts pour lesquels la date de retour effective (attribut D_RET_REEL) n'est pas renseignée dans la base de données.

SELECT *
FROM Emprunt
WHERE D_RET_REEL IS Null;

/*
Résultat attendu :
    NUM_AB     NUM_EX D_EMPRUNT D_RETOUR  D_RET_REE NB_RELANCE
---------- ---------- --------- --------- --------- ----------
    911007	 4204 19-JAN-03 10-FEB-03		     1
    902075	 2673 15-FEB-03 28-FEB-03
    902075	 1010 05-JAN-03 25-JAN-03		     1
    921102	 6006 20-DEC-02 10-JAN-03		     2
*/

prompt ---- Q6 : Donner, pour l'abonné JEAN DUPONT, la liste des exemplaires empruntés (leur numéro et la date d'emprunt), par ordre croissant de date d'emprunt.

SELECT num_ex, d_emprunt
FROM EMPRUNT e JOIN ABONNE a ON e.num_ab=a.num_ab
WHERE a.nom='DUPONT' AND a.prenom='JEAN'
ORDER BY d_emprunt;

/*
Résultat attendu :
    NUM_EX D_EMPRUNT
---------- ----------
      5003 10/03/2020
      5005 30/03/2020
      1012 30/03/2020
      5103 17/06/2020
      1109 15/09/2020
      6007 22/12/2020

6 lignes selectionnees.
*/

prompt ------ Q7 : Donner la liste des exemplaires empruntés (leur numéro, code prêt et état) du livre de titre « LE MUR».

SELECT numero, code_pret, etat
FROM Exemplaire e JOIN Livre l ON e.isbn=l.isbn
WHERE titre='LE MUR';

/*
Résultat attendu :
  NUMERO CODE_PRET		ETAT
---------- -------------------- ---------------
      5003 EMPRUNTABLE		BON
      4203 EMPRUNTABLE		BON
      4204 EMPRUNTABLE		ABIME

*/

prompt  ---- Q8 : Quels sont les exemplaires (numéro) reproduisant le même livre que l'exemplaire de numéro 4112 et dont l'état est : « BON » ?

SELECT numero
FROM Exemplaire e JOIN Livre l ON e.isbn=l.isbn
WHERE etat='BON' AND numero!='4112' AND titre IN (SELECT titre
                FROM Exemplaire e JOIN Livre l ON e.isbn=l.isbn
                WHERE numero='4112');

/*
Résultat attendu :
    NUMERO
----------
      3702
      3703
      4111

*/


prompt ---- Q9 : Existe-t-il une catégorie pour laquelle aucun livre n'a été emprunté ?

SELECT categorie
FROM Livre 
WHERE categorie NOT IN (SELECT categorie
                    FROM Emprunt em JOIN Exemplaire e ON em.num_ex=e.numero
                                JOIN Livre l ON l.isbn=e.isbn);


/*
Résultat attendu :
CATEGORIE
----------
POEME

*/



prompt ---- Q10 : Quel est le nombre d'emprunt en cours de l'abonné Renard Albert ? 

SELECT COUNT(*)
FROM Emprunt em JOIN ABONNE a ON em.num_ab=a.num_ab
WHERE prenom='ALBERT' AND nom='RENARD' AND D_RET_REEL IS NULL;


/*
Résultat attendu :
  COUNT(*)
----------
	 2

*/


prompt ---- Q11 : Quelle est la catégorie de livres pour laquelle l'exemplaire le plus cher a été acheté ? 

SELECT DISTINCT categorie
FROM Livre
WHERE categorie IN(SELECT categorie 
                    FROM Livre l JOIN Exemplaire e ON l.isbn=e.isbn AND prix IN (
                        SELECT MAX(prix)
                        FROM Exemplaire));

/*
Résultat attendu :
CATEGORIE
----------------
ROMAN

*/

prompt ---- Q12 : Existe-t-il des exemplaires dans l'état « Abimé » et qui sont actuellement empruntés ? Si oui, donner leur numéro.

SELECT numero 
FROM Exemplaire e JOIN Emprunt em ON e.numero=em.num_ex
WHERE etat='ABIME' AND D_RET_REEL IS NULL;

/*
Résultat attendu :
    NUMERO
----------
      2673
      4204
*/

prompt -- Q13 : Existe-t-il des mots clefs ne caractérisant aucun livre ?

SELECT mot 
FROM Mot_clef
WHERE mot NOT IN (SELECT mot
FROM Caracterise); 

/*
Résultat attendu :
MOT
--------------------
ESSAI
MEDECINE
NOUVELLE

*/

prompt --- Q14 : Donner le nombre d'emprunts effectués par chacun des abonnés (numéro, nom) pour chacune des catégories de livres proposées.

SELECT a.num_ab, nom, categorie, COUNT(*)
FROM abonne a JOIN Emprunt em ON a.num_ab=em.num_ab
            JOIN Exemplaire e ON em.num_ex=e.numero
            JOIN Livre l ON e.isbn=l.isbn
GROUP BY categorie, nom, a.num_ab;

/*
Résultat attendu :
    NUM_AB NOM		   CATEGORIE	      COUNT(*)
---------- --------------- ---------------- ----------
    911023 DUPONT	   NOUVELLE		     2
    921102 LUCAS	   NOUVELLE		     2
    902043 DUPONT	   HISTOIRE		     2
    902075 RENARD	   NOUVELLE		     1
    922016 MEUNIER	   NOUVELLE		     1
    932010 ANTON	   NOUVELLE		     1
    901001 LEVEQUE	   NOUVELLE		     2
    911007 MARTIN	   ROMAN		     3
    911023 DUPONT	   SCIENCES		     1
    921102 LUCAS	   ROMAN		     2
    922143 REVEST	   NOUVELLE		     1
    901001 LEVEQUE	   HISTOIRE		     2
    911007 MARTIN	   NOUVELLE		     3
    911021 DUPONT	   ROMAN		     1
    911021 DUPONT	   NOUVELLE		     1
    911023 DUPONT	   ROMAN		     4
    902043 DUPONT	   NOUVELLE		     1
    901001 LEVEQUE	   ROMAN		     1
    902043 DUPONT	   SCIENCES		     2
    902075 RENARD	   ROMAN		     2
    911022 DUPONT	   NOUVELLE		     1

21 lignes selectionnees.

*/

prompt --- Q15 : Donner, pour chaque livre (numéro ISBN) ayant plus de deux exemplaires, le prix moyen d'achat des exemplaires.

SELECT l.isbn, titre, AVG(prix)
FROM Livre l JOIN Exemplaire e ON l.isbn=e.isbn
GROUP BY l.isbn, titre HAVING COUNT(*)>2;


/*
Résultat attendu :
ISBN		     TITRE						 AVG(PRIX)
-------------------- -------------------------------------------------- ----------
0_18_47892_2	     UNE ROSE POUR MORRISSON					50
9_782070_36	     LA PERLE						156.666667
3_505_13700_5	     LE GRAND VESTIAIRE 					63
1_104_1050_2	     LE MUR						36.3333333
1_22_1721_3	     LE NOM DE LA ROSE					       129
2_7296_0040	     GODEL ESCHER BACH : LES BRINS D UNE GUIRLANDE	       420

6 rows selected.


*/

prompt --- Q16 : Quel est l’abonné ayant effectué le plus d’emprunts ?

SELECT a.num_ab, nom, COUNT(num_ex)
FROM abonne a JOIN Emprunt em ON a.num_ab=em.num_ab
GROUP BY a.num_ab, nom, prenom
HAVING COUNT(num_ex)>=(SELECT MAX(COUNT(num_ex))
                        FROM abonne a JOIN Emprunt em ON a.num_ab=em.num_ab
                        GROUP BY nom, prenom);


/*
Résultat attendu :
    NUM_AB NOM
---------- ---------------
    911023 DUPONT
    911007 MARTIN
*/

prompt --- Q17 : Donnez, pour chaque livre (numéro ISBN et titre) emprunté au moins deux fois, son nombre d’exemplaires en catégorie "Exclu". 


SELECT l.isbn, titre, code_pret, COUNT(*)
FROM Livre l JOIN Exemplaire e ON l.isbn=e.isbn
GROUP BY l.isbn, titre, code_pret
HAVING COUNT(numero)>=2 AND code_pret='EXCLU';


/*
Résultat attendu :
ISBN		TITRE						   Nombre exemplaires
--------------- -------------------------------------------------- ------------------
2_7296_0040	GODEL ESCHER BACH : LES BRINS D UNE GUIRLANDE			    1

*/

prompt -- Q18 : Existe t'il des homonymes (NUM_AB, NOM) parmi les abonnés ? Attention dans le résultat il ne faut ne pas dupliquer l'information. Par exemple si deux abonnés s'appellent DUPOND le résultat à obtenir est : 
prompt -- 1 DUPOND
prompt -- 2 DUPOND



/*
VOTRE REPONSE ICI
*/

/*
Résultat attendu :
    NUM_AB NOM
---------- ---------------
    911021 DUPONT
    911022 DUPONT
    911023 DUPONT
    902043 DUPONT
*/


prompt --- Q19 : Existe-t-il des catégories de livres empruntées par tous les abonnés ?

/*
VOTRE REPONSE ICI
*/


/*
Résultat attendu :
CATEGORIE
----------------
NOUVELLE



*/

prompt -- Q20 : Quels sont les livres (numéro ISBN et titre) dont tous les exemplaires valent plus de 30 euros ?


/*
VOTRE REPONSE ICI
*/

/*
Résultat attendu :
ISBN		TITRE
--------------- --------------------------------------------------
0_12_27550_2	NEW APPLICATIONS OF DATABASES
0_15_270500_3	LE MIRACLE DE LA ROSE
0_18_47892_2	UNE ROSE POUR MORRISSON
0_201_14439_5	AN INTRODUCTION TO DATABASE SYSTEMS
0_85_4107_3	L ENFANT
1_104_1050_2	LE MUR
2_7296_0040	GODEL ESCHER BACH : LES BRINS D UNE GUIRLANDE
3_505_13700_5	LE GRAND VESTIAIRE

8 lignes selectionnees.



*/


prompt -- Q21 : Quels sont les livres (numéro ISBN et titre) dont tous les exemplaires valant plus de 30 euros ont été au moins trois fois empruntés ?

/*
VOTRE REPONSE ICI
*/

/*
Résultat attendu :
ISBN		TITRE
--------------- --------------------------------------------------
0_112_3785_5	POESIES COMPLETES
0_8_7707_2	BASES DE DONNEES RELATIONNELLES
0_26_28079_6	FUNDAMENTALS OF DATABASE SYSTEMS*/

prompt --- Q22 : Quels sont les livres caractérisés par exactement les mêmes mots clefs que l'ouvrage de numéro ISBN 0-8-7707-2 ? ATTENTION : bien regarder le livre 0_26_28079_6 et ses mots clés.
/*
VOTRE REPONSE ICI
*/

/*
Résultat attendu :
ISBN
---------------
0_201_14439_5
0_8_7707_2
*/







         




