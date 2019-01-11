SELECT a.plant,
       a.date,
       a.leaf_count,
       b.date AS bolting_date
  FROM (
           SELECT plant,
                  max(date) AS date,
                  max(value) AS leaf_count
             FROM plant_phenotyping
            WHERE plant_trait = 1
            GROUP BY plant
       )
       a
       LEFT JOIN
       plant_phenotyping b ON a.plant = b.plant
 WHERE b.plant_trait = 3 AND 
       b.value = 1 AND 
       a.date < bolting_date;
