--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: choward
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO choward;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: choward
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO choward;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: choward
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: choward
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO choward;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: choward
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO choward;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: choward
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: choward
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO choward;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: choward
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO choward;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: choward
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: choward
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO choward;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: choward
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO choward;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: choward
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO choward;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: choward
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: choward
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO choward;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: choward
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: choward
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO choward;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: choward
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO choward;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: choward
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: catalog_book; Type: TABLE; Schema: public; Owner: choward
--

CREATE TABLE catalog_book (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    author_first character varying(100) NOT NULL,
    author_last character varying(100) NOT NULL,
    isbn character varying(15) NOT NULL,
    publisher character varying(30) NOT NULL,
    year character varying(4) NOT NULL,
    item_id integer,
    description text
);


ALTER TABLE catalog_book OWNER TO choward;

--
-- Name: catalog_book_id_seq; Type: SEQUENCE; Schema: public; Owner: choward
--

CREATE SEQUENCE catalog_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalog_book_id_seq OWNER TO choward;

--
-- Name: catalog_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: choward
--

ALTER SEQUENCE catalog_book_id_seq OWNED BY catalog_book.id;


--
-- Name: catalog_comic; Type: TABLE; Schema: public; Owner: choward
--

CREATE TABLE catalog_comic (
    id integer NOT NULL,
    publisher character varying(30) NOT NULL,
    series character varying(50) NOT NULL,
    title character varying(255) NOT NULL,
    number integer,
    year character varying(4) NOT NULL,
    month character varying(3) NOT NULL,
    item_id integer,
    description character varying(500)
);


ALTER TABLE catalog_comic OWNER TO choward;

--
-- Name: catalog_comic_id_seq; Type: SEQUENCE; Schema: public; Owner: choward
--

CREATE SEQUENCE catalog_comic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalog_comic_id_seq OWNER TO choward;

--
-- Name: catalog_comic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: choward
--

ALTER SEQUENCE catalog_comic_id_seq OWNED BY catalog_comic.id;


--
-- Name: catalog_item; Type: TABLE; Schema: public; Owner: choward
--

CREATE TABLE catalog_item (
    id integer NOT NULL,
    item_name character varying(100) NOT NULL,
    owned_by_id integer,
    added_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    item_type_id integer
);


ALTER TABLE catalog_item OWNER TO choward;

--
-- Name: catalog_item_id_seq; Type: SEQUENCE; Schema: public; Owner: choward
--

CREATE SEQUENCE catalog_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalog_item_id_seq OWNER TO choward;

--
-- Name: catalog_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: choward
--

ALTER SEQUENCE catalog_item_id_seq OWNED BY catalog_item.id;


--
-- Name: catalog_item_status; Type: TABLE; Schema: public; Owner: choward
--

CREATE TABLE catalog_item_status (
    id integer NOT NULL,
    loaned_at timestamp with time zone,
    due_back timestamp with time zone,
    item_id integer,
    borrower_id integer
);


ALTER TABLE catalog_item_status OWNER TO choward;

--
-- Name: catalog_item_status_id_seq; Type: SEQUENCE; Schema: public; Owner: choward
--

CREATE SEQUENCE catalog_item_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalog_item_status_id_seq OWNER TO choward;

--
-- Name: catalog_item_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: choward
--

ALTER SEQUENCE catalog_item_status_id_seq OWNED BY catalog_item_status.id;


--
-- Name: catalog_item_type; Type: TABLE; Schema: public; Owner: choward
--

CREATE TABLE catalog_item_type (
    id integer NOT NULL,
    type character varying(50) NOT NULL
);


ALTER TABLE catalog_item_type OWNER TO choward;

--
-- Name: catalog_item_type_id_seq; Type: SEQUENCE; Schema: public; Owner: choward
--

CREATE SEQUENCE catalog_item_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalog_item_type_id_seq OWNER TO choward;

--
-- Name: catalog_item_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: choward
--

ALTER SEQUENCE catalog_item_type_id_seq OWNED BY catalog_item_type.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: choward
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO choward;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: choward
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO choward;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: choward
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: choward
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO choward;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: choward
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO choward;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: choward
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: choward
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO choward;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: choward
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO choward;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: choward
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: choward
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO choward;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: catalog_book id; Type: DEFAULT; Schema: public; Owner: choward
--

ALTER TABLE ONLY catalog_book ALTER COLUMN id SET DEFAULT nextval('catalog_book_id_seq'::regclass);


--
-- Name: catalog_comic id; Type: DEFAULT; Schema: public; Owner: choward
--

ALTER TABLE ONLY catalog_comic ALTER COLUMN id SET DEFAULT nextval('catalog_comic_id_seq'::regclass);


--
-- Name: catalog_item id; Type: DEFAULT; Schema: public; Owner: choward
--

ALTER TABLE ONLY catalog_item ALTER COLUMN id SET DEFAULT nextval('catalog_item_id_seq'::regclass);


--
-- Name: catalog_item_status id; Type: DEFAULT; Schema: public; Owner: choward
--

ALTER TABLE ONLY catalog_item_status ALTER COLUMN id SET DEFAULT nextval('catalog_item_status_id_seq'::regclass);


--
-- Name: catalog_item_type id; Type: DEFAULT; Schema: public; Owner: choward
--

ALTER TABLE ONLY catalog_item_type ALTER COLUMN id SET DEFAULT nextval('catalog_item_type_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: choward
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: choward
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: choward
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: choward
--

COPY auth_group (id, name) FROM stdin;
1	Application Users
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: choward
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: choward
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: choward
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: choward
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add book	7	add_book
20	Can change book	7	change_book
21	Can delete book	7	delete_book
22	Can add item	8	add_item
23	Can change item	8	change_item
24	Can delete item	8	delete_item
25	Can add item_type	9	add_item_type
26	Can change item_type	9	change_item_type
27	Can delete item_type	9	delete_item_type
28	Can add comic	10	add_comic
29	Can change comic	10	change_comic
30	Can delete comic	10	delete_comic
31	Can add item_status	11	add_item_status
32	Can change item_status	11	change_item_status
33	Can delete item_status	11	delete_item_status
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: choward
--

SELECT pg_catalog.setval('auth_permission_id_seq', 33, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: choward
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$36000$VOelRw9FiubE$2dSWxce6ppjo+897CjJQbwqQp/2h4opK4wk+HkvLTcM=	2017-09-16 16:34:50.470533-04	f	bschwanitz				f	t	2017-09-14 13:46:31.989742-04
2	pbkdf2_sha256$36000$6iOJ9IEJncQT$h10tw6BWZXMy6Ov9S6pVg7TwgbOsY3FPUh1LdeLOk0g=	2017-09-20 23:07:23.126013-04	f	test_user	Test	User	cjhosu@gmail.com	f	t	2017-09-10 17:58:37-04
1	pbkdf2_sha256$36000$LmdfXF5P4kPP$niYgQclV8uQ0OX3QBGSEVQKyH4RuDD6qyKPDR3xaopU=	2017-09-20 23:11:44.79919-04	t	choward			cjhous@gmail.com	t	t	2017-09-02 16:35:59.838291-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: choward
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
1	2	1
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: choward
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: choward
--

SELECT pg_catalog.setval('auth_user_id_seq', 3, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: choward
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: choward
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: catalog_book; Type: TABLE DATA; Schema: public; Owner: choward
--

COPY catalog_book (id, title, author_first, author_last, isbn, publisher, year, item_id, description) FROM stdin;
1	A Game of Thrones	George	Martin	12098928391827	Tor	1995	1	Long ago, in a time forgotten, a preternatural event threw the seasons out of balance. In a land where summers can last decades and winters a lifetime, trouble is brewing. The cold is returning, and in the frozen wastes to the north of Winterfell, sinister forces are massing beyond the kingdom’s protective Wall. To the south, the king’s powers are failing—his most trusted adviser dead under mysterious circumstances and his enemies emerging from the shadows of the throne. At the center of the conflict lie the Starks of Winterfell, a family as harsh and unyielding as the frozen land they were born to. Now Lord Eddard Stark is reluctantly summoned to serve as the king’s new Hand, an appointment that threatens to sunder not only his family but the kingdom itself.\r\n\r\nSweeping from a harsh land of cold to a summertime kingdom of epicurean plenty, A Game of Thrones tells a tale of lords and ladies, soldiers and sorcerers, assassins and bastards, who come together in a time of grim omens. Here an enigmatic band of warriors bear swords of no human metal; a tribe of fierce wildlings carry men off into madness; a cruel young dragon prince barters his sister to win back his throne; a child is lost in the twilight between life and death; and a determined woman undertakes a treacherous journey to protect all she holds dear. Amid plots and counter-plots, tragedy and betrayal, victory and terror, allies and enemies, the fate of the Starks hangs perilously in the balance, as each side endeavors to win that deadliest of conflicts: the game of thrones.\r\n\r\nUnparalleled in scope and execution, A Game of Thrones is one of those rare reading experiences that catch you up from the opening pages, won’t let you go until the end, and leave you yearning for more.
2	A Clash of Kings	George	Martin	1209879898743	Tir	1998	2	A comet the color of blood and flame cuts across the sky. And from the ancient citadel of Dragonstone to the forbidding shores of Winterfell, chaos reigns. Six factions struggle for control of a divided land and the Iron Throne of the Seven Kingdoms, preparing to stake their claims through tempest, turmoil, and war. It is a tale in which brother plots against brother and the dead rise to walk in the night. Here a princess masquerades as an orphan boy; a knight of the mind prepares a poison for a treacherous sorceress; and wild men descend from the Mountains of the Moon to ravage the countryside. Against a backdrop of incest and fratricide, alchemy and murder, victory may go to the men and women possessed of the coldest steel...and the coldest hearts. For when kings clash, the whole land trembles.
3	Dune	Frank	Herbert	978-0-441-17271	Ace Science Fiction	1965	4	Set on the desert planet Arrakis, Dune is the story of the boy Paul Atreides, who would become the mysterious man known as Muad'Dib. He would avenge the traitorous plot against his noble family—and would bring to fruition humankind’s most ancient and unattainable dream.\r\n\r\nA stunning blend of adventure and mysticism, environmentalism and politics, Dune won the first Nebula Award, shared the Hugo Award, and formed the basis of what it undoubtedly the grandest epic in science fiction.
4	Head First C#	Andrew , Jennifer	Stellman, Greene	34566789-35674	OReilly	2013	5	Learn the stuff about C# that is worth learning.
5	The Moon Is A Harsh Mistress	Robert	Heinlein	98765643265	Orb	1965	6	It is a tale of revolution, of the rebellion of the former Lunar penal colony against the Lunar Authority that controls it from Earth. It is the tale of the disparate people--a computer technician, a vigorous young female agitator, and an elderly academic--who become the rebel movement's leaders. And it is the story of Mike, the supercomputer whose sentience is known only to this inner circle, and who for reasons of his own is committed to the revolution's ultimate success.\r\n\r\nThe Moon is a Harsh Mistress is one of the high points of modern science fiction, a novel bursting with politics, humanity, passion, innovative technical speculation, and a firm belief in the pursuit of human freedom.\r\n\r\nThe Moon is a Harsh Mistress is the winner of the 1967 Hugo Award for Best Novel.
19	A Feast For Crows	George	Martin	7654098789	Tor	2007	28	This is the 4th book in the SOIAF series!
\.


--
-- Name: catalog_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: choward
--

SELECT pg_catalog.setval('catalog_book_id_seq', 19, true);


--
-- Data for Name: catalog_comic; Type: TABLE DATA; Schema: public; Owner: choward
--

COPY catalog_comic (id, publisher, series, title, number, year, month, item_id, description) FROM stdin;
2	Marvel	Thor	Thor Does Good Stuff	345	1978	Jan	3	\N
\.


--
-- Name: catalog_comic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: choward
--

SELECT pg_catalog.setval('catalog_comic_id_seq', 2, true);


--
-- Data for Name: catalog_item; Type: TABLE DATA; Schema: public; Owner: choward
--

COPY catalog_item (id, item_name, owned_by_id, added_at, updated_at, item_type_id) FROM stdin;
1	A Game of  Thrones	1	2017-09-02 16:39:54-04	2017-09-02 16:39:56-04	1
2	A Clash of Kings	1	2017-09-02 16:42:06-04	2017-09-02 16:42:11-04	1
3	Thor Number 345	1	2017-09-04 19:56:40-04	2017-09-04 19:56:42-04	2
4	Dune	1	2017-09-11 18:33:27-04	2017-09-11 18:33:29-04	1
6	The Moon Is A Harsh Mistress	3	2017-09-14 13:46:34-04	2017-09-14 13:46:36-04	1
5	Head First C#	2	2017-09-12 16:37:11-04	2017-09-12 16:37:13-04	1
28	A Feast For Crows	1	2017-09-19 09:32:05.303183-04	2017-09-19 09:32:05.303188-04	1
\.


--
-- Name: catalog_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: choward
--

SELECT pg_catalog.setval('catalog_item_id_seq', 28, true);


--
-- Data for Name: catalog_item_status; Type: TABLE DATA; Schema: public; Owner: choward
--

COPY catalog_item_status (id, loaned_at, due_back, item_id, borrower_id) FROM stdin;
22	\N	\N	28	\N
8	\N	\N	6	1
7	\N	\N	5	\N
4	2017-09-05 15:10:17-04	\N	2	2
6	\N	\N	4	\N
21	\N	\N	1	2
\.


--
-- Name: catalog_item_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: choward
--

SELECT pg_catalog.setval('catalog_item_status_id_seq', 22, true);


--
-- Data for Name: catalog_item_type; Type: TABLE DATA; Schema: public; Owner: choward
--

COPY catalog_item_type (id, type) FROM stdin;
1	Book
2	Comic
\.


--
-- Name: catalog_item_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: choward
--

SELECT pg_catalog.setval('catalog_item_type_id_seq', 2, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: choward
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-09-02 16:39:46.375563-04	1	Book	1	[{"added": {}}]	9	1
2	2017-09-02 16:39:58.578204-04	1	A Game of  Thrones	1	[{"added": {}}]	8	1
3	2017-09-02 16:40:08.207006-04	1	A Game of Thrones	1	[{"added": {}}]	7	1
4	2017-09-02 16:42:13.45134-04	2	A Clash of Kings	1	[{"added": {}}]	8	1
5	2017-09-02 16:42:15.855923-04	2	A Clash of Kings	1	[{"added": {}}]	7	1
6	2017-09-04 19:56:32.687141-04	2	Comic	1	[{"added": {}}]	9	1
7	2017-09-04 19:56:43.730015-04	3	Thor Number 345	1	[{"added": {}}]	8	1
8	2017-09-04 20:02:15.241265-04	2	Thor	1	[{"added": {}}]	10	1
9	2017-09-05 14:13:51.862145-04	3	Item_status object	1	[{"added": {}}]	11	1
10	2017-09-05 15:10:25.01813-04	4	Item_status object	1	[{"added": {}}]	11	1
11	2017-09-10 17:11:18.382482-04	1	A Game of Thrones	2	[{"changed": {"fields": ["description"]}}]	7	1
12	2017-09-10 17:14:40.524515-04	1	A Game of Thrones	2	[]	7	1
13	2017-09-10 17:56:21.693096-04	1	Application Users	1	[{"added": {}}]	3	1
14	2017-09-10 17:58:37.270108-04	2	test_user	1	[{"added": {}}]	4	1
15	2017-09-10 17:59:53.500066-04	2	test_user	2	[{"changed": {"fields": ["first_name", "last_name", "email", "last_login"]}}]	4	1
16	2017-09-10 18:45:40.998225-04	2	test_user	2	[{"changed": {"fields": ["password"]}}]	4	1
17	2017-09-10 19:00:41.097464-04	2	A Clash of Kings	2	[{"changed": {"fields": ["description"]}}]	7	1
18	2017-09-11 17:55:26.801107-04	5	Item_status object	1	[{"added": {}}]	11	1
19	2017-09-11 17:56:12.086259-04	5	Item_status object	3		11	1
20	2017-09-11 18:28:09.284768-04	3	Item_status object	2	[{"changed": {"fields": ["borrower"]}}]	11	1
21	2017-09-11 18:33:31.515492-04	4	Dune	1	[{"added": {}}]	8	1
22	2017-09-11 18:35:50.817163-04	3	Dune	1	[{"added": {}}]	7	1
23	2017-09-11 18:35:57.279401-04	3	Dune	2	[]	7	1
24	2017-09-11 18:36:28.69451-04	6	Item_status object	1	[{"added": {}}]	11	1
25	2017-09-11 18:36:53.655388-04	6	Item_status object	2	[{"changed": {"fields": ["borrower", "loaned_at", "due_back"]}}]	11	1
26	2017-09-12 16:37:17.052116-04	5	Head First C#	1	[{"added": {}}]	8	1
27	2017-09-12 16:38:54.577633-04	4	Head First C#	1	[{"added": {}}]	7	1
28	2017-09-12 16:41:37.547796-04	7	Item_status object	1	[{"added": {}}]	11	1
29	2017-09-12 19:03:16.666261-04	7	Item_status object	2	[{"changed": {"fields": ["borrower", "loaned_at"]}}]	11	1
30	2017-09-12 19:03:52.428345-04	7	Item_status object	2	[{"changed": {"fields": ["due_back"]}}]	11	1
31	2017-09-14 13:46:32.043065-04	3	bschwanitz	1	[{"added": {}}]	4	1
32	2017-09-14 13:46:38.59665-04	6	The Moon Is A Harsh Mistress	1	[{"added": {}}]	8	1
33	2017-09-14 13:46:54.866332-04	8	Item_status object	1	[{"added": {}}]	11	1
34	2017-09-14 13:48:45.746742-04	5	The Moon Is A Harsh Mistress	1	[{"added": {}}]	7	1
35	2017-09-14 13:49:58.91306-04	8	Item_status object	2	[{"changed": {"fields": ["borrower", "loaned_at", "due_back"]}}]	11	1
36	2017-09-14 23:28:50.941039-04	8	Item_status object	2	[{"changed": {"fields": ["borrower"]}}]	11	1
37	2017-09-14 23:29:00.349176-04	7	Item_status object	2	[{"changed": {"fields": ["borrower"]}}]	11	1
38	2017-09-14 23:29:50.484759-04	7	Item_status object	2	[{"changed": {"fields": ["borrower", "loaned_at", "due_back"]}}]	11	1
39	2017-09-14 23:30:49.811907-04	5	Head First C#	2	[{"changed": {"fields": ["owned_by"]}}]	8	1
40	2017-09-17 15:57:37.385042-04	13	Another	3		8	1
41	2017-09-17 16:08:09.245079-04	14	Magna Carta	3		8	1
42	2017-09-17 16:15:26.724167-04	15	Magna Carta	3		8	1
43	2017-09-17 16:15:49.584649-04	16	Magna Carta	3		8	1
44	2017-09-17 16:23:12.448953-04	17	Magna Carta	3		8	1
45	2017-09-17 16:23:49.420328-04	8	Magna Carta	3		7	1
46	2017-09-17 16:23:49.42387-04	7	Magna Carta	3		7	1
47	2017-09-17 16:23:49.424916-04	6	Magna Carta	3		7	1
48	2017-09-17 16:33:41.961557-04	16	Magna Carta	3		7	1
49	2017-09-17 16:33:41.964932-04	15	Magna Carta	3		7	1
50	2017-09-17 16:33:41.96603-04	14	Magna Carta	3		7	1
51	2017-09-17 16:33:41.967174-04	13	Magna Carta	3		7	1
52	2017-09-17 16:33:41.96818-04	12	Magna Carta	3		7	1
53	2017-09-17 16:33:41.969152-04	11	Magna Carta	3		7	1
54	2017-09-17 16:33:41.970038-04	10	Magna Carta	3		7	1
55	2017-09-17 16:33:41.970839-04	9	Magna Carta	3		7	1
56	2017-09-17 16:33:57.255272-04	25	Magna Carta	3		8	1
57	2017-09-17 16:33:57.2609-04	24	Magna Carta	3		8	1
58	2017-09-17 16:33:57.26192-04	23	Magna Carta	3		8	1
59	2017-09-17 16:33:57.262914-04	22	Magna Carta	3		8	1
60	2017-09-17 16:33:57.264065-04	21	Magna Carta	3		8	1
61	2017-09-17 16:33:57.264947-04	20	Magna Carta	3		8	1
62	2017-09-17 16:33:57.265783-04	19	Magna Carta	3		8	1
63	2017-09-17 16:33:57.266508-04	18	Magna Carta	3		8	1
64	2017-09-18 18:35:44.388607-04	18	1234	3		7	1
65	2017-09-18 18:36:10.131531-04	27	Magna Carta	3		8	1
66	2017-09-18 22:07:40.844689-04	26	Magna Carta	3		8	1
67	2017-09-18 22:07:53.638171-04	17	Magna Carta	3		7	1
68	2017-09-19 09:24:48.89822-04	20	Item_status object	3		11	1
69	2017-09-19 09:24:48.923411-04	19	Item_status object	3		11	1
70	2017-09-19 09:24:48.929986-04	18	Item_status object	3		11	1
71	2017-09-19 09:24:48.936527-04	17	Item_status object	3		11	1
72	2017-09-19 09:24:48.943215-04	16	Item_status object	3		11	1
73	2017-09-19 09:24:48.950185-04	15	Item_status object	3		11	1
74	2017-09-19 09:24:48.957306-04	14	Item_status object	3		11	1
75	2017-09-19 09:24:48.964403-04	13	Item_status object	3		11	1
76	2017-09-19 09:24:48.970978-04	12	Item_status object	3		11	1
77	2017-09-19 09:24:48.976395-04	11	Item_status object	3		11	1
78	2017-09-19 09:24:48.977744-04	10	Item_status object	3		11	1
79	2017-09-19 09:24:48.978684-04	9	Item_status object	3		11	1
80	2017-09-19 09:25:10.632989-04	6	Item_status object	2	[{"changed": {"fields": ["borrower", "loaned_at", "due_back"]}}]	11	1
81	2017-09-19 09:25:18.187981-04	21	Item_status object	1	[{"added": {}}]	11	1
82	2017-09-19 09:26:12.815391-04	6	Item_status object	2	[{"changed": {"fields": ["borrower"]}}]	11	1
83	2017-09-19 11:09:51.20854-04	3	Item_status object	3		11	1
84	2017-09-19 11:11:14.238014-04	8	Item_status object	2	[{"changed": {"fields": ["loaned_at", "due_back"]}}]	11	1
85	2017-09-19 11:11:34.94296-04	6	Item_status object	2	[{"changed": {"fields": ["borrower"]}}]	11	1
86	2017-09-19 11:12:28.049414-04	22	Item_status object	2	[{"changed": {"fields": ["borrower"]}}]	11	1
87	2017-09-19 11:15:35.882372-04	21	Item_status object	2	[{"changed": {"fields": ["borrower"]}}]	11	1
88	2017-09-19 11:15:53.110885-04	21	Item_status object	2	[{"changed": {"fields": ["borrower"]}}]	11	1
89	2017-09-20 21:45:54.4528-04	22	?	2	[]	11	1
90	2017-09-20 21:46:00.652689-04	21	?	2	[]	11	1
91	2017-09-20 21:46:09.075104-04	4	?	2	[]	11	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: choward
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 91, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: choward
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	catalog	book
8	catalog	item
9	catalog	item_type
10	catalog	comic
11	catalog	item_status
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: choward
--

SELECT pg_catalog.setval('django_content_type_id_seq', 11, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: choward
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-09-02 14:47:04.74079-04
2	auth	0001_initial	2017-09-02 14:47:04.786573-04
3	admin	0001_initial	2017-09-02 14:47:04.804321-04
4	admin	0002_logentry_remove_auto_add	2017-09-02 14:47:04.815885-04
5	contenttypes	0002_remove_content_type_name	2017-09-02 14:47:04.833882-04
6	auth	0002_alter_permission_name_max_length	2017-09-02 14:47:04.838737-04
7	auth	0003_alter_user_email_max_length	2017-09-02 14:47:04.847609-04
8	auth	0004_alter_user_username_opts	2017-09-02 14:47:04.858593-04
9	auth	0005_alter_user_last_login_null	2017-09-02 14:47:04.866874-04
10	auth	0006_require_contenttypes_0002	2017-09-02 14:47:04.868276-04
11	auth	0007_alter_validators_add_error_messages	2017-09-02 14:47:04.877911-04
12	auth	0008_alter_user_username_max_length	2017-09-02 14:47:04.887513-04
13	catalog	0001_initial	2017-09-02 14:47:04.909838-04
14	sessions	0001_initial	2017-09-02 14:47:04.916572-04
15	catalog	0002_comic_item_status	2017-09-02 14:49:56.70745-04
16	catalog	0003_auto_20170909_0909	2017-09-09 09:09:26.621608-04
17	catalog	0004_auto_20170910_1710	2017-09-10 17:10:52.712432-04
18	catalog	0005_auto_20170911_1745	2017-09-11 17:45:37.908563-04
19	catalog	0006_auto_20170911_1830	2017-09-11 18:33:02.411654-04
20	catalog	0007_auto_20170911_2138	2017-09-11 21:38:54.410163-04
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: choward
--

SELECT pg_catalog.setval('django_migrations_id_seq', 20, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: choward
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
6yp8vauvlw1dbsgy4ujw9mjt5ukvcur9	NDk3Mjg4N2Y4NWQzMjgxY2QyZmZiY2UxNWZkZGZhMjE0NDliZTQ1Yjp7Im51bV92aXNpdHMiOjF9	2017-10-01 22:39:16.202917-04
7cpo8pg0k8fyrn21itdkdttujuit46qb	NDk3Mjg4N2Y4NWQzMjgxY2QyZmZiY2UxNWZkZGZhMjE0NDliZTQ1Yjp7Im51bV92aXNpdHMiOjF9	2017-10-01 22:39:16.337031-04
ogcfhl7ub06y7yiq80n81q1uzgh9jhop	NDk3Mjg4N2Y4NWQzMjgxY2QyZmZiY2UxNWZkZGZhMjE0NDliZTQ1Yjp7Im51bV92aXNpdHMiOjF9	2017-10-04 23:21:23.574879-04
v0m5mp6oq8d6q751di5j9w4b9ds9i72x	ZWU4Yzk4ZTY5NjkwOWU4Y2ZhODYxNzdjYjIxMTQ4M2E5MWYyZjRmYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2OThkMTIwMDhmNGU4MzMyYWU1ZWZjZjc0ZmY5NGEwZTMwOGFmZTcyIiwibnVtX3Zpc2l0cyI6Mn0=	2017-10-01 22:39:17.293362-04
\.


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: catalog_book catalog_book_pkey; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY catalog_book
    ADD CONSTRAINT catalog_book_pkey PRIMARY KEY (id);


--
-- Name: catalog_comic catalog_comic_pkey; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY catalog_comic
    ADD CONSTRAINT catalog_comic_pkey PRIMARY KEY (id);


--
-- Name: catalog_item catalog_item_pkey; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY catalog_item
    ADD CONSTRAINT catalog_item_pkey PRIMARY KEY (id);


--
-- Name: catalog_item_status catalog_item_status_pkey; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY catalog_item_status
    ADD CONSTRAINT catalog_item_status_pkey PRIMARY KEY (id);


--
-- Name: catalog_item_type catalog_item_type_pkey; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY catalog_item_type
    ADD CONSTRAINT catalog_item_type_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: catalog_book_item_id_55146ff0; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX catalog_book_item_id_55146ff0 ON catalog_book USING btree (item_id);


--
-- Name: catalog_comic_item_id_8d17c373; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX catalog_comic_item_id_8d17c373 ON catalog_comic USING btree (item_id);


--
-- Name: catalog_item_item_type_id_def278b1; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX catalog_item_item_type_id_def278b1 ON catalog_item USING btree (item_type_id);


--
-- Name: catalog_item_owned_by_id_90efa13b; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX catalog_item_owned_by_id_90efa13b ON catalog_item USING btree (owned_by_id);


--
-- Name: catalog_item_status_borrower_id_2c0a3b4f; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX catalog_item_status_borrower_id_2c0a3b4f ON catalog_item_status USING btree (borrower_id);


--
-- Name: catalog_item_status_item_id_df520653; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX catalog_item_status_item_id_df520653 ON catalog_item_status USING btree (item_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: choward
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_book catalog_book_item_id_55146ff0_fk_catalog_item_id; Type: FK CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY catalog_book
    ADD CONSTRAINT catalog_book_item_id_55146ff0_fk_catalog_item_id FOREIGN KEY (item_id) REFERENCES catalog_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_comic catalog_comic_item_id_8d17c373_fk_catalog_item_id; Type: FK CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY catalog_comic
    ADD CONSTRAINT catalog_comic_item_id_8d17c373_fk_catalog_item_id FOREIGN KEY (item_id) REFERENCES catalog_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_item catalog_item_item_type_id_def278b1_fk_catalog_item_type_id; Type: FK CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY catalog_item
    ADD CONSTRAINT catalog_item_item_type_id_def278b1_fk_catalog_item_type_id FOREIGN KEY (item_type_id) REFERENCES catalog_item_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_item catalog_item_owned_by_id_90efa13b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY catalog_item
    ADD CONSTRAINT catalog_item_owned_by_id_90efa13b_fk_auth_user_id FOREIGN KEY (owned_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_item_status catalog_item_status_borrower_id_2c0a3b4f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY catalog_item_status
    ADD CONSTRAINT catalog_item_status_borrower_id_2c0a3b4f_fk_auth_user_id FOREIGN KEY (borrower_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_item_status catalog_item_status_item_id_df520653_fk_catalog_item_id; Type: FK CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY catalog_item_status
    ADD CONSTRAINT catalog_item_status_item_id_df520653_fk_catalog_item_id FOREIGN KEY (item_id) REFERENCES catalog_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: choward
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

