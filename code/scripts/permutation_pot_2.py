clear
%paste
%paste
conn
c = conn.cursor()
c.execute('select * from pot_position')
pot = c.fetchall()
pot
c.execute('select distinct container from _culture_container where transfer_date == "2016-04-27" order by container')
container = c.fetchall()
c.execute('select code from _culture_container where transfer_date == "2016-04-27" order by code')
code = c.fetchall()
container
code
code[::3]
container[0]
container[0]*2
container
container_column = [con*39 for con in container]
container_column[:3
]
container_column[0]
code_column = [cod*13 for cod in code]
code_column[0]
code_column[1]
code_column[0] + code_column[1]
sum(code_column[0])
len(code_column)
container
container/2
enumerate?
range?
range(0, 24, 3)
code_column = list()
code_column = [cod*13 for cod in code]
code_column
code_column_temp = [cod*13 for cod in code]
code_column = list()
range(0, 24, 3)
code_column = list()
for i in range(0, 24, 3):
    col = code_column_temp[i] + code_column_temp[i+1] + code_column_temp[i+2]
    code_column.append(col)
code_column
code_column[0]
len(code_column)
len(container_column)
import random
pot
random.shuffle(pot)
pot
pot[-1]
pot[:-1]
len(pot[:-1])
c.execute('select * from pot_position')
pot = c.fetchall()
pot
import csv
with open('plant_positions.csv', 'wb') as f:
    csv_out = csv.writer(f)
    for i, con in enumerate(container_column):
        random.shuffle(pot)
        for row in zip(pot[:-1], con, code_column[i])
            csv_out.writerow(*row)
with open('plant_positions.csv', 'wb') as f:
    csv_out = csv.writer(f)
    for i, con in enumerate(container_column):
        random.shuffle(pot)
        for row in zip(pot[:-1], con, code_column[i]):
            csv_out.writerow(*row)
with open('plant_positions.csv', 'wb') as f:
    csv_out = csv.writer(f)
    for i, con in enumerate(container_column):
        random.shuffle(pot)
        for row in zip(pot[:-1], con, code_column[i]):
            csv_out.writerow(row)
pot[0]
with open('plant_positions.csv', 'wb') as f:
    csv_out = csv.writer(f)
    for i, con in enumerate(container_column):
        random.shuffle(pot)
        for pos, c, d in zip(pot[:-1], con, code_column[i]):
            csv_out.writerow(pos + c + d)
with open('plant_positions.csv', 'wb') as f:
    csv_out = csv.writer(f)
    for i, con in enumerate(container_column):
        random.shuffle(pot)
        for pos, c, d in zip(pot[:-1], con, code_column[i]):
            csv_out.writerow(pos + (c) + (d))
with open('plant_positions.csv', 'wb') as f:
    csv_out = csv.writer(f)
    for i, con in enumerate(container_column):
        random.shuffle(pot)
        for pos, c, d in zip(pot[:-1], con, code_column[i]):
            csv_out.writerow(pos + tuple(c) + tuple(d))
with open('plant_positions.csv', 'wb') as f:
    csv_out = csv.writer(f)
    for i, con in enumerate(container_column):
        random.shuffle(pot)
        for pos, c, d in zip(pot[:-1], con, code_column[i]):
            csv_out.writerow(pos + [c] + [d])
with open('plant_positions.csv', 'wb') as f:
    csv_out = csv.writer(f)
    for i, con in enumerate(container_column):
        random.shuffle(pot)
        for pos, c, d in zip(pot[:-1], con, code_column[i]):
            csv_out.writerow(list(pos) + [c] + [d])
%history -f permutation_pot_2.python
