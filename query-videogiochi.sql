--QUERY SELECT

--1- Selezionare tutte le software house americane (3)
select *
from software_houses
where country = 'United States';

--2- Selezionare tutti i giocatori della città di 'Rogahnland' (2)
select *
from players
where city = 'Rogahnland';

--3- Selezionare tutti i giocatori il cui nome finisce per "a" (220)
select *
from players
where name like '%a';

--4- Selezionare tutte le recensioni scritte dal giocatore con ID = 800 (11)
select *
from reviews
where player_id = 800;


--5- Contare quanti tornei ci sono stati nell'anno 2015 (9)
select *
from tournaments
where year = 2015;

--6- Selezionare tutti i premi che contengono nella descrizione la parola 'facere' (2)
select *
from awards
where description like '%facere%';

--7- Selezionare tutti i videogame che hanno la categoria 2 (FPS) o 6 (RPG), mostrandoli una sola volta (del videogioco vogliamo solo l'ID) (287)
select distinct videogame_id
from category_videogame
where category_id = 2 or category_id = 6

--8- Selezionare tutte le recensioni con voto compreso tra 2 e 4 (2947)
select *
from reviews
where rating between 2 and 4

--9- Selezionare tutti i dati dei videogiochi rilasciati nell'anno 2020 (46)
select *
from videogames
where release_date like '2020%'

--10- Selezionare gli id dei videogame che hanno ricevuto almeno una recensione da 5 stelle, mostrandoli una sola volta (443)
select distinct videogame_id
from reviews
where rating = 5

--*********** BONUS ***********

--11- Selezionare il numero e la media delle recensioni per il videogioco con ID = 412 (review number = 12, avg_rating = 3)
select *
from reviews
where videogame_id = 412

select avg(rating)
from reviews
where videogame_id = 412


--12- Selezionare il numero di videogame che la software house con ID = 1 ha rilasciato nel 2018 (13)
select * 
from videogames
where software_house_id = 1 
and release_date like '2018%'


--QUERY CON GROUPBY

--1- Contare quante software house ci sono per ogni paese (3)
select count(id)
from software_houses
group by country

--2- Contare quante recensioni ha ricevuto ogni videogioco (del videogioco vogliamo solo l'ID) (500)
select count(id)
from reviews
group by videogame_id

--3- Contare quanti videogiochi hanno ciascuna classificazione PEGI (della classificazione PEGI vogliamo solo l'ID) (13)
select count(videogame_id)
from pegi_label_videogame
group by pegi_label_id

--4- Mostrare il numero di videogiochi rilasciati ogni anno (11)
select count(id)
from videogames
group by DATEPART(year, release_date)

--5- Contare quanti videogiochi sono disponbiili per ciascun device (del device vogliamo solo l'ID) (7)
select count(id)
from device_videogame
group by device_id

--6- Ordinare i videogame in base alla media delle recensioni (del videogioco vogliamo solo l'ID) (500)
select videogame_id
from reviews
group by videogame_id
order by avg(rating)

--QUERY CON JOIN

--1- Selezionare i dati di tutti giocatori che hanno scritto almeno una recensione, mostrandoli una sola volta (996)
Select distinct players.id, players.name, players.lastname
from reviews
INNER JOIN players 
on player_id = players.id;

--2- Sezionare tutti i videogame dei tornei tenuti nel 2016, mostrandoli una sola volta (226)
select distinct videogames.id, videogames.name, tournaments.year
from tournament_videogame
inner join tournaments
on tournaments.id = tournament_id
inner join videogames
on videogames.id = videogame_id
where tournaments.year = 2016



--3- Mostrare le categorie di ogni videogioco (1718)
select categories.name, videogame_id
from category_videogame
inner join categories
on categories.id = category_id

--4- Selezionare i dati di tutte le software house che hanno rilasciato almeno un gioco dopo il 2020, mostrandoli una sola volta (6)
select distinct software_houses.name, software_houses.city
from videogames
inner join software_houses
on software_house_id = software_houses.id
where videogames.release_date like '2020%'

--5- Selezionare i premi ricevuti da ogni software house per i videogiochi che ha prodotto (55)
select awards.name
from award_videogame
inner join awards
on awards.id = award_id
inner join videogames 
on videogames.id = videogame_id
inner join software_houses
on software_houses.id = software_house_id

--6- Selezionare categorie e classificazioni PEGI dei videogiochi che hanno ricevuto recensioni da 4 e 5 stelle, mostrandole una sola volta (3363)


--7- Selezionare quali giochi erano presenti nei tornei nei quali hanno partecipato i giocatori il cui nome inizia per 'S' (474)

--8- Selezionare le città in cui è stato giocato il gioco dell'anno del 2018 (36)

--9- Selezionare i giocatori che hanno giocato al gioco più atteso del 2018 in un torneo del 2019 (3306)


--*********** BONUS ***********

--10- Selezionare i dati della prima software house che ha rilasciato un gioco, assieme ai dati del gioco stesso (software house id : 5)

--11- Selezionare i dati del videogame (id, name, release_date, totale recensioni) con più recensioni (videogame id : 398)

--12- Selezionare la software house che ha vinto più premi tra il 2015 e il 2016 (software house id : 1)

--13- Selezionare le categorie dei videogame i quali hanno una media recensioni inferiore a 1.5 (10)