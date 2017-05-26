DELETE FROM reserves;
DELETE FROM worksat;

INSERT INTO `hospitaldb`.`worksat`
(`eID`,
`bID`)
VALUES
(152,
182);

INSERT INTO `hospitaldb`.`worksat`
(`eID`,
`bID`)
VALUES
(162,
192);

INSERT INTO `hospitaldb`.`reserves`
(`pID`,
`eID`,
`bID`,
`date`,
`time`)
VALUES
(412,
152,
182,
"05/02/2017",
1200);

INSERT INTO `hospitaldb`.`reserves`
(`pID`,
`eID`,
`bID`,
`date`,
`time`)
VALUES
(422,
162,
192,
"05/02/2017",
4000);

INSERT INTO `hospitaldb`.`reserves`
(`pID`,
`eID`,
`bID`,
`date`,
`time`)
VALUES
(432,
162,
192,
"05/03/2017",
1100);