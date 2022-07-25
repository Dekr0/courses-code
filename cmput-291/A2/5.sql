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