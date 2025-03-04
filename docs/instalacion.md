
### Prerrequisitos

- Python 3.9+
- Docker y Docker Compose

### Instalación con Docker

```sh
git clone https://github.com/tu-repo/api-auth.git
cd api-auth
docker-compose up --build
```

## Configuración

1. Crea un archivo [.env](http://_vscodecontentref_/0) en la raíz del proyecto con el siguiente contenido:

```env
TYPE_DB=
HOST_DB=
USER_DB=
PASSWORD_DB=
NAME_DB=
PORT_DB=
ALGORITHM=
SECRET_KEY=
```



La API estará disponible en `http://localhost:8000`.

La documentacion de swagger estará disponible en `http://localhost:8000/docs`.

## Endpoints principales

| Método  | Endpoint                   | Descripción                                          |
|---------|----------------------------|------------------------------------------------------|
| POST    | `/api/auth/login`          | Iniciar sesión y obtener un token JWT                |
| GET     | `/api/auth/validate-token` | Validar si un token es válido                        |
| POST    | `/api/auth/refresh`        | Refrescar un token JWT                               |
| GET     | `/api/auth/logout`         | Cerrar sesión                                        |
| POST    | `/api/auth/password-reset` | Solicitar código para restablecer contraseña         |
| GET     | `/api/auth/verify-code/{username}/{code}` | Verificar código de restablecimiento de contraseña |
| PUT     | `/api/auth/password-change` | Cambiar contraseña con un código verificado         |

## Seguridad

- **JWT Tokens**: Se utilizan tokens de acceso y actualización.
- **Rate Limiting**: Protección contra abuso de solicitudes.
- **Registro de actividad**: Se guarda información sobre accesos y cambios de credenciales.

---

Para más detalles, consulta la sección de [Referencia de la API](api_reference.md).

