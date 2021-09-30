SELECT nom, prenom, libelle, prix
FROM Travail t JOIN service s ON t.idserv=s.idservice
		JOIN voisin v ON t.idvois=v.idvoisin 
WHERE idservice IN (SELECT idserv
		  FROM Travail
		  WHERE prix> 63);
