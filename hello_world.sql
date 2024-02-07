-- Notre premier script SQL. Ceci est un commentaire

-- Créer un nouvel utilisateur 'dev'
CREATE USER 'dev'@'localhost' IDENTIFIED BY 'password';

-- Créer une nouvelle base de données
CREATE DATABASE hello_world;

-- Donner tous les droits à dev sur la base hello_world
GRANT ALL PRIVILEGES ON hello_world.* TO 'dev'@'localhost';

-- Afficher les utilisateurs présents dans le système
SELECT User FROM mysql.user;