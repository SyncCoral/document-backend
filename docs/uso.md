### Usando Docker

1. Construye y levanta los contenedores:

```sh
docker-compose up --build
```
Listar los contenedores
```sh
docker ps

```
|CONTAINER ID |  IMAGE             |  COMMAND                |  CREATED        |   STATUS        |   PORTS                  |  NAMES            |
|-------------|--------------------|-------------------------|-----------------|-----------------|------------------------- |-------------------|
|e1fd25725f3e |  mkdocs            |  "mkdocs serve -a 0.0…" |  14 minutes ago |   Up 14 minutes |   0.0.0.0:9000->9000/tcp |  document-backend |
|4bcdda2dc31c |  auth-backend-auth |  "fastapi run app/mai…" |  5 days ago     |   Up 2 hours    |   0.0.0.0:8000->8000/tcp |  auth             |


Dentro de contenedor con el comando 
```sh
docker exec -it <container_id> sh
```

### Usando Python
## Nota:
Este proceso se puede realizar si hay tablas nuevas o si se cambian las relaciones
```sh
alembic revision --autogenerate -m ""
alembic upgrade head
```

3. Inicia la aplicación:
```sh
uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
```


## Nota:
Este proceso se realiza una sola vez.

## Crea una key para los tokens

Dentro del Contenedor Creamos una key con el comando del cli de la siguente manera 
Para generar una clave secreta aleatoria, usa el siguiente comando:
```sh
python3 main.py generatekey
```
Nos pedira que ingresemos el tamaño en bytes -> ejemplo 54

```sh
Ingrese el tamaño de bytes que usará para la key: 54
```


```sh
Secret Key: bce5670b4629406dc5af34decca3efdb97ea8c1eb1dfcbfcc48ba8877b120a002eae79c0b43aa7585f884fe8861ea1b4c4a5dbb95e63
Copy the key and paste it in the .env file
```
### Generar superadmin

Para generar un usuario admin, usa el siguiente comando:
```sh
python3 main.py createsuperadmin
```

``` Python
def createsuperadmin():
    """Crea un usuario administrador"""
    console.print("🚀 Creando usuario administrador...", style="bold green")
    first_name = Prompt.ask("Nombre")
    last_name = Prompt.ask("Apellido")
    email = Prompt.ask("Email")
    cellphone = Prompt.ask("Cellphone")
    username = Prompt.ask("Username")
    
```
## Ejemplo
```sh
🚀 Creando usuario administrador...
Nombre: jhon
Apellido: Doe
Email: jhondoe@correo.com
Cellphone: 1111111111
Username: jhondoe
Contraseña: 
Confirmar contraseña: 

```
