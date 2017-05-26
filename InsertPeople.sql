DELETE FROM reserves;
DELETE FROM worksat;
DELETE FROM patient;
DELETE FROM building;
DELETE FROM caregiver;


INSERT INTO `hospitaldb`.`patient`
(`name`,
`dateOfBirth`,
`sex`,
`address`,
`insuranceID`,
`telno`,
`email`)
VALUES
("John Doe",
"01/01/1985",
"M",
"1234 Street Place",
null,
null,
null);

INSERT INTO `hospitaldb`.`patient`
(`name`,
`dateOfBirth`,
`sex`,
`address`,
`insuranceID`,
`telno`,
`email`)
VALUES
("Test Man",
"05/06/2016",
"M",
"Another Address",
12345678911,
4145156166,
"something@example.com");

INSERT INTO `hospitaldb`.`patient`
(`name`,
`dateOfBirth`,
`sex`,
`address`,
`insuranceID`,
`telno`,
`email`)
VALUES
("Test Woman",
"05/04/2016",
"F",
"Another Address 2",
12345678912,
4145156165,
"something2@example.com");

INSERT INTO `hospitaldb`.`caregiver`
(`SSN`,
`name`,
`sex`,
`dateOfBirth`,
`telno`,
`specialty`
)
VALUES
(111111166,
"Sanford Markowitz",
"M",
"01/01/1952",
null,
"Cancer Research");

INSERT INTO `hospitaldb`.`caregiver`
(`SSN`,
`name`,
`sex`,
`dateOfBirth`,
`telno`,
`specialty`
)
VALUES
(555555556,
"Gregory House",
"M",
"06/11/1959",
null,
"Nephrology");

INSERT INTO `hospitaldb`.`building`
(`address`,
`name`,
`telno`)
VALUES
("11100 Euclid Ave, 44106",
"Seidman Cancer Center",
2168443951);

INSERT INTO `hospitaldb`.`building`
(`address`,
`name`,
`telno`)
VALUES
("2070 90th St, 44106",
"Cleveland Clinic",
2164442255);