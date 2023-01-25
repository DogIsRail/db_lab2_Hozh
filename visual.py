import psycopg2
import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd

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

    cur.execute(query_1)
    incident = []
    amount_victims = []
    for row in cur:
        incident.append(row[0])
        amount_victims.append(row[1])

    cur.execute(query_2)
    outcome = []
    amount_shooters = []
    for row in cur:
        outcome.append(row[0])
        amount_shooters.append(row[1])

    cur.execute(query_3)
    victims_number = []
    year = []
    for row in cur:
        victims_number.append(row[1])
        year.append(row[0])

fig, (bar_ax, pie_ax, dot_ax) = plt.subplots(1, 3)

bar_ax.set_title('Кількість жертв до кожного інцидента')
bar_ax.set_xlabel('Інцидент')
bar_ax.set_ylabel('Кількість')
bar_ax.bar(incident, amount_victims)
fig.autofmt_xdate(rotation=90)

pie_ax.pie(amount_shooters, labels=outcome)
pie_ax.set_title('Доля самогубців')

data_query_3 = pd.DataFrame({'number of victims': victims_number, 'year': year})
dot_ax.set_title('Кількість інцидентів за роками')
sns.scatterplot(data=data_query_3, x='number of victims', y='year', ax=dot_ax)
fig.autofmt_xdate(rotation=90)

plt.get_current_fig_manager().resize(1900, 900)
plt.subplots_adjust(left=0.1,
                    bottom=0.321,
                    right=0.9,
                    top=0.967,
                    wspace=0.76,
                    hspace=0.195)
plt.show()