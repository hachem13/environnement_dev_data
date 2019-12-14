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


1. Lister les 10 premiers films ainsi que leur langues.

select title, name as langue
	from film
    left join language
    on film.language_id = language.language_id
    limit 10;
    
    
2. Afficher les film dans les quel à joué « JENNIFER DAVIS » sortie en 2006.

select title, first_name, last_name
	from film
    inner join film_actor
    on film.film_id = film_actor.film_id
    inner join actor
    on film_actor.actor_id = actor.actor_id
    where concat(first_name, ' ', last_name) like 'JENNIFER DAVIS';
    where first_name like 'JENNIFER' and last_name like 'DAVIS';


3. Afficher le noms des client ayant emprunté « ALABAMA DEVIL ».

select first_name, last_name, title
	from customer
    inner join rental
    on customer.customer_id = rental.customer_id
    inner join inventory
    on rental.inventory_id = inventory.inventory_id
    inner join film
    on inventory.film_id = film.film_id
    where title like 'ALABAMA DEVIL';
    
    
    
4. Afficher les films louer par des personne habitant à « Woodridge ».

select city, first_name, last_name, title
	from customer
    inner join address
    on customer.address_id = address.address_id
	inner join city
    on address.city_id = city.city_id
    inner join rental
    on customer.customer_id = rental.customer_id
    inner join inventory
    on rental.inventory_id = inventory.inventory_id
    inner join film
    on inventory.film_id = film.film_id
    where city like 'Woodrige';

4.bis. Vérifié s’il y a des films qui n’ont jamais été emprunté.
select distinct title, inventory.inventory_id
	from film
    inner join inventory
    on film.film_id = inventory.film_id
    left join rental
    on inventory.inventory_id = rental.inventory_id
    where inventory.inventory_id is null;
    
    
5. Quel sont les 10 films dont la durée d’emprunt à été la plus courte ?

select distinct title, datediff(return_date, rental_date) as duree_de_location
	from film
    inner join inventory
    on film.film_id = inventory.film_id
    left join rental
    on inventory.inventory_id = rental.inventory_id
    having duree_de_location >= 0
    order by duree_de_location 
    limit 10;

    
6. Lister les films de la catégorie « Action » ordonnés par ordre alphabétique.

select title, category.name
	from film
	inner join film_category
    on film.film_id = film_category.film_id
    inner join category
    on film_category.category_id = category.category_id
    where category.name like 'Action';


7. Quel sont les films dont la duré d’emprunt à été inférieur à 2 jour ?

select distinct title, datediff(return_date, rental_date) as duree_de_location
	from film
    inner join inventory
    on film.film_id = inventory.film_id
    left join rental
    on inventory.inventory_id = rental.inventory_id
    having duree_de_location < 2
    order by duree_de_location;
 