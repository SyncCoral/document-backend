# Documentación de la API de Organizaciones

## Endpoints

### Crear una organización

**Endpoint:**
```
POST /organization
```

**Descripción:**
Crea una nueva organización en el sistema.

**Parámetros:**
- `name` (str, requerido): Nombre de la organización.
- `description` (str, opcional): Descripción de la organización.
- `subscription_plan` (str, requerido): Plan de suscripción elegido.

**Respuesta:**
```json
{
    "id": 1,
    "name": "Mi Empresa",
    "description": "Una organización de prueba",
    "subscription_plan": "Premium",
    "is_active": true,
    "created_at": "2025-03-03T12:00:00",
    "owner": {
        "id": 10,
        "username": "admin",
        "fullname": "Admin User",
        "email": "admin@example.com",
        "cellphone": "123456789"
    },
    "users": []
}
```

---

### Obtener una organización por ID

**Endpoint:**
```
GET /organization/{organization_id}
```

**Descripción:**
Obtiene la información detallada de una organización específica, incluyendo su propietario y usuarios asociados.

**Parámetros:**
- `organization_id` (int, requerido): ID de la organización.

**Respuesta:**
```json
{
    "id": 1,
    "name": "Mi Empresa",
    "description": "Una organización de prueba",
    "subscription_plan": "Premium",
    "is_active": true,
    "created_at": "2025-03-03T12:00:00",
    "owner": {
        "id": 10,
        "username": "admin",
        "fullname": "Admin User",
        "email": "admin@example.com",
        "cellphone": "123456789"
    },
    "users": [
        {
            "id": 11,
            "username": "usuario1",
            "fullname": "Usuario Ejemplo",
            "email": "usuario1@example.com",
            "cellphone": "987654321"
        }
    ]
}
```

---

### Obtener todas las organizaciones

**Endpoint:**
```
GET /organizations
```

**Descripción:**
Obtiene la lista de todas las organizaciones registradas en el sistema.

**Respuesta:**
```json
[
    {
        "id": 1,
        "name": "Mi Empresa",
        "description": "Una organización de prueba",
        "subscription_plan": "Premium",
        "is_active": true,
        "created_at": "2025-03-03T12:00:00",
        "owner": {
            "id": 10,
            "username": "admin",
            "fullname": "Admin User",
            "email": "admin@example.com",
            "cellphone": "123456789"
        },
        "users": []
    }
]
```

---

## Seguridad
Todos los endpoints requieren autenticación mediante un token JWT válido, que debe enviarse en el encabezado `Authorization: Bearer <token>`.

## Límites de Rata (Rate Limiting)
Cada endpoint está protegido con restricciones de acceso según las reglas de `RATELIMITS["authenticated"]` para evitar el abuso del sistema.