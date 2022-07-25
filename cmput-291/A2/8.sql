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