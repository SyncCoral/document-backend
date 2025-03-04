# Documentación del Módulo de Autenticación

## Endpoints

### 1. Iniciar Sesión
**Endpoint:** `POST /login`

**Descripción:**
Permite a los usuarios iniciar sesión en el sistema y obtener un token de autenticación.

**Parámetros:**
- `username` (str, requerido): Nombre de usuario o correo.
- `password` (str, requerido): Contraseña del usuario.

**Respuesta:**
- `200 OK`: Retorna un token de acceso.
- `401 Unauthorized`: Credenciales incorrectas.
- `404 Not Found`: Usuario no encontrado.

**Ejemplo de Respuesta:**
```json
{
    "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "token_type": "bearer"
}
```

---

### 2. Validar Token
**Endpoint:** `GET /validate-token`

**Descripción:**
Verifica la validez de un token JWT.

**Parámetros:**
- `Authorization` (Header, requerido): Token JWT en formato `Bearer <token>`.

**Respuesta:**
- `200 OK`: Token válido.
- `401 Unauthorized`: Token inválido o expirado.
- `429 Too Many Requests`: Se excedió el límite de peticiones.

**Ejemplo de Respuesta:**
```json
{
    "message": "Token válido"
}
```

---

### 3. Refrescar Token
**Endpoint:** `POST /refresh`

**Descripción:**
Genera un nuevo token de acceso utilizando un refresh token.

**Parámetros:**
- `Authorization` (Header, requerido): Refresh token en formato `Bearer <token>`.

**Respuesta:**
- `200 OK`: Retorna un nuevo token de acceso.
- `401 Unauthorized`: Token inválido.
- `429 Too Many Requests`: Se excedió el límite de peticiones.

**Ejemplo de Respuesta:**
```json
{
    "access_token": "nuevo_token_jwt",
    "token_type": "bearer"
}
```

---

### 4. Cerrar Sesión
**Endpoint:** `GET /logout`

**Descripción:**
Revoca el token de autenticación del usuario.

**Parámetros:**
- `Authorization` (Header, requerido): Token JWT en formato `Bearer <token>`.

**Respuesta:**
- `200 OK`: Cierre de sesión exitoso.
- `401 Unauthorized`: Token inválido.
- `429 Too Many Requests`: Se excedió el límite de peticiones.

**Ejemplo de Respuesta:**
```json
{
    "message": "Cierre de sesión exitoso"
}
```

---

### 5. Restablecer Contraseña
**Endpoint:** `POST /password-reset`

**Descripción:**
Envía un código de recuperación de contraseña al correo del usuario.

**Parámetros:**
- `username` (str, requerido): Nombre de usuario.
- `email` (str, requerido): Correo electrónico registrado.

**Respuesta:**
- `200 OK`: Código enviado correctamente.
- `404 Not Found`: Usuario no encontrado.
- `429 Too Many Requests`: Se excedió el límite de peticiones.

**Ejemplo de Respuesta:**
```json
{
    "message": "Correo de recuperación enviado exitosamente."
}
```

---

### 6. Verificar Código de Recuperación
**Endpoint:** `GET /verify-code/{username}/{code}`

**Descripción:**
Valida el código de recuperación de contraseña.

**Parámetros:**
- `username` (str, requerido): Nombre de usuario.
- `code` (int, requerido): Código de verificación.

**Respuesta:**
- `200 OK`: Código válido.
- `400 Bad Request`: Código incorrecto o expirado.
- `404 Not Found`: Usuario no encontrado.
- `429 Too Many Requests`: Se excedió el límite de peticiones.

**Ejemplo de Respuesta:**
```json
{
    "message": "Código verificado correctamente. Puede proceder con el cambio de contraseña."
}
```

---

### 7. Cambiar Contraseña
**Endpoint:** `PUT /password-change`

**Descripción:**
Permite cambiar la contraseña de un usuario.

**Parámetros:**
- `username` (str, requerido): Nombre de usuario.
- `password` (str, requerido): Nueva contraseña.

**Respuesta:**
- `200 OK`: Contraseña cambiada exitosamente.
- `400 Bad Request`: Contraseña débil.
- `404 Not Found`: Usuario no encontrado.
- `429 Too Many Requests`: Se excedió el límite de peticiones.

**Ejemplo de Respuesta:**
```json
{
    "message": "Contraseña cambiada exitosamente."
}
```

---

## Seguridad
- Todos los endpoints utilizan `JWT` para autenticación.
- Se aplican límites de peticiones (`Rate Limiting`) para prevenir abusos.
- El cambio de contraseña requiere validación previa con un código enviado al correo.

