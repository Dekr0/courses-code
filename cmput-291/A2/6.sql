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
