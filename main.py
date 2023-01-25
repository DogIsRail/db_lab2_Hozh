import psycopg2
import matplotlib.pyplot as plt

username = 'tim'
password = 'tim'
database = 'tim'
host = 'localhost'
port = '5432'

query_1 = '''
SELECT incidentid, COUNT(incidentid) as amount_victim
FROM victim
GROUP BY incidentid
ORDER BY amount_victim DESC;
'''
query_2 = '''
SELECT shooteroutcome, COUNT(incidentid) as amount_outcomes
FROM shooter
GROUP BY shooteroutcome
ORDER BY amount_outcomes DESC;
'''
query_3 = '''
SELECT yr, COUNT(inc) as amount_outcomes
FROM victim join (SELECT incident_id as inc, EXTRACT(YEAR FROM date) as yr
                          FROM incident) as t
ON inc = victim.incidentid
GROUP BY yr
ORDER BY yr DESC;
'''

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)
print(type(conn))

with conn:
    print("Database opened successfully")
    cur = conn.cursor()

    print('1.Найбільша кількість жертв\n')
    cur.execute(query_1)
    for row in cur:
        print(row)

    print('2.Впіймані, не впіймані, вбиті стрілки і стрілки самогубці\n')
    cur.execute(query_2)
    for row in cur:
        print(row)

    print('3.Кількість інцидентів за роками\n')
    cur.execute(query_3)
    for row in cur:
        print(row)