.print Question 2 --chengxua
SELECT DISTINCT moviePeople.pid, moviePeople.name 
FROM moviePeople, casts c1, casts c2, casts c3, movies 
WHERE LOWER(movies.title) = LOWER('The Shawshank Redemption')
AND c1.mid = movies.mid 
AND c1.pid = c2.pid 
AND c1.pid = c3.pid 
AND c1.mid <> c2.mid 
AND c2.mid <> c3.mid 
AND c1.mid <> c3.mid 
AND c1.pid = moviePeople.pid;