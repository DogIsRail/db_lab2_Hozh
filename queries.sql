--інцидент, кількість жертв
SELECT incidentid, COUNT(incidentid) as amount_victim
FROM victim
GROUP BY incidentid
ORDER BY amount_victim DESC;
--доля стрільця, кількість
SELECT shooteroutcome, COUNT(incidentid) as amount_outcomes
FROM shooter
GROUP BY shooteroutcome
ORDER BY amount_outcomes DESC;
--рік, кількість інцидентів
SELECT yr, COUNT(inc) as amount_outcomes
FROM victim join (SELECT incident_id as inc, EXTRACT(YEAR FROM date) as yr
                          FROM incident) as t
ON inc = victim.incidentid
GROUP BY yr
ORDER BY yr DESC;