# TP Integrador Final – Desarrollo Seguro con Java, Spring Boot y JWT

## Descripción del Proyecto

Este proyecto forma parte del Trabajo Final Integrador de la asignatura **"Programación Segura"**. Se trata de una API RESTful desarrollada en **Java** con **Spring Boot** que implementa autenticación y autorización segura mediante **JWT** y **OAuth2**, gestión de **roles** y **permisos**, **encriptación de contraseñas** y más.

La API gestiona:
- CRUD de **usuarios**, **roles** y **permisos**.
- CRUD de **productos** y **pedidos**.
- Autenticación segura mediante **JWT**.
- Asignación de roles y permisos según reglas de negocio.
- Acceso restringido a los endpoints solo para usuarios autenticados.

## Objetivo

El objetivo de este proyecto es validar los conocimientos técnicos sobre desarrollo seguro en **Java** mediante **Spring Boot**, **Spring Security** y **JWT**. A su vez, forma parte del portfolio profesional, demostrando habilidades en **diseño**, **implementación**, **seguridad** y **documentación** de APIs REST.

## Escenario de Implementación

Se ha desarrollado una API para una cadena de **ferretería** llamada "Security JWT App" que permite la gestión de usuarios, roles, permisos, productos y pedidos. Cumple con los siguientes requerimientos del cliente:

- CRUD de entidades de **usuario**, **productos** y **pedidos**.
- CRUD completo de **usuarios**, **roles** y **permisos**.
- **Autenticación segura** mediante **JWT**.
- **Asignación de roles** y **permisos** según reglas de negocio.
- Acceso a todos los endpoints solo para usuarios **autenticados**.

## Requerimientos y Cumplimiento

| Requerimiento               | Implementado                                                             |
| --------------------------- | ------------------------------------------------------------------------ |
| 1. Diagrama de clases       | ✅ DER entregado en `DER.png`                                             |
| 2. CRUD de entidades        | ✅ `UserSec`, `Role`, `Permission`, `Producto`, `Pedido`                  |
| 3. Endpoint `/auth/login`   | ✅ Implementado en `UserDetailsServiceImp.loginUser()`                    |
| 4. JWT                      | ✅ Implementado en `JwtUtils.java`, validado por `JwtTokenValidator.java` |
| 5. Roles/Permisos desde BD  | ✅ `@EntityGraph` para cargar roles y permisos con el usuario             |
| 6. OAuth2                   | ✅ Configurado login GitHub (via `spring.security.oauth2.client`)         |
| 7. BCrypt                   | ✅ Encriptación de contraseñas en `UserService` y `UserDetailsServiceImp` |
| 8. Annotations de seguridad | ✅ `@PreAuthorize` con `hasRole` y `hasAuthority`                         |
| 9. Usuarios de prueba       | ✅ Incluidos en `security.sql` (ADMIN, USER)                              |

## Modelo de Datos

El sistema incluye las siguientes entidades:

- **UserSec** (usuarios del sistema, con roles).
- **Role** (Admin, User, etc.).
- **Permission** (READ, CREATE, etc.).
- **Producto** (nombre, categoría, precio).
- **Pedido** (observaciones, fecha, productos relacionados).

### Relaciones:

- **UserSec** ⇔ **Role** (ManyToMany).
- **Role** ⇔ **Permission** (ManyToMany).
- **Pedido** ⇔ **Producto** (ManyToMany).

## Seguridad Aplicada

- **JWT**: El token es firmado con una clave secreta y contiene `username` y `authorities` como claims. La verificación y decodificación se realiza a través de `JwtUtils` y `JwtTokenValidator`.
  
- **Roles y Permisos**:
  - **ADMIN**: Acceso total (CRUD usuarios, roles, permisos, pedidos, productos).
  - **USER**: Acceso de lectura a pedidos y productos.

- **Anotaciones**:
  - `@PreAuthorize("hasRole('ADMIN')")` para operaciones sensibles.
  - `@PreAuthorize("hasAuthority('READ')")` para consultas.

- **OAuth2 Login**: Configurado el login con **GitHub**.

- **BCrypt**: Las contraseñas se encriptan antes de persistir en la base de datos.

## Instrucciones para ejecutar la aplicación

1. Clonar el repositorio.
2. Crear la base de datos MySQL llamada `security`.
3. Importar el archivo `security.sql` para crear las tablas necesarias.
4. Configurar las siguientes variables de entorno:

   ```bash
   export PRIVATE_KEY=tu_clave_privada_jwt
   export USER_GENERATOR=centro8-sec
   export SS_USER=centro8
   export SS_PASSWORD=1234
   export ROLE=ADMIN
   export GH_CLIENT_ID=tu_client_id_github
   export GH_CLIENT_SECRET=tu_client_secret_github

5.Ejecutar la aplicación con:
mvn spring-boot:run

Variables de entorno necesarias

    PRIVATE_KEY: Clave HMAC256 para la firma de los tokens JWT.

    USER_GENERATOR: Emisor (issuer) del token JWT.

    SS_USER: Usuario del sistema para autenticación.

    SS_PASSWORD: Contraseña del sistema para autenticación.

    ROLE: Rol por defecto del usuario (ADMIN, USER, etc.).

    GH_CLIENT_ID: ID del cliente de OAuth2 para la integración con GitHub.

    GH_CLIENT_SECRET: Secreto del cliente de OAuth2 para la integración con GitHub.

    Usuarios de prueba

    | Usuario | Rol     | Permisos                                             | Username | Password |
| ------- | ------- | ---------------------------------------------------- | -------- | -------- |
| Admin   | ADMIN   | CREATE, READ, UPDATE, DELETE                         | admin    | 1234     |
| Usuario | USER    | READ (Productos, Pedidos), CRUD Pedidos (sin DELETE) | user     | 1234     |
| Cliente | CLIENTE | Crear/leer/actualizar su propio pedido               | cliente  | 1234     |

Las contraseñas están encriptadas con BCrypt.
Tecnologías y Librerías

    Spring Boot 3.4.7

    Spring Security

    JWT (com.auth0)

    OAuth2 Login (GitHub)

    SpringDoc OpenAPI Swagger

    MySQL + JPA (Hibernate)

    Lombok

Testing

    Testing realizado sobre:

        Login con JWT.

        Acceso a recursos según rol (ADMIN vs USER).

        Creación y modificación de usuarios, roles y permisos.

        CRUD de productos y pedidos.

Recursos incluidos en el repositorio

    Proyecto Java Spring Boot completo (estructura Maven).

    Scripts SQL: security.sql.

    Diagrama DER: DER.png.

    Testing: Colección Postman (SecurityJWTITFPS.postman_collection.json).

    Documento de Testing: Documentacion_TIFPS.pdf
