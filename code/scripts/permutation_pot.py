import sqlite3
import csv

# connection settings

conn = sqlite3.connect('experiment.sqlite')
conn.row_factory = sqlite3.Row

# parameters

DATE = '2016-05-10'
TRAYSIZE = 40
CULTURES_PER_TRAY = 3

# variables used for query

plants_per_tray = TRAYSIZE - (TRAYSIZE % CULTURES_PER_TRAY)
plants_per_culture = plants_per_tray/CULTURES_PER_TRAY

# query database and assign permuted pot positions to cultures for each container

def blowup(list_, times=None):
    list_blownup = list()
    for element in list_:
        list_blownup += [element]*times
    return list_blownup

sql_pot = '''
SELECT * FROM pot_position
ORDER BY random()
LIMIT ?
'''

sql_culture = '''
SELECT culture_container.id,
       culture_container.container
  FROM culture_container,
       container
 WHERE culture_container.container = container.id AND 
       container.preparation_date = ?
'''

sql_insert = '''
INSERT INTO plant_position (pot_position, culture_container)
     VALUES (?, ?)
'''

culture_container = conn.execute(sql_culture, (DATE,)).fetchall()

container = set(rec['container'] for rec in culture_container)

with open('plant_positions_E3B2.csv', 'wb') as f:
    csv_out = csv.writer(f)

    for c in container:

        culture = [rec['id'] for rec in culture_container if rec['container'] == c]

        culture_column = blowup(culture, times=plants_per_culture)

        pot_column = [rec['id'] for rec in conn.execute(sql_pot, (plants_per_tray,))]

        plant_positions = zip(pot_column, culture_column)

        for row in plant_positions:
            csv_out.writerow(row)

        conn.executemany(sql_insert, plant_positions)
        conn.commit()

# close connection to DB

conn.close()
