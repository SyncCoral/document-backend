# Estructura del Proyecto

Este documento describe la estructura del proyecto, detallando la función de cada carpeta y archivo clave.

## Archivos Raíz

- `CONTRIBUTORS.md`: Lista de colaboradores del proyecto.
- `CHANGELOG.md`: Registro de cambios en cada versión.
- `Dockerfile`: Archivo de configuración para crear la imagen Docker.
- `LICENSE`: Licencia del proyecto.
- `README.md`: Documentación principal del proyecto.
- `SECURITY.md`: Información sobre seguridad y vulnerabilidades.
- `alembic.ini`: Configuración de Alembic para migraciones de base de datos.
- `cargue.sql`: Script SQL para carga inicial de datos.
- `docker-compose.yml`: Configuración de Docker Compose.
- `main.py`: Punto de entrada principal del proyecto.
- `requirements.txt`: Lista de dependencias del proyecto.

## Directorios

### `app`
```tree
.
├── CONTRIBUTORS.md
├── CHANGELOG.md
├── Dockerfile
├── LICENSE
├── README.md
├── SECURITY.md
├── alembic.ini
├── app
│   ├── __init__.py
│   ├── api
│   │   ├── application
│   │   │   ├── interface
│   │   │   │   ├── interface_modules_adapter.py
│   │   │   │   ├── interface_organizations_adapter.py
│   │   │   │   ├── interface_permission_adapter.py
│   │   │   │   ├── interface_roles_adapter.py
│   │   │   │   └── interface_user_adapter.py
│   │   │   ├── use_cases.py
│   │   │   ├── use_modules.py
│   │   │   ├── use_organization.py
│   │   │   ├── use_permission.py
│   │   │   └── use_roles.py
│   │   ├── auth
│   │   │   ├── auth.py
│   │   │   ├── encript.py
│   │   │   ├── hashing.py
│   │   │   └── token.py
│   │   ├── entrypoints
│   │   │   ├── module_router.py
│   │   │   ├── organizations_router.py
│   │   │   ├── permissions_router.py
│   │   │   ├── roles_router.py
│   │   │   └── user_router.py
│   │   ├── routes.py
│   │   └── schemas
│   │       ├── auth_schema.py
│   │       ├── organizations_schema.py
│   │       └── rol_schema.py
│   ├── core
│   │   ├── config.py
│   │   ├── database.py
│   │   └── rate_limit.py
│   ├── dependencies
│   │   ├── conection.py
│   │   ├── cors.py
│   │   ├── email_send.py
│   │   ├── generate_code.py
│   │   ├── location.py
│   │   ├── logging_config.py
│   │   └── message.py
│   ├── domain
│   │   ├── components.py
│   │   ├── modules.py
│   │   ├── organizations.py
│   │   ├── payment.py
│   │   ├── permissions.py
│   │   ├── relations
│   │   │   ├── module_rol.py
│   │   │   ├── rol_permission.py
│   │   │   ├── user_code_password.py
│   │   │   ├── user_module.py
│   │   │   ├── user_permission.py
│   │   │   ├── user_rol.py
│   │   │   ├── users_organization.py
│   │   │   └── users_token.py
│   │   ├── roles.py
│   │   ├── sesiones.py
│   │   └── users.py
│   ├── infrastructure
│   │   ├── module_repository.py
│   │   ├── organization_repository.py
│   │   ├── permission_repository.py
│   │   ├── repositories.py
│   │   └── roles_repository.py
│   ├── main.py
│   ├── middleware
│   │   └── middlewares.py
│   └── tests
│       ├── test_connection.py
│       └── test_main.py
├── cargue.sql
├── cli
│   ├── __init__.py
│   ├── createpermission.py
│   ├── createsuperadmin.py
│   └── generatekey.py
├── docker-compose.yml
├── main.py
├── migrations
│   ├── README
│   ├── env.py
│   ├── script.py.mako
│   └── versions
│       ├── a516ccffbe8a_add_model_sessions.py
│       ├── a9ee29d470c6_fix_relationship_between_users_and_.py
│       ├── b7151f40e09a_add_model_sessions.py
│       ├── da893587d6b8_update_users_and_organizations_models.py
│       ├── edf927787bb9_corregir_relaciones_entre_users_roles_y_.py
│       ├── eee002796fb9_info_de_token.py
│       ├── ef13cb2e79a5_corrige_relación_usuarios_y_roles.py
│       └── f5164e61a5e2_fix_rol_permission_table.py
└── requirements.txt
```

Código principal del backend.

- `api/`
  - `application/`: Lógica de aplicación y casos de uso.
    - `interface/`: Adaptadores de interfaz para comunicación entre capas.
    - `use_cases.py`, `use_modules.py`, etc.: Implementaciones específicas de casos de uso.
  - `auth/`: Módulos de autenticación.
    - `auth.py`: Manejo de autenticación.
    - `encript.py`, `hashing.py`: Funciones de cifrado.
    - `token.py`: Gestión de tokens.
  - `entrypoints/`: Rutas de entrada de la API.
  - `routes.py`: Definición de rutas principales.
  - `schemas/`: Esquemas de datos y validación.

- `core/`: Configuración y utilidades esenciales.
  - `config.py`: Configuración del sistema.
  - `database.py`: Conexión a la base de datos.
  - `rate_limit.py`: Implementación de rate limiting.

- `dependencies/`: Dependencias inyectables y utilidades.
  - `conection.py`: Conexión a servicios externos.
  - `cors.py`: Configuración de CORS.
  - `email_send.py`, `generate_code.py`, etc.: Servicios auxiliares.

- `domain/`: Modelos y lógica de negocio.
  - `relations/`: Relaciones entre modelos.

- `infrastructure/`: Repositorios y acceso a datos.

- `middleware/`: Middlewares personalizados.

- `tests/`: Pruebas automatizadas.
  - `test_connection.py`: Pruebas de conexión.
  - `test_main.py`: Pruebas del sistema principal.

### `cli`

Scripts de línea de comandos.
- `createpermission.py`, `createsuperadmin.py`: Scripts de administración.

### `migrations`

Manejo de migraciones de base de datos con Alembic.
- `versions/`: Archivos de migración específicos.

## Notas Adicionales

Este proyecto sigue una arquitectura modular y limpia, asegurando una separación clara entre capas de aplicación, infraestructura y dominio.

