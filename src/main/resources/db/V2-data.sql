-- tables from Utatlan project v0.3

drop table if exists addresses cascade;
drop table if exists categories cascade;
drop table if exists detail_per_sales cascade;
drop table if exists employees cascade;
drop table if exists inventories cascade;
drop table if exists menu_role cascade;
drop table if exists menu_list cascade;
drop table if exists menus cascade;
drop table if exists model_has_permissions cascade;
drop table if exists model_has_roles cascade;
drop table if exists orders cascade;
drop table if exists products cascade;
drop table if exists providers cascade;
drop table if exists purchases cascade;
drop table if exists permissions cascade;
drop table if exists people cascade;
drop table if exists role_hierarchy cascade;
drop table if exists roles cascade;
drop table if exists role_has_permissions cascade;
drop table if exists sales cascade;
drop table if exists status cascade;
drop table if exists users cascade;

drop index if exists model_has_roles_model_id_model_type_index;
drop index if exists model_has_permissions_model_id_model_type_index;

create table addresses
(
    id           serial primary key,
    user_id      int not null,
    house_number varchar(255),
    street_name  varchar(255),
    street_type  varchar(255),
    city         varchar(255),
    state        varchar(255),
    postal_code  varchar(255)
);

create table branch_store
(
    id         serial primary key,
    code       varchar(255) unique,
    address_id int not null
);

create table categories
(
    id          serial primary key,
    brand       varchar(255) not null,
    description varchar(255) not null,
    constraint categories_brand_unique
        unique (brand)
);

create table detail_per_sales
(
    id          serial primary key,
    order_id    int not null,
    sale_id     int not null,
    employee_id int not null
);

create table employees
(
    id         serial primary key,
    status     char(1)      not null,
    menu_roles varchar(255) not null,
    created_at timestamp    null,
    updated_at timestamp    null,
    people_id  int          not null
);

create table inventories
(
    id              serial primary key,
    provider_id     int not null,
    branch_store_id int not null
);

create table menu_role
(
    id        serial primary key,
    role_name varchar(255) not null,
    menus_id  int          not null
);

create table menu_list
(
    id   serial primary key,
    name varchar(255) not null
);

create table menus
(
    id        serial primary key,
    name      varchar(255) not null,
    href      varchar(255) null,
    icon      varchar(255) null,
    slug      varchar(255) not null,
    parent_id int          null,
    menu_id   int          not null,
    sequence  int          not null
);

create table model_has_permissions
(
    permission_id bigint       not null,
    model_type    varchar(255) not null,
    model_id      bigint       not null,
    primary key (permission_id, model_id, model_type)
);

create table model_has_roles
(
    role_id    int          not null,
    model_type varchar(255) not null,
    model_id   int          not null,
    primary key (role_id, model_id, model_type)
);

create table orders
(
    id         serial primary key,
    user_id    int              not null,
    product_id int              not null,
    total      double precision not null
);

create table products
(
    id             serial primary key,
    name           varchar(255),
    description    varchar(255),
    purchase_price double precision not null,
    sale_price     double precision not null,
    img            varchar(255),
    tag            varchar(255)     not null,
    lot            integer          not null,
    created_at     timestamp        null,
    updated_at     timestamp        null,
    category_id    int              not null,
    provider_id    int              not null
);

create table providers
(
    id         serial primary key,
    org        varchar(255) not null,
    account    varchar(255) not null,
    created_at timestamp    null,
    updated_at timestamp    null,
    people_id  int          not null
);

create table purchases
(
    id          serial primary key,
    created_at  timestamp null,
    updated_at  timestamp null,
    provider_id int       not null
);

create table permissions
(
    id         serial primary key,
    name       varchar(255) not null,
    guard_name varchar(255) not null,
    created_at timestamp    null,
    updated_at timestamp    null
);

create table people
(
    id           serial primary key,
    first_name   varchar(255) not null,
    last_name    varchar(255) not null,
    surname      varchar(255) not null,
    last_surname varchar(255) not null,
    direction    text         not null,
    telephone    int          not null,
    email        varchar(255) not null,
    created_at   timestamp    null,
    updated_at   timestamp    null,
    people_id    int          not null,
    constraint people_email_unique
        unique (email)
);

create table role_hierarchy
(
    id        serial primary key,
    role_id   int not null,
    hierarchy int not null
);

create table roles
(
    id         serial primary key,
    name       varchar(255) not null,
    guard_name varchar(255) not null,
    created_at timestamp    null,
    updated_at timestamp    null
);

create table role_has_permissions
(
    permission_id int not null,
    role_id       int not null,
    primary key (permission_id, role_id)
);

create table sales
(
    id              serial primary key,
    total           double precision not null,
    applies_to_date date             not null,
    status          text             not null,
    users_id        int              not null,
    status_id       int              not null,
    created_at      timestamp        null,
    updated_at      timestamp        null
);

create table status
(
    id    serial primary key,
    name  varchar(255) not null,
    class varchar(255) not null
);

create table users
(
    id                serial primary key,
    email_verified_at timestamp    null,
    password          varchar(255) not null,
    api_token         varchar(80)  null,
    menu_roles        varchar(255) not null,
    status            varchar(255) not null,
    remember_token    varchar(100) null,
    created_at        timestamp    null,
    updated_at        timestamp    null,
    deleted_at        timestamp    null,
    people_id         int not null,
    constraint users_api_token_unique
        unique (api_token)
);

-- index key

create index model_has_roles_model_id_model_type_index
    on model_has_roles (model_id, model_type);

create index model_has_permissions_model_id_model_type_index
    on model_has_permissions (model_id, model_type);

-- adding constraint to foreign keys

alter table branch_store
    add constraint branch_store_addresses_id_foreign
        foreign key (address_id) references addresses (id)
            on delete cascade;

alter table users
    add constraint users_people_id_foreign
        foreign key (people_id) references people (id)
            on delete cascade;

alter table employees
    add constraint employees_people_id_foreign
        foreign key (people_id) references people (id)
            on delete cascade;

-- model has permissions

alter table model_has_permissions
    add constraint model_has_permissions_permission_id_foreign
        foreign key (permission_id) references permissions (id)
            on delete cascade;

-- providers

alter table providers
    add constraint providers_people_id_foreign
        foreign key (people_id) references people (id)
            on delete cascade;

-- model has roles

alter table model_has_roles
    add constraint model_has_roles_role_id_foreign
        foreign key (role_id) references roles (id)
            on delete cascade;

-- role has permissions

alter table role_has_permissions
    add constraint role_has_permissions_permission_id_foreign
        foreign key (permission_id) references permissions (id)
            on delete cascade;

alter table role_has_permissions
    add constraint role_has_permissions_role_id_foreign
        foreign key (role_id) references roles (id)
            on delete cascade;

alter table addresses
    add constraint users_addresses_id_foreign
        foreign key (user_id) references users (id)
            on delete cascade;

alter table orders
    add constraint users_orders_id_foreign
        foreign key (user_id) references users (id)
            on delete cascade;

alter table orders
    add constraint products_orders_id_foreign
        foreign key (product_id) references products (id)
            on delete cascade;

alter table detail_per_sales
    add constraint orders_detail_per_sales_id_foreign
        foreign key (order_id) references orders (id)
            on delete cascade;

alter table detail_per_sales
    add constraint sales_detail_per_sales_id_foreign
        foreign key (sale_id) references sales (id)
            on delete cascade;

alter table detail_per_sales
    add constraint employees_detail_per_sales_id_foreign
        foreign key (employee_id) references employees (id)
            on delete cascade;

alter table products
    add constraint categories_products_id_foreign
        foreign key (category_id) references categories (id)
            on delete cascade;

alter table products
    add constraint providers_products_id_foreign
        foreign key (provider_id) references providers (id)
            on delete cascade;

alter table inventories
    add constraint providers_inventory_id_foreign
        foreign key (provider_id) references providers (id)
            on delete cascade;

alter table inventories
    add constraint branch_store_inventory_id_foreign
        foreign key (branch_store_id) references providers (id)
            on delete cascade;

alter table purchases
    add constraint providers_purchases_id_foreign
        foreign key (provider_id) references providers (id)
            on delete cascade;
