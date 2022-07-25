.print Question 4 --chengxua
SELECT s.cid, c.name, strftime('%Y-%m', s.sdate) as month, COUNT(w.mid) as quantity 
FROM customers c, movies m, sessions s, watch w 
WHERE julianday('now')-julianday(s.sdate) < 365 
AND s.cid = c.cid 
AND s.sid = w.sid 
AND w.mid = m.mid 
AND w.duration >= m.runtime * 0.5 
GROUP BY s.cid, DATE(s.sdate, 'start of month'), c.name;