1. afficher tous les emprunt ayant été réalisé en 2006; le mois doit être écrit en toute lettre et le résultat doit s'afficher dans une seule colonne :

SELECT CASE MONTH(rental_date)
         WHEN 1 THEN 'janvier'
         WHEN 2 THEN 'février'
         WHEN 3 THEN 'mars'
         WHEN 4 THEN 'avril'
         WHEN 5 THEN 'mai'
         WHEN 6 THEN 'juin'
         WHEN 7 THEN 'juillet'
         WHEN 8 THEN 'août'
         WHEN 9 THEN 'septembre'
         WHEN 10 THEN 'octobre'
         WHEN 11 THEN 'novembre'
         ELSE 'décembre'
END
FROM rental WHERE  year (rental_date) = 2006 ;

2. afficher la colonne qui donne la durée de location des film en jour:

SELECT DATEDIFF( return_date, rental_date ) FROM rental;

3. afficher les emprunts réalisés avant 1h du matin en 2005. Afficher la date dans un format lisible

SELECT rental_date FROM rental WHERE year (rental_date) = 2005 AND hour (rental_date) < 01;

4. afficher les emprunts réalisé entre le mois d'avril et le mois de mai. La liste doit trié du plus ancien au plus récent 

SELECT rental_date FROM rental where month (rental_date) between 04 and 05 order by rental_date;
  
5. lister les film dont le nom ne commence pas par le "le"

SELECT title from film WHERE title  NOT LIKE 'le%';

6. Lister les films ayant la mention « PG-13 » ou « NC-17 ». Ajouter une colonne qui
affichera « oui » si « NC-17 » et « non » Sinon

SELECT title,
 CASE (rating)
	when 'NC-17' THEN 'oui'
    when 'PG-13' then 'non'
end from film;

7. Fournir la liste des catégorie qui commence par un ‘A’ ou un ‘C’. (Utiliser LEFT)

SELECT name FROM category 
WHERE (LEFT(name,1)='A') OR (LEFT(name,1)='C');

8. Lister les trois premiers caractères des noms des catégorie

SELECT LEFT(name,3) FROM category ;

9. Lister les premiers acteurs en remplaçant dans leur prénom les E par des A
