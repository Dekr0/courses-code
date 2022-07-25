.print Question 1 --chengxua
SELECT DISTINCT w.cid, r.recommended 
FROM watch w, recommendations r, movies m 
WHERE r.watched = w.mid 
AND w.mid = m.mid 
AND w.duration >= m.runtime * 0.5 
ORDER BY score DESC;