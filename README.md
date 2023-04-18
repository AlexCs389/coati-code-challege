# README

## Objetivo

Este repositorio se creo con la finalidad de la evaluacion de una prueba tecnica impuesta por la empresa Coati para una vacante Ruby on Rails.

## Intrucciones para la instalacion

* Instalar la version de `ruby 2.6`
* Instalar `rails` en la version `5.2.8.1`
* La base de datos este proyecto es `mysql`
* Debes agregar tus configuraciones de la base de datos a `credentials.yml.enc` con el comando `EDITOR="code --wait" bin/rails credentials:edit` ya para ver tus variables `rails credentials:show`
* Puedes conseguir el `master.key` [aqui](https://gist.github.com/AlexCs389/26b66319a3e3b5ac7a4c19785b89947d)
* Crear la base de datos `rake db:create`
* Ejecutar las migraciones `rake db:migrate`
* Levantar la aplicacion con `rails s` y dirigirse a `http://localhost:3000/`

## Pruebas

Las pruebas unitarias fueron desarrolladas con `Rspec` y se encuentra en `spec/controllers/import_data_spec.rb`. Para ejecutarlas debes correr el comando siguiente: `bundle exec rspec spec/controllers/import_data_spec.rb`

Esta prueba tiene tres contextos:
* Probando con un archivo valido
* Probando con un archivo invalido
* Probando con enviando un valor nulo en los parametros

## Notas
El archivo que se debe subir debe ser de tipo TSV (Valores separados por tabulaciones) segun lo especificado en la descripcion de la tarea que se proporciono.

No se implemento la parte de la autenticacion con OpenID.

