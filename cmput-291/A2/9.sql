.print Question 9 --chengxua
CREATE VIEW hotMovies AS 
SELECT M.mid, M.title, M.year, M.runtime, 
COUNT(DISTINCT W.cid) as watchCnt, 
R.recommended, R.score 
FROM movies M LEFT OUTER JOIN watch W ON M.mid = W.mid 
LEFT OUTER JOIN recommendations R ON M.mid = R.watched 
WHERE W.duration >= M.runtime * 0.5 
GROUP BY M.mid, M.title, M.year, M.runtime, R.recommended, R.score 
HAVING COUNT(DISTINCT W.cid) >= 5;