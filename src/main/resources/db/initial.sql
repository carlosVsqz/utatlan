-- we don't know how to generate root <with-no-name> (class Root) :(
create table categories
(
    id serial not null
        constraint categories_pkey
            primary key,
    brand varchar(255) not null
        constraint categories_brand_unique
            unique,
    description varchar(255) not null
);

alter table categories owner to obkteutjweycnq;

create table menu_role
(
    id serial not null
        constraint menu_role_pkey
            primary key,
    role_name varchar(255) not null,
    menus_id integer not null
);

alter table menu_role owner to obkteutjweycnq;

create table menu_list
(
    id serial not null
        constraint menu_list_pkey
            primary key,
    name varchar(255) not null
);

alter table menu_list owner to obkteutjweycnq;

create table menus
(
    id serial not null
        constraint menus_pkey
            primary key,
    name varchar(255) not null,
    href varchar(255),
    icon varchar(255),
    slug varchar(255) not null,
    parent_id integer,
    menu_id integer not null,
    sequence integer not null
);

alter table menus owner to obkteutjweycnq;

create table permissions
(
    id serial not null
        constraint permissions_pkey
            primary key,
    name varchar(255) not null,
    guard_name varchar(255) not null,
    created_at timestamp,
    updated_at timestamp
);

alter table permissions owner to obkteutjweycnq;

create table model_has_permissions
(
    permission_id bigint not null
        constraint model_has_permissions_permission_id_foreign
            references permissions
            on delete cascade,
    model_type varchar(255) not null,
    model_id bigint not null,
    constraint model_has_permissions_pkey
        primary key (permission_id, model_id, model_type)
);

alter table model_has_permissions owner to obkteutjweycnq;

create index model_has_permissions_model_id_model_type_index
    on model_has_permissions (model_id, model_type);

create table people
(
    id serial not null
        constraint people_pkey
            primary key,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    surname varchar(255) not null,
    last_surname varchar(255) not null,
    direction text not null,
    telephone integer not null,
    email varchar(255) not null
        constraint people_email_unique
            unique,
    created_at timestamp,
    updated_at timestamp,
    people_id integer not null
);

alter table people owner to obkteutjweycnq;

create table employees
(
    id serial not null
        constraint employees_pkey
            primary key,
    status char not null,
    menu_roles varchar(255) not null,
    created_at timestamp,
    updated_at timestamp,
    people_id integer not null
        constraint employees_people_id_foreign
            references people
            on delete cascade
);

alter table employees owner to obkteutjweycnq;

create table providers
(
    id serial not null
        constraint providers_pkey
            primary key,
    org varchar(255) not null,
    account varchar(255) not null,
    created_at timestamp,
    updated_at timestamp,
    people_id integer not null
        constraint providers_people_id_foreign
            references people
            on delete cascade
);

alter table providers owner to obkteutjweycnq;

create table inventories
(
    id serial not null
        constraint inventories_pkey
            primary key,
    provider_id integer not null
        constraint providers_inventory_id_foreign
            references providers
            on delete cascade,
    branch_store_id integer not null
        constraint branch_store_inventory_id_foreign
            references providers
            on delete cascade
);

alter table inventories owner to obkteutjweycnq;

create table products
(
    id serial not null
        constraint products_pkey
            primary key,
    name varchar(255),
    description varchar(255),
    purchase_price double precision not null,
    sale_price double precision not null,
    img varchar(255),
    tag varchar(255) not null,
    lot integer not null,
    created_at timestamp,
    updated_at timestamp,
    category_id integer not null
        constraint categories_products_id_foreign
            references categories
            on delete cascade,
    provider_id integer not null
        constraint providers_products_id_foreign
            references providers
            on delete cascade
);

alter table products owner to obkteutjweycnq;

create table purchases
(
    id serial not null
        constraint purchases_pkey
            primary key,
    created_at timestamp,
    updated_at timestamp,
    provider_id integer not null
        constraint providers_purchases_id_foreign
            references providers
            on delete cascade
);

alter table purchases owner to obkteutjweycnq;

create table role_hierarchy
(
    id serial not null
        constraint role_hierarchy_pkey
            primary key,
    role_id integer not null,
    hierarchy integer not null
);

alter table role_hierarchy owner to obkteutjweycnq;

create table roles
(
    id serial not null
        constraint roles_pkey
            primary key,
    name varchar(255) not null,
    guard_name varchar(255) not null,
    created_at timestamp,
    updated_at timestamp
);

alter table roles owner to obkteutjweycnq;

create table model_has_roles
(
    role_id integer not null
        constraint model_has_roles_role_id_foreign
            references roles
            on delete cascade,
    model_type varchar(255) not null,
    model_id integer not null,
    constraint model_has_roles_pkey
        primary key (role_id, model_id, model_type)
);

alter table model_has_roles owner to obkteutjweycnq;

create index model_has_roles_model_id_model_type_index
    on model_has_roles (model_id, model_type);

create table role_has_permissions
(
    permission_id integer not null
        constraint role_has_permissions_permission_id_foreign
            references permissions
            on delete cascade,
    role_id integer not null
        constraint role_has_permissions_role_id_foreign
            references roles
            on delete cascade,
    constraint role_has_permissions_pkey
        primary key (permission_id, role_id)
);

alter table role_has_permissions owner to obkteutjweycnq;

create table sales
(
    id serial not null
        constraint sales_pkey
            primary key,
    total double precision not null,
    applies_to_date date not null,
    status text not null,
    users_id integer not null,
    status_id integer not null,
    created_at timestamp,
    updated_at timestamp
);

alter table sales owner to obkteutjweycnq;

create table status
(
    id serial not null
        constraint status_pkey
            primary key,
    name varchar(255) not null,
    class varchar(255) not null
);

alter table status owner to obkteutjweycnq;

create table users
(
    id serial not null
        constraint users_pkey
            primary key,
    email_verified_at timestamp,
    password varchar(255) not null,
    api_token varchar(80)
        constraint users_api_token_unique
            unique,
    menu_roles varchar(255) not null,
    status varchar(255) not null,
    remember_token varchar(100),
    created_at timestamp,
    updated_at timestamp,
    deleted_at timestamp,
    people_id integer not null
        constraint users_people_id_foreign
            references people
            on delete cascade
);

alter table users owner to obkteutjweycnq;

create table addresses
(
    id serial not null
        constraint addresses_pkey
            primary key,
    user_id integer not null
        constraint users_addresses_id_foreign
            references users
            on delete cascade,
    house_number varchar(255),
    street_name varchar(255),
    street_type varchar(255),
    city varchar(255),
    state varchar(255),
    postal_code varchar(255)
);

alter table addresses owner to obkteutjweycnq;

create table branch_store
(
    id serial not null
        constraint branch_store_pkey
            primary key,
    code varchar(255)
        constraint branch_store_code_key
            unique,
    address_id integer not null
        constraint branch_store_addresses_id_foreign
            references addresses
            on delete cascade
);

alter table branch_store owner to obkteutjweycnq;

create table orders
(
    id serial not null
        constraint orders_pkey
            primary key,
    user_id integer not null
        constraint users_orders_id_foreign
            references users
            on delete cascade,
    product_id integer not null
        constraint products_orders_id_foreign
            references products
            on delete cascade,
    total double precision not null
);

alter table orders owner to obkteutjweycnq;

create table detail_per_sales
(
    id serial not null
        constraint detail_per_sales_pkey
            primary key,
    order_id integer not null
        constraint orders_detail_per_sales_id_foreign
            references orders
            on delete cascade,
    sale_id integer not null
        constraint sales_detail_per_sales_id_foreign
            references sales
            on delete cascade,
    employee_id integer not null
        constraint employees_detail_per_sales_id_foreign
            references employees
            on delete cascade
);

alter table detail_per_sales owner to obkteutjweycnq;

