create table users (
    username varchar(50) not null primary key,
    password varchar(100) not null,
    enabled boolean not null
) engine = InnoDb;

create table authorities (
    username varchar(50) not null,
    authority varchar(50) not null,
    foreign key (username) references users (username),
    unique index authorities_idx_1 (username, authority)
) engine = InnoDb;

create table groups (
    id bigint unsigned not null auto_increment primary key,
    group_name varchar(50) not null
) engine = InnoDb;

create table group_authorities (
    group_id bigint unsigned not null,
    authority varchar(50) not null,
    foreign key (group_id) references groups (id)
) engine = InnoDb;

create table group_members (
    id bigint unsigned not null auto_increment primary key,
    username varchar(50) not null,
    group_id bigint unsigned not null,
    foreign key (group_id) references groups (id)
) engine = InnoDb;

INSERT INTO `heirshare5_dev`.`users`
(`username`,
`password`,
`enabled`)
VALUES
(
'admin',
'$2a$10$iINfnRxhP9GDQj9xLwmc5uHMaIHau8TvBo7OkmQIHfmUbZFDcYyOG', -- admin
1
);

INSERT INTO `heirshare5_dev`.`authorities`
(`username`,
`authority`)
VALUES
(
'admin',
'ROLE_ADMIN'
);
