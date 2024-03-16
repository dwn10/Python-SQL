# SQL - LT4V2 - Projekt
Verwendete Technologien:

```javascript
const Projects = {
  	code: ["HTML", "CSS", "Javascript", "SQL"],
	technologies: {
	devTool: ["VS-Code", "PHP MyAdmin", "Xampp", "DB-Diagram"]
	}
}
```


```sql
COMMENTS
/*
COMENTAROS
*/

-- Comentario en una lína

/*
Este
es
un
comentario
en
varias
líneas
*/
-- -----------------------------------------------
SELECT
-- Obtiene todos los datos de la tabla "users"
SELECT * FROM users;

-- Obtiene todos los nombres de la tabla "users"
SELECT name FROM users;

-- Obtiene todos los identificadores y nombres de la tabla "users"
SELECT user_id, name FROM users;
-- -----------------------------------------------
DISTINCT

-- Obtiene todos los datos distintos entre sí de la tabla "users"
SELECT DISTINCT * FROM users;

-- Obtiene todos los valores distintos referentes al atributo edad de la tabla "users"
SELECT DISTINCT age FROM users;

-- -----------------------------------------------

