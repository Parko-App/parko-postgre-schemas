-- Libera las patentes de los vehiculos ya borrados (soft-delete).
--
-- La columna vehicles.plate es UNIQUE a nivel global y el borrado solo ponia active = false, por lo que la
-- patente quedaba ocupada para siempre (tambien para su propio dueño). Desde esta version identity-service, al
-- borrar un vehiculo, guarda su patente como 'PATENTE#<id>'. Este script hace lo mismo con los vehiculos que ya
-- estaban borrados antes del cambio.
--
-- Idempotente: no toca las filas que ya tienen el sufijo. Largo maximo: 7 (patente) + 1 + 36 (uuid) = 44 < 50.
UPDATE vehicles
   SET plate = plate || '#' || id
 WHERE active = false
   AND plate NOT LIKE '%#%';
