.print Question 10 --chengxua
SELECT C.cid, C.name, 
GROUP_CONCAT(DISTINCT HM.recommended) as 'recommended movies' 
FROM customers C, watch W, hotMovies HM  
WHERE W.mid = HM.mid 
AND W.duration >= HM.runtime * 0.5 
AND C.cid = W.cid 
GROUP BY C.cid, C.name 
HAVING COUNT(HM.mid) >= 2;