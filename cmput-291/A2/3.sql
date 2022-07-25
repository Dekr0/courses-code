.print Question 3 --chengxua
SELECT DISTINCT R.recommended, M2.title 
FROM casts C, moviePeople MP, movies M1, movies M2, recommendations R 
WHERE LOWER(MP.name) = LOWER('Morgan Freeman') 
AND C.pid = MP.pid 
AND M1.mid = C.mid 
AND M1.mid = R.watched 
AND R.recommended = M2.mid 
AND M2.year = STRFTIME('%Y', 'now');