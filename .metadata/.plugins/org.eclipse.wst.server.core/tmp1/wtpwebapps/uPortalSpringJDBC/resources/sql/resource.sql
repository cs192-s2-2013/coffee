create table if not exists colleges(
	collegeid int not null auto_increment,
	collegename varchar(55) not null,
	primary key (collegeid)
)ENGINE = InnoDB;
insert into colleges (collegename) value ('College of Arts and Letters');
insert into colleges (collegename) value ('College of Fine Arts');
insert into colleges (collegename) value ('College of Human Kinetics');
insert into colleges (collegename) value ('College of Mass Communications');
insert into colleges (collegename) value ('College of Music');
insert into colleges (collegename) value ('Asian Institute of Tourism');
insert into colleges (collegename) value ('College of Education');
insert into colleges (collegename) value ('Institute of Islamic Studies');
insert into colleges (collegename) value ('College of Law');
insert into colleges (collegename) value ('College of Social Work and Community Development');
insert into colleges (collegename) value ('College of Social Sciences and Philosophy');
insert into colleges (collegename) value ('College of Business Administration');
insert into colleges (collegename) value ('School of Economics');
insert into colleges (collegename) value ('National College of Public Administration and Governance');
insert into colleges (collegename) value ('College of Architecture');
insert into colleges (collegename) value ('College of Engineering');
insert into colleges (collegename) value ('College of Home Economics');
insert into colleges (collegename) value ('College of Science');
insert into colleges (collegename) value ('School of Statistics');
insert into colleges (collegename) value ('School of Library and Information Studies');


grant all privileges on uportaldb.colleges to 'java'@'localhost' with grant option;

create table if not exists departments(
	collegeid int not null,
	deptid int not null auto_increment,
	deptname varchar(70),
	primary key (deptid),
	constraint fk_collegeid foreign key (collegeid)
	references colleges(collegeid)
)ENGINE = InnoDB;

insert into departments (collegeid, deptname) value (1, 'Department of Art Studies');
insert into departments (collegeid, deptname) value (1, 'Department of English and Comparative Literature');
insert into departments (collegeid, deptname) value (1, 'Department of European Languages');
insert into departments (collegeid, deptname) value (1, 'Department of Filipino and Philippine Literature');
insert into departments (collegeid, deptname) value (1, 'Department of Speech Communication and Theatre Arts');
insert into departments (collegeid, deptname) value (1, 'Institute of Creative Writing');
insert into departments (collegeid, deptname) value (2, '');
insert into departments (collegeid, deptname) value (3, '');
insert into departments (collegeid, deptname) value (4, 'Department of Broadcast Communication');
insert into departments (collegeid, deptname) value (4, 'Department of Communication Research');
insert into departments (collegeid, deptname) value (4, 'Department of Graduate Studies');
insert into departments (collegeid, deptname) value (4, 'Department of Broadcast Communication');
insert into departments (collegeid, deptname) value (4, 'Department of Journalism');
insert into departments (collegeid, deptname) value (4, 'UP Film Institute');
insert into departments (collegeid, deptname) value (5, 'Department of Broadcast Communication');
insert into departments (collegeid, deptname) value (5, 'Department of Communication Research');
insert into departments (collegeid, deptname) value (5, 'Department of Graduate Studies');
insert into departments (collegeid, deptname) value (6, '');
insert into departments (collegeid, deptname) value (7, '');
insert into departments (collegeid, deptname) value (8, '');
insert into departments (collegeid, deptname) value (9, '');
insert into departments (collegeid, deptname) value (10, 'Department of Community Development');
insert into departments (collegeid, deptname) value (10, 'Department of Social Work');
insert into departments (collegeid, deptname) value (10, 'Department of Woment and Development Studies');
insert into departments (collegeid, deptname) value (11, 'Department of Anthropology');
insert into departments (collegeid, deptname) value (11, 'Department of Geography');
insert into departments (collegeid, deptname) value (11, 'Department of History');
insert into departments (collegeid, deptname) value (11, 'Department of Linguistics');
insert into departments (collegeid, deptname) value (11, 'Department of Philosophy');
insert into departments (collegeid, deptname) value (11, 'Department of Political Science');
insert into departments (collegeid, deptname) value (11, 'Department of Psychology');
insert into departments (collegeid, deptname) value (11, 'Department of Psychology');
insert into departments (collegeid, deptname) value (12, '');
insert into departments (collegeid, deptname) value (13, '');
insert into departments (collegeid, deptname) value (14, '');
insert into departments (collegeid, deptname) value (15, '');
insert into departments (collegeid, deptname) value (16, 'Institute of Civil Engineering');
insert into departments (collegeid, deptname) value (16, 'Electrical and Electronics Engineering Institute');
insert into departments (collegeid, deptname) value (16, 'Department of Chemical Engineering');
insert into departments (collegeid, deptname) value (16, 'Department of Computer Science');
insert into departments (collegeid, deptname) value (16, 'Department of Geodetic Engineering');
insert into departments (collegeid, deptname) value (16, 'Department of Industrial Engineering and Operations Research');
insert into departments (collegeid, deptname) value (16, 'Department of Mechanical Engineering');
insert into departments (collegeid, deptname) value (16, 'Department of Mining, Metallurgical, and Materials Engineering');
insert into departments (collegeid, deptname) value (17, 'Department of Clothing, Textiles & Interior Design');
insert into departments (collegeid, deptname) value (17, 'Department of Family Life and Child Development');
insert into departments (collegeid, deptname) value (17, 'Department of Food Science and Nutrition');
insert into departments (collegeid, deptname) value (17, 'Department of Home Economics Education');
insert into departments (collegeid, deptname) value (17, 'Department of Hotel, Restaurant and Institution Management');
insert into departments (collegeid, deptname) value (18, 'Institute of Biology');
insert into departments (collegeid, deptname) value (18, 'Institute of Chemistry');
insert into departments (collegeid, deptname) value (18, 'National Institute of Geological Sciences');
insert into departments (collegeid, deptname) value (18, 'National Institute of Physics');
insert into departments (collegeid, deptname) value (18, 'Institute of Mathematics');
insert into departments (collegeid, deptname) value (18, 'Molecular Biology and Biotechnology');
insert into departments (collegeid, deptname) value (19, '');
insert into departments (collegeid, deptname) value (20, '');





grant all privileges on uportaldb.departments to 'java'@'localhost' with grant option;

create table if not exists courses(
	deptid int not null,
	courseid int not null auto_increment,
	coursename varchar(55) not null,
	primary key (courseid),
	constraint fk_deptid foreign key (deptid)
	references departments(deptid)
)ENGINE = InnoDB;

insert into courses (deptid, coursename) value (1, 'BA Art History');
insert into courses (deptid, coursename) value (1, 'BA Interdiciplinary');
insert into courses (deptid, coursename) value (1, 'BA Philippine Art');
insert into courses (deptid, coursename) value (2, 'BA English Studies');
insert into courses (deptid, coursename) value (2, 'BA Comparative Literature');
insert into courses (deptid, coursename) value (2, 'BA Creative Writing');
insert into courses (deptid, coursename) value (3, 'BA European Languages');
insert into courses (deptid, coursename) value (4, 'BA Malikhaing Pagsulat');
insert into courses (deptid, coursename) value (5, 'BA Speech Communication');
insert into courses (deptid, coursename) value (6, 'Bachelor of Fine Arts');
insert into courses (deptid, coursename) value (7, 'Certificate in Sports Studies');
insert into courses (deptid, coursename) value (7, 'Bachelor of Physical Education');
insert into courses (deptid, coursename) value (7, 'Bachelor of Sport Science');
insert into courses (deptid, coursename) value (7, 'Diploma in Exercise and Sport Science');
insert into courses (deptid, coursename) value (8, 'BA Broadcast Communication');
insert into courses (deptid, coursename) value (9, 'BA Communication Research');
insert into courses (deptid, coursename) value (10, 'MA in Communication ');
insert into courses (deptid, coursename) value (11, 'BA Journalism');
insert into courses (deptid, coursename) value (12, 'BA Film');
insert into courses (deptid, coursename) value (13, 'Certificate in Music');
insert into courses (deptid, coursename) value (13, 'Diploma in Creative and Performing Musical Arts');
insert into courses (deptid, coursename) value (13, 'Bachelor of Music');
insert into courses (deptid, coursename) value (14, 'BS Tourism');
insert into courses (deptid, coursename) value (14, 'BS Tourism');
insert into courses (deptid, coursename) value (15, 'Bachelor of Elementary Education');
insert into courses (deptid, coursename) value (15, 'Bachelor of Secondary Education');
insert into courses (deptid, coursename) value (16, 'MA Islamic Studies');
insert into courses (deptid, coursename) value (17, 'Juris Doctor');
insert into courses (deptid, coursename) value (18, 'BS Community Development');
insert into courses (deptid, coursename) value (18, 'BS Social Work');
insert into courses (deptid, coursename) value (18, 'Diploma in Women Development');
insert into courses (deptid, coursename) value (19, 'BA Anthropology');
insert into courses (deptid, coursename) value (20, 'BA Geography');
insert into courses (deptid, coursename) value (21, 'BA History');
insert into courses (deptid, coursename) value (22, 'BA Linguistics');
insert into courses (deptid, coursename) value (23, 'BA Philosophy');
insert into courses (deptid, coursename) value (24, 'BA Political Science');
insert into courses (deptid, coursename) value (25, 'BA/BS Psychology');
insert into courses (deptid, coursename) value (26, 'BA Sociology');
insert into courses (deptid, coursename) value (27, 'BS Business Administration');
insert into courses (deptid, coursename) value (27, 'BS Business Administration and Accountancy');
insert into courses (deptid, coursename) value (28, 'BS Economics');
insert into courses (deptid, coursename) value (28, 'BS Business Eonomics');
insert into courses (deptid, coursename) value (28, 'BA Public Add');
insert into courses (deptid, coursename) value (28, 'BS Architecture');
insert into courses (deptid, coursename) value (28, 'BS Landscape Architecture');
insert into courses (deptid, coursename) value (29, 'BS Civil Engineering');
insert into courses (deptid, coursename) value (29, 'BS Electrical Engineering');
insert into courses (deptid, coursename) value (29, 'BS Electronics Engineering');
insert into courses (deptid, coursename) value (29, 'BS Computer Engineering');
insert into courses (deptid, coursename) value (30, 'BS Chemical Engineering');
insert into courses (deptid, coursename) value (31, 'BS Computer Science');
insert into courses (deptid, coursename) value (32, 'BS Geodetic Engineering');
insert into courses (deptid, coursename) value (33, 'BS Industrial Engineering');
insert into courses (deptid, coursename) value (34, 'BS Mechanical Engineering');
insert into courses (deptid, coursename) value (35, 'BS Mining Engineering');
insert into courses (deptid, coursename) value (36, 'BS Metallurgical Engineering');
insert into courses (deptid, coursename) value (37, 'BS Materials Engineering');
insert into courses (deptid, coursename) value (38, 'BS Clothing Technology');
insert into courses (deptid, coursename) value (38, 'BS Industrial Design');
insert into courses (deptid, coursename) value (39, 'BS Clothing Technology');
insert into courses (deptid, coursename) value (39, 'BS Industrial Design');
insert into courses (deptid, coursename) value (40, 'BS Family and Child Development');
insert into courses (deptid, coursename) value (40, 'BS Industrial Design');
insert into courses (deptid, coursename) value (41, 'BS Community Nutrition');
insert into courses (deptid, coursename) value (42, 'BS Home Economics');
insert into courses (deptid, coursename) value (43, 'BS Hotel, Restaurant and Institution Management');
insert into courses (deptid, coursename) value (44, 'BS Biology');
insert into courses (deptid, coursename) value (45, 'BS Chemistry');
insert into courses (deptid, coursename) value (46, 'BS Geology');
insert into courses (deptid, coursename) value (47, 'BS Physics');
insert into courses (deptid, coursename) value (47, 'BS Applied Physics');
insert into courses (deptid, coursename) value (48, 'BS Mathematics');
insert into courses (deptid, coursename) value (49, 'BS Molecular Biology');
insert into courses (deptid, coursename) value (50, 'BS Statistics');
insert into courses (deptid, coursename) value (51, 'BS Library Science');


grant all privileges on uportaldb.courses to 'java'@'localhost' with grant option;

create table hitcounter(
     page varchar(50) not null,
     views int default 0,
     primary key(page)
)ENGINE = InnoDB;

insert into hitcounter(page,views) value ('homepage', 0);

grant all privileges on uportaldb.hitcounter to 'java'@'localhost' with grant option;

create table adminRequests(
	userid int not null,
	typeid int not null,
	constraint fk_re_userid foreign key (userid)
	references users(userid),
	constraint fk_re_typeid foreign key (typeid)
	references userTypes(typeid)
)ENGINE = InnoDB;

grant all privileges on uportaldb.adminRequests to 'java'@'localhost' with grant option;
