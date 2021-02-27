CREATE USER cobolusr@'%' IDENTIFIED BY 'cobolExamplePassword';
GRANT ALL PRIVILEGES ON coboldb.* TO cobolusr@'%';

CREATE TABLE kings_of_poland (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    year_of_birth SMALLINT NOT NULL,
    year_of_death SMALLINT NOT NULL,
    reign_year_start SMALLINT NOT NULL,
    reign_year_end SMALLINT NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO kings_of_poland (name, year_of_birth, year_of_death,reign_year_start,reign_year_end) VALUES 
('Bolesław I Chrobry', 967,1025, 1025, 1025),
('Mieszko II Lambert', 990,1034,1025,1031),
('Wratysław II Czeski', 1032,1092,1086, 1092),
('Bolesław II Szczodry', 1042,1082,1076,1079),
('Przemysł II', 1257,1296,1295, 1296),
('Wacław II', 1271,1305, 1300,1305),
('Wacław III', 1289,1306,1305,1306),
('Henryk Karyncki',1265,1335, 1306,1306),
('Henryk Karyncki',1265,1335, 1307,1310);