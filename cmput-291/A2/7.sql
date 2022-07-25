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
