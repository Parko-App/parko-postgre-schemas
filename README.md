# parko-postgre-schemas

Scripts SQL para modificaciones al schema de la base de datos central de Parko (`parko-db`).

## Uso

Cada cambio de schema es un archivo nuevo en `schemas/`, numerado en orden (`V1__`, `V2__`, ...).
Se aplican a mano, copiando y pegando el contenido del script en el cliente de DB (DBeaver, psql, etc) contra el ambiente correspondiente.

No editar un script ya aplicado — agregar uno nuevo con el siguiente número.
