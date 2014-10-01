### Most Popular Friend / Despliegue

### Status 
[![Build Status](https://travis-ci.org/alu0100595727/sytw_practica2_despliegue_heroku.svg?branch=master)](https://travis-ci.org/alu0100595727/sytw_practica2_despliegue_heroku)


Esta aplicación permite saber cual de los amigos(following) de una persona de twitter es mas popular, basado en el numero de followers que tiene.

Este proyecto ha sido implementado para el despliegue en heroku y contiene tests con seguimiento en travis.

Proyecto en Heroku: http://sytw-practica2.herokuapp.com/

### Modificaciones ultima practica

- Añadidas severas funcionalidades json. Ahora cada vez que se carga un usuario de twitter, la informacion de este y sus following se guarda en un fichero json.

- Añadido un checkbox que permite cargar los usuarios desde el fichero json

- Añadida una nueva ruta /json/"usuario" que permite ver este archivo en formato json en la web.

- Añadidos test e integracion continua y despliegue en heroku.
 

### Modo de uso

Antes de iniciar el servidor ejecutar `bundle install` o `rake bundle`

Para arrancar el servidor situese en el directorio y ejecute `rake` o `rake init` luego abra un navegador y vaya a la direccion localhost:4567

Para arrancar los test ejecutar `rake test`

**Jazer Abreu -> alu0100595727**

**Javier Clemente -> alu0100505023**

Sistemas y Tecnologias Web, ETSII, Universidad de la Laguna.
