--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO alpha;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO alpha;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpha
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO alpha;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO alpha;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpha
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO alpha;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO alpha;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpha
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO alpha;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO alpha;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO alpha;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpha
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO alpha;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpha
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO alpha;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO alpha;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpha
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO alpha;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO alpha;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpha
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO alpha;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO alpha;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpha
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO alpha;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO alpha;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpha
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO alpha;

--
-- Name: notes_filepost; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public.notes_filepost (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    file0 character varying(100),
    date_posted timestamp with time zone NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.notes_filepost OWNER TO alpha;

--
-- Name: notes_filepost_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

CREATE SEQUENCE public.notes_filepost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_filepost_id_seq OWNER TO alpha;

--
-- Name: notes_filepost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpha
--

ALTER SEQUENCE public.notes_filepost_id_seq OWNED BY public.notes_filepost.id;


--
-- Name: userlogin_profile; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public.userlogin_profile (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.userlogin_profile OWNER TO alpha;

--
-- Name: userlogin_profle_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

CREATE SEQUENCE public.userlogin_profle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userlogin_profle_id_seq OWNER TO alpha;

--
-- Name: userlogin_profle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpha
--

ALTER SEQUENCE public.userlogin_profle_id_seq OWNED BY public.userlogin_profile.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: notes_filepost id; Type: DEFAULT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.notes_filepost ALTER COLUMN id SET DEFAULT nextval('public.notes_filepost_id_seq'::regclass);


--
-- Name: userlogin_profile id; Type: DEFAULT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.userlogin_profile ALTER COLUMN id SET DEFAULT nextval('public.userlogin_profle_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add file post	1	add_filepost
2	Can change file post	1	change_filepost
3	Can delete file post	1	delete_filepost
4	Can view file post	1	view_filepost
5	Can add profile	2	add_profile
6	Can change profile	2	change_profile
7	Can delete profile	2	delete_profile
8	Can view profile	2	view_profile
9	Can add log entry	3	add_logentry
10	Can change log entry	3	change_logentry
11	Can delete log entry	3	delete_logentry
12	Can view log entry	3	view_logentry
13	Can add permission	4	add_permission
14	Can change permission	4	change_permission
15	Can delete permission	4	delete_permission
16	Can view permission	4	view_permission
17	Can add group	5	add_group
18	Can change group	5	change_group
19	Can delete group	5	delete_group
20	Can view group	5	view_group
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add content type	7	add_contenttype
26	Can change content type	7	change_contenttype
27	Can delete content type	7	delete_contenttype
28	Can view content type	7	view_contenttype
29	Can add session	8	add_session
30	Can change session	8	change_session
31	Can delete session	8	delete_session
32	Can view session	8	view_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$21pGmfGxa7T0UaYgs26j5O$UFlhV803otHl2xbW5ogIQxYaSepAAtXGuN/ZoDY49vM=	\N	f	alpha			alpha@beta.com	f	t	2021-10-19 18:11:15.812185+05:30
2	pbkdf2_sha256$260000$3QUM9oHTVaEDagmOvEH6YM$r1NZU4Az7Up1OWxDI+9OUzF8Pr46YcdmLTEm+JlN8gc=	2021-12-09 12:13:38.074696+05:30	f	x			xx@yy.com	f	t	2021-10-19 18:11:46.122571+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	notes	filepost
2	userlogin	profile
3	admin	logentry
4	auth	permission
5	auth	group
6	auth	user
7	contenttypes	contenttype
8	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-10-19 18:10:42.824828+05:30
2	auth	0001_initial	2021-10-19 18:10:43.088748+05:30
3	admin	0001_initial	2021-10-19 18:10:43.158991+05:30
4	admin	0002_logentry_remove_auto_add	2021-10-19 18:10:43.175922+05:30
5	admin	0003_logentry_add_action_flag_choices	2021-10-19 18:10:43.190375+05:30
6	contenttypes	0002_remove_content_type_name	2021-10-19 18:10:43.225447+05:30
7	auth	0002_alter_permission_name_max_length	2021-10-19 18:10:43.245983+05:30
8	auth	0003_alter_user_email_max_length	2021-10-19 18:10:43.265393+05:30
9	auth	0004_alter_user_username_opts	2021-10-19 18:10:43.282558+05:30
10	auth	0005_alter_user_last_login_null	2021-10-19 18:10:43.302731+05:30
11	auth	0006_require_contenttypes_0002	2021-10-19 18:10:43.310712+05:30
12	auth	0007_alter_validators_add_error_messages	2021-10-19 18:10:43.341421+05:30
13	auth	0008_alter_user_username_max_length	2021-10-19 18:10:43.37181+05:30
14	auth	0009_alter_user_last_name_max_length	2021-10-19 18:10:43.395059+05:30
15	auth	0010_alter_group_name_max_length	2021-10-19 18:10:43.413482+05:30
16	auth	0011_update_proxy_permissions	2021-10-19 18:10:43.430284+05:30
17	auth	0012_alter_user_first_name_max_length	2021-10-19 18:10:43.453288+05:30
18	sessions	0001_initial	2021-10-19 18:10:43.495053+05:30
19	userlogin	0001_initial	2021-10-19 18:10:43.537959+05:30
20	userlogin	0002_auto_20200309_2114	2021-10-19 18:10:43.598262+05:30
21	userlogin	0003_auto_20200325_0904	2021-10-19 18:10:43.617971+05:30
22	notes	0001_initial	2021-10-19 18:19:05.390467+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
7qf35k79g069rajfl74b6bbiwe0phtdc	.eJxVjDsOwjAQBe_iGlnrX4wp6TmD5fVucADZUpxUiLuTSCmgfTPz3iKmdSlx7TzHicRFaHH63TDlJ9cd0CPVe5O51WWeUO6KPGiXt0b8uh7u30FJvWy1sWiyDhpBoQ3MyqbsFDn24AlRo4PBEigTBnZA7py13_xRjxZUDiA-X9cHN1c:1mcoRB:a3SC_pdd941xV3kaWbL1lYEwQxq6aJX89aK95YeFh4E	2021-11-02 18:11:49.595571+05:30
2p26pwkx0asii6gnvg7pvp90iotke6yf	.eJxVjDsOwjAQBe_iGlnrX4wp6TmD5fVucADZUpxUiLuTSCmgfTPz3iKmdSlx7TzHicRFaHH63TDlJ9cd0CPVe5O51WWeUO6KPGiXt0b8uh7u30FJvWy1sWiyDhpBoQ3MyqbsFDn24AlRo4PBEigTBnZA7py13_xRjxZUDiA-X9cHN1c:1mvD9W:StC_iSD1pKN4li6-gLwMp42NV1DEkd2LaZKfKlfMjhc	2021-12-23 12:13:38.100467+05:30
\.


--
-- Data for Name: notes_filepost; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public.notes_filepost (id, title, file0, date_posted, author_id) FROM stdin;
1	x	filepost/formatters.py	2021-10-19 18:19:34.149388+05:30	2
2	ssss	filepost/math.mp4	2021-10-19 18:25:54.063982+05:30	2
3	sssss	filepost/math_RPieRoA.mp4	2021-10-19 18:27:57.840215+05:30	2
4	ssssss	filepost/formatters_joA71tq.py	2021-10-19 18:48:11.069317+05:30	2
5	ssssss	filepost/vindex_h2ngdJ3.py	2021-10-19 18:49:08.307513+05:30	2
6	ssssssa	filepost/constants.py	2021-10-19 18:51:14.855313+05:30	2
7	ssssssa	filepost/constants_f7XCak9.py	2021-10-19 18:52:53.49473+05:30	2
8	sdw	filepost/formatters_5KQLHaK.py	2021-10-19 18:53:54.588398+05:30	2
9	x	filepost/vindex_Ybd6Q9c.py	2021-10-19 18:54:55.739834+05:30	2
10	c	filepost/constants_aP8Mcdn.py	2021-10-19 18:58:09.426562+05:30	2
11	c	filepost/constants_0yYSzl8.py	2021-10-19 18:58:35.618103+05:30	2
12	sd	filepost/vindex_29C4HXn.py	2021-10-19 19:00:29.710756+05:30	2
13	sd	filepost/subtitleGen.py	2021-10-19 19:02:12.198617+05:30	2
14	s	filepost/vindex_XeWJXzB.py	2021-10-19 19:02:33.579196+05:30	2
15	z	filepost/math_VIT6vVW.mp4	2021-10-19 19:03:49.46757+05:30	2
16	xc	filepost/vindex_OMYr5uK.py	2021-10-19 19:04:47.547856+05:30	2
17	zz	filepost/math_MHu2EMo.mp4	2021-10-19 19:05:14.390085+05:30	2
18	zz	filepost/math_i6LgU9E.mp4	2021-10-19 19:06:36.354302+05:30	2
19	zz	filepost/math_y3HyXmO.mp4	2021-10-19 19:06:51.651377+05:30	2
20	zz	filepost/videoplayback.mp4	2021-10-19 19:12:32.668015+05:30	2
21	zz	filepost/videoplayback_cjzGZBK.mp4	2021-10-19 19:16:16.122515+05:30	2
22	xxx	filepost/videoplayback_gLryKwB.mp4	2021-10-19 20:23:49.317923+05:30	2
23	Onion	filepost/videoplayback_AfMsrOk.mp4	2021-10-20 14:40:50.805468+05:30	2
24	My first test	filepost/videoplayback_gCOXee7.mp4	2021-10-20 16:21:39.79436+05:30	2
25	My first test	filepost/videoplayback_OtB5cTB.mp4	2021-10-20 16:27:12.446771+05:30	2
26	Sample	filepost/videoplayback_9wXbmIz.mp4	2021-10-20 16:42:03.323895+05:30	2
27	sample2	filepost/videoplayback_yyW1rvy.mp4	2021-10-20 16:48:48.198629+05:30	2
28	Sample	filepost/videoplayback_8WDy9z7.mp4	2021-10-20 16:54:42.550979+05:30	2
29	run	filepost/videoplayback_BoqLHhI.mp4	2021-10-20 16:56:22.498975+05:30	2
30	Sample	filepost/How_An_Infinite_Hotel_Ran_Out_Of_Room.mp4	2021-12-09 13:00:23.003371+05:30	2
\.


--
-- Data for Name: userlogin_profile; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public.userlogin_profile (id, image, user_id) FROM stdin;
1	default.jpg	1
2	default.jpg	2
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- Name: notes_filepost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public.notes_filepost_id_seq', 30, true);


--
-- Name: userlogin_profle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public.userlogin_profle_id_seq', 2, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: notes_filepost notes_filepost_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.notes_filepost
    ADD CONSTRAINT notes_filepost_pkey PRIMARY KEY (id);


--
-- Name: userlogin_profile userlogin_profle_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.userlogin_profile
    ADD CONSTRAINT userlogin_profle_pkey PRIMARY KEY (id);


--
-- Name: userlogin_profile userlogin_profle_user_id_key; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.userlogin_profile
    ADD CONSTRAINT userlogin_profle_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: alpha
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: alpha
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: alpha
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: alpha
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: alpha
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: alpha
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: alpha
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: alpha
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: alpha
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: alpha
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: alpha
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: alpha
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: alpha
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: notes_filepost_author_id_678487fd; Type: INDEX; Schema: public; Owner: alpha
--

CREATE INDEX notes_filepost_author_id_678487fd ON public.notes_filepost USING btree (author_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notes_filepost notes_filepost_author_id_678487fd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.notes_filepost
    ADD CONSTRAINT notes_filepost_author_id_678487fd_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userlogin_profile userlogin_profle_user_id_34b1fd11_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.userlogin_profile
    ADD CONSTRAINT userlogin_profle_user_id_34b1fd11_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

