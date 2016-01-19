BEGIN TRANSACTION;
CREATE TABLE employee (id integer primary key, name text);
INSERT INTO "employee" VALUES(1,'Jimbo Fu');
INSERT INTO "employee" VALUES(2,'Huge Glass');
INSERT INTO "employee" VALUES(3,'Andrew Bacon');
INSERT INTO "employee" VALUES(4,'Rose Mars');
INSERT INTO "employee" VALUES(5,'Jason Stanson');
INSERT INTO "employee" VALUES(6,'Mark Walburg');
COMMIT;
