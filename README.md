# EXAMPLE_DOCKER

**example-docker** fue creado para revisar a detalle los comados mayormente  
utilizados en la dockerizacion de proyectos.Docker se esta convirtiendo en uno de los estandares  
mas usados en el ambito de la programcio de software y administracion de servidores.

### Resumen

**Requerimientos de proyecto**
+ Ruby 2.4
+ Rails 5
+ Postgres 

### Pasos para usar docker

1. Construir una la imagen docker
```bash
docker build -t="algunacuenta/example_docker:1" --build-arg port=8000 /source/dockerfile
```

2. Construir contenedor postgres
> El proyecto esta construido para realizar
<!-- -->
> persistencia a base detos postgres
```bash
docker run --name comunuty-postgres -d postgres
```

3. Construir contenedor de aplicación
```bash
docker run --name example-docker -P \
--link comunity-postgres:my-postgres \
-e DATABASE_URL="postgres://postgres:secretpassword@my-postgres/example_docker" \
-e SECRET_KEY_BASE="hellowordl" \
-d algunacuenta/example_docker:1
```
> El alias de ip dentro de la cadena de conexión
<!-- -->
> debe coincidir con el alias especificado en el --link (comunity-postgres:**my-postgres**)

4. Consultar puerto
```bash
docker port $(docker ps -l -q)
```
> Este paso es solo para obtener el puerto dentro del
<!-- -->
> host para realizar la prueba de exitos
<!-- -->
> el output del comando sera algo parecido a:
<!-- -->
> 3000/tcp -> **0.0.0.0:56895**