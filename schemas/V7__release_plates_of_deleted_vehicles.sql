UPDATE vehicles
   SET plate = plate || '#' || id
 WHERE active = false
   AND plate NOT LIKE '%#%';
