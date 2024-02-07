-- Un jeu de données test

USE game ;

DELETE FROM
    game;

DELETE FROM
    criterion;

DELETE FROM
    user;

DELETE FROM
    rate;

INSERT INTO
    user(user_id, pseudo, password)
VALUES
    (1, 'enzo', 'password'),
    (2, 'julie', 'password');

INSERT INTO
    game(game_id, name)
VALUES
    (1, 'Elden Ring'),
    (2, 'Super Mario Bros'),
    (3, 'Minecraft');

INSERT INTO
    criterion(criterion_id, label)
VALUES
    (1, 'gameplay'),
    (2, 'graphics');

INSERT INTO
    rate(user_id, criterion_id, game_id, value)
VALUES
    (1, 1, 1, 5),
    (1, 2, 1, 3),
    (1, 1, 2, 4),
    (1, 1, 3, 5),
    (2, 1, 2, 4),
    (2, 1, 1, 3);