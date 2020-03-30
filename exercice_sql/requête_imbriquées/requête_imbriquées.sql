Use sakila;

-- 1.Avec une requête imbriquée sélectionner tout les acteurs ayant joués dans les films ou a joué « MCCONAUGHEY CARY »

SELECT DISTINCT TITLE, CONCAT(ACTOR.FIRST_NAME,' ', ACTOR.LAST_NAME) NAME FROM FILM F
	JOIN FILM_ACTOR ON F.FILM_ID = FILM_ACTOR.FILM_ID
    JOIN ACTOR ON FILM_ACTOR.ACTOR_ID = ACTOR.ACTOR_ID
		AND CONCAT(LAST_NAME, ' ', FIRST_NAME) <> 'MCCONAUGHEY CARY'
	WHERE EXISTS(
	SELECT FILM.FILM_ID, TITLE FROM FILM
		JOIN FILM_ACTOR ON FILM.FILM_ID = FILM_ACTOR.FILM_ID
        JOIN ACTOR ON FILM_ACTOR.ACTOR_ID = ACTOR.ACTOR_ID
        AND CONCAT(LAST_NAME, ' ', FIRST_NAME) = 'MCCONAUGHEY CARY'
	WHERE F.FILM_ID = FILM.FILM_ID)
    GROUP BY TITLE, NAME;
    
    

-- 2.Afficher tout les acteurs n’ayant pas joués dans les films ou a joué « MCCONAUGHEY CARY »

SELECT  CONCAT(ACTOR.FIRST_NAME,' ', ACTOR.LAST_NAME) NAME FROM FILM F
	JOIN FILM_ACTOR ON F.FILM_ID = FILM_ACTOR.FILM_ID
    JOIN ACTOR ON FILM_ACTOR.ACTOR_ID = ACTOR.ACTOR_ID
		AND CONCAT(LAST_NAME, ' ', FIRST_NAME) <> 'MCCONAUGHEY CARY'
	WHERE NOT EXISTS(
	SELECT FILM.FILM_ID, TITLE FROM FILM
		JOIN FILM_ACTOR ON FILM.FILM_ID = FILM_ACTOR.FILM_ID
        JOIN ACTOR ON FILM_ACTOR.ACTOR_ID = ACTOR.ACTOR_ID
        AND CONCAT(LAST_NAME, ' ', FIRST_NAME) = 'MCCONAUGHEY CARY'
	WHERE F.FILM_ID = FILM.FILM_ID)
    GROUP BY  NAME;
    
    -- 3.Afficher Uniquement le nom du film qui contient le plus d'acteur et le nombre d'acteurs associé sans utiliser LIMIT (2 niveaux de sous requêtes)

SELECT TITLE, COUNT(ACTOR_ID) AS NOMBRE_ACTEUR FROM FILM
	JOIN FILM_ACTOR ON FILM.FILM_ID = FILM_ACTOR.FILM_ID
    GROUP BY FILM.FILM_ID
    HAVING NOMBRE_ACTEUR = (
		SELECT MAX(A.CNT) FROM (
			SELECT COUNT(ACTOR_ID) CNT FROM FILM_ACTOR
				GROUP BY FILM_ID) A);
            

            
	
 -- 4.Afficher les acteurs ayant joué dans des films d’actions (Utiliser EXISTS).
 
 SELECT DISTINCT title, CONCAT(ACTOR.FIRST_NAME,' ', ACTOR.LAST_NAME) NAME FROM FILM F
	JOIN FILM_ACTOR ON F.FILM_ID = FILM_ACTOR.FILM_ID
    JOIN ACTOR ON FILM_ACTOR.ACTOR_ID = ACTOR.ACTOR_ID
	WHERE EXISTS(
	select title, CATEGORY.NAME
	from film
	join film_category
    on film.film_id = film_category.film_id
    join category
    on film_category.category_id = category.category_id
    where category.name like 'Action'
	);
		

  

 