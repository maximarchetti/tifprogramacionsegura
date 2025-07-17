CREATE DATABASE security;

use security;

INSERT INTO users (username, password, enabled, account_not_expired, account_not_locked, credential_not_expired)
VALUES ('centro8', '$2a$10$WZIyRjoXyPTzIJAw1brt7O7E1F5ZA4wLyxNUZNPBjgRLPfDl.iL0i', 1, 1, 1, 1);

-- Si el rol ADMIN no existe:
INSERT INTO roles (role) VALUES ('ADMIN');


-- Asociamos el usuario al rol (ajustamos los nombres de las columnas/tablas según nuestro modelo)
INSERT INTO user_roles (user_id, role_id)
VALUES (
    (SELECT id FROM users WHERE username = 'centro8'),
    (SELECT id FROM roles WHERE role = 'ADMIN')
);


-- Asociaciones de permisos READ, UPDATE, CREATE Y DELETE al rol ADMIN 

SELECT id FROM roles WHERE role = 'ADMIN'; 
SELECT id FROM permissions WHERE permission_name = 'READ'; 
SELECT id FROM permissions WHERE permission_name = 'UPDATE'; 
SELECT id FROM permissions WHERE permission_name = 'CREATE';
 SELECT id FROM permissions WHERE permission_name = 'DELETE';


 -- Insertamos las asociaciones en la tabla de enlace 

INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1); -- ADMIN - READ 


INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 2); -- ADMIN - UPDATE 

INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 3); -- ADMIN - CREATE 

INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 4); -- ADMIN – DELETE


 -- Verifica la asociación 

SELECT * FROM roles_permissions WHERE role_id = 1;