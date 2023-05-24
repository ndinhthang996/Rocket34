DROP DATABASE IF EXISTS TestingSystem3;
CREATE DATABASE TestingSystem3;
USE TestingSystem3;
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
DepartmentID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName NVARCHAR(30) NOT NULL UNIQUE KEY
);
-- create table 2: Posittion
DROP TABLE IF EXISTS Position;
CREATE TABLE `Position` (
PositionID MEDIUMINT UNSIGNED AUTO_INCREMENT
PRIMARY KEY,
PositionName ENUM('DEV','TEST','SCRUM_MASTER','PM') NOT NULL UNIQUE
KEY
);
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
AccountID MEDIUMINT UNSIGNED AUTO_INCREMENT
PRIMARY KEY,
Email VARCHAR(50) NOT NULL UNIQUE KEY,
Username VARCHAR(50) NOT NULL UNIQUE KEY,
FullName NVARCHAR(50) NOT NULL,
DepartmentID MEDIUMINT UNSIGNED NOT NULL,
PositionID MEDIUMINT UNSIGNED NOT NULL,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
GroupID MEDIUMINT UNSIGNED AUTO_INCREMENT
PRIMARY KEY,
GroupName NVARCHAR(50) NOT NULL UNIQUE KEY,
CreatorID MEDIUMINT UNSIGNED,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
GroupID MEDIUMINT UNSIGNED NOT NULL,
AccountID MEDIUMINT UNSIGNED NOT NULL,
JoinDate DATETIME DEFAULT NOW(),
PRIMARY KEY (GroupID,AccountID),
FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID)
);
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
TypeID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
TypeName ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
CategoryID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CategoryName NVARCHAR(50) NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS Question;CREATE TABLE Question(
QuestionID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content NVARCHAR(100) NOT NULL,
CategoryID MEDIUMINT UNSIGNED NOT NULL,
TypeID MEDIUMINT UNSIGNED NOT NULL,
CreatorID MEDIUMINT UNSIGNED NOT NULL,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
AnswerID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content NVARCHAR(100) NOT NULL,
QuestionID MEDIUMINT UNSIGNED,
isCorrect BIT DEFAULT 1,
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
ExamID MEDIUMINT UNSIGNED AUTO_INCREMENT
PRIMARY KEY,
`Code` CHAR(10) NOT NULL,
Title NVARCHAR(50) NOT NULL,
CategoryID MEDIUMINT UNSIGNED NOT NULL,
Duration MEDIUMINT UNSIGNED NOT NULL,
CreatorID MEDIUMINT UNSIGNED NOT NULL,
CreateDate DATETIME DEFAULT NOW(),FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
ExamID MEDIUMINT UNSIGNED NOT NULL,
QuestionID MEDIUMINT UNSIGNED NOT NULL,
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID) ON DELETE CASCADE,
FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ,
PRIMARY KEY (ExamID,QuestionID)
);
-- ===================================================
INSERT INTO Position (PositionName )
VALUES ('DEV' ),
('TEST' ),
('SCRUM_MASTER'),
('PM' );
insert into department (DepartmentName) values ('Engineering');
insert into department (DepartmentName) values ('Product Management');
insert into department (DepartmentName) values ('Business Development');
insert into department (DepartmentName) values ('Legal');
insert into department (DepartmentName) values ('Support');
insert into department (DepartmentName) values ('Accounting');
insert into department (DepartmentName) values ('Services');
insert into department (DepartmentName) values ('Sale');
insert into department (DepartmentName) values ('Training');
insert into department (DepartmentName) values ('Human Resources');
insert into department (DepartmentName) values ('Research and Development');
insert into department (DepartmentName) values ('Marketing');insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('lgoodge0@msn.com', 'lgoodge0', 'Lyman Goodge', 11, 3, '2017-04-09');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('dgeertz1@bluehost.com', 'dgeertz1', 'Dal Geertz', 3, 2, '2020-09-13');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('qharwick2@kickstarter.com', 'qharwick2', 'Quentin Harwick', 9, 2, '2018-01-23');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('noriordan3@jugem.jp', 'noriordan3', 'Nomi O''Riordan', 7, 2, '2018-11-30');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ledmondson4@jalbum.net', 'ledmondson4', 'Livia Edmondson', 3, 4, '2019-06-16');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('cgerauld5@lycos.com', 'cgerauld5', 'Cordell Gerauld', 6, 2, '2019-12-26');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('thowgego6@sourceforge.net', 'thowgego6', 'Taffy Howgego', 5, 2, '2017-08-27');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('vkiernan7@uol.com.br', 'vkiernan7', 'Verna Kiernan', 9, 3, '2017-08-08');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('tgegg8@cyberchimps.com', 'tgegg8', 'Tiffanie Gegg', 9, 4, '2017-09-23');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('tplace9@cbc.ca', 'tplace9', 'Tiffani Place', 10, 4, '2018-10-08');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('iadamidesa@blogs.com', 'iadamidesa', 'Isac Adamides', 7, 3, '2021-01-02');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('lghirardib@imgur.com', 'lghirardib', 'Lanie Ghirardi', 3, 4, '2018-08-13');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('eallwoodc@example.com', 'eallwoodc', 'Erena Allwood', 11, 4, '2017-09-21');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('mrizzid@vimeo.com', 'mrizzid', 'Monte Rizzi', 3, 3, '2017-08-12');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('mlynese@photobucket.com', 'mlynese', 'Mayne Lynes', 8, 3, '2020-03-15');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('achanningf@apache.org', 'achanningf', 'Ansley Channing', 1, 3, '2020-11-08');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('hgoscombg@umn.edu', 'hgoscombg', 'Horacio Goscomb', 10, 3, '2018-09-10');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('jwarykh@cam.ac.uk', 'jwarykh', 'Jorge Waryk', 1, 1, '2020-04-30');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('nmariansi@studiopress.com', 'nmariansi', 'Northrup Marians', 3, 3, '2019-08-28');insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('aapedailej@printfriendly.com', 'aapedailej', 'Alwyn Apedaile', 2, 4, '2017-10-25');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('bmastersk@census.gov', 'bmastersk', 'Bridie Masters', 5, 2, '2020-02-11');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('cboulgerl@theguardian.com', 'cboulgerl', 'Cristen Boulger', 3, 4, '2020-03-19');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('reamm@state.gov', 'reamm', 'Ripley Eam', 6, 1, '2020-10-17');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('epietranekn@nps.gov', 'epietranekn', 'Elinore Pietranek', 8, 1, '2018-03-21');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('skrammero@abc.net.au', 'skrammero', 'Stanfield Krammer', 1, 2, '2017-12-22');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('jboswoodp@auda.org.au', 'jboswoodp', 'Jillie Boswood', 10, 4, '2018-01-18');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('cheadleyq@usnews.com', 'cheadleyq', 'Cynthea Headley', 5, 1, '2020-09-23');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('erozecr@plala.or.jp', 'erozecr', 'Eden Rozec', 6, 3, '2017-05-04');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('bguilloneaus@tmall.com', 'bguilloneaus', 'Bennie Guilloneau', 1, 4, '2017-07-25');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ktommist@loc.gov', 'ktommist', 'Katherina Tommis', 10, 4, '2019-04-29');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('fdallau@smh.com.au', 'fdallau', 'Ferdie Dalla', 1, 2, '2020-09-17');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('adockreev@cdc.gov', 'adockreev', 'Adolf Dockree', 2, 2, '2021-01-22');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('thumbatchw@cargocollective.com', 'thumbatchw', 'Tomasine Humbatch', 10, 3, '2019-06-24');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('edomeganx@weebly.com', 'edomeganx', 'Eddi Domegan', 3, 4, '2019-01-15');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('jwaighty@discuz.net', 'jwaighty', 'Jeanna Waight', 4, 2, '2018-10-22');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('msaxbyz@ca.gov', 'msaxbyz', 'Minda Saxby', 10, 4, '2020-07-11');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('mgorce10@amazonaws.com', 'mgorce10', 'Marion Gorce', 8, 1, '2019-05-16');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('nvan11@nhs.uk', 'nvan11', 'Nikolaus Van Velden', 7, 2, '2020-08-30');insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('bnoir12@seesaa.net', 'bnoir12', 'Benni Noir', 8, 3, '2019-05-06');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('xchevolleau13@cnbc.com', 'xchevolleau13', 'Xena Chevolleau', 10, 1, '2017-02-22');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('mhaymes14@prlog.org', 'mhaymes14', 'Muire Haymes', 3, 3, '2018-07-01');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ukendle15@wordpress.com', 'ukendle15', 'Ursala Kendle', 11, 4, '2018-04-23');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('bcaldaro16@hao123.com', 'bcaldaro16', 'Buddy Caldaro', 8, 3, '2019-12-09');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('mbertenshaw17@qq.com', 'mbertenshaw17', 'Marrilee Bertenshaw', 8, 2, '2017-11-03');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('icloney18@cyberchimps.com', 'icloney18', 'Isabella Cloney', 7, 3, '2017-09-16');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('kgunningham19@npr.org', 'kgunningham19', 'Kylie Gunningham', 1, 2, '2017-11-22');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('bciabatteri1a@ehow.com', 'bciabatteri1a', 'Becca Ciabatteri', 9, 2, '2021-03-01');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('rhillin1b@pinterest.com', 'rhillin1b', 'Rayshell Hillin', 9, 1, '2018-06-16');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('iarson1c@cloudflare.com', 'iarson1c', 'Isabel Arson', 12, 4, '2018-05-12');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('mnalder1d@cafepress.com', 'mnalder1d', 'Myrah Nalder', 11, 4, '2017-12-01');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('cdi1e@google.nl', 'cdi1e', 'Concettina Di Meo', 12, 2, '2017-05-08');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('tchastang1f@wiley.com', 'tchastang1f', 'Thornie Chastang', 4, 4, '2018-03-05');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('rmaudling1g@yandex.ru', 'rmaudling1g', 'Rea Maudling', 8, 2, '2018-04-03');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('dsiebert1h@reddit.com', 'dsiebert1h', 'Danette Siebert', 4, 4, '2019-08-10');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('apedro1i@artisteer.com', 'apedro1i', 'Andriana Pedro', 8, 4, '2020-09-16');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('pmelonby1j@bravesites.com', 'pmelonby1j', 'Peder Melonby', 1, 3, '2020-02-25');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('tmacneachtain1k@twitter.com', 'tmacneachtain1k', 'Teodoro MacNeachtain', 2, 1, '2018-05-12');insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ddougharty1l@ucla.edu', 'ddougharty1l', 'Darnall Dougharty', 11, 3, '2021-02-08');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('aelies1m@sphinn.com', 'aelies1m', 'Alfredo Elies', 8, 1, '2018-04-30');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('gmatousek1n@berkeley.edu', 'gmatousek1n', 'Guthrey Matousek', 12, 4, '2017-08-17');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('dclutheram1o@posterous.com', 'dclutheram1o', 'Devland Clutheram', 9, 3, '2020-01-05');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('tgander1p@arstechnica.com', 'tgander1p', 'Tybie Gander', 10, 1, '2018-10-08');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('efettis1q@un.org', 'efettis1q', 'Emmery Fettis', 5, 4, '2019-01-31');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('hreide1r@utexas.edu', 'hreide1r', 'Harriot Reide', 2, 3, '2018-03-30');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('btubbles1s@harvard.edu', 'btubbles1s', 'Betti Tubbles', 1, 3, '2021-01-25');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('wsmitten1t@google.com.au', 'wsmitten1t', 'Wileen Smitten', 10, 4, '2020-09-02');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('fspeer1u@psu.edu', 'fspeer1u', 'Felicity Speer', 12, 2, '2021-01-17');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('jdhennin1v@prlog.org', 'jdhennin1v', 'Jacqueline Dhennin', 12, 2, '2019-11-11');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('smaberley1w@utexas.edu', 'smaberley1w', 'Sonny Maberley', 12, 3, '2019-01-12');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('oholyard1x@qq.com', 'oholyard1x', 'Osbert Holyard', 5, 4, '2017-11-05');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('epowlesland1y@mashable.com', 'epowlesland1y', 'Estella Powlesland', 12, 1, '2017-05-24');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('dcarstairs1z@w3.org', 'dcarstairs1z', 'Denver Carstairs', 12, 2, '2018-05-13');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('aoakenford20@soundcloud.com', 'aoakenford20', 'Abelard Oakenford', 1, 2, '2020-10-31');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('rsyalvester21@rambler.ru', 'rsyalvester21', 'Rochette Syalvester', 1, 3, '2019-04-04');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('isyson22@tinypic.com', 'isyson22', 'Iris Syson', 9, 4, '2018-10-26');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('wbreslin23@storify.com', 'wbreslin23', 'Wyatt Breslin', 10, 4, '2019-10-19');insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('lduhig24@ifeng.com', 'lduhig24', 'Livvyy Duhig', 4, 3, '2020-11-25');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('hdarling25@simplemachines.org', 'hdarling25', 'Harriette Darling', 11, 2, '2017-12-13');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('arehor26@unicef.org', 'arehor26', 'Aimil Rehor', 12, 3, '2018-11-18');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ybain27@globo.com', 'ybain27', 'Yurik Bain', 10, 3, '2018-12-31');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('rbiggs28@msu.edu', 'rbiggs28', 'Roi Biggs', 9, 4, '2019-10-15');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('psetterfield29@nyu.edu', 'psetterfield29', 'Pail Setterfield', 9, 2, '2020-06-05');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('nemmanueli2a@rediff.com', 'nemmanueli2a', 'Nickie Emmanueli', 8, 4, '2020-03-10');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('rmaddy2b@archive.org', 'rmaddy2b', 'Roxi Maddy', 9, 3, '2017-10-02');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('kdilgarno2c@dagondesign.com', 'kdilgarno2c', 'Kelsy Dilgarno', 11, 2, '2020-12-10');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ddirand2d@360.cn', 'ddirand2d', 'Deni Dirand', 12, 1, '2018-12-29');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('mmanjin2e@yahoo.com', 'mmanjin2e', 'Marita Manjin', 7, 1, '2019-02-24');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('fmckeney2f@pbs.org', 'fmckeney2f', 'Ferrel McKeney', 12, 4, '2017-11-23');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('efranchi2g@live.com', 'efranchi2g', 'Elsey Franchi', 5, 3, '2020-09-26');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('jlanston2h@guardian.co.uk', 'jlanston2h', 'Janek Lanston', 2, 1, '2019-06-11');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('tianniello2i@apache.org', 'tianniello2i', 'Tracie Ianniello', 1, 3, '2018-12-01');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ggeroldini2j@de.vu', 'ggeroldini2j', 'Gwyneth Geroldini', 7, 2, '2020-04-10');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('tcardinale2k@imdb.com', 'tcardinale2k', 'Teddy Cardinale', 9, 2, '2020-01-09');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('nestcot2l@goo.gl', 'nestcot2l', 'Nick Estcot', 1, 2, '2020-06-22');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('psighart2m@squarespace.com', 'psighart2m', 'Pietro Sighart', 7, 1, '2019-01-05');insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('randreichik2n@google.de', 'randreichik2n', 'Redford Andreichik', 2, 4, '2019-01-29');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('edi2o@scientificamerican.com', 'edi2o', 'Eugenia Di Pietro', 11, 3, '2019-09-02');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('fledster2p@google.nl', 'fledster2p', 'Fannie Ledster', 10, 4, '2018-12-07');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ljandak2q@furl.net', 'ljandak2q', 'Luce Jandak', 4, 1, '2018-09-02');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('bgosart2r@businessweek.com', 'bgosart2r', 'Barri Gosart', 11, 1, '2021-02-16');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('vhouten2s@china.com.cn', 'vhouten2s', 'Veronika Houten', 6, 2, '2020-07-25');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('mwickham2t@un.org', 'mwickham2t', 'Marci Wickham', 7, 3, '2019-07-13');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('abayne2u@geocities.jp', 'abayne2u', 'Angelina Bayne', 12, 1, '2017-10-19');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('fwestover2v@jalbum.net', 'fwestover2v', 'Felizio Westover', 9, 4, '2020-10-11');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('eheinig2w@princeton.edu', 'eheinig2w', 'Erda Heinig', 1, 3, '2017-12-06');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('khellyar2x@nsw.gov.au', 'khellyar2x', 'Krista Hellyar', 5, 1, '2018-08-25');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('pternent2y@netvibes.com', 'pternent2y', 'Phaedra Ternent', 11, 3, '2020-04-03');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('bcrippell2z@delicious.com', 'bcrippell2z', 'Birgitta Crippell', 7, 2, '2018-05-22');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('glarroway30@fda.gov', 'glarroway30', 'Georgiana Larroway', 4, 3, '2019-09-18');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('gdarco31@canalblog.com', 'gdarco31', 'Gianna Darco', 8, 1, '2020-09-04');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ccrayke32@sogou.com', 'ccrayke32', 'Curt Crayke', 10, 1, '2020-01-12');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('eshimwell33@list-manage.com', 'eshimwell33', 'Elliot Shimwell', 3, 2, '2020-01-19');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('laveson34@umn.edu', 'laveson34', 'Laverne Aveson', 3, 1, '2018-09-23');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('emc35@vistaprint.com', 'emc35', 'Eugenie Mc Ilwrick', 12, 3, '2019-06-23');insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ctocqueville36@wp.com', 'ctocqueville36', 'Collette Tocqueville', 10, 1, '2019-06-14');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('rszwandt37@squarespace.com', 'rszwandt37', 'Roanne Szwandt', 9, 3, '2018-05-18');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('jmarquess38@hubpages.com', 'jmarquess38', 'Joletta Marquess', 9, 1, '2019-05-18');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('lriddlesden39@google.ru', 'lriddlesden39', 'Leona Riddlesden', 1, 2, '2020-02-27');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('dhasloch3a@vinaora.com', 'dhasloch3a', 'Darn Hasloch', 5, 4, '2020-11-08');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('kattestone3b@wikipedia.org', 'kattestone3b', 'Kevina Atte-Stone', 2, 1, '2017-12-07');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('cseleway3c@eventbrite.com', 'cseleway3c', 'Cross Seleway', 6, 3, '2018-10-10');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('bpickett3d@wikipedia.org', 'bpickett3d', 'Brandi Pickett', 10, 1, '2017-03-30');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('rrobens3e@slate.com', 'rrobens3e', 'Ricard Robens', 8, 3, '2021-02-05');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('asandars3f@cbc.ca', 'asandars3f', 'Alanna Sandars', 6, 4, '2020-05-15');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('kdurrell3g@360.cn', 'kdurrell3g', 'Karney Durrell', 4, 3, '2021-01-19');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('bmeekings3h@altervista.org', 'bmeekings3h', 'Bessy Meekings', 4, 1, '2021-02-10');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('rbatecok3i@fda.gov', 'rbatecok3i', 'Regine Batecok', 9, 3, '2018-10-05');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('dthurlbeck3j@miitbeian.gov.cn', 'dthurlbeck3j', 'Daren Thurlbeck', 9, 2, '2018-05-04');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ewaber3k@about.com', 'ewaber3k', 'Eamon Waber', 12, 3, '2017-09-19');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('maddionisio3l@usgs.gov', 'maddionisio3l', 'Morgun Addionisio', 6, 1, '2019-05-15');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('jfeltoe3m@yale.edu', 'jfeltoe3m', 'Jerrilee Feltoe', 4, 3, '2019-02-15');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('gmeaden3n@utexas.edu', 'gmeaden3n', 'Gwyn Meaden', 10, 3, '2019-09-13');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('agirt3o@blogtalkradio.com', 'agirt3o', 'Augie Girt', 8, 1, '2019-01-09');insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('adecruse3p@reddit.com', 'adecruse3p', 'Art Decruse', 3, 2, '2019-10-27');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('rbenham3q@unesco.org', 'rbenham3q', 'Rafaelia Benham', 1, 3, '2019-12-31');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('cbaert3r@flavors.me', 'cbaert3r', 'Clair Baert', 6, 3, '2020-09-13');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('jborton3s@wiley.com', 'jborton3s', 'Jonis Borton', 5, 3, '2019-02-05');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('adauney3t@people.com.cn', 'adauney3t', 'Arny Dauney', 5, 2, '2017-06-06');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('gclappson3u@ted.com', 'gclappson3u', 'Gwendolin Clappson', 10, 2, '2020-11-03');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ekoppeck3v@businessweek.com', 'ekoppeck3v', 'Eldon Koppeck', 2, 1, '2017-03-28');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('eissakov3w@google.com.br', 'eissakov3w', 'Egan Issakov', 11, 3, '2017-10-08');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('rrandles3x@skype.com', 'rrandles3x', 'Raffarty Randles', 8, 3, '2017-05-24');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('jvispo3y@so-net.ne.jp', 'jvispo3y', 'Joseph Vispo', 2, 3, '2020-07-26');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('agilgryst3z@omniture.com', 'agilgryst3z', 'Andromache Gilgryst', 9, 3, '2019-05-10');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('bshakspeare40@bandcamp.com', 'bshakspeare40', 'Brook Shakspeare', 3, 3, '2017-12-04');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('psproul41@loc.gov', 'psproul41', 'Pavel Sproul', 8, 1, '2019-05-21');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('dbarthrup42@ucoz.com', 'dbarthrup42', 'Devinne Barthrup', 11, 3, '2018-09-12');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('elambird43@nps.gov', 'elambird43', 'Ellie Lambird', 6, 4, '2018-01-26');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('aneighbour44@scribd.com', 'aneighbour44', 'Avram Neighbour', 11, 3, '2017-07-30');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('oalflatt45@cornell.edu', 'oalflatt45', 'Oralla Alflatt', 2, 1, '2020-06-05');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('mmckew46@fda.gov', 'mmckew46', 'Melitta McKew', 6, 4, '2019-12-05');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('gdignon47@infoseek.co.jp', 'gdignon47', 'Gayle Dignon', 4, 3, '2019-06-11');insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ajoule48@webmd.com', 'ajoule48', 'Aube Joule', 12, 4, '2019-09-12');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('asaur49@webnode.com', 'asaur49', 'Adan Saur', 9, 2, '2017-06-18');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('cterney4a@spiegel.de', 'cterney4a', 'Carissa Terney', 5, 2, '2017-04-02');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('nteall4b@patch.com', 'nteall4b', 'Noel Teall', 2, 2, '2018-09-12');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ocaught4c@elegantthemes.com', 'ocaught4c', 'Othelia Caught', 6, 3, '2019-10-06');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('tizhak4d@github.com', 'tizhak4d', 'Trueman Izhak', 10, 2, '2018-07-21');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('imccluney4e@gmpg.org', 'imccluney4e', 'Ilario McCluney', 9, 1, '2017-10-17');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('skeegan4f@youku.com', 'skeegan4f', 'Selia Keegan', 1, 4, '2018-07-18');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('rrackley4g@ocn.ne.jp', 'rrackley4g', 'Raddie Rackley', 6, 3, '2018-08-06');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ashadrack4h@topsy.com', 'ashadrack4h', 'Alisa Shadrack', 1, 3, '2019-03-28');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('vpendlington4i@fema.gov', 'vpendlington4i', 'Vikki Pendlington', 1, 3, '2019-09-29');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('dtrobey4j@nasa.gov', 'dtrobey4j', 'Dora Trobey', 5, 4, '2018-07-20');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('wordelt4k@google.co.uk', 'wordelt4k', 'Whitby Ordelt', 12, 4, '2018-11-24');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('lkrienke4l@ebay.co.uk', 'lkrienke4l', 'Lionel Krienke', 1, 3, '2020-09-15');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('mhucker4m@senate.gov', 'mhucker4m', 'Melantha Hucker', 8, 4, '2019-04-18');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('tmanilow4n@wufoo.com', 'tmanilow4n', 'Tessie Manilow', 3, 4, '2018-03-21');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('jgowen4o@mit.edu', 'jgowen4o', 'Jeri Gowen', 7, 4, '2017-01-18');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('cendacott4p@ask.com', 'cendacott4p', 'Currey Endacott', 12, 2, '2018-06-24');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('lgrigsby4q@reddit.com', 'lgrigsby4q', 'Lisle Grigsby', 11, 3, '2021-02-05');insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('fmeak4r@hexun.com', 'fmeak4r', 'Forrester Meak', 10, 2, '2018-09-14');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('bkinge4s@nature.com', 'bkinge4s', 'Bernadina Kinge', 3, 4, '2018-03-07');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('tgeorgeou4t@de.vu', 'tgeorgeou4t', 'Tabbi Georgeou', 5, 3, '2020-10-12');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ndane4u@360.cn', 'ndane4u', 'Nana Dane', 11, 3, '2020-07-17');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('agodly4v@drupal.org', 'agodly4v', 'Alvan Godly', 5, 2, '2017-07-08');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('crake4w@npr.org', 'crake4w', 'Christophe Rake', 8, 4, '2017-06-12');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('icoxhell4x@twitter.com', 'icoxhell4x', 'Ileana Coxhell', 8, 1, '2019-03-24');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('lsterre4y@ft.com', 'lsterre4y', 'Lynnell Sterre', 9, 3, '2019-02-11');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('sottewell4z@ucsd.edu', 'sottewell4z', 'Stephie Ottewell', 2, 2, '2018-01-08');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('golive50@webmd.com', 'golive50', 'Gustav Olive', 11, 4, '2018-07-14');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('rpincott51@cpanel.net', 'rpincott51', 'Reggis Pincott', 2, 4, '2019-07-21');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('emacdunlevy52@epa.gov', 'emacdunlevy52', 'Emelia MacDunlevy', 3, 1, '2017-03-19');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('dmcghee53@jigsy.com', 'dmcghee53', 'Doy McGhee', 9, 3, '2017-11-21');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('thallibone54@psu.edu', 'thallibone54', 'Thedrick Hallibone', 10, 4, '2020-05-29');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('bjandl55@google.de', 'bjandl55', 'Belva Jandl', 10, 4, '2017-12-14');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('mloy56@google.fr', 'mloy56', 'Marion Loy', 7, 1, '2020-01-26');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('jonraet57@un.org', 'jonraet57', 'Jeffry Onraet', 12, 3, '2020-02-25');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ivann58@csmonitor.com', 'ivann58', 'Ingrim Vann', 6, 2, '2021-01-22');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('mcantillon59@newsvine.com', 'mcantillon59', 'Melva Cantillon', 1, 3, '2019-05-30');insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('wbisson5a@instagram.com', 'wbisson5a', 'Winfred Bisson', 10, 1, '2019-04-19');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('nfausch5b@tripod.com', 'nfausch5b', 'Nilson Fausch', 10, 3, '2017-11-29');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('bgislebert5c@wikimedia.org', 'bgislebert5c', 'Basilius Gislebert', 10, 3, '2017-11-17');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('dkiffe5d@topsy.com', 'dkiffe5d', 'Dulcia Kiffe', 7, 1, '2020-11-18');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ndallimare5e@alibaba.com', 'ndallimare5e', 'Neron Dallimare', 1, 1, '2019-07-31');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ktheurer5f@netlog.com', 'ktheurer5f', 'Kasey Theurer', 11, 3, '2017-05-10');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('strubshaw5g@wikia.com', 'strubshaw5g', 'Sophronia Trubshaw', 4, 3, '2020-08-07');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('fholleran5h@narod.ru', 'fholleran5h', 'Falkner Holleran', 12, 4, '2019-04-13');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('lbothams5i@dailymail.co.uk', 'lbothams5i', 'Leeanne Bothams', 5, 1, '2019-09-05');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('kjacobowitz5j@acquirethisname.com', 'kjacobowitz5j', 'Kalli Jacobowitz', 11, 4, '2018-02-24');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('llocks5k@flavors.me', 'llocks5k', 'Luise Locks', 1, 3, '2021-02-20');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('helson5l@wordpress.com', 'helson5l', 'Hobie Elson', 10, 1, '2018-11-12');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('bfusco5m@prnewswire.com', 'bfusco5m', 'Blanche Fusco', 11, 1, '2020-01-04');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('dgremane5n@gizmodo.com', 'dgremane5n', 'Dame Gremane', 7, 4, '2018-04-30');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('cstratton5o@webs.com', 'cstratton5o', 'Caroline Stratton', 10, 3, '2018-01-30');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('dheller5p@tripod.com', 'dheller5p', 'Dominick Heller', 6, 3, '2020-07-30');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('khann5q@fotki.com', 'khann5q', 'Katrine Hann', 10, 1, '2021-01-30');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('afairfoul5r@live.com', 'afairfoul5r', 'Agnella Fairfoul', 9, 4, '2020-05-11');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('hbreed5s@opensource.org', 'hbreed5s', 'Helen-elizabeth Breed', 5, 2, '2019-06-05');insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ajouaneton5t@army.mil', 'ajouaneton5t', 'Amby Jouaneton', 5, 1, '2020-02-24');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('tmesias5u@networkadvertising.org', 'tmesias5u', 'Thayne Mesias', 10, 4, '2020-03-16');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('mclowsley5v@google.es', 'mclowsley5v', 'Maynard Clowsley', 11, 2, '2019-05-02');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('gdanielis5w@nymag.com', 'gdanielis5w', 'Gerhard Danielis', 1, 4, '2017-04-14');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('rlosbie5x@clickbank.net', 'rlosbie5x', 'Rikki Losbie', 7, 3, '2020-09-14');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('zgibb5y@cisco.com', 'zgibb5y', 'Zelda Gibb', 11, 1, '2019-07-06');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('abattram5z@nytimes.com', 'abattram5z', 'Ag Battram', 1, 1, '2017-11-21');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ikrikorian60@earthlink.net', 'ikrikorian60', 'Israel Krikorian', 1, 4, '2019-04-10');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('wkeets61@simplemachines.org', 'wkeets61', 'Wendell Keets', 3, 1, '2019-09-29');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('awixey62@bloomberg.com', 'awixey62', 'Ainslie Wixey', 3, 1, '2019-02-16');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('kbroomhall63@51.la', 'kbroomhall63', 'Konstantine Broomhall', 12, 1, '2021-01-16');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('rbea64@multiply.com', 'rbea64', 'Rozalie Bea', 10, 1, '2019-04-28');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('mtrowler65@google.ca', 'mtrowler65', 'Maude Trowler', 7, 1, '2017-03-23');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('greina66@usgs.gov', 'greina66', 'Grantley Reina', 8, 4, '2017-03-06');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('kcoates67@odnoklassniki.ru', 'kcoates67', 'Kara Coates', 12, 4, '2019-07-08');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('mhadfield68@wisc.edu', 'mhadfield68', 'Melita Hadfield', 4, 4, '2020-04-25');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ploynes69@nasa.gov', 'ploynes69', 'Pacorro Loynes', 1, 2, '2019-07-08');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('kkincaid6a@ftc.gov', 'kkincaid6a', 'Kiersten Kincaid', 10, 2, '2020-12-09');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('wdurnell6b@simplemachines.org', 'wdurnell6b', 'Witty Durnell', 9, 1, '2019-08-17');insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ndadley6c@china.com.cn', 'ndadley6c', 'Nollie Dadley', 3, 2, '2017-09-01');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('eover6d@economist.com', 'eover6d', 'Erina Over', 9, 2, '2017-04-02');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('xpembridge6e@kickstarter.com', 'xpembridge6e', 'Xena Pembridge', 1, 1, '2018-05-04');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('oswannell6f@imageshack.us', 'oswannell6f', 'Olivier Swannell', 1, 2, '2019-09-10');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('lgoodrum6g@salon.com', 'lgoodrum6g', 'Lurleen Goodrum', 3, 4, '2017-10-25');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ccant6h@flickr.com', 'ccant6h', 'Celia Cant', 10, 3, '2019-08-18');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('wcunde6i@uol.com.br', 'wcunde6i', 'Wiatt Cunde', 11, 1, '2019-03-09');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('paucourte6j@tmall.com', 'paucourte6j', 'Perrine Aucourte', 9, 4, '2017-10-10');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('gsabate6k@microsoft.com', 'gsabate6k', 'Gene Sabate', 10, 3, '2018-12-14');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('dmuzzini6l@ox.ac.uk', 'dmuzzini6l', 'Darcie Muzzini', 11, 1, '2021-01-06');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('gcasini6m@stumbleupon.com', 'gcasini6m', 'Gussie Casini', 12, 3, '2020-07-27');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('dgryglewski6n@trellian.com', 'dgryglewski6n', 'Daryl Gryglewski', 6, 3, '2017-05-25');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('sbaake6o@dot.gov', 'sbaake6o', 'Sim Baake', 2, 4, '2020-02-29');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('cpodmore6p@quantcast.com', 'cpodmore6p', 'Colas Podmore', 10, 2, '2019-03-19');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('fbtham6q@webs.com', 'fbtham6q', 'Fania Btham', 9, 4, '2017-02-21');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('scothey6r@walmart.com', 'scothey6r', 'Siegfried Cothey', 3, 4, '2018-01-01');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('bpetkens6s@cisco.com', 'bpetkens6s', 'Briny Petkens', 8, 4, '2020-11-13');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('lrosindill6t@npr.org', 'lrosindill6t', 'Lindy Rosindill', 4, 3, '2019-11-23');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('ewoollacott6u@lycos.com', 'ewoollacott6u', 'Ev Woollacott', 11, 1, '2018-12-02');insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('caskaw6v@reddit.com', 'caskaw6v', 'Chryste Askaw', 9, 4, '2017-12-25');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('tlackney6w@bloomberg.com', 'tlackney6w', 'Tawnya Lackney', 8, 2, '2019-05-16');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('bdudding6x@php.net', 'bdudding6x', 'Bryanty Dudding', 3, 4, '2020-05-23');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('jmountain6y@macromedia.com', 'jmountain6y', 'Jacki Mountain', 12, 4, '2018-02-28');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('reden6z@toplist.cz', 'reden6z', 'Riobard Eden', 5, 2, '2017-01-08');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('cdaintith70@cafepress.com', 'cdaintith70', 'Catarina Daintith', 2, 4, '2019-07-15');
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('pmattys71@exblog.jp', 'pmattys71', 'Paton Mattys', 10, 4, '2020-12-03');
INSERT INTO `Group` ( GroupName , CreatorID , CreateDate)
VALUES (N'Testing System' , 5
,'2019-03-05'),
(N'Development' , 1
,'2020-03-07'),
(N'VTI Sale 01' , 2 ,'2020-03-09'),
(N'VTI Sale 02' , 3 ,'2020-03-10'),
(N'VTI Sale 03' , 4 ,'2020-03-28'),
(N'VTI Creator' , 6 ,'2020-04-06'),
(N'VTI Marketing 01' , 7 ,'2020-04-07'),
(N'Management' , 8 ,'2020-04-08'),
(N'Chat with love' , 9 ,'2020-04-09'),
(N'Vi Ti Ai' , 10 ,'2020-04-10');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 119 , '2020-10-08');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 119 , '2019-01-27');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 190 , '2019-05-07');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 240 , '2020-06-29');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 36 , '2019-12-26');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 135 , '2019-10-10');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 160 , '2019-12-09');insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 131 , '2019-09-26');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 85 , '2020-07-26');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 55 , '2019-06-02');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 123 , '2018-06-07');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 235 , '2018-10-15');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 140 , '2020-12-11');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 205 , '2019-03-28');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 40 , '2019-10-06');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 241 , '2018-12-14');
insert into groupaccount (GroupID, AccountID, JoinDate) values (3, 218 , '2019-12-12');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 110 , '2021-01-20');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 218 , '2019-07-17');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 133 , '2020-01-27');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 133 , '2019-11-20');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 42 , '2019-04-06');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 187 , '2020-09-18');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 4 , '2019-11-26');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 241 , '2021-02-02');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 145 , '2020-03-20');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 112 , '2020-05-10');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 182 , '2018-06-14');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 97 , '2019-12-29');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 147 , '2019-09-30');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 215 , '2019-02-14');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 108 , '2020-05-27');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 81 , '2020-08-02');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 236 , '2020-12-21');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 60 , '2021-02-21');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 162 , '2018-06-13');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 15 , '2021-01-26');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 159 , '2020-09-22');insert into groupaccount (GroupID, AccountID, JoinDate) values (3, 125 , '2019-11-16');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 50 , '2020-02-14');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 167 , '2019-07-04');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 77 , '2019-04-20');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 109 , '2019-05-28');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 125 , '2020-09-01');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 41 , '2020-10-04');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 165 , '2019-07-19');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 195 , '2020-10-05');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 149 , '2020-01-23');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 252 , '2018-07-06');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 100 , '2019-09-09');
insert into groupaccount (GroupID, AccountID, JoinDate) values (3, 206 , '2018-03-31');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 118 , '2019-12-27');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 154 , '2021-01-24');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 212 , '2019-12-03');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 185 , '2018-12-05');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 205 , '2019-10-30');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 70 , '2019-03-27');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 67 , '2020-09-15');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 37 , '2020-08-27');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 79 , '2019-02-18');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 115 , '2020-01-16');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 94 , '2019-09-22');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 163 , '2018-05-03');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 92 , '2018-05-16');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 80 , '2021-02-14');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 112 , '2018-09-02');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 107 , '2020-09-16');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 75 , '2019-10-01');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 89 , '2018-11-11');insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 48 , '2018-05-05');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 209 , '2018-08-27');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 149 , '2020-11-13');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 107 , '2019-01-16');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 205 , '2018-09-12');
insert into groupaccount (GroupID, AccountID, JoinDate) values (3, 246 , '2020-07-08');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 19 , '2019-02-17');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 26 , '2020-05-23');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 107 , '2019-10-25');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 56 , '2019-09-29');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 206 , '2020-07-27');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 250 , '2020-10-28');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 171 , '2020-02-20');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 137 , '2019-12-19');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 169 , '2018-08-24');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 243 , '2019-08-12');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 169 , '2020-09-11');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 63 , '2020-12-15');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 244 , '2019-12-31');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 155 , '2020-07-24');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 221 , '2019-02-10');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 54 , '2020-09-10');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 33 , '2019-09-13');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 220 , '2019-06-10');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 97 , '2020-06-23');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 97 , '2018-04-09');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 233 , '2018-03-19');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 230 , '2020-06-15');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 170 , '2018-04-29');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 78 , '2019-10-05');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 116 , '2020-11-23');insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 60 , '2019-12-11');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 149 , '2018-12-19');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 45 , '2018-03-02');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 74 , '2018-03-11');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 174 , '2020-09-23');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 128 , '2020-03-30');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 154 , '2018-08-03');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 183 , '2020-01-08');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 150 , '2020-02-12');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 76 , '2020-01-14');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 106 , '2018-10-26');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 167 , '2019-06-05');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 231 , '2019-08-05');
insert into groupaccount (GroupID, AccountID, JoinDate) values (3, 129 , '2018-07-20');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 151 , '2019-01-23');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 145 , '2020-06-05');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 60 , '2020-06-01');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 74 , '2020-03-10');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 75 , '2019-12-17');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 158 , '2019-03-10');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 34 , '2020-05-09');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 35 , '2019-11-02');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 120 , '2020-08-11');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 251 , '2020-05-11');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 224 , '2020-06-06');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 4 , '2018-06-11');
insert into groupaccount (GroupID, AccountID, JoinDate) values (3, 186 , '2020-06-30');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 141 , '2019-02-28');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 103 , '2020-01-06');
insert into groupaccount (GroupID, AccountID, JoinDate) values (3, 243 , '2021-02-20');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 13 , '2019-11-17');insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 119 , '2020-01-22');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 56 , '2020-03-16');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 247 , '2018-12-30');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 174 , '2021-01-04');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 64 , '2021-01-31');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 155 , '2018-04-11');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 117 , '2018-12-17');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 180 , '2019-04-18');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 21 , '2018-07-21');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 154 , '2019-04-10');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 118 , '2018-10-25');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 59 , '2020-07-20');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 187 , '2018-07-02');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 114 , '2019-05-13');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 16 , '2020-02-15');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 165 , '2020-01-11');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 87 , '2020-11-15');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 34 , '2018-10-08');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 243 , '2020-01-25');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 244 , '2019-09-04');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 201 , '2019-06-20');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 199 , '2019-03-11');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 68 , '2020-08-03');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 88 , '2018-04-21');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 97 , '2019-11-24');
insert into groupaccount (GroupID, AccountID, JoinDate) values (3, 13 , '2020-01-12');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 38 , '2018-10-03');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 46 , '2019-01-14');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 7 , '2019-12-05');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 164 , '2018-10-29');
insert into groupaccount (GroupID, AccountID, JoinDate) values (3, 11 , '2018-07-31');insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 156 , '2019-07-14');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 94 , '2019-08-31');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 210 , '2021-01-23');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 42 , '2020-03-27');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 109 , '2019-01-13');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 215 , '2019-09-16');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 79 , '2020-07-14');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 183 , '2019-10-26');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 231 , '2020-05-08');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 85 , '2019-12-04');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 127 , '2019-06-12');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 123 , '2020-10-19');
insert into groupaccount (GroupID, AccountID, JoinDate) values (3, 172 , '2018-11-21');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 207 , '2019-01-26');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 19 , '2020-09-02');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 250 , '2020-09-05');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 221 , '2020-06-16');
insert into groupaccount (GroupID, AccountID, JoinDate) values (3, 45 , '2020-05-15');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 54 , '2018-03-12');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 239 , '2020-06-13');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 158 , '2020-12-18');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 2 , '2019-09-01');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 230 , '2020-03-24');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 137 , '2019-02-09');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 223 , '2020-10-10');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 53 , '2019-08-15');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 152 , '2019-08-07');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 244 , '2019-12-15');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 19 , '2018-09-09');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 243 , '2019-05-20');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 186 , '2020-04-05');insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 253 , '2020-01-05');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 204 , '2020-07-04');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 172 , '2018-06-30');
insert into groupaccount (GroupID, AccountID, JoinDate) values (3, 123 , '2019-11-25');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 131 , '2018-07-03');
insert into groupaccount (GroupID, AccountID, JoinDate) values (3, 66 , '2020-11-05');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 214 , '2018-05-13');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 182 , '2020-03-04');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 82 , '2021-02-18');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 156 , '2020-10-09');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 89 , '2019-07-20');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 233 , '2018-10-31');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 121 , '2020-02-26');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 238 , '2019-10-13');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 179 , '2019-02-03');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 12 , '2021-01-14');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 166 , '2019-07-26');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 88 , '2020-12-01');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 53 , '2020-12-09');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 40 , '2020-04-01');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 222 , '2019-06-07');
insert into groupaccount (GroupID, AccountID, JoinDate) values (3, 31 , '2019-06-17');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 100 , '2021-01-16');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 107 , '2019-04-25');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 253 , '2020-11-30');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 249 , '2020-03-03');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 167 , '2018-08-12');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 44 , '2021-02-03');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 70 , '2020-08-22');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 205 , '2018-04-26');
insert into groupaccount (GroupID, AccountID, JoinDate) values (5, 181 , '2019-04-08');insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 30 , '2020-04-12');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 241 , '2021-02-23');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 232 , '2019-02-05');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 120 , '2019-04-26');
insert into groupaccount (GroupID, AccountID, JoinDate) values (3, 130 , '2020-10-13');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 39 , '2020-01-01');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 240 , '2019-01-05');
insert into groupaccount (GroupID, AccountID, JoinDate) values (3, 62 , '2019-02-06');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 180 , '2018-08-11');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 171 , '2018-11-27');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 168 , '2019-07-02');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 84 , '2020-11-29');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 14 , '2020-07-17');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 56 , '2020-11-17');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 191 , '2021-02-24');
insert into groupaccount (GroupID, AccountID, JoinDate) values (4, 160 , '2021-02-05');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 133 , '2020-01-28');
insert into groupaccount (GroupID, AccountID, JoinDate) values (1, 92 , '2018-03-23');
insert into groupaccount (GroupID, AccountID, JoinDate) values (3, 126 , '2019-07-13');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 216 , '2020-04-25');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 157 , '2020-04-22');
insert into groupaccount (GroupID, AccountID, JoinDate) values (2, 184 , '2020-04-29');
insert into groupaccount (GroupID, AccountID, JoinDate) values (6, 40 , '2019-09-21');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 217 , '2020-10-26');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 127 , '2018-06-27');
insert into groupaccount (GroupID, AccountID, JoinDate) values (9, 50 , '2020-08-25');
insert into groupaccount (GroupID, AccountID, JoinDate) values (7, 238 , '2020-04-23');
insert into groupaccount (GroupID, AccountID, JoinDate) values (10, 166 , '2020-12-22');
insert into groupaccount (GroupID, AccountID, JoinDate) values (8, 249 , '2019-07-31');
INSERT INTO TypeQuestion (TypeName )
VALUES ('Essay' ),('Multiple-Choice' );
INSERT INTO CategoryQuestion (CategoryName )
VALUES ('Java' ),
('ASP.NET' ),
('ADO.NET' ),
('SQL' ),
('Postman' ),
('Ruby' ),
('Python' ),
('C++' ),
('C Sharp' ),
('PHP' );
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3642 eJD', 5, 1, 119, '2019-03-12');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3019 iSY', 10, 2, 88, '2019-09-20');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4860 k6T', 2, 2, 117, '2020-10-01');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6896 rPU', 6, 2, 101, '2018-10-29');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8823 cwX', 8, 2, 55, '2019-01-19');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8430 bD5', 7, 1, 234, '2018-09-15');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9538 sjU', 2, 1, 149, '2018-06-15');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8934 oJL', 3, 2, 173, '2020-11-18');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3505 ppI', 4, 1, 160, '2018-07-11');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7641 zR2', 10, 2, 158, '2019-07-15');insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3328 sMB', 4, 2, 178, '2019-08-01');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7404 kV6', 6, 2, 231, '2018-10-23');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6939 sdF', 10, 1, 17, '2020-03-17');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3233 fnX', 4, 2, 147, '2019-11-11');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3830 iG2', 9, 2, 198, '2019-02-21');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4997 vDW', 2, 1, 80, '2018-12-26');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7836 yVR', 10, 1, 112, '2020-05-25');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8287 tiW', 9, 1, 200, '2018-06-18');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9420 eg2', 10, 1, 148, '2020-01-07');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5208 yi6', 5, 2, 225, '2020-12-15');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3565 z66', 10, 2, 73, '2018-09-10');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0804 blJ', 6, 2, 243, '2018-10-05');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6741 sPN', 7, 1, 19, '2019-06-24');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5280 kX8', 10, 1, 152, '2019-06-20');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2803 yaS', 7, 2, 145, '2019-08-19');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1329 kON', 3, 1, 16, '2021-02-11');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0133 np5', 2, 2, 125, '2019-12-13');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2812 uE1', 5, 2, 127, '2020-06-02');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5574 ndU', 4, 1, 3, '2019-03-25');insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8625 oGT', 4, 2, 21, '2018-09-05');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2818 kJZ', 9, 2, 178, '2021-02-03');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4138 jp1', 8, 1, 6, '2020-07-28');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3882 buR', 3, 1, 49, '2018-10-15');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0161 mqA', 8, 2, 203, '2020-02-09');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5423 sZN', 6, 1, 77, '2020-02-09');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8236 lg0', 6, 2, 9, '2019-12-28');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8250 uJJ', 6, 1, 117, '2019-09-20');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2598 hMU', 5, 2, 43, '2019-07-14');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6214 xeV', 2, 2, 48, '2018-10-01');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3690 zF3', 2, 2, 8, '2019-10-10');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2168 jkX', 7, 1, 220, '2020-03-23');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3853 j34', 2, 1, 210, '2018-04-13');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9155 rZO', 10, 1, 75, '2018-10-30');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8869 bYZ', 2, 2, 223, '2020-05-06');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1536 xRP', 9, 1, 150, '2019-09-16');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0508 jJU', 7, 1, 225, '2020-12-12');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1572 fm5', 3, 1, 7, '2019-12-30');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4063 p06', 6, 2, 161, '2019-08-25');insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2840 mfW', 10, 2, 33, '2018-11-14');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2014 kV3', 5, 2, 69, '2019-07-08');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4459 r8Q', 3, 2, 3, '2019-11-30');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4260 eUD', 7, 2, 14, '2019-03-12');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3872 sW2', 6, 1, 12, '2020-07-13');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0411 ykO', 2, 2, 39, '2020-08-01');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5185 qxQ', 3, 1, 164, '2019-10-02');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5926 gPY', 3, 2, 122, '2020-12-10');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9380 gxQ', 8, 2, 148, '2019-01-03');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7846 k8Q', 7, 1, 56, '2018-10-09');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6195 lyP', 5, 1, 241, '2018-12-23');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5286 h3I', 2, 2, 175, '2020-02-09');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1571 v14', 10, 1, 44, '2018-05-30');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8100 kF1', 5, 2, 155, '2018-04-13');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4566 wRT', 9, 2, 132, '2018-05-12');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9360 sZC', 8, 1, 198, '2019-10-03');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0321 jnP', 10, 2, 145, '2020-09-06');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3286 tuS', 7, 1, 25, '2020-02-16');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6415 r3P', 9, 2, 38, '2020-07-18');insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9821 g8N', 1, 1, 78, '2020-02-15');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9859 vJH', 5, 2, 69, '2021-02-23');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8366 rY6', 5, 2, 56, '2018-08-12');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4901 p6X', 4, 1, 222, '2018-09-04');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9609 i1H', 5, 2, 145, '2018-08-27');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7773 iF9', 5, 1, 89, '2020-10-17');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1720 upJ', 10, 1, 77, '2018-08-02');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1994 yfZ', 10, 2, 90, '2019-02-11');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3419 yIL', 7, 2, 49, '2019-04-01');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7704 eME', 3, 1, 217, '2019-04-11');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1867 bwM', 9, 2, 212, '2019-09-20');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9660 h17', 9, 2, 179, '2021-02-05');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0061 xVP', 7, 1, 6, '2019-08-22');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0013 mKE', 4, 2, 57, '2020-01-31');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5518 fLL', 1, 1, 41, '2021-01-07');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8801 vUC', 9, 2, 107, '2018-06-09');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0040 x7O', 8, 2, 128, '2019-04-15');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9552 uTK', 4, 2, 179, '2020-09-08');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8762 spH', 2, 2, 193, '2019-07-26');insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7641 qyH', 7, 2, 248, '2018-04-30');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5375 vCT', 6, 2, 221, '2019-03-14');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8327 pCR', 6, 2, 247, '2019-02-25');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5244 fO9', 9, 2, 253, '2020-09-27');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4299 gaM', 8, 2, 41, '2020-01-03');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2349 iPX', 1, 2, 56, '2020-08-12');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0492 qpT', 1, 1, 157, '2019-08-29');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5953 a2B', 1, 2, 74, '2019-01-21');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8483 h3P', 3, 2, 249, '2020-02-24');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7653 tjM', 7, 2, 105, '2021-01-18');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3950 puC', 10, 1, 90, '2019-08-01');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3406 oHB', 2, 1, 185, '2019-04-06');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6818 qAS', 8, 2, 50, '2019-11-25');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2582 mwH', 5, 1, 138, '2018-10-11');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6809 uLL', 10, 1, 185, '2020-08-17');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2637 lRM', 8, 2, 148, '2019-12-20');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7544 oMQ', 10, 1, 174, '2020-12-10');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4107 tfS', 2, 1, 220, '2020-12-02');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4969 v2Z', 5, 2, 119, '2018-04-09');insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0416 kSH', 3, 1, 136, '2019-10-13');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8091 rdW', 4, 1, 80, '2018-07-23');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3267 tWT', 5, 1, 125, '2019-08-03');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7544 nC0', 10, 2, 22, '2018-07-10');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8408 us9', 7, 2, 213, '2019-04-06');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2219 rUX', 5, 1, 88, '2018-09-17');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5144 cmL', 7, 1, 156, '2020-10-09');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5821 trL', 3, 1, 146, '2021-02-01');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3816 rsY', 5, 2, 228, '2021-01-22');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8708 vj0', 3, 2, 178, '2019-07-09');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5068 iF6', 8, 1, 188, '2020-01-20');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3355 arE', 4, 2, 127, '2019-06-05');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6150 aZZ', 4, 1, 78, '2018-04-24');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5110 b6R', 7, 1, 202, '2020-04-28');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1718 dQB', 10, 1, 122, '2018-05-21');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5829 huN', 3, 1, 109, '2020-10-05');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2427 eRH', 8, 2, 190, '2019-10-20');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2345 dJI', 8, 2, 164, '2018-05-12');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8893 beL', 1, 1, 97, '2020-04-22');insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4497 sEW', 7, 2, 65, '2020-05-06');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5432 nT5', 2, 1, 233, '2020-05-22');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2685 a13', 3, 1, 15, '2019-06-10');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3783 yUK', 9, 1, 105, '2018-05-24');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8148 zfP', 1, 1, 208, '2019-07-16');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9281 oqF', 3, 1, 77, '2018-03-20');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6106 oTR', 7, 2, 202, '2018-09-30');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8169 o4Q', 10, 2, 80, '2019-08-28');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8911 zUM', 10, 2, 17, '2019-12-11');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7806 pfG', 2, 2, 187, '2019-07-08');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1662 gLN', 8, 2, 123, '2018-05-06');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3052 el9', 2, 1, 182, '2018-06-26');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6154 mD9', 8, 2, 56, '2020-07-20');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4335 d02', 10, 2, 61, '2020-02-27');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2786 oqD', 1, 1, 27, '2019-10-18');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8002 iCW', 6, 1, 56, '2018-12-11');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3854 cOC', 10, 1, 219, '2019-08-23');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6593 r05', 6, 1, 145, '2020-12-17');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7547 qTA', 3, 1, 192, '2019-07-29');insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9947 wPD', 9, 1, 55, '2019-05-14');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5894 xTH', 4, 1, 156, '2021-01-19');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7279 gK3', 10, 1, 242, '2020-04-29');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3213 pWM', 5, 1, 35, '2020-03-08');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4734 hG4', 9, 1, 47, '2018-04-23');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0893 cRG', 4, 2, 164, '2020-11-27');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8206 bJM', 10, 2, 97, '2020-02-10');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6996 kUF', 2, 2, 201, '2018-12-13');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6116 gXN', 6, 2, 45, '2020-01-14');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4981 kaF', 2, 1, 58, '2018-08-27');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4383 tGQ', 1, 2, 15, '2019-12-07');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9348 s9L', 7, 2, 62, '2019-11-10');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5002 s77', 2, 1, 70, '2018-09-24');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7181 umT', 8, 2, 42, '2019-05-06');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6349 pK6', 2, 2, 247, '2021-02-13');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7116 cFF', 8, 2, 8, '2019-05-22');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5555 fGS', 2, 1, 131, '2021-02-16');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2343 w5G', 7, 1, 27, '2019-02-03');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4434 oh7', 3, 1, 230, '2018-05-03');insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1036 iR6', 7, 2, 181, '2018-05-08');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3438 vvH', 5, 2, 219, '2021-02-14');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9357 qtG', 8, 2, 196, '2018-10-06');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5067 jTO', 3, 2, 22, '2020-02-08');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8612 vTA', 1, 2, 213, '2020-01-23');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0446 wbZ', 5, 2, 202, '2018-08-16');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5419 gIK', 4, 1, 229, '2021-01-04');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9654 xrU', 2, 1, 101, '2020-11-05');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6597 ywL', 3, 1, 152, '2020-12-02');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2141 sFF', 9, 2, 95, '2021-01-16');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0888 ydD', 6, 2, 159, '2019-05-04');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6012 cpX', 9, 1, 60, '2020-07-08');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2952 wvT', 3, 1, 158, '2019-04-01');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2404 tME', 8, 1, 247, '2018-04-26');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7897 ppY', 8, 2, 113, '2018-11-16');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5221 hHT', 2, 1, 23, '2019-11-02');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1168 ukS', 7, 1, 94, '2020-06-01');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0913 py0', 10, 2, 191, '2019-05-28');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9520 qwJ', 10, 1, 19, '2019-11-26');insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0293 kTQ', 7, 2, 184, '2018-10-11');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8134 eA7', 10, 2, 110, '2018-09-18');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7785 n21', 4, 2, 225, '2019-12-01');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6113 kN6', 4, 1, 218, '2021-01-08');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1945 jeK', 7, 2, 38, '2021-02-27');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1509 udO', 1, 1, 97, '2020-10-22');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9794 ojF', 10, 1, 1, '2018-12-26');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8795 ahB', 6, 1, 194, '2019-01-16');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4678 g78', 5, 2, 182, '2018-05-06');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8293 uc9', 6, 1, 241, '2020-09-11');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0562 j1U', 6, 1, 103, '2019-04-26');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1864 ruK', 6, 1, 95, '2020-01-08');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1844 th5', 7, 2, 133, '2020-03-04');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6982 f8E', 7, 1, 169, '2020-11-06');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2230 zm5', 4, 2, 40, '2018-09-12');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2669 nW0', 10, 2, 87, '2018-11-16');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4220 lsN', 3, 2, 251, '2020-11-23');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8397 jZZ', 4, 2, 45, '2018-07-26');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0252 fd1', 6, 2, 170, '2021-02-15');insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5139 fqQ', 6, 1, 115, '2021-02-20');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1903 nlA', 7, 1, 241, '2018-11-23');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1606 o8R', 6, 2, 184, '2020-06-08');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2193 peA', 3, 1, 188, '2019-03-02');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0641 pVD', 6, 2, 190, '2018-10-16');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8254 nvU', 10, 1, 186, '2020-07-16');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4368 nSM', 2, 1, 89, '2018-11-27');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9672 y6P', 5, 2, 207, '2021-01-24');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5774 tl0', 8, 2, 224, '2020-08-28');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7651 z5P', 7, 2, 76, '2018-05-09');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3650 su3', 1, 1, 69, '2019-09-28');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2352 hQZ', 10, 1, 189, '2018-07-02');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4203 rnV', 7, 1, 212, '2019-05-28');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0463 muH', 2, 1, 198, '2019-09-09');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5963 xB3', 1, 2, 73, '2019-03-17');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5657 iII', 8, 1, 45, '2020-10-11');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2908 zKO', 10, 2, 31, '2018-10-10');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6304 hJG', 3, 2, 243, '2020-08-19');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3880 t30', 2, 2, 205, '2019-10-27');insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2586 m14', 3, 1, 14, '2019-05-02');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8922 tW9', 5, 2, 113, '2019-03-12');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7753 o3Y', 8, 1, 142, '2020-04-02');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7314 wf7', 6, 1, 103, '2018-08-07');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5398 gL8', 9, 1, 11, '2021-02-13');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8084 zvS', 4, 2, 25, '2019-01-08');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3627 oYJ', 3, 2, 124, '2020-02-17');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6282 t2E', 2, 2, 214, '2019-01-27');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7234 u92', 1, 1, 195, '2019-08-10');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2249 yQJ', 4, 1, 42, '2020-07-11');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8762 vuT', 10, 1, 215, '2018-03-09');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2107 c9S', 3, 1, 175, '2018-12-06');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1055 aSS', 9, 1, 130, '2020-08-13');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8798 nkK', 1, 1, 36, '2019-10-10');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9465 tMA', 9, 2, 77, '2018-08-13');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3488 nj0', 5, 1, 104, '2020-03-06');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8178 xoW', 3, 1, 168, '2018-11-09');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0277 o91', 10, 1, 184, '2020-07-15');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4484 vOR', 2, 1, 73, '2019-04-21');insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4069 tCZ', 9, 1, 61, '2019-08-26');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
4437 ag4', 2, 1, 170, '2019-06-20');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6115 cXO', 1, 1, 172, '2021-02-10');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3863 yEY', 5, 2, 47, '2019-01-20');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1356 dzC', 9, 1, 59, '2018-09-08');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
7843 tLR', 1, 2, 192, '2020-08-28');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0636 iP9', 6, 2, 50, '2020-05-07');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5817 eMD', 2, 1, 49, '2020-09-25');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9681 kMG', 3, 2, 202, '2020-02-12');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
3841 waY', 3, 2, 165, '2019-06-10');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
9930 nvM', 8, 1, 64, '2018-08-07');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
8902 aDT', 1, 1, 227, '2019-06-10');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2067 oTA', 5, 1, 139, '2020-08-17');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6410 f2W', 7, 2, 248, '2019-12-04');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2599 lL6', 9, 1, 21, '2020-01-15');
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1027', 59, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4825', 130, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5115', 21, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9582', 234, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8527', 76, 1);insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6529', 205, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9137', 40, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3510', 95, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4111', 59, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1323', 3, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6141', 21, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8454', 65, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9932', 55, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7723', 146, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1167', 200, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9553', 98, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5702', 145, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2261', 62, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9918', 66, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8863', 132, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8005', 169, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4603', 29, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8584', 168, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0371', 111, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7259', 207, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4285', 26, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7590', 224, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6891', 26, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4590', 53, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6183', 1, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9747', 216, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1845', 172, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1124', 151, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4975', 73, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1190', 114, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2603', 205, 1);insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6182', 64, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7777', 246, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1689', 12, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4087', 31, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3983', 75, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9652', 172, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0967', 111, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2724', 155, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5692', 95, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4594', 139, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5394', 241, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7462', 15, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7208', 43, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9156', 246, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3823', 77, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5701', 220, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4470', 206, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6822', 92, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4587', 159, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8288', 76, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5489', 207, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3292', 174, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3552', 114, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0366', 42, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8035', 23, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4394', 149, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1309', 220, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5933', 46, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3965', 79, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5903', 149, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5308', 26, 0);insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1739', 109, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1363', 180, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5311', 126, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3304', 203, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7026', 241, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8459', 38, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3884', 176, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0726', 180, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3786', 224, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6614', 171, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1093', 236, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7742', 120, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1955', 188, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1186', 67, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9951', 226, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4832', 50, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4416', 155, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2841', 52, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6639', 247, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7437', 17, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4428', 54, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2747', 135, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8022', 129, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7479', 222, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7828', 87, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0755', 43, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4141', 171, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5704', 167, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7914', 7, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0794', 231, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3958', 109, 0);insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3712', 123, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4111', 71, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7973', 174, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4576', 187, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8276', 185, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5881', 87, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7782', 110, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1653', 222, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8710', 215, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0895', 29, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6984', 31, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2407', 2, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7878', 177, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0378', 99, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6658', 218, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0409', 90, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7705', 43, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4526', 245, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1423', 25, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5380', 34, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5868', 67, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0195', 125, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8959', 109, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6827', 237, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6764', 43, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3346', 184, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5857', 232, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7412', 172, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6434', 100, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0154', 244, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3937', 20, 0);insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2753', 196, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8917', 213, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5445', 240, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8673', 143, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4080', 198, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9268', 33, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6486', 223, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4185', 91, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3830', 51, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2260', 13, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6513', 86, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6733', 9, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0894', 208, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8156', 253, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1686', 247, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3309', 137, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5635', 233, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7380', 179, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0332', 110, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8466', 4, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6164', 228, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6778', 145, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3207', 228, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6245', 225, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5323', 252, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2309', 141, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6624', 179, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2794', 52, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3381', 131, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4598', 109, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7919', 5, 0);insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4235', 215, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8232', 233, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3696', 175, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8801', 164, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6633', 39, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1414', 71, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8143', 207, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7571', 206, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3709', 164, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3971', 205, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0207', 225, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2365', 76, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6116', 69, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3096', 168, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9108', 117, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1754', 90, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9384', 166, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8499', 81, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6689', 6, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0180', 26, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0335', 96, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4718', 200, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2546', 252, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6839', 215, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1823', 208, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0408', 71, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4643', 44, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0727', 56, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1457', 35, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9780', 188, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2454', 41, 1);insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6044', 244, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9325', 134, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1809', 9, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1799', 248, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1809', 37, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1760', 146, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8259', 215, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4210', 101, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9364', 35, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0651', 247, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6635', 197, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2309', 132, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5443', 253, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7181', 73, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9241', 132, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6098', 242, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2310', 77, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0056', 126, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3251', 211, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8110', 78, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2374', 173, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1239', 86, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7685', 75, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8562', 207, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0784', 76, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7383', 72, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9719', 140, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3950', 211, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4250', 56, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 7658', 3, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8475', 87, 0);insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4449', 242, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2477', 47, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3539', 96, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9248', 210, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3911', 215, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4799', 31, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5895', 105, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2214', 51, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 4142', 156, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9458', 74, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1515', 157, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0973', 30, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9849', 76, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3472', 150, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 2994', 176, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0457', 217, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6944', 76, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5752', 117, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9946', 153, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 9712', 133, 0);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6438', 13, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0685', 121, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1716', 190, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 3209', 35, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 8146', 216, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6359', 175, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 0988', 62, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5992', 69, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 6113', 242, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 5098', 103, 1);
insert into Answer (Content, QuestionID, isCorrect) values ('Answers VTI 1898', 174, 0);INSERT INTO Exam (`Code` , Title , CategoryID
, Duration , CreatorID , CreateDate )
VALUES ('VTIQ001' , N'Đề thi C#' ,
1 , 60 , '5' ,'2019-04-05'),
('VTIQ002' , N'Đề thi PHP' ,
10 , 60 , '2' ,'2019-04-05'),
('VTIQ003' , N'Đề thi C++' , 9 ,
120 , '2' ,'2019-04-07'),
('VTIQ004' , N'Đề thi Java' , 6 , 60
, '3' ,'2020-04-08'),
('VTIQ005' , N'Đề thi Ruby' , 5 , 120
, '4' ,'2020-04-10'),
('VTIQ006' , N'Đề thi Postman' , 3 ,
60 , '6' ,'2020-04-05'),
('VTIQ007' , N'Đề thi SQL' , 2 ,
60 , '7' ,'2020-04-05'),
('VTIQ008' , N'Đề thi Python' , 8 ,
60 , '8' ,'2020-04-07'),
('VTIQ009' , N'Đề thi ADO.NET' , 4 ,
90 , '9' ,'2020-04-07'),
('VTIQ010' , N'Đề thi ASP.NET' , 7 ,
90 , '10' ,'2020-04-08');
insert into ExamQuestion (ExamID, QuestionID) values (2, 59);
insert into ExamQuestion (ExamID, QuestionID) values (10, 121);
insert into ExamQuestion (ExamID, QuestionID) values (2, 203);
insert into ExamQuestion (ExamID, QuestionID) values (7, 185);
insert into ExamQuestion (ExamID, QuestionID) values (2, 5);
insert into ExamQuestion (ExamID, QuestionID) values (10, 135);
insert into ExamQuestion (ExamID, QuestionID) values (10, 46);
insert into ExamQuestion (ExamID, QuestionID) values (2, 216);
insert into ExamQuestion (ExamID, QuestionID) values (1, 226);
insert into ExamQuestion (ExamID, QuestionID) values (3, 179);
insert into ExamQuestion (ExamID, QuestionID) values (4, 179);
insert into ExamQuestion (ExamID, QuestionID) values (8, 54);insert into ExamQuestion (ExamID, QuestionID) values (5, 196);
insert into ExamQuestion (ExamID, QuestionID) values (6, 82);
insert into ExamQuestion (ExamID, QuestionID) values (1, 156);
insert into ExamQuestion (ExamID, QuestionID) values (4, 209);
insert into ExamQuestion (ExamID, QuestionID) values (5, 248);
insert into ExamQuestion (ExamID, QuestionID) values (9, 109);
insert into ExamQuestion (ExamID, QuestionID) values (2, 180);
insert into ExamQuestion (ExamID, QuestionID) values (8, 94);
insert into ExamQuestion (ExamID, QuestionID) values (2, 248);
insert into ExamQuestion (ExamID, QuestionID) values (5, 253);
insert into ExamQuestion (ExamID, QuestionID) values (5, 180);
insert into ExamQuestion (ExamID, QuestionID) values (9, 228);
insert into ExamQuestion (ExamID, QuestionID) values (5, 4);
insert into ExamQuestion (ExamID, QuestionID) values (8, 129);
insert into ExamQuestion (ExamID, QuestionID) values (6, 163);
insert into ExamQuestion (ExamID, QuestionID) values (6, 151);
insert into ExamQuestion (ExamID, QuestionID) values (1, 227);
insert into ExamQuestion (ExamID, QuestionID) values (10, 190);
insert into ExamQuestion (ExamID, QuestionID) values (7, 217);
insert into ExamQuestion (ExamID, QuestionID) values (5, 194);
insert into ExamQuestion (ExamID, QuestionID) values (4, 38);
insert into ExamQuestion (ExamID, QuestionID) values (3, 55);
insert into ExamQuestion (ExamID, QuestionID) values (1, 180);
insert into ExamQuestion (ExamID, QuestionID) values (3, 134);
insert into ExamQuestion (ExamID, QuestionID) values (5, 100);
insert into ExamQuestion (ExamID, QuestionID) values (10, 93);
insert into ExamQuestion (ExamID, QuestionID) values (6, 34);
insert into ExamQuestion (ExamID, QuestionID) values (8, 133);
insert into ExamQuestion (ExamID, QuestionID) values (8, 22);
insert into ExamQuestion (ExamID, QuestionID) values (6, 239);
insert into ExamQuestion (ExamID, QuestionID) values (6, 42);insert into ExamQuestion (ExamID, QuestionID) values (9, 123);
insert into ExamQuestion (ExamID, QuestionID) values (6, 225);
insert into ExamQuestion (ExamID, QuestionID) values (1, 146);
insert into ExamQuestion (ExamID, QuestionID) values (9, 30);
insert into ExamQuestion (ExamID, QuestionID) values (10, 136);
insert into ExamQuestion (ExamID, QuestionID) values (9, 152);
insert into ExamQuestion (ExamID, QuestionID) values (5, 237);
insert into ExamQuestion (ExamID, QuestionID) values (1, 157);
insert into ExamQuestion (ExamID, QuestionID) values (1, 253);
insert into ExamQuestion (ExamID, QuestionID) values (8, 69);
insert into ExamQuestion (ExamID, QuestionID) values (7, 204);
insert into ExamQuestion (ExamID, QuestionID) values (6, 19);
insert into ExamQuestion (ExamID, QuestionID) values (3, 59);
insert into ExamQuestion (ExamID, QuestionID) values (4, 248);
insert into ExamQuestion (ExamID, QuestionID) values (3, 235);
insert into ExamQuestion (ExamID, QuestionID) values (5, 251);
insert into ExamQuestion (ExamID, QuestionID) values (5, 220);
insert into ExamQuestion (ExamID, QuestionID) values (4, 105);
insert into ExamQuestion (ExamID, QuestionID) values (7, 214);
insert into ExamQuestion (ExamID, QuestionID) values (8, 201);
insert into ExamQuestion (ExamID, QuestionID) values (3, 180);
insert into ExamQuestion (ExamID, QuestionID) values (2, 38);
insert into ExamQuestion (ExamID, QuestionID) values (9, 4);
insert into ExamQuestion (ExamID, QuestionID) values (4, 215);
insert into ExamQuestion (ExamID, QuestionID) values (3, 38);
insert into ExamQuestion (ExamID, QuestionID) values (2, 116);
insert into ExamQuestion (ExamID, QuestionID) values (6, 226);
insert into ExamQuestion (ExamID, QuestionID) values (8, 218);
insert into ExamQuestion (ExamID, QuestionID) values (8, 209);
insert into ExamQuestion (ExamID, QuestionID) values (1, 240);
insert into ExamQuestion (ExamID, QuestionID) values (7, 76);insert into ExamQuestion (ExamID, QuestionID) values (1, 167);
insert into ExamQuestion (ExamID, QuestionID) values (10, 89);
insert into ExamQuestion (ExamID, QuestionID) values (2, 184);
insert into ExamQuestion (ExamID, QuestionID) values (2, 225);
insert into ExamQuestion (ExamID, QuestionID) values (10, 8);
insert into ExamQuestion (ExamID, QuestionID) values (10, 178);
insert into ExamQuestion (ExamID, QuestionID) values (9, 7);
insert into ExamQuestion (ExamID, QuestionID) values (9, 129);
insert into ExamQuestion (ExamID, QuestionID) values (9, 239);
insert into ExamQuestion (ExamID, QuestionID) values (7, 237);
insert into ExamQuestion (ExamID, QuestionID) values (8, 27);
insert into ExamQuestion (ExamID, QuestionID) values (7, 118);
insert into ExamQuestion (ExamID, QuestionID) values (7, 202);
insert into ExamQuestion (ExamID, QuestionID) values (8, 117);
insert into ExamQuestion (ExamID, QuestionID) values (9, 134);
insert into ExamQuestion (ExamID, QuestionID) values (4, 122);
insert into ExamQuestion (ExamID, QuestionID) values (5, 131);
insert into ExamQuestion (ExamID, QuestionID) values (5, 235);
insert into ExamQuestion (ExamID, QuestionID) values (9, 233);
insert into ExamQuestion (ExamID, QuestionID) values (10, 200);
insert into ExamQuestion (ExamID, QuestionID) values (2, 159);
insert into ExamQuestion (ExamID, QuestionID) values (4, 26);
insert into ExamQuestion (ExamID, QuestionID) values (5, 49);
insert into ExamQuestion (ExamID, QuestionID) values (3, 191);
insert into ExamQuestion (ExamID, QuestionID) values (5, 114);
insert into ExamQuestion (ExamID, QuestionID) values (10, 138);
insert into ExamQuestion (ExamID, QuestionID) values (1, 247);
insert into ExamQuestion (ExamID, QuestionID) values (10, 220);
insert into ExamQuestion (ExamID, QuestionID) values (4, 75);
insert into ExamQuestion (ExamID, QuestionID) values (7, 196);
insert into ExamQuestion (ExamID, QuestionID) values (10, 242);insert into ExamQuestion (ExamID, QuestionID) values (6, 249);
insert into ExamQuestion (ExamID, QuestionID) values (7, 84);
insert into ExamQuestion (ExamID, QuestionID) values (6, 55);
insert into ExamQuestion (ExamID, QuestionID) values (6, 18);
insert into ExamQuestion (ExamID, QuestionID) values (1, 209);
insert into ExamQuestion (ExamID, QuestionID) values (3, 190);
insert into ExamQuestion (ExamID, QuestionID) values (8, 60);
insert into ExamQuestion (ExamID, QuestionID) values (7, 74);
insert into ExamQuestion (ExamID, QuestionID) values (5, 87);
insert into ExamQuestion (ExamID, QuestionID) values (1, 154);
insert into ExamQuestion (ExamID, QuestionID) values (1, 113);
insert into ExamQuestion (ExamID, QuestionID) values (3, 150);
insert into ExamQuestion (ExamID, QuestionID) values (6, 6);
insert into ExamQuestion (ExamID, QuestionID) values (3, 154);
insert into ExamQuestion (ExamID, QuestionID) values (1, 169);
insert into ExamQuestion (ExamID, QuestionID) values (10, 132);
insert into ExamQuestion (ExamID, QuestionID) values (9, 27);
insert into ExamQuestion (ExamID, QuestionID) values (1, 213);
insert into ExamQuestion (ExamID, QuestionID) values (3, 225);
insert into ExamQuestion (ExamID, QuestionID) values (5, 46);
insert into ExamQuestion (ExamID, QuestionID) values (2, 109);
insert into ExamQuestion (ExamID, QuestionID) values (6, 112);
insert into ExamQuestion (ExamID, QuestionID) values (1, 47);
insert into ExamQuestion (ExamID, QuestionID) values (2, 84);
insert into ExamQuestion (ExamID, QuestionID) values (7, 19);
insert into ExamQuestion (ExamID, QuestionID) values (10, 62);
insert into ExamQuestion (ExamID, QuestionID) values (9, 225);
insert into ExamQuestion (ExamID, QuestionID) values (4, 247);
insert into ExamQuestion (ExamID, QuestionID) values (8, 156);
insert into ExamQuestion (ExamID, QuestionID) values (3, 26);
insert into ExamQuestion (ExamID, QuestionID) values (10, 88);insert into ExamQuestion (ExamID, QuestionID) values (9, 6);
insert into ExamQuestion (ExamID, QuestionID) values (7, 136);
insert into ExamQuestion (ExamID, QuestionID) values (7, 187);
insert into ExamQuestion (ExamID, QuestionID) values (10, 210);
insert into ExamQuestion (ExamID, QuestionID) values (9, 242);
insert into ExamQuestion (ExamID, QuestionID) values (4, 47);
insert into ExamQuestion (ExamID, QuestionID) values (1, 143);
insert into ExamQuestion (ExamID, QuestionID) values (1, 11);
insert into ExamQuestion (ExamID, QuestionID) values (7, 32);
insert into ExamQuestion (ExamID, QuestionID) values (9, 95);
insert into ExamQuestion (ExamID, QuestionID) values (9, 151);
insert into ExamQuestion (ExamID, QuestionID) values (1, 90);
insert into ExamQuestion (ExamID, QuestionID) values (2, 174);
insert into ExamQuestion (ExamID, QuestionID) values (6, 87);
insert into ExamQuestion (ExamID, QuestionID) values (9, 172);
insert into ExamQuestion (ExamID, QuestionID) values (6, 132);
insert into ExamQuestion (ExamID, QuestionID) values (1, 4);
insert into ExamQuestion (ExamID, QuestionID) values (6, 56);
insert into ExamQuestion (ExamID, QuestionID) values (5, 22);
insert into ExamQuestion (ExamID, QuestionID) values (8, 37);
insert into ExamQuestion (ExamID, QuestionID) values (1, 69);
insert into ExamQuestion (ExamID, QuestionID) values (10, 68);
insert into ExamQuestion (ExamID, QuestionID) values (3, 203);
insert into ExamQuestion (ExamID, QuestionID) values (9, 241);
insert into ExamQuestion (ExamID, QuestionID) values (5, 12);
insert into ExamQuestion (ExamID, QuestionID) values (2, 70);
insert into ExamQuestion (ExamID, QuestionID) values (1, 252);
insert into ExamQuestion (ExamID, QuestionID) values (1, 196);
insert into ExamQuestion (ExamID, QuestionID) values (6, 32);
insert into ExamQuestion (ExamID, QuestionID) values (9, 51);
insert into ExamQuestion (ExamID, QuestionID) values (1, 68);insert into ExamQuestion (ExamID, QuestionID) values (2, 209);
insert into ExamQuestion (ExamID, QuestionID) values (3, 167);
insert into ExamQuestion (ExamID, QuestionID) values (6, 94);
insert into ExamQuestion (ExamID, QuestionID) values (2, 30);
insert into ExamQuestion (ExamID, QuestionID) values (9, 37);
insert into ExamQuestion (ExamID, QuestionID) values (1, 155);
insert into ExamQuestion (ExamID, QuestionID) values (3, 130);
insert into ExamQuestion (ExamID, QuestionID) values (9, 207);
insert into ExamQuestion (ExamID, QuestionID) values (9, 245);
insert into ExamQuestion (ExamID, QuestionID) values (6, 2);
insert into ExamQuestion (ExamID, QuestionID) values (1, 149);
insert into ExamQuestion (ExamID, QuestionID) values (3, 40);
insert into ExamQuestion (ExamID, QuestionID) values (3, 208);
insert into ExamQuestion (ExamID, QuestionID) values (3, 25);
insert into ExamQuestion (ExamID, QuestionID) values (4, 80);
insert into ExamQuestion (ExamID, QuestionID) values (8, 57);
insert into ExamQuestion (ExamID, QuestionID) values (5, 244);
insert into ExamQuestion (ExamID, QuestionID) values (8, 192);
insert into ExamQuestion (ExamID, QuestionID) values (5, 179);
insert into ExamQuestion (ExamID, QuestionID) values (7, 127);
insert into ExamQuestion (ExamID, QuestionID) values (9, 5);
insert into ExamQuestion (ExamID, QuestionID) values (2, 13);
insert into ExamQuestion (ExamID, QuestionID) values (3, 121);
insert into ExamQuestion (ExamID, QuestionID) values (8, 138);
insert into ExamQuestion (ExamID, QuestionID) values (7, 201);
insert into ExamQuestion (ExamID, QuestionID) values (9, 188);
insert into ExamQuestion (ExamID, QuestionID) values (3, 89);
insert into ExamQuestion (ExamID, QuestionID) values (6, 240);
insert into ExamQuestion (ExamID, QuestionID) values (4, 183);
insert into ExamQuestion (ExamID, QuestionID) values (2, 93);
insert into ExamQuestion (ExamID, QuestionID) values (5, 43);insert into ExamQuestion (ExamID, QuestionID) values (2, 129);
insert into ExamQuestion (ExamID, QuestionID) values (2, 236);
insert into ExamQuestion (ExamID, QuestionID) values (8, 72);
insert into ExamQuestion (ExamID, QuestionID) values (6, 50);
insert into ExamQuestion (ExamID, QuestionID) values (3, 194);
insert into ExamQuestion (ExamID, QuestionID) values (5, 158);
insert into ExamQuestion (ExamID, QuestionID) values (2, 249);
insert into ExamQuestion (ExamID, QuestionID) values (1, 214);
insert into ExamQuestion (ExamID, QuestionID) values (6, 156);
insert into ExamQuestion (ExamID, QuestionID) values (3, 109);
insert into ExamQuestion (ExamID, QuestionID) values (8, 78);
insert into ExamQuestion (ExamID, QuestionID) values (1, 87);
insert into ExamQuestion (ExamID, QuestionID) values (5, 171);
insert into ExamQuestion (ExamID, QuestionID) values (3, 20);
insert into ExamQuestion (ExamID, QuestionID) values (2, 82);
insert into ExamQuestion (ExamID, QuestionID) values (7, 159);
insert into ExamQuestion (ExamID, QuestionID) values (6, 133);
insert into ExamQuestion (ExamID, QuestionID) values (3, 58);
insert into ExamQuestion (ExamID, QuestionID) values (9, 120);
insert into ExamQuestion (ExamID, QuestionID) values (3, 160);
insert into ExamQuestion (ExamID, QuestionID) values (5, 20);
insert into ExamQuestion (ExamID, QuestionID) values (1, 39);
insert into ExamQuestion (ExamID, QuestionID) values (4, 187);
insert into ExamQuestion (ExamID, QuestionID) values (10, 218);
insert into ExamQuestion (ExamID, QuestionID) values (7, 90);
insert into ExamQuestion (ExamID, QuestionID) values (7, 5);
insert into ExamQuestion (ExamID, QuestionID) values (3, 35);
insert into ExamQuestion (ExamID, QuestionID) values (8, 5);
insert into ExamQuestion (ExamID, QuestionID) values (4, 194);
insert into ExamQuestion (ExamID, QuestionID) values (7, 242);
insert into ExamQuestion (ExamID, QuestionID) values (4, 242);insert into ExamQuestion (ExamID, QuestionID) values (5, 78);
insert into ExamQuestion (ExamID, QuestionID) values (8, 249);
insert into ExamQuestion (ExamID, QuestionID) values (9, 253);
insert into ExamQuestion (ExamID, QuestionID) values (10, 179);
insert into ExamQuestion (ExamID, QuestionID) values (1, 166);
insert into ExamQuestion (ExamID, QuestionID) values (1, 150);
insert into ExamQuestion (ExamID, QuestionID) values (6, 25);
insert into ExamQuestion (ExamID, QuestionID) values (6, 70);
insert into ExamQuestion (ExamID, QuestionID) values (7, 183);
insert into ExamQuestion (ExamID, QuestionID) values (9, 250);
insert into ExamQuestion (ExamID, QuestionID) values (1, 95);
insert into ExamQuestion (ExamID, QuestionID) values (2, 92);
insert into ExamQuestion (ExamID, QuestionID) values (7, 6);
insert into ExamQuestion (ExamID, QuestionID) values (1, 238);
insert into ExamQuestion (ExamID, QuestionID) values (1, 182);
insert into ExamQuestion (ExamID, QuestionID) values (8, 158);
insert into ExamQuestion (ExamID, QuestionID) values (6, 242);
insert into ExamQuestion (ExamID, QuestionID) values (1, 145);
insert into ExamQuestion (ExamID, QuestionID) values (7, 126);
insert into ExamQuestion (ExamID, QuestionID) values (4, 177);
insert into ExamQuestion (ExamID, QuestionID) values (3, 135);
insert into ExamQuestion (ExamID, QuestionID) values (6, 62);
insert into ExamQuestion (ExamID, QuestionID) values (8, 107);