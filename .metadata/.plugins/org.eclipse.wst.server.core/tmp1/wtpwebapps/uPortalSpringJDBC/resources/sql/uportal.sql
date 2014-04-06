create database uportaldb;
use uportaldb

create table users(
	userid int not null auto_increment,
	firstname varchar(50) not null,
	lastname varchar(50) not null,
	email varchar(100) not null,
	username varchar(100) not null,
	password varchar(100) not null,
	enabled tinyint(1) default true,
	collegeid int default null,
	departmentid int default null,
	courseid int default null,
	primary key(userid)	
)ENGINE = InnoDB;

create table userTypes(
	typeid int not null auto_increment,
	typename varchar(15) not null,
	primary key(typeid)
)ENGINE = InnoDB;

create table roles(
	roleid int not null auto_increment,
	rolename varchar(20) not null,
	primary key(roleid)
)ENGINE = InnoDB;

create table rolesPerType(
	roleid int not null,
	typeid int not null,
	constraint fk_typeid foreign key (typeid)
	references userTypes(typeid),
	constraint fk_roleid foreign key (roleid)
	references roles(roleid)
)ENGINE = InnoDB;

create table userRoles(
	userid int not null,
	typeid int not null,
	constraint fk_ur_userid foreign key (userid)
	references users(userid),
	constraint fk_ur_typeid foreign key (typeid)
	references userTypes(typeid)
)ENGINE = InnoDB;

grant all privileges on uportaldb.users to 'java'@'localhost' with grant option;
grant all privileges on uportaldb.userTypes to 'java'@'localhost' with grant option;
grant all privileges on uportaldb.roles to 'java'@'localhost' with grant option;
grant all privileges on uportaldb.userRoles to 'java'@'localhost' with grant option;
grant all privileges on uportaldb.rolesPerType to 'java'@'localhost' with grant option;

insert into userTypes (typename) value ('GENERAL');
insert into userTypes (typename) value ('STUDENT');
insert into userTypes (typename) value ('FACULTY');
insert into userTypes (typename) value ('ADMIN_PORTAL');
insert into userTypes (typename) value ('ADMIN_MAPS');
insert into userTypes (typename) value ('ADMIN_BUDDY');
insert into userTypes (typename) value ('ADMIN_CLASS');
insert into userTypes (typename) value ('ADMIN_GYM');
insert into userTypes (typename) value ('GOD');

insert into roles (rolename) value ('ROLE_GENERAL');
insert into roles (rolename) value ('ROLE_STUDENT');
insert into roles (rolename) value ('ROLE_FACULTY');
insert into roles (rolename) value ('ROLE_ADMIN');
insert into roles (rolename) value ('ROLE_ADMIN_PORTAL');
insert into roles (rolename) value ('ROLE_ADMIN_MAPS');
insert into roles (rolename) value ('ROLE_ADMIN_BUDDY');
insert into roles (rolename) value ('ROLE_ADMIN_CLASS');
insert into roles (rolename) value ('ROLE_ADMIN_GYM');
insert into roles (rolename) value ('ROLE_GOD');

insert into rolesPerType (typeid, roleid) value (1, 1);
insert into rolesPerType (typeid, roleid) value (2, 1);
insert into rolesPerType (typeid, roleid) value (2, 2);
insert into rolesPerType (typeid, roleid) value (3, 1);
insert into rolesPerType (typeid, roleid) value (3, 3);
insert into rolesPerType (typeid, roleid) value (4, 1);
insert into rolesPerType (typeid, roleid) value (4, 4);
insert into rolesPerType (typeid, roleid) value (4, 5);
insert into rolesPerType (typeid, roleid) value (5, 1);
insert into rolesPerType (typeid, roleid) value (5, 4);
insert into rolesPerType (typeid, roleid) value (5, 6);
insert into rolesPerType (typeid, roleid) value (6, 1);
insert into rolesPerType (typeid, roleid) value (6, 4);
insert into rolesPerType (typeid, roleid) value (6, 7);
insert into rolesPerType (typeid, roleid) value (7, 1);
insert into rolesPerType (typeid, roleid) value (7, 4);
insert into rolesPerType (typeid, roleid) value (7, 8);
insert into rolesPerType (typeid, roleid) value (8, 1);
insert into rolesPerType (typeid, roleid) value (8, 4);
insert into rolesPerType (typeid, roleid) value (8, 9);
insert into rolesPerType (typeid, roleid) value (9, 1);
insert into rolesPerType (typeid, roleid) value (9, 4);
insert into rolesPerType (typeid, roleid) value (9, 5);
insert into rolesPerType (typeid, roleid) value (9, 6);
insert into rolesPerType (typeid, roleid) value (9, 7);
insert into rolesPerType (typeid, roleid) value (9, 8);
insert into rolesPerType (typeid, roleid) value (9, 9);
insert into rolesPerType (typeid, roleid) value (9, 10);