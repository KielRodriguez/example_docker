# Imagen base
FROM ruby:2.4.2-jessie

# Administrador del dockerfile
MAINTAINER kr.rdz.20@gmail.com

#Actualización de paquetes
RUN apt-get update -y

# Instalacion de paquetes necesarios
RUN apt-get install -y vim curl nodejs

# Creación del directorio del proyecto
RUN ["mkdir", "-p", "/project"]

# Pocisionarse en directorio del proyecto
WORKDIR /project

# Add Gemfile to directory project
ADD Gemfile /project/Gemfile

# Add Gemfile.lock to directory project
ADD Gemfile.lock /project/Gemfile.lock

# Instalacion de manejador de paquetes rails
RUN ["gem", "install", "bundler", "-v", "1.17.3"]

# Instalacion de paquetes
RUN ["bundle", "install"]

# Agregar contenido de proyecto al directorio de proyecto
ADD . /project

# Usar entorno de produccion en rails (debe existir base de datos productiva)
ENV RAILS_ENV=production

# Crear metadatos de la aplicacion
LABEL description="Ruby on rails project, test use dockerfile"

# Definiendo valor por default del puerto (esto se puede sobreescribir)
ARG port=8000

# Exponiendo puerto
EXPOSE 3000

# Ejemplo de entrypoint no sirve de nada
# ENTRYPOINT echo ${port}

RUN echo ${port}

# Proceso de ejecución del contenedor
CMD bundle exec puma -C config/puma.rb
