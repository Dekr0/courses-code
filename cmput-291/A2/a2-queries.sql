.echo on
.print Question 1 --chengxua
SELECT DISTINCT w.cid, r.recommended 
FROM watch w, recommendations r, movies m 
WHERE r.watched = w.mid 
AND w.mid = m.mid 
AND w.duration >= m.runtime * 0.5 
ORDER BY score DESC;

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

.print Question 3 --chengxua
SELECT DISTINCT R.recommended, M2.title 
FROM casts C, moviePeople MP, movies M1, movies M2, recommendations R 
WHERE LOWER(MP.name) = LOWER('Morgan Freeman') 
AND C.pid = MP.pid 
AND M1.mid = C.mid 
AND M1.mid = R.watched 
AND R.recommended = M2.mid 
AND M2.year = STRFTIME('%Y', 'now');

.print Question 4 --chengxua
SELECT s.cid, c.name, strftime('%Y-%m', s.sdate) as month, COUNT(w.mid) as quantity 
FROM customers c, movies m, sessions s, watch w 
WHERE julianday('now')-julianday(s.sdate) < 365 
AND s.cid = c.cid 
AND s.sid = w.sid 
AND w.mid = m.mid 
AND w.duration >= m.runtime * 0.5 
GROUP BY s.cid, DATE(s.sdate, 'start of month'), c.name;

.print Question 5 --chengxua
SELECT s1.cid, c.name 
FROM sessions s1, customers c 
WHERE s1.cid = c.cid
GROUP BY s1.cid, c.name 
HAVING SUM(s1.duration) > 20 
AND EXISTS 
(SELECT s2.cid FROM sessions s2 
WHERE s1.cid == s2.cid 
AND s2.duration < 5 
GROUP BY s2.cid);

.print Question 6 --chengxua
SELECT C.cid, C.name, 
COUNT(S1.sid) as 'Number of Session', 
SUM(IFNULL(S1.duration, 0)) as 'Total Duration of the Sessions', 
IFNULL(WM.numMid, 0) as 'Number of Movies' 
FROM customers C 
LEFT OUTER JOIN sessions S1 ON C.cid = S1.cid 
LEFT OUTER JOIN (SELECT W.cid, COUNT(W.mid) as numMid 
FROM watch W, movies M 
WHERE W.mid = M.mid 
AND W.duration >= M.runtime * 0.5 
GROUP BY W.cid) WM ON C.cid = WM.cid 
GROUP BY C.cid, C.name;

.print Question 7 --chengxua
SELECT DISTINCT C.pid, MP.name, COUNT(DISTINCT W.cid) 
FROM moviePeople MP 
LEFT OUTER JOIN casts C ON MP.pid = C.pid 
LEFT OUTER JOIN follows F ON C.pid = F.pid 
LEFT OUTER JOIN watch W ON F.cid = W.cid 
LEFT OUTER JOIN movies M ON M.mid = W.mid
WHERE C.pid IS NOT NULL  
AND W.cid IS NOT NULL 
AND W.duration >= M.runtime * 0.5 
GROUP BY C.pid, MP.name;

.print Question 8 --chengxua
SELECT M.mid, M.title
FROM movies M 
LEFT OUTER JOIN casts C ON M.mid = C.mid 
WHERE C.pid IN (SELECT C.pid 
FROM follows F 
WHERE C.pid = F.pid 
GROUP BY F.pid 
HAVING COUNT(F.cid) >= 2)
GROUP BY M.mid, M.title 
HAVING COUNT(C.pid) >= 3;

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

.print Question 10 --chengxua
SELECT C.cid, C.name, 
GROUP_CONCAT(DISTINCT HM.recommended) as 'recommended movies' 
FROM customers C, watch W, hotMovies HM  
WHERE W.mid = HM.mid 
AND W.duration >= HM.runtime * 0.5 
AND C.cid = W.cid 
GROUP BY C.cid, C.name 
HAVING COUNT(HM.mid) >= 2;