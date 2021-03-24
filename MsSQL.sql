CREATE DATABASE useavtodb;
USE useavtodb;

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY, 
    fname VARCHAR(100), 
    age INTEGER
);

CREATE TABLE avto (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    marka VARCHAR(500),
    num VARCHAR(10)
   ); 
  
  CREATE TABLE useavto (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    dmy DATE,
    UsersId INT NOT NULL,
    AvtoId INT NOT NULL,
    vname VARCHAR(100),
    amarka VARCHAR(50),
    anum VARCHAR(10),
    CreatedAt DATE NOT NULL,
    FOREIGN KEY (UsersId) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (AvtoId) REFERENCES avto(id) ON DELETE CASCADE
   );
   
INSERT INTO users (fname, age) VALUES ('Свиридов М.', 34);
INSERT INTO users (fname, age) VALUES ('Горячев Г.', 58);
INSERT INTO users (fname, age) VALUES ('Деменчук С.', 30);
INSERT INTO users (fname, age) VALUES ('Семенов А.', 24);

INSERT INTO avto (marka, num) VALUES ('Honda', 'п458кн797');
INSERT INTO avto (marka, num) VALUES ('KIA', 'в682мп123');
INSERT INTO avto (marka, num) VALUES ('Hyundai', 'к794вр150');
INSERT INTO avto (marka, num) VALUES ('Skoda', 'с123юд799');
INSERT INTO avto (marka, num) VALUES ('Volkswagen', 'н159вл750');
INSERT INTO useavto (UsersId, AvtoId, anum, CreatedAt)
VALUES
( 
    (SELECT id FROM users WHERE fname='Свиридов М.'),
    (SELECT id FROM avto WHERE marka='KIA'),
    (SELECT num FROM avto WHERE num='в682мп123'),
    ('2018-05-21')
),
( 
    (SELECT id FROM users WHERE fname='Свиридов М.'),
    (SELECT id FROM avto WHERE marka='Skoda'),
    (SELECT num FROM avto WHERE num='с123юд799'),
    ('2018-05-24')
),
( 
    (SELECT id FROM users WHERE fname='Деменчук С.'),
    (SELECT id FROM avto WHERE marka='Skoda'),
    (SELECT num FROM avto WHERE num='с123юд799'),
    ('2018-05-25')
);

SELECT users.fname, avto.marka, avto.num, useavto.CreatedAt 
FROM users, avto, useavto
WHERE useavto.UsersId = users.id AND useavto.AvtoId=avto.id;
