--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: agricultores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agricultores (
    id bigint NOT NULL,
    cedula character varying(20) NOT NULL,
    nombre character varying(250) NOT NULL,
    direccion character varying(200) NOT NULL,
    telefono character varying(200) NOT NULL,
    email character varying(200) NOT NULL,
    password character varying(200) NOT NULL,
    corregimiento integer NOT NULL,
    ubicacion character varying(200) NOT NULL
);


ALTER TABLE public.agricultores OWNER TO postgres;

--
-- Name: agricultores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agricultores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agricultores_id_seq OWNER TO postgres;

--
-- Name: agricultores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agricultores_id_seq OWNED BY public.agricultores.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    parent_id integer,
    "order" integer DEFAULT 1 NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: corregimientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.corregimientos (
    corregimiento integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.corregimientos OWNER TO postgres;

--
-- Name: corregimientos_corregimiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.corregimientos_corregimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.corregimientos_corregimiento_seq OWNER TO postgres;

--
-- Name: corregimientos_corregimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.corregimientos_corregimiento_seq OWNED BY public.corregimientos.corregimiento;


--
-- Name: data_rows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_rows (
    id integer NOT NULL,
    data_type_id integer NOT NULL,
    field character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    display_name character varying(255) NOT NULL,
    required boolean DEFAULT false NOT NULL,
    browse boolean DEFAULT true NOT NULL,
    read boolean DEFAULT true NOT NULL,
    edit boolean DEFAULT true NOT NULL,
    add boolean DEFAULT true NOT NULL,
    delete boolean DEFAULT true NOT NULL,
    details text,
    "order" integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.data_rows OWNER TO postgres;

--
-- Name: data_rows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_rows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_rows_id_seq OWNER TO postgres;

--
-- Name: data_rows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_rows_id_seq OWNED BY public.data_rows.id;


--
-- Name: data_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_types (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    display_name_singular character varying(255) NOT NULL,
    display_name_plural character varying(255) NOT NULL,
    icon character varying(255),
    model_name character varying(255),
    description character varying(255),
    generate_permissions boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    server_side smallint DEFAULT '0'::smallint NOT NULL,
    controller character varying(255),
    policy_name character varying(255),
    details text
);


ALTER TABLE public.data_types OWNER TO postgres;

--
-- Name: data_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_types_id_seq OWNER TO postgres;

--
-- Name: data_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_types_id_seq OWNED BY public.data_types.id;


--
-- Name: mensajes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mensajes (
    mensaje bigint NOT NULL,
    texto character varying(255),
    "user" integer,
    fecha timestamp without time zone DEFAULT now(),
    email character varying(250) DEFAULT NULL::character varying,
    telefono character varying(120) DEFAULT NULL::character varying
);


ALTER TABLE public.mensajes OWNER TO postgres;

--
-- Name: mensajes_mensaje_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mensajes_mensaje_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mensajes_mensaje_seq OWNER TO postgres;

--
-- Name: mensajes_mensaje_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mensajes_mensaje_seq OWNED BY public.mensajes.mensaje;


--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_items (
    id integer NOT NULL,
    menu_id integer,
    title character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    target character varying(255) DEFAULT '_self'::character varying NOT NULL,
    icon_class character varying(255),
    color character varying(255),
    parent_id integer,
    "order" integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    route character varying(255),
    parameters text
);


ALTER TABLE public.menu_items OWNER TO postgres;

--
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_items_id_seq OWNER TO postgres;

--
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_items_id_seq OWNED BY public.menu_items.id;


--
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menus (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.menus OWNER TO postgres;

--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_id_seq OWNER TO postgres;

--
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: ofertas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ofertas (
    oferta bigint NOT NULL,
    fecha date NOT NULL,
    unidad integer NOT NULL,
    producto integer NOT NULL,
    capacidad bigint NOT NULL,
    valor numeric(20,2) NOT NULL,
    valor_envio numeric(20,2) NOT NULL,
    descripcion text,
    agricultor bigint,
    fotos text,
    vereda integer,
    ubicacion text,
    estado integer DEFAULT 1
);


ALTER TABLE public.ofertas OWNER TO postgres;

--
-- Name: ofertas_oferta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ofertas_oferta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ofertas_oferta_seq OWNER TO postgres;

--
-- Name: ofertas_oferta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ofertas_oferta_seq OWNED BY public.ofertas.oferta;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    author_id integer NOT NULL,
    title character varying(255) NOT NULL,
    excerpt text,
    body text,
    image character varying(255),
    slug character varying(255) NOT NULL,
    meta_description text,
    meta_keywords text,
    status character varying(255) DEFAULT 'INACTIVE'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT pages_status_check CHECK (((status)::text = ANY (ARRAY[('ACTIVE'::character varying)::text, ('INACTIVE'::character varying)::text])))
);


ALTER TABLE public.pages OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- Name: permission_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission_role (
    permission_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.permission_role OWNER TO postgres;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id integer NOT NULL,
    key character varying(255) NOT NULL,
    table_name character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    author_id integer NOT NULL,
    category_id integer,
    title character varying(255) NOT NULL,
    seo_title character varying(255),
    excerpt text,
    body text NOT NULL,
    image character varying(255),
    slug character varying(255) NOT NULL,
    meta_description text,
    meta_keywords text,
    status character varying(255) DEFAULT 'DRAFT'::character varying NOT NULL,
    featured boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT posts_status_check CHECK (((status)::text = ANY (ARRAY[('PUBLISHED'::character varying)::text, ('DRAFT'::character varying)::text, ('PENDING'::character varying)::text])))
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    producto integer NOT NULL,
    nombre character varying(150) NOT NULL,
    imagen character varying(400)
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- Name: productos_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_producto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_producto_seq OWNER TO postgres;

--
-- Name: productos_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_producto_seq OWNED BY public.productos.producto;


--
-- Name: reportes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reportes (
    reporte integer NOT NULL,
    sql text NOT NULL,
    parametros text,
    nombre character varying(120),
    estadistica integer DEFAULT 0
);


ALTER TABLE public.reportes OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    display_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    key character varying(255) NOT NULL,
    display_name character varying(255) NOT NULL,
    value text,
    details text,
    type character varying(255) NOT NULL,
    "order" integer DEFAULT 1 NOT NULL,
    "group" character varying(255)
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.translations (
    id integer NOT NULL,
    table_name character varying(255) NOT NULL,
    column_name character varying(255) NOT NULL,
    foreign_key integer NOT NULL,
    locale character varying(255) NOT NULL,
    value text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.translations OWNER TO postgres;

--
-- Name: translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translations_id_seq OWNER TO postgres;

--
-- Name: translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.translations_id_seq OWNED BY public.translations.id;


--
-- Name: unidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unidades (
    unidad integer NOT NULL,
    descripcion character varying(120) NOT NULL
);


ALTER TABLE public.unidades OWNER TO postgres;

--
-- Name: unidades_unidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unidades_unidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidades_unidad_seq OWNER TO postgres;

--
-- Name: unidades_unidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unidades_unidad_seq OWNED BY public.unidades.unidad;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    avatar character varying(255) DEFAULT 'users/default.png'::character varying,
    role_id integer,
    settings text,
    telefono character varying(100) DEFAULT NULL::character varying,
    cedula character varying(20),
    direccion character varying(200),
    corregimiento integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: veredas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veredas (
    vereda integer NOT NULL,
    nombre character varying(240),
    corregimiento integer
);


ALTER TABLE public.veredas OWNER TO postgres;

--
-- Name: veredas_vereda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veredas_vereda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veredas_vereda_seq OWNER TO postgres;

--
-- Name: veredas_vereda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veredas_vereda_seq OWNED BY public.veredas.vereda;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agricultores ALTER COLUMN id SET DEFAULT nextval('public.agricultores_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: corregimiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.corregimientos ALTER COLUMN corregimiento SET DEFAULT nextval('public.corregimientos_corregimiento_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_rows ALTER COLUMN id SET DEFAULT nextval('public.data_rows_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_types ALTER COLUMN id SET DEFAULT nextval('public.data_types_id_seq'::regclass);


--
-- Name: mensaje; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajes ALTER COLUMN mensaje SET DEFAULT nextval('public.mensajes_mensaje_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items ALTER COLUMN id SET DEFAULT nextval('public.menu_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: oferta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ofertas ALTER COLUMN oferta SET DEFAULT nextval('public.ofertas_oferta_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN producto SET DEFAULT nextval('public.productos_producto_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translations ALTER COLUMN id SET DEFAULT nextval('public.translations_id_seq'::regclass);


--
-- Name: unidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades ALTER COLUMN unidad SET DEFAULT nextval('public.unidades_unidad_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vereda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veredas ALTER COLUMN vereda SET DEFAULT nextval('public.veredas_vereda_seq'::regclass);


--
-- Data for Name: agricultores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agricultores (id, cedula, nombre, direccion, telefono, email, password, corregimiento, ubicacion) FROM stdin;
1	860540	Juan Perez	cle 25 20-12	653232	juan@mail.com	$2y$10$esp9yHsLvg0YGod4Acvvv.lDLkq6rHUscsV9GcKXAch0Z4SGnz3B6	2	c
2	8605403	860540	860540	860540	860540	$2y$10$5k/evu39diHkMX/TLxpHeuc71HUjazeroJ81CY6n9zNVcjI5qUeba	1	860540
3	8605040	aaaaa	aaa	aaa	aaaa@amc.om	$2y$10$tLXuPtoPBZpSgSAxGX3NL.SBURbdt6RP/tOdVLFz6vz8.eOsEon7m	1	a
\.


--
-- Name: agricultores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agricultores_id_seq', 3, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, parent_id, "order", name, slug, created_at, updated_at) FROM stdin;
1	\N	1	Category 1	category-1	2018-06-19 17:36:35	2018-06-19 17:36:35
2	\N	1	Category 2	category-2	2018-06-19 17:36:35	2018-06-19 17:36:35
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 2, true);


--
-- Data for Name: corregimientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.corregimientos (corregimiento, nombre) FROM stdin;
1	Corregimiento 1
2	Corregimiento 2
3	corregimiento 3
4	corregimiento 4
5	corregimiento 5
6	corregimiento 6
7	corregimiento 7
\.


--
-- Name: corregimientos_corregimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.corregimientos_corregimiento_seq', 7, true);


--
-- Data for Name: data_rows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_rows (id, data_type_id, field, type, display_name, required, browse, read, edit, add, delete, details, "order") FROM stdin;
13	2	id	number	ID	t	f	f	f	f	f		1
14	2	name	text	Name	t	t	t	t	t	t		2
15	2	created_at	timestamp	Created At	f	f	f	f	f	f		3
16	2	updated_at	timestamp	Updated At	f	f	f	f	f	f		4
17	3	id	number	ID	t	f	f	f	f	f		1
18	3	name	text	Name	t	t	t	t	t	t		2
19	3	created_at	timestamp	Created At	f	f	f	f	f	f		3
20	3	updated_at	timestamp	Updated At	f	f	f	f	f	f		4
21	3	display_name	text	Display Name	t	t	t	t	t	t		5
23	4	id	number	ID	t	f	f	f	f	f		1
24	4	parent_id	select_dropdown	Parent	f	f	t	t	t	t	{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}	2
25	4	order	text	Order	t	t	t	t	t	t	{"default":1}	3
26	4	name	text	Name	t	t	t	t	t	t		4
27	4	slug	text	Slug	t	t	t	t	t	t	{"slugify":{"origin":"name"}}	5
28	4	created_at	timestamp	Created At	f	f	t	f	f	f		6
29	4	updated_at	timestamp	Updated At	f	f	f	f	f	f		7
30	5	id	number	ID	t	f	f	f	f	f		1
31	5	author_id	text	Author	t	f	t	t	f	t		2
32	5	category_id	text	Category	t	f	t	t	t	f		3
33	5	title	text	Title	t	t	t	t	t	t		4
34	5	excerpt	text_area	Excerpt	t	f	t	t	t	t		5
35	5	body	rich_text_box	Body	t	f	t	t	t	t		6
36	5	image	image	Post Image	f	t	t	t	t	t	{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}	7
37	5	slug	text	Slug	t	f	t	t	t	t	{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:posts,slug"}}	8
38	5	meta_description	text_area	Meta Description	t	f	t	t	t	t		9
39	5	meta_keywords	text_area	Meta Keywords	t	f	t	t	t	t		10
40	5	status	select_dropdown	Status	t	t	t	t	t	t	{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}	11
41	5	created_at	timestamp	Created At	f	t	t	f	f	f		12
42	5	updated_at	timestamp	Updated At	f	f	f	f	f	f		13
43	5	seo_title	text	SEO Title	f	t	t	t	t	t		14
44	5	featured	checkbox	Featured	t	t	t	t	t	t		15
45	6	id	number	ID	t	f	f	f	f	f		1
46	6	author_id	text	Author	t	f	f	f	f	f		2
47	6	title	text	Title	t	t	t	t	t	t		3
48	6	excerpt	text_area	Excerpt	t	f	t	t	t	t		4
49	6	body	rich_text_box	Body	t	f	t	t	t	t		5
50	6	slug	text	Slug	t	f	t	t	t	t	{"slugify":{"origin":"title"},"validation":{"rule":"unique:pages,slug"}}	6
51	6	meta_description	text	Meta Description	t	f	t	t	t	t		7
52	6	meta_keywords	text	Meta Keywords	t	f	t	t	t	t		8
53	6	status	select_dropdown	Status	t	t	t	t	t	t	{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}	9
54	6	created_at	timestamp	Created At	t	t	t	f	f	f		10
55	6	updated_at	timestamp	Updated At	t	f	f	f	f	f		11
56	6	image	image	Page Image	f	t	t	t	t	t		12
58	7	corregimiento	text	Corregimiento	t	f	f	f	f	f	\N	1
59	7	nombre	text	Nombre	t	t	t	t	t	t	\N	2
60	8	id	text	Id	t	f	f	f	f	f	\N	1
61	8	cedula	text	Cedula	t	t	t	t	t	t	{"validation":{"rule":"required|unique:agricultores,cedula","messages":{"unique":"El campo del campo :attribute ya existe.","required":"El campo :attribute es obigatorio"}}}	2
62	8	nombre	text	Nombre	t	t	t	t	t	t	\N	3
63	8	direccion	text	Direccion	t	t	t	t	t	t	\N	4
64	8	telefono	text	Telefono	t	t	t	t	t	t	\N	5
65	8	email	text	Email	t	t	t	t	t	t	{"validation":{"rule":"email|required|unique:agricultores,email","messages":{"unique":"El campo del campo :attribute ya existe.","required":"El campo :attribute es obigatorio"}}}	6
66	8	password	password	Password	t	f	f	t	t	t	\N	7
67	8	corregimiento	text	Corregimiento	t	t	t	t	t	t	\N	9
68	8	ubicacion	text	Ubicacion	t	t	t	t	t	t	\N	8
73	10	vereda	text	Vereda	t	f	f	f	f	f	\N	1
74	10	nombre	text	Nombre	f	t	t	t	t	t	\N	3
75	10	corregimiento	text	Corregimiento	f	t	t	t	t	t	\N	2
76	10	vereda_belongsto_corregimiento_relationship	relationship	corregimientos	f	t	t	t	t	t	{"model":"\\\\App\\\\Corregimiento","table":"corregimientos","type":"belongsTo","column":"corregimiento","key":"corregimiento","label":"nombre","pivot_table":"agricultores","pivot":"0","taggable":null}	4
69	8	agricultore_belongsto_corregimiento_relationship	relationship	corregimientos	f	t	t	t	t	t	{"model":"\\\\App\\\\Corregimiento","table":"corregimientos","type":"belongsTo","column":"corregimiento","key":"corregimiento","label":"nombre","pivot_table":"agricultores","pivot":"0","taggable":"0"}	10
1	1	id	number	ID	t	f	f	f	f	f	\N	1
70	9	producto	text	Producto	t	f	f	f	f	f	\N	1
71	9	nombre	text	Nombre	t	t	t	t	t	t	\N	2
72	9	imagen	multiple_images	Imagen	f	t	t	t	t	t	{"validation":{"rule":"required","messages":{"required":"Se requiere la foto para publicar la oferta."}}}	3
89	11	oferta_belongsto_unidade_relationship	relationship	unidades	f	t	t	t	t	t	{"model":"\\\\App\\\\Unidad","table":"unidades","type":"belongsTo","column":"unidad","key":"unidad","label":"descripcion","pivot_table":"agricultores","pivot":"0","taggable":"0"}	6
90	11	oferta_belongsto_vereda_relationship	relationship	veredas	f	t	t	t	t	t	{"model":"\\\\App\\\\Vereda","table":"veredas","type":"belongsTo","column":"vereda","key":"vereda","label":"nombre","pivot_table":"agricultores","pivot":"0","taggable":"0"}	13
92	12	unidad	text	Unidad	t	f	f	f	f	f	\N	1
93	12	descripcion	text	Descripcion	t	t	t	t	t	t	\N	2
117	15	mensaje_belongsto_user_relationship	relationship	users	f	t	t	t	t	t	{"model":"\\\\App\\\\User","table":"users","type":"belongsTo","column":"user","key":"id","label":"name","pivot_table":"agricultores","pivot":"0","taggable":"0"}	7
82	11	valor	number	Valor por unidad	t	t	t	t	t	t	{"validation":{"rule":"required","messages":{"required":"Este campo es obligatorio."}}}	8
83	11	valor_envio	number	Valor Envio por unidad	t	t	t	t	t	t	{"validation":{"rule":"required","messages":{"required":"Este campo es obligatorio."}}}	9
84	11	descripcion	text_area	Descripcion del producto	f	t	t	t	t	t	{"validation":{"rule":"required","messages":{"required":"Este campo es obligatorio."}}}	10
85	11	agricultor	text	Agricultor	f	t	t	t	t	t	\N	14
2	1	name	text	Nombre	t	t	t	t	t	t	{"validation":{"rule":"required"}}	2
3	1	email	text	Email	t	t	t	t	t	t	{"validation":{"rule":"required"}}	4
4	1	password	password	Password	t	f	f	t	t	f	\N	6
5	1	remember_token	text	Remember Token	f	f	f	f	f	f	\N	7
6	1	created_at	timestamp	Created At	f	f	t	f	f	f	\N	8
7	1	updated_at	timestamp	Updated At	f	f	f	f	f	f	\N	9
8	1	avatar	image	Avatar	f	t	t	t	t	t	\N	10
22	1	role_id	text	Role	f	t	t	t	t	t	\N	11
12	1	settings	hidden	Settings	f	f	f	f	f	f	\N	15
57	1	telefono	text	Telefono	f	t	t	t	t	t	\N	13
97	1	cedula	text	Cedula	f	t	t	f	t	t	{"validation":{"rule":"required"}}	3
98	1	direccion	text	Direccion	f	t	t	t	t	t	\N	16
99	1	corregimiento	text	Corregimiento	f	t	t	t	t	t	\N	5
9	1	user_belongsto_role_relationship	relationship	Role	f	t	t	t	t	f	{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":"0","taggable":"0"}	12
10	1	user_belongstomany_role_relationship	relationship	Roles	f	t	t	t	t	f	{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}	14
100	1	user_belongsto_corregimiento_relationship	relationship	corregimientos	f	t	t	t	t	t	{"model":"\\\\App\\\\Corregimiento","table":"corregimientos","type":"belongsTo","column":"corregimiento","key":"corregimiento","label":"nombre","pivot_table":"agricultores","pivot":"0","taggable":"0"}	17
111	15	mensaje	text	Mensaje	t	f	f	f	f	f	\N	1
114	15	texto	text	Texto	f	t	t	t	t	t	\N	2
115	15	user	text	User	f	t	t	t	t	t	\N	3
116	15	fecha	timestamp	Fecha	f	t	t	t	t	t	\N	4
118	15	email	text	Email	f	t	t	t	t	t	\N	5
119	15	telefono	text	Telefono	f	t	t	t	t	t	\N	6
86	11	fotos	image	Fotos	f	t	t	t	t	t	{"validation":{"rule":"required","messages":{"required":"Se requiere la foto para publicar la oferta."}}}	11
87	11	vereda	text	Vereda	f	t	t	t	t	t	\N	12
95	11	ubicacion	location	Ubicacion	f	t	t	t	t	t	\N	13
96	11	estado	select_dropdown	Estado de la oferta	f	t	t	t	t	t	{"default":"1","options":{"0":"Inactiva","1":"Activa"}}	13
88	11	oferta_belongsto_producto_relationship	relationship	productos	f	t	t	t	t	t	{"model":"\\\\App\\\\Producto","table":"productos","type":"belongsTo","column":"producto","key":"producto","label":"nombre","pivot_table":"agricultores","pivot":"0","taggable":"0"}	3
91	11	oferta_belongsto_agricultore_relationship	relationship	agricultores	f	t	t	t	t	t	{"model":"\\\\App\\\\Agricultor","table":"users","type":"belongsTo","column":"agricultor","key":"id","label":"name","pivot_table":"agricultores","pivot":"0","taggable":"0"}	15
77	11	oferta	text	Oferta	t	f	f	f	f	f	\N	1
78	11	fecha	date	Fecha de disponibilidad	t	t	t	t	t	t	{"validation":{"rule":"required","messages":{"required":"Este campo es obligatorio."}}}	4
79	11	unidad	text	Unidades	t	t	t	t	t	t	{"validation":{"rule":"required","messages":{"required":"Este campo es obligatorio."}}}	5
80	11	producto	text	Producto	t	t	t	t	t	t	\N	2
81	11	capacidad	number	Capacidad disponible	t	t	t	t	t	t	{"validation":{"rule":"required","messages":{"required":"Este campo es obligatorio."}}}	7
\.


--
-- Name: data_rows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.data_rows_id_seq', 119, true);


--
-- Data for Name: data_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_types (id, name, slug, display_name_singular, display_name_plural, icon, model_name, description, generate_permissions, created_at, updated_at, server_side, controller, policy_name, details) FROM stdin;
2	menus	menus	Menu	Menus	voyager-list	TCG\\Voyager\\Models\\Menu		t	2018-06-19 17:36:35	2018-06-19 17:36:35	0		\N	\N
3	roles	roles	Role	Roles	voyager-lock	TCG\\Voyager\\Models\\Role		t	2018-06-19 17:36:35	2018-06-19 17:36:35	0		\N	\N
4	categories	categories	Category	Categories	voyager-categories	TCG\\Voyager\\Models\\Category		t	2018-06-19 17:36:35	2018-06-19 17:36:35	0		\N	\N
5	posts	posts	Post	Posts	voyager-news	TCG\\Voyager\\Models\\Post		t	2018-06-19 17:36:35	2018-06-19 17:36:35	0		TCG\\Voyager\\Policies\\PostPolicy	\N
6	pages	pages	Page	Pages	voyager-file-text	TCG\\Voyager\\Models\\Page		t	2018-06-19 17:36:35	2018-06-19 17:36:35	0		\N	\N
7	corregimientos	corregimientos	Corregimiento	Corregimientos	voyager-location	App\\Corregimiento	\N	t	2018-06-19 21:27:15	2018-06-19 21:27:15	0	\N	\N	{"order_column":null,"order_display_column":null}
10	veredas	veredas	Vereda	Veredas	voyager-crop	App\\Vereda	\N	t	2018-07-10 18:41:39	2018-07-10 18:41:39	0	\N	\N	{"order_column":null,"order_display_column":null}
8	agricultores	agricultores	Agricultor	Agricultores	voyager-leaf	App\\Agricultor	\N	t	2018-06-19 21:33:09	2018-07-10 18:43:30	0	\N	\N	{"order_column":null,"order_display_column":null}
12	unidades	unidades	Unidad	Unidades	voyager-pie-graph	App\\Unidad	\N	t	2018-07-10 19:00:43	2018-07-10 19:00:43	0	\N	\N	{"order_column":null,"order_display_column":null}
1	users	users	User	Users	voyager-person	TCG\\Voyager\\Models\\User	\N	t	2018-06-19 17:36:35	2018-08-08 14:31:03	0	\N	TCG\\Voyager\\Policies\\UserPolicy	{"order_column":null,"order_display_column":null}
15	mensajes	mensajes	Mensaje	Mensajes	voyager-paper-plane	App\\Mensaje	Mensajes de posibles compradores	t	2018-07-31 05:38:03	2018-08-09 04:06:37	0	\N	\N	{"order_column":null,"order_display_column":"fecha"}
11	ofertas	ofertas	Oferta	Ofertas	voyager-basket	App\\Oferta	\N	t	2018-07-10 18:53:29	2018-11-23 02:20:46	0	\N	\N	{"order_column":null,"order_display_column":null}
9	productos	productos	Producto	Productos	voyager-tree	App\\Producto	\N	t	2018-06-19 21:54:36	2018-12-13 22:53:50	0	\N	\N	{"order_column":null,"order_display_column":null}
\.


--
-- Name: data_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.data_types_id_seq', 15, true);


--
-- Data for Name: mensajes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mensajes (mensaje, texto, "user", fecha, email, telefono) FROM stdin;
1	Interesado en comprar arroz	4	2018-07-31 00:36:10.460633	\N	\N
2	Compradora de maiz	5	2018-07-31 00:36:00	\N	\N
3	\N	\N	2018-08-03 00:22:39.828036	\N	\N
4	\N	\N	2018-08-03 00:41:39.381171	\N	\N
5	aaaa	1	2018-08-03 00:43:11.242137	\N	\N
6	una mas	4	2018-08-03 00:54:17.909411	\N	\N
7	Por favor contactarme al 3006104615	4	2018-08-03 01:09:51.156888	\N	\N
8	gracias por vender	1	2018-08-03 06:17:07.661362	\N	\N
9	hola	1	2018-08-07 14:13:05.872201	\N	\N
10	prueba	7	2018-08-08 23:05:21.597986	\N	\N
11	aha	7	2018-08-08 23:12:21.898704	juanfbarrero@gmail.com	3006104615
\.


--
-- Name: mensajes_mensaje_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mensajes_mensaje_seq', 11, true);


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_items (id, menu_id, title, url, target, icon_class, color, parent_id, "order", created_at, updated_at, route, parameters) FROM stdin;
1	1	Dashboard		_self	voyager-boat	\N	\N	1	2018-06-19 17:36:35	2018-06-19 17:36:35	voyager.dashboard	\N
6	1	Menu Builder		_self	voyager-list	\N	5	1	2018-06-19 17:36:35	2018-07-31 05:18:18	voyager.menus.index	\N
7	1	Database		_self	voyager-data	\N	5	2	2018-06-19 17:36:35	2018-07-31 05:18:18	voyager.database.index	\N
8	1	Compass		_self	voyager-compass	\N	5	3	2018-06-19 17:36:35	2018-07-31 05:18:18	voyager.compass.index	\N
9	1	BREAD		_self	voyager-bread	\N	5	4	2018-06-19 17:36:35	2018-07-31 05:18:18	voyager.bread.index	\N
14	1	Hooks		_self	voyager-hook	\N	5	5	2018-06-19 17:36:36	2018-07-31 05:18:18	voyager.hooks	\N
10	1	Settings		_self	voyager-settings	\N	5	6	2018-06-19 17:36:35	2018-07-31 05:18:18	voyager.settings.index	\N
5	1	[Administracion]		_self	voyager-tools	#000000	\N	2	2018-06-19 17:36:35	2018-07-31 05:18:42	\N	
4	1	Roles		_self	voyager-lock	\N	5	7	2018-06-19 17:36:35	2018-07-31 05:29:27	voyager.roles.index	\N
3	1	Usuarios		_self	voyager-person	#000000	\N	3	2018-06-19 17:36:35	2018-07-31 05:29:27	voyager.users.index	null
15	1	Corregimientos		_self	voyager-location	\N	\N	4	2018-06-19 21:27:15	2018-07-31 05:29:27	voyager.corregimientos.index	\N
17	1	Productos		_self	voyager-tree	\N	\N	5	2018-06-19 21:54:36	2018-07-31 05:29:27	voyager.productos.index	\N
18	1	Veredas		_self	voyager-crop	\N	\N	6	2018-07-10 18:41:39	2018-07-31 05:29:27	voyager.veredas.index	\N
19	1	Ofertas		_self	voyager-basket	\N	\N	7	2018-07-10 18:53:29	2018-07-31 05:29:27	voyager.ofertas.index	\N
20	1	Unidades		_self	voyager-pie-graph	\N	\N	8	2018-07-10 19:00:43	2018-07-31 05:29:27	voyager.unidades.index	\N
21	1	Mensajes		_self	voyager-paper-plane	\N	\N	9	2018-07-31 05:38:03	2018-07-31 05:38:03	voyager.mensajes.index	\N
22	1	Reportes	/reportes	_self	voyager-receipt	#000000	\N	10	2018-08-09 05:00:10	2018-08-09 05:00:45	\N	
\.


--
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_items_id_seq', 22, true);


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menus (id, name, created_at, updated_at) FROM stdin;
1	admin	2018-06-19 17:36:35	2018-06-19 17:36:35
\.


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menus_id_seq', 1, true);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2016_01_01_000000_add_voyager_user_fields	1
4	2016_01_01_000000_create_data_types_table	1
5	2016_05_19_173453_create_menu_table	1
6	2016_10_21_190000_create_roles_table	1
7	2016_10_21_190000_create_settings_table	1
8	2016_11_30_135954_create_permission_table	1
9	2016_11_30_141208_create_permission_role_table	1
10	2016_12_26_201236_data_types__add__server_side	1
11	2017_01_13_000000_add_route_to_menu_items_table	1
12	2017_01_14_005015_create_translations_table	1
13	2017_01_15_000000_make_table_name_nullable_in_permissions_table	1
14	2017_03_06_000000_add_controller_to_data_types_table	1
15	2017_04_21_000000_add_order_to_data_rows_table	1
16	2017_07_05_210000_add_policyname_to_data_types_table	1
17	2017_08_05_000000_add_group_to_settings_table	1
18	2017_11_26_013050_add_user_role_relationship	1
19	2017_11_26_015000_create_user_roles_table	1
20	2018_03_11_000000_add_user_settings	1
21	2018_03_14_000000_add_details_to_data_types_table	1
22	2018_03_16_000000_make_settings_value_nullable	1
23	2016_01_01_000000_create_pages_table	2
24	2016_01_01_000000_create_posts_table	2
25	2016_02_15_204651_create_categories_table	2
26	2017_04_11_000000_alter_post_nullable_fields_table	2
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 26, true);


--
-- Data for Name: ofertas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ofertas (oferta, fecha, unidad, producto, capacidad, valor, valor_envio, descripcion, agricultor, fotos, vereda, ubicacion, estado) FROM stdin;
8	2018-01-01	1	1	120	1500.00	200.00	Arroz de calidad	1	ofertas/November2018/4usYX5OVygPAIi38VYtV.png	1	4.123216838432971, -73.64243119580078	1
9	2018-11-21	2	2	625	1800.00	1000.00	Platano Chonto	1	ofertas/December2018/d8uvKSvn67JfsY3axIr7.png	1	4.125528265528225, -73.636165555542	1
\.


--
-- Name: ofertas_oferta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ofertas_oferta_seq', 10, true);


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages (id, author_id, title, excerpt, body, image, slug, meta_description, meta_keywords, status, created_at, updated_at) FROM stdin;
1	0	Hello World	Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.	<p>Hello World. Scallywag grog swab Cat o'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>	pages/page1.jpg	hello-world	Yar Meta Description	Keyword1, Keyword2	ACTIVE	2018-06-19 17:36:35	2018-06-19 17:36:35
\.


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_id_seq', 1, true);


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: permission_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission_role (permission_id, role_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
52	1
53	1
54	1
55	1
56	1
57	1
58	1
59	1
60	1
61	1
1	3
62	1
63	1
64	1
65	1
66	1
67	1
68	1
69	1
70	1
71	1
62	3
63	3
64	3
65	3
66	3
52	3
53	3
57	3
58	3
72	1
73	1
74	1
75	1
76	1
72	3
73	3
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, key, table_name, created_at, updated_at) FROM stdin;
1	browse_admin	\N	2018-06-19 17:36:35	2018-06-19 17:36:35
2	browse_bread	\N	2018-06-19 17:36:35	2018-06-19 17:36:35
3	browse_database	\N	2018-06-19 17:36:35	2018-06-19 17:36:35
4	browse_media	\N	2018-06-19 17:36:35	2018-06-19 17:36:35
5	browse_compass	\N	2018-06-19 17:36:35	2018-06-19 17:36:35
6	browse_menus	menus	2018-06-19 17:36:35	2018-06-19 17:36:35
7	read_menus	menus	2018-06-19 17:36:35	2018-06-19 17:36:35
8	edit_menus	menus	2018-06-19 17:36:35	2018-06-19 17:36:35
9	add_menus	menus	2018-06-19 17:36:35	2018-06-19 17:36:35
10	delete_menus	menus	2018-06-19 17:36:35	2018-06-19 17:36:35
11	browse_roles	roles	2018-06-19 17:36:35	2018-06-19 17:36:35
12	read_roles	roles	2018-06-19 17:36:35	2018-06-19 17:36:35
13	edit_roles	roles	2018-06-19 17:36:35	2018-06-19 17:36:35
14	add_roles	roles	2018-06-19 17:36:35	2018-06-19 17:36:35
15	delete_roles	roles	2018-06-19 17:36:35	2018-06-19 17:36:35
16	browse_users	users	2018-06-19 17:36:35	2018-06-19 17:36:35
17	read_users	users	2018-06-19 17:36:35	2018-06-19 17:36:35
18	edit_users	users	2018-06-19 17:36:35	2018-06-19 17:36:35
19	add_users	users	2018-06-19 17:36:35	2018-06-19 17:36:35
20	delete_users	users	2018-06-19 17:36:35	2018-06-19 17:36:35
21	browse_settings	settings	2018-06-19 17:36:35	2018-06-19 17:36:35
22	read_settings	settings	2018-06-19 17:36:35	2018-06-19 17:36:35
23	edit_settings	settings	2018-06-19 17:36:35	2018-06-19 17:36:35
24	add_settings	settings	2018-06-19 17:36:35	2018-06-19 17:36:35
25	delete_settings	settings	2018-06-19 17:36:35	2018-06-19 17:36:35
26	browse_categories	categories	2018-06-19 17:36:35	2018-06-19 17:36:35
27	read_categories	categories	2018-06-19 17:36:35	2018-06-19 17:36:35
28	edit_categories	categories	2018-06-19 17:36:35	2018-06-19 17:36:35
29	add_categories	categories	2018-06-19 17:36:35	2018-06-19 17:36:35
30	delete_categories	categories	2018-06-19 17:36:35	2018-06-19 17:36:35
31	browse_posts	posts	2018-06-19 17:36:35	2018-06-19 17:36:35
32	read_posts	posts	2018-06-19 17:36:35	2018-06-19 17:36:35
33	edit_posts	posts	2018-06-19 17:36:35	2018-06-19 17:36:35
34	add_posts	posts	2018-06-19 17:36:35	2018-06-19 17:36:35
35	delete_posts	posts	2018-06-19 17:36:35	2018-06-19 17:36:35
36	browse_pages	pages	2018-06-19 17:36:35	2018-06-19 17:36:35
37	read_pages	pages	2018-06-19 17:36:35	2018-06-19 17:36:35
38	edit_pages	pages	2018-06-19 17:36:35	2018-06-19 17:36:35
39	add_pages	pages	2018-06-19 17:36:35	2018-06-19 17:36:35
40	delete_pages	pages	2018-06-19 17:36:35	2018-06-19 17:36:35
41	browse_hooks	\N	2018-06-19 17:36:36	2018-06-19 17:36:36
42	browse_corregimientos	corregimientos	2018-06-19 21:27:15	2018-06-19 21:27:15
43	read_corregimientos	corregimientos	2018-06-19 21:27:15	2018-06-19 21:27:15
44	edit_corregimientos	corregimientos	2018-06-19 21:27:15	2018-06-19 21:27:15
45	add_corregimientos	corregimientos	2018-06-19 21:27:15	2018-06-19 21:27:15
46	delete_corregimientos	corregimientos	2018-06-19 21:27:15	2018-06-19 21:27:15
47	browse_agricultores	agricultores	2018-06-19 21:33:09	2018-06-19 21:33:09
48	read_agricultores	agricultores	2018-06-19 21:33:09	2018-06-19 21:33:09
49	edit_agricultores	agricultores	2018-06-19 21:33:09	2018-06-19 21:33:09
50	add_agricultores	agricultores	2018-06-19 21:33:09	2018-06-19 21:33:09
51	delete_agricultores	agricultores	2018-06-19 21:33:09	2018-06-19 21:33:09
52	browse_productos	productos	2018-06-19 21:54:36	2018-06-19 21:54:36
53	read_productos	productos	2018-06-19 21:54:36	2018-06-19 21:54:36
54	edit_productos	productos	2018-06-19 21:54:36	2018-06-19 21:54:36
55	add_productos	productos	2018-06-19 21:54:36	2018-06-19 21:54:36
56	delete_productos	productos	2018-06-19 21:54:36	2018-06-19 21:54:36
57	browse_veredas	veredas	2018-07-10 18:41:39	2018-07-10 18:41:39
58	read_veredas	veredas	2018-07-10 18:41:39	2018-07-10 18:41:39
59	edit_veredas	veredas	2018-07-10 18:41:39	2018-07-10 18:41:39
60	add_veredas	veredas	2018-07-10 18:41:39	2018-07-10 18:41:39
61	delete_veredas	veredas	2018-07-10 18:41:39	2018-07-10 18:41:39
62	browse_ofertas	ofertas	2018-07-10 18:53:29	2018-07-10 18:53:29
63	read_ofertas	ofertas	2018-07-10 18:53:29	2018-07-10 18:53:29
64	edit_ofertas	ofertas	2018-07-10 18:53:29	2018-07-10 18:53:29
65	add_ofertas	ofertas	2018-07-10 18:53:29	2018-07-10 18:53:29
66	delete_ofertas	ofertas	2018-07-10 18:53:29	2018-07-10 18:53:29
67	browse_unidades	unidades	2018-07-10 19:00:43	2018-07-10 19:00:43
68	read_unidades	unidades	2018-07-10 19:00:43	2018-07-10 19:00:43
69	edit_unidades	unidades	2018-07-10 19:00:43	2018-07-10 19:00:43
70	add_unidades	unidades	2018-07-10 19:00:43	2018-07-10 19:00:43
71	delete_unidades	unidades	2018-07-10 19:00:43	2018-07-10 19:00:43
72	browse_mensajes	mensajes	2018-07-31 05:38:03	2018-07-31 05:38:03
73	read_mensajes	mensajes	2018-07-31 05:38:03	2018-07-31 05:38:03
74	edit_mensajes	mensajes	2018-07-31 05:38:03	2018-07-31 05:38:03
75	add_mensajes	mensajes	2018-07-31 05:38:03	2018-07-31 05:38:03
76	delete_mensajes	mensajes	2018-07-31 05:38:03	2018-07-31 05:38:03
\.


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 76, true);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, author_id, category_id, title, seo_title, excerpt, body, image, slug, meta_description, meta_keywords, status, featured, created_at, updated_at) FROM stdin;
1	0	\N	Lorem Ipsum Post	\N	This is the excerpt for the Lorem Ipsum Post	<p>This is the body of the lorem ipsum post</p>	posts/post1.jpg	lorem-ipsum-post	This is the meta description	keyword1, keyword2, keyword3	PUBLISHED	f	2018-06-19 17:36:35	2018-06-19 17:36:35
2	0	\N	My Sample Post	\N	This is the excerpt for the sample Post	<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>	posts/post2.jpg	my-sample-post	Meta Description for sample post	keyword1, keyword2, keyword3	PUBLISHED	f	2018-06-19 17:36:35	2018-06-19 17:36:35
3	0	\N	Latest Post	\N	This is the excerpt for the latest post	<p>This is the body for the latest post</p>	posts/post3.jpg	latest-post	This is the meta description	keyword1, keyword2, keyword3	PUBLISHED	f	2018-06-19 17:36:35	2018-06-19 17:36:35
4	0	\N	Yarr Post	\N	Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.	<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>	posts/post4.jpg	yarr-post	this be a meta descript	keyword1, keyword2, keyword3	PUBLISHED	f	2018-06-19 17:36:35	2018-06-19 17:36:35
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 4, true);


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (producto, nombre, imagen) FROM stdin;
1	Arroz	["productos\\/July2018\\/4BKwq0dM9MKx0ifQr2yn.jpg"]
2	Platano	["productos\\/July2018\\/zxWT7SAbSNVT8NZGotdl.jpg"]
3	Café	["productos\\/July2018\\/aQfJLQFBAdgd7FoZEAnc.jpg"]
5	Huevos	["productos\\/August2018\\/1fILGkljI0miUN7KoprW.jpg"]
7	Maracuya	["productos\\/November2018\\/dHOQBvw8wSc4Qzr1qQ2M.jpg"]
6	Ahuyama	["productos\\/December2018\\/0Ns9kzEBtZv4VFKhcVAq.jpg"]
4	Maiz	["productos\\/December2018\\/bbESllDgm5uGvnGunFzW.png"]
\.


--
-- Name: productos_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_producto_seq', 8, true);


--
-- Data for Name: reportes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reportes (reporte, sql, parametros, nombre, estadistica) FROM stdin;
3	SELECT o.fecha,p.nombre as producto,u.descripcion as unidades,\no.capacidad,o.valor,o.valor_envio,\no.descripcion,a.name as agricultor,a.telefono,a.direccion,a.email,\nv.nombre as vereda,c.nombre as corregimiento,\n'http://maps.google.com/maps?q=' || o.ubicacion as ubicacion\nFROM ofertas o,productos p,users a,veredas v,corregimientos c,unidades u\nWHERE o.producto=p.producto AND o.agricultor=a.id AND v.vereda=o.vereda\nAND v.corregimiento=c.corregimiento AND u.unidad=o.unidad AND p.producto=[producto]	producto|Producto|combo:productos,producto,nombre	Ofertas por producto	0
2	SELECT o.fecha,p.nombre as producto,u.descripcion as unidades,\no.capacidad,o.valor,o.valor_envio,\no.descripcion,a.name as agricultor,a.telefono,a.direccion,a.email,\nv.nombre as vereda,c.nombre as corregimiento,\n'http://maps.google.com/maps?q=' || o.ubicacion as ubicacion\nFROM ofertas o,productos p,users a,veredas v,corregimientos c,unidades u\nWHERE o.producto=p.producto AND o.agricultor=a.id AND v.vereda=o.vereda\nAND v.corregimiento=c.corregimiento AND u.unidad=o.unidad AND a.id=[productor]	productor|Agricultor|combo:users,id,name	Ofertas por Agricultor	0
4	SELECT a.name as agricultor,a.email,a.direccion,a.telefono,count(m.*)as consultas\nFROM users a,mensajes m\nWHERE\n m.user=a.id\n AND\n cast(m.fecha as date)>='[fecha1]' AND cast(m.fecha as date)<='[fecha2]'\nGROUP BY\na.name,a.email,a.direccion,a.telefono	fecha1|Fecha Inicial|fecha;fecha2|Fecha final|fecha	Agricultores mas consultados	0
1	SELECT o.fecha,p.nombre as producto,u.descripcion as unidades,\no.capacidad,o.valor,o.valor_envio,\no.descripcion,a.name as agricultor,a.telefono,a.direccion,a.email,\nv.nombre as vereda,c.nombre as corregimiento,\n'http://maps.google.com/maps?q=' || o.ubicacion as ubicacion\nFROM ofertas o,productos p,users a,veredas v,corregimientos c,unidades u\nWHERE o.producto=p.producto AND o.agricultor=a.id AND v.vereda=o.vereda\nAND v.corregimiento=c.corregimiento AND u.unidad=o.unidad AND c.corregimiento=[corregimiento]	corregimiento|Corregimiento|combo:corregimientos,corregimiento,nombre	Ofertas por sector/corregimiento	0
5	SELECT p.nombre as producto,count(o.*) FROM productos p,ofertas o\nWHERE p.producto=o.producto AND cast(o.fecha as date)>='[fecha1]' AND cast(o.fecha as date)<='[fecha2]' GROUP BY p.nombre	fecha1|Fecha Inicial|fecha;fecha2|Fecha final|fecha	Estadisticas de oferta por productos	2
6	SELECT c.nombre, count(o.*) FROM ofertas o,corregimientos c,veredas v\nWHERE o.vereda=v.vereda AND v.corregimiento=c.corregimiento AND \ncast(o.fecha as date)>='[fecha1]' AND cast(o.fecha as date)<='[fecha2]'\nGROUP BY c.nombre	fecha1|Fecha Inicial|fecha;fecha2|Fecha final|fecha	Estadisticas de ofertas por corregimiento	1
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, display_name, created_at, updated_at) FROM stdin;
1	admin	Administrator	2018-06-19 17:36:35	2018-06-19 17:36:35
3	Agricultores	Agricultores	2018-07-10 18:47:16	2018-07-10 18:47:16
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, key, display_name, value, details, type, "order", "group") FROM stdin;
2	site.description	Site Description	Aplicaci[on		text	2	Site
4	site.google_analytics_tracking_id	Google Analytics Tracking ID	\N		text	4	Site
10	admin.google_analytics_client_id	Google Analytics Client ID (used for admin dashboard)	\N		text	1	Admin
7	admin.description	Admin Description	Bienvenido a la plataforma para la competitividad y el desarrollo - Villavicencio		text	2	Admin
5	admin.bg_image	Admin Background Image	settings/June2018/aqxs1kazBuUeiL4yOJMO.jpg		image	5	Admin
8	admin.loader	Admin Loader			image	3	Admin
1	site.title	Site Title	Del Campo : App para la Competitividad Villavicencio		text	1	Site
3	site.logo	Site Logo	settings/August2018/Q5ayVqM0MafiIMOeriQD.png		image	3	Site
9	admin.icon_image	Admin Icon Image	settings/August2018/lV1iXkKUesuISamr8QkZ.png		image	4	Admin
6	admin.title	Admin Title	Del Campo : Alcaldia de Villavicencio - Competitividad y Desarrollo		text	1	Admin
\.


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 10, true);


--
-- Data for Name: translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.translations (id, table_name, column_name, foreign_key, locale, value, created_at, updated_at) FROM stdin;
1	data_types	display_name_singular	5	pt	Post	2018-06-19 17:36:35	2018-06-19 17:36:35
2	data_types	display_name_singular	6	pt	Página	2018-06-19 17:36:35	2018-06-19 17:36:35
3	data_types	display_name_singular	1	pt	Utilizador	2018-06-19 17:36:35	2018-06-19 17:36:35
4	data_types	display_name_singular	4	pt	Categoria	2018-06-19 17:36:35	2018-06-19 17:36:35
5	data_types	display_name_singular	2	pt	Menu	2018-06-19 17:36:35	2018-06-19 17:36:35
6	data_types	display_name_singular	3	pt	Função	2018-06-19 17:36:35	2018-06-19 17:36:35
7	data_types	display_name_plural	5	pt	Posts	2018-06-19 17:36:35	2018-06-19 17:36:35
8	data_types	display_name_plural	6	pt	Páginas	2018-06-19 17:36:35	2018-06-19 17:36:35
9	data_types	display_name_plural	1	pt	Utilizadores	2018-06-19 17:36:35	2018-06-19 17:36:35
10	data_types	display_name_plural	4	pt	Categorias	2018-06-19 17:36:35	2018-06-19 17:36:35
11	data_types	display_name_plural	2	pt	Menus	2018-06-19 17:36:35	2018-06-19 17:36:35
12	data_types	display_name_plural	3	pt	Funções	2018-06-19 17:36:35	2018-06-19 17:36:35
13	categories	slug	1	pt	categoria-1	2018-06-19 17:36:35	2018-06-19 17:36:35
14	categories	name	1	pt	Categoria 1	2018-06-19 17:36:35	2018-06-19 17:36:35
15	categories	slug	2	pt	categoria-2	2018-06-19 17:36:35	2018-06-19 17:36:35
16	categories	name	2	pt	Categoria 2	2018-06-19 17:36:35	2018-06-19 17:36:35
17	pages	title	1	pt	Olá Mundo	2018-06-19 17:36:35	2018-06-19 17:36:35
18	pages	slug	1	pt	ola-mundo	2018-06-19 17:36:35	2018-06-19 17:36:35
19	pages	body	1	pt	<p>Olá Mundo. Scallywag grog swab Cat o'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>	2018-06-19 17:36:35	2018-06-19 17:36:35
20	menu_items	title	1	pt	Painel de Controle	2018-06-19 17:36:35	2018-06-19 17:36:35
21	menu_items	title	2	pt	Media	2018-06-19 17:36:35	2018-06-19 17:36:35
22	menu_items	title	12	pt	Publicações	2018-06-19 17:36:35	2018-06-19 17:36:35
23	menu_items	title	3	pt	Utilizadores	2018-06-19 17:36:35	2018-06-19 17:36:35
24	menu_items	title	11	pt	Categorias	2018-06-19 17:36:35	2018-06-19 17:36:35
25	menu_items	title	13	pt	Páginas	2018-06-19 17:36:35	2018-06-19 17:36:35
26	menu_items	title	4	pt	Funções	2018-06-19 17:36:35	2018-06-19 17:36:35
27	menu_items	title	5	pt	Ferramentas	2018-06-19 17:36:35	2018-06-19 17:36:35
28	menu_items	title	6	pt	Menus	2018-06-19 17:36:35	2018-06-19 17:36:35
29	menu_items	title	7	pt	Base de dados	2018-06-19 17:36:35	2018-06-19 17:36:35
30	menu_items	title	10	pt	Configurações	2018-06-19 17:36:35	2018-06-19 17:36:35
\.


--
-- Name: translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.translations_id_seq', 30, true);


--
-- Data for Name: unidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unidades (unidad, descripcion) FROM stdin;
1	Libras
2	Kilos
3	Arrobas
4	Cubetas
5	LITROS
\.


--
-- Name: unidades_unidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unidades_unidad_seq', 5, true);


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (user_id, role_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, remember_token, created_at, updated_at, avatar, role_id, settings, telefono, cedula, direccion, corregimiento) FROM stdin;
1	Admin	admin@admin.com	$2y$10$8BPGPwl0zVs.BXjLcv9BNuuJFN8Regz3hyFxUuhB0ikCAR5NbNd4e	u7Wvqk1fLdXBvG1d3sMPwzyxLDF9sd7FEnFoOaBhryYFLHEzzMGiuuVPdhsy	2018-06-19 17:36:35	2018-07-31 05:17:00	users/default.png	1	\N	\N	1	\N	1
11	Erik Duvan	erik.duvan@hotmail.com	$2y$10$uiNrsTf37Sf691eQXyycJu500L.g7g3HH3FxInejPxttU/G.rDuty	Njya17I96T870gXZzLGJtkPV1aRMxjHHP8S0gWNsCRLj63UVkvyjeS6Rha6y	2018-12-11 16:45:06	2018-12-14 13:28:01	users/default.png	3	\N	3212568974	12457869	alto de pompeya av puerto lopez	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Data for Name: veredas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veredas (vereda, nombre, corregimiento) FROM stdin;
1	Las Mercedes	1
2	La Union	1
4	BuenaVista	2
5	Pipiral	2
3	El Carmen	2
7	la concepcion	1
8	rio negrito	1
9	san luis de ocoa	1
10	zuria	1
12	contadero	2
11	buenos aires	2
13	cornetal	2
14	la bendicion	2
15	mesetas	2
16	pipiral	2
17	samaria	2
18	san juan de ocoa	2
19	servità	2
20	la argentina	3
21	la liertad	3
22	palmichal	3
23	quebrada honda	3
24	san cristobal	3
25	santamaria alta	3
26	santa maria baja	3
27	alto de pompeya	4
28	indostan	4
29	los arrayanes	4
30	peralonso	4
31	puerto colombia	4
32	puerto tembleque	4
33	rincon de pompeya	4
34	cairo alto	5
35	cairo bajo	5
36	la poyata	5
37	puente amarillo	5
38	vanguardia	5
39	lourdes	6
40	puente abadia	6
41	san jose alto	6
42	san jose bajo	6
43	santa helena alta	6
44	santa teresa	6
45	apiay	7
46	barcelona	7
47	bella suiza	7
48	caños negros	7
49	cocuy	7
50	el guamo	7
51	la cecilia	7
52	la llanerita	7
53	la vigia	7
54	san juan bosco	7
55	santa helena baja	7
56	santa rosa	7
57	vegas de guayuriba	7
\.


--
-- Name: veredas_vereda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veredas_vereda_seq', 57, true);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_unique UNIQUE (slug);


--
-- Name: data_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_rows
    ADD CONSTRAINT data_rows_pkey PRIMARY KEY (id);


--
-- Name: data_types_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_types
    ADD CONSTRAINT data_types_name_unique UNIQUE (name);


--
-- Name: data_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_types
    ADD CONSTRAINT data_types_pkey PRIMARY KEY (id);


--
-- Name: data_types_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_types
    ADD CONSTRAINT data_types_slug_unique UNIQUE (slug);


--
-- Name: lp_agricultores; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agricultores
    ADD CONSTRAINT lp_agricultores PRIMARY KEY (id);


--
-- Name: lp_corregimientos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.corregimientos
    ADD CONSTRAINT lp_corregimientos PRIMARY KEY (corregimiento);


--
-- Name: lp_mensaje; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajes
    ADD CONSTRAINT lp_mensaje PRIMARY KEY (mensaje);


--
-- Name: lp_ofertas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ofertas
    ADD CONSTRAINT lp_ofertas PRIMARY KEY (oferta);


--
-- Name: lp_productos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT lp_productos PRIMARY KEY (producto);


--
-- Name: lp_reportes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reportes
    ADD CONSTRAINT lp_reportes PRIMARY KEY (reporte);


--
-- Name: lp_unidades; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades
    ADD CONSTRAINT lp_unidades PRIMARY KEY (unidad);


--
-- Name: lp_veredas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veredas
    ADD CONSTRAINT lp_veredas PRIMARY KEY (vereda);


--
-- Name: menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- Name: menus_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_name_unique UNIQUE (name);


--
-- Name: menus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: pages_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_slug_unique UNIQUE (slug);


--
-- Name: permission_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posts_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_slug_unique UNIQUE (slug);


--
-- Name: roles_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_unique UNIQUE (name);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: settings_key_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_key_unique UNIQUE (key);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translations
    ADD CONSTRAINT translations_pkey PRIMARY KEY (id);


--
-- Name: translations_table_name_column_name_foreign_key_locale_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translations
    ADD CONSTRAINT translations_table_name_column_name_foreign_key_locale_unique UNIQUE (table_name, column_name, foreign_key, locale);


--
-- Name: unq_cedula; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unq_cedula UNIQUE (cedula);


--
-- Name: user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: permission_role_permission_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX permission_role_permission_id_index ON public.permission_role USING btree (permission_id);


--
-- Name: permission_role_role_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX permission_role_role_id_index ON public.permission_role USING btree (role_id);


--
-- Name: permissions_key_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX permissions_key_index ON public.permissions USING btree (key);


--
-- Name: user_roles_role_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_roles_role_id_index ON public.user_roles USING btree (role_id);


--
-- Name: user_roles_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_roles_user_id_index ON public.user_roles USING btree (user_id);


--
-- Name: categories_parent_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: data_rows_data_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_rows
    ADD CONSTRAINT data_rows_data_type_id_foreign FOREIGN KEY (data_type_id) REFERENCES public.data_types(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lf_correg_agric; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agricultores
    ADD CONSTRAINT lf_correg_agric FOREIGN KEY (corregimiento) REFERENCES public.corregimientos(corregimiento) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: lf_corregimiento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT lf_corregimiento FOREIGN KEY (corregimiento) REFERENCES public.corregimientos(corregimiento);


--
-- Name: lf_prdc_ofrt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ofertas
    ADD CONSTRAINT lf_prdc_ofrt FOREIGN KEY (producto) REFERENCES public.productos(producto) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: lf_und_ofrt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ofertas
    ADD CONSTRAINT lf_und_ofrt FOREIGN KEY (unidad) REFERENCES public.unidades(unidad) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: lf_vereda_correg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veredas
    ADD CONSTRAINT lf_vereda_correg FOREIGN KEY (corregimiento) REFERENCES public.corregimientos(corregimiento);


--
-- Name: menu_items_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- Name: permission_role_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: permission_role_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: user_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: user_roles_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

