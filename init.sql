CREATE DATABASE IF NOT EXISTS test
    COLLATE utf8_general_ci;

USE test;

DROP TABLE IF EXISTS part;

CREATE TABLE part
(
    id       INT(11)  NOT NULL AUTO_INCREMENT,
    name     VARCHAR(255)NULL,
    isneed   TINYINT(1)  NULL,
    count    INT(11)     NULL,
    PRIMARY KEY (id)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;

insert into part(name, isneed, count)
values ('motherboard', true, 5)
     , ('audiocard', false, 2)
     , ('processor', true, 6)
     , ('HDD', false, 1)
     , ('case', true, 10)
     , ('Ram', true, 10)
     , ('GPU card', false, 7)
     , ('keyboard', true, 22)
     , ('mouse', true, 9)
     , ('power supply', true, 10)
     , ('cardreafer', false, 8)
     , ('headphones', false, 3)
     , ('bluetooth adapter', false, 7)
     , ('fan processor', true, 7)
     , ('pilot', true, 33)
     , ('powercord', true, 9)
     , ('ethernet adapter', false, 10)
     , ('gtx 1080ti', false, 4)
     , ('SSD', true, 5)
     , ('CD driver', false, 4)
     , ('printer', false, 4)
     , ('cover for mouse', false, 3);
