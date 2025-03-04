# Documentación de Roles

## Obtener Módulos

### **Endpoint:** `GET /modules`

### **Descripción:**
Obtiene la lista de módulos disponibles en el sistema para el usuario autenticado.

### **Autenticación:**
Este endpoint requiere autenticación mediante un token JWT válido.

### **Rate Limiting:**
Se aplica un límite de peticiones para usuarios autenticados definido en `RATELIMITS["authenticated"]`.

### **Parámetros:**
- **Authorization (Header, requerido)**: Se debe enviar un token JWT en el encabezado `Authorization` con el formato `Bearer <token>`.

### **Respuesta:**
#### **Código 200 - OK**
Si la solicitud es exitosa, devuelve un JSON con la lista de módulos:
```json
[
    {
        "id": 1,
        "nombre": "Gestión de Usuarios",
        "descripcion": "Permite administrar los usuarios del sistema.",
        "is_active": true,
        "is_deleted": false
    },
    {
        "id": 2,
        "nombre": "Reportes",
        "descripcion": "Acceso a la generación de reportes.",
        "is_active": true,
        "is_deleted": false
    }
]
```

#### **Código 401 - Unauthorized**
Si el token es inválido o ha expirado:
```json
{
    "detail": "Token inválido"
}
```

#### **Código 429 - Too Many Requests**
Si se excede el límite de peticiones:
```json
{
    "detail": "Too