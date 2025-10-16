--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.2

-- Started on 2025-06-02 08:48:33

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
-- TOC entry 215 (class 1259 OID 142539)
-- Name: sc_department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_department (
    id integer NOT NULL,
    title text
);


ALTER TABLE public.sc_department OWNER TO postgres;

--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE sc_department; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_department IS 'кафедры';


--
-- TOC entry 216 (class 1259 OID 142544)
-- Name: sc_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sc_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sc_department_id_seq OWNER TO postgres;

--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 216
-- Name: sc_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_department_id_seq OWNED BY public.sc_department.id;


--
-- TOC entry 217 (class 1259 OID 142545)
-- Name: sc_disc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_disc (
    id integer NOT NULL,
    title text,
    shorttitle text,
    department_id integer,
    varmask text
);


ALTER TABLE public.sc_disc OWNER TO postgres;

--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE sc_disc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_disc IS 'кафедры';


--
-- TOC entry 218 (class 1259 OID 142550)
-- Name: sc_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_group (
    id integer NOT NULL,
    title text
);


ALTER TABLE public.sc_group OWNER TO postgres;

--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE sc_group; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_group IS 'преподавательский состав';


--
-- TOC entry 219 (class 1259 OID 142555)
-- Name: sc_prep; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_prep (
    id integer NOT NULL,
    fio text,
    chair text,
    degree text,
    photo text
);


ALTER TABLE public.sc_prep OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 142560)
-- Name: sc_rasp18; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_rasp18 (
    id integer NOT NULL,
    semcode integer,
    day_id integer,
    pair integer,
    kind integer,
    worktype integer,
    disc_id integer,
    timestart text,
    timeend text
);


ALTER TABLE public.sc_rasp18 OWNER TO postgres;

--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE sc_rasp18; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp18 IS 'расписание на каждый день (18 недель)';


--
-- TOC entry 221 (class 1259 OID 142565)
-- Name: sc_rasp18_days; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_rasp18_days (
    id integer NOT NULL,
    semcode integer,
    day date,
    weekday integer,
    week integer
);


ALTER TABLE public.sc_rasp18_days OWNER TO postgres;

--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE sc_rasp18_days; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp18_days IS 'недели и дни недели по датам (18 недель)';


--
-- TOC entry 222 (class 1259 OID 142568)
-- Name: sc_rasp18_days_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sc_rasp18_days_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sc_rasp18_days_id_seq OWNER TO postgres;

--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 222
-- Name: sc_rasp18_days_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp18_days_id_seq OWNED BY public.sc_rasp18_days.id;


--
-- TOC entry 223 (class 1259 OID 142569)
-- Name: sc_rasp18_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_rasp18_groups (
    id integer NOT NULL,
    rasp18_id integer,
    group_id integer,
    subgroup integer
);


ALTER TABLE public.sc_rasp18_groups OWNER TO postgres;

--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE sc_rasp18_groups; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp18_groups IS 'группы для расписания (18 недель)';


--
-- TOC entry 224 (class 1259 OID 142572)
-- Name: sc_rasp18_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sc_rasp18_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sc_rasp18_groups_id_seq OWNER TO postgres;

--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 224
-- Name: sc_rasp18_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp18_groups_id_seq OWNED BY public.sc_rasp18_groups.id;


--
-- TOC entry 225 (class 1259 OID 142573)
-- Name: sc_rasp18_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sc_rasp18_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sc_rasp18_id_seq OWNER TO postgres;

--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 225
-- Name: sc_rasp18_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp18_id_seq OWNED BY public.sc_rasp18.id;


--
-- TOC entry 226 (class 1259 OID 142574)
-- Name: sc_rasp18_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_rasp18_info (
    id integer NOT NULL,
    rasp18_id integer,
    kind integer,
    info text
);


ALTER TABLE public.sc_rasp18_info OWNER TO postgres;

--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE sc_rasp18_info; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp18_info IS 'доп. информация к занятиям для расписания (18 недель)';


--
-- TOC entry 227 (class 1259 OID 142579)
-- Name: sc_rasp18_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sc_rasp18_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sc_rasp18_info_id_seq OWNER TO postgres;

--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 227
-- Name: sc_rasp18_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp18_info_id_seq OWNED BY public.sc_rasp18_info.id;


--
-- TOC entry 228 (class 1259 OID 142580)
-- Name: sc_rasp18_move; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_rasp18_move (
    id integer NOT NULL,
    rasp18_dest_id integer,
    reason text,
    comment text,
    rasp18_src_id integer
);


ALTER TABLE public.sc_rasp18_move OWNER TO postgres;

--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE sc_rasp18_move; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp18_move IS 'информация по переносам для расписания (18 недель)';


--
-- TOC entry 229 (class 1259 OID 142585)
-- Name: sc_rasp18_move_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sc_rasp18_move_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sc_rasp18_move_id_seq OWNER TO postgres;

--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 229
-- Name: sc_rasp18_move_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp18_move_id_seq OWNED BY public.sc_rasp18_move.id;


--
-- TOC entry 230 (class 1259 OID 142586)
-- Name: sc_rasp18_preps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_rasp18_preps (
    id integer NOT NULL,
    rasp18_id integer,
    prep_id integer
);


ALTER TABLE public.sc_rasp18_preps OWNER TO postgres;

--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE sc_rasp18_preps; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp18_preps IS 'преподаватели для расписания (18 недель)';


--
-- TOC entry 231 (class 1259 OID 142589)
-- Name: sc_rasp18_preps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sc_rasp18_preps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sc_rasp18_preps_id_seq OWNER TO postgres;

--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 231
-- Name: sc_rasp18_preps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp18_preps_id_seq OWNED BY public.sc_rasp18_preps.id;


--
-- TOC entry 232 (class 1259 OID 142590)
-- Name: sc_rasp18_rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_rasp18_rooms (
    id integer NOT NULL,
    rasp18_id integer,
    room text
);


ALTER TABLE public.sc_rasp18_rooms OWNER TO postgres;

--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE sc_rasp18_rooms; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp18_rooms IS 'аудитории для расписания (18 недель)';


--
-- TOC entry 233 (class 1259 OID 142595)
-- Name: sc_rasp18_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sc_rasp18_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sc_rasp18_rooms_id_seq OWNER TO postgres;

--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 233
-- Name: sc_rasp18_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp18_rooms_id_seq OWNED BY public.sc_rasp18_rooms.id;


--
-- TOC entry 234 (class 1259 OID 142596)
-- Name: sc_rasp7; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_rasp7 (
    id integer NOT NULL,
    semcode integer,
    version integer,
    disc_id integer,
    weekday integer,
    pair integer,
    weeksarray integer[],
    weekstext text
);


ALTER TABLE public.sc_rasp7 OWNER TO postgres;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE sc_rasp7; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp7 IS 'расписание на 7 дней (универсальное)';


--
-- TOC entry 235 (class 1259 OID 142601)
-- Name: sc_rasp7_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_rasp7_groups (
    id integer NOT NULL,
    rasp7_id integer,
    group_id integer,
    subgroup integer
);


ALTER TABLE public.sc_rasp7_groups OWNER TO postgres;

--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE sc_rasp7_groups; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp7_groups IS ' группы для расписания на 7 дней';


--
-- TOC entry 236 (class 1259 OID 142604)
-- Name: sc_rasp7_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sc_rasp7_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sc_rasp7_groups_id_seq OWNER TO postgres;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 236
-- Name: sc_rasp7_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp7_groups_id_seq OWNED BY public.sc_rasp7_groups.id;


--
-- TOC entry 237 (class 1259 OID 142605)
-- Name: sc_rasp7_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sc_rasp7_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sc_rasp7_id_seq OWNER TO postgres;

--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 237
-- Name: sc_rasp7_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp7_id_seq OWNED BY public.sc_rasp7.id;


--
-- TOC entry 238 (class 1259 OID 142606)
-- Name: sc_rasp7_preps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_rasp7_preps (
    id integer NOT NULL,
    rasp7_id integer,
    prep_id integer
);


ALTER TABLE public.sc_rasp7_preps OWNER TO postgres;

--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE sc_rasp7_preps; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp7_preps IS 'преподаватели для расписания на 7 дней';


--
-- TOC entry 239 (class 1259 OID 142609)
-- Name: sc_rasp7_preps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sc_rasp7_preps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sc_rasp7_preps_id_seq OWNER TO postgres;

--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 239
-- Name: sc_rasp7_preps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp7_preps_id_seq OWNED BY public.sc_rasp7_preps.id;


--
-- TOC entry 240 (class 1259 OID 142610)
-- Name: sc_rasp7_rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_rasp7_rooms (
    id integer NOT NULL,
    rasp7_id integer,
    room text
);


ALTER TABLE public.sc_rasp7_rooms OWNER TO postgres;

--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE sc_rasp7_rooms; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp7_rooms IS 'аудитории для расписания на 7 дней';


--
-- TOC entry 241 (class 1259 OID 142615)
-- Name: sc_rasp7_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sc_rasp7_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sc_rasp7_rooms_id_seq OWNER TO postgres;

--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 241
-- Name: sc_rasp7_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp7_rooms_id_seq OWNED BY public.sc_rasp7_rooms.id;


--
-- TOC entry 242 (class 1259 OID 142616)
-- Name: sc_rasp7_version_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sc_rasp7_version_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sc_rasp7_version_seq OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 192025)
-- Name: sc_worktypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_worktypes (
    id integer NOT NULL,
    title text
);


ALTER TABLE public.sc_worktypes OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 192024)
-- Name: sc_worktypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sc_worktypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sc_worktypes_id_seq OWNER TO postgres;

--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 245
-- Name: sc_worktypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_worktypes_id_seq OWNED BY public.sc_worktypes.id;


--
-- TOC entry 243 (class 1259 OID 142617)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    first_name text,
    middle_name text,
    last_name text,
    email text,
    login text,
    add_date integer,
    subgroup integer,
    locked boolean
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 142622)
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_id_seq OWNER TO postgres;

--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 244
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- TOC entry 4712 (class 2604 OID 192178)
-- Name: sc_department id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_department ALTER COLUMN id SET DEFAULT nextval('public.sc_department_id_seq'::regclass);


--
-- TOC entry 4713 (class 2604 OID 192179)
-- Name: sc_rasp18 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18 ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp18_id_seq'::regclass);


--
-- TOC entry 4714 (class 2604 OID 192180)
-- Name: sc_rasp18_days id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_days ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp18_days_id_seq'::regclass);


--
-- TOC entry 4715 (class 2604 OID 192181)
-- Name: sc_rasp18_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_groups ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp18_groups_id_seq'::regclass);


--
-- TOC entry 4716 (class 2604 OID 192182)
-- Name: sc_rasp18_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_info ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp18_info_id_seq'::regclass);


--
-- TOC entry 4717 (class 2604 OID 192183)
-- Name: sc_rasp18_move id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_move ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp18_move_id_seq'::regclass);


--
-- TOC entry 4718 (class 2604 OID 192184)
-- Name: sc_rasp18_preps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_preps ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp18_preps_id_seq'::regclass);


--
-- TOC entry 4719 (class 2604 OID 192185)
-- Name: sc_rasp18_rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_rooms ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp18_rooms_id_seq'::regclass);


--
-- TOC entry 4720 (class 2604 OID 192186)
-- Name: sc_rasp7 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp7 ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp7_id_seq'::regclass);


--
-- TOC entry 4721 (class 2604 OID 192187)
-- Name: sc_rasp7_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp7_groups ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp7_groups_id_seq'::regclass);


--
-- TOC entry 4722 (class 2604 OID 192188)
-- Name: sc_rasp7_preps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp7_preps ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp7_preps_id_seq'::regclass);


--
-- TOC entry 4723 (class 2604 OID 192189)
-- Name: sc_rasp7_rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp7_rooms ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp7_rooms_id_seq'::regclass);


--
-- TOC entry 4725 (class 2604 OID 192190)
-- Name: sc_worktypes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_worktypes ALTER COLUMN id SET DEFAULT nextval('public.sc_worktypes_id_seq'::regclass);


--
-- TOC entry 4724 (class 2604 OID 192191)
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- TOC entry 4916 (class 0 OID 142539)
-- Dependencies: 215
-- Data for Name: sc_department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_department (id, title) FROM stdin;
1	ВЕГА
2	ВМ
3	только для ВЕГИ
4	только для ВМ
5	другая
\.


--
-- TOC entry 4918 (class 0 OID 142545)
-- Dependencies: 217
-- Data for Name: sc_disc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_disc (id, title, shorttitle, department_id, varmask) FROM stdin;
0	null	История России	5	null
1	null	Мат. анализ	2	null
2	null	Дискр. математика	2	null
3	null	Введ. в разр. ПО	1	null
4	null	Введ. в проф. деят.	1	null
5	null	Правоведение	5	null
6	null	Информатика	5	null
7	null	Мет. мат. анализа	2	null
8	null	Ин. язык	5	null
9	null	Физ-ра	5	null
10	null	Прогр. в ЗРЛ	1	null
11	null	Лин. алг. и ан. геом.	2	null
12	null	Прогр. в ЗРЛ 	1	null
13	null	Матем. анализ	2	null
14	null	Дифф. геометрия	2	null
15	null	Спец. главы ВМ	2	null
16	null	Мет. и ст. прогр.	1	null
17	null	Системы ИИ и БД	5	null
18	null	Базы данных	1	null
19	null	Алгебра и геом.	2	null
20	null	Методы мат. анализа	2	null
21	null	Алгебра и геометрия	2	null
22	null	Спецрасписание\n\n2н - для всех студентов \nВоенная подготовка\nкампус Усачева 7/1	5	null
23	null	БЖД	5	null
24	null	ТВ и МС	2	null
25	null	Опер. системы	1	null
26	null	Числ. методы	1	null
27	null	Проект. трансляторов	1	null
28	null	Анализ и проект. ИС	1	null
29	null	Радиолокац. системы	1	null
30	null	Мат. мет. механики	2	null
31	null	Функц. анализ	2	null
32	null	Спецрасписание\n\n3н - для всех студентов\nВоенная подготовка\nкампус Усачева 7/1	5	null
33	null	САПР	1	null
34	null	Мет. моделир. РЛС	1	null
35	null	Упр. разраб. ПО	1	null
36	null	Теория игр и ИО	1	null
37	null	Спецрасписание	5	null
38	null	Проект. трансл.	1	null
39	null	Системы масс. обсл.	2	null
40	null	Мет. оптимизации	2	null
41	null	Случ. процессы	2	null
42	null	НИР	1	null
43	null	Рус. язык и КР	5	null
44	null	Психол. и пед.	5	null
45	null	Русский язык и КР	5	null
46	null	Высокоур. яз. прогр.	2	null
47	null	Дискр. мат. модели	2	null
48	null	Мет. реш. задач механики	2	null
49	null	Непр. мат. модели	2	null
50	null	Осн. научных иссл.	2	null
51	null	Качество и тестир. ПО	2	null
52	null	Дизайн цифровых продуктов	1	null
53	null	Дизайн-мышление и эрг. ПО	1	null
54	null	Совр. проблемы ПМИ	4	null
55	null	Мат. модели РО	4	null
56	null	Разр. сложных систем ОИУ	1	null
57	null	Мат. модели РО	2	null
58	null	Гибкое упр. проектами	5	null
59	null	Социол. и педаг. выс. шк.	5	null
60	null	Техн. личн. роста	5	null
61	null	Соц. и пед. выс. шк.	5	null
62	null	Гикое упр. проектами	5	null
63	null	Введение в ПД	1	null
64	null	Алг. и геометрия	2	null
65	null	АПИС	1	null
66	null	Сист. анализ ПО	1	null
67	null	РЛС	1	null
68	null	Воен. подготовка	5	null
69	null	Сист. масс. обслуж.	2	null
70	null	Псих. и педагогика	5	null
71	null	ТИ и ИсО	1	null
72	null	Управл. разраб. ПО	1	null
73	null	Общие методы исслед.	1	null
74	null	Высокоур. яз. прогр.	1	null
75	null	Тестирование ПО	1	null
76	null	Мет. реш. задач мех.	2	null
77	null	Технол. практика	3	null
78	null	Технол. практика	4	null
79	null	Гибк. упр. проектами	5	null
80	null	Совр. пробл. ПМИ	4	null
81	null	Дизайн цифр. прод.	1	null
82	null	Разр. ССОИиУ	3	null
83	null	ММ расп. образов	2	null
84	null	Соц. и пед. ВШ	5	null
85	null	ДМ и эргономика	1	null
86	null	НИР	3	null
87	null	НИР	4	null
111	null	Арх. компьютеров	1	null
112	null	Прикл. программир-е	1	null
113	null	Компл. анализ	5	null
114	null	Теория алгоритмов	1	null
115	null	НИР\n\nIн с 9:00 до 13:00\nIIн c 9:00 до 17:00	1	null
116	null	5-8н Защита инф-ции	1	null
117	null	Интелл. системы	1	null
118	null	Адм. Линукс и DevOps	1	null
88	null	Иностранный язык	5	null
89	null	Мет. и ст. прогр. (доп)	1	null
90	null	Прогр. в ЗРЛ(доп)	1	null
91	null	Осн. росс. госуд.	5	null
92	null	Дискр. математика	5	null
93	null	Мет. и ст. прогр.	5	null
94	null	Мет. и ст. прогр. (доп)	5	null
95	null	Спец. главы ВМ 	2	null
96	null	Компл. анализ	2	null
97	null	Экон. культура	5	null
98	null	ТСПП	1	null
99	null	Большие данные	5	null
100	null	Философия	5	null
101	null	Большие данные 	5	null
102	null	Комп. графика	1	null
103	null	Комп. сети	1	null
104	null	Мат. мет. мех.	2	null
105	null	ОСРВ	1	null
106	null	Адм. линукс	1	null
107	null	Мет. мод. ИС	1	null
108	null	Мат. модели РО	1	null
109	null	Функ. прогр.	1	null
110	null	Прогр. пар. вычисл.	1	null
119	null	12:20-13:50\nАдм. Линукс и DevOps	1	null
120	null	Обработка РЛИ	1	null
121	null	Функц. программир-е	1	null
122	null	Прогр. пар. вычислений	5	null
123	null	Прогр. пар. вычислений	1	null
124	null	Ин. язык (1*пг)\nИн. язык (2*пг)	5	null
125	null	Мет. и ст. прогр. лк	1	null
126	null	НИР\n\n/спецрасписание	1	null
127	null	Спецрасписание\n\n/НИР	5	null
128	null	кр. 1,2н Интелл. системы	1	null
129	null	Мат. модели механики	4	null
130	null	Мат. мод. в различных ОС	4	null
131	null	Методы кодирования	4	null
132	null	Спец. методы моделир.	4	null
133	null	НИР\n\n до 17:00	1	null
134	null	\nАдм. Линукс и DevOps	1	null
135	null	Ин. язык (1*пг)Ин. язык (2*пг)	5	null
136	null	НИР/спецрасписание	1	null
137	null	Спецрасписание/НИР	5	null
138	null	Защита инф-ции	1	null
\.


--
-- TOC entry 4919 (class 0 OID 142550)
-- Dependencies: 218
-- Data for Name: sc_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_group (id, title) FROM stdin;
0	КМБО-21-24
1	КМБО-22-24
2	КМБО-23-24
3	КМБО-24-24
4	КМБО-02-23
5	КМБО-05-23
6	КМБО-02-22
7	КМБО-05-22
8	КМБО-02-21
9	КМБО-05-21
10	КММО-11-24
11	КММО-01-23
12	КММО-11-24 (Вега)
13	КММО-11-24 (ВМ)
\.


--
-- TOC entry 4920 (class 0 OID 142555)
-- Dependencies: 219
-- Data for Name: sc_prep; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_prep (id, fio, chair, degree, photo) FROM stdin;
0	Верченкова В.В.	None	None	None
1	Старостина А.В.	None	None	None
2	Хазиев Г.А.	None	None	None
3	Черноусов И.Д.	None	None	None
4	Сидоренко Т.В.	None	None	None
5	Рагимова Н.К.	None	None	None
6	Горлова К.О.	None	None	None
7	Хрычев Д.А.	None	None	None
8	Лаврова О.Ю.	None	None	None
9	Быстров Н.А.	None	None	None
10	Дроздов И.Ю.	None	None	None
11	Шульгина А.С.	None	None	None
12	Качалов С.К.	None	None	None
13	Благовещенский И.Г.	None	None	None
14	Сазонов А.И.	None	None	None
15	Смеловский Е.А.	None	None	None
16	Меретукова Б.Ш.	None	None	None
17	Ануфриев О.С.\nНовикова А.А.	None	None	None
18	Борец А.А.	None	None	None
19	Куклева А.А.\nМарченко А.К.	None	None	None
20	Канаев А.В.	None	None	None
21	Сухатерина С.Н.	None	None	None
22	Угрюмова М.В.	None	None	None
23	Критский А.В.	None	None	None
24	Дятлова Р.И.\nНовикова А.Р.	None	None	None
25	Шелепин А.Л.	None	None	None
26	Хачлаев Т.С.	None	None	None
27	Шатина А.В.	None	None	None
28	Тетерин Н.Н.	None	None	None
29	Каппушева И.Ш.	None	None	None
30	Дрейфельд И.А.	None	None	None
31	Дрейфельд Д.Э.	None	None	None
32	Артамкин И.В.	None	None	None
33	Есипов И.В.	None	None	None
34	Воловиков А.Ю.	None	None	None
35	Кодзасова Д.А.	None	None	None
36	Кочерова А.А.	None	None	None
37	Плахотина Ю.С.	None	None	None
38	Врублевский Ю.О.\nФролова О.А.	None	None	None
39	Одегов Р.А.	None	None	None
40	Пулькин И.С.	None	None	None
41	Воронов Г.Б.	None	None	None
42	Власов Е.Е.	None	None	None
43	Крыжановский Ю.М.	None	None	None
44	Волков А.В.	None	None	None
45	Рыжик Д.А.	None	None	None
46	Манаков В.Ю.	None	None	None
47	Кишкин А.М.	None	None	None
48	Плаченов А.Б.	None	None	None
49	Коновалова И.В.	None	None	None
50	Смирнов В.И.\nДрейфельд Д.Э.	None	None	None
51	Завьялов А.В.	None	None	None
52	Кирсанов А.П.	None	None	None
53	Лобузов А.А.	None	None	None
54	Патрикеева И.А.	None	None	None
55	Харламов С.Г.	None	None	None
56	Иванова Е.В.	None	None	None
57	Шихнабиева Т.Ш.	None	None	None
58	Миронов М.А.	None	None	None
59	Смирнов В.И.	None	None	None
60	Парфенов Д.В.	None	None	None
61	Эркенова Д.И.	None	None	None
62	Булычев Г.Г.	None	None	None
63	Пистун Е.Н.	None	None	None
64	Лебо И.Г.	None	None	None
65	Юссуф А.А.	None	None	None
66	Войтикова М.А.	None	None	None
67	Шпагина Е.М.	None	None	None
68	Барматова С.П.	None	None	None
69	Тарасова Н.В.	None	None	None
70	Шульгина А.С., \nЧерноусов И.Д.	None	None	None
71	Качалов С.К., \nМеретукова Б.Ш.	None	None	None
72	Ануфриев О.С.,\nНовикова А.А.\n	None	None	None
73	Качалов С.К., \nКритский А.С.	None	None	None
74	Куклева А. А.,\nМарченко А.К.\n	None	None	None
75	Дятлова Р.И.,\nНовикова А.Р.\n	None	None	None
76	Дрейфельд И.А.,\nДрейфельд Д.Э.	None	None	None
77	Черноусов И.Д., \nКодзасова Д.А.	None	None	None
78	Одегов Р.А., \nКодзасова Д.А.	None	None	None
79	Врублевский Ю.О.,\nФролова О.А.	None	None	None
80	Кирюшин В.В.	None	None	None
81	Коновалова И.В.,\nОдегов Р.А.	None	None	None
82	Волков А.В., \nСмирнов В.И., \nДрейфельд Д.Э.	None	None	None
83	Шумский К.В.	None	None	None
84	Костин С.В.	None	None	None
85	Демидова А.А.	None	None	None
86	Борец А.С.	None	None	None
87	Иванова Е.А.	None	None	None
88	Чугумбаева Н.Н.	None	None	None
89	Абрамов А.С.	None	None	None
90	Борисов Н.К.	None	None	None
91	Милонов Г.А.	None	None	None
92	Левинский Г.Д.	None	None	None
93	Шульгина А.С.\nДрейфельд Д.Э.\nСмирнов В.И.	None	None	None
94	Бредихин В.А.	None	None	None
95	Садовский П.А.	None	None	None
96	Соловьев Д.Р.	None	None	None
97	Абрамов А.С.\nЧерноусов И.Д.	None	None	None
98	Черниенко А.А.	None	None	None
99	Жуков В.А.	None	None	None
100	Зайцев А.Б.	None	None	None
\.


--
-- TOC entry 4921 (class 0 OID 142560)
-- Dependencies: 220
-- Data for Name: sc_rasp18; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp18 (id, semcode, day_id, pair, kind, worktype, disc_id, timestart, timeend) FROM stdin;
88471	242500	6620	1	0	0	0	09:00	10:30
88472	242500	6627	1	0	0	0	09:00	10:30
88473	242500	6634	1	0	0	0	09:00	10:30
88474	242500	6641	1	0	0	0	09:00	10:30
88475	242500	6648	1	0	0	0	09:00	10:30
88476	242500	6655	1	0	0	0	09:00	10:30
88477	242500	6662	1	0	0	0	09:00	10:30
88478	242500	6669	1	0	0	0	09:00	10:30
88479	242500	6676	1	0	0	0	09:00	10:30
88480	242500	6683	1	0	0	0	09:00	10:30
88481	242500	6690	1	0	0	0	09:00	10:30
88482	242500	6697	1	0	0	0	09:00	10:30
88483	242500	6704	1	0	0	0	09:00	10:30
88484	242500	6711	1	0	0	0	09:00	10:30
88485	242500	6718	1	0	0	0	09:00	10:30
88486	242500	6725	1	0	0	0	09:00	10:30
88487	242500	6620	2	0	0	1	10:40	12:10
88488	242500	6627	2	0	0	1	10:40	12:10
88489	242500	6634	2	0	0	1	10:40	12:10
88490	242500	6641	2	0	0	1	10:40	12:10
88491	242500	6648	2	0	0	1	10:40	12:10
88492	242500	6655	2	0	0	1	10:40	12:10
88493	242500	6662	2	0	0	1	10:40	12:10
88494	242500	6669	2	0	0	1	10:40	12:10
88495	242500	6676	2	0	0	1	10:40	12:10
88496	242500	6683	2	0	0	1	10:40	12:10
88497	242500	6690	2	0	0	1	10:40	12:10
88498	242500	6697	2	0	0	1	10:40	12:10
88499	242500	6704	2	0	0	1	10:40	12:10
88500	242500	6711	2	0	0	1	10:40	12:10
88501	242500	6718	2	0	0	1	10:40	12:10
88502	242500	6725	2	0	0	1	10:40	12:10
88503	242500	6620	3	0	0	2	12:40	14:10
88504	242500	6627	3	0	0	2	12:40	14:10
88505	242500	6634	3	0	0	2	12:40	14:10
88506	242500	6641	3	0	0	2	12:40	14:10
88507	242500	6648	3	0	0	2	12:40	14:10
88508	242500	6655	3	0	0	2	12:40	14:10
88509	242500	6662	3	0	0	2	12:40	14:10
88510	242500	6669	3	0	0	2	12:40	14:10
88511	242500	6676	3	0	0	2	12:40	14:10
88512	242500	6683	3	0	0	2	12:40	14:10
88513	242500	6690	3	0	0	2	12:40	14:10
88514	242500	6697	3	0	0	2	12:40	14:10
88515	242500	6704	3	0	0	2	12:40	14:10
88516	242500	6711	3	0	0	2	12:40	14:10
88517	242500	6718	3	0	0	2	12:40	14:10
88518	242500	6725	3	0	0	2	12:40	14:10
88519	242500	6620	4	0	0	3	14:20	15:50
88520	242500	6627	4	0	0	3	14:20	15:50
88521	242500	6634	4	0	0	3	14:20	15:50
88522	242500	6641	4	0	0	3	14:20	15:50
88523	242500	6648	4	0	0	3	14:20	15:50
88524	242500	6655	4	0	0	3	14:20	15:50
88525	242500	6662	4	0	0	3	14:20	15:50
88526	242500	6669	4	0	0	3	14:20	15:50
88527	242500	6676	4	0	0	3	14:20	15:50
88528	242500	6683	4	0	0	3	14:20	15:50
88529	242500	6690	4	0	0	3	14:20	15:50
88530	242500	6697	4	0	0	3	14:20	15:50
88531	242500	6704	4	0	0	3	14:20	15:50
88532	242500	6711	4	0	0	3	14:20	15:50
88533	242500	6718	4	0	0	3	14:20	15:50
88534	242500	6725	4	0	0	3	14:20	15:50
88535	242500	6627	5	0	0	4	16:20	17:50
88536	242500	6641	5	0	0	4	16:20	17:50
88537	242500	6655	5	0	0	4	16:20	17:50
88538	242500	6669	5	0	0	4	16:20	17:50
88539	242500	6683	5	0	0	4	16:20	17:50
88540	242500	6697	5	0	0	4	16:20	17:50
88541	242500	6711	5	0	0	4	16:20	17:50
88542	242500	6725	5	0	0	4	16:20	17:50
88543	242500	6628	2	0	0	5	10:40	12:10
88544	242500	6642	2	0	0	5	10:40	12:10
88545	242500	6656	2	0	0	5	10:40	12:10
88546	242500	6670	2	0	0	5	10:40	12:10
88547	242500	6684	2	0	0	5	10:40	12:10
88548	242500	6698	2	0	0	5	10:40	12:10
88549	242500	6712	2	0	0	5	10:40	12:10
88550	242500	6726	2	0	0	5	10:40	12:10
88551	242500	6621	3	0	0	6	12:40	14:10
88552	242500	6628	3	0	0	6	12:40	14:10
88553	242500	6635	3	0	0	6	12:40	14:10
88554	242500	6642	3	0	0	6	12:40	14:10
88555	242500	6649	3	0	0	6	12:40	14:10
88556	242500	6656	3	0	0	6	12:40	14:10
88557	242500	6663	3	0	0	6	12:40	14:10
88558	242500	6670	3	0	0	6	12:40	14:10
88559	242500	6677	3	0	0	6	12:40	14:10
88560	242500	6684	3	0	0	6	12:40	14:10
88561	242500	6691	3	0	0	6	12:40	14:10
88562	242500	6698	3	0	0	6	12:40	14:10
88563	242500	6705	3	0	0	6	12:40	14:10
88564	242500	6712	3	0	0	6	12:40	14:10
88565	242500	6719	3	0	0	6	12:40	14:10
88566	242500	6726	3	0	0	6	12:40	14:10
88567	242500	6621	4	0	0	6	14:20	15:50
88568	242500	6628	4	0	0	6	14:20	15:50
88569	242500	6635	4	0	0	6	14:20	15:50
88570	242500	6642	4	0	0	6	14:20	15:50
88571	242500	6649	4	0	0	6	14:20	15:50
88572	242500	6656	4	0	0	6	14:20	15:50
88573	242500	6663	4	0	0	6	14:20	15:50
88574	242500	6670	4	0	0	6	14:20	15:50
88575	242500	6677	4	0	0	6	14:20	15:50
88576	242500	6684	4	0	0	6	14:20	15:50
88577	242500	6691	4	0	0	6	14:20	15:50
88578	242500	6698	4	0	0	6	14:20	15:50
88579	242500	6705	4	0	0	6	14:20	15:50
88580	242500	6712	4	0	0	6	14:20	15:50
88581	242500	6719	4	0	0	6	14:20	15:50
88582	242500	6726	4	0	0	6	14:20	15:50
88583	242500	6621	5	0	0	7	16:20	17:50
88584	242500	6628	5	0	0	7	16:20	17:50
88585	242500	6635	5	0	0	7	16:20	17:50
88586	242500	6642	5	0	0	7	16:20	17:50
88587	242500	6649	5	0	0	7	16:20	17:50
88588	242500	6656	5	0	0	7	16:20	17:50
88589	242500	6663	5	0	0	7	16:20	17:50
88590	242500	6670	5	0	0	7	16:20	17:50
88591	242500	6677	5	0	0	7	16:20	17:50
88592	242500	6684	5	0	0	7	16:20	17:50
88593	242500	6691	5	0	0	7	16:20	17:50
88594	242500	6698	5	0	0	7	16:20	17:50
88595	242500	6705	5	0	0	7	16:20	17:50
88596	242500	6712	5	0	0	7	16:20	17:50
88597	242500	6719	5	0	0	7	16:20	17:50
88598	242500	6726	5	0	0	7	16:20	17:50
88599	242500	6622	1	0	1	1	09:00	10:30
88600	242500	6629	1	0	1	1	09:00	10:30
88601	242500	6636	1	0	1	1	09:00	10:30
88602	242500	6643	1	0	1	1	09:00	10:30
88603	242500	6650	1	0	1	1	09:00	10:30
88604	242500	6657	1	0	1	1	09:00	10:30
88605	242500	6664	1	0	1	1	09:00	10:30
88606	242500	6671	1	0	1	1	09:00	10:30
88607	242500	6678	1	0	1	1	09:00	10:30
88608	242500	6685	1	0	1	1	09:00	10:30
88609	242500	6692	1	0	1	1	09:00	10:30
88610	242500	6699	1	0	1	1	09:00	10:30
88611	242500	6706	1	0	1	1	09:00	10:30
88612	242500	6713	1	0	1	1	09:00	10:30
88613	242500	6720	1	0	1	1	09:00	10:30
88614	242500	6727	1	0	1	1	09:00	10:30
88615	242500	6622	2	0	1	7	10:40	12:10
88616	242500	6629	2	0	1	7	10:40	12:10
88617	242500	6636	2	0	1	7	10:40	12:10
88618	242500	6643	2	0	1	7	10:40	12:10
88619	242500	6650	2	0	1	7	10:40	12:10
88620	242500	6657	2	0	1	7	10:40	12:10
88621	242500	6664	2	0	1	7	10:40	12:10
88622	242500	6671	2	0	1	7	10:40	12:10
88623	242500	6678	2	0	1	7	10:40	12:10
88624	242500	6685	2	0	1	7	10:40	12:10
88625	242500	6692	2	0	1	7	10:40	12:10
88626	242500	6699	2	0	1	7	10:40	12:10
88627	242500	6706	2	0	1	7	10:40	12:10
88628	242500	6713	2	0	1	7	10:40	12:10
88629	242500	6720	2	0	1	7	10:40	12:10
88630	242500	6727	2	0	1	7	10:40	12:10
88631	242500	6622	3	0	0	8	12:40	14:10
88632	242500	6629	3	0	0	8	12:40	14:10
88633	242500	6636	3	0	0	8	12:40	14:10
88634	242500	6643	3	0	0	8	12:40	14:10
88635	242500	6650	3	0	0	8	12:40	14:10
88636	242500	6657	3	0	0	8	12:40	14:10
88637	242500	6664	3	0	0	8	12:40	14:10
88638	242500	6671	3	0	0	8	12:40	14:10
88639	242500	6678	3	0	0	8	12:40	14:10
88640	242500	6685	3	0	0	8	12:40	14:10
88641	242500	6692	3	0	0	8	12:40	14:10
88642	242500	6699	3	0	0	8	12:40	14:10
88643	242500	6706	3	0	0	8	12:40	14:10
88644	242500	6713	3	0	0	8	12:40	14:10
88645	242500	6720	3	0	0	8	12:40	14:10
88646	242500	6727	3	0	0	8	12:40	14:10
88647	242500	6623	1	0	1	2	09:00	10:30
88648	242500	6630	1	0	1	2	09:00	10:30
88649	242500	6637	1	0	1	2	09:00	10:30
88650	242500	6644	1	0	1	2	09:00	10:30
88651	242500	6651	1	0	1	2	09:00	10:30
88652	242500	6658	1	0	1	2	09:00	10:30
88653	242500	6665	1	0	1	2	09:00	10:30
88654	242500	6672	1	0	1	2	09:00	10:30
88655	242500	6679	1	0	1	2	09:00	10:30
88656	242500	6686	1	0	1	2	09:00	10:30
88657	242500	6693	1	0	1	2	09:00	10:30
88658	242500	6700	1	0	1	2	09:00	10:30
88659	242500	6707	1	0	1	2	09:00	10:30
88660	242500	6714	1	0	1	2	09:00	10:30
88661	242500	6721	1	0	1	2	09:00	10:30
88662	242500	6728	1	0	1	2	09:00	10:30
88663	242500	6623	2	0	1	3	10:40	12:10
88664	242500	6637	2	0	1	3	10:40	12:10
88665	242500	6651	2	0	1	3	10:40	12:10
88666	242500	6665	2	0	1	3	10:40	12:10
88667	242500	6679	2	0	1	3	10:40	12:10
88668	242500	6693	2	0	1	3	10:40	12:10
88669	242500	6707	2	0	1	3	10:40	12:10
88670	242500	6721	2	0	1	3	10:40	12:10
88671	242500	6623	3	0	0	9	12:40	14:10
88672	242500	6630	3	0	0	9	12:40	14:10
88673	242500	6637	3	0	0	9	12:40	14:10
88674	242500	6644	3	0	0	9	12:40	14:10
88675	242500	6651	3	0	0	9	12:40	14:10
88676	242500	6658	3	0	0	9	12:40	14:10
88677	242500	6665	3	0	0	9	12:40	14:10
88678	242500	6672	3	0	0	9	12:40	14:10
88679	242500	6679	3	0	0	9	12:40	14:10
88680	242500	6686	3	0	0	9	12:40	14:10
88681	242500	6693	3	0	0	9	12:40	14:10
88682	242500	6700	3	0	0	9	12:40	14:10
88683	242500	6707	3	0	0	9	12:40	14:10
88684	242500	6714	3	0	0	9	12:40	14:10
88685	242500	6721	3	0	0	9	12:40	14:10
88686	242500	6728	3	0	0	9	12:40	14:10
88687	242500	6623	4	0	0	3	14:20	15:50
88688	242500	6630	4	0	0	3	14:20	15:50
88689	242500	6637	4	0	0	3	14:20	15:50
88690	242500	6644	4	0	0	3	14:20	15:50
88691	242500	6651	4	0	0	3	14:20	15:50
88692	242500	6658	4	0	0	3	14:20	15:50
88693	242500	6665	4	0	0	3	14:20	15:50
88694	242500	6672	4	0	0	3	14:20	15:50
88695	242500	6679	4	0	0	3	14:20	15:50
88696	242500	6686	4	0	0	3	14:20	15:50
88697	242500	6693	4	0	0	3	14:20	15:50
88698	242500	6700	4	0	0	3	14:20	15:50
88699	242500	6707	4	0	0	3	14:20	15:50
88700	242500	6714	4	0	0	3	14:20	15:50
88701	242500	6721	4	0	0	3	14:20	15:50
88702	242500	6728	4	0	0	3	14:20	15:50
88703	242500	6624	1	0	1	10	09:00	10:30
88704	242500	6638	1	0	1	10	09:00	10:30
88705	242500	6652	1	0	1	10	09:00	10:30
88706	242500	6666	1	0	1	10	09:00	10:30
88707	242500	6680	1	0	1	10	09:00	10:30
88708	242500	6694	1	0	1	10	09:00	10:30
88709	242500	6708	1	0	1	10	09:00	10:30
88710	242500	6722	1	0	1	10	09:00	10:30
88711	242500	6631	1	0	1	6	09:00	10:30
88712	242500	6645	1	0	1	6	09:00	10:30
88713	242500	6659	1	0	1	6	09:00	10:30
88714	242500	6673	1	0	1	6	09:00	10:30
88715	242500	6687	1	0	1	6	09:00	10:30
88716	242500	6701	1	0	1	6	09:00	10:30
88717	242500	6715	1	0	1	6	09:00	10:30
88718	242500	6729	1	0	1	6	09:00	10:30
88719	242500	6624	2	0	0	10	10:40	12:10
88720	242500	6638	2	0	0	10	10:40	12:10
88721	242500	6652	2	0	0	10	10:40	12:10
88722	242500	6666	2	0	0	10	10:40	12:10
88723	242500	6680	2	0	0	10	10:40	12:10
88724	242500	6694	2	0	0	10	10:40	12:10
88725	242500	6708	2	0	0	10	10:40	12:10
88726	242500	6722	2	0	0	10	10:40	12:10
88727	242500	6624	3	0	0	11	12:40	14:10
88728	242500	6631	3	0	0	11	12:40	14:10
88729	242500	6638	3	0	0	11	12:40	14:10
88730	242500	6645	3	0	0	11	12:40	14:10
88731	242500	6652	3	0	0	11	12:40	14:10
88732	242500	6659	3	0	0	11	12:40	14:10
88733	242500	6666	3	0	0	11	12:40	14:10
88734	242500	6673	3	0	0	11	12:40	14:10
88735	242500	6680	3	0	0	11	12:40	14:10
88736	242500	6687	3	0	0	11	12:40	14:10
88737	242500	6694	3	0	0	11	12:40	14:10
88738	242500	6701	3	0	0	11	12:40	14:10
88739	242500	6708	3	0	0	11	12:40	14:10
88740	242500	6715	3	0	0	11	12:40	14:10
88741	242500	6722	3	0	0	11	12:40	14:10
88742	242500	6729	3	0	0	11	12:40	14:10
88743	242500	6624	4	0	1	11	14:20	15:50
88744	242500	6631	4	0	1	11	14:20	15:50
88745	242500	6638	4	0	1	11	14:20	15:50
88746	242500	6645	4	0	1	11	14:20	15:50
88747	242500	6652	4	0	1	11	14:20	15:50
88748	242500	6659	4	0	1	11	14:20	15:50
88749	242500	6666	4	0	1	11	14:20	15:50
88750	242500	6673	4	0	1	11	14:20	15:50
88751	242500	6680	4	0	1	11	14:20	15:50
88752	242500	6687	4	0	1	11	14:20	15:50
88753	242500	6694	4	0	1	11	14:20	15:50
88754	242500	6701	4	0	1	11	14:20	15:50
88755	242500	6708	4	0	1	11	14:20	15:50
88756	242500	6715	4	0	1	11	14:20	15:50
88757	242500	6722	4	0	1	11	14:20	15:50
88758	242500	6729	4	0	1	11	14:20	15:50
88759	242500	6624	5	0	1	0	16:20	17:50
88760	242500	6631	5	0	1	0	16:20	17:50
88761	242500	6638	5	0	1	0	16:20	17:50
88762	242500	6645	5	0	1	0	16:20	17:50
88763	242500	6652	5	0	1	0	16:20	17:50
88764	242500	6659	5	0	1	0	16:20	17:50
88765	242500	6666	5	0	1	0	16:20	17:50
88766	242500	6673	5	0	1	0	16:20	17:50
88767	242500	6680	5	0	1	0	16:20	17:50
88768	242500	6687	5	0	1	0	16:20	17:50
88769	242500	6694	5	0	1	0	16:20	17:50
88770	242500	6701	5	0	1	0	16:20	17:50
88771	242500	6708	5	0	1	0	16:20	17:50
88772	242500	6715	5	0	1	0	16:20	17:50
88773	242500	6722	5	0	1	0	16:20	17:50
88774	242500	6729	5	0	1	0	16:20	17:50
88775	242500	6625	1	0	0	10	09:00	10:30
88776	242500	6639	1	0	0	10	09:00	10:30
88777	242500	6653	1	0	0	10	09:00	10:30
88778	242500	6667	1	0	0	10	09:00	10:30
88779	242500	6681	1	0	0	10	09:00	10:30
88780	242500	6695	1	0	0	10	09:00	10:30
88781	242500	6709	1	0	0	10	09:00	10:30
88782	242500	6723	1	0	0	10	09:00	10:30
88783	242500	6625	6	0	1	5	18:00	19:30
88784	242500	6639	6	0	1	5	18:00	19:30
88785	242500	6653	6	0	1	5	18:00	19:30
88786	242500	6667	6	0	1	5	18:00	19:30
88787	242500	6681	6	0	1	5	18:00	19:30
88788	242500	6695	6	0	1	5	18:00	19:30
88789	242500	6709	6	0	1	5	18:00	19:30
88790	242500	6723	6	0	1	5	18:00	19:30
88791	242500	6627	1	0	0	8	09:00	10:30
88792	242500	6641	1	0	0	8	09:00	10:30
88793	242500	6655	1	0	0	8	09:00	10:30
88794	242500	6669	1	0	0	8	09:00	10:30
88795	242500	6683	1	0	0	8	09:00	10:30
88796	242500	6697	1	0	0	8	09:00	10:30
88797	242500	6711	1	0	0	8	09:00	10:30
88798	242500	6725	1	0	0	8	09:00	10:30
88799	242500	6627	2	0	0	8	10:40	12:10
88800	242500	6641	2	0	0	8	10:40	12:10
88801	242500	6655	2	0	0	8	10:40	12:10
88802	242500	6669	2	0	0	8	10:40	12:10
88803	242500	6683	2	0	0	8	10:40	12:10
88804	242500	6697	2	0	0	8	10:40	12:10
88805	242500	6711	2	0	0	8	10:40	12:10
88806	242500	6725	2	0	0	8	10:40	12:10
88807	242500	6620	3	0	0	1	12:40	14:10
88808	242500	6627	3	0	0	1	12:40	14:10
88809	242500	6634	3	0	0	1	12:40	14:10
88810	242500	6641	3	0	0	1	12:40	14:10
88811	242500	6648	3	0	0	1	12:40	14:10
88812	242500	6655	3	0	0	1	12:40	14:10
88813	242500	6662	3	0	0	1	12:40	14:10
88814	242500	6669	3	0	0	1	12:40	14:10
88815	242500	6676	3	0	0	1	12:40	14:10
88816	242500	6683	3	0	0	1	12:40	14:10
88817	242500	6690	3	0	0	1	12:40	14:10
88818	242500	6697	3	0	0	1	12:40	14:10
88819	242500	6704	3	0	0	1	12:40	14:10
88820	242500	6711	3	0	0	1	12:40	14:10
88821	242500	6718	3	0	0	1	12:40	14:10
88822	242500	6725	3	0	0	1	12:40	14:10
88823	242500	6620	4	0	0	0	14:20	15:50
88824	242500	6627	4	0	0	0	14:20	15:50
88825	242500	6634	4	0	0	0	14:20	15:50
88826	242500	6641	4	0	0	0	14:20	15:50
88827	242500	6648	4	0	0	0	14:20	15:50
88828	242500	6655	4	0	0	0	14:20	15:50
88829	242500	6662	4	0	0	0	14:20	15:50
88830	242500	6669	4	0	0	0	14:20	15:50
88831	242500	6676	4	0	0	0	14:20	15:50
88832	242500	6683	4	0	0	0	14:20	15:50
88833	242500	6690	4	0	0	0	14:20	15:50
88834	242500	6697	4	0	0	0	14:20	15:50
88835	242500	6704	4	0	0	0	14:20	15:50
88836	242500	6711	4	0	0	0	14:20	15:50
88837	242500	6718	4	0	0	0	14:20	15:50
88838	242500	6725	4	0	0	0	14:20	15:50
88839	242500	6627	5	0	0	4	16:20	17:50
88840	242500	6641	5	0	0	4	16:20	17:50
88841	242500	6655	5	0	0	4	16:20	17:50
88842	242500	6669	5	0	0	4	16:20	17:50
88843	242500	6683	5	0	0	4	16:20	17:50
88844	242500	6697	5	0	0	4	16:20	17:50
88845	242500	6711	5	0	0	4	16:20	17:50
88846	242500	6725	5	0	0	4	16:20	17:50
88847	242500	6620	6	0	0	3	18:00	19:30
88848	242500	6627	6	0	0	3	18:00	19:30
88849	242500	6634	6	0	0	3	18:00	19:30
88850	242500	6641	6	0	0	3	18:00	19:30
88851	242500	6648	6	0	0	3	18:00	19:30
88852	242500	6655	6	0	0	3	18:00	19:30
88853	242500	6662	6	0	0	3	18:00	19:30
88854	242500	6669	6	0	0	3	18:00	19:30
88855	242500	6676	6	0	0	3	18:00	19:30
88856	242500	6683	6	0	0	3	18:00	19:30
88857	242500	6690	6	0	0	3	18:00	19:30
88858	242500	6697	6	0	0	3	18:00	19:30
88859	242500	6704	6	0	0	3	18:00	19:30
88860	242500	6711	6	0	0	3	18:00	19:30
88861	242500	6718	6	0	0	3	18:00	19:30
88862	242500	6725	6	0	0	3	18:00	19:30
88863	242500	6628	3	0	0	5	12:40	14:10
88864	242500	6642	3	0	0	5	12:40	14:10
88865	242500	6656	3	0	0	5	12:40	14:10
88866	242500	6670	3	0	0	5	12:40	14:10
88867	242500	6684	3	0	0	5	12:40	14:10
88868	242500	6698	3	0	0	5	12:40	14:10
88869	242500	6712	3	0	0	5	12:40	14:10
88870	242500	6726	3	0	0	5	12:40	14:10
88871	242500	6621	4	0	0	11	14:20	15:50
88872	242500	6628	4	0	0	11	14:20	15:50
88873	242500	6635	4	0	0	11	14:20	15:50
88874	242500	6642	4	0	0	11	14:20	15:50
88875	242500	6649	4	0	0	11	14:20	15:50
88876	242500	6656	4	0	0	11	14:20	15:50
88877	242500	6663	4	0	0	11	14:20	15:50
88878	242500	6670	4	0	0	11	14:20	15:50
88879	242500	6677	4	0	0	11	14:20	15:50
88880	242500	6684	4	0	0	11	14:20	15:50
88881	242500	6691	4	0	0	11	14:20	15:50
88882	242500	6698	4	0	0	11	14:20	15:50
88883	242500	6705	4	0	0	11	14:20	15:50
88884	242500	6712	4	0	0	11	14:20	15:50
88885	242500	6719	4	0	0	11	14:20	15:50
88886	242500	6726	4	0	0	11	14:20	15:50
88887	242500	6621	5	0	0	9	16:20	17:50
88888	242500	6628	5	0	0	9	16:20	17:50
88889	242500	6635	5	0	0	9	16:20	17:50
88890	242500	6642	5	0	0	9	16:20	17:50
88891	242500	6649	5	0	0	9	16:20	17:50
88892	242500	6656	5	0	0	9	16:20	17:50
88893	242500	6663	5	0	0	9	16:20	17:50
88894	242500	6670	5	0	0	9	16:20	17:50
88895	242500	6677	5	0	0	9	16:20	17:50
88896	242500	6684	5	0	0	9	16:20	17:50
88897	242500	6691	5	0	0	9	16:20	17:50
88898	242500	6698	5	0	0	9	16:20	17:50
88899	242500	6705	5	0	0	9	16:20	17:50
88900	242500	6712	5	0	0	9	16:20	17:50
88901	242500	6719	5	0	0	9	16:20	17:50
88902	242500	6726	5	0	0	9	16:20	17:50
88903	242500	6621	6	0	0	7	18:00	19:30
88904	242500	6628	6	0	0	7	18:00	19:30
88905	242500	6635	6	0	0	7	18:00	19:30
88906	242500	6642	6	0	0	7	18:00	19:30
88907	242500	6649	6	0	0	7	18:00	19:30
88908	242500	6656	6	0	0	7	18:00	19:30
88909	242500	6663	6	0	0	7	18:00	19:30
88910	242500	6670	6	0	0	7	18:00	19:30
88911	242500	6677	6	0	0	7	18:00	19:30
88912	242500	6684	6	0	0	7	18:00	19:30
88913	242500	6691	6	0	0	7	18:00	19:30
88914	242500	6698	6	0	0	7	18:00	19:30
88915	242500	6705	6	0	0	7	18:00	19:30
88916	242500	6712	6	0	0	7	18:00	19:30
88917	242500	6719	6	0	0	7	18:00	19:30
88918	242500	6726	6	0	0	7	18:00	19:30
88919	242500	6622	1	0	1	1	09:00	10:30
88920	242500	6629	1	0	1	1	09:00	10:30
88921	242500	6636	1	0	1	1	09:00	10:30
88922	242500	6643	1	0	1	1	09:00	10:30
88923	242500	6650	1	0	1	1	09:00	10:30
88924	242500	6657	1	0	1	1	09:00	10:30
88925	242500	6664	1	0	1	1	09:00	10:30
88926	242500	6671	1	0	1	1	09:00	10:30
88927	242500	6678	1	0	1	1	09:00	10:30
88928	242500	6685	1	0	1	1	09:00	10:30
88929	242500	6692	1	0	1	1	09:00	10:30
88930	242500	6699	1	0	1	1	09:00	10:30
88931	242500	6706	1	0	1	1	09:00	10:30
88932	242500	6713	1	0	1	1	09:00	10:30
88933	242500	6720	1	0	1	1	09:00	10:30
88934	242500	6727	1	0	1	1	09:00	10:30
88935	242500	6622	2	0	1	7	10:40	12:10
88936	242500	6629	2	0	1	7	10:40	12:10
88937	242500	6636	2	0	1	7	10:40	12:10
88938	242500	6643	2	0	1	7	10:40	12:10
88939	242500	6650	2	0	1	7	10:40	12:10
88940	242500	6657	2	0	1	7	10:40	12:10
88941	242500	6664	2	0	1	7	10:40	12:10
88942	242500	6671	2	0	1	7	10:40	12:10
88943	242500	6678	2	0	1	7	10:40	12:10
88944	242500	6685	2	0	1	7	10:40	12:10
88945	242500	6692	2	0	1	7	10:40	12:10
88946	242500	6699	2	0	1	7	10:40	12:10
88947	242500	6706	2	0	1	7	10:40	12:10
88948	242500	6713	2	0	1	7	10:40	12:10
88949	242500	6720	2	0	1	7	10:40	12:10
88950	242500	6727	2	0	1	7	10:40	12:10
88951	242500	6622	3	0	0	6	12:40	14:10
88952	242500	6629	3	0	0	6	12:40	14:10
88953	242500	6636	3	0	0	6	12:40	14:10
88954	242500	6643	3	0	0	6	12:40	14:10
88955	242500	6650	3	0	0	6	12:40	14:10
88956	242500	6657	3	0	0	6	12:40	14:10
88957	242500	6664	3	0	0	6	12:40	14:10
88958	242500	6671	3	0	0	6	12:40	14:10
88959	242500	6678	3	0	0	6	12:40	14:10
88960	242500	6685	3	0	0	6	12:40	14:10
88961	242500	6692	3	0	0	6	12:40	14:10
88962	242500	6699	3	0	0	6	12:40	14:10
88963	242500	6706	3	0	0	6	12:40	14:10
88964	242500	6713	3	0	0	6	12:40	14:10
88965	242500	6720	3	0	0	6	12:40	14:10
88966	242500	6727	3	0	0	6	12:40	14:10
88967	242500	6622	4	0	0	6	14:20	15:50
88968	242500	6629	4	0	0	6	14:20	15:50
88969	242500	6636	4	0	0	6	14:20	15:50
88970	242500	6643	4	0	0	6	14:20	15:50
88971	242500	6650	4	0	0	6	14:20	15:50
88972	242500	6657	4	0	0	6	14:20	15:50
88973	242500	6664	4	0	0	6	14:20	15:50
88974	242500	6671	4	0	0	6	14:20	15:50
88975	242500	6678	4	0	0	6	14:20	15:50
88976	242500	6685	4	0	0	6	14:20	15:50
88977	242500	6692	4	0	0	6	14:20	15:50
88978	242500	6699	4	0	0	6	14:20	15:50
88979	242500	6706	4	0	0	6	14:20	15:50
88980	242500	6713	4	0	0	6	14:20	15:50
88981	242500	6720	4	0	0	6	14:20	15:50
88982	242500	6727	4	0	0	6	14:20	15:50
88983	242500	6623	1	0	1	2	09:00	10:30
88984	242500	6630	1	0	1	2	09:00	10:30
88985	242500	6637	1	0	1	2	09:00	10:30
88986	242500	6644	1	0	1	2	09:00	10:30
88987	242500	6651	1	0	1	2	09:00	10:30
88988	242500	6658	1	0	1	2	09:00	10:30
88989	242500	6665	1	0	1	2	09:00	10:30
88990	242500	6672	1	0	1	2	09:00	10:30
88991	242500	6679	1	0	1	2	09:00	10:30
88992	242500	6686	1	0	1	2	09:00	10:30
88993	242500	6693	1	0	1	2	09:00	10:30
88994	242500	6700	1	0	1	2	09:00	10:30
88995	242500	6707	1	0	1	2	09:00	10:30
88996	242500	6714	1	0	1	2	09:00	10:30
88997	242500	6721	1	0	1	2	09:00	10:30
88998	242500	6728	1	0	1	2	09:00	10:30
88999	242500	6623	2	0	1	3	10:40	12:10
89000	242500	6637	2	0	1	3	10:40	12:10
89001	242500	6651	2	0	1	3	10:40	12:10
89002	242500	6665	2	0	1	3	10:40	12:10
89003	242500	6679	2	0	1	3	10:40	12:10
89004	242500	6693	2	0	1	3	10:40	12:10
89005	242500	6707	2	0	1	3	10:40	12:10
89006	242500	6721	2	0	1	3	10:40	12:10
89007	242500	6623	3	0	0	3	12:40	14:10
89008	242500	6630	3	0	0	3	12:40	14:10
89009	242500	6637	3	0	0	3	12:40	14:10
89010	242500	6644	3	0	0	3	12:40	14:10
89011	242500	6651	3	0	0	3	12:40	14:10
89012	242500	6658	3	0	0	3	12:40	14:10
89013	242500	6665	3	0	0	3	12:40	14:10
89014	242500	6672	3	0	0	3	12:40	14:10
89015	242500	6679	3	0	0	3	12:40	14:10
89016	242500	6686	3	0	0	3	12:40	14:10
89017	242500	6693	3	0	0	3	12:40	14:10
89018	242500	6700	3	0	0	3	12:40	14:10
89019	242500	6707	3	0	0	3	12:40	14:10
89020	242500	6714	3	0	0	3	12:40	14:10
89021	242500	6721	3	0	0	3	12:40	14:10
89022	242500	6728	3	0	0	3	12:40	14:10
89023	242500	6624	1	0	1	12	09:00	10:30
89024	242500	6638	1	0	1	12	09:00	10:30
89025	242500	6652	1	0	1	12	09:00	10:30
89026	242500	6666	1	0	1	12	09:00	10:30
89027	242500	6680	1	0	1	12	09:00	10:30
89028	242500	6694	1	0	1	12	09:00	10:30
89029	242500	6708	1	0	1	12	09:00	10:30
89030	242500	6722	1	0	1	12	09:00	10:30
89031	242500	6631	1	0	1	6	09:00	10:30
89032	242500	6645	1	0	1	6	09:00	10:30
89033	242500	6659	1	0	1	6	09:00	10:30
89034	242500	6673	1	0	1	6	09:00	10:30
89035	242500	6687	1	0	1	6	09:00	10:30
89036	242500	6701	1	0	1	6	09:00	10:30
89037	242500	6715	1	0	1	6	09:00	10:30
89038	242500	6729	1	0	1	6	09:00	10:30
89039	242500	6631	2	0	0	10	10:40	12:10
89040	242500	6645	2	0	0	10	10:40	12:10
89041	242500	6659	2	0	0	10	10:40	12:10
89042	242500	6673	2	0	0	10	10:40	12:10
89043	242500	6687	2	0	0	10	10:40	12:10
89044	242500	6701	2	0	0	10	10:40	12:10
89045	242500	6715	2	0	0	10	10:40	12:10
89046	242500	6729	2	0	0	10	10:40	12:10
89047	242500	6624	3	0	0	2	12:40	14:10
89048	242500	6631	3	0	0	2	12:40	14:10
89049	242500	6638	3	0	0	2	12:40	14:10
89050	242500	6645	3	0	0	2	12:40	14:10
89051	242500	6652	3	0	0	2	12:40	14:10
89052	242500	6659	3	0	0	2	12:40	14:10
89053	242500	6666	3	0	0	2	12:40	14:10
89054	242500	6673	3	0	0	2	12:40	14:10
89055	242500	6680	3	0	0	2	12:40	14:10
89056	242500	6687	3	0	0	2	12:40	14:10
89057	242500	6694	3	0	0	2	12:40	14:10
89058	242500	6701	3	0	0	2	12:40	14:10
89059	242500	6708	3	0	0	2	12:40	14:10
89060	242500	6715	3	0	0	2	12:40	14:10
89061	242500	6722	3	0	0	2	12:40	14:10
89062	242500	6729	3	0	0	2	12:40	14:10
89063	242500	6624	4	0	1	11	14:20	15:50
89064	242500	6631	4	0	1	11	14:20	15:50
89065	242500	6638	4	0	1	11	14:20	15:50
89066	242500	6645	4	0	1	11	14:20	15:50
89067	242500	6652	4	0	1	11	14:20	15:50
89068	242500	6659	4	0	1	11	14:20	15:50
89069	242500	6666	4	0	1	11	14:20	15:50
89070	242500	6673	4	0	1	11	14:20	15:50
89071	242500	6680	4	0	1	11	14:20	15:50
89072	242500	6687	4	0	1	11	14:20	15:50
89073	242500	6694	4	0	1	11	14:20	15:50
89074	242500	6701	4	0	1	11	14:20	15:50
89075	242500	6708	4	0	1	11	14:20	15:50
89076	242500	6715	4	0	1	11	14:20	15:50
89077	242500	6722	4	0	1	11	14:20	15:50
89078	242500	6729	4	0	1	11	14:20	15:50
89079	242500	6624	5	0	1	0	16:20	17:50
89080	242500	6631	5	0	1	0	16:20	17:50
89081	242500	6638	5	0	1	0	16:20	17:50
89082	242500	6645	5	0	1	0	16:20	17:50
89083	242500	6652	5	0	1	0	16:20	17:50
89084	242500	6659	5	0	1	0	16:20	17:50
89085	242500	6666	5	0	1	0	16:20	17:50
89086	242500	6673	5	0	1	0	16:20	17:50
89087	242500	6680	5	0	1	0	16:20	17:50
89088	242500	6687	5	0	1	0	16:20	17:50
89089	242500	6694	5	0	1	0	16:20	17:50
89090	242500	6701	5	0	1	0	16:20	17:50
89091	242500	6708	5	0	1	0	16:20	17:50
89092	242500	6715	5	0	1	0	16:20	17:50
89093	242500	6722	5	0	1	0	16:20	17:50
89094	242500	6729	5	0	1	0	16:20	17:50
89095	242500	6625	2	0	0	12	10:40	12:10
89096	242500	6639	2	0	0	12	10:40	12:10
89097	242500	6653	2	0	0	12	10:40	12:10
89098	242500	6667	2	0	0	12	10:40	12:10
89099	242500	6681	2	0	0	12	10:40	12:10
89100	242500	6695	2	0	0	12	10:40	12:10
89101	242500	6709	2	0	0	12	10:40	12:10
89102	242500	6723	2	0	0	12	10:40	12:10
89103	242500	6625	6	0	1	5	18:00	19:30
89104	242500	6639	6	0	1	5	18:00	19:30
89105	242500	6653	6	0	1	5	18:00	19:30
89106	242500	6667	6	0	1	5	18:00	19:30
89107	242500	6681	6	0	1	5	18:00	19:30
89108	242500	6695	6	0	1	5	18:00	19:30
89109	242500	6709	6	0	1	5	18:00	19:30
89110	242500	6723	6	0	1	5	18:00	19:30
89111	242500	6620	2	0	0	5	10:40	12:10
89112	242500	6634	2	0	0	5	10:40	12:10
89113	242500	6648	2	0	0	5	10:40	12:10
89114	242500	6662	2	0	0	5	10:40	12:10
89115	242500	6676	2	0	0	5	10:40	12:10
89116	242500	6690	2	0	0	5	10:40	12:10
89117	242500	6704	2	0	0	5	10:40	12:10
89118	242500	6718	2	0	0	5	10:40	12:10
89119	242500	6620	3	0	0	8	12:40	14:10
89120	242500	6627	3	0	0	8	12:40	14:10
89121	242500	6634	3	0	0	8	12:40	14:10
89122	242500	6641	3	0	0	8	12:40	14:10
89123	242500	6648	3	0	0	8	12:40	14:10
89124	242500	6655	3	0	0	8	12:40	14:10
89125	242500	6662	3	0	0	8	12:40	14:10
89126	242500	6669	3	0	0	8	12:40	14:10
89127	242500	6676	3	0	0	8	12:40	14:10
89128	242500	6683	3	0	0	8	12:40	14:10
89129	242500	6690	3	0	0	8	12:40	14:10
89130	242500	6697	3	0	0	8	12:40	14:10
89131	242500	6704	3	0	0	8	12:40	14:10
89132	242500	6711	3	0	0	8	12:40	14:10
89133	242500	6718	3	0	0	8	12:40	14:10
89134	242500	6725	3	0	0	8	12:40	14:10
89135	242500	6620	4	0	0	2	14:20	15:50
89136	242500	6627	4	0	0	2	14:20	15:50
89137	242500	6634	4	0	0	2	14:20	15:50
89138	242500	6641	4	0	0	2	14:20	15:50
89139	242500	6648	4	0	0	2	14:20	15:50
89140	242500	6655	4	0	0	2	14:20	15:50
89141	242500	6662	4	0	0	2	14:20	15:50
89142	242500	6669	4	0	0	2	14:20	15:50
89143	242500	6676	4	0	0	2	14:20	15:50
89144	242500	6683	4	0	0	2	14:20	15:50
89145	242500	6690	4	0	0	2	14:20	15:50
89146	242500	6697	4	0	0	2	14:20	15:50
89147	242500	6704	4	0	0	2	14:20	15:50
89148	242500	6711	4	0	0	2	14:20	15:50
89149	242500	6718	4	0	0	2	14:20	15:50
89150	242500	6725	4	0	0	2	14:20	15:50
89151	242500	6627	5	0	0	4	16:20	17:50
89152	242500	6641	5	0	0	4	16:20	17:50
89153	242500	6655	5	0	0	4	16:20	17:50
89154	242500	6669	5	0	0	4	16:20	17:50
89155	242500	6683	5	0	0	4	16:20	17:50
89156	242500	6697	5	0	0	4	16:20	17:50
89157	242500	6711	5	0	0	4	16:20	17:50
89158	242500	6725	5	0	0	4	16:20	17:50
89159	242500	6621	1	0	0	3	09:00	10:30
89160	242500	6628	1	0	0	3	09:00	10:30
89161	242500	6635	1	0	0	3	09:00	10:30
89162	242500	6642	1	0	0	3	09:00	10:30
89163	242500	6649	1	0	0	3	09:00	10:30
89164	242500	6656	1	0	0	3	09:00	10:30
89165	242500	6663	1	0	0	3	09:00	10:30
89166	242500	6670	1	0	0	3	09:00	10:30
89167	242500	6677	1	0	0	3	09:00	10:30
89168	242500	6684	1	0	0	3	09:00	10:30
89169	242500	6691	1	0	0	3	09:00	10:30
89170	242500	6698	1	0	0	3	09:00	10:30
89171	242500	6705	1	0	0	3	09:00	10:30
89172	242500	6712	1	0	0	3	09:00	10:30
89173	242500	6719	1	0	0	3	09:00	10:30
89174	242500	6726	1	0	0	3	09:00	10:30
89175	242500	6621	2	0	0	3	10:40	12:10
89176	242500	6628	2	0	0	3	10:40	12:10
89177	242500	6635	2	0	0	3	10:40	12:10
89178	242500	6642	2	0	0	3	10:40	12:10
89179	242500	6649	2	0	0	3	10:40	12:10
89180	242500	6656	2	0	0	3	10:40	12:10
89181	242500	6663	2	0	0	3	10:40	12:10
89182	242500	6670	2	0	0	3	10:40	12:10
89183	242500	6677	2	0	0	3	10:40	12:10
89184	242500	6684	2	0	0	3	10:40	12:10
89185	242500	6691	2	0	0	3	10:40	12:10
89186	242500	6698	2	0	0	3	10:40	12:10
89187	242500	6705	2	0	0	3	10:40	12:10
89188	242500	6712	2	0	0	3	10:40	12:10
89189	242500	6719	2	0	0	3	10:40	12:10
89190	242500	6726	2	0	0	3	10:40	12:10
89191	242500	6621	3	0	0	11	12:40	14:10
89192	242500	6628	3	0	0	11	12:40	14:10
89193	242500	6635	3	0	0	11	12:40	14:10
89194	242500	6642	3	0	0	11	12:40	14:10
89195	242500	6649	3	0	0	11	12:40	14:10
89196	242500	6656	3	0	0	11	12:40	14:10
89197	242500	6663	3	0	0	11	12:40	14:10
89198	242500	6670	3	0	0	11	12:40	14:10
89199	242500	6677	3	0	0	11	12:40	14:10
89200	242500	6684	3	0	0	11	12:40	14:10
89201	242500	6691	3	0	0	11	12:40	14:10
89202	242500	6698	3	0	0	11	12:40	14:10
89203	242500	6705	3	0	0	11	12:40	14:10
89204	242500	6712	3	0	0	11	12:40	14:10
89205	242500	6719	3	0	0	11	12:40	14:10
89206	242500	6726	3	0	0	11	12:40	14:10
89207	242500	6621	4	0	0	7	14:20	15:50
89208	242500	6628	4	0	0	7	14:20	15:50
89209	242500	6635	4	0	0	7	14:20	15:50
89210	242500	6642	4	0	0	7	14:20	15:50
89211	242500	6649	4	0	0	7	14:20	15:50
89212	242500	6656	4	0	0	7	14:20	15:50
89213	242500	6663	4	0	0	7	14:20	15:50
89214	242500	6670	4	0	0	7	14:20	15:50
89215	242500	6677	4	0	0	7	14:20	15:50
89216	242500	6684	4	0	0	7	14:20	15:50
89217	242500	6691	4	0	0	7	14:20	15:50
89218	242500	6698	4	0	0	7	14:20	15:50
89219	242500	6705	4	0	0	7	14:20	15:50
89220	242500	6712	4	0	0	7	14:20	15:50
89221	242500	6719	4	0	0	7	14:20	15:50
89222	242500	6726	4	0	0	7	14:20	15:50
89223	242500	6622	1	0	1	1	09:00	10:30
89224	242500	6629	1	0	1	1	09:00	10:30
89225	242500	6636	1	0	1	1	09:00	10:30
89226	242500	6643	1	0	1	1	09:00	10:30
89227	242500	6650	1	0	1	1	09:00	10:30
89228	242500	6657	1	0	1	1	09:00	10:30
89229	242500	6664	1	0	1	1	09:00	10:30
89230	242500	6671	1	0	1	1	09:00	10:30
89231	242500	6678	1	0	1	1	09:00	10:30
89232	242500	6685	1	0	1	1	09:00	10:30
89233	242500	6692	1	0	1	1	09:00	10:30
89234	242500	6699	1	0	1	1	09:00	10:30
89235	242500	6706	1	0	1	1	09:00	10:30
89236	242500	6713	1	0	1	1	09:00	10:30
89237	242500	6720	1	0	1	1	09:00	10:30
89238	242500	6727	1	0	1	1	09:00	10:30
89239	242500	6622	2	0	1	7	10:40	12:10
89240	242500	6629	2	0	1	7	10:40	12:10
89241	242500	6636	2	0	1	7	10:40	12:10
89242	242500	6643	2	0	1	7	10:40	12:10
89243	242500	6650	2	0	1	7	10:40	12:10
89244	242500	6657	2	0	1	7	10:40	12:10
89245	242500	6664	2	0	1	7	10:40	12:10
89246	242500	6671	2	0	1	7	10:40	12:10
89247	242500	6678	2	0	1	7	10:40	12:10
89248	242500	6685	2	0	1	7	10:40	12:10
89249	242500	6692	2	0	1	7	10:40	12:10
89250	242500	6699	2	0	1	7	10:40	12:10
89251	242500	6706	2	0	1	7	10:40	12:10
89252	242500	6713	2	0	1	7	10:40	12:10
89253	242500	6720	2	0	1	7	10:40	12:10
89254	242500	6727	2	0	1	7	10:40	12:10
89255	242500	6622	3	0	0	6	12:40	14:10
89256	242500	6629	3	0	0	6	12:40	14:10
89257	242500	6636	3	0	0	6	12:40	14:10
89258	242500	6643	3	0	0	6	12:40	14:10
89259	242500	6650	3	0	0	6	12:40	14:10
89260	242500	6657	3	0	0	6	12:40	14:10
89261	242500	6664	3	0	0	6	12:40	14:10
89262	242500	6671	3	0	0	6	12:40	14:10
89263	242500	6678	3	0	0	6	12:40	14:10
89264	242500	6685	3	0	0	6	12:40	14:10
89265	242500	6692	3	0	0	6	12:40	14:10
89266	242500	6699	3	0	0	6	12:40	14:10
89267	242500	6706	3	0	0	6	12:40	14:10
89268	242500	6713	3	0	0	6	12:40	14:10
89269	242500	6720	3	0	0	6	12:40	14:10
89270	242500	6727	3	0	0	6	12:40	14:10
89271	242500	6622	4	0	0	6	14:20	15:50
89272	242500	6629	4	0	0	6	14:20	15:50
89273	242500	6636	4	0	0	6	14:20	15:50
89274	242500	6643	4	0	0	6	14:20	15:50
89275	242500	6650	4	0	0	6	14:20	15:50
89276	242500	6657	4	0	0	6	14:20	15:50
89277	242500	6664	4	0	0	6	14:20	15:50
89278	242500	6671	4	0	0	6	14:20	15:50
89279	242500	6678	4	0	0	6	14:20	15:50
89280	242500	6685	4	0	0	6	14:20	15:50
89281	242500	6692	4	0	0	6	14:20	15:50
89282	242500	6699	4	0	0	6	14:20	15:50
89283	242500	6706	4	0	0	6	14:20	15:50
89284	242500	6713	4	0	0	6	14:20	15:50
89285	242500	6720	4	0	0	6	14:20	15:50
89286	242500	6727	4	0	0	6	14:20	15:50
89287	242500	6622	5	0	0	9	16:20	17:50
89288	242500	6629	5	0	0	9	16:20	17:50
89289	242500	6636	5	0	0	9	16:20	17:50
89290	242500	6643	5	0	0	9	16:20	17:50
89291	242500	6650	5	0	0	9	16:20	17:50
89292	242500	6657	5	0	0	9	16:20	17:50
89293	242500	6664	5	0	0	9	16:20	17:50
89294	242500	6671	5	0	0	9	16:20	17:50
89295	242500	6678	5	0	0	9	16:20	17:50
89296	242500	6685	5	0	0	9	16:20	17:50
89297	242500	6692	5	0	0	9	16:20	17:50
89298	242500	6699	5	0	0	9	16:20	17:50
89299	242500	6706	5	0	0	9	16:20	17:50
89300	242500	6713	5	0	0	9	16:20	17:50
89301	242500	6720	5	0	0	9	16:20	17:50
89302	242500	6727	5	0	0	9	16:20	17:50
89303	242500	6623	1	0	1	2	09:00	10:30
89304	242500	6630	1	0	1	2	09:00	10:30
89305	242500	6637	1	0	1	2	09:00	10:30
89306	242500	6644	1	0	1	2	09:00	10:30
89307	242500	6651	1	0	1	2	09:00	10:30
89308	242500	6658	1	0	1	2	09:00	10:30
89309	242500	6665	1	0	1	2	09:00	10:30
89310	242500	6672	1	0	1	2	09:00	10:30
89311	242500	6679	1	0	1	2	09:00	10:30
89312	242500	6686	1	0	1	2	09:00	10:30
89313	242500	6693	1	0	1	2	09:00	10:30
89314	242500	6700	1	0	1	2	09:00	10:30
89315	242500	6707	1	0	1	2	09:00	10:30
89316	242500	6714	1	0	1	2	09:00	10:30
89317	242500	6721	1	0	1	2	09:00	10:30
89318	242500	6728	1	0	1	2	09:00	10:30
89319	242500	6623	2	0	1	3	10:40	12:10
89320	242500	6637	2	0	1	3	10:40	12:10
89321	242500	6651	2	0	1	3	10:40	12:10
89322	242500	6665	2	0	1	3	10:40	12:10
89323	242500	6679	2	0	1	3	10:40	12:10
89324	242500	6693	2	0	1	3	10:40	12:10
89325	242500	6707	2	0	1	3	10:40	12:10
89326	242500	6721	2	0	1	3	10:40	12:10
89327	242500	6624	1	0	1	12	09:00	10:30
89328	242500	6638	1	0	1	12	09:00	10:30
89329	242500	6652	1	0	1	12	09:00	10:30
89330	242500	6666	1	0	1	12	09:00	10:30
89331	242500	6680	1	0	1	12	09:00	10:30
89332	242500	6694	1	0	1	12	09:00	10:30
89333	242500	6708	1	0	1	12	09:00	10:30
89334	242500	6722	1	0	1	12	09:00	10:30
89335	242500	6631	1	0	1	6	09:00	10:30
89336	242500	6645	1	0	1	6	09:00	10:30
89337	242500	6659	1	0	1	6	09:00	10:30
89338	242500	6673	1	0	1	6	09:00	10:30
89339	242500	6687	1	0	1	6	09:00	10:30
89340	242500	6701	1	0	1	6	09:00	10:30
89341	242500	6715	1	0	1	6	09:00	10:30
89342	242500	6729	1	0	1	6	09:00	10:30
89343	242500	6624	2	0	0	13	10:40	12:10
89344	242500	6631	2	0	0	13	10:40	12:10
89345	242500	6638	2	0	0	13	10:40	12:10
89346	242500	6645	2	0	0	13	10:40	12:10
89347	242500	6652	2	0	0	13	10:40	12:10
89348	242500	6659	2	0	0	13	10:40	12:10
89349	242500	6666	2	0	0	13	10:40	12:10
89350	242500	6673	2	0	0	13	10:40	12:10
89351	242500	6680	2	0	0	13	10:40	12:10
89352	242500	6687	2	0	0	13	10:40	12:10
89353	242500	6694	2	0	0	13	10:40	12:10
89354	242500	6701	2	0	0	13	10:40	12:10
89355	242500	6708	2	0	0	13	10:40	12:10
89356	242500	6715	2	0	0	13	10:40	12:10
89357	242500	6722	2	0	0	13	10:40	12:10
89358	242500	6729	2	0	0	13	10:40	12:10
89359	242500	6624	3	0	0	0	12:40	14:10
89360	242500	6631	3	0	0	0	12:40	14:10
89361	242500	6638	3	0	0	0	12:40	14:10
89362	242500	6645	3	0	0	0	12:40	14:10
89363	242500	6652	3	0	0	0	12:40	14:10
89364	242500	6659	3	0	0	0	12:40	14:10
89365	242500	6666	3	0	0	0	12:40	14:10
89366	242500	6673	3	0	0	0	12:40	14:10
89367	242500	6680	3	0	0	0	12:40	14:10
89368	242500	6687	3	0	0	0	12:40	14:10
89369	242500	6694	3	0	0	0	12:40	14:10
89370	242500	6701	3	0	0	0	12:40	14:10
89371	242500	6708	3	0	0	0	12:40	14:10
89372	242500	6715	3	0	0	0	12:40	14:10
89373	242500	6722	3	0	0	0	12:40	14:10
89374	242500	6729	3	0	0	0	12:40	14:10
89375	242500	6624	4	0	1	11	14:20	15:50
89376	242500	6631	4	0	1	11	14:20	15:50
89377	242500	6638	4	0	1	11	14:20	15:50
89378	242500	6645	4	0	1	11	14:20	15:50
89379	242500	6652	4	0	1	11	14:20	15:50
89380	242500	6659	4	0	1	11	14:20	15:50
89381	242500	6666	4	0	1	11	14:20	15:50
89382	242500	6673	4	0	1	11	14:20	15:50
89383	242500	6680	4	0	1	11	14:20	15:50
89384	242500	6687	4	0	1	11	14:20	15:50
89385	242500	6694	4	0	1	11	14:20	15:50
89386	242500	6701	4	0	1	11	14:20	15:50
89387	242500	6708	4	0	1	11	14:20	15:50
89388	242500	6715	4	0	1	11	14:20	15:50
89389	242500	6722	4	0	1	11	14:20	15:50
89390	242500	6729	4	0	1	11	14:20	15:50
89391	242500	6624	5	0	1	0	16:20	17:50
89392	242500	6631	5	0	1	0	16:20	17:50
89393	242500	6638	5	0	1	0	16:20	17:50
89394	242500	6645	5	0	1	0	16:20	17:50
89395	242500	6652	5	0	1	0	16:20	17:50
89396	242500	6659	5	0	1	0	16:20	17:50
89397	242500	6666	5	0	1	0	16:20	17:50
89398	242500	6673	5	0	1	0	16:20	17:50
89399	242500	6680	5	0	1	0	16:20	17:50
89400	242500	6687	5	0	1	0	16:20	17:50
89401	242500	6694	5	0	1	0	16:20	17:50
89402	242500	6701	5	0	1	0	16:20	17:50
89403	242500	6708	5	0	1	0	16:20	17:50
89404	242500	6715	5	0	1	0	16:20	17:50
89405	242500	6722	5	0	1	0	16:20	17:50
89406	242500	6729	5	0	1	0	16:20	17:50
89407	242500	6632	2	0	0	10	10:40	12:10
89408	242500	6646	2	0	0	10	10:40	12:10
89409	242500	6660	2	0	0	10	10:40	12:10
89410	242500	6674	2	0	0	10	10:40	12:10
89411	242500	6688	2	0	0	10	10:40	12:10
89412	242500	6702	2	0	0	10	10:40	12:10
89413	242500	6716	2	0	0	10	10:40	12:10
89414	242500	6730	2	0	0	10	10:40	12:10
89415	242500	6632	3	0	0	10	12:40	14:10
89416	242500	6646	3	0	0	10	12:40	14:10
89417	242500	6660	3	0	0	10	12:40	14:10
89418	242500	6674	3	0	0	10	12:40	14:10
89419	242500	6688	3	0	0	10	12:40	14:10
89420	242500	6702	3	0	0	10	12:40	14:10
89421	242500	6716	3	0	0	10	12:40	14:10
89422	242500	6730	3	0	0	10	12:40	14:10
89423	242500	6625	6	0	1	5	18:00	19:30
89424	242500	6639	6	0	1	5	18:00	19:30
89425	242500	6653	6	0	1	5	18:00	19:30
89426	242500	6667	6	0	1	5	18:00	19:30
89427	242500	6681	6	0	1	5	18:00	19:30
89428	242500	6695	6	0	1	5	18:00	19:30
89429	242500	6709	6	0	1	5	18:00	19:30
89430	242500	6723	6	0	1	5	18:00	19:30
89431	242500	6627	1	0	0	5	09:00	10:30
89432	242500	6641	1	0	0	5	09:00	10:30
89433	242500	6655	1	0	0	5	09:00	10:30
89434	242500	6669	1	0	0	5	09:00	10:30
89435	242500	6683	1	0	0	5	09:00	10:30
89436	242500	6697	1	0	0	5	09:00	10:30
89437	242500	6711	1	0	0	5	09:00	10:30
89438	242500	6725	1	0	0	5	09:00	10:30
89439	242500	6620	2	0	0	2	10:40	12:10
89440	242500	6627	2	0	0	2	10:40	12:10
89441	242500	6634	2	0	0	2	10:40	12:10
89442	242500	6641	2	0	0	2	10:40	12:10
89443	242500	6648	2	0	0	2	10:40	12:10
89444	242500	6655	2	0	0	2	10:40	12:10
89445	242500	6662	2	0	0	2	10:40	12:10
89446	242500	6669	2	0	0	2	10:40	12:10
89447	242500	6676	2	0	0	2	10:40	12:10
89448	242500	6683	2	0	0	2	10:40	12:10
89449	242500	6690	2	0	0	2	10:40	12:10
89450	242500	6697	2	0	0	2	10:40	12:10
89451	242500	6704	2	0	0	2	10:40	12:10
89452	242500	6711	2	0	0	2	10:40	12:10
89453	242500	6718	2	0	0	2	10:40	12:10
89454	242500	6725	2	0	0	2	10:40	12:10
89455	242500	6620	3	0	0	6	12:40	14:10
89456	242500	6627	3	0	0	6	12:40	14:10
89457	242500	6634	3	0	0	6	12:40	14:10
89458	242500	6641	3	0	0	6	12:40	14:10
89459	242500	6648	3	0	0	6	12:40	14:10
89460	242500	6655	3	0	0	6	12:40	14:10
89461	242500	6662	3	0	0	6	12:40	14:10
89462	242500	6669	3	0	0	6	12:40	14:10
89463	242500	6676	3	0	0	6	12:40	14:10
89464	242500	6683	3	0	0	6	12:40	14:10
89465	242500	6690	3	0	0	6	12:40	14:10
89466	242500	6697	3	0	0	6	12:40	14:10
89467	242500	6704	3	0	0	6	12:40	14:10
89468	242500	6711	3	0	0	6	12:40	14:10
89469	242500	6718	3	0	0	6	12:40	14:10
89470	242500	6725	3	0	0	6	12:40	14:10
89471	242500	6620	4	0	0	6	14:20	15:50
89472	242500	6627	4	0	0	6	14:20	15:50
89473	242500	6634	4	0	0	6	14:20	15:50
89474	242500	6641	4	0	0	6	14:20	15:50
89475	242500	6648	4	0	0	6	14:20	15:50
89476	242500	6655	4	0	0	6	14:20	15:50
89477	242500	6662	4	0	0	6	14:20	15:50
89478	242500	6669	4	0	0	6	14:20	15:50
89479	242500	6676	4	0	0	6	14:20	15:50
89480	242500	6683	4	0	0	6	14:20	15:50
89481	242500	6690	4	0	0	6	14:20	15:50
89482	242500	6697	4	0	0	6	14:20	15:50
89483	242500	6704	4	0	0	6	14:20	15:50
89484	242500	6711	4	0	0	6	14:20	15:50
89485	242500	6718	4	0	0	6	14:20	15:50
89486	242500	6725	4	0	0	6	14:20	15:50
89487	242500	6627	5	0	0	4	16:20	17:50
89488	242500	6641	5	0	0	4	16:20	17:50
89489	242500	6655	5	0	0	4	16:20	17:50
89490	242500	6669	5	0	0	4	16:20	17:50
89491	242500	6683	5	0	0	4	16:20	17:50
89492	242500	6697	5	0	0	4	16:20	17:50
89493	242500	6711	5	0	0	4	16:20	17:50
89494	242500	6725	5	0	0	4	16:20	17:50
89495	242500	6621	1	0	0	9	09:00	10:30
89496	242500	6628	1	0	0	9	09:00	10:30
89497	242500	6635	1	0	0	9	09:00	10:30
89498	242500	6642	1	0	0	9	09:00	10:30
89499	242500	6649	1	0	0	9	09:00	10:30
89500	242500	6656	1	0	0	9	09:00	10:30
89501	242500	6663	1	0	0	9	09:00	10:30
89502	242500	6670	1	0	0	9	09:00	10:30
89503	242500	6677	1	0	0	9	09:00	10:30
89504	242500	6684	1	0	0	9	09:00	10:30
89505	242500	6691	1	0	0	9	09:00	10:30
89506	242500	6698	1	0	0	9	09:00	10:30
89507	242500	6705	1	0	0	9	09:00	10:30
89508	242500	6712	1	0	0	9	09:00	10:30
89509	242500	6719	1	0	0	9	09:00	10:30
89510	242500	6726	1	0	0	9	09:00	10:30
89511	242500	6621	2	0	0	11	10:40	12:10
89512	242500	6628	2	0	0	11	10:40	12:10
89513	242500	6635	2	0	0	11	10:40	12:10
89514	242500	6642	2	0	0	11	10:40	12:10
89515	242500	6649	2	0	0	11	10:40	12:10
89516	242500	6656	2	0	0	11	10:40	12:10
89517	242500	6663	2	0	0	11	10:40	12:10
89518	242500	6670	2	0	0	11	10:40	12:10
89519	242500	6677	2	0	0	11	10:40	12:10
89520	242500	6684	2	0	0	11	10:40	12:10
89521	242500	6691	2	0	0	11	10:40	12:10
89522	242500	6698	2	0	0	11	10:40	12:10
89523	242500	6705	2	0	0	11	10:40	12:10
89524	242500	6712	2	0	0	11	10:40	12:10
89525	242500	6719	2	0	0	11	10:40	12:10
89526	242500	6726	2	0	0	11	10:40	12:10
89527	242500	6621	3	0	0	3	12:40	14:10
89528	242500	6628	3	0	0	3	12:40	14:10
89529	242500	6635	3	0	0	3	12:40	14:10
89530	242500	6642	3	0	0	3	12:40	14:10
89531	242500	6649	3	0	0	3	12:40	14:10
89532	242500	6656	3	0	0	3	12:40	14:10
89533	242500	6663	3	0	0	3	12:40	14:10
89534	242500	6670	3	0	0	3	12:40	14:10
89535	242500	6677	3	0	0	3	12:40	14:10
89536	242500	6684	3	0	0	3	12:40	14:10
89537	242500	6691	3	0	0	3	12:40	14:10
89538	242500	6698	3	0	0	3	12:40	14:10
89539	242500	6705	3	0	0	3	12:40	14:10
89540	242500	6712	3	0	0	3	12:40	14:10
89541	242500	6719	3	0	0	3	12:40	14:10
89542	242500	6726	3	0	0	3	12:40	14:10
89543	242500	6621	4	0	0	3	14:20	15:50
89544	242500	6628	4	0	0	3	14:20	15:50
89545	242500	6635	4	0	0	3	14:20	15:50
89546	242500	6642	4	0	0	3	14:20	15:50
89547	242500	6649	4	0	0	3	14:20	15:50
89548	242500	6656	4	0	0	3	14:20	15:50
89549	242500	6663	4	0	0	3	14:20	15:50
89550	242500	6670	4	0	0	3	14:20	15:50
89551	242500	6677	4	0	0	3	14:20	15:50
89552	242500	6684	4	0	0	3	14:20	15:50
89553	242500	6691	4	0	0	3	14:20	15:50
89554	242500	6698	4	0	0	3	14:20	15:50
89555	242500	6705	4	0	0	3	14:20	15:50
89556	242500	6712	4	0	0	3	14:20	15:50
89557	242500	6719	4	0	0	3	14:20	15:50
89558	242500	6726	4	0	0	3	14:20	15:50
89559	242500	6622	1	0	1	1	09:00	10:30
89560	242500	6629	1	0	1	1	09:00	10:30
89561	242500	6636	1	0	1	1	09:00	10:30
89562	242500	6643	1	0	1	1	09:00	10:30
89563	242500	6650	1	0	1	1	09:00	10:30
89564	242500	6657	1	0	1	1	09:00	10:30
89565	242500	6664	1	0	1	1	09:00	10:30
89566	242500	6671	1	0	1	1	09:00	10:30
89567	242500	6678	1	0	1	1	09:00	10:30
89568	242500	6685	1	0	1	1	09:00	10:30
89569	242500	6692	1	0	1	1	09:00	10:30
89570	242500	6699	1	0	1	1	09:00	10:30
89571	242500	6706	1	0	1	1	09:00	10:30
89572	242500	6713	1	0	1	1	09:00	10:30
89573	242500	6720	1	0	1	1	09:00	10:30
89574	242500	6727	1	0	1	1	09:00	10:30
89575	242500	6622	2	0	1	7	10:40	12:10
89576	242500	6629	2	0	1	7	10:40	12:10
89577	242500	6636	2	0	1	7	10:40	12:10
89578	242500	6643	2	0	1	7	10:40	12:10
89579	242500	6650	2	0	1	7	10:40	12:10
89580	242500	6657	2	0	1	7	10:40	12:10
89581	242500	6664	2	0	1	7	10:40	12:10
89582	242500	6671	2	0	1	7	10:40	12:10
89583	242500	6678	2	0	1	7	10:40	12:10
89584	242500	6685	2	0	1	7	10:40	12:10
89585	242500	6692	2	0	1	7	10:40	12:10
89586	242500	6699	2	0	1	7	10:40	12:10
89587	242500	6706	2	0	1	7	10:40	12:10
89588	242500	6713	2	0	1	7	10:40	12:10
89589	242500	6720	2	0	1	7	10:40	12:10
89590	242500	6727	2	0	1	7	10:40	12:10
89591	242500	6622	4	0	0	1	14:20	15:50
89592	242500	6629	4	0	0	1	14:20	15:50
89593	242500	6636	4	0	0	1	14:20	15:50
89594	242500	6643	4	0	0	1	14:20	15:50
89595	242500	6650	4	0	0	1	14:20	15:50
89596	242500	6657	4	0	0	1	14:20	15:50
89597	242500	6664	4	0	0	1	14:20	15:50
89598	242500	6671	4	0	0	1	14:20	15:50
89599	242500	6678	4	0	0	1	14:20	15:50
89600	242500	6685	4	0	0	1	14:20	15:50
89601	242500	6692	4	0	0	1	14:20	15:50
89602	242500	6699	4	0	0	1	14:20	15:50
89603	242500	6706	4	0	0	1	14:20	15:50
89604	242500	6713	4	0	0	1	14:20	15:50
89605	242500	6720	4	0	0	1	14:20	15:50
89606	242500	6727	4	0	0	1	14:20	15:50
89607	242500	6622	5	0	0	7	16:20	17:50
89608	242500	6629	5	0	0	7	16:20	17:50
89609	242500	6636	5	0	0	7	16:20	17:50
89610	242500	6643	5	0	0	7	16:20	17:50
89611	242500	6650	5	0	0	7	16:20	17:50
89612	242500	6657	5	0	0	7	16:20	17:50
89613	242500	6664	5	0	0	7	16:20	17:50
89614	242500	6671	5	0	0	7	16:20	17:50
89615	242500	6678	5	0	0	7	16:20	17:50
89616	242500	6685	5	0	0	7	16:20	17:50
89617	242500	6692	5	0	0	7	16:20	17:50
89618	242500	6699	5	0	0	7	16:20	17:50
89619	242500	6706	5	0	0	7	16:20	17:50
89620	242500	6713	5	0	0	7	16:20	17:50
89621	242500	6720	5	0	0	7	16:20	17:50
89622	242500	6727	5	0	0	7	16:20	17:50
89623	242500	6623	1	0	1	2	09:00	10:30
89624	242500	6630	1	0	1	2	09:00	10:30
89625	242500	6637	1	0	1	2	09:00	10:30
89626	242500	6644	1	0	1	2	09:00	10:30
89627	242500	6651	1	0	1	2	09:00	10:30
89628	242500	6658	1	0	1	2	09:00	10:30
89629	242500	6665	1	0	1	2	09:00	10:30
89630	242500	6672	1	0	1	2	09:00	10:30
89631	242500	6679	1	0	1	2	09:00	10:30
89632	242500	6686	1	0	1	2	09:00	10:30
89633	242500	6693	1	0	1	2	09:00	10:30
89634	242500	6700	1	0	1	2	09:00	10:30
89635	242500	6707	1	0	1	2	09:00	10:30
89636	242500	6714	1	0	1	2	09:00	10:30
89637	242500	6721	1	0	1	2	09:00	10:30
89638	242500	6728	1	0	1	2	09:00	10:30
89639	242500	6623	2	0	1	3	10:40	12:10
89640	242500	6637	2	0	1	3	10:40	12:10
89641	242500	6651	2	0	1	3	10:40	12:10
89642	242500	6665	2	0	1	3	10:40	12:10
89643	242500	6679	2	0	1	3	10:40	12:10
89644	242500	6693	2	0	1	3	10:40	12:10
89645	242500	6707	2	0	1	3	10:40	12:10
89646	242500	6721	2	0	1	3	10:40	12:10
89647	242500	6624	1	0	1	10	09:00	10:30
89648	242500	6638	1	0	1	10	09:00	10:30
89649	242500	6652	1	0	1	10	09:00	10:30
89650	242500	6666	1	0	1	10	09:00	10:30
89651	242500	6680	1	0	1	10	09:00	10:30
89652	242500	6694	1	0	1	10	09:00	10:30
89653	242500	6708	1	0	1	10	09:00	10:30
89654	242500	6722	1	0	1	10	09:00	10:30
89655	242500	6631	1	0	1	6	09:00	10:30
89656	242500	6645	1	0	1	6	09:00	10:30
89657	242500	6659	1	0	1	6	09:00	10:30
89658	242500	6673	1	0	1	6	09:00	10:30
89659	242500	6687	1	0	1	6	09:00	10:30
89660	242500	6701	1	0	1	6	09:00	10:30
89661	242500	6715	1	0	1	6	09:00	10:30
89662	242500	6729	1	0	1	6	09:00	10:30
89663	242500	6624	2	0	0	0	10:40	12:10
89664	242500	6631	2	0	0	0	10:40	12:10
89665	242500	6638	2	0	0	0	10:40	12:10
89666	242500	6645	2	0	0	0	10:40	12:10
89667	242500	6652	2	0	0	0	10:40	12:10
89668	242500	6659	2	0	0	0	10:40	12:10
89669	242500	6666	2	0	0	0	10:40	12:10
89670	242500	6673	2	0	0	0	10:40	12:10
89671	242500	6680	2	0	0	0	10:40	12:10
89672	242500	6687	2	0	0	0	10:40	12:10
89673	242500	6694	2	0	0	0	10:40	12:10
89674	242500	6701	2	0	0	0	10:40	12:10
89675	242500	6708	2	0	0	0	10:40	12:10
89676	242500	6715	2	0	0	0	10:40	12:10
89677	242500	6722	2	0	0	0	10:40	12:10
89678	242500	6729	2	0	0	0	10:40	12:10
89679	242500	6624	3	0	0	8	12:40	14:10
89680	242500	6631	3	0	0	8	12:40	14:10
89681	242500	6638	3	0	0	8	12:40	14:10
89682	242500	6645	3	0	0	8	12:40	14:10
89683	242500	6652	3	0	0	8	12:40	14:10
89684	242500	6659	3	0	0	8	12:40	14:10
89685	242500	6666	3	0	0	8	12:40	14:10
89686	242500	6673	3	0	0	8	12:40	14:10
89687	242500	6680	3	0	0	8	12:40	14:10
89688	242500	6687	3	0	0	8	12:40	14:10
89689	242500	6694	3	0	0	8	12:40	14:10
89690	242500	6701	3	0	0	8	12:40	14:10
89691	242500	6708	3	0	0	8	12:40	14:10
89692	242500	6715	3	0	0	8	12:40	14:10
89693	242500	6722	3	0	0	8	12:40	14:10
89694	242500	6729	3	0	0	8	12:40	14:10
89695	242500	6624	4	0	1	11	14:20	15:50
89696	242500	6631	4	0	1	11	14:20	15:50
89697	242500	6638	4	0	1	11	14:20	15:50
89698	242500	6645	4	0	1	11	14:20	15:50
89699	242500	6652	4	0	1	11	14:20	15:50
89700	242500	6659	4	0	1	11	14:20	15:50
89701	242500	6666	4	0	1	11	14:20	15:50
89702	242500	6673	4	0	1	11	14:20	15:50
89703	242500	6680	4	0	1	11	14:20	15:50
89704	242500	6687	4	0	1	11	14:20	15:50
89705	242500	6694	4	0	1	11	14:20	15:50
89706	242500	6701	4	0	1	11	14:20	15:50
89707	242500	6708	4	0	1	11	14:20	15:50
89708	242500	6715	4	0	1	11	14:20	15:50
89709	242500	6722	4	0	1	11	14:20	15:50
89710	242500	6729	4	0	1	11	14:20	15:50
89711	242500	6624	5	0	1	0	16:20	17:50
89712	242500	6631	5	0	1	0	16:20	17:50
89713	242500	6638	5	0	1	0	16:20	17:50
89714	242500	6645	5	0	1	0	16:20	17:50
89715	242500	6652	5	0	1	0	16:20	17:50
89716	242500	6659	5	0	1	0	16:20	17:50
89717	242500	6666	5	0	1	0	16:20	17:50
89718	242500	6673	5	0	1	0	16:20	17:50
89719	242500	6680	5	0	1	0	16:20	17:50
89720	242500	6687	5	0	1	0	16:20	17:50
89721	242500	6694	5	0	1	0	16:20	17:50
89722	242500	6701	5	0	1	0	16:20	17:50
89723	242500	6708	5	0	1	0	16:20	17:50
89724	242500	6715	5	0	1	0	16:20	17:50
89725	242500	6722	5	0	1	0	16:20	17:50
89726	242500	6729	5	0	1	0	16:20	17:50
89727	242500	6632	4	0	0	10	14:20	15:50
89728	242500	6646	4	0	0	10	14:20	15:50
89729	242500	6660	4	0	0	10	14:20	15:50
89730	242500	6674	4	0	0	10	14:20	15:50
89731	242500	6688	4	0	0	10	14:20	15:50
89732	242500	6702	4	0	0	10	14:20	15:50
89733	242500	6716	4	0	0	10	14:20	15:50
89734	242500	6730	4	0	0	10	14:20	15:50
89735	242500	6632	5	0	0	10	16:20	17:50
89736	242500	6646	5	0	0	10	16:20	17:50
89737	242500	6660	5	0	0	10	16:20	17:50
89738	242500	6674	5	0	0	10	16:20	17:50
89739	242500	6688	5	0	0	10	16:20	17:50
89740	242500	6702	5	0	0	10	16:20	17:50
89741	242500	6716	5	0	0	10	16:20	17:50
89742	242500	6730	5	0	0	10	16:20	17:50
89743	242500	6625	6	0	1	5	18:00	19:30
89744	242500	6639	6	0	1	5	18:00	19:30
89745	242500	6653	6	0	1	5	18:00	19:30
89746	242500	6667	6	0	1	5	18:00	19:30
89747	242500	6681	6	0	1	5	18:00	19:30
89748	242500	6695	6	0	1	5	18:00	19:30
89749	242500	6709	6	0	1	5	18:00	19:30
89750	242500	6723	6	0	1	5	18:00	19:30
89751	242500	6620	2	0	0	14	10:40	12:10
89752	242500	6627	2	0	0	14	10:40	12:10
89753	242500	6634	2	0	0	14	10:40	12:10
89754	242500	6641	2	0	0	14	10:40	12:10
89755	242500	6648	2	0	0	14	10:40	12:10
89756	242500	6655	2	0	0	14	10:40	12:10
89757	242500	6662	2	0	0	14	10:40	12:10
89758	242500	6669	2	0	0	14	10:40	12:10
89759	242500	6676	2	0	0	14	10:40	12:10
89760	242500	6683	2	0	0	14	10:40	12:10
89761	242500	6690	2	0	0	14	10:40	12:10
89762	242500	6697	2	0	0	14	10:40	12:10
89763	242500	6704	2	0	0	14	10:40	12:10
89764	242500	6711	2	0	0	14	10:40	12:10
89765	242500	6718	2	0	0	14	10:40	12:10
89766	242500	6725	2	0	0	14	10:40	12:10
89767	242500	6620	3	0	1	15	12:40	14:10
89768	242500	6627	3	0	1	15	12:40	14:10
89769	242500	6634	3	0	1	15	12:40	14:10
89770	242500	6641	3	0	1	15	12:40	14:10
89771	242500	6648	3	0	1	15	12:40	14:10
89772	242500	6655	3	0	1	15	12:40	14:10
89773	242500	6662	3	0	1	15	12:40	14:10
89774	242500	6669	3	0	1	15	12:40	14:10
89775	242500	6676	3	0	1	15	12:40	14:10
89776	242500	6683	3	0	1	15	12:40	14:10
89777	242500	6690	3	0	1	15	12:40	14:10
89778	242500	6697	3	0	1	15	12:40	14:10
89779	242500	6704	3	0	1	15	12:40	14:10
89780	242500	6711	3	0	1	15	12:40	14:10
89781	242500	6718	3	0	1	15	12:40	14:10
89782	242500	6725	3	0	1	15	12:40	14:10
89783	242500	6620	4	0	1	14	14:20	15:50
89784	242500	6627	4	0	1	14	14:20	15:50
89785	242500	6634	4	0	1	14	14:20	15:50
89786	242500	6641	4	0	1	14	14:20	15:50
89787	242500	6648	4	0	1	14	14:20	15:50
89788	242500	6655	4	0	1	14	14:20	15:50
89789	242500	6662	4	0	1	14	14:20	15:50
89790	242500	6669	4	0	1	14	14:20	15:50
89791	242500	6676	4	0	1	14	14:20	15:50
89792	242500	6683	4	0	1	14	14:20	15:50
89793	242500	6690	4	0	1	14	14:20	15:50
89794	242500	6697	4	0	1	14	14:20	15:50
89795	242500	6704	4	0	1	14	14:20	15:50
89796	242500	6711	4	0	1	14	14:20	15:50
89797	242500	6718	4	0	1	14	14:20	15:50
89798	242500	6725	4	0	1	14	14:20	15:50
89799	242500	6620	5	0	0	16	16:20	17:50
89800	242500	6627	5	0	0	16	16:20	17:50
89801	242500	6634	5	0	0	16	16:20	17:50
89802	242500	6641	5	0	0	16	16:20	17:50
89803	242500	6648	5	0	0	16	16:20	17:50
89804	242500	6655	5	0	0	16	16:20	17:50
89805	242500	6662	5	0	0	16	16:20	17:50
89806	242500	6669	5	0	0	16	16:20	17:50
89807	242500	6676	5	0	0	16	16:20	17:50
89808	242500	6683	5	0	0	16	16:20	17:50
89809	242500	6690	5	0	0	16	16:20	17:50
89810	242500	6697	5	0	0	16	16:20	17:50
89811	242500	6704	5	0	0	16	16:20	17:50
89812	242500	6711	5	0	0	16	16:20	17:50
89813	242500	6718	5	0	0	16	16:20	17:50
89814	242500	6725	5	0	0	16	16:20	17:50
89815	242500	6621	1	0	1	7	09:00	10:30
89816	242500	6628	1	0	1	7	09:00	10:30
89817	242500	6635	1	0	1	7	09:00	10:30
89818	242500	6642	1	0	1	7	09:00	10:30
89819	242500	6649	1	0	1	7	09:00	10:30
89820	242500	6656	1	0	1	7	09:00	10:30
89821	242500	6663	1	0	1	7	09:00	10:30
89822	242500	6670	1	0	1	7	09:00	10:30
89823	242500	6677	1	0	1	7	09:00	10:30
89824	242500	6684	1	0	1	7	09:00	10:30
89825	242500	6691	1	0	1	7	09:00	10:30
89826	242500	6698	1	0	1	7	09:00	10:30
89827	242500	6705	1	0	1	7	09:00	10:30
89828	242500	6712	1	0	1	7	09:00	10:30
89829	242500	6719	1	0	1	7	09:00	10:30
89830	242500	6726	1	0	1	7	09:00	10:30
89831	242500	6621	2	0	1	1	10:40	12:10
89832	242500	6628	2	0	1	1	10:40	12:10
89833	242500	6635	2	0	1	1	10:40	12:10
89834	242500	6642	2	0	1	1	10:40	12:10
89835	242500	6649	2	0	1	1	10:40	12:10
89836	242500	6656	2	0	1	1	10:40	12:10
89837	242500	6663	2	0	1	1	10:40	12:10
89838	242500	6670	2	0	1	1	10:40	12:10
89839	242500	6677	2	0	1	1	10:40	12:10
89840	242500	6684	2	0	1	1	10:40	12:10
89841	242500	6691	2	0	1	1	10:40	12:10
89842	242500	6698	2	0	1	1	10:40	12:10
89843	242500	6705	2	0	1	1	10:40	12:10
89844	242500	6712	2	0	1	1	10:40	12:10
89845	242500	6719	2	0	1	1	10:40	12:10
89846	242500	6726	2	0	1	1	10:40	12:10
89847	242500	6621	3	0	0	7	12:40	14:10
89848	242500	6628	3	0	0	7	12:40	14:10
89849	242500	6635	3	0	0	7	12:40	14:10
89850	242500	6642	3	0	0	7	12:40	14:10
89851	242500	6649	3	0	0	7	12:40	14:10
89852	242500	6656	3	0	0	7	12:40	14:10
89853	242500	6663	3	0	0	7	12:40	14:10
89854	242500	6670	3	0	0	7	12:40	14:10
89855	242500	6677	3	0	0	7	12:40	14:10
89856	242500	6684	3	0	0	7	12:40	14:10
89857	242500	6691	3	0	0	7	12:40	14:10
89858	242500	6698	3	0	0	7	12:40	14:10
89859	242500	6705	3	0	0	7	12:40	14:10
89860	242500	6712	3	0	0	7	12:40	14:10
89861	242500	6719	3	0	0	7	12:40	14:10
89862	242500	6726	3	0	0	7	12:40	14:10
89863	242500	6621	4	0	0	9	14:20	15:50
89864	242500	6628	4	0	0	9	14:20	15:50
89865	242500	6635	4	0	0	9	14:20	15:50
89866	242500	6642	4	0	0	9	14:20	15:50
89867	242500	6649	4	0	0	9	14:20	15:50
89868	242500	6656	4	0	0	9	14:20	15:50
89869	242500	6663	4	0	0	9	14:20	15:50
89870	242500	6670	4	0	0	9	14:20	15:50
89871	242500	6677	4	0	0	9	14:20	15:50
89872	242500	6684	4	0	0	9	14:20	15:50
89873	242500	6691	4	0	0	9	14:20	15:50
89874	242500	6698	4	0	0	9	14:20	15:50
89875	242500	6705	4	0	0	9	14:20	15:50
89876	242500	6712	4	0	0	9	14:20	15:50
89877	242500	6719	4	0	0	9	14:20	15:50
89878	242500	6726	4	0	0	9	14:20	15:50
89879	242500	6621	5	0	0	17	16:20	17:50
89880	242500	6628	5	0	0	17	16:20	17:50
89881	242500	6635	5	0	0	17	16:20	17:50
89882	242500	6642	5	0	0	17	16:20	17:50
89883	242500	6649	5	0	0	17	16:20	17:50
89884	242500	6656	5	0	0	17	16:20	17:50
89885	242500	6663	5	0	0	17	16:20	17:50
89886	242500	6670	5	0	0	17	16:20	17:50
89887	242500	6677	5	0	0	17	16:20	17:50
89888	242500	6684	5	0	0	17	16:20	17:50
89889	242500	6691	5	0	0	17	16:20	17:50
89890	242500	6698	5	0	0	17	16:20	17:50
89891	242500	6705	5	0	0	17	16:20	17:50
89892	242500	6712	5	0	0	17	16:20	17:50
89893	242500	6719	5	0	0	17	16:20	17:50
89894	242500	6726	5	0	0	17	16:20	17:50
89895	242500	6622	1	0	0	15	09:00	10:30
89896	242500	6629	1	0	0	15	09:00	10:30
89897	242500	6636	1	0	0	15	09:00	10:30
89898	242500	6643	1	0	0	15	09:00	10:30
89899	242500	6650	1	0	0	15	09:00	10:30
89900	242500	6657	1	0	0	15	09:00	10:30
89901	242500	6664	1	0	0	15	09:00	10:30
89902	242500	6671	1	0	0	15	09:00	10:30
89903	242500	6678	1	0	0	15	09:00	10:30
89904	242500	6685	1	0	0	15	09:00	10:30
89905	242500	6692	1	0	0	15	09:00	10:30
89906	242500	6699	1	0	0	15	09:00	10:30
89907	242500	6706	1	0	0	15	09:00	10:30
89908	242500	6713	1	0	0	15	09:00	10:30
89909	242500	6720	1	0	0	15	09:00	10:30
89910	242500	6727	1	0	0	15	09:00	10:30
89911	242500	6622	2	0	0	8	10:40	12:10
89912	242500	6629	2	0	0	8	10:40	12:10
89913	242500	6636	2	0	0	8	10:40	12:10
89914	242500	6643	2	0	0	8	10:40	12:10
89915	242500	6650	2	0	0	8	10:40	12:10
89916	242500	6657	2	0	0	8	10:40	12:10
89917	242500	6664	2	0	0	8	10:40	12:10
89918	242500	6671	2	0	0	8	10:40	12:10
89919	242500	6678	2	0	0	8	10:40	12:10
89920	242500	6685	2	0	0	8	10:40	12:10
89921	242500	6692	2	0	0	8	10:40	12:10
89922	242500	6699	2	0	0	8	10:40	12:10
89923	242500	6706	2	0	0	8	10:40	12:10
89924	242500	6713	2	0	0	8	10:40	12:10
89925	242500	6720	2	0	0	8	10:40	12:10
89926	242500	6727	2	0	0	8	10:40	12:10
89927	242500	6622	3	0	0	2	12:40	14:10
89928	242500	6629	3	0	0	2	12:40	14:10
89929	242500	6636	3	0	0	2	12:40	14:10
89930	242500	6643	3	0	0	2	12:40	14:10
89931	242500	6650	3	0	0	2	12:40	14:10
89932	242500	6657	3	0	0	2	12:40	14:10
89933	242500	6664	3	0	0	2	12:40	14:10
89934	242500	6671	3	0	0	2	12:40	14:10
89935	242500	6678	3	0	0	2	12:40	14:10
89936	242500	6685	3	0	0	2	12:40	14:10
89937	242500	6692	3	0	0	2	12:40	14:10
89938	242500	6699	3	0	0	2	12:40	14:10
89939	242500	6706	3	0	0	2	12:40	14:10
89940	242500	6713	3	0	0	2	12:40	14:10
89941	242500	6720	3	0	0	2	12:40	14:10
89942	242500	6727	3	0	0	2	12:40	14:10
89943	242500	6623	1	0	1	18	09:00	10:30
89944	242500	6637	1	0	1	18	09:00	10:30
89945	242500	6651	1	0	1	18	09:00	10:30
89946	242500	6665	1	0	1	18	09:00	10:30
89947	242500	6679	1	0	1	18	09:00	10:30
89948	242500	6693	1	0	1	18	09:00	10:30
89949	242500	6707	1	0	1	18	09:00	10:30
89950	242500	6721	1	0	1	18	09:00	10:30
89951	242500	6630	1	0	0	18	09:00	10:30
89952	242500	6644	1	0	0	18	09:00	10:30
89953	242500	6658	1	0	0	18	09:00	10:30
89954	242500	6672	1	0	0	18	09:00	10:30
89955	242500	6686	1	0	0	18	09:00	10:30
89956	242500	6700	1	0	0	18	09:00	10:30
89957	242500	6714	1	0	0	18	09:00	10:30
89958	242500	6728	1	0	0	18	09:00	10:30
89959	242500	6623	2	0	1	2	10:40	12:10
89960	242500	6637	2	0	1	2	10:40	12:10
89961	242500	6651	2	0	1	2	10:40	12:10
89962	242500	6665	2	0	1	2	10:40	12:10
89963	242500	6679	2	0	1	2	10:40	12:10
89964	242500	6693	2	0	1	2	10:40	12:10
89965	242500	6707	2	0	1	2	10:40	12:10
89966	242500	6721	2	0	1	2	10:40	12:10
89967	242500	6630	2	0	1	17	10:40	12:10
89968	242500	6644	2	0	1	17	10:40	12:10
89969	242500	6658	2	0	1	17	10:40	12:10
89970	242500	6672	2	0	1	17	10:40	12:10
89971	242500	6686	2	0	1	17	10:40	12:10
89972	242500	6700	2	0	1	17	10:40	12:10
89973	242500	6714	2	0	1	17	10:40	12:10
89974	242500	6728	2	0	1	17	10:40	12:10
89975	242500	6624	1	0	0	1	09:00	10:30
89976	242500	6638	1	0	0	1	09:00	10:30
89977	242500	6652	1	0	0	1	09:00	10:30
89978	242500	6666	1	0	0	1	09:00	10:30
89979	242500	6680	1	0	0	1	09:00	10:30
89980	242500	6694	1	0	0	1	09:00	10:30
89981	242500	6708	1	0	0	1	09:00	10:30
89982	242500	6722	1	0	0	1	09:00	10:30
89983	242500	6624	2	0	0	19	10:40	12:10
89984	242500	6631	2	0	0	19	10:40	12:10
89985	242500	6638	2	0	0	19	10:40	12:10
89986	242500	6645	2	0	0	19	10:40	12:10
89987	242500	6652	2	0	0	19	10:40	12:10
89988	242500	6659	2	0	0	19	10:40	12:10
89989	242500	6666	2	0	0	19	10:40	12:10
89990	242500	6673	2	0	0	19	10:40	12:10
89991	242500	6680	2	0	0	19	10:40	12:10
89992	242500	6687	2	0	0	19	10:40	12:10
89993	242500	6694	2	0	0	19	10:40	12:10
89994	242500	6701	2	0	0	19	10:40	12:10
89995	242500	6708	2	0	0	19	10:40	12:10
89996	242500	6715	2	0	0	19	10:40	12:10
89997	242500	6722	2	0	0	19	10:40	12:10
89998	242500	6729	2	0	0	19	10:40	12:10
89999	242500	6624	3	0	1	19	12:40	14:10
90000	242500	6631	3	0	1	19	12:40	14:10
90001	242500	6638	3	0	1	19	12:40	14:10
90002	242500	6645	3	0	1	19	12:40	14:10
90003	242500	6652	3	0	1	19	12:40	14:10
90004	242500	6659	3	0	1	19	12:40	14:10
90005	242500	6666	3	0	1	19	12:40	14:10
90006	242500	6673	3	0	1	19	12:40	14:10
90007	242500	6680	3	0	1	19	12:40	14:10
90008	242500	6687	3	0	1	19	12:40	14:10
90009	242500	6694	3	0	1	19	12:40	14:10
90010	242500	6701	3	0	1	19	12:40	14:10
90011	242500	6708	3	0	1	19	12:40	14:10
90012	242500	6715	3	0	1	19	12:40	14:10
90013	242500	6722	3	0	1	19	12:40	14:10
90014	242500	6729	3	0	1	19	12:40	14:10
90015	242500	6624	4	0	0	16	14:20	15:50
90016	242500	6631	4	0	0	16	14:20	15:50
90017	242500	6638	4	0	0	16	14:20	15:50
90018	242500	6645	4	0	0	16	14:20	15:50
90019	242500	6652	4	0	0	16	14:20	15:50
90020	242500	6659	4	0	0	16	14:20	15:50
90021	242500	6666	4	0	0	16	14:20	15:50
90022	242500	6673	4	0	0	16	14:20	15:50
90023	242500	6680	4	0	0	16	14:20	15:50
90024	242500	6687	4	0	0	16	14:20	15:50
90025	242500	6694	4	0	0	16	14:20	15:50
90026	242500	6701	4	0	0	16	14:20	15:50
90027	242500	6708	4	0	0	16	14:20	15:50
90028	242500	6715	4	0	0	16	14:20	15:50
90029	242500	6722	4	0	0	16	14:20	15:50
90030	242500	6729	4	0	0	16	14:20	15:50
90031	242500	6625	2	0	1	16	10:40	12:10
90032	242500	6639	2	0	1	16	10:40	12:10
90033	242500	6653	2	0	1	16	10:40	12:10
90034	242500	6667	2	0	1	16	10:40	12:10
90035	242500	6681	2	0	1	16	10:40	12:10
90036	242500	6695	2	0	1	16	10:40	12:10
90037	242500	6709	2	0	1	16	10:40	12:10
90038	242500	6723	2	0	1	16	10:40	12:10
90039	242500	6620	3	0	1	15	12:40	14:10
90040	242500	6627	3	0	1	15	12:40	14:10
90041	242500	6634	3	0	1	15	12:40	14:10
90042	242500	6641	3	0	1	15	12:40	14:10
90043	242500	6648	3	0	1	15	12:40	14:10
90044	242500	6655	3	0	1	15	12:40	14:10
90045	242500	6662	3	0	1	15	12:40	14:10
90046	242500	6669	3	0	1	15	12:40	14:10
90047	242500	6676	3	0	1	15	12:40	14:10
90048	242500	6683	3	0	1	15	12:40	14:10
90049	242500	6690	3	0	1	15	12:40	14:10
90050	242500	6697	3	0	1	15	12:40	14:10
90051	242500	6704	3	0	1	15	12:40	14:10
90052	242500	6711	3	0	1	15	12:40	14:10
90053	242500	6718	3	0	1	15	12:40	14:10
90054	242500	6725	3	0	1	15	12:40	14:10
90055	242500	6620	4	0	1	14	14:20	15:50
90056	242500	6627	4	0	1	14	14:20	15:50
90057	242500	6634	4	0	1	14	14:20	15:50
90058	242500	6641	4	0	1	14	14:20	15:50
90059	242500	6648	4	0	1	14	14:20	15:50
90060	242500	6655	4	0	1	14	14:20	15:50
90061	242500	6662	4	0	1	14	14:20	15:50
90062	242500	6669	4	0	1	14	14:20	15:50
90063	242500	6676	4	0	1	14	14:20	15:50
90064	242500	6683	4	0	1	14	14:20	15:50
90065	242500	6690	4	0	1	14	14:20	15:50
90066	242500	6697	4	0	1	14	14:20	15:50
90067	242500	6704	4	0	1	14	14:20	15:50
90068	242500	6711	4	0	1	14	14:20	15:50
90069	242500	6718	4	0	1	14	14:20	15:50
90070	242500	6725	4	0	1	14	14:20	15:50
90071	242500	6620	5	0	0	9	16:20	17:50
90072	242500	6627	5	0	0	9	16:20	17:50
90073	242500	6634	5	0	0	9	16:20	17:50
90074	242500	6641	5	0	0	9	16:20	17:50
90075	242500	6648	5	0	0	9	16:20	17:50
90076	242500	6655	5	0	0	9	16:20	17:50
90077	242500	6662	5	0	0	9	16:20	17:50
90078	242500	6669	5	0	0	9	16:20	17:50
90079	242500	6676	5	0	0	9	16:20	17:50
90080	242500	6683	5	0	0	9	16:20	17:50
90081	242500	6690	5	0	0	9	16:20	17:50
90082	242500	6697	5	0	0	9	16:20	17:50
90083	242500	6704	5	0	0	9	16:20	17:50
90084	242500	6711	5	0	0	9	16:20	17:50
90085	242500	6718	5	0	0	9	16:20	17:50
90086	242500	6725	5	0	0	9	16:20	17:50
90087	242500	6621	1	0	1	20	09:00	10:30
90088	242500	6628	1	0	1	20	09:00	10:30
90089	242500	6635	1	0	1	20	09:00	10:30
90090	242500	6642	1	0	1	20	09:00	10:30
90091	242500	6649	1	0	1	20	09:00	10:30
90092	242500	6656	1	0	1	20	09:00	10:30
90093	242500	6663	1	0	1	20	09:00	10:30
90094	242500	6670	1	0	1	20	09:00	10:30
90095	242500	6677	1	0	1	20	09:00	10:30
90096	242500	6684	1	0	1	20	09:00	10:30
90097	242500	6691	1	0	1	20	09:00	10:30
90098	242500	6698	1	0	1	20	09:00	10:30
90099	242500	6705	1	0	1	20	09:00	10:30
90100	242500	6712	1	0	1	20	09:00	10:30
90101	242500	6719	1	0	1	20	09:00	10:30
90102	242500	6726	1	0	1	20	09:00	10:30
90103	242500	6621	2	0	1	1	10:40	12:10
90104	242500	6628	2	0	1	1	10:40	12:10
90105	242500	6635	2	0	1	1	10:40	12:10
90106	242500	6642	2	0	1	1	10:40	12:10
90107	242500	6649	2	0	1	1	10:40	12:10
90108	242500	6656	2	0	1	1	10:40	12:10
90109	242500	6663	2	0	1	1	10:40	12:10
90110	242500	6670	2	0	1	1	10:40	12:10
90111	242500	6677	2	0	1	1	10:40	12:10
90112	242500	6684	2	0	1	1	10:40	12:10
90113	242500	6691	2	0	1	1	10:40	12:10
90114	242500	6698	2	0	1	1	10:40	12:10
90115	242500	6705	2	0	1	1	10:40	12:10
90116	242500	6712	2	0	1	1	10:40	12:10
90117	242500	6719	2	0	1	1	10:40	12:10
90118	242500	6726	2	0	1	1	10:40	12:10
90119	242500	6622	1	0	0	17	09:00	10:30
90120	242500	6629	1	0	0	17	09:00	10:30
90121	242500	6636	1	0	0	17	09:00	10:30
90122	242500	6643	1	0	0	17	09:00	10:30
90123	242500	6650	1	0	0	17	09:00	10:30
90124	242500	6657	1	0	0	17	09:00	10:30
90125	242500	6664	1	0	0	17	09:00	10:30
90126	242500	6671	1	0	0	17	09:00	10:30
90127	242500	6678	1	0	0	17	09:00	10:30
90128	242500	6685	1	0	0	17	09:00	10:30
90129	242500	6692	1	0	0	17	09:00	10:30
90130	242500	6699	1	0	0	17	09:00	10:30
90131	242500	6706	1	0	0	17	09:00	10:30
90132	242500	6713	1	0	0	17	09:00	10:30
90133	242500	6720	1	0	0	17	09:00	10:30
90134	242500	6727	1	0	0	17	09:00	10:30
90135	242500	6622	2	0	0	2	10:40	12:10
90136	242500	6629	2	0	0	2	10:40	12:10
90137	242500	6636	2	0	0	2	10:40	12:10
90138	242500	6643	2	0	0	2	10:40	12:10
90139	242500	6650	2	0	0	2	10:40	12:10
90140	242500	6657	2	0	0	2	10:40	12:10
90141	242500	6664	2	0	0	2	10:40	12:10
90142	242500	6671	2	0	0	2	10:40	12:10
90143	242500	6678	2	0	0	2	10:40	12:10
90144	242500	6685	2	0	0	2	10:40	12:10
90145	242500	6692	2	0	0	2	10:40	12:10
90146	242500	6699	2	0	0	2	10:40	12:10
90147	242500	6706	2	0	0	2	10:40	12:10
90148	242500	6713	2	0	0	2	10:40	12:10
90149	242500	6720	2	0	0	2	10:40	12:10
90150	242500	6727	2	0	0	2	10:40	12:10
90151	242500	6622	3	0	0	21	12:40	14:10
90152	242500	6629	3	0	0	21	12:40	14:10
90153	242500	6636	3	0	0	21	12:40	14:10
90154	242500	6643	3	0	0	21	12:40	14:10
90155	242500	6650	3	0	0	21	12:40	14:10
90156	242500	6657	3	0	0	21	12:40	14:10
90157	242500	6664	3	0	0	21	12:40	14:10
90158	242500	6671	3	0	0	21	12:40	14:10
90159	242500	6678	3	0	0	21	12:40	14:10
90160	242500	6685	3	0	0	21	12:40	14:10
90161	242500	6692	3	0	0	21	12:40	14:10
90162	242500	6699	3	0	0	21	12:40	14:10
90163	242500	6706	3	0	0	21	12:40	14:10
90164	242500	6713	3	0	0	21	12:40	14:10
90165	242500	6720	3	0	0	21	12:40	14:10
90166	242500	6727	3	0	0	21	12:40	14:10
90167	242500	6622	4	0	0	14	14:20	15:50
90168	242500	6629	4	0	0	14	14:20	15:50
90169	242500	6636	4	0	0	14	14:20	15:50
90170	242500	6643	4	0	0	14	14:20	15:50
90171	242500	6650	4	0	0	14	14:20	15:50
90172	242500	6657	4	0	0	14	14:20	15:50
90173	242500	6664	4	0	0	14	14:20	15:50
90174	242500	6671	4	0	0	14	14:20	15:50
90175	242500	6678	4	0	0	14	14:20	15:50
90176	242500	6685	4	0	0	14	14:20	15:50
90177	242500	6692	4	0	0	14	14:20	15:50
90178	242500	6699	4	0	0	14	14:20	15:50
90179	242500	6706	4	0	0	14	14:20	15:50
90180	242500	6713	4	0	0	14	14:20	15:50
90181	242500	6720	4	0	0	14	14:20	15:50
90182	242500	6727	4	0	0	14	14:20	15:50
90183	242500	6629	5	0	0	18	16:20	17:50
90184	242500	6643	5	0	0	18	16:20	17:50
90185	242500	6657	5	0	0	18	16:20	17:50
90186	242500	6671	5	0	0	18	16:20	17:50
90187	242500	6685	5	0	0	18	16:20	17:50
90188	242500	6699	5	0	0	18	16:20	17:50
90189	242500	6713	5	0	0	18	16:20	17:50
90190	242500	6727	5	0	0	18	16:20	17:50
90191	242500	6623	1	0	1	18	09:00	10:30
90192	242500	6637	1	0	1	18	09:00	10:30
90193	242500	6651	1	0	1	18	09:00	10:30
90194	242500	6665	1	0	1	18	09:00	10:30
90195	242500	6679	1	0	1	18	09:00	10:30
90196	242500	6693	1	0	1	18	09:00	10:30
90197	242500	6707	1	0	1	18	09:00	10:30
90198	242500	6721	1	0	1	18	09:00	10:30
90199	242500	6623	2	0	1	2	10:40	12:10
90200	242500	6637	2	0	1	2	10:40	12:10
90201	242500	6651	2	0	1	2	10:40	12:10
90202	242500	6665	2	0	1	2	10:40	12:10
90203	242500	6679	2	0	1	2	10:40	12:10
90204	242500	6693	2	0	1	2	10:40	12:10
90205	242500	6707	2	0	1	2	10:40	12:10
90206	242500	6721	2	0	1	2	10:40	12:10
90207	242500	6630	2	0	1	17	10:40	12:10
90208	242500	6644	2	0	1	17	10:40	12:10
90209	242500	6658	2	0	1	17	10:40	12:10
90210	242500	6672	2	0	1	17	10:40	12:10
90211	242500	6686	2	0	1	17	10:40	12:10
90212	242500	6700	2	0	1	17	10:40	12:10
90213	242500	6714	2	0	1	17	10:40	12:10
90214	242500	6728	2	0	1	17	10:40	12:10
90215	242500	6623	3	0	0	20	12:40	14:10
90216	242500	6630	3	0	0	20	12:40	14:10
90217	242500	6637	3	0	0	20	12:40	14:10
90218	242500	6644	3	0	0	20	12:40	14:10
90219	242500	6651	3	0	0	20	12:40	14:10
90220	242500	6658	3	0	0	20	12:40	14:10
90221	242500	6665	3	0	0	20	12:40	14:10
90222	242500	6672	3	0	0	20	12:40	14:10
90223	242500	6679	3	0	0	20	12:40	14:10
90224	242500	6686	3	0	0	20	12:40	14:10
90225	242500	6693	3	0	0	20	12:40	14:10
90226	242500	6700	3	0	0	20	12:40	14:10
90227	242500	6707	3	0	0	20	12:40	14:10
90228	242500	6714	3	0	0	20	12:40	14:10
90229	242500	6721	3	0	0	20	12:40	14:10
90230	242500	6728	3	0	0	20	12:40	14:10
90231	242500	6623	4	0	0	8	14:20	15:50
90232	242500	6630	4	0	0	8	14:20	15:50
90233	242500	6637	4	0	0	8	14:20	15:50
90234	242500	6644	4	0	0	8	14:20	15:50
90235	242500	6651	4	0	0	8	14:20	15:50
90236	242500	6658	4	0	0	8	14:20	15:50
90237	242500	6665	4	0	0	8	14:20	15:50
90238	242500	6672	4	0	0	8	14:20	15:50
90239	242500	6679	4	0	0	8	14:20	15:50
90240	242500	6686	4	0	0	8	14:20	15:50
90241	242500	6693	4	0	0	8	14:20	15:50
90242	242500	6700	4	0	0	8	14:20	15:50
90243	242500	6707	4	0	0	8	14:20	15:50
90244	242500	6714	4	0	0	8	14:20	15:50
90245	242500	6721	4	0	0	8	14:20	15:50
90246	242500	6728	4	0	0	8	14:20	15:50
90247	242500	6624	1	0	0	16	09:00	10:30
90248	242500	6631	1	0	0	16	09:00	10:30
90249	242500	6638	1	0	0	16	09:00	10:30
90250	242500	6645	1	0	0	16	09:00	10:30
90251	242500	6652	1	0	0	16	09:00	10:30
90252	242500	6659	1	0	0	16	09:00	10:30
90253	242500	6666	1	0	0	16	09:00	10:30
90254	242500	6673	1	0	0	16	09:00	10:30
90255	242500	6680	1	0	0	16	09:00	10:30
90256	242500	6687	1	0	0	16	09:00	10:30
90257	242500	6694	1	0	0	16	09:00	10:30
90258	242500	6701	1	0	0	16	09:00	10:30
90259	242500	6708	1	0	0	16	09:00	10:30
90260	242500	6715	1	0	0	16	09:00	10:30
90261	242500	6722	1	0	0	16	09:00	10:30
90262	242500	6729	1	0	0	16	09:00	10:30
90263	242500	6624	2	0	0	1	10:40	12:10
90264	242500	6638	2	0	0	1	10:40	12:10
90265	242500	6652	2	0	0	1	10:40	12:10
90266	242500	6666	2	0	0	1	10:40	12:10
90267	242500	6680	2	0	0	1	10:40	12:10
90268	242500	6694	2	0	0	1	10:40	12:10
90269	242500	6708	2	0	0	1	10:40	12:10
90270	242500	6722	2	0	0	1	10:40	12:10
90271	242500	6624	3	0	1	19	12:40	14:10
90272	242500	6631	3	0	1	19	12:40	14:10
90273	242500	6638	3	0	1	19	12:40	14:10
90274	242500	6645	3	0	1	19	12:40	14:10
90275	242500	6652	3	0	1	19	12:40	14:10
90276	242500	6659	3	0	1	19	12:40	14:10
90277	242500	6666	3	0	1	19	12:40	14:10
90278	242500	6673	3	0	1	19	12:40	14:10
90279	242500	6680	3	0	1	19	12:40	14:10
90280	242500	6687	3	0	1	19	12:40	14:10
90281	242500	6694	3	0	1	19	12:40	14:10
90282	242500	6701	3	0	1	19	12:40	14:10
90283	242500	6708	3	0	1	19	12:40	14:10
90284	242500	6715	3	0	1	19	12:40	14:10
90285	242500	6722	3	0	1	19	12:40	14:10
90286	242500	6729	3	0	1	19	12:40	14:10
90287	242500	6624	4	0	0	15	14:20	15:50
90288	242500	6631	4	0	0	15	14:20	15:50
90289	242500	6638	4	0	0	15	14:20	15:50
90290	242500	6645	4	0	0	15	14:20	15:50
90291	242500	6652	4	0	0	15	14:20	15:50
90292	242500	6659	4	0	0	15	14:20	15:50
90293	242500	6666	4	0	0	15	14:20	15:50
90294	242500	6673	4	0	0	15	14:20	15:50
90295	242500	6680	4	0	0	15	14:20	15:50
90296	242500	6687	4	0	0	15	14:20	15:50
90297	242500	6694	4	0	0	15	14:20	15:50
90298	242500	6701	4	0	0	15	14:20	15:50
90299	242500	6708	4	0	0	15	14:20	15:50
90300	242500	6715	4	0	0	15	14:20	15:50
90301	242500	6722	4	0	0	15	14:20	15:50
90302	242500	6729	4	0	0	15	14:20	15:50
90303	242500	6624	5	0	0	16	16:20	17:50
90304	242500	6631	5	0	0	16	16:20	17:50
90305	242500	6638	5	0	0	16	16:20	17:50
90306	242500	6645	5	0	0	16	16:20	17:50
90307	242500	6652	5	0	0	16	16:20	17:50
90308	242500	6659	5	0	0	16	16:20	17:50
90309	242500	6666	5	0	0	16	16:20	17:50
90310	242500	6673	5	0	0	16	16:20	17:50
90311	242500	6680	5	0	0	16	16:20	17:50
90312	242500	6687	5	0	0	16	16:20	17:50
90313	242500	6694	5	0	0	16	16:20	17:50
90314	242500	6701	5	0	0	16	16:20	17:50
90315	242500	6708	5	0	0	16	16:20	17:50
90316	242500	6715	5	0	0	16	16:20	17:50
90317	242500	6722	5	0	0	16	16:20	17:50
90318	242500	6729	5	0	0	16	16:20	17:50
90319	242500	6625	2	0	1	16	10:40	12:10
90320	242500	6639	2	0	1	16	10:40	12:10
90321	242500	6653	2	0	1	16	10:40	12:10
90322	242500	6667	2	0	1	16	10:40	12:10
90323	242500	6681	2	0	1	16	10:40	12:10
90324	242500	6695	2	0	1	16	10:40	12:10
90325	242500	6709	2	0	1	16	10:40	12:10
90326	242500	6723	2	0	1	16	10:40	12:10
90327	242500	6627	1	0	0	22	09:00	10:30
90328	242500	6627	2	0	0	22	10:40	12:10
90329	242500	6627	3	0	0	22	12:40	14:10
90330	242500	6627	4	0	0	22	14:20	15:50
90331	242500	6620	6	0	1	23	18:00	19:30
90332	242500	6634	6	0	1	23	18:00	19:30
90333	242500	6648	6	0	1	23	18:00	19:30
90334	242500	6662	6	0	1	23	18:00	19:30
90335	242500	6676	6	0	1	23	18:00	19:30
90336	242500	6690	6	0	1	23	18:00	19:30
90337	242500	6704	6	0	1	23	18:00	19:30
90338	242500	6718	6	0	1	23	18:00	19:30
90339	242500	6621	3	0	0	24	12:40	14:10
90340	242500	6628	3	0	0	24	12:40	14:10
90341	242500	6635	3	0	0	24	12:40	14:10
90342	242500	6642	3	0	0	24	12:40	14:10
90343	242500	6649	3	0	0	24	12:40	14:10
90344	242500	6656	3	0	0	24	12:40	14:10
90345	242500	6663	3	0	0	24	12:40	14:10
90346	242500	6670	3	0	0	24	12:40	14:10
90347	242500	6677	3	0	0	24	12:40	14:10
90348	242500	6684	3	0	0	24	12:40	14:10
90349	242500	6691	3	0	0	24	12:40	14:10
90350	242500	6698	3	0	0	24	12:40	14:10
90351	242500	6705	3	0	0	24	12:40	14:10
90352	242500	6712	3	0	0	24	12:40	14:10
90353	242500	6719	3	0	0	24	12:40	14:10
90354	242500	6726	3	0	0	24	12:40	14:10
90355	242500	6621	4	0	1	24	14:20	15:50
90356	242500	6628	4	0	1	24	14:20	15:50
90357	242500	6635	4	0	1	24	14:20	15:50
90358	242500	6642	4	0	1	24	14:20	15:50
90359	242500	6649	4	0	1	24	14:20	15:50
90360	242500	6656	4	0	1	24	14:20	15:50
90361	242500	6663	4	0	1	24	14:20	15:50
90362	242500	6670	4	0	1	24	14:20	15:50
90363	242500	6677	4	0	1	24	14:20	15:50
90364	242500	6684	4	0	1	24	14:20	15:50
90365	242500	6691	4	0	1	24	14:20	15:50
90366	242500	6698	4	0	1	24	14:20	15:50
90367	242500	6705	4	0	1	24	14:20	15:50
90368	242500	6712	4	0	1	24	14:20	15:50
90369	242500	6719	4	0	1	24	14:20	15:50
90370	242500	6726	4	0	1	24	14:20	15:50
90371	242500	6629	1	0	1	25	09:00	10:30
90372	242500	6643	1	0	1	25	09:00	10:30
90373	242500	6657	1	0	1	25	09:00	10:30
90374	242500	6671	1	0	1	25	09:00	10:30
90375	242500	6685	1	0	1	25	09:00	10:30
90376	242500	6699	1	0	1	25	09:00	10:30
90377	242500	6713	1	0	1	25	09:00	10:30
90378	242500	6727	1	0	1	25	09:00	10:30
90379	242500	6622	2	0	0	26	10:40	12:10
90380	242500	6636	2	0	0	26	10:40	12:10
90381	242500	6650	2	0	0	26	10:40	12:10
90382	242500	6664	2	0	0	26	10:40	12:10
90383	242500	6678	2	0	0	26	10:40	12:10
90384	242500	6692	2	0	0	26	10:40	12:10
90385	242500	6706	2	0	0	26	10:40	12:10
90386	242500	6720	2	0	0	26	10:40	12:10
90387	242500	6629	2	0	0	26	10:40	12:10
90388	242500	6643	2	0	0	26	10:40	12:10
90389	242500	6657	2	0	0	26	10:40	12:10
90390	242500	6671	2	0	0	26	10:40	12:10
90391	242500	6685	2	0	0	26	10:40	12:10
90392	242500	6699	2	0	0	26	10:40	12:10
90393	242500	6713	2	0	0	26	10:40	12:10
90394	242500	6727	2	0	0	26	10:40	12:10
90395	242500	6622	3	0	0	26	12:40	14:10
90396	242500	6636	3	0	0	26	12:40	14:10
90397	242500	6650	3	0	0	26	12:40	14:10
90398	242500	6664	3	0	0	26	12:40	14:10
90399	242500	6678	3	0	0	26	12:40	14:10
90400	242500	6692	3	0	0	26	12:40	14:10
90401	242500	6706	3	0	0	26	12:40	14:10
90402	242500	6720	3	0	0	26	12:40	14:10
90403	242500	6629	3	0	0	26	12:40	14:10
90404	242500	6643	3	0	0	26	12:40	14:10
90405	242500	6657	3	0	0	26	12:40	14:10
90406	242500	6671	3	0	0	26	12:40	14:10
90407	242500	6685	3	0	0	26	12:40	14:10
90408	242500	6699	3	0	0	26	12:40	14:10
90409	242500	6713	3	0	0	26	12:40	14:10
90410	242500	6727	3	0	0	26	12:40	14:10
90411	242500	6622	4	0	0	27	14:20	15:50
90412	242500	6636	4	0	0	27	14:20	15:50
90413	242500	6650	4	0	0	27	14:20	15:50
90414	242500	6664	4	0	0	27	14:20	15:50
90415	242500	6678	4	0	0	27	14:20	15:50
90416	242500	6692	4	0	0	27	14:20	15:50
90417	242500	6706	4	0	0	27	14:20	15:50
90418	242500	6720	4	0	0	27	14:20	15:50
90419	242500	6622	5	0	0	27	16:20	17:50
90420	242500	6636	5	0	0	27	16:20	17:50
90421	242500	6650	5	0	0	27	16:20	17:50
90422	242500	6664	5	0	0	27	16:20	17:50
90423	242500	6678	5	0	0	27	16:20	17:50
90424	242500	6692	5	0	0	27	16:20	17:50
90425	242500	6706	5	0	0	27	16:20	17:50
90426	242500	6720	5	0	0	27	16:20	17:50
90427	242500	6622	6	0	1	25	18:00	19:30
90428	242500	6636	6	0	1	25	18:00	19:30
90429	242500	6650	6	0	1	25	18:00	19:30
90430	242500	6664	6	0	1	25	18:00	19:30
90431	242500	6678	6	0	1	25	18:00	19:30
90432	242500	6692	6	0	1	25	18:00	19:30
90433	242500	6706	6	0	1	25	18:00	19:30
90434	242500	6720	6	0	1	25	18:00	19:30
90435	242500	6623	2	0	1	28	10:40	12:10
90436	242500	6630	2	0	1	28	10:40	12:10
90437	242500	6637	2	0	1	28	10:40	12:10
90438	242500	6644	2	0	1	28	10:40	12:10
90439	242500	6651	2	0	1	28	10:40	12:10
90440	242500	6658	2	0	1	28	10:40	12:10
90441	242500	6665	2	0	1	28	10:40	12:10
90442	242500	6672	2	0	1	28	10:40	12:10
90443	242500	6679	2	0	1	28	10:40	12:10
90444	242500	6686	2	0	1	28	10:40	12:10
90445	242500	6693	2	0	1	28	10:40	12:10
90446	242500	6700	2	0	1	28	10:40	12:10
90447	242500	6707	2	0	1	28	10:40	12:10
90448	242500	6714	2	0	1	28	10:40	12:10
90449	242500	6721	2	0	1	28	10:40	12:10
90450	242500	6728	2	0	1	28	10:40	12:10
90451	242500	6623	3	0	0	29	12:40	14:10
90452	242500	6630	3	0	0	29	12:40	14:10
90453	242500	6637	3	0	0	29	12:40	14:10
90454	242500	6644	3	0	0	29	12:40	14:10
90455	242500	6651	3	0	0	29	12:40	14:10
90456	242500	6658	3	0	0	29	12:40	14:10
90457	242500	6665	3	0	0	29	12:40	14:10
90458	242500	6672	3	0	0	29	12:40	14:10
90459	242500	6679	3	0	0	29	12:40	14:10
90460	242500	6686	3	0	0	29	12:40	14:10
90461	242500	6693	3	0	0	29	12:40	14:10
90462	242500	6700	3	0	0	29	12:40	14:10
90463	242500	6707	3	0	0	29	12:40	14:10
90464	242500	6714	3	0	0	29	12:40	14:10
90465	242500	6721	3	0	0	29	12:40	14:10
90466	242500	6728	3	0	0	29	12:40	14:10
90467	242500	6623	4	0	0	28	14:20	15:50
90468	242500	6637	4	0	0	28	14:20	15:50
90469	242500	6651	4	0	0	28	14:20	15:50
90470	242500	6665	4	0	0	28	14:20	15:50
90471	242500	6679	4	0	0	28	14:20	15:50
90472	242500	6693	4	0	0	28	14:20	15:50
90473	242500	6707	4	0	0	28	14:20	15:50
90474	242500	6721	4	0	0	28	14:20	15:50
90475	242500	6624	1	0	1	30	09:00	10:30
90476	242500	6638	1	0	1	30	09:00	10:30
90477	242500	6652	1	0	1	30	09:00	10:30
90478	242500	6666	1	0	1	30	09:00	10:30
90479	242500	6680	1	0	1	30	09:00	10:30
90480	242500	6694	1	0	1	30	09:00	10:30
90481	242500	6708	1	0	1	30	09:00	10:30
90482	242500	6722	1	0	1	30	09:00	10:30
90483	242500	6624	2	0	1	31	10:40	12:10
90484	242500	6631	2	0	1	31	10:40	12:10
90485	242500	6638	2	0	1	31	10:40	12:10
90486	242500	6645	2	0	1	31	10:40	12:10
90487	242500	6652	2	0	1	31	10:40	12:10
90488	242500	6659	2	0	1	31	10:40	12:10
90489	242500	6666	2	0	1	31	10:40	12:10
90490	242500	6673	2	0	1	31	10:40	12:10
90491	242500	6680	2	0	1	31	10:40	12:10
90492	242500	6687	2	0	1	31	10:40	12:10
90493	242500	6694	2	0	1	31	10:40	12:10
90494	242500	6701	2	0	1	31	10:40	12:10
90495	242500	6708	2	0	1	31	10:40	12:10
90496	242500	6715	2	0	1	31	10:40	12:10
90497	242500	6722	2	0	1	31	10:40	12:10
90498	242500	6729	2	0	1	31	10:40	12:10
90499	242500	6624	3	0	0	25	12:40	14:10
90500	242500	6631	3	0	0	25	12:40	14:10
90501	242500	6638	3	0	0	25	12:40	14:10
90502	242500	6645	3	0	0	25	12:40	14:10
90503	242500	6652	3	0	0	25	12:40	14:10
90504	242500	6659	3	0	0	25	12:40	14:10
90505	242500	6666	3	0	0	25	12:40	14:10
90506	242500	6673	3	0	0	25	12:40	14:10
90507	242500	6680	3	0	0	25	12:40	14:10
90508	242500	6687	3	0	0	25	12:40	14:10
90509	242500	6694	3	0	0	25	12:40	14:10
90510	242500	6701	3	0	0	25	12:40	14:10
90511	242500	6708	3	0	0	25	12:40	14:10
90512	242500	6715	3	0	0	25	12:40	14:10
90513	242500	6722	3	0	0	25	12:40	14:10
90514	242500	6729	3	0	0	25	12:40	14:10
90515	242500	6625	3	0	0	30	12:40	14:10
90516	242500	6632	3	0	0	30	12:40	14:10
90517	242500	6639	3	0	0	30	12:40	14:10
90518	242500	6646	3	0	0	30	12:40	14:10
90519	242500	6653	3	0	0	30	12:40	14:10
90520	242500	6660	3	0	0	30	12:40	14:10
90521	242500	6667	3	0	0	30	12:40	14:10
90522	242500	6674	3	0	0	30	12:40	14:10
90523	242500	6681	3	0	0	30	12:40	14:10
90524	242500	6688	3	0	0	30	12:40	14:10
90525	242500	6695	3	0	0	30	12:40	14:10
90526	242500	6702	3	0	0	30	12:40	14:10
90527	242500	6709	3	0	0	30	12:40	14:10
90528	242500	6716	3	0	0	30	12:40	14:10
90529	242500	6723	3	0	0	30	12:40	14:10
90530	242500	6730	3	0	0	30	12:40	14:10
90531	242500	6625	4	0	0	31	14:20	15:50
90532	242500	6632	4	0	0	31	14:20	15:50
90533	242500	6639	4	0	0	31	14:20	15:50
90534	242500	6646	4	0	0	31	14:20	15:50
90535	242500	6653	4	0	0	31	14:20	15:50
90536	242500	6660	4	0	0	31	14:20	15:50
90537	242500	6667	4	0	0	31	14:20	15:50
90538	242500	6674	4	0	0	31	14:20	15:50
90539	242500	6681	4	0	0	31	14:20	15:50
90540	242500	6688	4	0	0	31	14:20	15:50
90541	242500	6695	4	0	0	31	14:20	15:50
90542	242500	6702	4	0	0	31	14:20	15:50
90543	242500	6709	4	0	0	31	14:20	15:50
90544	242500	6716	4	0	0	31	14:20	15:50
90545	242500	6723	4	0	0	31	14:20	15:50
90546	242500	6730	4	0	0	31	14:20	15:50
90547	242500	6634	1	0	0	32	09:00	10:30
90548	242500	6634	2	0	0	32	10:40	12:10
90549	242500	6634	3	0	0	32	12:40	14:10
90550	242500	6634	4	0	0	32	14:20	15:50
90551	242500	6620	6	0	1	23	18:00	19:30
90552	242500	6634	6	0	1	23	18:00	19:30
90553	242500	6648	6	0	1	23	18:00	19:30
90554	242500	6662	6	0	1	23	18:00	19:30
90555	242500	6676	6	0	1	23	18:00	19:30
90556	242500	6690	6	0	1	23	18:00	19:30
90557	242500	6704	6	0	1	23	18:00	19:30
90558	242500	6718	6	0	1	23	18:00	19:30
90559	242500	6621	4	0	1	24	14:20	15:50
90560	242500	6628	4	0	1	24	14:20	15:50
90561	242500	6635	4	0	1	24	14:20	15:50
90562	242500	6642	4	0	1	24	14:20	15:50
90563	242500	6649	4	0	1	24	14:20	15:50
90564	242500	6656	4	0	1	24	14:20	15:50
90565	242500	6663	4	0	1	24	14:20	15:50
90566	242500	6670	4	0	1	24	14:20	15:50
90567	242500	6677	4	0	1	24	14:20	15:50
90568	242500	6684	4	0	1	24	14:20	15:50
90569	242500	6691	4	0	1	24	14:20	15:50
90570	242500	6698	4	0	1	24	14:20	15:50
90571	242500	6705	4	0	1	24	14:20	15:50
90572	242500	6712	4	0	1	24	14:20	15:50
90573	242500	6719	4	0	1	24	14:20	15:50
90574	242500	6726	4	0	1	24	14:20	15:50
90575	242500	6629	1	0	1	25	09:00	10:30
90576	242500	6643	1	0	1	25	09:00	10:30
90577	242500	6657	1	0	1	25	09:00	10:30
90578	242500	6671	1	0	1	25	09:00	10:30
90579	242500	6685	1	0	1	25	09:00	10:30
90580	242500	6699	1	0	1	25	09:00	10:30
90581	242500	6713	1	0	1	25	09:00	10:30
90582	242500	6727	1	0	1	25	09:00	10:30
90583	242500	6622	2	0	0	26	10:40	12:10
90584	242500	6636	2	0	0	26	10:40	12:10
90585	242500	6650	2	0	0	26	10:40	12:10
90586	242500	6664	2	0	0	26	10:40	12:10
90587	242500	6678	2	0	0	26	10:40	12:10
90588	242500	6692	2	0	0	26	10:40	12:10
90589	242500	6706	2	0	0	26	10:40	12:10
90590	242500	6720	2	0	0	26	10:40	12:10
90591	242500	6629	2	0	0	26	10:40	12:10
90592	242500	6643	2	0	0	26	10:40	12:10
90593	242500	6657	2	0	0	26	10:40	12:10
90594	242500	6671	2	0	0	26	10:40	12:10
90595	242500	6685	2	0	0	26	10:40	12:10
90596	242500	6699	2	0	0	26	10:40	12:10
90597	242500	6713	2	0	0	26	10:40	12:10
90598	242500	6727	2	0	0	26	10:40	12:10
90599	242500	6622	3	0	0	26	12:40	14:10
90600	242500	6636	3	0	0	26	12:40	14:10
90601	242500	6650	3	0	0	26	12:40	14:10
90602	242500	6664	3	0	0	26	12:40	14:10
90603	242500	6678	3	0	0	26	12:40	14:10
90604	242500	6692	3	0	0	26	12:40	14:10
90605	242500	6706	3	0	0	26	12:40	14:10
90606	242500	6720	3	0	0	26	12:40	14:10
90607	242500	6629	3	0	0	26	12:40	14:10
90608	242500	6643	3	0	0	26	12:40	14:10
90609	242500	6657	3	0	0	26	12:40	14:10
90610	242500	6671	3	0	0	26	12:40	14:10
90611	242500	6685	3	0	0	26	12:40	14:10
90612	242500	6699	3	0	0	26	12:40	14:10
90613	242500	6713	3	0	0	26	12:40	14:10
90614	242500	6727	3	0	0	26	12:40	14:10
90615	242500	6622	4	0	0	27	14:20	15:50
90616	242500	6636	4	0	0	27	14:20	15:50
90617	242500	6650	4	0	0	27	14:20	15:50
90618	242500	6664	4	0	0	27	14:20	15:50
90619	242500	6678	4	0	0	27	14:20	15:50
90620	242500	6692	4	0	0	27	14:20	15:50
90621	242500	6706	4	0	0	27	14:20	15:50
90622	242500	6720	4	0	0	27	14:20	15:50
90623	242500	6622	5	0	0	27	16:20	17:50
90624	242500	6636	5	0	0	27	16:20	17:50
90625	242500	6650	5	0	0	27	16:20	17:50
90626	242500	6664	5	0	0	27	16:20	17:50
90627	242500	6678	5	0	0	27	16:20	17:50
90628	242500	6692	5	0	0	27	16:20	17:50
90629	242500	6706	5	0	0	27	16:20	17:50
90630	242500	6720	5	0	0	27	16:20	17:50
90631	242500	6622	6	0	1	25	18:00	19:30
90632	242500	6636	6	0	1	25	18:00	19:30
90633	242500	6650	6	0	1	25	18:00	19:30
90634	242500	6664	6	0	1	25	18:00	19:30
90635	242500	6678	6	0	1	25	18:00	19:30
90636	242500	6692	6	0	1	25	18:00	19:30
90637	242500	6706	6	0	1	25	18:00	19:30
90638	242500	6720	6	0	1	25	18:00	19:30
90639	242500	6623	2	0	1	28	10:40	12:10
90640	242500	6630	2	0	1	28	10:40	12:10
90641	242500	6637	2	0	1	28	10:40	12:10
90642	242500	6644	2	0	1	28	10:40	12:10
90643	242500	6651	2	0	1	28	10:40	12:10
90644	242500	6658	2	0	1	28	10:40	12:10
90645	242500	6665	2	0	1	28	10:40	12:10
90646	242500	6672	2	0	1	28	10:40	12:10
90647	242500	6679	2	0	1	28	10:40	12:10
90648	242500	6686	2	0	1	28	10:40	12:10
90649	242500	6693	2	0	1	28	10:40	12:10
90650	242500	6700	2	0	1	28	10:40	12:10
90651	242500	6707	2	0	1	28	10:40	12:10
90652	242500	6714	2	0	1	28	10:40	12:10
90653	242500	6721	2	0	1	28	10:40	12:10
90654	242500	6728	2	0	1	28	10:40	12:10
90655	242500	6623	3	0	0	29	12:40	14:10
90656	242500	6630	3	0	0	29	12:40	14:10
90657	242500	6637	3	0	0	29	12:40	14:10
90658	242500	6644	3	0	0	29	12:40	14:10
90659	242500	6651	3	0	0	29	12:40	14:10
90660	242500	6658	3	0	0	29	12:40	14:10
90661	242500	6665	3	0	0	29	12:40	14:10
90662	242500	6672	3	0	0	29	12:40	14:10
90663	242500	6679	3	0	0	29	12:40	14:10
90664	242500	6686	3	0	0	29	12:40	14:10
90665	242500	6693	3	0	0	29	12:40	14:10
90666	242500	6700	3	0	0	29	12:40	14:10
90667	242500	6707	3	0	0	29	12:40	14:10
90668	242500	6714	3	0	0	29	12:40	14:10
90669	242500	6721	3	0	0	29	12:40	14:10
90670	242500	6728	3	0	0	29	12:40	14:10
90671	242500	6630	4	0	0	28	14:20	15:50
90672	242500	6644	4	0	0	28	14:20	15:50
90673	242500	6658	4	0	0	28	14:20	15:50
90674	242500	6672	4	0	0	28	14:20	15:50
90675	242500	6686	4	0	0	28	14:20	15:50
90676	242500	6700	4	0	0	28	14:20	15:50
90677	242500	6714	4	0	0	28	14:20	15:50
90678	242500	6728	4	0	0	28	14:20	15:50
90679	242500	6624	1	0	1	30	09:00	10:30
90680	242500	6638	1	0	1	30	09:00	10:30
90681	242500	6652	1	0	1	30	09:00	10:30
90682	242500	6666	1	0	1	30	09:00	10:30
90683	242500	6680	1	0	1	30	09:00	10:30
90684	242500	6694	1	0	1	30	09:00	10:30
90685	242500	6708	1	0	1	30	09:00	10:30
90686	242500	6722	1	0	1	30	09:00	10:30
90687	242500	6624	2	0	1	31	10:40	12:10
90688	242500	6631	2	0	1	31	10:40	12:10
90689	242500	6638	2	0	1	31	10:40	12:10
90690	242500	6645	2	0	1	31	10:40	12:10
90691	242500	6652	2	0	1	31	10:40	12:10
90692	242500	6659	2	0	1	31	10:40	12:10
90693	242500	6666	2	0	1	31	10:40	12:10
90694	242500	6673	2	0	1	31	10:40	12:10
90695	242500	6680	2	0	1	31	10:40	12:10
90696	242500	6687	2	0	1	31	10:40	12:10
90697	242500	6694	2	0	1	31	10:40	12:10
90698	242500	6701	2	0	1	31	10:40	12:10
90699	242500	6708	2	0	1	31	10:40	12:10
90700	242500	6715	2	0	1	31	10:40	12:10
90701	242500	6722	2	0	1	31	10:40	12:10
90702	242500	6729	2	0	1	31	10:40	12:10
90703	242500	6624	3	0	0	24	12:40	14:10
90704	242500	6631	3	0	0	24	12:40	14:10
90705	242500	6638	3	0	0	24	12:40	14:10
90706	242500	6645	3	0	0	24	12:40	14:10
90707	242500	6652	3	0	0	24	12:40	14:10
90708	242500	6659	3	0	0	24	12:40	14:10
90709	242500	6666	3	0	0	24	12:40	14:10
90710	242500	6673	3	0	0	24	12:40	14:10
90711	242500	6680	3	0	0	24	12:40	14:10
90712	242500	6687	3	0	0	24	12:40	14:10
90713	242500	6694	3	0	0	24	12:40	14:10
90714	242500	6701	3	0	0	24	12:40	14:10
90715	242500	6708	3	0	0	24	12:40	14:10
90716	242500	6715	3	0	0	24	12:40	14:10
90717	242500	6722	3	0	0	24	12:40	14:10
90718	242500	6729	3	0	0	24	12:40	14:10
90719	242500	6624	4	0	0	25	14:20	15:50
90720	242500	6631	4	0	0	25	14:20	15:50
90721	242500	6638	4	0	0	25	14:20	15:50
90722	242500	6645	4	0	0	25	14:20	15:50
90723	242500	6652	4	0	0	25	14:20	15:50
90724	242500	6659	4	0	0	25	14:20	15:50
90725	242500	6666	4	0	0	25	14:20	15:50
90726	242500	6673	4	0	0	25	14:20	15:50
90727	242500	6680	4	0	0	25	14:20	15:50
90728	242500	6687	4	0	0	25	14:20	15:50
90729	242500	6694	4	0	0	25	14:20	15:50
90730	242500	6701	4	0	0	25	14:20	15:50
90731	242500	6708	4	0	0	25	14:20	15:50
90732	242500	6715	4	0	0	25	14:20	15:50
90733	242500	6722	4	0	0	25	14:20	15:50
90734	242500	6729	4	0	0	25	14:20	15:50
90735	242500	6625	3	0	0	31	12:40	14:10
90736	242500	6632	3	0	0	31	12:40	14:10
90737	242500	6639	3	0	0	31	12:40	14:10
90738	242500	6646	3	0	0	31	12:40	14:10
90739	242500	6653	3	0	0	31	12:40	14:10
90740	242500	6660	3	0	0	31	12:40	14:10
90741	242500	6667	3	0	0	31	12:40	14:10
90742	242500	6674	3	0	0	31	12:40	14:10
90743	242500	6681	3	0	0	31	12:40	14:10
90744	242500	6688	3	0	0	31	12:40	14:10
90745	242500	6695	3	0	0	31	12:40	14:10
90746	242500	6702	3	0	0	31	12:40	14:10
90747	242500	6709	3	0	0	31	12:40	14:10
90748	242500	6716	3	0	0	31	12:40	14:10
90749	242500	6723	3	0	0	31	12:40	14:10
90750	242500	6730	3	0	0	31	12:40	14:10
90751	242500	6625	4	0	0	30	14:20	15:50
90752	242500	6632	4	0	0	30	14:20	15:50
90753	242500	6639	4	0	0	30	14:20	15:50
90754	242500	6646	4	0	0	30	14:20	15:50
90755	242500	6653	4	0	0	30	14:20	15:50
90756	242500	6660	4	0	0	30	14:20	15:50
90757	242500	6667	4	0	0	30	14:20	15:50
90758	242500	6674	4	0	0	30	14:20	15:50
90759	242500	6681	4	0	0	30	14:20	15:50
90760	242500	6688	4	0	0	30	14:20	15:50
90761	242500	6695	4	0	0	30	14:20	15:50
90762	242500	6702	4	0	0	30	14:20	15:50
90763	242500	6709	4	0	0	30	14:20	15:50
90764	242500	6716	4	0	0	30	14:20	15:50
90765	242500	6723	4	0	0	30	14:20	15:50
90766	242500	6730	4	0	0	30	14:20	15:50
90767	242500	6620	1	0	0	33	09:00	10:30
90768	242500	6627	1	0	0	33	09:00	10:30
90769	242500	6634	1	0	0	33	09:00	10:30
90770	242500	6641	1	0	0	33	09:00	10:30
90771	242500	6648	1	0	0	33	09:00	10:30
90772	242500	6655	1	0	0	33	09:00	10:30
90773	242500	6662	1	0	0	33	09:00	10:30
90774	242500	6669	1	0	0	33	09:00	10:30
90775	242500	6676	1	0	0	33	09:00	10:30
90776	242500	6683	1	0	0	33	09:00	10:30
90777	242500	6690	1	0	0	33	09:00	10:30
90778	242500	6697	1	0	0	33	09:00	10:30
90779	242500	6704	1	0	0	33	09:00	10:30
90780	242500	6711	1	0	0	33	09:00	10:30
90781	242500	6718	1	0	0	33	09:00	10:30
90782	242500	6725	1	0	0	33	09:00	10:30
90783	242500	6620	2	0	0	33	10:40	12:10
90784	242500	6627	2	0	0	33	10:40	12:10
90785	242500	6634	2	0	0	33	10:40	12:10
90786	242500	6641	2	0	0	33	10:40	12:10
90787	242500	6648	2	0	0	33	10:40	12:10
90788	242500	6655	2	0	0	33	10:40	12:10
90789	242500	6662	2	0	0	33	10:40	12:10
90790	242500	6669	2	0	0	33	10:40	12:10
90791	242500	6676	2	0	0	33	10:40	12:10
90792	242500	6683	2	0	0	33	10:40	12:10
90793	242500	6690	2	0	0	33	10:40	12:10
90794	242500	6697	2	0	0	33	10:40	12:10
90795	242500	6704	2	0	0	33	10:40	12:10
90796	242500	6711	2	0	0	33	10:40	12:10
90797	242500	6718	2	0	0	33	10:40	12:10
90798	242500	6725	2	0	0	33	10:40	12:10
90799	242500	6620	3	0	0	34	12:40	14:10
90800	242500	6627	3	0	0	34	12:40	14:10
90801	242500	6634	3	0	0	34	12:40	14:10
90802	242500	6641	3	0	0	34	12:40	14:10
90803	242500	6648	3	0	0	34	12:40	14:10
90804	242500	6655	3	0	0	34	12:40	14:10
90805	242500	6662	3	0	0	34	12:40	14:10
90806	242500	6669	3	0	0	34	12:40	14:10
90807	242500	6676	3	0	0	34	12:40	14:10
90808	242500	6683	3	0	0	34	12:40	14:10
90809	242500	6690	3	0	0	34	12:40	14:10
90810	242500	6697	3	0	0	34	12:40	14:10
90811	242500	6704	3	0	0	34	12:40	14:10
90812	242500	6711	3	0	0	34	12:40	14:10
90813	242500	6718	3	0	0	34	12:40	14:10
90814	242500	6725	3	0	0	34	12:40	14:10
90815	242500	6620	4	0	0	35	14:20	15:50
90816	242500	6634	4	0	0	35	14:20	15:50
90817	242500	6648	4	0	0	35	14:20	15:50
90818	242500	6662	4	0	0	35	14:20	15:50
90819	242500	6676	4	0	0	35	14:20	15:50
90820	242500	6690	4	0	0	35	14:20	15:50
90821	242500	6704	4	0	0	35	14:20	15:50
90822	242500	6718	4	0	0	35	14:20	15:50
90823	242500	6627	4	0	0	35	14:20	15:50
90824	242500	6641	4	0	0	35	14:20	15:50
90825	242500	6655	4	0	0	35	14:20	15:50
90826	242500	6669	4	0	0	35	14:20	15:50
90827	242500	6683	4	0	0	35	14:20	15:50
90828	242500	6697	4	0	0	35	14:20	15:50
90829	242500	6711	4	0	0	35	14:20	15:50
90830	242500	6725	4	0	0	35	14:20	15:50
90831	242500	6620	5	0	0	36	16:20	17:50
90832	242500	6634	5	0	0	36	16:20	17:50
90833	242500	6648	5	0	0	36	16:20	17:50
90834	242500	6662	5	0	0	36	16:20	17:50
90835	242500	6676	5	0	0	36	16:20	17:50
90836	242500	6690	5	0	0	36	16:20	17:50
90837	242500	6704	5	0	0	36	16:20	17:50
90838	242500	6718	5	0	0	36	16:20	17:50
90839	242500	6627	5	0	0	36	16:20	17:50
90840	242500	6641	5	0	0	36	16:20	17:50
90841	242500	6655	5	0	0	36	16:20	17:50
90842	242500	6669	5	0	0	36	16:20	17:50
90843	242500	6683	5	0	0	36	16:20	17:50
90844	242500	6697	5	0	0	36	16:20	17:50
90845	242500	6711	5	0	0	36	16:20	17:50
90846	242500	6725	5	0	0	36	16:20	17:50
90847	242500	6621	1	0	0	37	09:00	10:30
90848	242500	6628	1	0	0	37	09:00	10:30
90849	242500	6635	1	0	0	37	09:00	10:30
90850	242500	6642	1	0	0	37	09:00	10:30
90851	242500	6649	1	0	0	37	09:00	10:30
90852	242500	6656	1	0	0	37	09:00	10:30
90853	242500	6663	1	0	0	37	09:00	10:30
90854	242500	6670	1	0	0	37	09:00	10:30
90855	242500	6677	1	0	0	37	09:00	10:30
90856	242500	6684	1	0	0	37	09:00	10:30
90857	242500	6691	1	0	0	37	09:00	10:30
90858	242500	6698	1	0	0	37	09:00	10:30
90859	242500	6705	1	0	0	37	09:00	10:30
90860	242500	6712	1	0	0	37	09:00	10:30
90861	242500	6719	1	0	0	37	09:00	10:30
90862	242500	6726	1	0	0	37	09:00	10:30
90863	242500	6621	2	0	0	37	10:40	12:10
90864	242500	6628	2	0	0	37	10:40	12:10
90865	242500	6635	2	0	0	37	10:40	12:10
90866	242500	6642	2	0	0	37	10:40	12:10
90867	242500	6649	2	0	0	37	10:40	12:10
90868	242500	6656	2	0	0	37	10:40	12:10
90869	242500	6663	2	0	0	37	10:40	12:10
90870	242500	6670	2	0	0	37	10:40	12:10
90871	242500	6677	2	0	0	37	10:40	12:10
90872	242500	6684	2	0	0	37	10:40	12:10
90873	242500	6691	2	0	0	37	10:40	12:10
90874	242500	6698	2	0	0	37	10:40	12:10
90875	242500	6705	2	0	0	37	10:40	12:10
90876	242500	6712	2	0	0	37	10:40	12:10
90877	242500	6719	2	0	0	37	10:40	12:10
90878	242500	6726	2	0	0	37	10:40	12:10
90879	242500	6621	3	0	0	37	12:40	14:10
90880	242500	6628	3	0	0	37	12:40	14:10
90881	242500	6635	3	0	0	37	12:40	14:10
90882	242500	6642	3	0	0	37	12:40	14:10
90883	242500	6649	3	0	0	37	12:40	14:10
90884	242500	6656	3	0	0	37	12:40	14:10
90885	242500	6663	3	0	0	37	12:40	14:10
90886	242500	6670	3	0	0	37	12:40	14:10
90887	242500	6677	3	0	0	37	12:40	14:10
90888	242500	6684	3	0	0	37	12:40	14:10
90889	242500	6691	3	0	0	37	12:40	14:10
90890	242500	6698	3	0	0	37	12:40	14:10
90891	242500	6705	3	0	0	37	12:40	14:10
90892	242500	6712	3	0	0	37	12:40	14:10
90893	242500	6719	3	0	0	37	12:40	14:10
90894	242500	6726	3	0	0	37	12:40	14:10
90895	242500	6621	4	0	0	37	14:20	15:50
90896	242500	6628	4	0	0	37	14:20	15:50
90897	242500	6635	4	0	0	37	14:20	15:50
90898	242500	6642	4	0	0	37	14:20	15:50
90899	242500	6649	4	0	0	37	14:20	15:50
90900	242500	6656	4	0	0	37	14:20	15:50
90901	242500	6663	4	0	0	37	14:20	15:50
90902	242500	6670	4	0	0	37	14:20	15:50
90903	242500	6677	4	0	0	37	14:20	15:50
90904	242500	6684	4	0	0	37	14:20	15:50
90905	242500	6691	4	0	0	37	14:20	15:50
90906	242500	6698	4	0	0	37	14:20	15:50
90907	242500	6705	4	0	0	37	14:20	15:50
90908	242500	6712	4	0	0	37	14:20	15:50
90909	242500	6719	4	0	0	37	14:20	15:50
90910	242500	6726	4	0	0	37	14:20	15:50
90911	242500	6629	2	0	0	38	10:40	12:10
90912	242500	6643	2	0	0	38	10:40	12:10
90913	242500	6657	2	0	0	38	10:40	12:10
90914	242500	6671	2	0	0	38	10:40	12:10
90915	242500	6685	2	0	0	38	10:40	12:10
90916	242500	6699	2	0	0	38	10:40	12:10
90917	242500	6713	2	0	0	38	10:40	12:10
90918	242500	6727	2	0	0	38	10:40	12:10
90919	242500	6622	3	0	0	38	12:40	14:10
90920	242500	6636	3	0	0	38	12:40	14:10
90921	242500	6650	3	0	0	38	12:40	14:10
90922	242500	6664	3	0	0	38	12:40	14:10
90923	242500	6678	3	0	0	38	12:40	14:10
90924	242500	6692	3	0	0	38	12:40	14:10
90925	242500	6706	3	0	0	38	12:40	14:10
90926	242500	6720	3	0	0	38	12:40	14:10
90927	242500	6629	3	0	0	38	12:40	14:10
90928	242500	6643	3	0	0	38	12:40	14:10
90929	242500	6657	3	0	0	38	12:40	14:10
90930	242500	6671	3	0	0	38	12:40	14:10
90931	242500	6685	3	0	0	38	12:40	14:10
90932	242500	6699	3	0	0	38	12:40	14:10
90933	242500	6713	3	0	0	38	12:40	14:10
90934	242500	6727	3	0	0	38	12:40	14:10
90935	242500	6622	4	0	1	39	14:20	15:50
90936	242500	6629	4	0	1	39	14:20	15:50
90937	242500	6636	4	0	1	39	14:20	15:50
90938	242500	6643	4	0	1	39	14:20	15:50
90939	242500	6650	4	0	1	39	14:20	15:50
90940	242500	6657	4	0	1	39	14:20	15:50
90941	242500	6664	4	0	1	39	14:20	15:50
90942	242500	6671	4	0	1	39	14:20	15:50
90943	242500	6678	4	0	1	39	14:20	15:50
90944	242500	6685	4	0	1	39	14:20	15:50
90945	242500	6692	4	0	1	39	14:20	15:50
90946	242500	6699	4	0	1	39	14:20	15:50
90947	242500	6706	4	0	1	39	14:20	15:50
90948	242500	6713	4	0	1	39	14:20	15:50
90949	242500	6720	4	0	1	39	14:20	15:50
90950	242500	6727	4	0	1	39	14:20	15:50
90951	242500	6622	5	0	0	39	16:20	17:50
90952	242500	6629	5	0	0	39	16:20	17:50
90953	242500	6636	5	0	0	39	16:20	17:50
90954	242500	6643	5	0	0	39	16:20	17:50
90955	242500	6650	5	0	0	39	16:20	17:50
90956	242500	6657	5	0	0	39	16:20	17:50
90957	242500	6664	5	0	0	39	16:20	17:50
90958	242500	6671	5	0	0	39	16:20	17:50
90959	242500	6678	5	0	0	39	16:20	17:50
90960	242500	6685	5	0	0	39	16:20	17:50
90961	242500	6692	5	0	0	39	16:20	17:50
90962	242500	6699	5	0	0	39	16:20	17:50
90963	242500	6706	5	0	0	39	16:20	17:50
90964	242500	6713	5	0	0	39	16:20	17:50
90965	242500	6720	5	0	0	39	16:20	17:50
90966	242500	6727	5	0	0	39	16:20	17:50
90967	242500	6622	6	0	0	35	18:00	19:30
90968	242500	6636	6	0	0	35	18:00	19:30
90969	242500	6650	6	0	0	35	18:00	19:30
90970	242500	6664	6	0	0	35	18:00	19:30
90971	242500	6678	6	0	0	35	18:00	19:30
90972	242500	6692	6	0	0	35	18:00	19:30
90973	242500	6706	6	0	0	35	18:00	19:30
90974	242500	6720	6	0	0	35	18:00	19:30
90975	242500	6630	1	0	0	40	09:00	10:30
90976	242500	6644	1	0	0	40	09:00	10:30
90977	242500	6658	1	0	0	40	09:00	10:30
90978	242500	6672	1	0	0	40	09:00	10:30
90979	242500	6686	1	0	0	40	09:00	10:30
90980	242500	6700	1	0	0	40	09:00	10:30
90981	242500	6714	1	0	0	40	09:00	10:30
90982	242500	6728	1	0	0	40	09:00	10:30
90983	242500	6623	2	0	1	40	10:40	12:10
90984	242500	6637	2	0	1	40	10:40	12:10
90985	242500	6651	2	0	1	40	10:40	12:10
90986	242500	6665	2	0	1	40	10:40	12:10
90987	242500	6679	2	0	1	40	10:40	12:10
90988	242500	6693	2	0	1	40	10:40	12:10
90989	242500	6707	2	0	1	40	10:40	12:10
90990	242500	6721	2	0	1	40	10:40	12:10
90991	242500	6630	2	0	0	40	10:40	12:10
90992	242500	6644	2	0	0	40	10:40	12:10
90993	242500	6658	2	0	0	40	10:40	12:10
90994	242500	6672	2	0	0	40	10:40	12:10
90995	242500	6686	2	0	0	40	10:40	12:10
90996	242500	6700	2	0	0	40	10:40	12:10
90997	242500	6714	2	0	0	40	10:40	12:10
90998	242500	6728	2	0	0	40	10:40	12:10
90999	242500	6623	3	0	1	41	12:40	14:10
91000	242500	6630	3	0	1	41	12:40	14:10
91001	242500	6637	3	0	1	41	12:40	14:10
91002	242500	6644	3	0	1	41	12:40	14:10
91003	242500	6651	3	0	1	41	12:40	14:10
91004	242500	6658	3	0	1	41	12:40	14:10
91005	242500	6665	3	0	1	41	12:40	14:10
91006	242500	6672	3	0	1	41	12:40	14:10
91007	242500	6679	3	0	1	41	12:40	14:10
91008	242500	6686	3	0	1	41	12:40	14:10
91009	242500	6693	3	0	1	41	12:40	14:10
91010	242500	6700	3	0	1	41	12:40	14:10
91011	242500	6707	3	0	1	41	12:40	14:10
91012	242500	6714	3	0	1	41	12:40	14:10
91013	242500	6721	3	0	1	41	12:40	14:10
91014	242500	6728	3	0	1	41	12:40	14:10
91015	242500	6623	4	0	0	41	14:20	15:50
91016	242500	6630	4	0	0	41	14:20	15:50
91017	242500	6637	4	0	0	41	14:20	15:50
91018	242500	6644	4	0	0	41	14:20	15:50
91019	242500	6651	4	0	0	41	14:20	15:50
91020	242500	6658	4	0	0	41	14:20	15:50
91021	242500	6665	4	0	0	41	14:20	15:50
91022	242500	6672	4	0	0	41	14:20	15:50
91023	242500	6679	4	0	0	41	14:20	15:50
91024	242500	6686	4	0	0	41	14:20	15:50
91025	242500	6693	4	0	0	41	14:20	15:50
91026	242500	6700	4	0	0	41	14:20	15:50
91027	242500	6707	4	0	0	41	14:20	15:50
91028	242500	6714	4	0	0	41	14:20	15:50
91029	242500	6721	4	0	0	41	14:20	15:50
91030	242500	6728	4	0	0	41	14:20	15:50
91031	242500	6623	5	0	0	40	16:20	17:50
91032	242500	6637	5	0	0	40	16:20	17:50
91033	242500	6651	5	0	0	40	16:20	17:50
91034	242500	6665	5	0	0	40	16:20	17:50
91035	242500	6679	5	0	0	40	16:20	17:50
91036	242500	6693	5	0	0	40	16:20	17:50
91037	242500	6707	5	0	0	40	16:20	17:50
91038	242500	6721	5	0	0	40	16:20	17:50
91039	242500	6624	1	0	0	42	09:00	10:30
91040	242500	6631	1	0	0	42	09:00	10:30
91041	242500	6638	1	0	0	42	09:00	10:30
91042	242500	6645	1	0	0	42	09:00	10:30
91043	242500	6652	1	0	0	42	09:00	10:30
91044	242500	6659	1	0	0	42	09:00	10:30
91045	242500	6666	1	0	0	42	09:00	10:30
91046	242500	6673	1	0	0	42	09:00	10:30
91047	242500	6680	1	0	0	42	09:00	10:30
91048	242500	6687	1	0	0	42	09:00	10:30
91049	242500	6694	1	0	0	42	09:00	10:30
91050	242500	6701	1	0	0	42	09:00	10:30
91051	242500	6708	1	0	0	42	09:00	10:30
91052	242500	6715	1	0	0	42	09:00	10:30
91053	242500	6722	1	0	0	42	09:00	10:30
91054	242500	6729	1	0	0	42	09:00	10:30
91055	242500	6624	2	0	0	42	10:40	12:10
91056	242500	6631	2	0	0	42	10:40	12:10
91057	242500	6638	2	0	0	42	10:40	12:10
91058	242500	6645	2	0	0	42	10:40	12:10
91059	242500	6652	2	0	0	42	10:40	12:10
91060	242500	6659	2	0	0	42	10:40	12:10
91061	242500	6666	2	0	0	42	10:40	12:10
91062	242500	6673	2	0	0	42	10:40	12:10
91063	242500	6680	2	0	0	42	10:40	12:10
91064	242500	6687	2	0	0	42	10:40	12:10
91065	242500	6694	2	0	0	42	10:40	12:10
91066	242500	6701	2	0	0	42	10:40	12:10
91067	242500	6708	2	0	0	42	10:40	12:10
91068	242500	6715	2	0	0	42	10:40	12:10
91069	242500	6722	2	0	0	42	10:40	12:10
91070	242500	6729	2	0	0	42	10:40	12:10
91071	242500	6624	3	0	0	42	12:40	14:10
91072	242500	6631	3	0	0	42	12:40	14:10
91073	242500	6638	3	0	0	42	12:40	14:10
91074	242500	6645	3	0	0	42	12:40	14:10
91075	242500	6652	3	0	0	42	12:40	14:10
91076	242500	6659	3	0	0	42	12:40	14:10
91077	242500	6666	3	0	0	42	12:40	14:10
91078	242500	6673	3	0	0	42	12:40	14:10
91079	242500	6680	3	0	0	42	12:40	14:10
91080	242500	6687	3	0	0	42	12:40	14:10
91081	242500	6694	3	0	0	42	12:40	14:10
91082	242500	6701	3	0	0	42	12:40	14:10
91083	242500	6708	3	0	0	42	12:40	14:10
91084	242500	6715	3	0	0	42	12:40	14:10
91085	242500	6722	3	0	0	42	12:40	14:10
91086	242500	6729	3	0	0	42	12:40	14:10
91087	242500	6624	4	0	0	42	14:20	15:50
91088	242500	6631	4	0	0	42	14:20	15:50
91089	242500	6638	4	0	0	42	14:20	15:50
91090	242500	6645	4	0	0	42	14:20	15:50
91091	242500	6652	4	0	0	42	14:20	15:50
91092	242500	6659	4	0	0	42	14:20	15:50
91093	242500	6666	4	0	0	42	14:20	15:50
91094	242500	6673	4	0	0	42	14:20	15:50
91095	242500	6680	4	0	0	42	14:20	15:50
91096	242500	6687	4	0	0	42	14:20	15:50
91097	242500	6694	4	0	0	42	14:20	15:50
91098	242500	6701	4	0	0	42	14:20	15:50
91099	242500	6708	4	0	0	42	14:20	15:50
91100	242500	6715	4	0	0	42	14:20	15:50
91101	242500	6722	4	0	0	42	14:20	15:50
91102	242500	6729	4	0	0	42	14:20	15:50
91103	242500	6625	3	0	1	43	12:40	14:10
91104	242500	6639	3	0	1	43	12:40	14:10
91105	242500	6653	3	0	1	43	12:40	14:10
91106	242500	6667	3	0	1	43	12:40	14:10
91107	242500	6681	3	0	1	43	12:40	14:10
91108	242500	6695	3	0	1	43	12:40	14:10
91109	242500	6709	3	0	1	43	12:40	14:10
91110	242500	6723	3	0	1	43	12:40	14:10
91111	242500	6632	3	0	1	44	12:40	14:10
91112	242500	6646	3	0	1	44	12:40	14:10
91113	242500	6660	3	0	1	44	12:40	14:10
91114	242500	6674	3	0	1	44	12:40	14:10
91115	242500	6688	3	0	1	44	12:40	14:10
91116	242500	6702	3	0	1	44	12:40	14:10
91117	242500	6716	3	0	1	44	12:40	14:10
91118	242500	6730	3	0	1	44	12:40	14:10
91119	242500	6625	4	0	0	44	14:20	15:50
91120	242500	6639	4	0	0	44	14:20	15:50
91121	242500	6653	4	0	0	44	14:20	15:50
91122	242500	6667	4	0	0	44	14:20	15:50
91123	242500	6681	4	0	0	44	14:20	15:50
91124	242500	6695	4	0	0	44	14:20	15:50
91125	242500	6709	4	0	0	44	14:20	15:50
91126	242500	6723	4	0	0	44	14:20	15:50
91127	242500	6632	4	0	0	45	14:20	15:50
91128	242500	6646	4	0	0	45	14:20	15:50
91129	242500	6660	4	0	0	45	14:20	15:50
91130	242500	6674	4	0	0	45	14:20	15:50
91131	242500	6688	4	0	0	45	14:20	15:50
91132	242500	6702	4	0	0	45	14:20	15:50
91133	242500	6716	4	0	0	45	14:20	15:50
91134	242500	6730	4	0	0	45	14:20	15:50
91135	242500	6620	1	0	0	33	09:00	10:30
91136	242500	6627	1	0	0	33	09:00	10:30
91137	242500	6634	1	0	0	33	09:00	10:30
91138	242500	6641	1	0	0	33	09:00	10:30
91139	242500	6648	1	0	0	33	09:00	10:30
91140	242500	6655	1	0	0	33	09:00	10:30
91141	242500	6662	1	0	0	33	09:00	10:30
91142	242500	6669	1	0	0	33	09:00	10:30
91143	242500	6676	1	0	0	33	09:00	10:30
91144	242500	6683	1	0	0	33	09:00	10:30
91145	242500	6690	1	0	0	33	09:00	10:30
91146	242500	6697	1	0	0	33	09:00	10:30
91147	242500	6704	1	0	0	33	09:00	10:30
91148	242500	6711	1	0	0	33	09:00	10:30
91149	242500	6718	1	0	0	33	09:00	10:30
91150	242500	6725	1	0	0	33	09:00	10:30
91151	242500	6620	2	0	0	33	10:40	12:10
91152	242500	6627	2	0	0	33	10:40	12:10
91153	242500	6634	2	0	0	33	10:40	12:10
91154	242500	6641	2	0	0	33	10:40	12:10
91155	242500	6648	2	0	0	33	10:40	12:10
91156	242500	6655	2	0	0	33	10:40	12:10
91157	242500	6662	2	0	0	33	10:40	12:10
91158	242500	6669	2	0	0	33	10:40	12:10
91159	242500	6676	2	0	0	33	10:40	12:10
91160	242500	6683	2	0	0	33	10:40	12:10
91161	242500	6690	2	0	0	33	10:40	12:10
91162	242500	6697	2	0	0	33	10:40	12:10
91163	242500	6704	2	0	0	33	10:40	12:10
91164	242500	6711	2	0	0	33	10:40	12:10
91165	242500	6718	2	0	0	33	10:40	12:10
91166	242500	6725	2	0	0	33	10:40	12:10
91167	242500	6620	3	0	0	34	12:40	14:10
91168	242500	6627	3	0	0	34	12:40	14:10
91169	242500	6634	3	0	0	34	12:40	14:10
91170	242500	6641	3	0	0	34	12:40	14:10
91171	242500	6648	3	0	0	34	12:40	14:10
91172	242500	6655	3	0	0	34	12:40	14:10
91173	242500	6662	3	0	0	34	12:40	14:10
91174	242500	6669	3	0	0	34	12:40	14:10
91175	242500	6676	3	0	0	34	12:40	14:10
91176	242500	6683	3	0	0	34	12:40	14:10
91177	242500	6690	3	0	0	34	12:40	14:10
91178	242500	6697	3	0	0	34	12:40	14:10
91179	242500	6704	3	0	0	34	12:40	14:10
91180	242500	6711	3	0	0	34	12:40	14:10
91181	242500	6718	3	0	0	34	12:40	14:10
91182	242500	6725	3	0	0	34	12:40	14:10
91183	242500	6620	4	0	0	35	14:20	15:50
91184	242500	6634	4	0	0	35	14:20	15:50
91185	242500	6648	4	0	0	35	14:20	15:50
91186	242500	6662	4	0	0	35	14:20	15:50
91187	242500	6676	4	0	0	35	14:20	15:50
91188	242500	6690	4	0	0	35	14:20	15:50
91189	242500	6704	4	0	0	35	14:20	15:50
91190	242500	6718	4	0	0	35	14:20	15:50
91191	242500	6627	4	0	0	35	14:20	15:50
91192	242500	6641	4	0	0	35	14:20	15:50
91193	242500	6655	4	0	0	35	14:20	15:50
91194	242500	6669	4	0	0	35	14:20	15:50
91195	242500	6683	4	0	0	35	14:20	15:50
91196	242500	6697	4	0	0	35	14:20	15:50
91197	242500	6711	4	0	0	35	14:20	15:50
91198	242500	6725	4	0	0	35	14:20	15:50
91199	242500	6620	5	0	0	36	16:20	17:50
91200	242500	6634	5	0	0	36	16:20	17:50
91201	242500	6648	5	0	0	36	16:20	17:50
91202	242500	6662	5	0	0	36	16:20	17:50
91203	242500	6676	5	0	0	36	16:20	17:50
91204	242500	6690	5	0	0	36	16:20	17:50
91205	242500	6704	5	0	0	36	16:20	17:50
91206	242500	6718	5	0	0	36	16:20	17:50
91207	242500	6627	5	0	0	36	16:20	17:50
91208	242500	6641	5	0	0	36	16:20	17:50
91209	242500	6655	5	0	0	36	16:20	17:50
91210	242500	6669	5	0	0	36	16:20	17:50
91211	242500	6683	5	0	0	36	16:20	17:50
91212	242500	6697	5	0	0	36	16:20	17:50
91213	242500	6711	5	0	0	36	16:20	17:50
91214	242500	6725	5	0	0	36	16:20	17:50
91215	242500	6621	1	0	0	37	09:00	10:30
91216	242500	6628	1	0	0	37	09:00	10:30
91217	242500	6635	1	0	0	37	09:00	10:30
91218	242500	6642	1	0	0	37	09:00	10:30
91219	242500	6649	1	0	0	37	09:00	10:30
91220	242500	6656	1	0	0	37	09:00	10:30
91221	242500	6663	1	0	0	37	09:00	10:30
91222	242500	6670	1	0	0	37	09:00	10:30
91223	242500	6677	1	0	0	37	09:00	10:30
91224	242500	6684	1	0	0	37	09:00	10:30
91225	242500	6691	1	0	0	37	09:00	10:30
91226	242500	6698	1	0	0	37	09:00	10:30
91227	242500	6705	1	0	0	37	09:00	10:30
91228	242500	6712	1	0	0	37	09:00	10:30
91229	242500	6719	1	0	0	37	09:00	10:30
91230	242500	6726	1	0	0	37	09:00	10:30
91231	242500	6621	2	0	0	37	10:40	12:10
91232	242500	6628	2	0	0	37	10:40	12:10
91233	242500	6635	2	0	0	37	10:40	12:10
91234	242500	6642	2	0	0	37	10:40	12:10
91235	242500	6649	2	0	0	37	10:40	12:10
91236	242500	6656	2	0	0	37	10:40	12:10
91237	242500	6663	2	0	0	37	10:40	12:10
91238	242500	6670	2	0	0	37	10:40	12:10
91239	242500	6677	2	0	0	37	10:40	12:10
91240	242500	6684	2	0	0	37	10:40	12:10
91241	242500	6691	2	0	0	37	10:40	12:10
91242	242500	6698	2	0	0	37	10:40	12:10
91243	242500	6705	2	0	0	37	10:40	12:10
91244	242500	6712	2	0	0	37	10:40	12:10
91245	242500	6719	2	0	0	37	10:40	12:10
91246	242500	6726	2	0	0	37	10:40	12:10
91247	242500	6621	3	0	0	37	12:40	14:10
91248	242500	6628	3	0	0	37	12:40	14:10
91249	242500	6635	3	0	0	37	12:40	14:10
91250	242500	6642	3	0	0	37	12:40	14:10
91251	242500	6649	3	0	0	37	12:40	14:10
91252	242500	6656	3	0	0	37	12:40	14:10
91253	242500	6663	3	0	0	37	12:40	14:10
91254	242500	6670	3	0	0	37	12:40	14:10
91255	242500	6677	3	0	0	37	12:40	14:10
91256	242500	6684	3	0	0	37	12:40	14:10
91257	242500	6691	3	0	0	37	12:40	14:10
91258	242500	6698	3	0	0	37	12:40	14:10
91259	242500	6705	3	0	0	37	12:40	14:10
91260	242500	6712	3	0	0	37	12:40	14:10
91261	242500	6719	3	0	0	37	12:40	14:10
91262	242500	6726	3	0	0	37	12:40	14:10
91263	242500	6621	4	0	0	37	14:20	15:50
91264	242500	6628	4	0	0	37	14:20	15:50
91265	242500	6635	4	0	0	37	14:20	15:50
91266	242500	6642	4	0	0	37	14:20	15:50
91267	242500	6649	4	0	0	37	14:20	15:50
91268	242500	6656	4	0	0	37	14:20	15:50
91269	242500	6663	4	0	0	37	14:20	15:50
91270	242500	6670	4	0	0	37	14:20	15:50
91271	242500	6677	4	0	0	37	14:20	15:50
91272	242500	6684	4	0	0	37	14:20	15:50
91273	242500	6691	4	0	0	37	14:20	15:50
91274	242500	6698	4	0	0	37	14:20	15:50
91275	242500	6705	4	0	0	37	14:20	15:50
91276	242500	6712	4	0	0	37	14:20	15:50
91277	242500	6719	4	0	0	37	14:20	15:50
91278	242500	6726	4	0	0	37	14:20	15:50
91279	242500	6629	2	0	0	38	10:40	12:10
91280	242500	6643	2	0	0	38	10:40	12:10
91281	242500	6657	2	0	0	38	10:40	12:10
91282	242500	6671	2	0	0	38	10:40	12:10
91283	242500	6685	2	0	0	38	10:40	12:10
91284	242500	6699	2	0	0	38	10:40	12:10
91285	242500	6713	2	0	0	38	10:40	12:10
91286	242500	6727	2	0	0	38	10:40	12:10
91287	242500	6622	3	0	0	38	12:40	14:10
91288	242500	6636	3	0	0	38	12:40	14:10
91289	242500	6650	3	0	0	38	12:40	14:10
91290	242500	6664	3	0	0	38	12:40	14:10
91291	242500	6678	3	0	0	38	12:40	14:10
91292	242500	6692	3	0	0	38	12:40	14:10
91293	242500	6706	3	0	0	38	12:40	14:10
91294	242500	6720	3	0	0	38	12:40	14:10
91295	242500	6629	3	0	0	38	12:40	14:10
91296	242500	6643	3	0	0	38	12:40	14:10
91297	242500	6657	3	0	0	38	12:40	14:10
91298	242500	6671	3	0	0	38	12:40	14:10
91299	242500	6685	3	0	0	38	12:40	14:10
91300	242500	6699	3	0	0	38	12:40	14:10
91301	242500	6713	3	0	0	38	12:40	14:10
91302	242500	6727	3	0	0	38	12:40	14:10
91303	242500	6622	4	0	1	39	14:20	15:50
91304	242500	6629	4	0	1	39	14:20	15:50
91305	242500	6636	4	0	1	39	14:20	15:50
91306	242500	6643	4	0	1	39	14:20	15:50
91307	242500	6650	4	0	1	39	14:20	15:50
91308	242500	6657	4	0	1	39	14:20	15:50
91309	242500	6664	4	0	1	39	14:20	15:50
91310	242500	6671	4	0	1	39	14:20	15:50
91311	242500	6678	4	0	1	39	14:20	15:50
91312	242500	6685	4	0	1	39	14:20	15:50
91313	242500	6692	4	0	1	39	14:20	15:50
91314	242500	6699	4	0	1	39	14:20	15:50
91315	242500	6706	4	0	1	39	14:20	15:50
91316	242500	6713	4	0	1	39	14:20	15:50
91317	242500	6720	4	0	1	39	14:20	15:50
91318	242500	6727	4	0	1	39	14:20	15:50
91319	242500	6622	5	0	0	39	16:20	17:50
91320	242500	6629	5	0	0	39	16:20	17:50
91321	242500	6636	5	0	0	39	16:20	17:50
91322	242500	6643	5	0	0	39	16:20	17:50
91323	242500	6650	5	0	0	39	16:20	17:50
91324	242500	6657	5	0	0	39	16:20	17:50
91325	242500	6664	5	0	0	39	16:20	17:50
91326	242500	6671	5	0	0	39	16:20	17:50
91327	242500	6678	5	0	0	39	16:20	17:50
91328	242500	6685	5	0	0	39	16:20	17:50
91329	242500	6692	5	0	0	39	16:20	17:50
91330	242500	6699	5	0	0	39	16:20	17:50
91331	242500	6706	5	0	0	39	16:20	17:50
91332	242500	6713	5	0	0	39	16:20	17:50
91333	242500	6720	5	0	0	39	16:20	17:50
91334	242500	6727	5	0	0	39	16:20	17:50
91335	242500	6622	6	0	0	35	18:00	19:30
91336	242500	6636	6	0	0	35	18:00	19:30
91337	242500	6650	6	0	0	35	18:00	19:30
91338	242500	6664	6	0	0	35	18:00	19:30
91339	242500	6678	6	0	0	35	18:00	19:30
91340	242500	6692	6	0	0	35	18:00	19:30
91341	242500	6706	6	0	0	35	18:00	19:30
91342	242500	6720	6	0	0	35	18:00	19:30
91343	242500	6623	1	0	0	40	09:00	10:30
91344	242500	6630	1	0	0	40	09:00	10:30
91345	242500	6637	1	0	0	40	09:00	10:30
91346	242500	6644	1	0	0	40	09:00	10:30
91347	242500	6651	1	0	0	40	09:00	10:30
91348	242500	6658	1	0	0	40	09:00	10:30
91349	242500	6665	1	0	0	40	09:00	10:30
91350	242500	6672	1	0	0	40	09:00	10:30
91351	242500	6679	1	0	0	40	09:00	10:30
91352	242500	6686	1	0	0	40	09:00	10:30
91353	242500	6693	1	0	0	40	09:00	10:30
91354	242500	6700	1	0	0	40	09:00	10:30
91355	242500	6707	1	0	0	40	09:00	10:30
91356	242500	6714	1	0	0	40	09:00	10:30
91357	242500	6721	1	0	0	40	09:00	10:30
91358	242500	6728	1	0	0	40	09:00	10:30
91359	242500	6623	2	0	1	40	10:40	12:10
91360	242500	6637	2	0	1	40	10:40	12:10
91361	242500	6651	2	0	1	40	10:40	12:10
91362	242500	6665	2	0	1	40	10:40	12:10
91363	242500	6679	2	0	1	40	10:40	12:10
91364	242500	6693	2	0	1	40	10:40	12:10
91365	242500	6707	2	0	1	40	10:40	12:10
91366	242500	6721	2	0	1	40	10:40	12:10
91367	242500	6630	2	0	0	40	10:40	12:10
91368	242500	6644	2	0	0	40	10:40	12:10
91369	242500	6658	2	0	0	40	10:40	12:10
91370	242500	6672	2	0	0	40	10:40	12:10
91371	242500	6686	2	0	0	40	10:40	12:10
91372	242500	6700	2	0	0	40	10:40	12:10
91373	242500	6714	2	0	0	40	10:40	12:10
91374	242500	6728	2	0	0	40	10:40	12:10
91375	242500	6623	3	0	1	41	12:40	14:10
91376	242500	6630	3	0	1	41	12:40	14:10
91377	242500	6637	3	0	1	41	12:40	14:10
91378	242500	6644	3	0	1	41	12:40	14:10
91379	242500	6651	3	0	1	41	12:40	14:10
91380	242500	6658	3	0	1	41	12:40	14:10
91381	242500	6665	3	0	1	41	12:40	14:10
91382	242500	6672	3	0	1	41	12:40	14:10
91383	242500	6679	3	0	1	41	12:40	14:10
91384	242500	6686	3	0	1	41	12:40	14:10
91385	242500	6693	3	0	1	41	12:40	14:10
91386	242500	6700	3	0	1	41	12:40	14:10
91387	242500	6707	3	0	1	41	12:40	14:10
91388	242500	6714	3	0	1	41	12:40	14:10
91389	242500	6721	3	0	1	41	12:40	14:10
91390	242500	6728	3	0	1	41	12:40	14:10
91391	242500	6623	4	0	0	41	14:20	15:50
91392	242500	6630	4	0	0	41	14:20	15:50
91393	242500	6637	4	0	0	41	14:20	15:50
91394	242500	6644	4	0	0	41	14:20	15:50
91395	242500	6651	4	0	0	41	14:20	15:50
91396	242500	6658	4	0	0	41	14:20	15:50
91397	242500	6665	4	0	0	41	14:20	15:50
91398	242500	6672	4	0	0	41	14:20	15:50
91399	242500	6679	4	0	0	41	14:20	15:50
91400	242500	6686	4	0	0	41	14:20	15:50
91401	242500	6693	4	0	0	41	14:20	15:50
91402	242500	6700	4	0	0	41	14:20	15:50
91403	242500	6707	4	0	0	41	14:20	15:50
91404	242500	6714	4	0	0	41	14:20	15:50
91405	242500	6721	4	0	0	41	14:20	15:50
91406	242500	6728	4	0	0	41	14:20	15:50
91407	242500	6624	1	0	0	42	09:00	10:30
91408	242500	6631	1	0	0	42	09:00	10:30
91409	242500	6638	1	0	0	42	09:00	10:30
91410	242500	6645	1	0	0	42	09:00	10:30
91411	242500	6652	1	0	0	42	09:00	10:30
91412	242500	6659	1	0	0	42	09:00	10:30
91413	242500	6666	1	0	0	42	09:00	10:30
91414	242500	6673	1	0	0	42	09:00	10:30
91415	242500	6680	1	0	0	42	09:00	10:30
91416	242500	6687	1	0	0	42	09:00	10:30
91417	242500	6694	1	0	0	42	09:00	10:30
91418	242500	6701	1	0	0	42	09:00	10:30
91419	242500	6708	1	0	0	42	09:00	10:30
91420	242500	6715	1	0	0	42	09:00	10:30
91421	242500	6722	1	0	0	42	09:00	10:30
91422	242500	6729	1	0	0	42	09:00	10:30
91423	242500	6624	2	0	0	42	10:40	12:10
91424	242500	6631	2	0	0	42	10:40	12:10
91425	242500	6638	2	0	0	42	10:40	12:10
91426	242500	6645	2	0	0	42	10:40	12:10
91427	242500	6652	2	0	0	42	10:40	12:10
91428	242500	6659	2	0	0	42	10:40	12:10
91429	242500	6666	2	0	0	42	10:40	12:10
91430	242500	6673	2	0	0	42	10:40	12:10
91431	242500	6680	2	0	0	42	10:40	12:10
91432	242500	6687	2	0	0	42	10:40	12:10
91433	242500	6694	2	0	0	42	10:40	12:10
91434	242500	6701	2	0	0	42	10:40	12:10
91435	242500	6708	2	0	0	42	10:40	12:10
91436	242500	6715	2	0	0	42	10:40	12:10
91437	242500	6722	2	0	0	42	10:40	12:10
91438	242500	6729	2	0	0	42	10:40	12:10
91439	242500	6624	3	0	0	42	12:40	14:10
91440	242500	6631	3	0	0	42	12:40	14:10
91441	242500	6638	3	0	0	42	12:40	14:10
91442	242500	6645	3	0	0	42	12:40	14:10
91443	242500	6652	3	0	0	42	12:40	14:10
91444	242500	6659	3	0	0	42	12:40	14:10
91445	242500	6666	3	0	0	42	12:40	14:10
91446	242500	6673	3	0	0	42	12:40	14:10
91447	242500	6680	3	0	0	42	12:40	14:10
91448	242500	6687	3	0	0	42	12:40	14:10
91449	242500	6694	3	0	0	42	12:40	14:10
91450	242500	6701	3	0	0	42	12:40	14:10
91451	242500	6708	3	0	0	42	12:40	14:10
91452	242500	6715	3	0	0	42	12:40	14:10
91453	242500	6722	3	0	0	42	12:40	14:10
91454	242500	6729	3	0	0	42	12:40	14:10
91455	242500	6624	4	0	0	42	14:20	15:50
91456	242500	6631	4	0	0	42	14:20	15:50
91457	242500	6638	4	0	0	42	14:20	15:50
91458	242500	6645	4	0	0	42	14:20	15:50
91459	242500	6652	4	0	0	42	14:20	15:50
91460	242500	6659	4	0	0	42	14:20	15:50
91461	242500	6666	4	0	0	42	14:20	15:50
91462	242500	6673	4	0	0	42	14:20	15:50
91463	242500	6680	4	0	0	42	14:20	15:50
91464	242500	6687	4	0	0	42	14:20	15:50
91465	242500	6694	4	0	0	42	14:20	15:50
91466	242500	6701	4	0	0	42	14:20	15:50
91467	242500	6708	4	0	0	42	14:20	15:50
91468	242500	6715	4	0	0	42	14:20	15:50
91469	242500	6722	4	0	0	42	14:20	15:50
91470	242500	6729	4	0	0	42	14:20	15:50
91471	242500	6625	3	0	1	43	12:40	14:10
91472	242500	6639	3	0	1	43	12:40	14:10
91473	242500	6653	3	0	1	43	12:40	14:10
91474	242500	6667	3	0	1	43	12:40	14:10
91475	242500	6681	3	0	1	43	12:40	14:10
91476	242500	6695	3	0	1	43	12:40	14:10
91477	242500	6709	3	0	1	43	12:40	14:10
91478	242500	6723	3	0	1	43	12:40	14:10
91479	242500	6632	3	0	1	44	12:40	14:10
91480	242500	6646	3	0	1	44	12:40	14:10
91481	242500	6660	3	0	1	44	12:40	14:10
91482	242500	6674	3	0	1	44	12:40	14:10
91483	242500	6688	3	0	1	44	12:40	14:10
91484	242500	6702	3	0	1	44	12:40	14:10
91485	242500	6716	3	0	1	44	12:40	14:10
91486	242500	6730	3	0	1	44	12:40	14:10
91487	242500	6625	4	0	0	44	14:20	15:50
91488	242500	6639	4	0	0	44	14:20	15:50
91489	242500	6653	4	0	0	44	14:20	15:50
91490	242500	6667	4	0	0	44	14:20	15:50
91491	242500	6681	4	0	0	44	14:20	15:50
91492	242500	6695	4	0	0	44	14:20	15:50
91493	242500	6709	4	0	0	44	14:20	15:50
91494	242500	6723	4	0	0	44	14:20	15:50
91495	242500	6632	4	0	0	45	14:20	15:50
91496	242500	6646	4	0	0	45	14:20	15:50
91497	242500	6660	4	0	0	45	14:20	15:50
91498	242500	6674	4	0	0	45	14:20	15:50
91499	242500	6688	4	0	0	45	14:20	15:50
91500	242500	6702	4	0	0	45	14:20	15:50
91501	242500	6716	4	0	0	45	14:20	15:50
91502	242500	6730	4	0	0	45	14:20	15:50
91503	242500	6627	4	0	0	46	14:20	15:50
91504	242500	6641	4	0	0	46	14:20	15:50
91505	242500	6655	4	0	0	46	14:20	15:50
91506	242500	6669	4	0	0	46	14:20	15:50
91507	242500	6683	4	0	0	46	14:20	15:50
91508	242500	6697	4	0	0	46	14:20	15:50
91509	242500	6711	4	0	0	46	14:20	15:50
91510	242500	6725	4	0	0	46	14:20	15:50
91511	242500	6627	5	0	0	47	16:20	17:50
91512	242500	6634	5	0	0	47	16:20	17:50
91513	242500	6641	5	0	0	47	16:20	17:50
91514	242500	6648	5	0	0	47	16:20	17:50
91515	242500	6655	5	0	0	47	16:20	17:50
91516	242500	6662	5	0	0	47	16:20	17:50
91517	242500	6669	5	0	0	47	16:20	17:50
91518	242500	6676	5	0	0	47	16:20	17:50
91519	242500	6683	5	0	0	47	16:20	17:50
91520	242500	6690	5	0	0	47	16:20	17:50
91521	242500	6697	5	0	0	47	16:20	17:50
91522	242500	6704	5	0	0	47	16:20	17:50
91523	242500	6711	5	0	0	47	16:20	17:50
91524	242500	6718	5	0	0	47	16:20	17:50
91525	242500	6725	5	0	0	47	16:20	17:50
91526	242500	6732	5	0	0	47	16:20	17:50
91527	242500	6634	6	0	0	47	18:00	19:30
91528	242500	6648	6	0	0	47	18:00	19:30
91529	242500	6662	6	0	0	47	18:00	19:30
91530	242500	6676	6	0	0	47	18:00	19:30
91531	242500	6690	6	0	0	47	18:00	19:30
91532	242500	6704	6	0	0	47	18:00	19:30
91533	242500	6718	6	0	0	47	18:00	19:30
91534	242500	6732	6	0	0	47	18:00	19:30
91535	242500	6627	6	0	0	8	18:00	19:30
91536	242500	6641	6	0	0	8	18:00	19:30
91537	242500	6655	6	0	0	8	18:00	19:30
91538	242500	6669	6	0	0	8	18:00	19:30
91539	242500	6683	6	0	0	8	18:00	19:30
91540	242500	6697	6	0	0	8	18:00	19:30
91541	242500	6711	6	0	0	8	18:00	19:30
91542	242500	6725	6	0	0	8	18:00	19:30
91543	242500	6627	7	0	0	8	19:40	21:10
91544	242500	6641	7	0	0	8	19:40	21:10
91545	242500	6655	7	0	0	8	19:40	21:10
91546	242500	6669	7	0	0	8	19:40	21:10
91547	242500	6683	7	0	0	8	19:40	21:10
91548	242500	6697	7	0	0	8	19:40	21:10
91549	242500	6711	7	0	0	8	19:40	21:10
91550	242500	6725	7	0	0	8	19:40	21:10
91551	242500	6635	2	0	0	48	10:40	12:10
91552	242500	6649	2	0	0	48	10:40	12:10
91553	242500	6663	2	0	0	48	10:40	12:10
91554	242500	6677	2	0	0	48	10:40	12:10
91555	242500	6691	2	0	0	48	10:40	12:10
91556	242500	6705	2	0	0	48	10:40	12:10
91557	242500	6719	2	0	0	48	10:40	12:10
91558	242500	6733	2	0	0	48	10:40	12:10
91559	242500	6635	3	0	0	48	12:40	14:10
91560	242500	6649	3	0	0	48	12:40	14:10
91561	242500	6663	3	0	0	48	12:40	14:10
91562	242500	6677	3	0	0	48	12:40	14:10
91563	242500	6691	3	0	0	48	12:40	14:10
91564	242500	6705	3	0	0	48	12:40	14:10
91565	242500	6719	3	0	0	48	12:40	14:10
91566	242500	6733	3	0	0	48	12:40	14:10
91567	242500	6636	3	0	0	49	12:40	14:10
91568	242500	6650	3	0	0	49	12:40	14:10
91569	242500	6664	3	0	0	49	12:40	14:10
91570	242500	6678	3	0	0	49	12:40	14:10
91571	242500	6692	3	0	0	49	12:40	14:10
91572	242500	6706	3	0	0	49	12:40	14:10
91573	242500	6720	3	0	0	49	12:40	14:10
91574	242500	6734	3	0	0	49	12:40	14:10
91575	242500	6636	4	0	0	49	14:20	15:50
91576	242500	6650	4	0	0	49	14:20	15:50
91577	242500	6664	4	0	0	49	14:20	15:50
91578	242500	6678	4	0	0	49	14:20	15:50
91579	242500	6692	4	0	0	49	14:20	15:50
91580	242500	6706	4	0	0	49	14:20	15:50
91581	242500	6720	4	0	0	49	14:20	15:50
91582	242500	6734	4	0	0	49	14:20	15:50
91583	242500	6629	4	0	0	50	14:20	15:50
91584	242500	6643	4	0	0	50	14:20	15:50
91585	242500	6657	4	0	0	50	14:20	15:50
91586	242500	6671	4	0	0	50	14:20	15:50
91587	242500	6685	4	0	0	50	14:20	15:50
91588	242500	6699	4	0	0	50	14:20	15:50
91589	242500	6713	4	0	0	50	14:20	15:50
91590	242500	6727	4	0	0	50	14:20	15:50
91591	242500	6636	5	0	0	51	16:20	17:50
91592	242500	6650	5	0	0	51	16:20	17:50
91593	242500	6664	5	0	0	51	16:20	17:50
91594	242500	6678	5	0	0	51	16:20	17:50
91595	242500	6692	5	0	0	51	16:20	17:50
91596	242500	6706	5	0	0	51	16:20	17:50
91597	242500	6720	5	0	0	51	16:20	17:50
91598	242500	6734	5	0	0	51	16:20	17:50
91599	242500	6629	5	0	0	50	16:20	17:50
91600	242500	6643	5	0	0	50	16:20	17:50
91601	242500	6657	5	0	0	50	16:20	17:50
91602	242500	6671	5	0	0	50	16:20	17:50
91603	242500	6685	5	0	0	50	16:20	17:50
91604	242500	6699	5	0	0	50	16:20	17:50
91605	242500	6713	5	0	0	50	16:20	17:50
91606	242500	6727	5	0	0	50	16:20	17:50
91607	242500	6636	6	0	0	46	18:00	19:30
91608	242500	6650	6	0	0	46	18:00	19:30
91609	242500	6664	6	0	0	46	18:00	19:30
91610	242500	6678	6	0	0	46	18:00	19:30
91611	242500	6692	6	0	0	46	18:00	19:30
91612	242500	6706	6	0	0	46	18:00	19:30
91613	242500	6720	6	0	0	46	18:00	19:30
91614	242500	6734	6	0	0	46	18:00	19:30
91615	242500	6629	6	0	0	51	18:00	19:30
91616	242500	6643	6	0	0	51	18:00	19:30
91617	242500	6657	6	0	0	51	18:00	19:30
91618	242500	6671	6	0	0	51	18:00	19:30
91619	242500	6685	6	0	0	51	18:00	19:30
91620	242500	6699	6	0	0	51	18:00	19:30
91621	242500	6713	6	0	0	51	18:00	19:30
91622	242500	6727	6	0	0	51	18:00	19:30
91623	242500	6636	7	0	0	46	19:40	21:10
91624	242500	6650	7	0	0	46	19:40	21:10
91625	242500	6664	7	0	0	46	19:40	21:10
91626	242500	6678	7	0	0	46	19:40	21:10
91627	242500	6692	7	0	0	46	19:40	21:10
91628	242500	6706	7	0	0	46	19:40	21:10
91629	242500	6720	7	0	0	46	19:40	21:10
91630	242500	6734	7	0	0	46	19:40	21:10
91631	242500	6630	1	0	0	42	09:00	10:30
91632	242500	6637	1	0	0	42	09:00	10:30
91633	242500	6644	1	0	0	42	09:00	10:30
91634	242500	6651	1	0	0	42	09:00	10:30
91635	242500	6658	1	0	0	42	09:00	10:30
91636	242500	6665	1	0	0	42	09:00	10:30
91637	242500	6672	1	0	0	42	09:00	10:30
91638	242500	6679	1	0	0	42	09:00	10:30
91639	242500	6686	1	0	0	42	09:00	10:30
91640	242500	6693	1	0	0	42	09:00	10:30
91641	242500	6700	1	0	0	42	09:00	10:30
91642	242500	6707	1	0	0	42	09:00	10:30
91643	242500	6714	1	0	0	42	09:00	10:30
91644	242500	6721	1	0	0	42	09:00	10:30
91645	242500	6728	1	0	0	42	09:00	10:30
91646	242500	6735	1	0	0	42	09:00	10:30
91647	242500	6630	2	0	0	42	10:40	12:10
91648	242500	6637	2	0	0	42	10:40	12:10
91649	242500	6644	2	0	0	42	10:40	12:10
91650	242500	6651	2	0	0	42	10:40	12:10
91651	242500	6658	2	0	0	42	10:40	12:10
91652	242500	6665	2	0	0	42	10:40	12:10
91653	242500	6672	2	0	0	42	10:40	12:10
91654	242500	6679	2	0	0	42	10:40	12:10
91655	242500	6686	2	0	0	42	10:40	12:10
91656	242500	6693	2	0	0	42	10:40	12:10
91657	242500	6700	2	0	0	42	10:40	12:10
91658	242500	6707	2	0	0	42	10:40	12:10
91659	242500	6714	2	0	0	42	10:40	12:10
91660	242500	6721	2	0	0	42	10:40	12:10
91661	242500	6728	2	0	0	42	10:40	12:10
91662	242500	6735	2	0	0	42	10:40	12:10
91663	242500	6630	3	0	0	42	12:40	14:10
91664	242500	6637	3	0	0	42	12:40	14:10
91665	242500	6644	3	0	0	42	12:40	14:10
91666	242500	6651	3	0	0	42	12:40	14:10
91667	242500	6658	3	0	0	42	12:40	14:10
91668	242500	6665	3	0	0	42	12:40	14:10
91669	242500	6672	3	0	0	42	12:40	14:10
91670	242500	6679	3	0	0	42	12:40	14:10
91671	242500	6686	3	0	0	42	12:40	14:10
91672	242500	6693	3	0	0	42	12:40	14:10
91673	242500	6700	3	0	0	42	12:40	14:10
91674	242500	6707	3	0	0	42	12:40	14:10
91675	242500	6714	3	0	0	42	12:40	14:10
91676	242500	6721	3	0	0	42	12:40	14:10
91677	242500	6728	3	0	0	42	12:40	14:10
91678	242500	6735	3	0	0	42	12:40	14:10
91679	242500	6630	4	0	0	42	14:20	15:50
91680	242500	6637	4	0	0	42	14:20	15:50
91681	242500	6644	4	0	0	42	14:20	15:50
91682	242500	6651	4	0	0	42	14:20	15:50
91683	242500	6658	4	0	0	42	14:20	15:50
91684	242500	6665	4	0	0	42	14:20	15:50
91685	242500	6672	4	0	0	42	14:20	15:50
91686	242500	6679	4	0	0	42	14:20	15:50
91687	242500	6686	4	0	0	42	14:20	15:50
91688	242500	6693	4	0	0	42	14:20	15:50
91689	242500	6700	4	0	0	42	14:20	15:50
91690	242500	6707	4	0	0	42	14:20	15:50
91691	242500	6714	4	0	0	42	14:20	15:50
91692	242500	6721	4	0	0	42	14:20	15:50
91693	242500	6728	4	0	0	42	14:20	15:50
91694	242500	6735	4	0	0	42	14:20	15:50
91695	242500	6631	1	0	0	42	09:00	10:30
91696	242500	6638	1	0	0	42	09:00	10:30
91697	242500	6645	1	0	0	42	09:00	10:30
91698	242500	6652	1	0	0	42	09:00	10:30
91699	242500	6659	1	0	0	42	09:00	10:30
91700	242500	6666	1	0	0	42	09:00	10:30
91701	242500	6673	1	0	0	42	09:00	10:30
91702	242500	6680	1	0	0	42	09:00	10:30
91703	242500	6687	1	0	0	42	09:00	10:30
91704	242500	6694	1	0	0	42	09:00	10:30
91705	242500	6701	1	0	0	42	09:00	10:30
91706	242500	6708	1	0	0	42	09:00	10:30
91707	242500	6715	1	0	0	42	09:00	10:30
91708	242500	6722	1	0	0	42	09:00	10:30
91709	242500	6729	1	0	0	42	09:00	10:30
91710	242500	6736	1	0	0	42	09:00	10:30
91711	242500	6631	2	0	0	42	10:40	12:10
91712	242500	6638	2	0	0	42	10:40	12:10
91713	242500	6645	2	0	0	42	10:40	12:10
91714	242500	6652	2	0	0	42	10:40	12:10
91715	242500	6659	2	0	0	42	10:40	12:10
91716	242500	6666	2	0	0	42	10:40	12:10
91717	242500	6673	2	0	0	42	10:40	12:10
91718	242500	6680	2	0	0	42	10:40	12:10
91719	242500	6687	2	0	0	42	10:40	12:10
91720	242500	6694	2	0	0	42	10:40	12:10
91721	242500	6701	2	0	0	42	10:40	12:10
91722	242500	6708	2	0	0	42	10:40	12:10
91723	242500	6715	2	0	0	42	10:40	12:10
91724	242500	6722	2	0	0	42	10:40	12:10
91725	242500	6729	2	0	0	42	10:40	12:10
91726	242500	6736	2	0	0	42	10:40	12:10
91727	242500	6631	3	0	0	42	12:40	14:10
91728	242500	6638	3	0	0	42	12:40	14:10
91729	242500	6645	3	0	0	42	12:40	14:10
91730	242500	6652	3	0	0	42	12:40	14:10
91731	242500	6659	3	0	0	42	12:40	14:10
91732	242500	6666	3	0	0	42	12:40	14:10
91733	242500	6673	3	0	0	42	12:40	14:10
91734	242500	6680	3	0	0	42	12:40	14:10
91735	242500	6687	3	0	0	42	12:40	14:10
91736	242500	6694	3	0	0	42	12:40	14:10
91737	242500	6701	3	0	0	42	12:40	14:10
91738	242500	6708	3	0	0	42	12:40	14:10
91739	242500	6715	3	0	0	42	12:40	14:10
91740	242500	6722	3	0	0	42	12:40	14:10
91741	242500	6729	3	0	0	42	12:40	14:10
91742	242500	6736	3	0	0	42	12:40	14:10
91743	242500	6631	4	0	0	42	14:20	15:50
91744	242500	6638	4	0	0	42	14:20	15:50
91745	242500	6645	4	0	0	42	14:20	15:50
91746	242500	6652	4	0	0	42	14:20	15:50
91747	242500	6659	4	0	0	42	14:20	15:50
91748	242500	6666	4	0	0	42	14:20	15:50
91749	242500	6673	4	0	0	42	14:20	15:50
91750	242500	6680	4	0	0	42	14:20	15:50
91751	242500	6687	4	0	0	42	14:20	15:50
91752	242500	6694	4	0	0	42	14:20	15:50
91753	242500	6701	4	0	0	42	14:20	15:50
91754	242500	6708	4	0	0	42	14:20	15:50
91755	242500	6715	4	0	0	42	14:20	15:50
91756	242500	6722	4	0	0	42	14:20	15:50
91757	242500	6729	4	0	0	42	14:20	15:50
91758	242500	6736	4	0	0	42	14:20	15:50
91759	242500	6627	1	0	0	42	09:00	10:30
91760	242500	6634	1	0	0	42	09:00	10:30
91761	242500	6641	1	0	0	42	09:00	10:30
91762	242500	6648	1	0	0	42	09:00	10:30
91763	242500	6655	1	0	0	42	09:00	10:30
91764	242500	6662	1	0	0	42	09:00	10:30
91765	242500	6669	1	0	0	42	09:00	10:30
91766	242500	6676	1	0	0	42	09:00	10:30
91767	242500	6683	1	0	0	42	09:00	10:30
91768	242500	6690	1	0	0	42	09:00	10:30
91769	242500	6697	1	0	0	42	09:00	10:30
91770	242500	6704	1	0	0	42	09:00	10:30
91771	242500	6711	1	0	0	42	09:00	10:30
91772	242500	6718	1	0	0	42	09:00	10:30
91773	242500	6725	1	0	0	42	09:00	10:30
91774	242500	6732	1	0	0	42	09:00	10:30
91775	242500	6627	2	0	0	42	10:40	12:10
91776	242500	6634	2	0	0	42	10:40	12:10
91777	242500	6641	2	0	0	42	10:40	12:10
91778	242500	6648	2	0	0	42	10:40	12:10
91779	242500	6655	2	0	0	42	10:40	12:10
91780	242500	6662	2	0	0	42	10:40	12:10
91781	242500	6669	2	0	0	42	10:40	12:10
91782	242500	6676	2	0	0	42	10:40	12:10
91783	242500	6683	2	0	0	42	10:40	12:10
91784	242500	6690	2	0	0	42	10:40	12:10
91785	242500	6697	2	0	0	42	10:40	12:10
91786	242500	6704	2	0	0	42	10:40	12:10
91787	242500	6711	2	0	0	42	10:40	12:10
91788	242500	6718	2	0	0	42	10:40	12:10
91789	242500	6725	2	0	0	42	10:40	12:10
91790	242500	6732	2	0	0	42	10:40	12:10
91791	242500	6627	3	0	0	42	12:40	14:10
91792	242500	6634	3	0	0	42	12:40	14:10
91793	242500	6641	3	0	0	42	12:40	14:10
91794	242500	6648	3	0	0	42	12:40	14:10
91795	242500	6655	3	0	0	42	12:40	14:10
91796	242500	6662	3	0	0	42	12:40	14:10
91797	242500	6669	3	0	0	42	12:40	14:10
91798	242500	6676	3	0	0	42	12:40	14:10
91799	242500	6683	3	0	0	42	12:40	14:10
91800	242500	6690	3	0	0	42	12:40	14:10
91801	242500	6697	3	0	0	42	12:40	14:10
91802	242500	6704	3	0	0	42	12:40	14:10
91803	242500	6711	3	0	0	42	12:40	14:10
91804	242500	6718	3	0	0	42	12:40	14:10
91805	242500	6725	3	0	0	42	12:40	14:10
91806	242500	6732	3	0	0	42	12:40	14:10
91807	242500	6627	5	0	0	52	16:20	17:50
91808	242500	6634	5	0	0	52	16:20	17:50
91809	242500	6641	5	0	0	52	16:20	17:50
91810	242500	6648	5	0	0	52	16:20	17:50
91811	242500	6655	5	0	0	52	16:20	17:50
91812	242500	6662	5	0	0	52	16:20	17:50
91813	242500	6669	5	0	0	52	16:20	17:50
91814	242500	6676	5	0	0	52	16:20	17:50
91815	242500	6683	5	0	0	52	16:20	17:50
91816	242500	6690	5	0	0	52	16:20	17:50
91817	242500	6697	5	0	0	52	16:20	17:50
91818	242500	6704	5	0	0	52	16:20	17:50
91819	242500	6711	5	0	0	52	16:20	17:50
91820	242500	6718	5	0	0	52	16:20	17:50
91821	242500	6725	5	0	0	52	16:20	17:50
91822	242500	6732	5	0	0	52	16:20	17:50
91823	242500	6627	6	0	0	53	18:00	19:30
91824	242500	6634	6	0	0	53	18:00	19:30
91825	242500	6641	6	0	0	53	18:00	19:30
91826	242500	6648	6	0	0	53	18:00	19:30
91827	242500	6655	6	0	0	53	18:00	19:30
91828	242500	6662	6	0	0	53	18:00	19:30
91829	242500	6669	6	0	0	53	18:00	19:30
91830	242500	6676	6	0	0	53	18:00	19:30
91831	242500	6683	6	0	0	53	18:00	19:30
91832	242500	6690	6	0	0	53	18:00	19:30
91833	242500	6697	6	0	0	53	18:00	19:30
91834	242500	6704	6	0	0	53	18:00	19:30
91835	242500	6711	6	0	0	53	18:00	19:30
91836	242500	6718	6	0	0	53	18:00	19:30
91837	242500	6725	6	0	0	53	18:00	19:30
91838	242500	6732	6	0	0	53	18:00	19:30
91839	242500	6628	4	0	0	54	14:20	15:50
91840	242500	6635	4	0	0	54	14:20	15:50
91841	242500	6642	4	0	0	54	14:20	15:50
91842	242500	6649	4	0	0	54	14:20	15:50
91843	242500	6656	4	0	0	54	14:20	15:50
91844	242500	6663	4	0	0	54	14:20	15:50
91845	242500	6670	4	0	0	54	14:20	15:50
91846	242500	6677	4	0	0	54	14:20	15:50
91847	242500	6684	4	0	0	54	14:20	15:50
91848	242500	6691	4	0	0	54	14:20	15:50
91849	242500	6698	4	0	0	54	14:20	15:50
91850	242500	6705	4	0	0	54	14:20	15:50
91851	242500	6712	4	0	0	54	14:20	15:50
91852	242500	6719	4	0	0	54	14:20	15:50
91853	242500	6726	4	0	0	54	14:20	15:50
91854	242500	6733	4	0	0	54	14:20	15:50
91855	242500	6628	6	0	0	55	18:00	19:30
91856	242500	6642	6	0	0	55	18:00	19:30
91857	242500	6656	6	0	0	55	18:00	19:30
91858	242500	6670	6	0	0	55	18:00	19:30
91859	242500	6684	6	0	0	55	18:00	19:30
91860	242500	6698	6	0	0	55	18:00	19:30
91861	242500	6712	6	0	0	55	18:00	19:30
91862	242500	6726	6	0	0	55	18:00	19:30
91863	242500	6636	1	0	0	56	09:00	10:30
91864	242500	6650	1	0	0	56	09:00	10:30
91865	242500	6664	1	0	0	56	09:00	10:30
91866	242500	6678	1	0	0	56	09:00	10:30
91867	242500	6692	1	0	0	56	09:00	10:30
91868	242500	6706	1	0	0	56	09:00	10:30
91869	242500	6720	1	0	0	56	09:00	10:30
91870	242500	6734	1	0	0	56	09:00	10:30
91871	242500	6636	2	0	0	56	10:40	12:10
91872	242500	6650	2	0	0	56	10:40	12:10
91873	242500	6664	2	0	0	56	10:40	12:10
91874	242500	6678	2	0	0	56	10:40	12:10
91875	242500	6692	2	0	0	56	10:40	12:10
91876	242500	6706	2	0	0	56	10:40	12:10
91877	242500	6720	2	0	0	56	10:40	12:10
91878	242500	6734	2	0	0	56	10:40	12:10
91879	242500	6636	3	0	0	42	12:40	14:10
91880	242500	6650	3	0	0	42	12:40	14:10
91881	242500	6664	3	0	0	42	12:40	14:10
91882	242500	6678	3	0	0	42	12:40	14:10
91883	242500	6692	3	0	0	42	12:40	14:10
91884	242500	6706	3	0	0	42	12:40	14:10
91885	242500	6720	3	0	0	42	12:40	14:10
91886	242500	6734	3	0	0	42	12:40	14:10
91887	242500	6636	4	0	0	42	14:20	15:50
91888	242500	6650	4	0	0	42	14:20	15:50
91889	242500	6664	4	0	0	42	14:20	15:50
91890	242500	6678	4	0	0	42	14:20	15:50
91891	242500	6692	4	0	0	42	14:20	15:50
91892	242500	6706	4	0	0	42	14:20	15:50
91893	242500	6720	4	0	0	42	14:20	15:50
91894	242500	6734	4	0	0	42	14:20	15:50
91895	242500	6629	4	0	1	57	14:20	15:50
91896	242500	6643	4	0	1	57	14:20	15:50
91897	242500	6657	4	0	1	57	14:20	15:50
91898	242500	6671	4	0	1	57	14:20	15:50
91899	242500	6685	4	0	1	57	14:20	15:50
91900	242500	6699	4	0	1	57	14:20	15:50
91901	242500	6713	4	0	1	57	14:20	15:50
91902	242500	6727	4	0	1	57	14:20	15:50
91903	242500	6636	5	0	0	42	16:20	17:50
91904	242500	6650	5	0	0	42	16:20	17:50
91905	242500	6664	5	0	0	42	16:20	17:50
91906	242500	6678	5	0	0	42	16:20	17:50
91907	242500	6692	5	0	0	42	16:20	17:50
91908	242500	6706	5	0	0	42	16:20	17:50
91909	242500	6720	5	0	0	42	16:20	17:50
91910	242500	6734	5	0	0	42	16:20	17:50
91911	242500	6636	6	0	0	42	18:00	19:30
91912	242500	6650	6	0	0	42	18:00	19:30
91913	242500	6664	6	0	0	42	18:00	19:30
91914	242500	6678	6	0	0	42	18:00	19:30
91915	242500	6692	6	0	0	42	18:00	19:30
91916	242500	6706	6	0	0	42	18:00	19:30
91917	242500	6720	6	0	0	42	18:00	19:30
91918	242500	6734	6	0	0	42	18:00	19:30
91919	242500	6629	6	0	0	58	18:00	19:30
91920	242500	6643	6	0	0	58	18:00	19:30
91921	242500	6657	6	0	0	58	18:00	19:30
91922	242500	6671	6	0	0	58	18:00	19:30
91923	242500	6685	6	0	0	58	18:00	19:30
91924	242500	6699	6	0	0	58	18:00	19:30
91925	242500	6713	6	0	0	58	18:00	19:30
91926	242500	6727	6	0	0	58	18:00	19:30
91927	242500	6637	1	0	1	59	09:00	10:30
91928	242500	6651	1	0	1	59	09:00	10:30
91929	242500	6665	1	0	1	59	09:00	10:30
91930	242500	6679	1	0	1	59	09:00	10:30
91931	242500	6693	1	0	1	59	09:00	10:30
91932	242500	6707	1	0	1	59	09:00	10:30
91933	242500	6721	1	0	1	59	09:00	10:30
91934	242500	6735	1	0	1	59	09:00	10:30
91935	242500	6630	1	0	1	60	09:00	10:30
91936	242500	6644	1	0	1	60	09:00	10:30
91937	242500	6658	1	0	1	60	09:00	10:30
91938	242500	6672	1	0	1	60	09:00	10:30
91939	242500	6686	1	0	1	60	09:00	10:30
91940	242500	6700	1	0	1	60	09:00	10:30
91941	242500	6714	1	0	1	60	09:00	10:30
91942	242500	6728	1	0	1	60	09:00	10:30
91943	242500	6630	6	0	0	60	18:00	19:30
91944	242500	6658	6	0	0	60	18:00	19:30
91945	242500	6686	6	0	0	60	18:00	19:30
91946	242500	6714	6	0	0	60	18:00	19:30
91947	242500	6630	7	0	0	60	19:40	21:10
91948	242500	6658	7	0	0	60	19:40	21:10
91949	242500	6686	7	0	0	60	19:40	21:10
91950	242500	6714	7	0	0	60	19:40	21:10
91951	242500	6645	6	0	0	61	18:00	19:30
91952	242500	6673	6	0	0	61	18:00	19:30
91953	242500	6701	6	0	0	61	18:00	19:30
91954	242500	6729	6	0	0	61	18:00	19:30
91955	242500	6645	7	0	0	61	19:40	21:10
91956	242500	6673	7	0	0	61	19:40	21:10
91957	242500	6701	7	0	0	61	19:40	21:10
91958	242500	6729	7	0	0	61	19:40	21:10
91959	242500	6639	5	0	1	62	16:20	17:50
91960	242500	6653	5	0	1	62	16:20	17:50
91961	242500	6667	5	0	1	62	16:20	17:50
91962	242500	6681	5	0	1	62	16:20	17:50
91963	242500	6695	5	0	1	62	16:20	17:50
91964	242500	6709	5	0	1	62	16:20	17:50
91965	242500	6723	5	0	1	62	16:20	17:50
91966	242500	6737	5	0	1	62	16:20	17:50
91967	242500	6733	2	0	12	7	10:40	12:10
91968	242500	6733	4	0	12	63	14:20	15:50
91969	242500	6734	3	0	12	8	12:40	14:10
91970	242500	6734	5	0	12	0	16:20	17:50
91971	242500	6735	1	0	12	3	09:00	10:30
91972	242500	6735	3	0	12	9	12:40	14:10
91973	242500	6736	6	0	12	5	18:00	19:30
91974	242500	6737	2	0	12	10	10:40	12:10
91975	242500	6755	1	0	10	6	09:00	10:30
91976	242500	6757	1	0	11	6	09:00	10:30
91977	242500	6760	3	0	10	64	12:40	14:10
91978	242500	6762	1	0	11	64	09:00	10:30
91979	242500	6763	3	0	10	2	12:40	14:10
91980	242500	6765	1	0	11	2	09:00	10:30
91981	242500	6767	1	0	10	13	09:00	10:30
91982	242500	6768	1	0	11	13	09:00	10:30
91983	242500	6733	2	0	12	63	10:40	12:10
91984	242500	6733	4	0	12	9	14:20	15:50
91985	242500	6734	4	0	12	7	14:20	15:50
91986	242500	6734	6	0	12	10	18:00	19:30
91987	242500	6735	2	0	12	3	12:00	13:30
91988	242500	6736	1	0	12	0	09:00	10:30
91989	242500	6736	6	0	12	5	18:00	19:30
91990	242500	6749	1	0	12	8	09:00	10:30
91991	242500	6755	1	0	10	6	09:00	10:30
91992	242500	6757	2	0	11	6	10:40	12:10
91993	242500	6760	3	0	10	64	12:40	14:10
91994	242500	6762	1	0	11	64	09:00	10:30
91995	242500	6763	3	0	10	2	12:40	14:10
91996	242500	6765	1	0	11	2	09:00	10:30
91997	242500	6767	1	0	10	13	09:00	10:30
91998	242500	6768	1	0	11	13	09:00	10:30
91999	242500	6733	5	0	12	63	16:20	17:50
92000	242500	6734	2	0	12	7	10:40	12:10
92001	242500	6734	4	0	12	9	14:20	15:50
92002	242500	6736	3	0	12	0	12:40	14:10
92003	242500	6736	6	0	12	5	18:00	19:30
92004	242500	6737	2	0	12	3	12:00	13:30
92005	242500	6737	5	0	12	10	16:20	17:50
92006	242500	6749	3	0	12	8	12:40	14:10
92007	242500	6755	1	0	10	6	09:00	10:30
92008	242500	6757	3	0	11	6	12:40	14:10
92009	242500	6760	3	0	10	64	12:40	14:10
92010	242500	6762	1	0	11	64	09:00	10:30
92011	242500	6763	3	0	10	2	12:40	14:10
92012	242500	6765	1	0	11	2	09:00	10:30
92013	242500	6767	1	0	10	13	09:00	10:30
92014	242500	6768	1	0	11	13	09:00	10:30
92015	242500	6733	1	0	12	9	09:00	10:30
92016	242500	6733	3	0	12	63	12:40	14:10
92017	242500	6734	2	0	12	7	10:40	12:10
92018	242500	6736	1	0	12	0	09:00	10:30
92019	242500	6736	3	0	12	8	12:40	14:10
92020	242500	6736	6	0	12	5	18:00	19:30
92021	242500	6737	1	0	12	3	09:00	10:30
92022	242500	6737	3	0	12	10	13:20	14:50
92023	242500	6755	1	0	10	6	09:00	10:30
92024	242500	6757	4	0	11	6	14:20	15:50
92025	242500	6760	3	0	10	64	12:40	14:10
92026	242500	6762	1	0	11	64	09:00	10:30
92027	242500	6763	3	0	10	2	12:40	14:10
92028	242500	6765	1	0	11	2	09:00	10:30
92029	242500	6767	1	0	10	13	09:00	10:30
92030	242500	6768	1	0	11	13	09:00	10:30
92031	242500	6733	5	0	12	9	16:20	17:50
92032	242500	6733	2	0	12	18	12:00	13:30
92033	242500	6734	2	0	12	8	10:40	12:10
92034	242500	6735	1	0	12	13	09:00	10:30
92035	242500	6735	4	0	12	16	15:00	16:30
92036	242500	6749	2	0	14	16	10:40	12:10
92037	242500	6750	1	0	10	7	09:00	10:30
92038	242500	6751	3	0	11	7	12:40	14:10
92039	242500	6753	4	0	10	14	14:20	15:50
92040	242500	6755	3	0	11	14	12:40	14:10
92041	242500	6758	1	0	10	64	09:00	10:30
92042	242500	6760	3	0	11	64	12:40	14:10
92043	242500	6763	1	0	12	17	09:00	10:30
92044	242500	6767	2	0	10	2	10:40	12:10
92045	242500	6768	3	0	11	2	12:40	14:10
92046	242500	6769	4	0	10	15	14:20	15:50
92047	242500	6771	3	0	11	15	12:40	14:10
92048	242500	6733	1	0	12	13	09:00	10:30
92049	242500	6733	1	0	12	18	09:00	10:30
92050	242500	6734	4	0	12	16	14:20	15:50
92051	242500	6735	4	0	12	8	14:20	15:50
92052	242500	6749	2	0	14	16	10:40	12:10
92053	242500	6749	5	0	12	9	16:20	17:50
92054	242500	6750	1	0	10	7	09:00	10:30
92055	242500	6751	3	0	11	7	12:40	14:10
92056	242500	6753	4	0	10	14	14:20	15:50
92057	242500	6755	3	0	11	14	12:40	14:10
92058	242500	6758	1	0	10	64	09:00	10:30
92059	242500	6760	3	0	11	64	12:40	14:10
92060	242500	6763	2	0	12	17	10:40	12:10
92061	242500	6767	2	0	10	2	10:40	12:10
92062	242500	6768	3	0	11	2	12:40	14:10
92063	242500	6769	4	0	10	15	14:20	15:50
92064	242500	6771	3	0	11	15	12:40	14:10
92065	242500	6733	4	0	12	27	14:20	15:50
92066	242500	6734	2	0	12	26	11:30	13:00
92067	242500	6734	6	0	12	23	18:00	19:30
92068	242500	6735	2	0	12	65	10:40	12:10
92069	242500	6735	3	0	14	66	12:40	14:10
92070	242500	6750	6	0	10	25	18:00	19:30
92071	242500	6754	2	0	11	25	10:40	12:10
92072	242500	6756	4	0	10	67	14:20	15:50
92073	242500	6757	4	0	11	67	14:20	15:50
92074	242500	6760	3	0	10	31	12:40	14:10
92075	242500	6762	2	0	11	31	10:40	12:10
92076	242500	6764	2	0	10	24	10:40	12:10
92077	242500	6765	1	0	11	24	09:00	10:30
92078	242500	6769	2	0	11	30	10:40	12:10
92079	242500	6771	3	0	11	30	12:40	14:10
92080	242500	6733	5	0	12	27	16:20	17:50
92081	242500	6734	2	0	12	26	11:30	13:00
92082	242500	6734	6	0	12	23	18:00	19:30
92083	242500	6735	4	0	12	65	14:20	15:50
92084	242500	6735	5	0	14	66	16:20	17:50
92085	242500	6750	6	0	10	25	18:00	19:30
92086	242500	6754	4	0	11	25	14:20	15:50
92087	242500	6756	4	0	10	67	14:20	15:50
92088	242500	6757	4	0	11	67	14:20	15:50
92089	242500	6760	3	0	10	31	12:40	14:10
92090	242500	6762	3	0	11	31	12:40	14:10
92091	242500	6764	2	0	10	24	10:40	12:10
92092	242500	6765	1	0	11	24	09:00	10:30
92093	242500	6769	2	0	11	30	10:40	12:10
92094	242500	6770	1	0	11	30	09:00	10:30
92095	242500	6733	1	0	-1	68	09:00	15:50
92096	242500	6734	1	0	12	33	09:00	10:30
92097	242500	6735	1	0	12	69	09:00	10:30
92098	242500	6735	3	0	12	70	12:40	14:10
92099	242500	6736	1	0	12	71	09:00	10:30
92100	242500	6737	4	0	13	42	14:20	15:50
92101	242500	6749	2	0	12	43	10:40	12:10
92102	242500	6749	4	0	15	72	14:20	15:50
92103	242500	6750	4	0	10	72	14:20	15:50
92104	242500	6753	3	0	11	72	12:40	14:10
92105	242500	6756	1	0	10	41	09:00	10:30
92106	242500	6758	1	0	11	41	09:00	10:30
92107	242500	6760	2	0	10	27	10:40	12:10
92108	242500	6761	2	0	11	27	10:40	12:10
92109	242500	6763	2	0	10	34	10:40	12:10
92110	242500	6764	2	0	11	34	10:40	12:10
92111	242500	6767	3	0	10	40	12:40	14:10
92112	242500	6769	2	0	11	40	10:40	12:10
92113	242500	6733	1	0	-1	68	09:00	15:50
92114	242500	6734	1	0	12	33	09:00	10:30
92115	242500	6735	2	0	12	69	10:40	12:10
92116	242500	6735	4	0	12	70	14:20	15:50
92117	242500	6736	2	0	12	71	10:40	12:10
92118	242500	6737	4	0	13	42	15:00	16:30
92119	242500	6749	2	0	12	43	10:40	12:10
92120	242500	6749	5	0	15	72	16:20	17:50
92121	242500	6750	4	0	10	72	14:20	15:50
92122	242500	6753	4	0	11	72	14:20	15:50
92123	242500	6756	1	0	10	41	09:00	10:30
92124	242500	6758	1	0	11	41	09:00	10:30
92125	242500	6760	2	0	10	27	10:40	12:10
92126	242500	6761	3	0	11	27	12:40	14:10
92127	242500	6763	2	0	10	34	10:40	12:10
92128	242500	6764	3	0	11	34	12:40	14:10
92129	242500	6767	3	0	10	40	12:40	14:10
92130	242500	6769	2	0	11	40	10:40	12:10
92131	242500	6749	6	0	10	49	18:00	19:30
92132	242500	6750	6	0	11	49	18:00	19:30
92133	242500	6753	2	0	10	73	10:40	12:10
92134	242500	6755	3	0	11	73	12:40	14:10
92135	242500	6757	6	0	12	47	18:00	19:30
92136	242500	6758	3	0	12	8	12:40	14:10
92137	242500	6760	6	0	10	74	18:00	19:30
92138	242500	6761	6	0	11	74	18:00	19:30
92139	242500	6763	5	0	12	75	16:20	17:50
92140	242500	6768	6	0	10	76	18:00	19:30
92141	242500	6770	6	0	11	76	18:00	19:30
92142	242500	6771	5	0	13	77	16:20	17:50
92143	242500	6771	5	0	13	78	16:20	17:50
92144	242500	6749	1	0	12	79	09:00	10:30
92145	242500	6749	3	0	12	80	12:40	14:10
92146	242500	6750	6	0	10	81	18:00	19:30
92147	242500	6753	6	0	11	81	18:00	19:30
92148	242500	6755	1	0	12	82	09:00	10:30
92149	242500	6756	6	0	14	83	18:00	19:30
92150	242500	6761	6	0	12	84	18:00	19:30
92151	242500	6762	6	0	10	57	18:00	19:30
92152	242500	6764	6	0	11	57	18:00	19:30
92153	242500	6767	6	0	12	60	18:00	19:30
92154	242500	6768	5	0	10	85	16:20	17:50
92155	242500	6769	5	0	11	85	16:20	17:50
92156	242500	6771	3	0	13	86	12:40	14:10
92157	242500	6771	4	0	13	87	14:20	15:50
113402	242501	6781	1	0	0	0	09:00	10:30
113403	242501	6788	1	0	0	0	09:00	10:30
113404	242501	6795	1	0	0	0	09:00	10:30
113405	242501	6802	1	0	0	0	09:00	10:30
113406	242501	6809	1	0	0	0	09:00	10:30
113407	242501	6816	1	0	0	0	09:00	10:30
113408	242501	6823	1	0	0	0	09:00	10:30
113409	242501	6830	1	0	0	0	09:00	10:30
113410	242501	6837	1	0	0	0	09:00	10:30
113411	242501	6844	1	0	0	0	09:00	10:30
113412	242501	6851	1	0	0	0	09:00	10:30
113413	242501	6858	1	0	0	0	09:00	10:30
113414	242501	6865	1	0	0	0	09:00	10:30
113415	242501	6872	1	0	0	0	09:00	10:30
113416	242501	6879	1	0	0	0	09:00	10:30
113417	242501	6886	1	0	0	0	09:00	10:30
113418	242501	6781	2	0	0	124	10:40	12:10
113419	242501	6788	2	0	0	124	10:40	12:10
113420	242501	6795	2	0	0	124	10:40	12:10
113421	242501	6802	2	0	0	124	10:40	12:10
113422	242501	6809	2	0	0	124	10:40	12:10
113423	242501	6816	2	0	0	124	10:40	12:10
113424	242501	6823	2	0	0	124	10:40	12:10
113425	242501	6830	2	0	0	124	10:40	12:10
113426	242501	6837	2	0	0	124	10:40	12:10
113427	242501	6844	2	0	0	124	10:40	12:10
113428	242501	6851	2	0	0	124	10:40	12:10
113429	242501	6858	2	0	0	124	10:40	12:10
113430	242501	6865	2	0	0	124	10:40	12:10
113431	242501	6872	2	0	0	124	10:40	12:10
113432	242501	6879	2	0	0	124	10:40	12:10
113433	242501	6886	2	0	0	124	10:40	12:10
113434	242501	6782	1	0	0	16	09:00	10:30
113435	242501	6789	1	0	0	16	09:00	10:30
113436	242501	6796	1	0	0	16	09:00	10:30
113437	242501	6803	1	0	0	16	09:00	10:30
113438	242501	6810	1	0	0	16	09:00	10:30
113439	242501	6817	1	0	0	16	09:00	10:30
113440	242501	6824	1	0	0	16	09:00	10:30
113441	242501	6831	1	0	0	16	09:00	10:30
113442	242501	6838	1	0	0	16	09:00	10:30
113443	242501	6845	1	0	0	16	09:00	10:30
113444	242501	6852	1	0	0	16	09:00	10:30
113445	242501	6859	1	0	0	16	09:00	10:30
113446	242501	6866	1	0	0	16	09:00	10:30
113447	242501	6873	1	0	0	16	09:00	10:30
113448	242501	6880	1	0	0	16	09:00	10:30
113449	242501	6887	1	0	0	16	09:00	10:30
113450	242501	6782	2	0	0	16	10:40	12:10
113451	242501	6789	2	0	0	16	10:40	12:10
113452	242501	6796	2	0	0	16	10:40	12:10
113453	242501	6803	2	0	0	16	10:40	12:10
113454	242501	6810	2	0	0	16	10:40	12:10
113455	242501	6817	2	0	0	16	10:40	12:10
113456	242501	6824	2	0	0	16	10:40	12:10
113457	242501	6831	2	0	0	16	10:40	12:10
113458	242501	6838	2	0	0	16	10:40	12:10
113459	242501	6845	2	0	0	16	10:40	12:10
113460	242501	6852	2	0	0	16	10:40	12:10
113461	242501	6859	2	0	0	16	10:40	12:10
113462	242501	6866	2	0	0	16	10:40	12:10
113463	242501	6873	2	0	0	16	10:40	12:10
113464	242501	6880	2	0	0	16	10:40	12:10
113465	242501	6887	2	0	0	16	10:40	12:10
113466	242501	6782	3	0	0	9	12:40	14:10
113467	242501	6789	3	0	0	9	12:40	14:10
113468	242501	6796	3	0	0	9	12:40	14:10
113469	242501	6803	3	0	0	9	12:40	14:10
113470	242501	6810	3	0	0	9	12:40	14:10
113471	242501	6817	3	0	0	9	12:40	14:10
113472	242501	6824	3	0	0	9	12:40	14:10
113473	242501	6831	3	0	0	9	12:40	14:10
113474	242501	6838	3	0	0	9	12:40	14:10
113475	242501	6845	3	0	0	9	12:40	14:10
113476	242501	6852	3	0	0	9	12:40	14:10
113477	242501	6859	3	0	0	9	12:40	14:10
113478	242501	6866	3	0	0	9	12:40	14:10
113479	242501	6873	3	0	0	9	12:40	14:10
113480	242501	6880	3	0	0	9	12:40	14:10
113481	242501	6887	3	0	0	9	12:40	14:10
113482	242501	6783	1	0	1	1	09:00	10:30
113483	242501	6790	1	0	1	1	09:00	10:30
113484	242501	6797	1	0	1	1	09:00	10:30
113485	242501	6804	1	0	1	1	09:00	10:30
113486	242501	6811	1	0	1	1	09:00	10:30
113487	242501	6818	1	0	1	1	09:00	10:30
113488	242501	6825	1	0	1	1	09:00	10:30
113489	242501	6832	1	0	1	1	09:00	10:30
113490	242501	6839	1	0	1	1	09:00	10:30
113491	242501	6846	1	0	1	1	09:00	10:30
113492	242501	6853	1	0	1	1	09:00	10:30
113493	242501	6860	1	0	1	1	09:00	10:30
113494	242501	6867	1	0	1	1	09:00	10:30
113495	242501	6874	1	0	1	1	09:00	10:30
113496	242501	6881	1	0	1	1	09:00	10:30
113497	242501	6888	1	0	1	1	09:00	10:30
113498	242501	6783	2	0	1	7	10:40	12:10
113499	242501	6790	2	0	1	7	10:40	12:10
113500	242501	6797	2	0	1	7	10:40	12:10
113501	242501	6804	2	0	1	7	10:40	12:10
113502	242501	6811	2	0	1	7	10:40	12:10
113503	242501	6818	2	0	1	7	10:40	12:10
113504	242501	6825	2	0	1	7	10:40	12:10
113505	242501	6832	2	0	1	7	10:40	12:10
113506	242501	6839	2	0	1	7	10:40	12:10
113507	242501	6846	2	0	1	7	10:40	12:10
113508	242501	6853	2	0	1	7	10:40	12:10
113509	242501	6860	2	0	1	7	10:40	12:10
113510	242501	6867	2	0	1	7	10:40	12:10
113511	242501	6874	2	0	1	7	10:40	12:10
113512	242501	6881	2	0	1	7	10:40	12:10
113513	242501	6888	2	0	1	7	10:40	12:10
113514	242501	6783	3	0	0	7	12:40	14:10
113515	242501	6790	3	0	0	7	12:40	14:10
113516	242501	6797	3	0	0	7	12:40	14:10
113517	242501	6804	3	0	0	7	12:40	14:10
113518	242501	6811	3	0	0	7	12:40	14:10
113519	242501	6818	3	0	0	7	12:40	14:10
113520	242501	6825	3	0	0	7	12:40	14:10
113521	242501	6832	3	0	0	7	12:40	14:10
113522	242501	6839	3	0	0	7	12:40	14:10
113523	242501	6846	3	0	0	7	12:40	14:10
113524	242501	6853	3	0	0	7	12:40	14:10
113525	242501	6860	3	0	0	7	12:40	14:10
113526	242501	6867	3	0	0	7	12:40	14:10
113527	242501	6874	3	0	0	7	12:40	14:10
113528	242501	6881	3	0	0	7	12:40	14:10
113529	242501	6888	3	0	0	7	12:40	14:10
113530	242501	6790	5	0	1	10	16:20	17:50
113531	242501	6804	5	0	1	10	16:20	17:50
113532	242501	6818	5	0	1	10	16:20	17:50
113533	242501	6832	5	0	1	10	16:20	17:50
113534	242501	6846	5	0	1	10	16:20	17:50
113535	242501	6860	5	0	1	10	16:20	17:50
113536	242501	6874	5	0	1	10	16:20	17:50
113537	242501	6888	5	0	1	10	16:20	17:50
113538	242501	6784	2	0	1	91	10:40	12:10
113539	242501	6798	2	0	1	91	10:40	12:10
113540	242501	6812	2	0	1	91	10:40	12:10
113541	242501	6826	2	0	1	91	10:40	12:10
113542	242501	6840	2	0	1	91	10:40	12:10
113543	242501	6854	2	0	1	91	10:40	12:10
113544	242501	6868	2	0	1	91	10:40	12:10
113545	242501	6882	2	0	1	91	10:40	12:10
113546	242501	6784	3	0	1	2	12:40	14:10
113547	242501	6791	3	0	1	2	12:40	14:10
113548	242501	6798	3	0	1	2	12:40	14:10
113549	242501	6805	3	0	1	2	12:40	14:10
113550	242501	6812	3	0	1	2	12:40	14:10
113551	242501	6819	3	0	1	2	12:40	14:10
113552	242501	6826	3	0	1	2	12:40	14:10
113553	242501	6833	3	0	1	2	12:40	14:10
113554	242501	6840	3	0	1	2	12:40	14:10
113555	242501	6847	3	0	1	2	12:40	14:10
113556	242501	6854	3	0	1	2	12:40	14:10
113557	242501	6861	3	0	1	2	12:40	14:10
113558	242501	6868	3	0	1	2	12:40	14:10
113559	242501	6875	3	0	1	2	12:40	14:10
113560	242501	6882	3	0	1	2	12:40	14:10
113561	242501	6889	3	0	1	2	12:40	14:10
113562	242501	6784	4	0	0	91	14:20	15:50
113563	242501	6791	4	0	0	91	14:20	15:50
113564	242501	6798	4	0	0	91	14:20	15:50
113565	242501	6805	4	0	0	91	14:20	15:50
113566	242501	6812	4	0	0	91	14:20	15:50
113567	242501	6819	4	0	0	91	14:20	15:50
113568	242501	6826	4	0	0	91	14:20	15:50
113569	242501	6833	4	0	0	91	14:20	15:50
113570	242501	6840	4	0	0	91	14:20	15:50
113571	242501	6847	4	0	0	91	14:20	15:50
113572	242501	6854	4	0	0	91	14:20	15:50
113573	242501	6861	4	0	0	91	14:20	15:50
113574	242501	6868	4	0	0	91	14:20	15:50
113575	242501	6875	4	0	0	91	14:20	15:50
113576	242501	6882	4	0	0	91	14:20	15:50
113577	242501	6889	4	0	0	91	14:20	15:50
113578	242501	6784	5	0	0	2	16:20	17:50
113579	242501	6791	5	0	0	2	16:20	17:50
113580	242501	6798	5	0	0	2	16:20	17:50
113581	242501	6805	5	0	0	2	16:20	17:50
113582	242501	6812	5	0	0	2	16:20	17:50
113583	242501	6819	5	0	0	2	16:20	17:50
113584	242501	6826	5	0	0	2	16:20	17:50
113585	242501	6833	5	0	0	2	16:20	17:50
113586	242501	6840	5	0	0	2	16:20	17:50
113587	242501	6847	5	0	0	2	16:20	17:50
113588	242501	6854	5	0	0	2	16:20	17:50
113589	242501	6861	5	0	0	2	16:20	17:50
113590	242501	6868	5	0	0	2	16:20	17:50
113591	242501	6875	5	0	0	2	16:20	17:50
113592	242501	6882	5	0	0	2	16:20	17:50
113593	242501	6889	5	0	0	2	16:20	17:50
113594	242501	6784	6	0	0	111	18:00	19:30
113595	242501	6791	6	0	0	111	18:00	19:30
113596	242501	6798	6	0	0	111	18:00	19:30
113597	242501	6805	6	0	0	111	18:00	19:30
113598	242501	6812	6	0	0	111	18:00	19:30
113599	242501	6819	6	0	0	111	18:00	19:30
113600	242501	6826	6	0	0	111	18:00	19:30
113601	242501	6833	6	0	0	111	18:00	19:30
113602	242501	6840	6	0	0	111	18:00	19:30
113603	242501	6847	6	0	0	111	18:00	19:30
113604	242501	6854	6	0	0	111	18:00	19:30
113605	242501	6861	6	0	0	111	18:00	19:30
113606	242501	6868	6	0	0	111	18:00	19:30
113607	242501	6875	6	0	0	111	18:00	19:30
113608	242501	6882	6	0	0	111	18:00	19:30
113609	242501	6889	6	0	0	111	18:00	19:30
113610	242501	6785	1	0	0	1	09:00	10:30
113611	242501	6792	1	0	0	1	09:00	10:30
113612	242501	6799	1	0	0	1	09:00	10:30
113613	242501	6806	1	0	0	1	09:00	10:30
113614	242501	6813	1	0	0	1	09:00	10:30
113615	242501	6820	1	0	0	1	09:00	10:30
113616	242501	6827	1	0	0	1	09:00	10:30
113617	242501	6834	1	0	0	1	09:00	10:30
113618	242501	6841	1	0	0	1	09:00	10:30
113619	242501	6848	1	0	0	1	09:00	10:30
113620	242501	6855	1	0	0	1	09:00	10:30
113621	242501	6862	1	0	0	1	09:00	10:30
113622	242501	6869	1	0	0	1	09:00	10:30
113623	242501	6876	1	0	0	1	09:00	10:30
113624	242501	6883	1	0	0	1	09:00	10:30
113625	242501	6890	1	0	0	1	09:00	10:30
113626	242501	6785	2	0	0	10	10:40	12:10
113627	242501	6792	2	0	0	10	10:40	12:10
113628	242501	6799	2	0	0	10	10:40	12:10
113629	242501	6806	2	0	0	10	10:40	12:10
113630	242501	6813	2	0	0	10	10:40	12:10
113631	242501	6820	2	0	0	10	10:40	12:10
113632	242501	6827	2	0	0	10	10:40	12:10
113633	242501	6834	2	0	0	10	10:40	12:10
113634	242501	6841	2	0	0	10	10:40	12:10
113635	242501	6848	2	0	0	10	10:40	12:10
113636	242501	6855	2	0	0	10	10:40	12:10
113637	242501	6862	2	0	0	10	10:40	12:10
113638	242501	6869	2	0	0	10	10:40	12:10
113639	242501	6876	2	0	0	10	10:40	12:10
113640	242501	6883	2	0	0	10	10:40	12:10
113641	242501	6890	2	0	0	10	10:40	12:10
113642	242501	6785	3	0	0	11	12:40	14:10
113643	242501	6792	3	0	0	11	12:40	14:10
113644	242501	6799	3	0	0	11	12:40	14:10
113645	242501	6806	3	0	0	11	12:40	14:10
113646	242501	6813	3	0	0	11	12:40	14:10
113647	242501	6820	3	0	0	11	12:40	14:10
113648	242501	6827	3	0	0	11	12:40	14:10
113649	242501	6834	3	0	0	11	12:40	14:10
113650	242501	6841	3	0	0	11	12:40	14:10
113651	242501	6848	3	0	0	11	12:40	14:10
113652	242501	6855	3	0	0	11	12:40	14:10
113653	242501	6862	3	0	0	11	12:40	14:10
113654	242501	6869	3	0	0	11	12:40	14:10
113655	242501	6876	3	0	0	11	12:40	14:10
113656	242501	6883	3	0	0	11	12:40	14:10
113657	242501	6890	3	0	0	11	12:40	14:10
113658	242501	6785	4	0	1	11	14:20	15:50
113659	242501	6792	4	0	1	11	14:20	15:50
113660	242501	6799	4	0	1	11	14:20	15:50
113661	242501	6806	4	0	1	11	14:20	15:50
113662	242501	6813	4	0	1	11	14:20	15:50
113663	242501	6820	4	0	1	11	14:20	15:50
113664	242501	6827	4	0	1	11	14:20	15:50
113665	242501	6834	4	0	1	11	14:20	15:50
113666	242501	6841	4	0	1	11	14:20	15:50
113667	242501	6848	4	0	1	11	14:20	15:50
113668	242501	6855	4	0	1	11	14:20	15:50
113669	242501	6862	4	0	1	11	14:20	15:50
113670	242501	6869	4	0	1	11	14:20	15:50
113671	242501	6876	4	0	1	11	14:20	15:50
113672	242501	6883	4	0	1	11	14:20	15:50
113673	242501	6890	4	0	1	11	14:20	15:50
113674	242501	6785	5	0	1	0	16:20	17:50
113675	242501	6792	5	0	1	0	16:20	17:50
113676	242501	6799	5	0	1	0	16:20	17:50
113677	242501	6806	5	0	1	0	16:20	17:50
113678	242501	6813	5	0	1	0	16:20	17:50
113679	242501	6820	5	0	1	0	16:20	17:50
113680	242501	6827	5	0	1	0	16:20	17:50
113681	242501	6834	5	0	1	0	16:20	17:50
113682	242501	6841	5	0	1	0	16:20	17:50
113683	242501	6848	5	0	1	0	16:20	17:50
113684	242501	6855	5	0	1	0	16:20	17:50
113685	242501	6862	5	0	1	0	16:20	17:50
113686	242501	6869	5	0	1	0	16:20	17:50
113687	242501	6876	5	0	1	0	16:20	17:50
113688	242501	6883	5	0	1	0	16:20	17:50
113689	242501	6890	5	0	1	0	16:20	17:50
113690	242501	6786	1	0	1	125	09:00	10:30
113691	242501	6800	1	0	1	125	09:00	10:30
113692	242501	6814	1	0	1	125	09:00	10:30
113693	242501	6828	1	0	1	125	09:00	10:30
113694	242501	6842	1	0	1	125	09:00	10:30
113695	242501	6856	1	0	1	125	09:00	10:30
113696	242501	6870	1	0	1	125	09:00	10:30
113697	242501	6884	1	0	1	125	09:00	10:30
113698	242501	6786	1	0	1	125	09:00	10:30
113699	242501	6800	1	0	1	125	09:00	10:30
113700	242501	6814	1	0	1	125	09:00	10:30
113701	242501	6828	1	0	1	125	09:00	10:30
113702	242501	6842	1	0	1	125	09:00	10:30
113703	242501	6856	1	0	1	125	09:00	10:30
113704	242501	6870	1	0	1	125	09:00	10:30
113705	242501	6884	1	0	1	125	09:00	10:30
113706	242501	6786	2	0	0	10	10:40	12:10
113707	242501	6800	2	0	0	10	10:40	12:10
113708	242501	6814	2	0	0	10	10:40	12:10
113709	242501	6828	2	0	0	10	10:40	12:10
113710	242501	6842	2	0	0	10	10:40	12:10
113711	242501	6856	2	0	0	10	10:40	12:10
113712	242501	6870	2	0	0	10	10:40	12:10
113713	242501	6884	2	0	0	10	10:40	12:10
113714	242501	6786	3	0	0	10	12:40	14:10
113715	242501	6800	3	0	0	10	12:40	14:10
113716	242501	6814	3	0	0	10	12:40	14:10
113717	242501	6828	3	0	0	10	12:40	14:10
113718	242501	6842	3	0	0	10	12:40	14:10
113719	242501	6856	3	0	0	10	12:40	14:10
113720	242501	6870	3	0	0	10	12:40	14:10
113721	242501	6884	3	0	0	10	12:40	14:10
113722	242501	6781	1	0	0	124	09:00	10:30
113723	242501	6788	1	0	0	124	09:00	10:30
113724	242501	6795	1	0	0	124	09:00	10:30
113725	242501	6802	1	0	0	124	09:00	10:30
113726	242501	6809	1	0	0	124	09:00	10:30
113727	242501	6816	1	0	0	124	09:00	10:30
113728	242501	6823	1	0	0	124	09:00	10:30
113729	242501	6830	1	0	0	124	09:00	10:30
113730	242501	6837	1	0	0	124	09:00	10:30
113731	242501	6844	1	0	0	124	09:00	10:30
113732	242501	6851	1	0	0	124	09:00	10:30
113733	242501	6858	1	0	0	124	09:00	10:30
113734	242501	6865	1	0	0	124	09:00	10:30
113735	242501	6872	1	0	0	124	09:00	10:30
113736	242501	6879	1	0	0	124	09:00	10:30
113737	242501	6886	1	0	0	124	09:00	10:30
113738	242501	6781	2	0	0	1	10:40	12:10
113739	242501	6788	2	0	0	1	10:40	12:10
113740	242501	6795	2	0	0	1	10:40	12:10
113741	242501	6802	2	0	0	1	10:40	12:10
113742	242501	6809	2	0	0	1	10:40	12:10
113743	242501	6816	2	0	0	1	10:40	12:10
113744	242501	6823	2	0	0	1	10:40	12:10
113745	242501	6830	2	0	0	1	10:40	12:10
113746	242501	6837	2	0	0	1	10:40	12:10
113747	242501	6844	2	0	0	1	10:40	12:10
113748	242501	6851	2	0	0	1	10:40	12:10
113749	242501	6858	2	0	0	1	10:40	12:10
113750	242501	6865	2	0	0	1	10:40	12:10
113751	242501	6872	2	0	0	1	10:40	12:10
113752	242501	6879	2	0	0	1	10:40	12:10
113753	242501	6886	2	0	0	1	10:40	12:10
113754	242501	6781	3	0	0	2	12:40	14:10
113755	242501	6788	3	0	0	2	12:40	14:10
113756	242501	6795	3	0	0	2	12:40	14:10
113757	242501	6802	3	0	0	2	12:40	14:10
113758	242501	6809	3	0	0	2	12:40	14:10
113759	242501	6816	3	0	0	2	12:40	14:10
113760	242501	6823	3	0	0	2	12:40	14:10
113761	242501	6830	3	0	0	2	12:40	14:10
113762	242501	6837	3	0	0	2	12:40	14:10
113763	242501	6844	3	0	0	2	12:40	14:10
113764	242501	6851	3	0	0	2	12:40	14:10
113765	242501	6858	3	0	0	2	12:40	14:10
113766	242501	6865	3	0	0	2	12:40	14:10
113767	242501	6872	3	0	0	2	12:40	14:10
113768	242501	6879	3	0	0	2	12:40	14:10
113769	242501	6886	3	0	0	2	12:40	14:10
113770	242501	6782	2	0	0	7	10:40	12:10
113771	242501	6789	2	0	0	7	10:40	12:10
113772	242501	6796	2	0	0	7	10:40	12:10
113773	242501	6803	2	0	0	7	10:40	12:10
113774	242501	6810	2	0	0	7	10:40	12:10
113775	242501	6817	2	0	0	7	10:40	12:10
113776	242501	6824	2	0	0	7	10:40	12:10
113777	242501	6831	2	0	0	7	10:40	12:10
113778	242501	6838	2	0	0	7	10:40	12:10
113779	242501	6845	2	0	0	7	10:40	12:10
113780	242501	6852	2	0	0	7	10:40	12:10
113781	242501	6859	2	0	0	7	10:40	12:10
113782	242501	6866	2	0	0	7	10:40	12:10
113783	242501	6873	2	0	0	7	10:40	12:10
113784	242501	6880	2	0	0	7	10:40	12:10
113785	242501	6887	2	0	0	7	10:40	12:10
113786	242501	6782	3	0	0	21	12:40	14:10
113787	242501	6789	3	0	0	21	12:40	14:10
113788	242501	6796	3	0	0	21	12:40	14:10
113789	242501	6803	3	0	0	21	12:40	14:10
113790	242501	6810	3	0	0	21	12:40	14:10
113791	242501	6817	3	0	0	21	12:40	14:10
113792	242501	6824	3	0	0	21	12:40	14:10
113793	242501	6831	3	0	0	21	12:40	14:10
113794	242501	6838	3	0	0	21	12:40	14:10
113795	242501	6845	3	0	0	21	12:40	14:10
113796	242501	6852	3	0	0	21	12:40	14:10
113797	242501	6859	3	0	0	21	12:40	14:10
113798	242501	6866	3	0	0	21	12:40	14:10
113799	242501	6873	3	0	0	21	12:40	14:10
113800	242501	6880	3	0	0	21	12:40	14:10
113801	242501	6887	3	0	0	21	12:40	14:10
113802	242501	6782	4	0	0	9	14:20	15:50
113803	242501	6789	4	0	0	9	14:20	15:50
113804	242501	6796	4	0	0	9	14:20	15:50
113805	242501	6803	4	0	0	9	14:20	15:50
113806	242501	6810	4	0	0	9	14:20	15:50
113807	242501	6817	4	0	0	9	14:20	15:50
113808	242501	6824	4	0	0	9	14:20	15:50
113809	242501	6831	4	0	0	9	14:20	15:50
113810	242501	6838	4	0	0	9	14:20	15:50
113811	242501	6845	4	0	0	9	14:20	15:50
113812	242501	6852	4	0	0	9	14:20	15:50
113813	242501	6859	4	0	0	9	14:20	15:50
113814	242501	6866	4	0	0	9	14:20	15:50
113815	242501	6873	4	0	0	9	14:20	15:50
113816	242501	6880	4	0	0	9	14:20	15:50
113817	242501	6887	4	0	0	9	14:20	15:50
113818	242501	6783	3	0	0	91	12:40	14:10
113819	242501	6790	3	0	0	91	12:40	14:10
113820	242501	6797	3	0	0	91	12:40	14:10
113821	242501	6804	3	0	0	91	12:40	14:10
113822	242501	6811	3	0	0	91	12:40	14:10
113823	242501	6818	3	0	0	91	12:40	14:10
113824	242501	6825	3	0	0	91	12:40	14:10
113825	242501	6832	3	0	0	91	12:40	14:10
113826	242501	6839	3	0	0	91	12:40	14:10
113827	242501	6846	3	0	0	91	12:40	14:10
113828	242501	6853	3	0	0	91	12:40	14:10
113829	242501	6860	3	0	0	91	12:40	14:10
113830	242501	6867	3	0	0	91	12:40	14:10
113831	242501	6874	3	0	0	91	12:40	14:10
113832	242501	6881	3	0	0	91	12:40	14:10
113833	242501	6888	3	0	0	91	12:40	14:10
113834	242501	6783	4	0	0	0	14:20	15:50
113835	242501	6790	4	0	0	0	14:20	15:50
113836	242501	6797	4	0	0	0	14:20	15:50
113837	242501	6804	4	0	0	0	14:20	15:50
113838	242501	6811	4	0	0	0	14:20	15:50
113839	242501	6818	4	0	0	0	14:20	15:50
113840	242501	6825	4	0	0	0	14:20	15:50
113841	242501	6832	4	0	0	0	14:20	15:50
113842	242501	6839	4	0	0	0	14:20	15:50
113843	242501	6846	4	0	0	0	14:20	15:50
113844	242501	6853	4	0	0	0	14:20	15:50
113845	242501	6860	4	0	0	0	14:20	15:50
113846	242501	6867	4	0	0	0	14:20	15:50
113847	242501	6874	4	0	0	0	14:20	15:50
113848	242501	6881	4	0	0	0	14:20	15:50
113849	242501	6888	4	0	0	0	14:20	15:50
113850	242501	6784	4	0	0	16	14:20	15:50
113851	242501	6791	4	0	0	16	14:20	15:50
113852	242501	6798	4	0	0	16	14:20	15:50
113853	242501	6805	4	0	0	16	14:20	15:50
113854	242501	6812	4	0	0	16	14:20	15:50
113855	242501	6819	4	0	0	16	14:20	15:50
113856	242501	6826	4	0	0	16	14:20	15:50
113857	242501	6833	4	0	0	16	14:20	15:50
113858	242501	6840	4	0	0	16	14:20	15:50
113859	242501	6847	4	0	0	16	14:20	15:50
113860	242501	6854	4	0	0	16	14:20	15:50
113861	242501	6861	4	0	0	16	14:20	15:50
113862	242501	6868	4	0	0	16	14:20	15:50
113863	242501	6875	4	0	0	16	14:20	15:50
113864	242501	6882	4	0	0	16	14:20	15:50
113865	242501	6889	4	0	0	16	14:20	15:50
113866	242501	6784	5	0	0	16	16:20	17:50
113867	242501	6791	5	0	0	16	16:20	17:50
113868	242501	6798	5	0	0	16	16:20	17:50
113869	242501	6805	5	0	0	16	16:20	17:50
113870	242501	6812	5	0	0	16	16:20	17:50
113871	242501	6819	5	0	0	16	16:20	17:50
113872	242501	6826	5	0	0	16	16:20	17:50
113873	242501	6833	5	0	0	16	16:20	17:50
113874	242501	6840	5	0	0	16	16:20	17:50
113875	242501	6847	5	0	0	16	16:20	17:50
113876	242501	6854	5	0	0	16	16:20	17:50
113877	242501	6861	5	0	0	16	16:20	17:50
113878	242501	6868	5	0	0	16	16:20	17:50
113879	242501	6875	5	0	0	16	16:20	17:50
113880	242501	6882	5	0	0	16	16:20	17:50
113881	242501	6889	5	0	0	16	16:20	17:50
113882	242501	6785	3	0	0	10	12:40	14:10
113883	242501	6792	3	0	0	10	12:40	14:10
113884	242501	6799	3	0	0	10	12:40	14:10
113885	242501	6806	3	0	0	10	12:40	14:10
113886	242501	6813	3	0	0	10	12:40	14:10
113887	242501	6820	3	0	0	10	12:40	14:10
113888	242501	6827	3	0	0	10	12:40	14:10
113889	242501	6834	3	0	0	10	12:40	14:10
113890	242501	6841	3	0	0	10	12:40	14:10
113891	242501	6848	3	0	0	10	12:40	14:10
113892	242501	6855	3	0	0	10	12:40	14:10
113893	242501	6862	3	0	0	10	12:40	14:10
113894	242501	6869	3	0	0	10	12:40	14:10
113895	242501	6876	3	0	0	10	12:40	14:10
113896	242501	6883	3	0	0	10	12:40	14:10
113897	242501	6890	3	0	0	10	12:40	14:10
113898	242501	6785	6	0	0	10	18:00	19:30
113899	242501	6792	6	0	0	10	18:00	19:30
113900	242501	6799	6	0	0	10	18:00	19:30
113901	242501	6806	6	0	0	10	18:00	19:30
113902	242501	6813	6	0	0	10	18:00	19:30
113903	242501	6820	6	0	0	10	18:00	19:30
113904	242501	6827	6	0	0	10	18:00	19:30
113905	242501	6834	6	0	0	10	18:00	19:30
113906	242501	6841	6	0	0	10	18:00	19:30
113907	242501	6848	6	0	0	10	18:00	19:30
113908	242501	6855	6	0	0	10	18:00	19:30
113909	242501	6862	6	0	0	10	18:00	19:30
113910	242501	6869	6	0	0	10	18:00	19:30
113911	242501	6876	6	0	0	10	18:00	19:30
113912	242501	6883	6	0	0	10	18:00	19:30
113913	242501	6890	6	0	0	10	18:00	19:30
113914	242501	6786	1	0	1	16	09:00	10:30
113915	242501	6800	1	0	1	16	09:00	10:30
113916	242501	6814	1	0	1	16	09:00	10:30
113917	242501	6828	1	0	1	16	09:00	10:30
113918	242501	6842	1	0	1	16	09:00	10:30
113919	242501	6856	1	0	1	16	09:00	10:30
113920	242501	6870	1	0	1	16	09:00	10:30
113921	242501	6884	1	0	1	16	09:00	10:30
113922	242501	6781	1	0	0	16	09:00	10:30
113923	242501	6788	1	0	0	16	09:00	10:30
113924	242501	6795	1	0	0	16	09:00	10:30
113925	242501	6802	1	0	0	16	09:00	10:30
113926	242501	6809	1	0	0	16	09:00	10:30
113927	242501	6816	1	0	0	16	09:00	10:30
113928	242501	6823	1	0	0	16	09:00	10:30
113929	242501	6830	1	0	0	16	09:00	10:30
113930	242501	6837	1	0	0	16	09:00	10:30
113931	242501	6844	1	0	0	16	09:00	10:30
113932	242501	6851	1	0	0	16	09:00	10:30
113933	242501	6858	1	0	0	16	09:00	10:30
113934	242501	6865	1	0	0	16	09:00	10:30
113935	242501	6872	1	0	0	16	09:00	10:30
113936	242501	6879	1	0	0	16	09:00	10:30
113937	242501	6886	1	0	0	16	09:00	10:30
113938	242501	6781	2	0	0	16	10:40	12:10
113939	242501	6788	2	0	0	16	10:40	12:10
113940	242501	6795	2	0	0	16	10:40	12:10
113941	242501	6802	2	0	0	16	10:40	12:10
113942	242501	6809	2	0	0	16	10:40	12:10
113943	242501	6816	2	0	0	16	10:40	12:10
113944	242501	6823	2	0	0	16	10:40	12:10
113945	242501	6830	2	0	0	16	10:40	12:10
113946	242501	6837	2	0	0	16	10:40	12:10
113947	242501	6844	2	0	0	16	10:40	12:10
113948	242501	6851	2	0	0	16	10:40	12:10
113949	242501	6858	2	0	0	16	10:40	12:10
113950	242501	6865	2	0	0	16	10:40	12:10
113951	242501	6872	2	0	0	16	10:40	12:10
113952	242501	6879	2	0	0	16	10:40	12:10
113953	242501	6886	2	0	0	16	10:40	12:10
113954	242501	6781	3	0	0	10	12:40	14:10
113955	242501	6788	3	0	0	10	12:40	14:10
113956	242501	6795	3	0	0	10	12:40	14:10
113957	242501	6802	3	0	0	10	12:40	14:10
113958	242501	6809	3	0	0	10	12:40	14:10
113959	242501	6816	3	0	0	10	12:40	14:10
113960	242501	6823	3	0	0	10	12:40	14:10
113961	242501	6830	3	0	0	10	12:40	14:10
113962	242501	6837	3	0	0	10	12:40	14:10
113963	242501	6844	3	0	0	10	12:40	14:10
113964	242501	6851	3	0	0	10	12:40	14:10
113965	242501	6858	3	0	0	10	12:40	14:10
113966	242501	6865	3	0	0	10	12:40	14:10
113967	242501	6872	3	0	0	10	12:40	14:10
113968	242501	6879	3	0	0	10	12:40	14:10
113969	242501	6886	3	0	0	10	12:40	14:10
113970	242501	6781	4	0	0	10	14:20	15:50
113971	242501	6788	4	0	0	10	14:20	15:50
113972	242501	6795	4	0	0	10	14:20	15:50
113973	242501	6802	4	0	0	10	14:20	15:50
113974	242501	6809	4	0	0	10	14:20	15:50
113975	242501	6816	4	0	0	10	14:20	15:50
113976	242501	6823	4	0	0	10	14:20	15:50
113977	242501	6830	4	0	0	10	14:20	15:50
113978	242501	6837	4	0	0	10	14:20	15:50
113979	242501	6844	4	0	0	10	14:20	15:50
113980	242501	6851	4	0	0	10	14:20	15:50
113981	242501	6858	4	0	0	10	14:20	15:50
113982	242501	6865	4	0	0	10	14:20	15:50
113983	242501	6872	4	0	0	10	14:20	15:50
113984	242501	6879	4	0	0	10	14:20	15:50
113985	242501	6886	4	0	0	10	14:20	15:50
113986	242501	6782	1	0	0	1	09:00	10:30
113987	242501	6789	1	0	0	1	09:00	10:30
113988	242501	6796	1	0	0	1	09:00	10:30
113989	242501	6803	1	0	0	1	09:00	10:30
113990	242501	6810	1	0	0	1	09:00	10:30
113991	242501	6817	1	0	0	1	09:00	10:30
113992	242501	6824	1	0	0	1	09:00	10:30
113993	242501	6831	1	0	0	1	09:00	10:30
113994	242501	6838	1	0	0	1	09:00	10:30
113995	242501	6845	1	0	0	1	09:00	10:30
113996	242501	6852	1	0	0	1	09:00	10:30
113997	242501	6859	1	0	0	1	09:00	10:30
113998	242501	6866	1	0	0	1	09:00	10:30
113999	242501	6873	1	0	0	1	09:00	10:30
114000	242501	6880	1	0	0	1	09:00	10:30
114001	242501	6887	1	0	0	1	09:00	10:30
114002	242501	6782	2	0	0	21	10:40	12:10
114003	242501	6789	2	0	0	21	10:40	12:10
114004	242501	6796	2	0	0	21	10:40	12:10
114005	242501	6803	2	0	0	21	10:40	12:10
114006	242501	6810	2	0	0	21	10:40	12:10
114007	242501	6817	2	0	0	21	10:40	12:10
114008	242501	6824	2	0	0	21	10:40	12:10
114009	242501	6831	2	0	0	21	10:40	12:10
114010	242501	6838	2	0	0	21	10:40	12:10
114011	242501	6845	2	0	0	21	10:40	12:10
114012	242501	6852	2	0	0	21	10:40	12:10
114013	242501	6859	2	0	0	21	10:40	12:10
114014	242501	6866	2	0	0	21	10:40	12:10
114015	242501	6873	2	0	0	21	10:40	12:10
114016	242501	6880	2	0	0	21	10:40	12:10
114017	242501	6887	2	0	0	21	10:40	12:10
114018	242501	6783	3	0	0	124	12:40	14:10
114019	242501	6790	3	0	0	124	12:40	14:10
114020	242501	6797	3	0	0	124	12:40	14:10
114021	242501	6804	3	0	0	124	12:40	14:10
114022	242501	6811	3	0	0	124	12:40	14:10
114023	242501	6818	3	0	0	124	12:40	14:10
114024	242501	6825	3	0	0	124	12:40	14:10
114025	242501	6832	3	0	0	124	12:40	14:10
114026	242501	6839	3	0	0	124	12:40	14:10
114027	242501	6846	3	0	0	124	12:40	14:10
114028	242501	6853	3	0	0	124	12:40	14:10
114029	242501	6860	3	0	0	124	12:40	14:10
114030	242501	6867	3	0	0	124	12:40	14:10
114031	242501	6874	3	0	0	124	12:40	14:10
114032	242501	6881	3	0	0	124	12:40	14:10
114033	242501	6888	3	0	0	124	12:40	14:10
114034	242501	6783	4	0	0	7	14:20	15:50
114035	242501	6790	4	0	0	7	14:20	15:50
114036	242501	6797	4	0	0	7	14:20	15:50
114037	242501	6804	4	0	0	7	14:20	15:50
114038	242501	6811	4	0	0	7	14:20	15:50
114039	242501	6818	4	0	0	7	14:20	15:50
114040	242501	6825	4	0	0	7	14:20	15:50
114041	242501	6832	4	0	0	7	14:20	15:50
114042	242501	6839	4	0	0	7	14:20	15:50
114043	242501	6846	4	0	0	7	14:20	15:50
114044	242501	6853	4	0	0	7	14:20	15:50
114045	242501	6860	4	0	0	7	14:20	15:50
114046	242501	6867	4	0	0	7	14:20	15:50
114047	242501	6874	4	0	0	7	14:20	15:50
114048	242501	6881	4	0	0	7	14:20	15:50
114049	242501	6888	4	0	0	7	14:20	15:50
114050	242501	6784	4	0	0	9	14:20	15:50
114051	242501	6791	4	0	0	9	14:20	15:50
114052	242501	6798	4	0	0	9	14:20	15:50
114053	242501	6805	4	0	0	9	14:20	15:50
114054	242501	6812	4	0	0	9	14:20	15:50
114055	242501	6819	4	0	0	9	14:20	15:50
114056	242501	6826	4	0	0	9	14:20	15:50
114057	242501	6833	4	0	0	9	14:20	15:50
114058	242501	6840	4	0	0	9	14:20	15:50
114059	242501	6847	4	0	0	9	14:20	15:50
114060	242501	6854	4	0	0	9	14:20	15:50
114061	242501	6861	4	0	0	9	14:20	15:50
114062	242501	6868	4	0	0	9	14:20	15:50
114063	242501	6875	4	0	0	9	14:20	15:50
114064	242501	6882	4	0	0	9	14:20	15:50
114065	242501	6889	4	0	0	9	14:20	15:50
114066	242501	6784	5	0	0	91	16:20	17:50
114067	242501	6791	5	0	0	91	16:20	17:50
114068	242501	6798	5	0	0	91	16:20	17:50
114069	242501	6805	5	0	0	91	16:20	17:50
114070	242501	6812	5	0	0	91	16:20	17:50
114071	242501	6819	5	0	0	91	16:20	17:50
114072	242501	6826	5	0	0	91	16:20	17:50
114073	242501	6833	5	0	0	91	16:20	17:50
114074	242501	6840	5	0	0	91	16:20	17:50
114075	242501	6847	5	0	0	91	16:20	17:50
114076	242501	6854	5	0	0	91	16:20	17:50
114077	242501	6861	5	0	0	91	16:20	17:50
114078	242501	6868	5	0	0	91	16:20	17:50
114079	242501	6875	5	0	0	91	16:20	17:50
114080	242501	6882	5	0	0	91	16:20	17:50
114081	242501	6889	5	0	0	91	16:20	17:50
114082	242501	6785	2	0	0	0	10:40	12:10
114083	242501	6792	2	0	0	0	10:40	12:10
114084	242501	6799	2	0	0	0	10:40	12:10
114085	242501	6806	2	0	0	0	10:40	12:10
114086	242501	6813	2	0	0	0	10:40	12:10
114087	242501	6820	2	0	0	0	10:40	12:10
114088	242501	6827	2	0	0	0	10:40	12:10
114089	242501	6834	2	0	0	0	10:40	12:10
114090	242501	6841	2	0	0	0	10:40	12:10
114091	242501	6848	2	0	0	0	10:40	12:10
114092	242501	6855	2	0	0	0	10:40	12:10
114093	242501	6862	2	0	0	0	10:40	12:10
114094	242501	6869	2	0	0	0	10:40	12:10
114095	242501	6876	2	0	0	0	10:40	12:10
114096	242501	6883	2	0	0	0	10:40	12:10
114097	242501	6890	2	0	0	0	10:40	12:10
114098	242501	6785	3	0	0	2	12:40	14:10
114099	242501	6792	3	0	0	2	12:40	14:10
114100	242501	6799	3	0	0	2	12:40	14:10
114101	242501	6806	3	0	0	2	12:40	14:10
114102	242501	6813	3	0	0	2	12:40	14:10
114103	242501	6820	3	0	0	2	12:40	14:10
114104	242501	6827	3	0	0	2	12:40	14:10
114105	242501	6834	3	0	0	2	12:40	14:10
114106	242501	6841	3	0	0	2	12:40	14:10
114107	242501	6848	3	0	0	2	12:40	14:10
114108	242501	6855	3	0	0	2	12:40	14:10
114109	242501	6862	3	0	0	2	12:40	14:10
114110	242501	6869	3	0	0	2	12:40	14:10
114111	242501	6876	3	0	0	2	12:40	14:10
114112	242501	6883	3	0	0	2	12:40	14:10
114113	242501	6890	3	0	0	2	12:40	14:10
114114	242501	6781	1	0	0	10	09:00	10:30
114115	242501	6788	1	0	0	10	09:00	10:30
114116	242501	6795	1	0	0	10	09:00	10:30
114117	242501	6802	1	0	0	10	09:00	10:30
114118	242501	6809	1	0	0	10	09:00	10:30
114119	242501	6816	1	0	0	10	09:00	10:30
114120	242501	6823	1	0	0	10	09:00	10:30
114121	242501	6830	1	0	0	10	09:00	10:30
114122	242501	6837	1	0	0	10	09:00	10:30
114123	242501	6844	1	0	0	10	09:00	10:30
114124	242501	6851	1	0	0	10	09:00	10:30
114125	242501	6858	1	0	0	10	09:00	10:30
114126	242501	6865	1	0	0	10	09:00	10:30
114127	242501	6872	1	0	0	10	09:00	10:30
114128	242501	6879	1	0	0	10	09:00	10:30
114129	242501	6886	1	0	0	10	09:00	10:30
114130	242501	6781	2	0	0	10	10:40	12:10
114131	242501	6788	2	0	0	10	10:40	12:10
114132	242501	6795	2	0	0	10	10:40	12:10
114133	242501	6802	2	0	0	10	10:40	12:10
114134	242501	6809	2	0	0	10	10:40	12:10
114135	242501	6816	2	0	0	10	10:40	12:10
114136	242501	6823	2	0	0	10	10:40	12:10
114137	242501	6830	2	0	0	10	10:40	12:10
114138	242501	6837	2	0	0	10	10:40	12:10
114139	242501	6844	2	0	0	10	10:40	12:10
114140	242501	6851	2	0	0	10	10:40	12:10
114141	242501	6858	2	0	0	10	10:40	12:10
114142	242501	6865	2	0	0	10	10:40	12:10
114143	242501	6872	2	0	0	10	10:40	12:10
114144	242501	6879	2	0	0	10	10:40	12:10
114145	242501	6886	2	0	0	10	10:40	12:10
114146	242501	6782	3	0	0	7	12:40	14:10
114147	242501	6789	3	0	0	7	12:40	14:10
114148	242501	6796	3	0	0	7	12:40	14:10
114149	242501	6803	3	0	0	7	12:40	14:10
114150	242501	6810	3	0	0	7	12:40	14:10
114151	242501	6817	3	0	0	7	12:40	14:10
114152	242501	6824	3	0	0	7	12:40	14:10
114153	242501	6831	3	0	0	7	12:40	14:10
114154	242501	6838	3	0	0	7	12:40	14:10
114155	242501	6845	3	0	0	7	12:40	14:10
114156	242501	6852	3	0	0	7	12:40	14:10
114157	242501	6859	3	0	0	7	12:40	14:10
114158	242501	6866	3	0	0	7	12:40	14:10
114159	242501	6873	3	0	0	7	12:40	14:10
114160	242501	6880	3	0	0	7	12:40	14:10
114161	242501	6887	3	0	0	7	12:40	14:10
114162	242501	6782	4	0	0	9	14:20	15:50
114163	242501	6789	4	0	0	9	14:20	15:50
114164	242501	6796	4	0	0	9	14:20	15:50
114165	242501	6803	4	0	0	9	14:20	15:50
114166	242501	6810	4	0	0	9	14:20	15:50
114167	242501	6817	4	0	0	9	14:20	15:50
114168	242501	6824	4	0	0	9	14:20	15:50
114169	242501	6831	4	0	0	9	14:20	15:50
114170	242501	6838	4	0	0	9	14:20	15:50
114171	242501	6845	4	0	0	9	14:20	15:50
114172	242501	6852	4	0	0	9	14:20	15:50
114173	242501	6859	4	0	0	9	14:20	15:50
114174	242501	6866	4	0	0	9	14:20	15:50
114175	242501	6873	4	0	0	9	14:20	15:50
114176	242501	6880	4	0	0	9	14:20	15:50
114177	242501	6887	4	0	0	9	14:20	15:50
114178	242501	6783	3	0	0	21	12:40	14:10
114179	242501	6790	3	0	0	21	12:40	14:10
114180	242501	6797	3	0	0	21	12:40	14:10
114181	242501	6804	3	0	0	21	12:40	14:10
114182	242501	6811	3	0	0	21	12:40	14:10
114183	242501	6818	3	0	0	21	12:40	14:10
114184	242501	6825	3	0	0	21	12:40	14:10
114185	242501	6832	3	0	0	21	12:40	14:10
114186	242501	6839	3	0	0	21	12:40	14:10
114187	242501	6846	3	0	0	21	12:40	14:10
114188	242501	6853	3	0	0	21	12:40	14:10
114189	242501	6860	3	0	0	21	12:40	14:10
114190	242501	6867	3	0	0	21	12:40	14:10
114191	242501	6874	3	0	0	21	12:40	14:10
114192	242501	6881	3	0	0	21	12:40	14:10
114193	242501	6888	3	0	0	21	12:40	14:10
114194	242501	6783	4	0	0	1	14:20	15:50
114195	242501	6790	4	0	0	1	14:20	15:50
114196	242501	6797	4	0	0	1	14:20	15:50
114197	242501	6804	4	0	0	1	14:20	15:50
114198	242501	6811	4	0	0	1	14:20	15:50
114199	242501	6818	4	0	0	1	14:20	15:50
114200	242501	6825	4	0	0	1	14:20	15:50
114201	242501	6832	4	0	0	1	14:20	15:50
114202	242501	6839	4	0	0	1	14:20	15:50
114203	242501	6846	4	0	0	1	14:20	15:50
114204	242501	6853	4	0	0	1	14:20	15:50
114205	242501	6860	4	0	0	1	14:20	15:50
114206	242501	6867	4	0	0	1	14:20	15:50
114207	242501	6874	4	0	0	1	14:20	15:50
114208	242501	6881	4	0	0	1	14:20	15:50
114209	242501	6888	4	0	0	1	14:20	15:50
114210	242501	6784	4	0	1	2	14:20	15:50
114211	242501	6791	4	0	1	2	14:20	15:50
114212	242501	6798	4	0	1	2	14:20	15:50
114213	242501	6805	4	0	1	2	14:20	15:50
114214	242501	6812	4	0	1	2	14:20	15:50
114215	242501	6819	4	0	1	2	14:20	15:50
114216	242501	6826	4	0	1	2	14:20	15:50
114217	242501	6833	4	0	1	2	14:20	15:50
114218	242501	6840	4	0	1	2	14:20	15:50
114219	242501	6847	4	0	1	2	14:20	15:50
114220	242501	6854	4	0	1	2	14:20	15:50
114221	242501	6861	4	0	1	2	14:20	15:50
114222	242501	6868	4	0	1	2	14:20	15:50
114223	242501	6875	4	0	1	2	14:20	15:50
114224	242501	6882	4	0	1	2	14:20	15:50
114225	242501	6889	4	0	1	2	14:20	15:50
114226	242501	6784	5	0	0	91	16:20	17:50
114227	242501	6791	5	0	0	91	16:20	17:50
114228	242501	6798	5	0	0	91	16:20	17:50
114229	242501	6805	5	0	0	91	16:20	17:50
114230	242501	6812	5	0	0	91	16:20	17:50
114231	242501	6819	5	0	0	91	16:20	17:50
114232	242501	6826	5	0	0	91	16:20	17:50
114233	242501	6833	5	0	0	91	16:20	17:50
114234	242501	6840	5	0	0	91	16:20	17:50
114235	242501	6847	5	0	0	91	16:20	17:50
114236	242501	6854	5	0	0	91	16:20	17:50
114237	242501	6861	5	0	0	91	16:20	17:50
114238	242501	6868	5	0	0	91	16:20	17:50
114239	242501	6875	5	0	0	91	16:20	17:50
114240	242501	6882	5	0	0	91	16:20	17:50
114241	242501	6889	5	0	0	91	16:20	17:50
114242	242501	6785	2	0	0	124	10:40	12:10
114243	242501	6792	2	0	0	124	10:40	12:10
114244	242501	6799	2	0	0	124	10:40	12:10
114245	242501	6806	2	0	0	124	10:40	12:10
114246	242501	6813	2	0	0	124	10:40	12:10
114247	242501	6820	2	0	0	124	10:40	12:10
114248	242501	6827	2	0	0	124	10:40	12:10
114249	242501	6834	2	0	0	124	10:40	12:10
114250	242501	6841	2	0	0	124	10:40	12:10
114251	242501	6848	2	0	0	124	10:40	12:10
114252	242501	6855	2	0	0	124	10:40	12:10
114253	242501	6862	2	0	0	124	10:40	12:10
114254	242501	6869	2	0	0	124	10:40	12:10
114255	242501	6876	2	0	0	124	10:40	12:10
114256	242501	6883	2	0	0	124	10:40	12:10
114257	242501	6890	2	0	0	124	10:40	12:10
114258	242501	6785	3	0	0	0	12:40	14:10
114259	242501	6792	3	0	0	0	12:40	14:10
114260	242501	6799	3	0	0	0	12:40	14:10
114261	242501	6806	3	0	0	0	12:40	14:10
114262	242501	6813	3	0	0	0	12:40	14:10
114263	242501	6820	3	0	0	0	12:40	14:10
114264	242501	6827	3	0	0	0	12:40	14:10
114265	242501	6834	3	0	0	0	12:40	14:10
114266	242501	6841	3	0	0	0	12:40	14:10
114267	242501	6848	3	0	0	0	12:40	14:10
114268	242501	6855	3	0	0	0	12:40	14:10
114269	242501	6862	3	0	0	0	12:40	14:10
114270	242501	6869	3	0	0	0	12:40	14:10
114271	242501	6876	3	0	0	0	12:40	14:10
114272	242501	6883	3	0	0	0	12:40	14:10
114273	242501	6890	3	0	0	0	12:40	14:10
114274	242501	6793	2	0	0	16	10:40	12:10
114275	242501	6807	2	0	0	16	10:40	12:10
114276	242501	6821	2	0	0	16	10:40	12:10
114277	242501	6835	2	0	0	16	10:40	12:10
114278	242501	6849	2	0	0	16	10:40	12:10
114279	242501	6863	2	0	0	16	10:40	12:10
114280	242501	6877	2	0	0	16	10:40	12:10
114281	242501	6891	2	0	0	16	10:40	12:10
114282	242501	6793	3	0	0	16	12:40	14:10
114283	242501	6807	3	0	0	16	12:40	14:10
114284	242501	6821	3	0	0	16	12:40	14:10
114285	242501	6835	3	0	0	16	12:40	14:10
114286	242501	6849	3	0	0	16	12:40	14:10
114287	242501	6863	3	0	0	16	12:40	14:10
114288	242501	6877	3	0	0	16	12:40	14:10
114289	242501	6891	3	0	0	16	12:40	14:10
114290	242501	6793	4	0	0	16	14:20	15:50
114291	242501	6807	4	0	0	16	14:20	15:50
114292	242501	6821	4	0	0	16	14:20	15:50
114293	242501	6835	4	0	0	16	14:20	15:50
114294	242501	6849	4	0	0	16	14:20	15:50
114295	242501	6863	4	0	0	16	14:20	15:50
114296	242501	6877	4	0	0	16	14:20	15:50
114297	242501	6891	4	0	0	16	14:20	15:50
114298	242501	6793	5	0	0	16	16:20	17:50
114299	242501	6807	5	0	0	16	16:20	17:50
114300	242501	6821	5	0	0	16	16:20	17:50
114301	242501	6835	5	0	0	16	16:20	17:50
114302	242501	6849	5	0	0	16	16:20	17:50
114303	242501	6863	5	0	0	16	16:20	17:50
114304	242501	6877	5	0	0	16	16:20	17:50
114305	242501	6891	5	0	0	16	16:20	17:50
114306	242501	6781	3	0	1	15	12:40	14:10
114307	242501	6788	3	0	1	15	12:40	14:10
114308	242501	6795	3	0	1	15	12:40	14:10
114309	242501	6802	3	0	1	15	12:40	14:10
114310	242501	6809	3	0	1	15	12:40	14:10
114311	242501	6816	3	0	1	15	12:40	14:10
114312	242501	6823	3	0	1	15	12:40	14:10
114313	242501	6830	3	0	1	15	12:40	14:10
114314	242501	6837	3	0	1	15	12:40	14:10
114315	242501	6844	3	0	1	15	12:40	14:10
114316	242501	6851	3	0	1	15	12:40	14:10
114317	242501	6858	3	0	1	15	12:40	14:10
114318	242501	6865	3	0	1	15	12:40	14:10
114319	242501	6872	3	0	1	15	12:40	14:10
114320	242501	6879	3	0	1	15	12:40	14:10
114321	242501	6886	3	0	1	15	12:40	14:10
114322	242501	6781	4	0	0	95	14:20	15:50
114323	242501	6788	4	0	0	95	14:20	15:50
114324	242501	6795	4	0	0	95	14:20	15:50
114325	242501	6802	4	0	0	95	14:20	15:50
114326	242501	6809	4	0	0	95	14:20	15:50
114327	242501	6816	4	0	0	95	14:20	15:50
114328	242501	6823	4	0	0	95	14:20	15:50
114329	242501	6830	4	0	0	95	14:20	15:50
114330	242501	6837	4	0	0	95	14:20	15:50
114331	242501	6844	4	0	0	95	14:20	15:50
114332	242501	6851	4	0	0	95	14:20	15:50
114333	242501	6858	4	0	0	95	14:20	15:50
114334	242501	6865	4	0	0	95	14:20	15:50
114335	242501	6872	4	0	0	95	14:20	15:50
114336	242501	6879	4	0	0	95	14:20	15:50
114337	242501	6886	4	0	0	95	14:20	15:50
114338	242501	6781	5	0	0	21	16:20	17:50
114339	242501	6788	5	0	0	21	16:20	17:50
114340	242501	6795	5	0	0	21	16:20	17:50
114341	242501	6802	5	0	0	21	16:20	17:50
114342	242501	6809	5	0	0	21	16:20	17:50
114343	242501	6816	5	0	0	21	16:20	17:50
114344	242501	6823	5	0	0	21	16:20	17:50
114345	242501	6830	5	0	0	21	16:20	17:50
114346	242501	6837	5	0	0	21	16:20	17:50
114347	242501	6844	5	0	0	21	16:20	17:50
114348	242501	6851	5	0	0	21	16:20	17:50
114349	242501	6858	5	0	0	21	16:20	17:50
114350	242501	6865	5	0	0	21	16:20	17:50
114351	242501	6872	5	0	0	21	16:20	17:50
114352	242501	6879	5	0	0	21	16:20	17:50
114353	242501	6886	5	0	0	21	16:20	17:50
114354	242501	6781	6	0	0	96	18:00	19:30
114355	242501	6788	6	0	0	96	18:00	19:30
114356	242501	6795	6	0	0	96	18:00	19:30
114357	242501	6802	6	0	0	96	18:00	19:30
114358	242501	6809	6	0	0	96	18:00	19:30
114359	242501	6816	6	0	0	96	18:00	19:30
114360	242501	6823	6	0	0	96	18:00	19:30
114361	242501	6830	6	0	0	96	18:00	19:30
114362	242501	6837	6	0	0	96	18:00	19:30
114363	242501	6844	6	0	0	96	18:00	19:30
114364	242501	6851	6	0	0	96	18:00	19:30
114365	242501	6858	6	0	0	96	18:00	19:30
114366	242501	6865	6	0	0	96	18:00	19:30
114367	242501	6872	6	0	0	96	18:00	19:30
114368	242501	6879	6	0	0	96	18:00	19:30
114369	242501	6886	6	0	0	96	18:00	19:30
114370	242501	6782	1	0	0	97	09:00	10:30
114371	242501	6796	1	0	0	97	09:00	10:30
114372	242501	6810	1	0	0	97	09:00	10:30
114373	242501	6824	1	0	0	97	09:00	10:30
114374	242501	6838	1	0	0	97	09:00	10:30
114375	242501	6852	1	0	0	97	09:00	10:30
114376	242501	6866	1	0	0	97	09:00	10:30
114377	242501	6880	1	0	0	97	09:00	10:30
114378	242501	6789	1	0	1	97	09:00	10:30
114379	242501	6803	1	0	1	97	09:00	10:30
114380	242501	6817	1	0	1	97	09:00	10:30
114381	242501	6831	1	0	1	97	09:00	10:30
114382	242501	6845	1	0	1	97	09:00	10:30
114383	242501	6859	1	0	1	97	09:00	10:30
114384	242501	6873	1	0	1	97	09:00	10:30
114385	242501	6887	1	0	1	97	09:00	10:30
114386	242501	6782	2	0	1	96	10:40	12:10
114387	242501	6789	2	0	1	96	10:40	12:10
114388	242501	6796	2	0	1	96	10:40	12:10
114389	242501	6803	2	0	1	96	10:40	12:10
114390	242501	6810	2	0	1	96	10:40	12:10
114391	242501	6817	2	0	1	96	10:40	12:10
114392	242501	6824	2	0	1	96	10:40	12:10
114393	242501	6831	2	0	1	96	10:40	12:10
114394	242501	6838	2	0	1	96	10:40	12:10
114395	242501	6845	2	0	1	96	10:40	12:10
114396	242501	6852	2	0	1	96	10:40	12:10
114397	242501	6859	2	0	1	96	10:40	12:10
114398	242501	6866	2	0	1	96	10:40	12:10
114399	242501	6873	2	0	1	96	10:40	12:10
114400	242501	6880	2	0	1	96	10:40	12:10
114401	242501	6887	2	0	1	96	10:40	12:10
114402	242501	6782	3	0	0	96	12:40	14:10
114403	242501	6789	3	0	0	96	12:40	14:10
114404	242501	6796	3	0	0	96	12:40	14:10
114405	242501	6803	3	0	0	96	12:40	14:10
114406	242501	6810	3	0	0	96	12:40	14:10
114407	242501	6817	3	0	0	96	12:40	14:10
114408	242501	6824	3	0	0	96	12:40	14:10
114409	242501	6831	3	0	0	96	12:40	14:10
114410	242501	6838	3	0	0	96	12:40	14:10
114411	242501	6845	3	0	0	96	12:40	14:10
114412	242501	6852	3	0	0	96	12:40	14:10
114413	242501	6859	3	0	0	96	12:40	14:10
114414	242501	6866	3	0	0	96	12:40	14:10
114415	242501	6873	3	0	0	96	12:40	14:10
114416	242501	6880	3	0	0	96	12:40	14:10
114417	242501	6887	3	0	0	96	12:40	14:10
114418	242501	6789	4	0	1	98	14:20	15:50
114419	242501	6803	4	0	1	98	14:20	15:50
114420	242501	6817	4	0	1	98	14:20	15:50
114421	242501	6831	4	0	1	98	14:20	15:50
114422	242501	6845	4	0	1	98	14:20	15:50
114423	242501	6859	4	0	1	98	14:20	15:50
114424	242501	6873	4	0	1	98	14:20	15:50
114425	242501	6887	4	0	1	98	14:20	15:50
114426	242501	6789	5	0	0	98	16:20	17:50
114427	242501	6803	5	0	0	98	16:20	17:50
114428	242501	6817	5	0	0	98	16:20	17:50
114429	242501	6831	5	0	0	98	16:20	17:50
114430	242501	6845	5	0	0	98	16:20	17:50
114431	242501	6859	5	0	0	98	16:20	17:50
114432	242501	6873	5	0	0	98	16:20	17:50
114433	242501	6887	5	0	0	98	16:20	17:50
114434	242501	6783	1	0	0	9	09:00	10:30
114435	242501	6790	1	0	0	9	09:00	10:30
114436	242501	6797	1	0	0	9	09:00	10:30
114437	242501	6804	1	0	0	9	09:00	10:30
114438	242501	6811	1	0	0	9	09:00	10:30
114439	242501	6818	1	0	0	9	09:00	10:30
114440	242501	6825	1	0	0	9	09:00	10:30
114441	242501	6832	1	0	0	9	09:00	10:30
114442	242501	6839	1	0	0	9	09:00	10:30
114443	242501	6846	1	0	0	9	09:00	10:30
114444	242501	6853	1	0	0	9	09:00	10:30
114445	242501	6860	1	0	0	9	09:00	10:30
114446	242501	6867	1	0	0	9	09:00	10:30
114447	242501	6874	1	0	0	9	09:00	10:30
114448	242501	6881	1	0	0	9	09:00	10:30
114449	242501	6888	1	0	0	9	09:00	10:30
114450	242501	6783	2	0	0	8	10:40	12:10
114451	242501	6790	2	0	0	8	10:40	12:10
114452	242501	6797	2	0	0	8	10:40	12:10
114453	242501	6804	2	0	0	8	10:40	12:10
114454	242501	6811	2	0	0	8	10:40	12:10
114455	242501	6818	2	0	0	8	10:40	12:10
114456	242501	6825	2	0	0	8	10:40	12:10
114457	242501	6832	2	0	0	8	10:40	12:10
114458	242501	6839	2	0	0	8	10:40	12:10
114459	242501	6846	2	0	0	8	10:40	12:10
114460	242501	6853	2	0	0	8	10:40	12:10
114461	242501	6860	2	0	0	8	10:40	12:10
114462	242501	6867	2	0	0	8	10:40	12:10
114463	242501	6874	2	0	0	8	10:40	12:10
114464	242501	6881	2	0	0	8	10:40	12:10
114465	242501	6888	2	0	0	8	10:40	12:10
114466	242501	6783	3	0	1	96	12:40	14:10
114467	242501	6790	3	0	1	96	12:40	14:10
114468	242501	6797	3	0	1	96	12:40	14:10
114469	242501	6804	3	0	1	96	12:40	14:10
114470	242501	6811	3	0	1	96	12:40	14:10
114471	242501	6818	3	0	1	96	12:40	14:10
114472	242501	6825	3	0	1	96	12:40	14:10
114473	242501	6832	3	0	1	96	12:40	14:10
114474	242501	6839	3	0	1	96	12:40	14:10
114475	242501	6846	3	0	1	96	12:40	14:10
114476	242501	6853	3	0	1	96	12:40	14:10
114477	242501	6860	3	0	1	96	12:40	14:10
114478	242501	6867	3	0	1	96	12:40	14:10
114479	242501	6874	3	0	1	96	12:40	14:10
114480	242501	6881	3	0	1	96	12:40	14:10
114481	242501	6888	3	0	1	96	12:40	14:10
114482	242501	6783	4	0	1	21	14:20	15:50
114483	242501	6790	4	0	1	21	14:20	15:50
114484	242501	6797	4	0	1	21	14:20	15:50
114485	242501	6804	4	0	1	21	14:20	15:50
114486	242501	6811	4	0	1	21	14:20	15:50
114487	242501	6818	4	0	1	21	14:20	15:50
114488	242501	6825	4	0	1	21	14:20	15:50
114489	242501	6832	4	0	1	21	14:20	15:50
114490	242501	6839	4	0	1	21	14:20	15:50
114491	242501	6846	4	0	1	21	14:20	15:50
114492	242501	6853	4	0	1	21	14:20	15:50
114493	242501	6860	4	0	1	21	14:20	15:50
114494	242501	6867	4	0	1	21	14:20	15:50
114495	242501	6874	4	0	1	21	14:20	15:50
114496	242501	6881	4	0	1	21	14:20	15:50
114497	242501	6888	4	0	1	21	14:20	15:50
114498	242501	6790	5	0	1	17	16:20	17:50
114499	242501	6804	5	0	1	17	16:20	17:50
114500	242501	6818	5	0	1	17	16:20	17:50
114501	242501	6832	5	0	1	17	16:20	17:50
114502	242501	6846	5	0	1	17	16:20	17:50
114503	242501	6860	5	0	1	17	16:20	17:50
114504	242501	6874	5	0	1	17	16:20	17:50
114505	242501	6888	5	0	1	17	16:20	17:50
114506	242501	6791	2	0	0	112	10:40	12:10
114507	242501	6805	2	0	0	112	10:40	12:10
114508	242501	6819	2	0	0	112	10:40	12:10
114509	242501	6833	2	0	0	112	10:40	12:10
114510	242501	6847	2	0	0	112	10:40	12:10
114511	242501	6861	2	0	0	112	10:40	12:10
114512	242501	6875	2	0	0	112	10:40	12:10
114513	242501	6889	2	0	0	112	10:40	12:10
114514	242501	6791	3	0	0	112	12:40	14:10
114515	242501	6805	3	0	0	112	12:40	14:10
114516	242501	6819	3	0	0	112	12:40	14:10
114517	242501	6833	3	0	0	112	12:40	14:10
114518	242501	6847	3	0	0	112	12:40	14:10
114519	242501	6861	3	0	0	112	12:40	14:10
114520	242501	6875	3	0	0	112	12:40	14:10
114521	242501	6889	3	0	0	112	12:40	14:10
114522	242501	6784	4	0	1	100	14:20	15:50
114523	242501	6798	4	0	1	100	14:20	15:50
114524	242501	6812	4	0	1	100	14:20	15:50
114525	242501	6826	4	0	1	100	14:20	15:50
114526	242501	6840	4	0	1	100	14:20	15:50
114527	242501	6854	4	0	1	100	14:20	15:50
114528	242501	6868	4	0	1	100	14:20	15:50
114529	242501	6882	4	0	1	100	14:20	15:50
114530	242501	6784	5	0	0	100	16:20	17:50
114531	242501	6798	5	0	0	100	16:20	17:50
114532	242501	6812	5	0	0	100	16:20	17:50
114533	242501	6826	5	0	0	100	16:20	17:50
114534	242501	6840	5	0	0	100	16:20	17:50
114535	242501	6854	5	0	0	100	16:20	17:50
114536	242501	6868	5	0	0	100	16:20	17:50
114537	242501	6882	5	0	0	100	16:20	17:50
114538	242501	6785	3	0	1	18	12:40	14:10
114539	242501	6799	3	0	1	18	12:40	14:10
114540	242501	6813	3	0	1	18	12:40	14:10
114541	242501	6827	3	0	1	18	12:40	14:10
114542	242501	6841	3	0	1	18	12:40	14:10
114543	242501	6855	3	0	1	18	12:40	14:10
114544	242501	6869	3	0	1	18	12:40	14:10
114545	242501	6883	3	0	1	18	12:40	14:10
114546	242501	6785	4	0	0	98	14:20	15:50
114547	242501	6799	4	0	0	98	14:20	15:50
114548	242501	6813	4	0	0	98	14:20	15:50
114549	242501	6827	4	0	0	98	14:20	15:50
114550	242501	6841	4	0	0	98	14:20	15:50
114551	242501	6855	4	0	0	98	14:20	15:50
114552	242501	6869	4	0	0	98	14:20	15:50
114553	242501	6883	4	0	0	98	14:20	15:50
114554	242501	6792	4	0	0	17	14:20	15:50
114555	242501	6806	4	0	0	17	14:20	15:50
114556	242501	6820	4	0	0	17	14:20	15:50
114557	242501	6834	4	0	0	17	14:20	15:50
114558	242501	6848	4	0	0	17	14:20	15:50
114559	242501	6862	4	0	0	17	14:20	15:50
114560	242501	6876	4	0	0	17	14:20	15:50
114561	242501	6890	4	0	0	17	14:20	15:50
114562	242501	6785	5	0	0	18	16:20	17:50
114563	242501	6792	5	0	0	18	16:20	17:50
114564	242501	6799	5	0	0	18	16:20	17:50
114565	242501	6806	5	0	0	18	16:20	17:50
114566	242501	6813	5	0	0	18	16:20	17:50
114567	242501	6820	5	0	0	18	16:20	17:50
114568	242501	6827	5	0	0	18	16:20	17:50
114569	242501	6834	5	0	0	18	16:20	17:50
114570	242501	6841	5	0	0	18	16:20	17:50
114571	242501	6848	5	0	0	18	16:20	17:50
114572	242501	6855	5	0	0	18	16:20	17:50
114573	242501	6862	5	0	0	18	16:20	17:50
114574	242501	6869	5	0	0	18	16:20	17:50
114575	242501	6876	5	0	0	18	16:20	17:50
114576	242501	6883	5	0	0	18	16:20	17:50
114577	242501	6890	5	0	0	18	16:20	17:50
114578	242501	6781	4	0	0	21	14:20	15:50
114579	242501	6788	4	0	0	21	14:20	15:50
114580	242501	6795	4	0	0	21	14:20	15:50
114581	242501	6802	4	0	0	21	14:20	15:50
114582	242501	6809	4	0	0	21	14:20	15:50
114583	242501	6816	4	0	0	21	14:20	15:50
114584	242501	6823	4	0	0	21	14:20	15:50
114585	242501	6830	4	0	0	21	14:20	15:50
114586	242501	6837	4	0	0	21	14:20	15:50
114587	242501	6844	4	0	0	21	14:20	15:50
114588	242501	6851	4	0	0	21	14:20	15:50
114589	242501	6858	4	0	0	21	14:20	15:50
114590	242501	6865	4	0	0	21	14:20	15:50
114591	242501	6872	4	0	0	21	14:20	15:50
114592	242501	6879	4	0	0	21	14:20	15:50
114593	242501	6886	4	0	0	21	14:20	15:50
114594	242501	6781	5	0	0	96	16:20	17:50
114595	242501	6788	5	0	0	96	16:20	17:50
114596	242501	6795	5	0	0	96	16:20	17:50
114597	242501	6802	5	0	0	96	16:20	17:50
114598	242501	6809	5	0	0	96	16:20	17:50
114599	242501	6816	5	0	0	96	16:20	17:50
114600	242501	6823	5	0	0	96	16:20	17:50
114601	242501	6830	5	0	0	96	16:20	17:50
114602	242501	6837	5	0	0	96	16:20	17:50
114603	242501	6844	5	0	0	96	16:20	17:50
114604	242501	6851	5	0	0	96	16:20	17:50
114605	242501	6858	5	0	0	96	16:20	17:50
114606	242501	6865	5	0	0	96	16:20	17:50
114607	242501	6872	5	0	0	96	16:20	17:50
114608	242501	6879	5	0	0	96	16:20	17:50
114609	242501	6886	5	0	0	96	16:20	17:50
114610	242501	6782	1	0	0	17	09:00	10:30
114611	242501	6796	1	0	0	17	09:00	10:30
114612	242501	6810	1	0	0	17	09:00	10:30
114613	242501	6824	1	0	0	17	09:00	10:30
114614	242501	6838	1	0	0	17	09:00	10:30
114615	242501	6852	1	0	0	17	09:00	10:30
114616	242501	6866	1	0	0	17	09:00	10:30
114617	242501	6880	1	0	0	17	09:00	10:30
114618	242501	6789	1	0	1	97	09:00	10:30
114619	242501	6803	1	0	1	97	09:00	10:30
114620	242501	6817	1	0	1	97	09:00	10:30
114621	242501	6831	1	0	1	97	09:00	10:30
114622	242501	6845	1	0	1	97	09:00	10:30
114623	242501	6859	1	0	1	97	09:00	10:30
114624	242501	6873	1	0	1	97	09:00	10:30
114625	242501	6887	1	0	1	97	09:00	10:30
114626	242501	6782	3	0	0	8	12:40	14:10
114627	242501	6789	3	0	0	8	12:40	14:10
114628	242501	6796	3	0	0	8	12:40	14:10
114629	242501	6803	3	0	0	8	12:40	14:10
114630	242501	6810	3	0	0	8	12:40	14:10
114631	242501	6817	3	0	0	8	12:40	14:10
114632	242501	6824	3	0	0	8	12:40	14:10
114633	242501	6831	3	0	0	8	12:40	14:10
114634	242501	6838	3	0	0	8	12:40	14:10
114635	242501	6845	3	0	0	8	12:40	14:10
114636	242501	6852	3	0	0	8	12:40	14:10
114637	242501	6859	3	0	0	8	12:40	14:10
114638	242501	6866	3	0	0	8	12:40	14:10
114639	242501	6873	3	0	0	8	12:40	14:10
114640	242501	6880	3	0	0	8	12:40	14:10
114641	242501	6887	3	0	0	8	12:40	14:10
114642	242501	6782	4	0	0	97	14:20	15:50
114643	242501	6796	4	0	0	97	14:20	15:50
114644	242501	6810	4	0	0	97	14:20	15:50
114645	242501	6824	4	0	0	97	14:20	15:50
114646	242501	6838	4	0	0	97	14:20	15:50
114647	242501	6852	4	0	0	97	14:20	15:50
114648	242501	6866	4	0	0	97	14:20	15:50
114649	242501	6880	4	0	0	97	14:20	15:50
114650	242501	6782	5	0	0	98	16:20	17:50
114651	242501	6796	5	0	0	98	16:20	17:50
114652	242501	6810	5	0	0	98	16:20	17:50
114653	242501	6824	5	0	0	98	16:20	17:50
114654	242501	6838	5	0	0	98	16:20	17:50
114655	242501	6852	5	0	0	98	16:20	17:50
114656	242501	6866	5	0	0	98	16:20	17:50
114657	242501	6880	5	0	0	98	16:20	17:50
114658	242501	6783	1	0	0	9	09:00	10:30
114659	242501	6790	1	0	0	9	09:00	10:30
114660	242501	6797	1	0	0	9	09:00	10:30
114661	242501	6804	1	0	0	9	09:00	10:30
114662	242501	6811	1	0	0	9	09:00	10:30
114663	242501	6818	1	0	0	9	09:00	10:30
114664	242501	6825	1	0	0	9	09:00	10:30
114665	242501	6832	1	0	0	9	09:00	10:30
114666	242501	6839	1	0	0	9	09:00	10:30
114667	242501	6846	1	0	0	9	09:00	10:30
114668	242501	6853	1	0	0	9	09:00	10:30
114669	242501	6860	1	0	0	9	09:00	10:30
114670	242501	6867	1	0	0	9	09:00	10:30
114671	242501	6874	1	0	0	9	09:00	10:30
114672	242501	6881	1	0	0	9	09:00	10:30
114673	242501	6888	1	0	0	9	09:00	10:30
114674	242501	6783	2	0	0	95	10:40	12:10
114675	242501	6790	2	0	0	95	10:40	12:10
114676	242501	6797	2	0	0	95	10:40	12:10
114677	242501	6804	2	0	0	95	10:40	12:10
114678	242501	6811	2	0	0	95	10:40	12:10
114679	242501	6818	2	0	0	95	10:40	12:10
114680	242501	6825	2	0	0	95	10:40	12:10
114681	242501	6832	2	0	0	95	10:40	12:10
114682	242501	6839	2	0	0	95	10:40	12:10
114683	242501	6846	2	0	0	95	10:40	12:10
114684	242501	6853	2	0	0	95	10:40	12:10
114685	242501	6860	2	0	0	95	10:40	12:10
114686	242501	6867	2	0	0	95	10:40	12:10
114687	242501	6874	2	0	0	95	10:40	12:10
114688	242501	6881	2	0	0	95	10:40	12:10
114689	242501	6888	2	0	0	95	10:40	12:10
114690	242501	6790	5	0	1	17	16:20	17:50
114691	242501	6804	5	0	1	17	16:20	17:50
114692	242501	6818	5	0	1	17	16:20	17:50
114693	242501	6832	5	0	1	17	16:20	17:50
114694	242501	6846	5	0	1	17	16:20	17:50
114695	242501	6860	5	0	1	17	16:20	17:50
114696	242501	6874	5	0	1	17	16:20	17:50
114697	242501	6888	5	0	1	17	16:20	17:50
114698	242501	6784	4	0	1	100	14:20	15:50
114699	242501	6798	4	0	1	100	14:20	15:50
114700	242501	6812	4	0	1	100	14:20	15:50
114701	242501	6826	4	0	1	100	14:20	15:50
114702	242501	6840	4	0	1	100	14:20	15:50
114703	242501	6854	4	0	1	100	14:20	15:50
114704	242501	6868	4	0	1	100	14:20	15:50
114705	242501	6882	4	0	1	100	14:20	15:50
114706	242501	6784	5	0	0	100	16:20	17:50
114707	242501	6798	5	0	0	100	16:20	17:50
114708	242501	6812	5	0	0	100	16:20	17:50
114709	242501	6826	5	0	0	100	16:20	17:50
114710	242501	6840	5	0	0	100	16:20	17:50
114711	242501	6854	5	0	0	100	16:20	17:50
114712	242501	6868	5	0	0	100	16:20	17:50
114713	242501	6882	5	0	0	100	16:20	17:50
114714	242501	6785	2	0	0	113	10:40	12:10
114715	242501	6792	2	0	0	113	10:40	12:10
114716	242501	6799	2	0	0	113	10:40	12:10
114717	242501	6806	2	0	0	113	10:40	12:10
114718	242501	6813	2	0	0	113	10:40	12:10
114719	242501	6820	2	0	0	113	10:40	12:10
114720	242501	6827	2	0	0	113	10:40	12:10
114721	242501	6834	2	0	0	113	10:40	12:10
114722	242501	6841	2	0	0	113	10:40	12:10
114723	242501	6848	2	0	0	113	10:40	12:10
114724	242501	6855	2	0	0	113	10:40	12:10
114725	242501	6862	2	0	0	113	10:40	12:10
114726	242501	6869	2	0	0	113	10:40	12:10
114727	242501	6876	2	0	0	113	10:40	12:10
114728	242501	6883	2	0	0	113	10:40	12:10
114729	242501	6890	2	0	0	113	10:40	12:10
114730	242501	6785	4	0	0	18	14:20	15:50
114731	242501	6792	4	0	0	18	14:20	15:50
114732	242501	6799	4	0	0	18	14:20	15:50
114733	242501	6806	4	0	0	18	14:20	15:50
114734	242501	6813	4	0	0	18	14:20	15:50
114735	242501	6820	4	0	0	18	14:20	15:50
114736	242501	6827	4	0	0	18	14:20	15:50
114737	242501	6834	4	0	0	18	14:20	15:50
114738	242501	6841	4	0	0	18	14:20	15:50
114739	242501	6848	4	0	0	18	14:20	15:50
114740	242501	6855	4	0	0	18	14:20	15:50
114741	242501	6862	4	0	0	18	14:20	15:50
114742	242501	6869	4	0	0	18	14:20	15:50
114743	242501	6876	4	0	0	18	14:20	15:50
114744	242501	6883	4	0	0	18	14:20	15:50
114745	242501	6890	4	0	0	18	14:20	15:50
114746	242501	6785	5	0	0	98	16:20	17:50
114747	242501	6799	5	0	0	98	16:20	17:50
114748	242501	6813	5	0	0	98	16:20	17:50
114749	242501	6827	5	0	0	98	16:20	17:50
114750	242501	6841	5	0	0	98	16:20	17:50
114751	242501	6855	5	0	0	98	16:20	17:50
114752	242501	6869	5	0	0	98	16:20	17:50
114753	242501	6883	5	0	0	98	16:20	17:50
114754	242501	6781	1	0	0	136	09:00	10:30
114755	242501	6788	1	0	0	136	09:00	10:30
114756	242501	6795	1	0	0	136	09:00	10:30
114757	242501	6802	1	0	0	136	09:00	10:30
114758	242501	6809	1	0	0	136	09:00	10:30
114759	242501	6816	1	0	0	136	09:00	10:30
114760	242501	6823	1	0	0	136	09:00	10:30
114761	242501	6830	1	0	0	136	09:00	10:30
114762	242501	6837	1	0	0	136	09:00	10:30
114763	242501	6844	1	0	0	136	09:00	10:30
114764	242501	6851	1	0	0	136	09:00	10:30
114765	242501	6858	1	0	0	136	09:00	10:30
114766	242501	6865	1	0	0	136	09:00	10:30
114767	242501	6872	1	0	0	136	09:00	10:30
114768	242501	6879	1	0	0	136	09:00	10:30
114769	242501	6886	1	0	0	136	09:00	10:30
114770	242501	6781	2	0	0	136	10:40	12:10
114771	242501	6788	2	0	0	136	10:40	12:10
114772	242501	6795	2	0	0	136	10:40	12:10
114773	242501	6802	2	0	0	136	10:40	12:10
114774	242501	6809	2	0	0	136	10:40	12:10
114775	242501	6816	2	0	0	136	10:40	12:10
114776	242501	6823	2	0	0	136	10:40	12:10
114777	242501	6830	2	0	0	136	10:40	12:10
114778	242501	6837	2	0	0	136	10:40	12:10
114779	242501	6844	2	0	0	136	10:40	12:10
114780	242501	6851	2	0	0	136	10:40	12:10
114781	242501	6858	2	0	0	136	10:40	12:10
114782	242501	6865	2	0	0	136	10:40	12:10
114783	242501	6872	2	0	0	136	10:40	12:10
114784	242501	6879	2	0	0	136	10:40	12:10
114785	242501	6886	2	0	0	136	10:40	12:10
114786	242501	6781	3	0	0	136	12:40	14:10
114787	242501	6788	3	0	0	136	12:40	14:10
114788	242501	6795	3	0	0	136	12:40	14:10
114789	242501	6802	3	0	0	136	12:40	14:10
114790	242501	6809	3	0	0	136	12:40	14:10
114791	242501	6816	3	0	0	136	12:40	14:10
114792	242501	6823	3	0	0	136	12:40	14:10
114793	242501	6830	3	0	0	136	12:40	14:10
114794	242501	6837	3	0	0	136	12:40	14:10
114795	242501	6844	3	0	0	136	12:40	14:10
114796	242501	6851	3	0	0	136	12:40	14:10
114797	242501	6858	3	0	0	136	12:40	14:10
114798	242501	6865	3	0	0	136	12:40	14:10
114799	242501	6872	3	0	0	136	12:40	14:10
114800	242501	6879	3	0	0	136	12:40	14:10
114801	242501	6886	3	0	0	136	12:40	14:10
114802	242501	6781	4	0	0	136	14:20	15:50
114803	242501	6788	4	0	0	136	14:20	15:50
114804	242501	6795	4	0	0	136	14:20	15:50
114805	242501	6802	4	0	0	136	14:20	15:50
114806	242501	6809	4	0	0	136	14:20	15:50
114807	242501	6816	4	0	0	136	14:20	15:50
114808	242501	6823	4	0	0	136	14:20	15:50
114809	242501	6830	4	0	0	136	14:20	15:50
114810	242501	6837	4	0	0	136	14:20	15:50
114811	242501	6844	4	0	0	136	14:20	15:50
114812	242501	6851	4	0	0	136	14:20	15:50
114813	242501	6858	4	0	0	136	14:20	15:50
114814	242501	6865	4	0	0	136	14:20	15:50
114815	242501	6872	4	0	0	136	14:20	15:50
114816	242501	6879	4	0	0	136	14:20	15:50
114817	242501	6886	4	0	0	136	14:20	15:50
114818	242501	6789	2	0	0	26	10:40	12:10
114819	242501	6803	2	0	0	26	10:40	12:10
114820	242501	6817	2	0	0	26	10:40	12:10
114821	242501	6831	2	0	0	26	10:40	12:10
114822	242501	6845	2	0	0	26	10:40	12:10
114823	242501	6859	2	0	0	26	10:40	12:10
114824	242501	6873	2	0	0	26	10:40	12:10
114825	242501	6887	2	0	0	26	10:40	12:10
114826	242501	6782	3	0	1	65	12:40	14:10
114827	242501	6796	3	0	1	65	12:40	14:10
114828	242501	6810	3	0	1	65	12:40	14:10
114829	242501	6824	3	0	1	65	12:40	14:10
114830	242501	6838	3	0	1	65	12:40	14:10
114831	242501	6852	3	0	1	65	12:40	14:10
114832	242501	6866	3	0	1	65	12:40	14:10
114833	242501	6880	3	0	1	65	12:40	14:10
114834	242501	6789	3	0	0	26	12:40	14:10
114835	242501	6803	3	0	0	26	12:40	14:10
114836	242501	6817	3	0	0	26	12:40	14:10
114837	242501	6831	3	0	0	26	12:40	14:10
114838	242501	6845	3	0	0	26	12:40	14:10
114839	242501	6859	3	0	0	26	12:40	14:10
114840	242501	6873	3	0	0	26	12:40	14:10
114841	242501	6887	3	0	0	26	12:40	14:10
114842	242501	6782	4	0	0	102	14:20	15:50
114843	242501	6796	4	0	0	102	14:20	15:50
114844	242501	6810	4	0	0	102	14:20	15:50
114845	242501	6824	4	0	0	102	14:20	15:50
114846	242501	6838	4	0	0	102	14:20	15:50
114847	242501	6852	4	0	0	102	14:20	15:50
114848	242501	6866	4	0	0	102	14:20	15:50
114849	242501	6880	4	0	0	102	14:20	15:50
114850	242501	6782	5	0	0	114	16:20	17:50
114851	242501	6796	5	0	0	114	16:20	17:50
114852	242501	6810	5	0	0	114	16:20	17:50
114853	242501	6824	5	0	0	114	16:20	17:50
114854	242501	6838	5	0	0	114	16:20	17:50
114855	242501	6852	5	0	0	114	16:20	17:50
114856	242501	6866	5	0	0	114	16:20	17:50
114857	242501	6880	5	0	0	114	16:20	17:50
114858	242501	6789	5	0	1	65	16:20	17:50
114859	242501	6803	5	0	1	65	16:20	17:50
114860	242501	6817	5	0	1	65	16:20	17:50
114861	242501	6831	5	0	1	65	16:20	17:50
114862	242501	6845	5	0	1	65	16:20	17:50
114863	242501	6859	5	0	1	65	16:20	17:50
114864	242501	6873	5	0	1	65	16:20	17:50
114865	242501	6887	5	0	1	65	16:20	17:50
114866	242501	6782	6	0	0	26	18:00	19:30
114867	242501	6796	6	0	0	26	18:00	19:30
114868	242501	6810	6	0	0	26	18:00	19:30
114869	242501	6824	6	0	0	26	18:00	19:30
114870	242501	6838	6	0	0	26	18:00	19:30
114871	242501	6852	6	0	0	26	18:00	19:30
114872	242501	6866	6	0	0	26	18:00	19:30
114873	242501	6880	6	0	0	26	18:00	19:30
114874	242501	6789	6	0	1	65	18:00	19:30
114875	242501	6803	6	0	1	65	18:00	19:30
114876	242501	6817	6	0	1	65	18:00	19:30
114877	242501	6831	6	0	1	65	18:00	19:30
114878	242501	6845	6	0	1	65	18:00	19:30
114879	242501	6859	6	0	1	65	18:00	19:30
114880	242501	6873	6	0	1	65	18:00	19:30
114881	242501	6887	6	0	1	65	18:00	19:30
114882	242501	6783	1	0	0	33	09:00	10:30
114883	242501	6790	1	0	0	33	09:00	10:30
114884	242501	6797	1	0	0	33	09:00	10:30
114885	242501	6804	1	0	0	33	09:00	10:30
114886	242501	6811	1	0	0	33	09:00	10:30
114887	242501	6818	1	0	0	33	09:00	10:30
114888	242501	6825	1	0	0	33	09:00	10:30
114889	242501	6832	1	0	0	33	09:00	10:30
114890	242501	6839	1	0	0	33	09:00	10:30
114891	242501	6846	1	0	0	33	09:00	10:30
114892	242501	6853	1	0	0	33	09:00	10:30
114893	242501	6860	1	0	0	33	09:00	10:30
114894	242501	6867	1	0	0	33	09:00	10:30
114895	242501	6874	1	0	0	33	09:00	10:30
114896	242501	6881	1	0	0	33	09:00	10:30
114897	242501	6888	1	0	0	33	09:00	10:30
114898	242501	6783	2	0	0	33	10:40	12:10
114899	242501	6790	2	0	0	33	10:40	12:10
114900	242501	6797	2	0	0	33	10:40	12:10
114901	242501	6804	2	0	0	33	10:40	12:10
114902	242501	6811	2	0	0	33	10:40	12:10
114903	242501	6818	2	0	0	33	10:40	12:10
114904	242501	6825	2	0	0	33	10:40	12:10
114905	242501	6832	2	0	0	33	10:40	12:10
114906	242501	6839	2	0	0	33	10:40	12:10
114907	242501	6846	2	0	0	33	10:40	12:10
114908	242501	6853	2	0	0	33	10:40	12:10
114909	242501	6860	2	0	0	33	10:40	12:10
114910	242501	6867	2	0	0	33	10:40	12:10
114911	242501	6874	2	0	0	33	10:40	12:10
114912	242501	6881	2	0	0	33	10:40	12:10
114913	242501	6888	2	0	0	33	10:40	12:10
114914	242501	6783	3	0	0	27	12:40	14:10
114915	242501	6790	3	0	0	27	12:40	14:10
114916	242501	6797	3	0	0	27	12:40	14:10
114917	242501	6804	3	0	0	27	12:40	14:10
114918	242501	6811	3	0	0	27	12:40	14:10
114919	242501	6818	3	0	0	27	12:40	14:10
114920	242501	6825	3	0	0	27	12:40	14:10
114921	242501	6832	3	0	0	27	12:40	14:10
114922	242501	6839	3	0	0	27	12:40	14:10
114923	242501	6846	3	0	0	27	12:40	14:10
114924	242501	6853	3	0	0	27	12:40	14:10
114925	242501	6860	3	0	0	27	12:40	14:10
114926	242501	6867	3	0	0	27	12:40	14:10
114927	242501	6874	3	0	0	27	12:40	14:10
114928	242501	6881	3	0	0	27	12:40	14:10
114929	242501	6888	3	0	0	27	12:40	14:10
114930	242501	6783	4	0	0	65	14:20	15:50
114931	242501	6790	4	0	0	65	14:20	15:50
114932	242501	6797	4	0	0	65	14:20	15:50
114933	242501	6804	4	0	0	65	14:20	15:50
114934	242501	6811	4	0	0	65	14:20	15:50
114935	242501	6818	4	0	0	65	14:20	15:50
114936	242501	6825	4	0	0	65	14:20	15:50
114937	242501	6832	4	0	0	65	14:20	15:50
114938	242501	6839	4	0	0	65	14:20	15:50
114939	242501	6846	4	0	0	65	14:20	15:50
114940	242501	6853	4	0	0	65	14:20	15:50
114941	242501	6860	4	0	0	65	14:20	15:50
114942	242501	6867	4	0	0	65	14:20	15:50
114943	242501	6874	4	0	0	65	14:20	15:50
114944	242501	6881	4	0	0	65	14:20	15:50
114945	242501	6888	4	0	0	65	14:20	15:50
114946	242501	6783	5	0	0	103	16:20	17:50
114947	242501	6790	5	0	0	103	16:20	17:50
114948	242501	6797	5	0	0	103	16:20	17:50
114949	242501	6804	5	0	0	103	16:20	17:50
114950	242501	6811	5	0	0	103	16:20	17:50
114951	242501	6818	5	0	0	103	16:20	17:50
114952	242501	6825	5	0	0	103	16:20	17:50
114953	242501	6832	5	0	0	103	16:20	17:50
114954	242501	6839	5	0	0	103	16:20	17:50
114955	242501	6846	5	0	0	103	16:20	17:50
114956	242501	6853	5	0	0	103	16:20	17:50
114957	242501	6860	5	0	0	103	16:20	17:50
114958	242501	6867	5	0	0	103	16:20	17:50
114959	242501	6874	5	0	0	103	16:20	17:50
114960	242501	6881	5	0	0	103	16:20	17:50
114961	242501	6888	5	0	0	103	16:20	17:50
114962	242501	6784	1	0	0	42	9:00	10:30
114963	242501	6798	1	0	0	42	9:00	10:30
114964	242501	6812	1	0	0	42	9:00	10:30
114965	242501	6826	1	0	0	42	9:00	10:30
114966	242501	6840	1	0	0	42	9:00	10:30
114967	242501	6854	1	0	0	42	9:00	10:30
114968	242501	6868	1	0	0	42	9:00	10:30
114969	242501	6882	1	0	0	42	9:00	10:30
114970	242501	6784	2	0	0	42	10:40	12:10
114971	242501	6798	2	0	0	42	10:40	12:10
114972	242501	6812	2	0	0	42	10:40	12:10
114973	242501	6826	2	0	0	42	10:40	12:10
114974	242501	6840	2	0	0	42	10:40	12:10
114975	242501	6854	2	0	0	42	10:40	12:10
114976	242501	6868	2	0	0	42	10:40	12:10
114977	242501	6882	2	0	0	42	10:40	12:10
114978	242501	6784	3	0	0	42	12:40	13:00
114979	242501	6798	3	0	0	42	12:40	13:00
114980	242501	6812	3	0	0	42	12:40	13:00
114981	242501	6826	3	0	0	42	12:40	13:00
114982	242501	6840	3	0	0	42	12:40	13:00
114983	242501	6854	3	0	0	42	12:40	13:00
114984	242501	6868	3	0	0	42	12:40	13:00
114985	242501	6882	3	0	0	42	12:40	13:00
114986	242501	6791	1	0	0	42	9:00	10:30
114987	242501	6805	1	0	0	42	9:00	10:30
114988	242501	6819	1	0	0	42	9:00	10:30
114989	242501	6833	1	0	0	42	9:00	10:30
114990	242501	6847	1	0	0	42	9:00	10:30
114991	242501	6861	1	0	0	42	9:00	10:30
114992	242501	6875	1	0	0	42	9:00	10:30
114993	242501	6889	1	0	0	42	9:00	10:30
114994	242501	6791	2	0	0	42	10:40	12:10
114995	242501	6805	2	0	0	42	10:40	12:10
114996	242501	6819	2	0	0	42	10:40	12:10
114997	242501	6833	2	0	0	42	10:40	12:10
114998	242501	6847	2	0	0	42	10:40	12:10
114999	242501	6861	2	0	0	42	10:40	12:10
115000	242501	6875	2	0	0	42	10:40	12:10
115001	242501	6889	2	0	0	42	10:40	12:10
115002	242501	6791	3	0	0	42	12:40	14:10
115003	242501	6805	3	0	0	42	12:40	14:10
115004	242501	6819	3	0	0	42	12:40	14:10
115005	242501	6833	3	0	0	42	12:40	14:10
115006	242501	6847	3	0	0	42	12:40	14:10
115007	242501	6861	3	0	0	42	12:40	14:10
115008	242501	6875	3	0	0	42	12:40	14:10
115009	242501	6889	3	0	0	42	12:40	14:10
115010	242501	6791	4	0	0	42	14:20	15:50
115011	242501	6805	4	0	0	42	14:20	15:50
115012	242501	6819	4	0	0	42	14:20	15:50
115013	242501	6833	4	0	0	42	14:20	15:50
115014	242501	6847	4	0	0	42	14:20	15:50
115015	242501	6861	4	0	0	42	14:20	15:50
115016	242501	6875	4	0	0	42	14:20	15:50
115017	242501	6889	4	0	0	42	14:20	15:50
115018	242501	6791	5	0	0	42	16:20	17:00
115019	242501	6805	5	0	0	42	16:20	17:00
115020	242501	6819	5	0	0	42	16:20	17:00
115021	242501	6833	5	0	0	42	16:20	17:00
115022	242501	6847	5	0	0	42	16:20	17:00
115023	242501	6861	5	0	0	42	16:20	17:00
115024	242501	6875	5	0	0	42	16:20	17:00
115025	242501	6889	5	0	0	42	16:20	17:00
115026	242501	6784	4	0	1	104	14:20	15:50
115027	242501	6798	4	0	1	104	14:20	15:50
115028	242501	6812	4	0	1	104	14:20	15:50
115029	242501	6826	4	0	1	104	14:20	15:50
115030	242501	6840	4	0	1	104	14:20	15:50
115031	242501	6854	4	0	1	104	14:20	15:50
115032	242501	6868	4	0	1	104	14:20	15:50
115033	242501	6882	4	0	1	104	14:20	15:50
115034	242501	6785	1	0	1	24	09:00	10:30
115035	242501	6792	1	0	1	24	09:00	10:30
115036	242501	6799	1	0	1	24	09:00	10:30
115037	242501	6806	1	0	1	24	09:00	10:30
115038	242501	6813	1	0	1	24	09:00	10:30
115039	242501	6820	1	0	1	24	09:00	10:30
115040	242501	6827	1	0	1	24	09:00	10:30
115041	242501	6834	1	0	1	24	09:00	10:30
115042	242501	6841	1	0	1	24	09:00	10:30
115043	242501	6848	1	0	1	24	09:00	10:30
115044	242501	6855	1	0	1	24	09:00	10:30
115045	242501	6862	1	0	1	24	09:00	10:30
115046	242501	6869	1	0	1	24	09:00	10:30
115047	242501	6876	1	0	1	24	09:00	10:30
115048	242501	6883	1	0	1	24	09:00	10:30
115049	242501	6890	1	0	1	24	09:00	10:30
115050	242501	6785	2	0	1	31	10:40	12:10
115051	242501	6792	2	0	1	31	10:40	12:10
115052	242501	6799	2	0	1	31	10:40	12:10
115053	242501	6806	2	0	1	31	10:40	12:10
115054	242501	6813	2	0	1	31	10:40	12:10
115055	242501	6820	2	0	1	31	10:40	12:10
115056	242501	6827	2	0	1	31	10:40	12:10
115057	242501	6834	2	0	1	31	10:40	12:10
115058	242501	6841	2	0	1	31	10:40	12:10
115059	242501	6848	2	0	1	31	10:40	12:10
115060	242501	6855	2	0	1	31	10:40	12:10
115061	242501	6862	2	0	1	31	10:40	12:10
115062	242501	6869	2	0	1	31	10:40	12:10
115063	242501	6876	2	0	1	31	10:40	12:10
115064	242501	6883	2	0	1	31	10:40	12:10
115065	242501	6890	2	0	1	31	10:40	12:10
115066	242501	6785	3	0	0	31	12:40	14:10
115067	242501	6792	3	0	0	31	12:40	14:10
115068	242501	6799	3	0	0	31	12:40	14:10
115069	242501	6806	3	0	0	31	12:40	14:10
115070	242501	6813	3	0	0	31	12:40	14:10
115071	242501	6820	3	0	0	31	12:40	14:10
115072	242501	6827	3	0	0	31	12:40	14:10
115073	242501	6834	3	0	0	31	12:40	14:10
115074	242501	6841	3	0	0	31	12:40	14:10
115075	242501	6848	3	0	0	31	12:40	14:10
115076	242501	6855	3	0	0	31	12:40	14:10
115077	242501	6862	3	0	0	31	12:40	14:10
115078	242501	6869	3	0	0	31	12:40	14:10
115079	242501	6876	3	0	0	31	12:40	14:10
115080	242501	6883	3	0	0	31	12:40	14:10
115081	242501	6890	3	0	0	31	12:40	14:10
115082	242501	6785	4	0	0	24	14:20	15:50
115083	242501	6792	4	0	0	24	14:20	15:50
115084	242501	6799	4	0	0	24	14:20	15:50
115085	242501	6806	4	0	0	24	14:20	15:50
115086	242501	6813	4	0	0	24	14:20	15:50
115087	242501	6820	4	0	0	24	14:20	15:50
115088	242501	6827	4	0	0	24	14:20	15:50
115089	242501	6834	4	0	0	24	14:20	15:50
115090	242501	6841	4	0	0	24	14:20	15:50
115091	242501	6848	4	0	0	24	14:20	15:50
115092	242501	6855	4	0	0	24	14:20	15:50
115093	242501	6862	4	0	0	24	14:20	15:50
115094	242501	6869	4	0	0	24	14:20	15:50
115095	242501	6876	4	0	0	24	14:20	15:50
115096	242501	6883	4	0	0	24	14:20	15:50
115097	242501	6890	4	0	0	24	14:20	15:50
115098	242501	6785	5	0	0	104	16:20	17:50
115099	242501	6792	5	0	0	104	16:20	17:50
115100	242501	6799	5	0	0	104	16:20	17:50
115101	242501	6806	5	0	0	104	16:20	17:50
115102	242501	6813	5	0	0	104	16:20	17:50
115103	242501	6820	5	0	0	104	16:20	17:50
115104	242501	6827	5	0	0	104	16:20	17:50
115105	242501	6834	5	0	0	104	16:20	17:50
115106	242501	6841	5	0	0	104	16:20	17:50
115107	242501	6848	5	0	0	104	16:20	17:50
115108	242501	6855	5	0	0	104	16:20	17:50
115109	242501	6862	5	0	0	104	16:20	17:50
115110	242501	6869	5	0	0	104	16:20	17:50
115111	242501	6876	5	0	0	104	16:20	17:50
115112	242501	6883	5	0	0	104	16:20	17:50
115113	242501	6890	5	0	0	104	16:20	17:50
115114	242501	6786	1	0	1	102	09:00	10:30
115115	242501	6800	1	0	1	102	09:00	10:30
115116	242501	6814	1	0	1	102	09:00	10:30
115117	242501	6828	1	0	1	102	09:00	10:30
115118	242501	6842	1	0	1	102	09:00	10:30
115119	242501	6856	1	0	1	102	09:00	10:30
115120	242501	6870	1	0	1	102	09:00	10:30
115121	242501	6884	1	0	1	102	09:00	10:30
115122	242501	6793	1	0	1	102	09:00	10:30
115123	242501	6807	1	0	1	102	09:00	10:30
115124	242501	6821	1	0	1	102	09:00	10:30
115125	242501	6835	1	0	1	102	09:00	10:30
115126	242501	6849	1	0	1	102	09:00	10:30
115127	242501	6863	1	0	1	102	09:00	10:30
115128	242501	6877	1	0	1	102	09:00	10:30
115129	242501	6891	1	0	1	102	09:00	10:30
115130	242501	6781	1	0	0	137	09:00	10:30
115131	242501	6788	1	0	0	137	09:00	10:30
115132	242501	6795	1	0	0	137	09:00	10:30
115133	242501	6802	1	0	0	137	09:00	10:30
115134	242501	6809	1	0	0	137	09:00	10:30
115135	242501	6816	1	0	0	137	09:00	10:30
115136	242501	6823	1	0	0	137	09:00	10:30
115137	242501	6830	1	0	0	137	09:00	10:30
115138	242501	6837	1	0	0	137	09:00	10:30
115139	242501	6844	1	0	0	137	09:00	10:30
115140	242501	6851	1	0	0	137	09:00	10:30
115141	242501	6858	1	0	0	137	09:00	10:30
115142	242501	6865	1	0	0	137	09:00	10:30
115143	242501	6872	1	0	0	137	09:00	10:30
115144	242501	6879	1	0	0	137	09:00	10:30
115145	242501	6886	1	0	0	137	09:00	10:30
115146	242501	6781	2	0	0	137	10:40	12:10
115147	242501	6788	2	0	0	137	10:40	12:10
115148	242501	6795	2	0	0	137	10:40	12:10
115149	242501	6802	2	0	0	137	10:40	12:10
115150	242501	6809	2	0	0	137	10:40	12:10
115151	242501	6816	2	0	0	137	10:40	12:10
115152	242501	6823	2	0	0	137	10:40	12:10
115153	242501	6830	2	0	0	137	10:40	12:10
115154	242501	6837	2	0	0	137	10:40	12:10
115155	242501	6844	2	0	0	137	10:40	12:10
115156	242501	6851	2	0	0	137	10:40	12:10
115157	242501	6858	2	0	0	137	10:40	12:10
115158	242501	6865	2	0	0	137	10:40	12:10
115159	242501	6872	2	0	0	137	10:40	12:10
115160	242501	6879	2	0	0	137	10:40	12:10
115161	242501	6886	2	0	0	137	10:40	12:10
115162	242501	6781	3	0	0	137	12:40	14:10
115163	242501	6788	3	0	0	137	12:40	14:10
115164	242501	6795	3	0	0	137	12:40	14:10
115165	242501	6802	3	0	0	137	12:40	14:10
115166	242501	6809	3	0	0	137	12:40	14:10
115167	242501	6816	3	0	0	137	12:40	14:10
115168	242501	6823	3	0	0	137	12:40	14:10
115169	242501	6830	3	0	0	137	12:40	14:10
115170	242501	6837	3	0	0	137	12:40	14:10
115171	242501	6844	3	0	0	137	12:40	14:10
115172	242501	6851	3	0	0	137	12:40	14:10
115173	242501	6858	3	0	0	137	12:40	14:10
115174	242501	6865	3	0	0	137	12:40	14:10
115175	242501	6872	3	0	0	137	12:40	14:10
115176	242501	6879	3	0	0	137	12:40	14:10
115177	242501	6886	3	0	0	137	12:40	14:10
115178	242501	6781	4	0	0	137	14:20	15:50
115179	242501	6788	4	0	0	137	14:20	15:50
115180	242501	6795	4	0	0	137	14:20	15:50
115181	242501	6802	4	0	0	137	14:20	15:50
115182	242501	6809	4	0	0	137	14:20	15:50
115183	242501	6816	4	0	0	137	14:20	15:50
115184	242501	6823	4	0	0	137	14:20	15:50
115185	242501	6830	4	0	0	137	14:20	15:50
115186	242501	6837	4	0	0	137	14:20	15:50
115187	242501	6844	4	0	0	137	14:20	15:50
115188	242501	6851	4	0	0	137	14:20	15:50
115189	242501	6858	4	0	0	137	14:20	15:50
115190	242501	6865	4	0	0	137	14:20	15:50
115191	242501	6872	4	0	0	137	14:20	15:50
115192	242501	6879	4	0	0	137	14:20	15:50
115193	242501	6886	4	0	0	137	14:20	15:50
115194	242501	6789	4	0	0	102	14:20	15:50
115195	242501	6803	4	0	0	102	14:20	15:50
115196	242501	6817	4	0	0	102	14:20	15:50
115197	242501	6831	4	0	0	102	14:20	15:50
115198	242501	6845	4	0	0	102	14:20	15:50
115199	242501	6859	4	0	0	102	14:20	15:50
115200	242501	6873	4	0	0	102	14:20	15:50
115201	242501	6887	4	0	0	102	14:20	15:50
115202	242501	6783	4	0	0	65	14:20	15:50
115203	242501	6790	4	0	0	65	14:20	15:50
115204	242501	6797	4	0	0	65	14:20	15:50
115205	242501	6804	4	0	0	65	14:20	15:50
115206	242501	6811	4	0	0	65	14:20	15:50
115207	242501	6818	4	0	0	65	14:20	15:50
115208	242501	6825	4	0	0	65	14:20	15:50
115209	242501	6832	4	0	0	65	14:20	15:50
115210	242501	6839	4	0	0	65	14:20	15:50
115211	242501	6846	4	0	0	65	14:20	15:50
115212	242501	6853	4	0	0	65	14:20	15:50
115213	242501	6860	4	0	0	65	14:20	15:50
115214	242501	6867	4	0	0	65	14:20	15:50
115215	242501	6874	4	0	0	65	14:20	15:50
115216	242501	6881	4	0	0	65	14:20	15:50
115217	242501	6888	4	0	0	65	14:20	15:50
115218	242501	6784	1	0	0	42	9:00	10:30
115219	242501	6798	1	0	0	42	9:00	10:30
115220	242501	6812	1	0	0	42	9:00	10:30
115221	242501	6826	1	0	0	42	9:00	10:30
115222	242501	6840	1	0	0	42	9:00	10:30
115223	242501	6854	1	0	0	42	9:00	10:30
115224	242501	6868	1	0	0	42	9:00	10:30
115225	242501	6882	1	0	0	42	9:00	10:30
115226	242501	6784	2	0	0	42	10:40	12:10
115227	242501	6798	2	0	0	42	10:40	12:10
115228	242501	6812	2	0	0	42	10:40	12:10
115229	242501	6826	2	0	0	42	10:40	12:10
115230	242501	6840	2	0	0	42	10:40	12:10
115231	242501	6854	2	0	0	42	10:40	12:10
115232	242501	6868	2	0	0	42	10:40	12:10
115233	242501	6882	2	0	0	42	10:40	12:10
115234	242501	6784	3	0	0	42	12:40	13:00
115235	242501	6798	3	0	0	42	12:40	13:00
115236	242501	6812	3	0	0	42	12:40	13:00
115237	242501	6826	3	0	0	42	12:40	13:00
115238	242501	6840	3	0	0	42	12:40	13:00
115239	242501	6854	3	0	0	42	12:40	13:00
115240	242501	6868	3	0	0	42	12:40	13:00
115241	242501	6882	3	0	0	42	12:40	13:00
115242	242501	6791	1	0	0	42	9:00	10:30
115243	242501	6805	1	0	0	42	9:00	10:30
115244	242501	6819	1	0	0	42	9:00	10:30
115245	242501	6833	1	0	0	42	9:00	10:30
115246	242501	6847	1	0	0	42	9:00	10:30
115247	242501	6861	1	0	0	42	9:00	10:30
115248	242501	6875	1	0	0	42	9:00	10:30
115249	242501	6889	1	0	0	42	9:00	10:30
115250	242501	6791	2	0	0	42	10:40	12:10
115251	242501	6805	2	0	0	42	10:40	12:10
115252	242501	6819	2	0	0	42	10:40	12:10
115253	242501	6833	2	0	0	42	10:40	12:10
115254	242501	6847	2	0	0	42	10:40	12:10
115255	242501	6861	2	0	0	42	10:40	12:10
115256	242501	6875	2	0	0	42	10:40	12:10
115257	242501	6889	2	0	0	42	10:40	12:10
115258	242501	6791	3	0	0	42	12:40	14:10
115259	242501	6805	3	0	0	42	12:40	14:10
115260	242501	6819	3	0	0	42	12:40	14:10
115261	242501	6833	3	0	0	42	12:40	14:10
115262	242501	6847	3	0	0	42	12:40	14:10
115263	242501	6861	3	0	0	42	12:40	14:10
115264	242501	6875	3	0	0	42	12:40	14:10
115265	242501	6889	3	0	0	42	12:40	14:10
115266	242501	6791	4	0	0	42	14:20	15:50
115267	242501	6805	4	0	0	42	14:20	15:50
115268	242501	6819	4	0	0	42	14:20	15:50
115269	242501	6833	4	0	0	42	14:20	15:50
115270	242501	6847	4	0	0	42	14:20	15:50
115271	242501	6861	4	0	0	42	14:20	15:50
115272	242501	6875	4	0	0	42	14:20	15:50
115273	242501	6889	4	0	0	42	14:20	15:50
115274	242501	6791	5	0	0	42	16:20	17:00
115275	242501	6805	5	0	0	42	16:20	17:00
115276	242501	6819	5	0	0	42	16:20	17:00
115277	242501	6833	5	0	0	42	16:20	17:00
115278	242501	6847	5	0	0	42	16:20	17:00
115279	242501	6861	5	0	0	42	16:20	17:00
115280	242501	6875	5	0	0	42	16:20	17:00
115281	242501	6889	5	0	0	42	16:20	17:00
115282	242501	6785	3	0	0	24	12:40	14:10
115283	242501	6792	3	0	0	24	12:40	14:10
115284	242501	6799	3	0	0	24	12:40	14:10
115285	242501	6806	3	0	0	24	12:40	14:10
115286	242501	6813	3	0	0	24	12:40	14:10
115287	242501	6820	3	0	0	24	12:40	14:10
115288	242501	6827	3	0	0	24	12:40	14:10
115289	242501	6834	3	0	0	24	12:40	14:10
115290	242501	6841	3	0	0	24	12:40	14:10
115291	242501	6848	3	0	0	24	12:40	14:10
115292	242501	6855	3	0	0	24	12:40	14:10
115293	242501	6862	3	0	0	24	12:40	14:10
115294	242501	6869	3	0	0	24	12:40	14:10
115295	242501	6876	3	0	0	24	12:40	14:10
115296	242501	6883	3	0	0	24	12:40	14:10
115297	242501	6890	3	0	0	24	12:40	14:10
115298	242501	6785	4	0	0	104	14:20	15:50
115299	242501	6792	4	0	0	104	14:20	15:50
115300	242501	6799	4	0	0	104	14:20	15:50
115301	242501	6806	4	0	0	104	14:20	15:50
115302	242501	6813	4	0	0	104	14:20	15:50
115303	242501	6820	4	0	0	104	14:20	15:50
115304	242501	6827	4	0	0	104	14:20	15:50
115305	242501	6834	4	0	0	104	14:20	15:50
115306	242501	6841	4	0	0	104	14:20	15:50
115307	242501	6848	4	0	0	104	14:20	15:50
115308	242501	6855	4	0	0	104	14:20	15:50
115309	242501	6862	4	0	0	104	14:20	15:50
115310	242501	6869	4	0	0	104	14:20	15:50
115311	242501	6876	4	0	0	104	14:20	15:50
115312	242501	6883	4	0	0	104	14:20	15:50
115313	242501	6890	4	0	0	104	14:20	15:50
115314	242501	6785	5	0	0	31	16:20	17:50
115315	242501	6792	5	0	0	31	16:20	17:50
115316	242501	6799	5	0	0	31	16:20	17:50
115317	242501	6806	5	0	0	31	16:20	17:50
115318	242501	6813	5	0	0	31	16:20	17:50
115319	242501	6820	5	0	0	31	16:20	17:50
115320	242501	6827	5	0	0	31	16:20	17:50
115321	242501	6834	5	0	0	31	16:20	17:50
115322	242501	6841	5	0	0	31	16:20	17:50
115323	242501	6848	5	0	0	31	16:20	17:50
115324	242501	6855	5	0	0	31	16:20	17:50
115325	242501	6862	5	0	0	31	16:20	17:50
115326	242501	6869	5	0	0	31	16:20	17:50
115327	242501	6876	5	0	0	31	16:20	17:50
115328	242501	6883	5	0	0	31	16:20	17:50
115329	242501	6890	5	0	0	31	16:20	17:50
115330	242501	6809	3	0	0	138	12:40	14:10
115331	242501	6816	3	0	0	138	12:40	14:10
115332	242501	6823	3	0	0	138	12:40	14:10
115333	242501	6830	3	0	0	138	12:40	14:10
115334	242501	6781	5	0	0	105	16:20	17:50
115335	242501	6788	5	0	0	105	16:20	17:50
115336	242501	6795	5	0	0	105	16:20	17:50
115337	242501	6802	5	0	0	105	16:20	17:50
115338	242501	6809	5	0	0	105	16:20	17:50
115339	242501	6816	5	0	0	105	16:20	17:50
115340	242501	6823	5	0	0	105	16:20	17:50
115341	242501	6830	5	0	0	105	16:20	17:50
115342	242501	6837	5	0	0	105	16:20	17:50
115343	242501	6844	5	0	0	105	16:20	17:50
115344	242501	6851	5	0	0	105	16:20	17:50
115345	242501	6858	5	0	0	105	16:20	17:50
115346	242501	6865	5	0	0	105	16:20	17:50
115347	242501	6872	5	0	0	105	16:20	17:50
115348	242501	6879	5	0	0	105	16:20	17:50
115349	242501	6886	5	0	0	105	16:20	17:50
115350	242501	6781	6	0	0	105	18:00	19:30
115351	242501	6788	6	0	0	105	18:00	19:30
115352	242501	6795	6	0	0	105	18:00	19:30
115353	242501	6802	6	0	0	105	18:00	19:30
115354	242501	6809	6	0	0	105	18:00	19:30
115355	242501	6816	6	0	0	105	18:00	19:30
115356	242501	6823	6	0	0	105	18:00	19:30
115357	242501	6830	6	0	0	105	18:00	19:30
115358	242501	6837	6	0	0	105	18:00	19:30
115359	242501	6844	6	0	0	105	18:00	19:30
115360	242501	6851	6	0	0	105	18:00	19:30
115361	242501	6858	6	0	0	105	18:00	19:30
115362	242501	6865	6	0	0	105	18:00	19:30
115363	242501	6872	6	0	0	105	18:00	19:30
115364	242501	6879	6	0	0	105	18:00	19:30
115365	242501	6886	6	0	0	105	18:00	19:30
115366	242501	6782	1	0	0	136	09:00	10:30
115367	242501	6789	1	0	0	136	09:00	10:30
115368	242501	6796	1	0	0	136	09:00	10:30
115369	242501	6803	1	0	0	136	09:00	10:30
115370	242501	6810	1	0	0	136	09:00	10:30
115371	242501	6817	1	0	0	136	09:00	10:30
115372	242501	6824	1	0	0	136	09:00	10:30
115373	242501	6831	1	0	0	136	09:00	10:30
115374	242501	6838	1	0	0	136	09:00	10:30
115375	242501	6845	1	0	0	136	09:00	10:30
115376	242501	6852	1	0	0	136	09:00	10:30
115377	242501	6859	1	0	0	136	09:00	10:30
115378	242501	6866	1	0	0	136	09:00	10:30
115379	242501	6873	1	0	0	136	09:00	10:30
115380	242501	6880	1	0	0	136	09:00	10:30
115381	242501	6887	1	0	0	136	09:00	10:30
115382	242501	6782	2	0	0	136	10:40	12:10
115383	242501	6789	2	0	0	136	10:40	12:10
115384	242501	6796	2	0	0	136	10:40	12:10
115385	242501	6803	2	0	0	136	10:40	12:10
115386	242501	6810	2	0	0	136	10:40	12:10
115387	242501	6817	2	0	0	136	10:40	12:10
115388	242501	6824	2	0	0	136	10:40	12:10
115389	242501	6831	2	0	0	136	10:40	12:10
115390	242501	6838	2	0	0	136	10:40	12:10
115391	242501	6845	2	0	0	136	10:40	12:10
115392	242501	6852	2	0	0	136	10:40	12:10
115393	242501	6859	2	0	0	136	10:40	12:10
115394	242501	6866	2	0	0	136	10:40	12:10
115395	242501	6873	2	0	0	136	10:40	12:10
115396	242501	6880	2	0	0	136	10:40	12:10
115397	242501	6887	2	0	0	136	10:40	12:10
115398	242501	6782	3	0	0	136	12:40	14:10
115399	242501	6789	3	0	0	136	12:40	14:10
115400	242501	6796	3	0	0	136	12:40	14:10
115401	242501	6803	3	0	0	136	12:40	14:10
115402	242501	6810	3	0	0	136	12:40	14:10
115403	242501	6817	3	0	0	136	12:40	14:10
115404	242501	6824	3	0	0	136	12:40	14:10
115405	242501	6831	3	0	0	136	12:40	14:10
115406	242501	6838	3	0	0	136	12:40	14:10
115407	242501	6845	3	0	0	136	12:40	14:10
115408	242501	6852	3	0	0	136	12:40	14:10
115409	242501	6859	3	0	0	136	12:40	14:10
115410	242501	6866	3	0	0	136	12:40	14:10
115411	242501	6873	3	0	0	136	12:40	14:10
115412	242501	6880	3	0	0	136	12:40	14:10
115413	242501	6887	3	0	0	136	12:40	14:10
115414	242501	6782	4	0	0	136	14:20	15:50
115415	242501	6789	4	0	0	136	14:20	15:50
115416	242501	6796	4	0	0	136	14:20	15:50
115417	242501	6803	4	0	0	136	14:20	15:50
115418	242501	6810	4	0	0	136	14:20	15:50
115419	242501	6817	4	0	0	136	14:20	15:50
115420	242501	6824	4	0	0	136	14:20	15:50
115421	242501	6831	4	0	0	136	14:20	15:50
115422	242501	6838	4	0	0	136	14:20	15:50
115423	242501	6845	4	0	0	136	14:20	15:50
115424	242501	6852	4	0	0	136	14:20	15:50
115425	242501	6859	4	0	0	136	14:20	15:50
115426	242501	6866	4	0	0	136	14:20	15:50
115427	242501	6873	4	0	0	136	14:20	15:50
115428	242501	6880	4	0	0	136	14:20	15:50
115429	242501	6887	4	0	0	136	14:20	15:50
115430	242501	6783	3	0	0	33	12:40	14:10
115431	242501	6790	3	0	0	33	12:40	14:10
115432	242501	6797	3	0	0	33	12:40	14:10
115433	242501	6804	3	0	0	33	12:40	14:10
115434	242501	6811	3	0	0	33	12:40	14:10
115435	242501	6818	3	0	0	33	12:40	14:10
115436	242501	6825	3	0	0	33	12:40	14:10
115437	242501	6832	3	0	0	33	12:40	14:10
115438	242501	6839	3	0	0	33	12:40	14:10
115439	242501	6846	3	0	0	33	12:40	14:10
115440	242501	6853	3	0	0	33	12:40	14:10
115441	242501	6860	3	0	0	33	12:40	14:10
115442	242501	6867	3	0	0	33	12:40	14:10
115443	242501	6874	3	0	0	33	12:40	14:10
115444	242501	6881	3	0	0	33	12:40	14:10
115445	242501	6888	3	0	0	33	12:40	14:10
115446	242501	6783	4	0	0	33	14:20	15:50
115447	242501	6790	4	0	0	33	14:20	15:50
115448	242501	6797	4	0	0	33	14:20	15:50
115449	242501	6804	4	0	0	33	14:20	15:50
115450	242501	6811	4	0	0	33	14:20	15:50
115451	242501	6818	4	0	0	33	14:20	15:50
115452	242501	6825	4	0	0	33	14:20	15:50
115453	242501	6832	4	0	0	33	14:20	15:50
115454	242501	6839	4	0	0	33	14:20	15:50
115455	242501	6846	4	0	0	33	14:20	15:50
115456	242501	6853	4	0	0	33	14:20	15:50
115457	242501	6860	4	0	0	33	14:20	15:50
115458	242501	6867	4	0	0	33	14:20	15:50
115459	242501	6874	4	0	0	33	14:20	15:50
115460	242501	6881	4	0	0	33	14:20	15:50
115461	242501	6888	4	0	0	33	14:20	15:50
115462	242501	6783	5	0	0	27	16:20	17:50
115463	242501	6790	5	0	0	27	16:20	17:50
115464	242501	6797	5	0	0	27	16:20	17:50
115465	242501	6804	5	0	0	27	16:20	17:50
115466	242501	6811	5	0	0	27	16:20	17:50
115467	242501	6818	5	0	0	27	16:20	17:50
115468	242501	6825	5	0	0	27	16:20	17:50
115469	242501	6832	5	0	0	27	16:20	17:50
115470	242501	6839	5	0	0	27	16:20	17:50
115471	242501	6846	5	0	0	27	16:20	17:50
115472	242501	6853	5	0	0	27	16:20	17:50
115473	242501	6860	5	0	0	27	16:20	17:50
115474	242501	6867	5	0	0	27	16:20	17:50
115475	242501	6874	5	0	0	27	16:20	17:50
115476	242501	6881	5	0	0	27	16:20	17:50
115477	242501	6888	5	0	0	27	16:20	17:50
115478	242501	6785	1	0	0	42	09:00	10:30
115479	242501	6792	1	0	0	42	09:00	10:30
115480	242501	6799	1	0	0	42	09:00	10:30
115481	242501	6806	1	0	0	42	09:00	10:30
115482	242501	6813	1	0	0	42	09:00	10:30
115483	242501	6820	1	0	0	42	09:00	10:30
115484	242501	6827	1	0	0	42	09:00	10:30
115485	242501	6834	1	0	0	42	09:00	10:30
115486	242501	6841	1	0	0	42	09:00	10:30
115487	242501	6848	1	0	0	42	09:00	10:30
115488	242501	6855	1	0	0	42	09:00	10:30
115489	242501	6862	1	0	0	42	09:00	10:30
115490	242501	6869	1	0	0	42	09:00	10:30
115491	242501	6876	1	0	0	42	09:00	10:30
115492	242501	6883	1	0	0	42	09:00	10:30
115493	242501	6890	1	0	0	42	09:00	10:30
115494	242501	6785	2	0	0	42	10:40	12:10
115495	242501	6792	2	0	0	42	10:40	12:10
115496	242501	6799	2	0	0	42	10:40	12:10
115497	242501	6806	2	0	0	42	10:40	12:10
115498	242501	6813	2	0	0	42	10:40	12:10
115499	242501	6820	2	0	0	42	10:40	12:10
115500	242501	6827	2	0	0	42	10:40	12:10
115501	242501	6834	2	0	0	42	10:40	12:10
115502	242501	6841	2	0	0	42	10:40	12:10
115503	242501	6848	2	0	0	42	10:40	12:10
115504	242501	6855	2	0	0	42	10:40	12:10
115505	242501	6862	2	0	0	42	10:40	12:10
115506	242501	6869	2	0	0	42	10:40	12:10
115507	242501	6876	2	0	0	42	10:40	12:10
115508	242501	6883	2	0	0	42	10:40	12:10
115509	242501	6890	2	0	0	42	10:40	12:10
115510	242501	6785	3	0	0	42	12:40	14:10
115511	242501	6792	3	0	0	42	12:40	14:10
115512	242501	6799	3	0	0	42	12:40	14:10
115513	242501	6806	3	0	0	42	12:40	14:10
115514	242501	6813	3	0	0	42	12:40	14:10
115515	242501	6820	3	0	0	42	12:40	14:10
115516	242501	6827	3	0	0	42	12:40	14:10
115517	242501	6834	3	0	0	42	12:40	14:10
115518	242501	6841	3	0	0	42	12:40	14:10
115519	242501	6848	3	0	0	42	12:40	14:10
115520	242501	6855	3	0	0	42	12:40	14:10
115521	242501	6862	3	0	0	42	12:40	14:10
115522	242501	6869	3	0	0	42	12:40	14:10
115523	242501	6876	3	0	0	42	12:40	14:10
115524	242501	6883	3	0	0	42	12:40	14:10
115525	242501	6890	3	0	0	42	12:40	14:10
115526	242501	6785	4	0	0	42	14:20	15:50
115527	242501	6792	4	0	0	42	14:20	15:50
115528	242501	6799	4	0	0	42	14:20	15:50
115529	242501	6806	4	0	0	42	14:20	15:50
115530	242501	6813	4	0	0	42	14:20	15:50
115531	242501	6820	4	0	0	42	14:20	15:50
115532	242501	6827	4	0	0	42	14:20	15:50
115533	242501	6834	4	0	0	42	14:20	15:50
115534	242501	6841	4	0	0	42	14:20	15:50
115535	242501	6848	4	0	0	42	14:20	15:50
115536	242501	6855	4	0	0	42	14:20	15:50
115537	242501	6862	4	0	0	42	14:20	15:50
115538	242501	6869	4	0	0	42	14:20	15:50
115539	242501	6876	4	0	0	42	14:20	15:50
115540	242501	6883	4	0	0	42	14:20	15:50
115541	242501	6890	4	0	0	42	14:20	15:50
115542	242501	6785	5	0	0	42	16:20	17:50
115543	242501	6792	5	0	0	42	16:20	17:50
115544	242501	6799	5	0	0	42	16:20	17:50
115545	242501	6806	5	0	0	42	16:20	17:50
115546	242501	6813	5	0	0	42	16:20	17:50
115547	242501	6820	5	0	0	42	16:20	17:50
115548	242501	6827	5	0	0	42	16:20	17:50
115549	242501	6834	5	0	0	42	16:20	17:50
115550	242501	6841	5	0	0	42	16:20	17:50
115551	242501	6848	5	0	0	42	16:20	17:50
115552	242501	6855	5	0	0	42	16:20	17:50
115553	242501	6862	5	0	0	42	16:20	17:50
115554	242501	6869	5	0	0	42	16:20	17:50
115555	242501	6876	5	0	0	42	16:20	17:50
115556	242501	6883	5	0	0	42	16:20	17:50
115557	242501	6890	5	0	0	42	16:20	17:50
115558	242501	6782	1	0	0	136	09:00	10:30
115559	242501	6789	1	0	0	136	09:00	10:30
115560	242501	6796	1	0	0	136	09:00	10:30
115561	242501	6803	1	0	0	136	09:00	10:30
115562	242501	6810	1	0	0	136	09:00	10:30
115563	242501	6817	1	0	0	136	09:00	10:30
115564	242501	6824	1	0	0	136	09:00	10:30
115565	242501	6831	1	0	0	136	09:00	10:30
115566	242501	6838	1	0	0	136	09:00	10:30
115567	242501	6845	1	0	0	136	09:00	10:30
115568	242501	6852	1	0	0	136	09:00	10:30
115569	242501	6859	1	0	0	136	09:00	10:30
115570	242501	6866	1	0	0	136	09:00	10:30
115571	242501	6873	1	0	0	136	09:00	10:30
115572	242501	6880	1	0	0	136	09:00	10:30
115573	242501	6887	1	0	0	136	09:00	10:30
115574	242501	6782	2	0	0	136	10:40	12:10
115575	242501	6789	2	0	0	136	10:40	12:10
115576	242501	6796	2	0	0	136	10:40	12:10
115577	242501	6803	2	0	0	136	10:40	12:10
115578	242501	6810	2	0	0	136	10:40	12:10
115579	242501	6817	2	0	0	136	10:40	12:10
115580	242501	6824	2	0	0	136	10:40	12:10
115581	242501	6831	2	0	0	136	10:40	12:10
115582	242501	6838	2	0	0	136	10:40	12:10
115583	242501	6845	2	0	0	136	10:40	12:10
115584	242501	6852	2	0	0	136	10:40	12:10
115585	242501	6859	2	0	0	136	10:40	12:10
115586	242501	6866	2	0	0	136	10:40	12:10
115587	242501	6873	2	0	0	136	10:40	12:10
115588	242501	6880	2	0	0	136	10:40	12:10
115589	242501	6887	2	0	0	136	10:40	12:10
115590	242501	6782	3	0	0	136	12:40	14:10
115591	242501	6789	3	0	0	136	12:40	14:10
115592	242501	6796	3	0	0	136	12:40	14:10
115593	242501	6803	3	0	0	136	12:40	14:10
115594	242501	6810	3	0	0	136	12:40	14:10
115595	242501	6817	3	0	0	136	12:40	14:10
115596	242501	6824	3	0	0	136	12:40	14:10
115597	242501	6831	3	0	0	136	12:40	14:10
115598	242501	6838	3	0	0	136	12:40	14:10
115599	242501	6845	3	0	0	136	12:40	14:10
115600	242501	6852	3	0	0	136	12:40	14:10
115601	242501	6859	3	0	0	136	12:40	14:10
115602	242501	6866	3	0	0	136	12:40	14:10
115603	242501	6873	3	0	0	136	12:40	14:10
115604	242501	6880	3	0	0	136	12:40	14:10
115605	242501	6887	3	0	0	136	12:40	14:10
115606	242501	6782	4	0	0	136	14:20	15:50
115607	242501	6789	4	0	0	136	14:20	15:50
115608	242501	6796	4	0	0	136	14:20	15:50
115609	242501	6803	4	0	0	136	14:20	15:50
115610	242501	6810	4	0	0	136	14:20	15:50
115611	242501	6817	4	0	0	136	14:20	15:50
115612	242501	6824	4	0	0	136	14:20	15:50
115613	242501	6831	4	0	0	136	14:20	15:50
115614	242501	6838	4	0	0	136	14:20	15:50
115615	242501	6845	4	0	0	136	14:20	15:50
115616	242501	6852	4	0	0	136	14:20	15:50
115617	242501	6859	4	0	0	136	14:20	15:50
115618	242501	6866	4	0	0	136	14:20	15:50
115619	242501	6873	4	0	0	136	14:20	15:50
115620	242501	6880	4	0	0	136	14:20	15:50
115621	242501	6887	4	0	0	136	14:20	15:50
115622	242501	6785	1	0	0	42	09:00	10:30
115623	242501	6792	1	0	0	42	09:00	10:30
115624	242501	6799	1	0	0	42	09:00	10:30
115625	242501	6806	1	0	0	42	09:00	10:30
115626	242501	6813	1	0	0	42	09:00	10:30
115627	242501	6820	1	0	0	42	09:00	10:30
115628	242501	6827	1	0	0	42	09:00	10:30
115629	242501	6834	1	0	0	42	09:00	10:30
115630	242501	6841	1	0	0	42	09:00	10:30
115631	242501	6848	1	0	0	42	09:00	10:30
115632	242501	6855	1	0	0	42	09:00	10:30
115633	242501	6862	1	0	0	42	09:00	10:30
115634	242501	6869	1	0	0	42	09:00	10:30
115635	242501	6876	1	0	0	42	09:00	10:30
115636	242501	6883	1	0	0	42	09:00	10:30
115637	242501	6890	1	0	0	42	09:00	10:30
115638	242501	6785	2	0	0	42	10:40	12:10
115639	242501	6792	2	0	0	42	10:40	12:10
115640	242501	6799	2	0	0	42	10:40	12:10
115641	242501	6806	2	0	0	42	10:40	12:10
115642	242501	6813	2	0	0	42	10:40	12:10
115643	242501	6820	2	0	0	42	10:40	12:10
115644	242501	6827	2	0	0	42	10:40	12:10
115645	242501	6834	2	0	0	42	10:40	12:10
115646	242501	6841	2	0	0	42	10:40	12:10
115647	242501	6848	2	0	0	42	10:40	12:10
115648	242501	6855	2	0	0	42	10:40	12:10
115649	242501	6862	2	0	0	42	10:40	12:10
115650	242501	6869	2	0	0	42	10:40	12:10
115651	242501	6876	2	0	0	42	10:40	12:10
115652	242501	6883	2	0	0	42	10:40	12:10
115653	242501	6890	2	0	0	42	10:40	12:10
115654	242501	6785	3	0	0	42	12:40	14:10
115655	242501	6792	3	0	0	42	12:40	14:10
115656	242501	6799	3	0	0	42	12:40	14:10
115657	242501	6806	3	0	0	42	12:40	14:10
115658	242501	6813	3	0	0	42	12:40	14:10
115659	242501	6820	3	0	0	42	12:40	14:10
115660	242501	6827	3	0	0	42	12:40	14:10
115661	242501	6834	3	0	0	42	12:40	14:10
115662	242501	6841	3	0	0	42	12:40	14:10
115663	242501	6848	3	0	0	42	12:40	14:10
115664	242501	6855	3	0	0	42	12:40	14:10
115665	242501	6862	3	0	0	42	12:40	14:10
115666	242501	6869	3	0	0	42	12:40	14:10
115667	242501	6876	3	0	0	42	12:40	14:10
115668	242501	6883	3	0	0	42	12:40	14:10
115669	242501	6890	3	0	0	42	12:40	14:10
115670	242501	6785	4	0	0	42	14:20	15:50
115671	242501	6792	4	0	0	42	14:20	15:50
115672	242501	6799	4	0	0	42	14:20	15:50
115673	242501	6806	4	0	0	42	14:20	15:50
115674	242501	6813	4	0	0	42	14:20	15:50
115675	242501	6820	4	0	0	42	14:20	15:50
115676	242501	6827	4	0	0	42	14:20	15:50
115677	242501	6834	4	0	0	42	14:20	15:50
115678	242501	6841	4	0	0	42	14:20	15:50
115679	242501	6848	4	0	0	42	14:20	15:50
115680	242501	6855	4	0	0	42	14:20	15:50
115681	242501	6862	4	0	0	42	14:20	15:50
115682	242501	6869	4	0	0	42	14:20	15:50
115683	242501	6876	4	0	0	42	14:20	15:50
115684	242501	6883	4	0	0	42	14:20	15:50
115685	242501	6890	4	0	0	42	14:20	15:50
115686	242501	6785	5	0	0	42	16:20	17:50
115687	242501	6792	5	0	0	42	16:20	17:50
115688	242501	6799	5	0	0	42	16:20	17:50
115689	242501	6806	5	0	0	42	16:20	17:50
115690	242501	6813	5	0	0	42	16:20	17:50
115691	242501	6820	5	0	0	42	16:20	17:50
115692	242501	6827	5	0	0	42	16:20	17:50
115693	242501	6834	5	0	0	42	16:20	17:50
115694	242501	6841	5	0	0	42	16:20	17:50
115695	242501	6848	5	0	0	42	16:20	17:50
115696	242501	6855	5	0	0	42	16:20	17:50
115697	242501	6862	5	0	0	42	16:20	17:50
115698	242501	6869	5	0	0	42	16:20	17:50
115699	242501	6876	5	0	0	42	16:20	17:50
115700	242501	6883	5	0	0	42	16:20	17:50
115701	242501	6890	5	0	0	42	16:20	17:50
115702	242501	6788	1	0	0	42	09:00	10:30
115703	242501	6795	1	0	0	42	09:00	10:30
115704	242501	6802	1	0	0	42	09:00	10:30
115705	242501	6809	1	0	0	42	09:00	10:30
115706	242501	6816	1	0	0	42	09:00	10:30
115707	242501	6823	1	0	0	42	09:00	10:30
115708	242501	6830	1	0	0	42	09:00	10:30
115709	242501	6837	1	0	0	42	09:00	10:30
115710	242501	6844	1	0	0	42	09:00	10:30
115711	242501	6851	1	0	0	42	09:00	10:30
115712	242501	6858	1	0	0	42	09:00	10:30
115713	242501	6865	1	0	0	42	09:00	10:30
115714	242501	6872	1	0	0	42	09:00	10:30
115715	242501	6879	1	0	0	42	09:00	10:30
115716	242501	6886	1	0	0	42	09:00	10:30
115717	242501	6893	1	0	0	42	09:00	10:30
115718	242501	6788	2	0	0	42	10:40	12:10
115719	242501	6795	2	0	0	42	10:40	12:10
115720	242501	6802	2	0	0	42	10:40	12:10
115721	242501	6809	2	0	0	42	10:40	12:10
115722	242501	6816	2	0	0	42	10:40	12:10
115723	242501	6823	2	0	0	42	10:40	12:10
115724	242501	6830	2	0	0	42	10:40	12:10
115725	242501	6837	2	0	0	42	10:40	12:10
115726	242501	6844	2	0	0	42	10:40	12:10
115727	242501	6851	2	0	0	42	10:40	12:10
115728	242501	6858	2	0	0	42	10:40	12:10
115729	242501	6865	2	0	0	42	10:40	12:10
115730	242501	6872	2	0	0	42	10:40	12:10
115731	242501	6879	2	0	0	42	10:40	12:10
115732	242501	6886	2	0	0	42	10:40	12:10
115733	242501	6893	2	0	0	42	10:40	12:10
115734	242501	6788	3	0	0	42	12:40	14:10
115735	242501	6795	3	0	0	42	12:40	14:10
115736	242501	6802	3	0	0	42	12:40	14:10
115737	242501	6809	3	0	0	42	12:40	14:10
115738	242501	6816	3	0	0	42	12:40	14:10
115739	242501	6823	3	0	0	42	12:40	14:10
115740	242501	6830	3	0	0	42	12:40	14:10
115741	242501	6837	3	0	0	42	12:40	14:10
115742	242501	6844	3	0	0	42	12:40	14:10
115743	242501	6851	3	0	0	42	12:40	14:10
115744	242501	6858	3	0	0	42	12:40	14:10
115745	242501	6865	3	0	0	42	12:40	14:10
115746	242501	6872	3	0	0	42	12:40	14:10
115747	242501	6879	3	0	0	42	12:40	14:10
115748	242501	6886	3	0	0	42	12:40	14:10
115749	242501	6893	3	0	0	42	12:40	14:10
115750	242501	6788	4	0	0	42	14:20	15:50
115751	242501	6795	4	0	0	42	14:20	15:50
115752	242501	6802	4	0	0	42	14:20	15:50
115753	242501	6809	4	0	0	42	14:20	15:50
115754	242501	6816	4	0	0	42	14:20	15:50
115755	242501	6823	4	0	0	42	14:20	15:50
115756	242501	6830	4	0	0	42	14:20	15:50
115757	242501	6837	4	0	0	42	14:20	15:50
115758	242501	6844	4	0	0	42	14:20	15:50
115759	242501	6851	4	0	0	42	14:20	15:50
115760	242501	6858	4	0	0	42	14:20	15:50
115761	242501	6865	4	0	0	42	14:20	15:50
115762	242501	6872	4	0	0	42	14:20	15:50
115763	242501	6879	4	0	0	42	14:20	15:50
115764	242501	6886	4	0	0	42	14:20	15:50
115765	242501	6893	4	0	0	42	14:20	15:50
115766	242501	6788	5	0	0	42	16:20	17:50
115767	242501	6795	5	0	0	42	16:20	17:50
115768	242501	6802	5	0	0	42	16:20	17:50
115769	242501	6809	5	0	0	42	16:20	17:50
115770	242501	6816	5	0	0	42	16:20	17:50
115771	242501	6823	5	0	0	42	16:20	17:50
115772	242501	6830	5	0	0	42	16:20	17:50
115773	242501	6837	5	0	0	42	16:20	17:50
115774	242501	6844	5	0	0	42	16:20	17:50
115775	242501	6851	5	0	0	42	16:20	17:50
115776	242501	6858	5	0	0	42	16:20	17:50
115777	242501	6865	5	0	0	42	16:20	17:50
115778	242501	6872	5	0	0	42	16:20	17:50
115779	242501	6879	5	0	0	42	16:20	17:50
115780	242501	6886	5	0	0	42	16:20	17:50
115781	242501	6893	5	0	0	42	16:20	17:50
115782	242501	6789	1	0	0	117	09:00	10:30
115783	242501	6796	1	0	0	117	09:00	10:30
115784	242501	6803	1	0	0	117	09:00	10:30
115785	242501	6810	1	0	0	117	09:00	10:30
115786	242501	6817	1	0	0	117	09:00	10:30
115787	242501	6824	1	0	0	117	09:00	10:30
115788	242501	6831	1	0	0	117	09:00	10:30
115789	242501	6838	1	0	0	117	09:00	10:30
115790	242501	6845	1	0	0	117	09:00	10:30
115791	242501	6852	1	0	0	117	09:00	10:30
115792	242501	6859	1	0	0	117	09:00	10:30
115793	242501	6866	1	0	0	117	09:00	10:30
115794	242501	6873	1	0	0	117	09:00	10:30
115795	242501	6880	1	0	0	117	09:00	10:30
115796	242501	6887	1	0	0	117	09:00	10:30
115797	242501	6894	1	0	0	117	09:00	10:30
115798	242501	6789	2	0	0	118	10:40	12:10
115799	242501	6796	2	0	0	118	10:40	12:10
115800	242501	6803	2	0	0	118	10:40	12:10
115801	242501	6810	2	0	0	118	10:40	12:10
115802	242501	6817	2	0	0	118	10:40	12:10
115803	242501	6824	2	0	0	118	10:40	12:10
115804	242501	6831	2	0	0	118	10:40	12:10
115805	242501	6838	2	0	0	118	10:40	12:10
115806	242501	6845	2	0	0	118	10:40	12:10
115807	242501	6852	2	0	0	118	10:40	12:10
115808	242501	6859	2	0	0	118	10:40	12:10
115809	242501	6866	2	0	0	118	10:40	12:10
115810	242501	6873	2	0	0	118	10:40	12:10
115811	242501	6880	2	0	0	118	10:40	12:10
115812	242501	6887	2	0	0	118	10:40	12:10
115813	242501	6894	2	0	0	118	10:40	12:10
115814	242501	6789	3	0	0	118	12:20	13:50
115815	242501	6796	3	0	0	118	12:20	13:50
115816	242501	6803	3	0	0	118	12:20	13:50
115817	242501	6810	3	0	0	118	12:20	13:50
115818	242501	6817	3	0	0	118	12:20	13:50
115819	242501	6824	3	0	0	118	12:20	13:50
115820	242501	6831	3	0	0	118	12:20	13:50
115821	242501	6838	3	0	0	118	12:20	13:50
115822	242501	6845	3	0	0	118	12:20	13:50
115823	242501	6852	3	0	0	118	12:20	13:50
115824	242501	6859	3	0	0	118	12:20	13:50
115825	242501	6866	3	0	0	118	12:20	13:50
115826	242501	6873	3	0	0	118	12:20	13:50
115827	242501	6880	3	0	0	118	12:20	13:50
115828	242501	6887	3	0	0	118	12:20	13:50
115829	242501	6894	3	0	0	118	12:20	13:50
115830	242501	6796	4	0	0	117	14:20	15:50
115831	242501	6803	4	0	0	117	14:20	15:50
115832	242501	6810	4	0	0	117	14:20	15:50
115833	242501	6817	4	0	0	117	14:20	15:50
115834	242501	6824	4	0	0	117	14:20	15:50
115835	242501	6831	4	0	0	117	14:20	15:50
115836	242501	6838	4	0	0	117	14:20	15:50
115837	242501	6845	4	0	0	117	14:20	15:50
115838	242501	6852	4	0	0	117	14:20	15:50
115839	242501	6859	4	0	0	117	14:20	15:50
115840	242501	6866	4	0	0	117	14:20	15:50
115841	242501	6873	4	0	0	117	14:20	15:50
115842	242501	6880	4	0	0	117	14:20	15:50
115843	242501	6887	4	0	0	117	14:20	15:50
115844	242501	6894	4	0	0	117	14:20	15:50
115845	242501	6790	4	0	0	120	14:20	15:50
115846	242501	6797	4	0	0	120	14:20	15:50
115847	242501	6804	4	0	0	120	14:20	15:50
115848	242501	6811	4	0	0	120	14:20	15:50
115849	242501	6818	4	0	0	120	14:20	15:50
115850	242501	6825	4	0	0	120	14:20	15:50
115851	242501	6832	4	0	0	120	14:20	15:50
115852	242501	6839	4	0	0	120	14:20	15:50
115853	242501	6846	4	0	0	120	14:20	15:50
115854	242501	6853	4	0	0	120	14:20	15:50
115855	242501	6860	4	0	0	120	14:20	15:50
115856	242501	6867	4	0	0	120	14:20	15:50
115857	242501	6874	4	0	0	120	14:20	15:50
115858	242501	6881	4	0	0	120	14:20	15:50
115859	242501	6888	4	0	0	120	14:20	15:50
115860	242501	6895	4	0	0	120	14:20	15:50
115861	242501	6790	5	0	0	121	16:20	17:50
115862	242501	6797	5	0	0	121	16:20	17:50
115863	242501	6804	5	0	0	121	16:20	17:50
115864	242501	6811	5	0	0	121	16:20	17:50
115865	242501	6818	5	0	0	121	16:20	17:50
115866	242501	6825	5	0	0	121	16:20	17:50
115867	242501	6832	5	0	0	121	16:20	17:50
115868	242501	6839	5	0	0	121	16:20	17:50
115869	242501	6846	5	0	0	121	16:20	17:50
115870	242501	6853	5	0	0	121	16:20	17:50
115871	242501	6860	5	0	0	121	16:20	17:50
115872	242501	6867	5	0	0	121	16:20	17:50
115873	242501	6874	5	0	0	121	16:20	17:50
115874	242501	6881	5	0	0	121	16:20	17:50
115875	242501	6888	5	0	0	121	16:20	17:50
115876	242501	6895	5	0	0	121	16:20	17:50
115877	242501	6790	6	0	0	123	18:00	19:30
115878	242501	6797	6	0	0	123	18:00	19:30
115879	242501	6804	6	0	0	123	18:00	19:30
115880	242501	6811	6	0	0	123	18:00	19:30
115881	242501	6818	6	0	0	123	18:00	19:30
115882	242501	6825	6	0	0	123	18:00	19:30
115883	242501	6832	6	0	0	123	18:00	19:30
115884	242501	6839	6	0	0	123	18:00	19:30
115885	242501	6846	6	0	0	123	18:00	19:30
115886	242501	6853	6	0	0	123	18:00	19:30
115887	242501	6860	6	0	0	123	18:00	19:30
115888	242501	6867	6	0	0	123	18:00	19:30
115889	242501	6874	6	0	0	123	18:00	19:30
115890	242501	6881	6	0	0	123	18:00	19:30
115891	242501	6888	6	0	0	123	18:00	19:30
115892	242501	6895	6	0	0	123	18:00	19:30
115893	242501	6791	1	0	0	42	09:00	10:30
115894	242501	6798	1	0	0	42	09:00	10:30
115895	242501	6805	1	0	0	42	09:00	10:30
115896	242501	6812	1	0	0	42	09:00	10:30
115897	242501	6819	1	0	0	42	09:00	10:30
115898	242501	6826	1	0	0	42	09:00	10:30
115899	242501	6833	1	0	0	42	09:00	10:30
115900	242501	6840	1	0	0	42	09:00	10:30
115901	242501	6847	1	0	0	42	09:00	10:30
115902	242501	6854	1	0	0	42	09:00	10:30
115903	242501	6861	1	0	0	42	09:00	10:30
115904	242501	6868	1	0	0	42	09:00	10:30
115905	242501	6875	1	0	0	42	09:00	10:30
115906	242501	6882	1	0	0	42	09:00	10:30
115907	242501	6889	1	0	0	42	09:00	10:30
115908	242501	6896	1	0	0	42	09:00	10:30
115909	242501	6791	2	0	0	42	10:40	12:10
115910	242501	6798	2	0	0	42	10:40	12:10
115911	242501	6805	2	0	0	42	10:40	12:10
115912	242501	6812	2	0	0	42	10:40	12:10
115913	242501	6819	2	0	0	42	10:40	12:10
115914	242501	6826	2	0	0	42	10:40	12:10
115915	242501	6833	2	0	0	42	10:40	12:10
115916	242501	6840	2	0	0	42	10:40	12:10
115917	242501	6847	2	0	0	42	10:40	12:10
115918	242501	6854	2	0	0	42	10:40	12:10
115919	242501	6861	2	0	0	42	10:40	12:10
115920	242501	6868	2	0	0	42	10:40	12:10
115921	242501	6875	2	0	0	42	10:40	12:10
115922	242501	6882	2	0	0	42	10:40	12:10
115923	242501	6889	2	0	0	42	10:40	12:10
115924	242501	6896	2	0	0	42	10:40	12:10
115925	242501	6791	3	0	0	42	12:40	14:10
115926	242501	6798	3	0	0	42	12:40	14:10
115927	242501	6805	3	0	0	42	12:40	14:10
115928	242501	6812	3	0	0	42	12:40	14:10
115929	242501	6819	3	0	0	42	12:40	14:10
115930	242501	6826	3	0	0	42	12:40	14:10
115931	242501	6833	3	0	0	42	12:40	14:10
115932	242501	6840	3	0	0	42	12:40	14:10
115933	242501	6847	3	0	0	42	12:40	14:10
115934	242501	6854	3	0	0	42	12:40	14:10
115935	242501	6861	3	0	0	42	12:40	14:10
115936	242501	6868	3	0	0	42	12:40	14:10
115937	242501	6875	3	0	0	42	12:40	14:10
115938	242501	6882	3	0	0	42	12:40	14:10
115939	242501	6889	3	0	0	42	12:40	14:10
115940	242501	6896	3	0	0	42	12:40	14:10
115941	242501	6791	4	0	0	42	14:20	15:50
115942	242501	6798	4	0	0	42	14:20	15:50
115943	242501	6805	4	0	0	42	14:20	15:50
115944	242501	6812	4	0	0	42	14:20	15:50
115945	242501	6819	4	0	0	42	14:20	15:50
115946	242501	6826	4	0	0	42	14:20	15:50
115947	242501	6833	4	0	0	42	14:20	15:50
115948	242501	6840	4	0	0	42	14:20	15:50
115949	242501	6847	4	0	0	42	14:20	15:50
115950	242501	6854	4	0	0	42	14:20	15:50
115951	242501	6861	4	0	0	42	14:20	15:50
115952	242501	6868	4	0	0	42	14:20	15:50
115953	242501	6875	4	0	0	42	14:20	15:50
115954	242501	6882	4	0	0	42	14:20	15:50
115955	242501	6889	4	0	0	42	14:20	15:50
115956	242501	6896	4	0	0	42	14:20	15:50
115957	242501	6791	5	0	0	42	16:20	17:50
115958	242501	6798	5	0	0	42	16:20	17:50
115959	242501	6805	5	0	0	42	16:20	17:50
115960	242501	6812	5	0	0	42	16:20	17:50
115961	242501	6819	5	0	0	42	16:20	17:50
115962	242501	6826	5	0	0	42	16:20	17:50
115963	242501	6833	5	0	0	42	16:20	17:50
115964	242501	6840	5	0	0	42	16:20	17:50
115965	242501	6847	5	0	0	42	16:20	17:50
115966	242501	6854	5	0	0	42	16:20	17:50
115967	242501	6861	5	0	0	42	16:20	17:50
115968	242501	6868	5	0	0	42	16:20	17:50
115969	242501	6875	5	0	0	42	16:20	17:50
115970	242501	6882	5	0	0	42	16:20	17:50
115971	242501	6889	5	0	0	42	16:20	17:50
115972	242501	6896	5	0	0	42	16:20	17:50
115973	242501	6792	1	0	0	42	09:00	10:30
115974	242501	6799	1	0	0	42	09:00	10:30
115975	242501	6806	1	0	0	42	09:00	10:30
115976	242501	6813	1	0	0	42	09:00	10:30
115977	242501	6820	1	0	0	42	09:00	10:30
115978	242501	6827	1	0	0	42	09:00	10:30
115979	242501	6834	1	0	0	42	09:00	10:30
115980	242501	6841	1	0	0	42	09:00	10:30
115981	242501	6848	1	0	0	42	09:00	10:30
115982	242501	6855	1	0	0	42	09:00	10:30
115983	242501	6862	1	0	0	42	09:00	10:30
115984	242501	6869	1	0	0	42	09:00	10:30
115985	242501	6876	1	0	0	42	09:00	10:30
115986	242501	6883	1	0	0	42	09:00	10:30
115987	242501	6890	1	0	0	42	09:00	10:30
115988	242501	6897	1	0	0	42	09:00	10:30
115989	242501	6792	2	0	0	42	10:40	12:10
115990	242501	6799	2	0	0	42	10:40	12:10
115991	242501	6806	2	0	0	42	10:40	12:10
115992	242501	6813	2	0	0	42	10:40	12:10
115993	242501	6820	2	0	0	42	10:40	12:10
115994	242501	6827	2	0	0	42	10:40	12:10
115995	242501	6834	2	0	0	42	10:40	12:10
115996	242501	6841	2	0	0	42	10:40	12:10
115997	242501	6848	2	0	0	42	10:40	12:10
115998	242501	6855	2	0	0	42	10:40	12:10
115999	242501	6862	2	0	0	42	10:40	12:10
116000	242501	6869	2	0	0	42	10:40	12:10
116001	242501	6876	2	0	0	42	10:40	12:10
116002	242501	6883	2	0	0	42	10:40	12:10
116003	242501	6890	2	0	0	42	10:40	12:10
116004	242501	6897	2	0	0	42	10:40	12:10
116005	242501	6792	3	0	0	42	12:40	14:10
116006	242501	6799	3	0	0	42	12:40	14:10
116007	242501	6806	3	0	0	42	12:40	14:10
116008	242501	6813	3	0	0	42	12:40	14:10
116009	242501	6820	3	0	0	42	12:40	14:10
116010	242501	6827	3	0	0	42	12:40	14:10
116011	242501	6834	3	0	0	42	12:40	14:10
116012	242501	6841	3	0	0	42	12:40	14:10
116013	242501	6848	3	0	0	42	12:40	14:10
116014	242501	6855	3	0	0	42	12:40	14:10
116015	242501	6862	3	0	0	42	12:40	14:10
116016	242501	6869	3	0	0	42	12:40	14:10
116017	242501	6876	3	0	0	42	12:40	14:10
116018	242501	6883	3	0	0	42	12:40	14:10
116019	242501	6890	3	0	0	42	12:40	14:10
116020	242501	6897	3	0	0	42	12:40	14:10
116021	242501	6792	4	0	0	42	14:20	15:50
116022	242501	6799	4	0	0	42	14:20	15:50
116023	242501	6806	4	0	0	42	14:20	15:50
116024	242501	6813	4	0	0	42	14:20	15:50
116025	242501	6820	4	0	0	42	14:20	15:50
116026	242501	6827	4	0	0	42	14:20	15:50
116027	242501	6834	4	0	0	42	14:20	15:50
116028	242501	6841	4	0	0	42	14:20	15:50
116029	242501	6848	4	0	0	42	14:20	15:50
116030	242501	6855	4	0	0	42	14:20	15:50
116031	242501	6862	4	0	0	42	14:20	15:50
116032	242501	6869	4	0	0	42	14:20	15:50
116033	242501	6876	4	0	0	42	14:20	15:50
116034	242501	6883	4	0	0	42	14:20	15:50
116035	242501	6890	4	0	0	42	14:20	15:50
116036	242501	6897	4	0	0	42	14:20	15:50
116037	242501	6792	5	0	0	42	16:20	17:50
116038	242501	6799	5	0	0	42	16:20	17:50
116039	242501	6806	5	0	0	42	16:20	17:50
116040	242501	6813	5	0	0	42	16:20	17:50
116041	242501	6820	5	0	0	42	16:20	17:50
116042	242501	6827	5	0	0	42	16:20	17:50
116043	242501	6834	5	0	0	42	16:20	17:50
116044	242501	6841	5	0	0	42	16:20	17:50
116045	242501	6848	5	0	0	42	16:20	17:50
116046	242501	6855	5	0	0	42	16:20	17:50
116047	242501	6862	5	0	0	42	16:20	17:50
116048	242501	6869	5	0	0	42	16:20	17:50
116049	242501	6876	5	0	0	42	16:20	17:50
116050	242501	6883	5	0	0	42	16:20	17:50
116051	242501	6890	5	0	0	42	16:20	17:50
116052	242501	6897	5	0	0	42	16:20	17:50
116053	242501	6788	1	0	0	87	09:00	10:30
116054	242501	6795	1	0	0	87	09:00	10:30
116055	242501	6802	1	0	0	87	09:00	10:30
116056	242501	6809	1	0	0	87	09:00	10:30
116057	242501	6816	1	0	0	87	09:00	10:30
116058	242501	6823	1	0	0	87	09:00	10:30
116059	242501	6830	1	0	0	87	09:00	10:30
116060	242501	6837	1	0	0	87	09:00	10:30
116061	242501	6844	1	0	0	87	09:00	10:30
116062	242501	6851	1	0	0	87	09:00	10:30
116063	242501	6858	1	0	0	87	09:00	10:30
116064	242501	6865	1	0	0	87	09:00	10:30
116065	242501	6872	1	0	0	87	09:00	10:30
116066	242501	6879	1	0	0	87	09:00	10:30
116067	242501	6886	1	0	0	87	09:00	10:30
116068	242501	6893	1	0	0	87	09:00	10:30
116069	242501	6788	2	0	0	87	10:40	12:10
116070	242501	6795	2	0	0	87	10:40	12:10
116071	242501	6802	2	0	0	87	10:40	12:10
116072	242501	6809	2	0	0	87	10:40	12:10
116073	242501	6816	2	0	0	87	10:40	12:10
116074	242501	6823	2	0	0	87	10:40	12:10
116075	242501	6830	2	0	0	87	10:40	12:10
116076	242501	6837	2	0	0	87	10:40	12:10
116077	242501	6844	2	0	0	87	10:40	12:10
116078	242501	6851	2	0	0	87	10:40	12:10
116079	242501	6858	2	0	0	87	10:40	12:10
116080	242501	6865	2	0	0	87	10:40	12:10
116081	242501	6872	2	0	0	87	10:40	12:10
116082	242501	6879	2	0	0	87	10:40	12:10
116083	242501	6886	2	0	0	87	10:40	12:10
116084	242501	6893	2	0	0	87	10:40	12:10
116085	242501	6788	3	0	0	87	12:40	14:10
116086	242501	6795	3	0	0	87	12:40	14:10
116087	242501	6802	3	0	0	87	12:40	14:10
116088	242501	6809	3	0	0	87	12:40	14:10
116089	242501	6816	3	0	0	87	12:40	14:10
116090	242501	6823	3	0	0	87	12:40	14:10
116091	242501	6830	3	0	0	87	12:40	14:10
116092	242501	6837	3	0	0	87	12:40	14:10
116093	242501	6844	3	0	0	87	12:40	14:10
116094	242501	6851	3	0	0	87	12:40	14:10
116095	242501	6858	3	0	0	87	12:40	14:10
116096	242501	6865	3	0	0	87	12:40	14:10
116097	242501	6872	3	0	0	87	12:40	14:10
116098	242501	6879	3	0	0	87	12:40	14:10
116099	242501	6886	3	0	0	87	12:40	14:10
116100	242501	6893	3	0	0	87	12:40	14:10
116101	242501	6788	4	0	0	87	14:20	15:50
116102	242501	6795	4	0	0	87	14:20	15:50
116103	242501	6802	4	0	0	87	14:20	15:50
116104	242501	6809	4	0	0	87	14:20	15:50
116105	242501	6816	4	0	0	87	14:20	15:50
116106	242501	6823	4	0	0	87	14:20	15:50
116107	242501	6830	4	0	0	87	14:20	15:50
116108	242501	6837	4	0	0	87	14:20	15:50
116109	242501	6844	4	0	0	87	14:20	15:50
116110	242501	6851	4	0	0	87	14:20	15:50
116111	242501	6858	4	0	0	87	14:20	15:50
116112	242501	6865	4	0	0	87	14:20	15:50
116113	242501	6872	4	0	0	87	14:20	15:50
116114	242501	6879	4	0	0	87	14:20	15:50
116115	242501	6886	4	0	0	87	14:20	15:50
116116	242501	6893	4	0	0	87	14:20	15:50
116117	242501	6788	5	0	0	129	16:20	17:50
116118	242501	6802	5	0	0	129	16:20	17:50
116119	242501	6816	5	0	0	129	16:20	17:50
116120	242501	6830	5	0	0	129	16:20	17:50
116121	242501	6844	5	0	0	129	16:20	17:50
116122	242501	6858	5	0	0	129	16:20	17:50
116123	242501	6872	5	0	0	129	16:20	17:50
116124	242501	6886	5	0	0	129	16:20	17:50
116125	242501	6789	1	0	0	87	09:00	10:30
116126	242501	6796	1	0	0	87	09:00	10:30
116127	242501	6803	1	0	0	87	09:00	10:30
116128	242501	6810	1	0	0	87	09:00	10:30
116129	242501	6817	1	0	0	87	09:00	10:30
116130	242501	6824	1	0	0	87	09:00	10:30
116131	242501	6831	1	0	0	87	09:00	10:30
116132	242501	6838	1	0	0	87	09:00	10:30
116133	242501	6845	1	0	0	87	09:00	10:30
116134	242501	6852	1	0	0	87	09:00	10:30
116135	242501	6859	1	0	0	87	09:00	10:30
116136	242501	6866	1	0	0	87	09:00	10:30
116137	242501	6873	1	0	0	87	09:00	10:30
116138	242501	6880	1	0	0	87	09:00	10:30
116139	242501	6887	1	0	0	87	09:00	10:30
116140	242501	6894	1	0	0	87	09:00	10:30
116141	242501	6789	2	0	0	87	10:40	12:10
116142	242501	6796	2	0	0	87	10:40	12:10
116143	242501	6803	2	0	0	87	10:40	12:10
116144	242501	6810	2	0	0	87	10:40	12:10
116145	242501	6817	2	0	0	87	10:40	12:10
116146	242501	6824	2	0	0	87	10:40	12:10
116147	242501	6831	2	0	0	87	10:40	12:10
116148	242501	6838	2	0	0	87	10:40	12:10
116149	242501	6845	2	0	0	87	10:40	12:10
116150	242501	6852	2	0	0	87	10:40	12:10
116151	242501	6859	2	0	0	87	10:40	12:10
116152	242501	6866	2	0	0	87	10:40	12:10
116153	242501	6873	2	0	0	87	10:40	12:10
116154	242501	6880	2	0	0	87	10:40	12:10
116155	242501	6887	2	0	0	87	10:40	12:10
116156	242501	6894	2	0	0	87	10:40	12:10
116157	242501	6789	3	0	0	87	12:40	14:10
116158	242501	6796	3	0	0	87	12:40	14:10
116159	242501	6803	3	0	0	87	12:40	14:10
116160	242501	6810	3	0	0	87	12:40	14:10
116161	242501	6817	3	0	0	87	12:40	14:10
116162	242501	6824	3	0	0	87	12:40	14:10
116163	242501	6831	3	0	0	87	12:40	14:10
116164	242501	6838	3	0	0	87	12:40	14:10
116165	242501	6845	3	0	0	87	12:40	14:10
116166	242501	6852	3	0	0	87	12:40	14:10
116167	242501	6859	3	0	0	87	12:40	14:10
116168	242501	6866	3	0	0	87	12:40	14:10
116169	242501	6873	3	0	0	87	12:40	14:10
116170	242501	6880	3	0	0	87	12:40	14:10
116171	242501	6887	3	0	0	87	12:40	14:10
116172	242501	6894	3	0	0	87	12:40	14:10
116173	242501	6789	4	0	0	87	14:20	15:50
116174	242501	6796	4	0	0	87	14:20	15:50
116175	242501	6803	4	0	0	87	14:20	15:50
116176	242501	6810	4	0	0	87	14:20	15:50
116177	242501	6817	4	0	0	87	14:20	15:50
116178	242501	6824	4	0	0	87	14:20	15:50
116179	242501	6831	4	0	0	87	14:20	15:50
116180	242501	6838	4	0	0	87	14:20	15:50
116181	242501	6845	4	0	0	87	14:20	15:50
116182	242501	6852	4	0	0	87	14:20	15:50
116183	242501	6859	4	0	0	87	14:20	15:50
116184	242501	6866	4	0	0	87	14:20	15:50
116185	242501	6873	4	0	0	87	14:20	15:50
116186	242501	6880	4	0	0	87	14:20	15:50
116187	242501	6887	4	0	0	87	14:20	15:50
116188	242501	6894	4	0	0	87	14:20	15:50
116189	242501	6789	5	0	0	87	16:20	17:50
116190	242501	6796	5	0	0	87	16:20	17:50
116191	242501	6803	5	0	0	87	16:20	17:50
116192	242501	6810	5	0	0	87	16:20	17:50
116193	242501	6817	5	0	0	87	16:20	17:50
116194	242501	6824	5	0	0	87	16:20	17:50
116195	242501	6831	5	0	0	87	16:20	17:50
116196	242501	6838	5	0	0	87	16:20	17:50
116197	242501	6845	5	0	0	87	16:20	17:50
116198	242501	6852	5	0	0	87	16:20	17:50
116199	242501	6859	5	0	0	87	16:20	17:50
116200	242501	6866	5	0	0	87	16:20	17:50
116201	242501	6873	5	0	0	87	16:20	17:50
116202	242501	6880	5	0	0	87	16:20	17:50
116203	242501	6887	5	0	0	87	16:20	17:50
116204	242501	6894	5	0	0	87	16:20	17:50
116205	242501	6790	2	0	0	130	10:40	12:10
116206	242501	6797	2	0	0	130	10:40	12:10
116207	242501	6804	2	0	0	130	10:40	12:10
116208	242501	6811	2	0	0	130	10:40	12:10
116209	242501	6818	2	0	0	130	10:40	12:10
116210	242501	6825	2	0	0	130	10:40	12:10
116211	242501	6832	2	0	0	130	10:40	12:10
116212	242501	6839	2	0	0	130	10:40	12:10
116213	242501	6846	2	0	0	130	10:40	12:10
116214	242501	6853	2	0	0	130	10:40	12:10
116215	242501	6860	2	0	0	130	10:40	12:10
116216	242501	6867	2	0	0	130	10:40	12:10
116217	242501	6874	2	0	0	130	10:40	12:10
116218	242501	6881	2	0	0	130	10:40	12:10
116219	242501	6888	2	0	0	130	10:40	12:10
116220	242501	6895	2	0	0	130	10:40	12:10
116221	242501	6790	3	0	0	129	12:40	14:10
116222	242501	6804	3	0	0	129	12:40	14:10
116223	242501	6818	3	0	0	129	12:40	14:10
116224	242501	6832	3	0	0	129	12:40	14:10
116225	242501	6846	3	0	0	129	12:40	14:10
116226	242501	6860	3	0	0	129	12:40	14:10
116227	242501	6874	3	0	0	129	12:40	14:10
116228	242501	6888	3	0	0	129	12:40	14:10
116229	242501	6797	4	0	0	131	14:20	15:50
116230	242501	6811	4	0	0	131	14:20	15:50
116231	242501	6825	4	0	0	131	14:20	15:50
116232	242501	6839	4	0	0	131	14:20	15:50
116233	242501	6853	4	0	0	131	14:20	15:50
116234	242501	6867	4	0	0	131	14:20	15:50
116235	242501	6881	4	0	0	131	14:20	15:50
116236	242501	6895	4	0	0	131	14:20	15:50
116237	242501	6790	4	0	0	129	14:20	15:50
116238	242501	6804	4	0	0	129	14:20	15:50
116239	242501	6818	4	0	0	129	14:20	15:50
116240	242501	6832	4	0	0	129	14:20	15:50
116241	242501	6846	4	0	0	129	14:20	15:50
116242	242501	6860	4	0	0	129	14:20	15:50
116243	242501	6874	4	0	0	129	14:20	15:50
116244	242501	6888	4	0	0	129	14:20	15:50
116245	242501	6790	5	0	0	131	16:20	17:50
116246	242501	6797	5	0	0	131	16:20	17:50
116247	242501	6804	5	0	0	131	16:20	17:50
116248	242501	6811	5	0	0	131	16:20	17:50
116249	242501	6818	5	0	0	131	16:20	17:50
116250	242501	6825	5	0	0	131	16:20	17:50
116251	242501	6832	5	0	0	131	16:20	17:50
116252	242501	6839	5	0	0	131	16:20	17:50
116253	242501	6846	5	0	0	131	16:20	17:50
116254	242501	6853	5	0	0	131	16:20	17:50
116255	242501	6860	5	0	0	131	16:20	17:50
116256	242501	6867	5	0	0	131	16:20	17:50
116257	242501	6874	5	0	0	131	16:20	17:50
116258	242501	6881	5	0	0	131	16:20	17:50
116259	242501	6888	5	0	0	131	16:20	17:50
116260	242501	6895	5	0	0	131	16:20	17:50
116261	242501	6791	1	0	0	87	09:00	10:30
116262	242501	6798	1	0	0	87	09:00	10:30
116263	242501	6805	1	0	0	87	09:00	10:30
116264	242501	6812	1	0	0	87	09:00	10:30
116265	242501	6819	1	0	0	87	09:00	10:30
116266	242501	6826	1	0	0	87	09:00	10:30
116267	242501	6833	1	0	0	87	09:00	10:30
116268	242501	6840	1	0	0	87	09:00	10:30
116269	242501	6847	1	0	0	87	09:00	10:30
116270	242501	6854	1	0	0	87	09:00	10:30
116271	242501	6861	1	0	0	87	09:00	10:30
116272	242501	6868	1	0	0	87	09:00	10:30
116273	242501	6875	1	0	0	87	09:00	10:30
116274	242501	6882	1	0	0	87	09:00	10:30
116275	242501	6889	1	0	0	87	09:00	10:30
116276	242501	6896	1	0	0	87	09:00	10:30
116277	242501	6791	2	0	0	87	10:40	12:10
116278	242501	6798	2	0	0	87	10:40	12:10
116279	242501	6805	2	0	0	87	10:40	12:10
116280	242501	6812	2	0	0	87	10:40	12:10
116281	242501	6819	2	0	0	87	10:40	12:10
116282	242501	6826	2	0	0	87	10:40	12:10
116283	242501	6833	2	0	0	87	10:40	12:10
116284	242501	6840	2	0	0	87	10:40	12:10
116285	242501	6847	2	0	0	87	10:40	12:10
116286	242501	6854	2	0	0	87	10:40	12:10
116287	242501	6861	2	0	0	87	10:40	12:10
116288	242501	6868	2	0	0	87	10:40	12:10
116289	242501	6875	2	0	0	87	10:40	12:10
116290	242501	6882	2	0	0	87	10:40	12:10
116291	242501	6889	2	0	0	87	10:40	12:10
116292	242501	6896	2	0	0	87	10:40	12:10
116293	242501	6791	3	0	0	87	12:40	14:10
116294	242501	6798	3	0	0	87	12:40	14:10
116295	242501	6805	3	0	0	87	12:40	14:10
116296	242501	6812	3	0	0	87	12:40	14:10
116297	242501	6819	3	0	0	87	12:40	14:10
116298	242501	6826	3	0	0	87	12:40	14:10
116299	242501	6833	3	0	0	87	12:40	14:10
116300	242501	6840	3	0	0	87	12:40	14:10
116301	242501	6847	3	0	0	87	12:40	14:10
116302	242501	6854	3	0	0	87	12:40	14:10
116303	242501	6861	3	0	0	87	12:40	14:10
116304	242501	6868	3	0	0	87	12:40	14:10
116305	242501	6875	3	0	0	87	12:40	14:10
116306	242501	6882	3	0	0	87	12:40	14:10
116307	242501	6889	3	0	0	87	12:40	14:10
116308	242501	6896	3	0	0	87	12:40	14:10
116309	242501	6791	4	0	0	87	14:20	15:50
116310	242501	6798	4	0	0	87	14:20	15:50
116311	242501	6805	4	0	0	87	14:20	15:50
116312	242501	6812	4	0	0	87	14:20	15:50
116313	242501	6819	4	0	0	87	14:20	15:50
116314	242501	6826	4	0	0	87	14:20	15:50
116315	242501	6833	4	0	0	87	14:20	15:50
116316	242501	6840	4	0	0	87	14:20	15:50
116317	242501	6847	4	0	0	87	14:20	15:50
116318	242501	6854	4	0	0	87	14:20	15:50
116319	242501	6861	4	0	0	87	14:20	15:50
116320	242501	6868	4	0	0	87	14:20	15:50
116321	242501	6875	4	0	0	87	14:20	15:50
116322	242501	6882	4	0	0	87	14:20	15:50
116323	242501	6889	4	0	0	87	14:20	15:50
116324	242501	6896	4	0	0	87	14:20	15:50
116325	242501	6791	5	0	0	87	16:20	17:50
116326	242501	6798	5	0	0	87	16:20	17:50
116327	242501	6805	5	0	0	87	16:20	17:50
116328	242501	6812	5	0	0	87	16:20	17:50
116329	242501	6819	5	0	0	87	16:20	17:50
116330	242501	6826	5	0	0	87	16:20	17:50
116331	242501	6833	5	0	0	87	16:20	17:50
116332	242501	6840	5	0	0	87	16:20	17:50
116333	242501	6847	5	0	0	87	16:20	17:50
116334	242501	6854	5	0	0	87	16:20	17:50
116335	242501	6861	5	0	0	87	16:20	17:50
116336	242501	6868	5	0	0	87	16:20	17:50
116337	242501	6875	5	0	0	87	16:20	17:50
116338	242501	6882	5	0	0	87	16:20	17:50
116339	242501	6889	5	0	0	87	16:20	17:50
116340	242501	6896	5	0	0	87	16:20	17:50
116341	242501	6792	2	0	0	132	10:40	12:10
116342	242501	6799	2	0	0	132	10:40	12:10
116343	242501	6806	2	0	0	132	10:40	12:10
116344	242501	6813	2	0	0	132	10:40	12:10
116345	242501	6820	2	0	0	132	10:40	12:10
116346	242501	6827	2	0	0	132	10:40	12:10
116347	242501	6834	2	0	0	132	10:40	12:10
116348	242501	6841	2	0	0	132	10:40	12:10
116349	242501	6848	2	0	0	132	10:40	12:10
116350	242501	6855	2	0	0	132	10:40	12:10
116351	242501	6862	2	0	0	132	10:40	12:10
116352	242501	6869	2	0	0	132	10:40	12:10
116353	242501	6876	2	0	0	132	10:40	12:10
116354	242501	6883	2	0	0	132	10:40	12:10
116355	242501	6890	2	0	0	132	10:40	12:10
116356	242501	6897	2	0	0	132	10:40	12:10
116357	242501	6799	5	0	0	132	16:20	17:50
116358	242501	6813	5	0	0	132	16:20	17:50
116359	242501	6827	5	0	0	132	16:20	17:50
116360	242501	6841	5	0	0	132	16:20	17:50
116361	242501	6855	5	0	0	132	16:20	17:50
116362	242501	6869	5	0	0	132	16:20	17:50
116363	242501	6883	5	0	0	132	16:20	17:50
116364	242501	6897	5	0	0	132	16:20	17:50
\.


--
-- TOC entry 4922 (class 0 OID 142565)
-- Dependencies: 221
-- Data for Name: sc_rasp18_days; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp18_days (id, semcode, day, weekday, week) FROM stdin;
6781	242501	2025-02-10	1	1
6782	242501	2025-02-11	2	1
6783	242501	2025-02-12	3	1
6784	242501	2025-02-13	4	1
6785	242501	2025-02-14	5	1
6786	242501	2025-02-15	6	1
6787	242501	2025-02-16	0	1
6788	242501	2025-02-17	1	2
6789	242501	2025-02-18	2	2
6790	242501	2025-02-19	3	2
6791	242501	2025-02-20	4	2
6792	242501	2025-02-21	5	2
6793	242501	2025-02-22	6	2
6794	242501	2025-02-23	0	2
6795	242501	2025-02-24	1	3
6796	242501	2025-02-25	2	3
6797	242501	2025-02-26	3	3
6798	242501	2025-02-27	4	3
6799	242501	2025-02-28	5	3
6800	242501	2025-03-01	6	3
6801	242501	2025-03-02	0	3
6802	242501	2025-03-03	1	4
6803	242501	2025-03-04	2	4
6804	242501	2025-03-05	3	4
6805	242501	2025-03-06	4	4
6806	242501	2025-03-07	5	4
6807	242501	2025-03-08	6	4
6808	242501	2025-03-09	0	4
6809	242501	2025-03-10	1	5
6810	242501	2025-03-11	2	5
6811	242501	2025-03-12	3	5
6812	242501	2025-03-13	4	5
6813	242501	2025-03-14	5	5
6814	242501	2025-03-15	6	5
6815	242501	2025-03-16	0	5
6816	242501	2025-03-17	1	6
6817	242501	2025-03-18	2	6
6818	242501	2025-03-19	3	6
6819	242501	2025-03-20	4	6
6820	242501	2025-03-21	5	6
6821	242501	2025-03-22	6	6
6822	242501	2025-03-23	0	6
6823	242501	2025-03-24	1	7
6824	242501	2025-03-25	2	7
6825	242501	2025-03-26	3	7
6826	242501	2025-03-27	4	7
6827	242501	2025-03-28	5	7
6828	242501	2025-03-29	6	7
6829	242501	2025-03-30	0	7
6830	242501	2025-03-31	1	8
6831	242501	2025-04-01	2	8
6832	242501	2025-04-02	3	8
6833	242501	2025-04-03	4	8
6834	242501	2025-04-04	5	8
6835	242501	2025-04-05	6	8
6836	242501	2025-04-06	0	8
6837	242501	2025-04-07	1	9
6838	242501	2025-04-08	2	9
6839	242501	2025-04-09	3	9
6840	242501	2025-04-10	4	9
6841	242501	2025-04-11	5	9
6842	242501	2025-04-12	6	9
6843	242501	2025-04-13	0	9
6844	242501	2025-04-14	1	10
6845	242501	2025-04-15	2	10
6846	242501	2025-04-16	3	10
6847	242501	2025-04-17	4	10
6848	242501	2025-04-18	5	10
6849	242501	2025-04-19	6	10
6850	242501	2025-04-20	0	10
6851	242501	2025-04-21	1	11
6852	242501	2025-04-22	2	11
6853	242501	2025-04-23	3	11
6854	242501	2025-04-24	4	11
6855	242501	2025-04-25	5	11
6856	242501	2025-04-26	6	11
6857	242501	2025-04-27	0	11
6858	242501	2025-04-28	1	12
6859	242501	2025-04-29	2	12
6860	242501	2025-04-30	3	12
6861	242501	2025-05-01	4	12
6862	242501	2025-05-02	5	12
6863	242501	2025-05-03	6	12
6864	242501	2025-05-04	0	12
6865	242501	2025-05-05	1	13
6866	242501	2025-05-06	2	13
6867	242501	2025-05-07	3	13
6868	242501	2025-05-08	4	13
6869	242501	2025-05-09	5	13
6870	242501	2025-05-10	6	13
6871	242501	2025-05-11	0	13
6872	242501	2025-05-12	1	14
6873	242501	2025-05-13	2	14
6874	242501	2025-05-14	3	14
6875	242501	2025-05-15	4	14
6876	242501	2025-05-16	5	14
6877	242501	2025-05-17	6	14
6878	242501	2025-05-18	0	14
6879	242501	2025-05-19	1	15
6880	242501	2025-05-20	2	15
6881	242501	2025-05-21	3	15
6882	242501	2025-05-22	4	15
6883	242501	2025-05-23	5	15
6884	242501	2025-05-24	6	15
6885	242501	2025-05-25	0	15
6886	242501	2025-05-26	1	16
6887	242501	2025-05-27	2	16
6888	242501	2025-05-28	3	16
6889	242501	2025-05-29	4	16
6890	242501	2025-05-30	5	16
6891	242501	2025-05-31	6	16
6892	242501	2025-06-01	0	16
6893	242501	2025-06-02	1	17
6894	242501	2025-06-03	2	17
6895	242501	2025-06-04	3	17
6896	242501	2025-06-05	4	17
6897	242501	2025-06-06	5	17
6898	242501	2025-06-07	6	17
6899	242501	2025-06-08	0	17
6900	242501	2025-06-09	1	18
6901	242501	2025-06-10	2	18
6902	242501	2025-06-11	3	18
6903	242501	2025-06-12	4	18
6904	242501	2025-06-13	5	18
6905	242501	2025-06-14	6	18
6906	242501	2025-06-15	0	18
6907	242501	2025-06-16	1	19
6908	242501	2025-06-17	2	19
6909	242501	2025-06-18	3	19
6910	242501	2025-06-19	4	19
6911	242501	2025-06-20	5	19
6912	242501	2025-06-21	6	19
6913	242501	2025-06-22	0	19
6914	242501	2025-06-23	1	20
6915	242501	2025-06-24	2	20
6916	242501	2025-06-25	3	20
6917	242501	2025-06-26	4	20
6918	242501	2025-06-27	5	20
6919	242501	2025-06-28	6	20
6920	242501	2025-06-29	0	20
6921	242501	2025-06-30	1	21
6922	242501	2025-07-01	2	21
6923	242501	2025-07-02	3	21
6924	242501	2025-07-03	4	21
6925	242501	2025-07-04	5	21
6926	242501	2025-07-05	6	21
6927	242501	2025-07-06	0	21
6928	242501	2025-07-07	1	22
6929	242501	2025-07-08	2	22
6930	242501	2025-07-09	3	22
6931	242501	2025-07-10	4	22
6932	242501	2025-07-11	5	22
6933	242501	2025-07-12	6	22
6934	242501	2025-07-13	0	22
6935	242501	2025-07-14	1	23
6936	242501	2025-07-15	2	23
6937	242501	2025-07-16	3	23
6620	242500	2024-09-02	1	1
6621	242500	2024-09-03	2	1
6622	242500	2024-09-04	3	1
6623	242500	2024-09-05	4	1
6624	242500	2024-09-06	5	1
6625	242500	2024-09-07	6	1
6626	242500	2024-09-08	0	1
6627	242500	2024-09-09	1	2
6628	242500	2024-09-10	2	2
6629	242500	2024-09-11	3	2
6630	242500	2024-09-12	4	2
6631	242500	2024-09-13	5	2
6632	242500	2024-09-14	6	2
6633	242500	2024-09-15	0	2
6634	242500	2024-09-16	1	3
6635	242500	2024-09-17	2	3
6636	242500	2024-09-18	3	3
6637	242500	2024-09-19	4	3
6638	242500	2024-09-20	5	3
6639	242500	2024-09-21	6	3
6640	242500	2024-09-22	0	3
6641	242500	2024-09-23	1	4
6642	242500	2024-09-24	2	4
6643	242500	2024-09-25	3	4
6644	242500	2024-09-26	4	4
6645	242500	2024-09-27	5	4
6646	242500	2024-09-28	6	4
6647	242500	2024-09-29	0	4
6648	242500	2024-09-30	1	5
6649	242500	2024-10-01	2	5
6650	242500	2024-10-02	3	5
6651	242500	2024-10-03	4	5
6652	242500	2024-10-04	5	5
6653	242500	2024-10-05	6	5
6654	242500	2024-10-06	0	5
6655	242500	2024-10-07	1	6
6656	242500	2024-10-08	2	6
6657	242500	2024-10-09	3	6
6658	242500	2024-10-10	4	6
6659	242500	2024-10-11	5	6
6660	242500	2024-10-12	6	6
6661	242500	2024-10-13	0	6
6662	242500	2024-10-14	1	7
6663	242500	2024-10-15	2	7
6664	242500	2024-10-16	3	7
6665	242500	2024-10-17	4	7
6666	242500	2024-10-18	5	7
6667	242500	2024-10-19	6	7
6668	242500	2024-10-20	0	7
6669	242500	2024-10-21	1	8
6670	242500	2024-10-22	2	8
6671	242500	2024-10-23	3	8
6672	242500	2024-10-24	4	8
6673	242500	2024-10-25	5	8
6674	242500	2024-10-26	6	8
6675	242500	2024-10-27	0	8
6676	242500	2024-10-28	1	9
6677	242500	2024-10-29	2	9
6678	242500	2024-10-30	3	9
6679	242500	2024-10-31	4	9
6680	242500	2024-11-01	5	9
6681	242500	2024-11-02	6	9
6682	242500	2024-11-03	0	9
6683	242500	2024-11-04	1	10
6684	242500	2024-11-05	2	10
6685	242500	2024-11-06	3	10
6686	242500	2024-11-07	4	10
6687	242500	2024-11-08	5	10
6688	242500	2024-11-09	6	10
6689	242500	2024-11-10	0	10
6690	242500	2024-11-11	1	11
6691	242500	2024-11-12	2	11
6692	242500	2024-11-13	3	11
6693	242500	2024-11-14	4	11
6694	242500	2024-11-15	5	11
6695	242500	2024-11-16	6	11
6696	242500	2024-11-17	0	11
6697	242500	2024-11-18	1	12
6698	242500	2024-11-19	2	12
6699	242500	2024-11-20	3	12
6700	242500	2024-11-21	4	12
6701	242500	2024-11-22	5	12
6702	242500	2024-11-23	6	12
6703	242500	2024-11-24	0	12
6704	242500	2024-11-25	1	13
6705	242500	2024-11-26	2	13
6706	242500	2024-11-27	3	13
6707	242500	2024-11-28	4	13
6708	242500	2024-11-29	5	13
6709	242500	2024-11-30	6	13
6710	242500	2024-12-01	0	13
6711	242500	2024-12-02	1	14
6712	242500	2024-12-03	2	14
6713	242500	2024-12-04	3	14
6714	242500	2024-12-05	4	14
6715	242500	2024-12-06	5	14
6716	242500	2024-12-07	6	14
6717	242500	2024-12-08	0	14
6718	242500	2024-12-09	1	15
6719	242500	2024-12-10	2	15
6720	242500	2024-12-11	3	15
6721	242500	2024-12-12	4	15
6722	242500	2024-12-13	5	15
6723	242500	2024-12-14	6	15
6724	242500	2024-12-15	0	15
6725	242500	2024-12-16	1	16
6726	242500	2024-12-17	2	16
6727	242500	2024-12-18	3	16
6728	242500	2024-12-19	4	16
6729	242500	2024-12-20	5	16
6730	242500	2024-12-21	6	16
6731	242500	2024-12-22	0	16
6732	242500	2024-12-23	1	17
6733	242500	2024-12-24	2	17
6734	242500	2024-12-25	3	17
6735	242500	2024-12-26	4	17
6736	242500	2024-12-27	5	17
6737	242500	2024-12-28	6	17
6738	242500	2024-12-29	0	17
6739	242500	2024-12-30	1	18
6740	242500	2024-12-31	2	18
6741	242500	2025-01-01	3	18
6742	242500	2025-01-02	4	18
6743	242500	2025-01-03	5	18
6744	242500	2025-01-04	6	18
6745	242500	2025-01-05	0	18
6746	242500	2025-01-06	1	19
6747	242500	2025-01-07	2	19
6748	242500	2025-01-08	3	19
6749	242500	2025-01-09	4	19
6750	242500	2025-01-10	5	19
6751	242500	2025-01-11	6	19
6752	242500	2025-01-12	0	19
6753	242500	2025-01-13	1	20
6754	242500	2025-01-14	2	20
6755	242500	2025-01-15	3	20
6756	242500	2025-01-16	4	20
6757	242500	2025-01-17	5	20
6758	242500	2025-01-18	6	20
6759	242500	2025-01-19	0	20
6760	242500	2025-01-20	1	21
6761	242500	2025-01-21	2	21
6762	242500	2025-01-22	3	21
6763	242500	2025-01-23	4	21
6764	242500	2025-01-24	5	21
6765	242500	2025-01-25	6	21
6766	242500	2025-01-26	0	21
6767	242500	2025-01-27	1	22
6768	242500	2025-01-28	2	22
6769	242500	2025-01-29	3	22
6770	242500	2025-01-30	4	22
6771	242500	2025-01-31	5	22
6772	242500	2025-02-01	6	22
6773	242500	2025-02-02	0	22
6774	242500	2025-02-03	1	23
6775	242500	2025-02-04	2	23
6776	242500	2025-02-05	3	23
6777	242500	2025-02-06	4	23
6778	242500	2025-02-07	5	23
6779	242500	2025-02-08	6	23
6780	242500	2025-02-09	0	23
6938	242501	2025-07-17	4	23
6939	242501	2025-07-18	5	23
6940	242501	2025-07-19	6	23
6941	242501	2025-07-20	0	23
6942	242501	2025-07-21	1	24
6943	242501	2025-07-22	2	24
6944	242501	2025-07-23	3	24
6945	242501	2025-07-24	4	24
6946	242501	2025-07-25	5	24
6947	242501	2025-07-26	6	24
6948	242501	2025-07-27	0	24
6949	242501	2025-07-28	1	25
6950	242501	2025-07-29	2	25
6951	242501	2025-07-30	3	25
6952	242501	2025-07-31	4	25
6953	242501	2025-08-01	5	25
6954	242501	2025-08-02	6	25
6955	242501	2025-08-03	0	25
6956	242501	2025-08-04	1	26
6957	242501	2025-08-05	2	26
6958	242501	2025-08-06	3	26
6959	242501	2025-08-07	4	26
6960	242501	2025-08-08	5	26
6961	242501	2025-08-09	6	26
6962	242501	2025-08-10	0	26
6963	242501	2025-08-11	1	27
6964	242501	2025-08-12	2	27
6965	242501	2025-08-13	3	27
6966	242501	2025-08-14	4	27
6967	242501	2025-08-15	5	27
6968	242501	2025-08-16	6	27
6969	242501	2025-08-17	0	27
6970	242501	2025-08-18	1	28
6971	242501	2025-08-19	2	28
6972	242501	2025-08-20	3	28
6973	242501	2025-08-21	4	28
6974	242501	2025-08-22	5	28
6975	242501	2025-08-23	6	28
6976	242501	2025-08-24	0	28
6977	242501	2025-08-25	1	29
6978	242501	2025-08-26	2	29
6979	242501	2025-08-27	3	29
6980	242501	2025-08-28	4	29
6981	242501	2025-08-29	5	29
6982	242501	2025-08-30	6	29
6983	242501	2025-08-31	0	29
\.


--
-- TOC entry 4924 (class 0 OID 142569)
-- Dependencies: 223
-- Data for Name: sc_rasp18_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp18_groups (id, rasp18_id, group_id, subgroup) FROM stdin;
403306	88471	0	0
403307	88472	0	0
403308	88473	0	0
403309	88474	0	0
403310	88475	0	0
403311	88476	0	0
403312	88477	0	0
403313	88478	0	0
403314	88479	0	0
403315	88480	0	0
403316	88481	0	0
403317	88482	0	0
403318	88483	0	0
403319	88484	0	0
403320	88485	0	0
403321	88486	0	0
403322	88487	0	0
403323	88488	0	0
403324	88489	0	0
403325	88490	0	0
403326	88491	0	0
403327	88492	0	0
403328	88493	0	0
403329	88494	0	0
403330	88495	0	0
403331	88496	0	0
403332	88497	0	0
403333	88498	0	0
403334	88499	0	0
403335	88500	0	0
403336	88501	0	0
403337	88502	0	0
403338	88503	0	0
403339	88504	0	0
403340	88505	0	0
403341	88506	0	0
403342	88507	0	0
403343	88508	0	0
403344	88509	0	0
403345	88510	0	0
403346	88511	0	0
403347	88512	0	0
403348	88513	0	0
403349	88514	0	0
403350	88515	0	0
403351	88516	0	0
403352	88517	0	0
403353	88518	0	0
403354	88519	0	1
403355	88520	0	1
403356	88521	0	1
403357	88522	0	1
403358	88523	0	1
403359	88524	0	1
403360	88525	0	1
403361	88526	0	1
403362	88527	0	1
403363	88528	0	1
403364	88529	0	1
403365	88530	0	1
403366	88531	0	1
403367	88532	0	1
403368	88533	0	1
403369	88534	0	1
403370	88535	0	0
403371	88536	0	0
403372	88537	0	0
403373	88538	0	0
403374	88539	0	0
403375	88540	0	0
403376	88541	0	0
403377	88542	0	0
403378	88543	0	0
403379	88544	0	0
403380	88545	0	0
403381	88546	0	0
403382	88547	0	0
403383	88548	0	0
403384	88549	0	0
403385	88550	0	0
403386	88551	0	0
403387	88552	0	0
403388	88553	0	0
403389	88554	0	0
403390	88555	0	0
403391	88556	0	0
403392	88557	0	0
403393	88558	0	0
403394	88559	0	0
403395	88560	0	0
403396	88561	0	0
403397	88562	0	0
403398	88563	0	0
403399	88564	0	0
403400	88565	0	0
403401	88566	0	0
403402	88567	0	0
403403	88568	0	0
403404	88569	0	0
403405	88570	0	0
403406	88571	0	0
403407	88572	0	0
403408	88573	0	0
403409	88574	0	0
403410	88575	0	0
403411	88576	0	0
403412	88577	0	0
403413	88578	0	0
403414	88579	0	0
403415	88580	0	0
403416	88581	0	0
403417	88582	0	0
403418	88583	0	0
403419	88584	0	0
403420	88585	0	0
403421	88586	0	0
403422	88587	0	0
403423	88588	0	0
403424	88589	0	0
403425	88590	0	0
403426	88591	0	0
403427	88592	0	0
403428	88593	0	0
403429	88594	0	0
403430	88595	0	0
403431	88596	0	0
403432	88597	0	0
403433	88598	0	0
403434	88599	0	0
403435	88600	0	0
403436	88601	0	0
403437	88602	0	0
403438	88603	0	0
403439	88604	0	0
403440	88605	0	0
403441	88606	0	0
403442	88607	0	0
403443	88608	0	0
403444	88609	0	0
403445	88610	0	0
403446	88611	0	0
403447	88612	0	0
403448	88613	0	0
403449	88614	0	0
403450	88615	0	0
403451	88616	0	0
403452	88617	0	0
403453	88618	0	0
403454	88619	0	0
403455	88620	0	0
403456	88621	0	0
403457	88622	0	0
403458	88623	0	0
403459	88624	0	0
403460	88625	0	0
403461	88626	0	0
403462	88627	0	0
403463	88628	0	0
403464	88629	0	0
403465	88630	0	0
403466	88631	0	0
403467	88632	0	0
403468	88633	0	0
403469	88634	0	0
403470	88635	0	0
403471	88636	0	0
403472	88637	0	0
403473	88638	0	0
403474	88639	0	0
403475	88640	0	0
403476	88641	0	0
403477	88642	0	0
403478	88643	0	0
403479	88644	0	0
403480	88645	0	0
403481	88646	0	0
403482	88647	0	0
403483	88648	0	0
403484	88649	0	0
403485	88650	0	0
403486	88651	0	0
403487	88652	0	0
403488	88653	0	0
403489	88654	0	0
403490	88655	0	0
403491	88656	0	0
403492	88657	0	0
403493	88658	0	0
403494	88659	0	0
403495	88660	0	0
403496	88661	0	0
403497	88662	0	0
403498	88663	0	0
403499	88664	0	0
403500	88665	0	0
403501	88666	0	0
403502	88667	0	0
403503	88668	0	0
403504	88669	0	0
403505	88670	0	0
403506	88671	0	0
403507	88672	0	0
403508	88673	0	0
403509	88674	0	0
403510	88675	0	0
403511	88676	0	0
403512	88677	0	0
403513	88678	0	0
403514	88679	0	0
403515	88680	0	0
403516	88681	0	0
403517	88682	0	0
403518	88683	0	0
403519	88684	0	0
403520	88685	0	0
403521	88686	0	0
403522	88687	0	2
403523	88688	0	2
403524	88689	0	2
403525	88690	0	2
403526	88691	0	2
403527	88692	0	2
403528	88693	0	2
403529	88694	0	2
403530	88695	0	2
403531	88696	0	2
403532	88697	0	2
403533	88698	0	2
403534	88699	0	2
403535	88700	0	2
403536	88701	0	2
403537	88702	0	2
403538	88703	0	0
403539	88704	0	0
403540	88705	0	0
403541	88706	0	0
403542	88707	0	0
403543	88708	0	0
403544	88709	0	0
403545	88710	0	0
403546	88711	0	0
403547	88712	0	0
403548	88713	0	0
403549	88714	0	0
403550	88715	0	0
403551	88716	0	0
403552	88717	0	0
403553	88718	0	0
403554	88719	0	1
403555	88720	0	1
403556	88721	0	1
403557	88722	0	1
403558	88723	0	1
403559	88724	0	1
403560	88725	0	1
403561	88726	0	1
403562	88727	0	0
403563	88728	0	0
403564	88729	0	0
403565	88730	0	0
403566	88731	0	0
403567	88732	0	0
403568	88733	0	0
403569	88734	0	0
403570	88735	0	0
403571	88736	0	0
403572	88737	0	0
403573	88738	0	0
403574	88739	0	0
403575	88740	0	0
403576	88741	0	0
403577	88742	0	0
403578	88743	0	0
403579	88744	0	0
403580	88745	0	0
403581	88746	0	0
403582	88747	0	0
403583	88748	0	0
403584	88749	0	0
403585	88750	0	0
403586	88751	0	0
403587	88752	0	0
403588	88753	0	0
403589	88754	0	0
403590	88755	0	0
403591	88756	0	0
403592	88757	0	0
403593	88758	0	0
403594	88759	0	0
403595	88760	0	0
403596	88761	0	0
403597	88762	0	0
403598	88763	0	0
403599	88764	0	0
403600	88765	0	0
403601	88766	0	0
403602	88767	0	0
403603	88768	0	0
403604	88769	0	0
403605	88770	0	0
403606	88771	0	0
403607	88772	0	0
403608	88773	0	0
403609	88774	0	0
403610	88775	0	2
403611	88776	0	2
403612	88777	0	2
403613	88778	0	2
403614	88779	0	2
403615	88780	0	2
403616	88781	0	2
403617	88782	0	2
403618	88783	0	0
403619	88784	0	0
403620	88785	0	0
403621	88786	0	0
403622	88787	0	0
403623	88788	0	0
403624	88789	0	0
403625	88790	0	0
403626	88791	1	0
403627	88792	1	0
403628	88793	1	0
403629	88794	1	0
403630	88795	1	0
403631	88796	1	0
403632	88797	1	0
403633	88798	1	0
403634	88799	1	0
403635	88800	1	0
403636	88801	1	0
403637	88802	1	0
403638	88803	1	0
403639	88804	1	0
403640	88805	1	0
403641	88806	1	0
403642	88807	1	0
403643	88808	1	0
403644	88809	1	0
403645	88810	1	0
403646	88811	1	0
403647	88812	1	0
403648	88813	1	0
403649	88814	1	0
403650	88815	1	0
403651	88816	1	0
403652	88817	1	0
403653	88818	1	0
403654	88819	1	0
403655	88820	1	0
403656	88821	1	0
403657	88822	1	0
403658	88823	1	0
403659	88824	1	0
403660	88825	1	0
403661	88826	1	0
403662	88827	1	0
403663	88828	1	0
403664	88829	1	0
403665	88830	1	0
403666	88831	1	0
403667	88832	1	0
403668	88833	1	0
403669	88834	1	0
403670	88835	1	0
403671	88836	1	0
403672	88837	1	0
403673	88838	1	0
403674	88839	1	0
403675	88840	1	0
403676	88841	1	0
403677	88842	1	0
403678	88843	1	0
403679	88844	1	0
403680	88845	1	0
403681	88846	1	0
403682	88847	1	2
403683	88848	1	2
403684	88849	1	2
403685	88850	1	2
403686	88851	1	2
403687	88852	1	2
403688	88853	1	2
403689	88854	1	2
403690	88855	1	2
403691	88856	1	2
403692	88857	1	2
403693	88858	1	2
403694	88859	1	2
403695	88860	1	2
403696	88861	1	2
403697	88862	1	2
403698	88863	1	0
403699	88864	1	0
403700	88865	1	0
403701	88866	1	0
403702	88867	1	0
403703	88868	1	0
403704	88869	1	0
403705	88870	1	0
403706	88871	1	0
403707	88872	1	0
403708	88873	1	0
403709	88874	1	0
403710	88875	1	0
403711	88876	1	0
403712	88877	1	0
403713	88878	1	0
403714	88879	1	0
403715	88880	1	0
403716	88881	1	0
403717	88882	1	0
403718	88883	1	0
403719	88884	1	0
403720	88885	1	0
403721	88886	1	0
403722	88887	1	0
403723	88888	1	0
403724	88889	1	0
403725	88890	1	0
403726	88891	1	0
403727	88892	1	0
403728	88893	1	0
403729	88894	1	0
403730	88895	1	0
403731	88896	1	0
403732	88897	1	0
403733	88898	1	0
403734	88899	1	0
403735	88900	1	0
403736	88901	1	0
403737	88902	1	0
403738	88903	1	0
403739	88904	1	0
403740	88905	1	0
403741	88906	1	0
403742	88907	1	0
403743	88908	1	0
403744	88909	1	0
403745	88910	1	0
403746	88911	1	0
403747	88912	1	0
403748	88913	1	0
403749	88914	1	0
403750	88915	1	0
403751	88916	1	0
403752	88917	1	0
403753	88918	1	0
403754	88919	1	0
403755	88920	1	0
403756	88921	1	0
403757	88922	1	0
403758	88923	1	0
403759	88924	1	0
403760	88925	1	0
403761	88926	1	0
403762	88927	1	0
403763	88928	1	0
403764	88929	1	0
403765	88930	1	0
403766	88931	1	0
403767	88932	1	0
403768	88933	1	0
403769	88934	1	0
403770	88935	1	0
403771	88936	1	0
403772	88937	1	0
403773	88938	1	0
403774	88939	1	0
403775	88940	1	0
403776	88941	1	0
403777	88942	1	0
403778	88943	1	0
403779	88944	1	0
403780	88945	1	0
403781	88946	1	0
403782	88947	1	0
403783	88948	1	0
403784	88949	1	0
403785	88950	1	0
403786	88951	1	0
403787	88952	1	0
403788	88953	1	0
403789	88954	1	0
403790	88955	1	0
403791	88956	1	0
403792	88957	1	0
403793	88958	1	0
403794	88959	1	0
403795	88960	1	0
403796	88961	1	0
403797	88962	1	0
403798	88963	1	0
403799	88964	1	0
403800	88965	1	0
403801	88966	1	0
403802	88967	1	0
403803	88968	1	0
403804	88969	1	0
403805	88970	1	0
403806	88971	1	0
403807	88972	1	0
403808	88973	1	0
403809	88974	1	0
403810	88975	1	0
403811	88976	1	0
403812	88977	1	0
403813	88978	1	0
403814	88979	1	0
403815	88980	1	0
403816	88981	1	0
403817	88982	1	0
403818	88983	1	0
403819	88984	1	0
403820	88985	1	0
403821	88986	1	0
403822	88987	1	0
403823	88988	1	0
403824	88989	1	0
403825	88990	1	0
403826	88991	1	0
403827	88992	1	0
403828	88993	1	0
403829	88994	1	0
403830	88995	1	0
403831	88996	1	0
403832	88997	1	0
403833	88998	1	0
403834	88999	1	0
403835	89000	1	0
403836	89001	1	0
403837	89002	1	0
403838	89003	1	0
403839	89004	1	0
403840	89005	1	0
403841	89006	1	0
403842	89007	1	1
403843	89008	1	1
403844	89009	1	1
403845	89010	1	1
403846	89011	1	1
403847	89012	1	1
403848	89013	1	1
403849	89014	1	1
403850	89015	1	1
403851	89016	1	1
403852	89017	1	1
403853	89018	1	1
403854	89019	1	1
403855	89020	1	1
403856	89021	1	1
403857	89022	1	1
403858	89023	1	0
403859	89024	1	0
403860	89025	1	0
403861	89026	1	0
403862	89027	1	0
403863	89028	1	0
403864	89029	1	0
403865	89030	1	0
403866	89031	1	0
403867	89032	1	0
403868	89033	1	0
403869	89034	1	0
403870	89035	1	0
403871	89036	1	0
403872	89037	1	0
403873	89038	1	0
403874	89039	1	1
403875	89040	1	1
403876	89041	1	1
403877	89042	1	1
403878	89043	1	1
403879	89044	1	1
403880	89045	1	1
403881	89046	1	1
403882	89047	1	0
403883	89048	1	0
403884	89049	1	0
403885	89050	1	0
403886	89051	1	0
403887	89052	1	0
403888	89053	1	0
403889	89054	1	0
403890	89055	1	0
403891	89056	1	0
403892	89057	1	0
403893	89058	1	0
403894	89059	1	0
403895	89060	1	0
403896	89061	1	0
403897	89062	1	0
403898	89063	1	0
403899	89064	1	0
403900	89065	1	0
403901	89066	1	0
403902	89067	1	0
403903	89068	1	0
403904	89069	1	0
403905	89070	1	0
403906	89071	1	0
403907	89072	1	0
403908	89073	1	0
403909	89074	1	0
403910	89075	1	0
403911	89076	1	0
403912	89077	1	0
403913	89078	1	0
403914	89079	1	0
403915	89080	1	0
403916	89081	1	0
403917	89082	1	0
403918	89083	1	0
403919	89084	1	0
403920	89085	1	0
403921	89086	1	0
403922	89087	1	0
403923	89088	1	0
403924	89089	1	0
403925	89090	1	0
403926	89091	1	0
403927	89092	1	0
403928	89093	1	0
403929	89094	1	0
403930	89095	1	2
403931	89096	1	2
403932	89097	1	2
403933	89098	1	2
403934	89099	1	2
403935	89100	1	2
403936	89101	1	2
403937	89102	1	2
403938	89103	1	0
403939	89104	1	0
403940	89105	1	0
403941	89106	1	0
403942	89107	1	0
403943	89108	1	0
403944	89109	1	0
403945	89110	1	0
403946	89111	2	0
403947	89112	2	0
403948	89113	2	0
403949	89114	2	0
403950	89115	2	0
403951	89116	2	0
403952	89117	2	0
403953	89118	2	0
403954	89119	2	0
403955	89120	2	0
403956	89121	2	0
403957	89122	2	0
403958	89123	2	0
403959	89124	2	0
403960	89125	2	0
403961	89126	2	0
403962	89127	2	0
403963	89128	2	0
403964	89129	2	0
403965	89130	2	0
403966	89131	2	0
403967	89132	2	0
403968	89133	2	0
403969	89134	2	0
403970	89135	2	0
403971	89136	2	0
403972	89137	2	0
403973	89138	2	0
403974	89139	2	0
403975	89140	2	0
403976	89141	2	0
403977	89142	2	0
403978	89143	2	0
403979	89144	2	0
403980	89145	2	0
403981	89146	2	0
403982	89147	2	0
403983	89148	2	0
403984	89149	2	0
403985	89150	2	0
403986	89151	2	0
403987	89152	2	0
403988	89153	2	0
403989	89154	2	0
403990	89155	2	0
403991	89156	2	0
403992	89157	2	0
403993	89158	2	0
403994	89159	2	2
403995	89160	2	2
403996	89161	2	2
403997	89162	2	2
403998	89163	2	2
403999	89164	2	2
404000	89165	2	2
404001	89166	2	2
404002	89167	2	2
404003	89168	2	2
404004	89169	2	2
404005	89170	2	2
404006	89171	2	2
404007	89172	2	2
404008	89173	2	2
404009	89174	2	2
404010	89175	2	1
404011	89176	2	1
404012	89177	2	1
404013	89178	2	1
404014	89179	2	1
404015	89180	2	1
404016	89181	2	1
404017	89182	2	1
404018	89183	2	1
404019	89184	2	1
404020	89185	2	1
404021	89186	2	1
404022	89187	2	1
404023	89188	2	1
404024	89189	2	1
404025	89190	2	1
404026	89191	2	0
404027	89192	2	0
404028	89193	2	0
404029	89194	2	0
404030	89195	2	0
404031	89196	2	0
404032	89197	2	0
404033	89198	2	0
404034	89199	2	0
404035	89200	2	0
404036	89201	2	0
404037	89202	2	0
404038	89203	2	0
404039	89204	2	0
404040	89205	2	0
404041	89206	2	0
404042	89207	2	0
404043	89208	2	0
404044	89209	2	0
404045	89210	2	0
404046	89211	2	0
404047	89212	2	0
404048	89213	2	0
404049	89214	2	0
404050	89215	2	0
404051	89216	2	0
404052	89217	2	0
404053	89218	2	0
404054	89219	2	0
404055	89220	2	0
404056	89221	2	0
404057	89222	2	0
404058	89223	2	0
404059	89224	2	0
404060	89225	2	0
404061	89226	2	0
404062	89227	2	0
404063	89228	2	0
404064	89229	2	0
404065	89230	2	0
404066	89231	2	0
404067	89232	2	0
404068	89233	2	0
404069	89234	2	0
404070	89235	2	0
404071	89236	2	0
404072	89237	2	0
404073	89238	2	0
404074	89239	2	0
404075	89240	2	0
404076	89241	2	0
404077	89242	2	0
404078	89243	2	0
404079	89244	2	0
404080	89245	2	0
404081	89246	2	0
404082	89247	2	0
404083	89248	2	0
404084	89249	2	0
404085	89250	2	0
404086	89251	2	0
404087	89252	2	0
404088	89253	2	0
404089	89254	2	0
404090	89255	2	0
404091	89256	2	0
404092	89257	2	0
404093	89258	2	0
404094	89259	2	0
404095	89260	2	0
404096	89261	2	0
404097	89262	2	0
404098	89263	2	0
404099	89264	2	0
404100	89265	2	0
404101	89266	2	0
404102	89267	2	0
404103	89268	2	0
404104	89269	2	0
404105	89270	2	0
404106	89271	2	0
404107	89272	2	0
404108	89273	2	0
404109	89274	2	0
404110	89275	2	0
404111	89276	2	0
404112	89277	2	0
404113	89278	2	0
404114	89279	2	0
404115	89280	2	0
404116	89281	2	0
404117	89282	2	0
404118	89283	2	0
404119	89284	2	0
404120	89285	2	0
404121	89286	2	0
404122	89287	2	0
404123	89288	2	0
404124	89289	2	0
404125	89290	2	0
404126	89291	2	0
404127	89292	2	0
404128	89293	2	0
404129	89294	2	0
404130	89295	2	0
404131	89296	2	0
404132	89297	2	0
404133	89298	2	0
404134	89299	2	0
404135	89300	2	0
404136	89301	2	0
404137	89302	2	0
404138	89303	2	0
404139	89304	2	0
404140	89305	2	0
404141	89306	2	0
404142	89307	2	0
404143	89308	2	0
404144	89309	2	0
404145	89310	2	0
404146	89311	2	0
404147	89312	2	0
404148	89313	2	0
404149	89314	2	0
404150	89315	2	0
404151	89316	2	0
404152	89317	2	0
404153	89318	2	0
404154	89319	2	0
404155	89320	2	0
404156	89321	2	0
404157	89322	2	0
404158	89323	2	0
404159	89324	2	0
404160	89325	2	0
404161	89326	2	0
404162	89327	2	0
404163	89328	2	0
404164	89329	2	0
404165	89330	2	0
404166	89331	2	0
404167	89332	2	0
404168	89333	2	0
404169	89334	2	0
404170	89335	2	0
404171	89336	2	0
404172	89337	2	0
404173	89338	2	0
404174	89339	2	0
404175	89340	2	0
404176	89341	2	0
404177	89342	2	0
404178	89343	2	0
404179	89344	2	0
404180	89345	2	0
404181	89346	2	0
404182	89347	2	0
404183	89348	2	0
404184	89349	2	0
404185	89350	2	0
404186	89351	2	0
404187	89352	2	0
404188	89353	2	0
404189	89354	2	0
404190	89355	2	0
404191	89356	2	0
404192	89357	2	0
404193	89358	2	0
404194	89359	2	0
404195	89360	2	0
404196	89361	2	0
404197	89362	2	0
404198	89363	2	0
404199	89364	2	0
404200	89365	2	0
404201	89366	2	0
404202	89367	2	0
404203	89368	2	0
404204	89369	2	0
404205	89370	2	0
404206	89371	2	0
404207	89372	2	0
404208	89373	2	0
404209	89374	2	0
404210	89375	2	0
404211	89376	2	0
404212	89377	2	0
404213	89378	2	0
404214	89379	2	0
404215	89380	2	0
404216	89381	2	0
404217	89382	2	0
404218	89383	2	0
404219	89384	2	0
404220	89385	2	0
404221	89386	2	0
404222	89387	2	0
404223	89388	2	0
404224	89389	2	0
404225	89390	2	0
404226	89391	2	0
404227	89392	2	0
404228	89393	2	0
404229	89394	2	0
404230	89395	2	0
404231	89396	2	0
404232	89397	2	0
404233	89398	2	0
404234	89399	2	0
404235	89400	2	0
404236	89401	2	0
404237	89402	2	0
404238	89403	2	0
404239	89404	2	0
404240	89405	2	0
404241	89406	2	0
404242	89407	2	1
404243	89408	2	1
404244	89409	2	1
404245	89410	2	1
404246	89411	2	1
404247	89412	2	1
404248	89413	2	1
404249	89414	2	1
404250	89415	2	2
404251	89416	2	2
404252	89417	2	2
404253	89418	2	2
404254	89419	2	2
404255	89420	2	2
404256	89421	2	2
404257	89422	2	2
404258	89423	2	0
404259	89424	2	0
404260	89425	2	0
404261	89426	2	0
404262	89427	2	0
404263	89428	2	0
404264	89429	2	0
404265	89430	2	0
404266	89431	3	0
404267	89432	3	0
404268	89433	3	0
404269	89434	3	0
404270	89435	3	0
404271	89436	3	0
404272	89437	3	0
404273	89438	3	0
404274	89439	3	0
404275	89440	3	0
404276	89441	3	0
404277	89442	3	0
404278	89443	3	0
404279	89444	3	0
404280	89445	3	0
404281	89446	3	0
404282	89447	3	0
404283	89448	3	0
404284	89449	3	0
404285	89450	3	0
404286	89451	3	0
404287	89452	3	0
404288	89453	3	0
404289	89454	3	0
404290	89455	3	0
404291	89456	3	0
404292	89457	3	0
404293	89458	3	0
404294	89459	3	0
404295	89460	3	0
404296	89461	3	0
404297	89462	3	0
404298	89463	3	0
404299	89464	3	0
404300	89465	3	0
404301	89466	3	0
404302	89467	3	0
404303	89468	3	0
404304	89469	3	0
404305	89470	3	0
404306	89471	3	0
404307	89472	3	0
404308	89473	3	0
404309	89474	3	0
404310	89475	3	0
404311	89476	3	0
404312	89477	3	0
404313	89478	3	0
404314	89479	3	0
404315	89480	3	0
404316	89481	3	0
404317	89482	3	0
404318	89483	3	0
404319	89484	3	0
404320	89485	3	0
404321	89486	3	0
404322	89487	3	0
404323	89488	3	0
404324	89489	3	0
404325	89490	3	0
404326	89491	3	0
404327	89492	3	0
404328	89493	3	0
404329	89494	3	0
404330	89495	3	0
404331	89496	3	0
404332	89497	3	0
404333	89498	3	0
404334	89499	3	0
404335	89500	3	0
404336	89501	3	0
404337	89502	3	0
404338	89503	3	0
404339	89504	3	0
404340	89505	3	0
404341	89506	3	0
404342	89507	3	0
404343	89508	3	0
404344	89509	3	0
404345	89510	3	0
404346	89511	3	0
404347	89512	3	0
404348	89513	3	0
404349	89514	3	0
404350	89515	3	0
404351	89516	3	0
404352	89517	3	0
404353	89518	3	0
404354	89519	3	0
404355	89520	3	0
404356	89521	3	0
404357	89522	3	0
404358	89523	3	0
404359	89524	3	0
404360	89525	3	0
404361	89526	3	0
404362	89527	3	2
404363	89528	3	2
404364	89529	3	2
404365	89530	3	2
404366	89531	3	2
404367	89532	3	2
404368	89533	3	2
404369	89534	3	2
404370	89535	3	2
404371	89536	3	2
404372	89537	3	2
404373	89538	3	2
404374	89539	3	2
404375	89540	3	2
404376	89541	3	2
404377	89542	3	2
404378	89543	3	1
404379	89544	3	1
404380	89545	3	1
404381	89546	3	1
404382	89547	3	1
404383	89548	3	1
404384	89549	3	1
404385	89550	3	1
404386	89551	3	1
404387	89552	3	1
404388	89553	3	1
404389	89554	3	1
404390	89555	3	1
404391	89556	3	1
404392	89557	3	1
404393	89558	3	1
404394	89559	3	0
404395	89560	3	0
404396	89561	3	0
404397	89562	3	0
404398	89563	3	0
404399	89564	3	0
404400	89565	3	0
404401	89566	3	0
404402	89567	3	0
404403	89568	3	0
404404	89569	3	0
404405	89570	3	0
404406	89571	3	0
404407	89572	3	0
404408	89573	3	0
404409	89574	3	0
404410	89575	3	0
404411	89576	3	0
404412	89577	3	0
404413	89578	3	0
404414	89579	3	0
404415	89580	3	0
404416	89581	3	0
404417	89582	3	0
404418	89583	3	0
404419	89584	3	0
404420	89585	3	0
404421	89586	3	0
404422	89587	3	0
404423	89588	3	0
404424	89589	3	0
404425	89590	3	0
404426	89591	3	0
404427	89592	3	0
404428	89593	3	0
404429	89594	3	0
404430	89595	3	0
404431	89596	3	0
404432	89597	3	0
404433	89598	3	0
404434	89599	3	0
404435	89600	3	0
404436	89601	3	0
404437	89602	3	0
404438	89603	3	0
404439	89604	3	0
404440	89605	3	0
404441	89606	3	0
404442	89607	3	0
404443	89608	3	0
404444	89609	3	0
404445	89610	3	0
404446	89611	3	0
404447	89612	3	0
404448	89613	3	0
404449	89614	3	0
404450	89615	3	0
404451	89616	3	0
404452	89617	3	0
404453	89618	3	0
404454	89619	3	0
404455	89620	3	0
404456	89621	3	0
404457	89622	3	0
404458	89623	3	0
404459	89624	3	0
404460	89625	3	0
404461	89626	3	0
404462	89627	3	0
404463	89628	3	0
404464	89629	3	0
404465	89630	3	0
404466	89631	3	0
404467	89632	3	0
404468	89633	3	0
404469	89634	3	0
404470	89635	3	0
404471	89636	3	0
404472	89637	3	0
404473	89638	3	0
404474	89639	3	0
404475	89640	3	0
404476	89641	3	0
404477	89642	3	0
404478	89643	3	0
404479	89644	3	0
404480	89645	3	0
404481	89646	3	0
404482	89647	3	0
404483	89648	3	0
404484	89649	3	0
404485	89650	3	0
404486	89651	3	0
404487	89652	3	0
404488	89653	3	0
404489	89654	3	0
404490	89655	3	0
404491	89656	3	0
404492	89657	3	0
404493	89658	3	0
404494	89659	3	0
404495	89660	3	0
404496	89661	3	0
404497	89662	3	0
404498	89663	3	0
404499	89664	3	0
404500	89665	3	0
404501	89666	3	0
404502	89667	3	0
404503	89668	3	0
404504	89669	3	0
404505	89670	3	0
404506	89671	3	0
404507	89672	3	0
404508	89673	3	0
404509	89674	3	0
404510	89675	3	0
404511	89676	3	0
404512	89677	3	0
404513	89678	3	0
404514	89679	3	0
404515	89680	3	0
404516	89681	3	0
404517	89682	3	0
404518	89683	3	0
404519	89684	3	0
404520	89685	3	0
404521	89686	3	0
404522	89687	3	0
404523	89688	3	0
404524	89689	3	0
404525	89690	3	0
404526	89691	3	0
404527	89692	3	0
404528	89693	3	0
404529	89694	3	0
404530	89695	3	0
404531	89696	3	0
404532	89697	3	0
404533	89698	3	0
404534	89699	3	0
404535	89700	3	0
404536	89701	3	0
404537	89702	3	0
404538	89703	3	0
404539	89704	3	0
404540	89705	3	0
404541	89706	3	0
404542	89707	3	0
404543	89708	3	0
404544	89709	3	0
404545	89710	3	0
404546	89711	3	0
404547	89712	3	0
404548	89713	3	0
404549	89714	3	0
404550	89715	3	0
404551	89716	3	0
404552	89717	3	0
404553	89718	3	0
404554	89719	3	0
404555	89720	3	0
404556	89721	3	0
404557	89722	3	0
404558	89723	3	0
404559	89724	3	0
404560	89725	3	0
404561	89726	3	0
404562	89727	3	1
404563	89728	3	1
404564	89729	3	1
404565	89730	3	1
404566	89731	3	1
404567	89732	3	1
404568	89733	3	1
404569	89734	3	1
404570	89735	3	2
404571	89736	3	2
404572	89737	3	2
404573	89738	3	2
404574	89739	3	2
404575	89740	3	2
404576	89741	3	2
404577	89742	3	2
404578	89743	3	0
404579	89744	3	0
404580	89745	3	0
404581	89746	3	0
404582	89747	3	0
404583	89748	3	0
404584	89749	3	0
404585	89750	3	0
404586	89751	4	0
404587	89752	4	0
404588	89753	4	0
404589	89754	4	0
404590	89755	4	0
404591	89756	4	0
404592	89757	4	0
404593	89758	4	0
404594	89759	4	0
404595	89760	4	0
404596	89761	4	0
404597	89762	4	0
404598	89763	4	0
404599	89764	4	0
404600	89765	4	0
404601	89766	4	0
404602	89767	4	0
404603	89768	4	0
404604	89769	4	0
404605	89770	4	0
404606	89771	4	0
404607	89772	4	0
404608	89773	4	0
404609	89774	4	0
404610	89775	4	0
404611	89776	4	0
404612	89777	4	0
404613	89778	4	0
404614	89779	4	0
404615	89780	4	0
404616	89781	4	0
404617	89782	4	0
404618	89783	4	0
404619	89784	4	0
404620	89785	4	0
404621	89786	4	0
404622	89787	4	0
404623	89788	4	0
404624	89789	4	0
404625	89790	4	0
404626	89791	4	0
404627	89792	4	0
404628	89793	4	0
404629	89794	4	0
404630	89795	4	0
404631	89796	4	0
404632	89797	4	0
404633	89798	4	0
404634	89799	4	1
404635	89800	4	1
404636	89801	4	1
404637	89802	4	1
404638	89803	4	1
404639	89804	4	1
404640	89805	4	1
404641	89806	4	1
404642	89807	4	1
404643	89808	4	1
404644	89809	4	1
404645	89810	4	1
404646	89811	4	1
404647	89812	4	1
404648	89813	4	1
404649	89814	4	1
404650	89815	4	0
404651	89816	4	0
404652	89817	4	0
404653	89818	4	0
404654	89819	4	0
404655	89820	4	0
404656	89821	4	0
404657	89822	4	0
404658	89823	4	0
404659	89824	4	0
404660	89825	4	0
404661	89826	4	0
404662	89827	4	0
404663	89828	4	0
404664	89829	4	0
404665	89830	4	0
404666	89831	4	0
404667	89832	4	0
404668	89833	4	0
404669	89834	4	0
404670	89835	4	0
404671	89836	4	0
404672	89837	4	0
404673	89838	4	0
404674	89839	4	0
404675	89840	4	0
404676	89841	4	0
404677	89842	4	0
404678	89843	4	0
404679	89844	4	0
404680	89845	4	0
404681	89846	4	0
404682	89847	4	0
404683	89848	4	0
404684	89849	4	0
404685	89850	4	0
404686	89851	4	0
404687	89852	4	0
404688	89853	4	0
404689	89854	4	0
404690	89855	4	0
404691	89856	4	0
404692	89857	4	0
404693	89858	4	0
404694	89859	4	0
404695	89860	4	0
404696	89861	4	0
404697	89862	4	0
404698	89863	4	0
404699	89864	4	0
404700	89865	4	0
404701	89866	4	0
404702	89867	4	0
404703	89868	4	0
404704	89869	4	0
404705	89870	4	0
404706	89871	4	0
404707	89872	4	0
404708	89873	4	0
404709	89874	4	0
404710	89875	4	0
404711	89876	4	0
404712	89877	4	0
404713	89878	4	0
404714	89879	4	0
404715	89880	4	0
404716	89881	4	0
404717	89882	4	0
404718	89883	4	0
404719	89884	4	0
404720	89885	4	0
404721	89886	4	0
404722	89887	4	0
404723	89888	4	0
404724	89889	4	0
404725	89890	4	0
404726	89891	4	0
404727	89892	4	0
404728	89893	4	0
404729	89894	4	0
404730	89895	4	0
404731	89896	4	0
404732	89897	4	0
404733	89898	4	0
404734	89899	4	0
404735	89900	4	0
404736	89901	4	0
404737	89902	4	0
404738	89903	4	0
404739	89904	4	0
404740	89905	4	0
404741	89906	4	0
404742	89907	4	0
404743	89908	4	0
404744	89909	4	0
404745	89910	4	0
404746	89911	4	0
404747	89912	4	0
404748	89913	4	0
404749	89914	4	0
404750	89915	4	0
404751	89916	4	0
404752	89917	4	0
404753	89918	4	0
404754	89919	4	0
404755	89920	4	0
404756	89921	4	0
404757	89922	4	0
404758	89923	4	0
404759	89924	4	0
404760	89925	4	0
404761	89926	4	0
404762	89927	4	0
404763	89928	4	0
404764	89929	4	0
404765	89930	4	0
404766	89931	4	0
404767	89932	4	0
404768	89933	4	0
404769	89934	4	0
404770	89935	4	0
404771	89936	4	0
404772	89937	4	0
404773	89938	4	0
404774	89939	4	0
404775	89940	4	0
404776	89941	4	0
404777	89942	4	0
404778	89943	4	0
404779	89944	4	0
404780	89945	4	0
404781	89946	4	0
404782	89947	4	0
404783	89948	4	0
404784	89949	4	0
404785	89950	4	0
404786	89951	4	0
404787	89952	4	0
404788	89953	4	0
404789	89954	4	0
404790	89955	4	0
404791	89956	4	0
404792	89957	4	0
404793	89958	4	0
404794	89959	4	0
404795	89960	4	0
404796	89961	4	0
404797	89962	4	0
404798	89963	4	0
404799	89964	4	0
404800	89965	4	0
404801	89966	4	0
404802	89967	4	0
404803	89968	4	0
404804	89969	4	0
404805	89970	4	0
404806	89971	4	0
404807	89972	4	0
404808	89973	4	0
404809	89974	4	0
404810	89975	4	0
404811	89976	4	0
404812	89977	4	0
404813	89978	4	0
404814	89979	4	0
404815	89980	4	0
404816	89981	4	0
404817	89982	4	0
404818	89983	4	0
404819	89984	4	0
404820	89985	4	0
404821	89986	4	0
404822	89987	4	0
404823	89988	4	0
404824	89989	4	0
404825	89990	4	0
404826	89991	4	0
404827	89992	4	0
404828	89993	4	0
404829	89994	4	0
404830	89995	4	0
404831	89996	4	0
404832	89997	4	0
404833	89998	4	0
404834	89999	4	0
404835	90000	4	0
404836	90001	4	0
404837	90002	4	0
404838	90003	4	0
404839	90004	4	0
404840	90005	4	0
404841	90006	4	0
404842	90007	4	0
404843	90008	4	0
404844	90009	4	0
404845	90010	4	0
404846	90011	4	0
404847	90012	4	0
404848	90013	4	0
404849	90014	4	0
404850	90015	4	2
404851	90016	4	2
404852	90017	4	2
404853	90018	4	2
404854	90019	4	2
404855	90020	4	2
404856	90021	4	2
404857	90022	4	2
404858	90023	4	2
404859	90024	4	2
404860	90025	4	2
404861	90026	4	2
404862	90027	4	2
404863	90028	4	2
404864	90029	4	2
404865	90030	4	2
404866	90031	4	0
404867	90032	4	0
404868	90033	4	0
404869	90034	4	0
404870	90035	4	0
404871	90036	4	0
404872	90037	4	0
404873	90038	4	0
404874	90039	5	0
404875	90040	5	0
404876	90041	5	0
404877	90042	5	0
404878	90043	5	0
404879	90044	5	0
404880	90045	5	0
404881	90046	5	0
404882	90047	5	0
404883	90048	5	0
404884	90049	5	0
404885	90050	5	0
404886	90051	5	0
404887	90052	5	0
404888	90053	5	0
404889	90054	5	0
404890	90055	5	0
404891	90056	5	0
404892	90057	5	0
404893	90058	5	0
404894	90059	5	0
404895	90060	5	0
404896	90061	5	0
404897	90062	5	0
404898	90063	5	0
404899	90064	5	0
404900	90065	5	0
404901	90066	5	0
404902	90067	5	0
404903	90068	5	0
404904	90069	5	0
404905	90070	5	0
404906	90071	5	0
404907	90072	5	0
404908	90073	5	0
404909	90074	5	0
404910	90075	5	0
404911	90076	5	0
404912	90077	5	0
404913	90078	5	0
404914	90079	5	0
404915	90080	5	0
404916	90081	5	0
404917	90082	5	0
404918	90083	5	0
404919	90084	5	0
404920	90085	5	0
404921	90086	5	0
404922	90087	5	0
404923	90088	5	0
404924	90089	5	0
404925	90090	5	0
404926	90091	5	0
404927	90092	5	0
404928	90093	5	0
404929	90094	5	0
404930	90095	5	0
404931	90096	5	0
404932	90097	5	0
404933	90098	5	0
404934	90099	5	0
404935	90100	5	0
404936	90101	5	0
404937	90102	5	0
404938	90103	5	0
404939	90104	5	0
404940	90105	5	0
404941	90106	5	0
404942	90107	5	0
404943	90108	5	0
404944	90109	5	0
404945	90110	5	0
404946	90111	5	0
404947	90112	5	0
404948	90113	5	0
404949	90114	5	0
404950	90115	5	0
404951	90116	5	0
404952	90117	5	0
404953	90118	5	0
404954	90119	5	0
404955	90120	5	0
404956	90121	5	0
404957	90122	5	0
404958	90123	5	0
404959	90124	5	0
404960	90125	5	0
404961	90126	5	0
404962	90127	5	0
404963	90128	5	0
404964	90129	5	0
404965	90130	5	0
404966	90131	5	0
404967	90132	5	0
404968	90133	5	0
404969	90134	5	0
404970	90135	5	0
404971	90136	5	0
404972	90137	5	0
404973	90138	5	0
404974	90139	5	0
404975	90140	5	0
404976	90141	5	0
404977	90142	5	0
404978	90143	5	0
404979	90144	5	0
404980	90145	5	0
404981	90146	5	0
404982	90147	5	0
404983	90148	5	0
404984	90149	5	0
404985	90150	5	0
404986	90151	5	0
404987	90152	5	0
404988	90153	5	0
404989	90154	5	0
404990	90155	5	0
404991	90156	5	0
404992	90157	5	0
404993	90158	5	0
404994	90159	5	0
404995	90160	5	0
404996	90161	5	0
404997	90162	5	0
404998	90163	5	0
404999	90164	5	0
405000	90165	5	0
405001	90166	5	0
405002	90167	5	0
405003	90168	5	0
405004	90169	5	0
405005	90170	5	0
405006	90171	5	0
405007	90172	5	0
405008	90173	5	0
405009	90174	5	0
405010	90175	5	0
405011	90176	5	0
405012	90177	5	0
405013	90178	5	0
405014	90179	5	0
405015	90180	5	0
405016	90181	5	0
405017	90182	5	0
405018	90183	5	0
405019	90184	5	0
405020	90185	5	0
405021	90186	5	0
405022	90187	5	0
405023	90188	5	0
405024	90189	5	0
405025	90190	5	0
405026	90191	5	0
405027	90192	5	0
405028	90193	5	0
405029	90194	5	0
405030	90195	5	0
405031	90196	5	0
405032	90197	5	0
405033	90198	5	0
405034	90199	5	0
405035	90200	5	0
405036	90201	5	0
405037	90202	5	0
405038	90203	5	0
405039	90204	5	0
405040	90205	5	0
405041	90206	5	0
405042	90207	5	0
405043	90208	5	0
405044	90209	5	0
405045	90210	5	0
405046	90211	5	0
405047	90212	5	0
405048	90213	5	0
405049	90214	5	0
405050	90215	5	0
405051	90216	5	0
405052	90217	5	0
405053	90218	5	0
405054	90219	5	0
405055	90220	5	0
405056	90221	5	0
405057	90222	5	0
405058	90223	5	0
405059	90224	5	0
405060	90225	5	0
405061	90226	5	0
405062	90227	5	0
405063	90228	5	0
405064	90229	5	0
405065	90230	5	0
405066	90231	5	0
405067	90232	5	0
405068	90233	5	0
405069	90234	5	0
405070	90235	5	0
405071	90236	5	0
405072	90237	5	0
405073	90238	5	0
405074	90239	5	0
405075	90240	5	0
405076	90241	5	0
405077	90242	5	0
405078	90243	5	0
405079	90244	5	0
405080	90245	5	0
405081	90246	5	0
405082	90247	5	2
405083	90248	5	2
405084	90249	5	2
405085	90250	5	2
405086	90251	5	2
405087	90252	5	2
405088	90253	5	2
405089	90254	5	2
405090	90255	5	2
405091	90256	5	2
405092	90257	5	2
405093	90258	5	2
405094	90259	5	2
405095	90260	5	2
405096	90261	5	2
405097	90262	5	2
405098	90263	5	0
405099	90264	5	0
405100	90265	5	0
405101	90266	5	0
405102	90267	5	0
405103	90268	5	0
405104	90269	5	0
405105	90270	5	0
405106	90271	5	0
405107	90272	5	0
405108	90273	5	0
405109	90274	5	0
405110	90275	5	0
405111	90276	5	0
405112	90277	5	0
405113	90278	5	0
405114	90279	5	0
405115	90280	5	0
405116	90281	5	0
405117	90282	5	0
405118	90283	5	0
405119	90284	5	0
405120	90285	5	0
405121	90286	5	0
405122	90287	5	0
405123	90288	5	0
405124	90289	5	0
405125	90290	5	0
405126	90291	5	0
405127	90292	5	0
405128	90293	5	0
405129	90294	5	0
405130	90295	5	0
405131	90296	5	0
405132	90297	5	0
405133	90298	5	0
405134	90299	5	0
405135	90300	5	0
405136	90301	5	0
405137	90302	5	0
405138	90303	5	1
405139	90304	5	1
405140	90305	5	1
405141	90306	5	1
405142	90307	5	1
405143	90308	5	1
405144	90309	5	1
405145	90310	5	1
405146	90311	5	1
405147	90312	5	1
405148	90313	5	1
405149	90314	5	1
405150	90315	5	1
405151	90316	5	1
405152	90317	5	1
405153	90318	5	1
405154	90319	5	0
405155	90320	5	0
405156	90321	5	0
405157	90322	5	0
405158	90323	5	0
405159	90324	5	0
405160	90325	5	0
405161	90326	5	0
405162	90327	6	0
405163	90328	6	0
405164	90329	6	0
405165	90330	6	0
405166	90331	6	0
405167	90332	6	0
405168	90333	6	0
405169	90334	6	0
405170	90335	6	0
405171	90336	6	0
405172	90337	6	0
405173	90338	6	0
405174	90339	6	0
405175	90340	6	0
405176	90341	6	0
405177	90342	6	0
405178	90343	6	0
405179	90344	6	0
405180	90345	6	0
405181	90346	6	0
405182	90347	6	0
405183	90348	6	0
405184	90349	6	0
405185	90350	6	0
405186	90351	6	0
405187	90352	6	0
405188	90353	6	0
405189	90354	6	0
405190	90355	6	0
405191	90356	6	0
405192	90357	6	0
405193	90358	6	0
405194	90359	6	0
405195	90360	6	0
405196	90361	6	0
405197	90362	6	0
405198	90363	6	0
405199	90364	6	0
405200	90365	6	0
405201	90366	6	0
405202	90367	6	0
405203	90368	6	0
405204	90369	6	0
405205	90370	6	0
405206	90371	6	0
405207	90372	6	0
405208	90373	6	0
405209	90374	6	0
405210	90375	6	0
405211	90376	6	0
405212	90377	6	0
405213	90378	6	0
405214	90379	6	0
405215	90380	6	0
405216	90381	6	0
405217	90382	6	0
405218	90383	6	0
405219	90384	6	0
405220	90385	6	0
405221	90386	6	0
405222	90387	6	0
405223	90388	6	0
405224	90389	6	0
405225	90390	6	0
405226	90391	6	0
405227	90392	6	0
405228	90393	6	0
405229	90394	6	0
405230	90395	6	0
405231	90396	6	0
405232	90397	6	0
405233	90398	6	0
405234	90399	6	0
405235	90400	6	0
405236	90401	6	0
405237	90402	6	0
405238	90403	6	0
405239	90404	6	0
405240	90405	6	0
405241	90406	6	0
405242	90407	6	0
405243	90408	6	0
405244	90409	6	0
405245	90410	6	0
405246	90411	6	0
405247	90412	6	0
405248	90413	6	0
405249	90414	6	0
405250	90415	6	0
405251	90416	6	0
405252	90417	6	0
405253	90418	6	0
405254	90419	6	0
405255	90420	6	0
405256	90421	6	0
405257	90422	6	0
405258	90423	6	0
405259	90424	6	0
405260	90425	6	0
405261	90426	6	0
405262	90427	6	0
405263	90428	6	0
405264	90429	6	0
405265	90430	6	0
405266	90431	6	0
405267	90432	6	0
405268	90433	6	0
405269	90434	6	0
405270	90435	6	0
405271	90436	6	0
405272	90437	6	0
405273	90438	6	0
405274	90439	6	0
405275	90440	6	0
405276	90441	6	0
405277	90442	6	0
405278	90443	6	0
405279	90444	6	0
405280	90445	6	0
405281	90446	6	0
405282	90447	6	0
405283	90448	6	0
405284	90449	6	0
405285	90450	6	0
405286	90451	6	0
405287	90452	6	0
405288	90453	6	0
405289	90454	6	0
405290	90455	6	0
405291	90456	6	0
405292	90457	6	0
405293	90458	6	0
405294	90459	6	0
405295	90460	6	0
405296	90461	6	0
405297	90462	6	0
405298	90463	6	0
405299	90464	6	0
405300	90465	6	0
405301	90466	6	0
405302	90467	6	0
405303	90468	6	0
405304	90469	6	0
405305	90470	6	0
405306	90471	6	0
405307	90472	6	0
405308	90473	6	0
405309	90474	6	0
405310	90475	6	0
405311	90476	6	0
405312	90477	6	0
405313	90478	6	0
405314	90479	6	0
405315	90480	6	0
405316	90481	6	0
405317	90482	6	0
405318	90483	6	0
405319	90484	6	0
405320	90485	6	0
405321	90486	6	0
405322	90487	6	0
405323	90488	6	0
405324	90489	6	0
405325	90490	6	0
405326	90491	6	0
405327	90492	6	0
405328	90493	6	0
405329	90494	6	0
405330	90495	6	0
405331	90496	6	0
405332	90497	6	0
405333	90498	6	0
405334	90499	6	0
405335	90500	6	0
405336	90501	6	0
405337	90502	6	0
405338	90503	6	0
405339	90504	6	0
405340	90505	6	0
405341	90506	6	0
405342	90507	6	0
405343	90508	6	0
405344	90509	6	0
405345	90510	6	0
405346	90511	6	0
405347	90512	6	0
405348	90513	6	0
405349	90514	6	0
405350	90515	6	0
405351	90516	6	0
405352	90517	6	0
405353	90518	6	0
405354	90519	6	0
405355	90520	6	0
405356	90521	6	0
405357	90522	6	0
405358	90523	6	0
405359	90524	6	0
405360	90525	6	0
405361	90526	6	0
405362	90527	6	0
405363	90528	6	0
405364	90529	6	0
405365	90530	6	0
405366	90531	6	0
405367	90532	6	0
405368	90533	6	0
405369	90534	6	0
405370	90535	6	0
405371	90536	6	0
405372	90537	6	0
405373	90538	6	0
405374	90539	6	0
405375	90540	6	0
405376	90541	6	0
405377	90542	6	0
405378	90543	6	0
405379	90544	6	0
405380	90545	6	0
405381	90546	6	0
405382	90547	7	0
405383	90548	7	0
405384	90549	7	0
405385	90550	7	0
405386	90551	7	0
405387	90552	7	0
405388	90553	7	0
405389	90554	7	0
405390	90555	7	0
405391	90556	7	0
405392	90557	7	0
405393	90558	7	0
405394	90559	7	0
405395	90560	7	0
405396	90561	7	0
405397	90562	7	0
405398	90563	7	0
405399	90564	7	0
405400	90565	7	0
405401	90566	7	0
405402	90567	7	0
405403	90568	7	0
405404	90569	7	0
405405	90570	7	0
405406	90571	7	0
405407	90572	7	0
405408	90573	7	0
405409	90574	7	0
405410	90575	7	0
405411	90576	7	0
405412	90577	7	0
405413	90578	7	0
405414	90579	7	0
405415	90580	7	0
405416	90581	7	0
405417	90582	7	0
405418	90583	7	0
405419	90584	7	0
405420	90585	7	0
405421	90586	7	0
405422	90587	7	0
405423	90588	7	0
405424	90589	7	0
405425	90590	7	0
405426	90591	7	0
405427	90592	7	0
405428	90593	7	0
405429	90594	7	0
405430	90595	7	0
405431	90596	7	0
405432	90597	7	0
405433	90598	7	0
405434	90599	7	0
405435	90600	7	0
405436	90601	7	0
405437	90602	7	0
405438	90603	7	0
405439	90604	7	0
405440	90605	7	0
405441	90606	7	0
405442	90607	7	0
405443	90608	7	0
405444	90609	7	0
405445	90610	7	0
405446	90611	7	0
405447	90612	7	0
405448	90613	7	0
405449	90614	7	0
405450	90615	7	0
405451	90616	7	0
405452	90617	7	0
405453	90618	7	0
405454	90619	7	0
405455	90620	7	0
405456	90621	7	0
405457	90622	7	0
405458	90623	7	0
405459	90624	7	0
405460	90625	7	0
405461	90626	7	0
405462	90627	7	0
405463	90628	7	0
405464	90629	7	0
405465	90630	7	0
405466	90631	7	0
405467	90632	7	0
405468	90633	7	0
405469	90634	7	0
405470	90635	7	0
405471	90636	7	0
405472	90637	7	0
405473	90638	7	0
405474	90639	7	0
405475	90640	7	0
405476	90641	7	0
405477	90642	7	0
405478	90643	7	0
405479	90644	7	0
405480	90645	7	0
405481	90646	7	0
405482	90647	7	0
405483	90648	7	0
405484	90649	7	0
405485	90650	7	0
405486	90651	7	0
405487	90652	7	0
405488	90653	7	0
405489	90654	7	0
405490	90655	7	0
405491	90656	7	0
405492	90657	7	0
405493	90658	7	0
405494	90659	7	0
405495	90660	7	0
405496	90661	7	0
405497	90662	7	0
405498	90663	7	0
405499	90664	7	0
405500	90665	7	0
405501	90666	7	0
405502	90667	7	0
405503	90668	7	0
405504	90669	7	0
405505	90670	7	0
405506	90671	7	0
405507	90672	7	0
405508	90673	7	0
405509	90674	7	0
405510	90675	7	0
405511	90676	7	0
405512	90677	7	0
405513	90678	7	0
405514	90679	7	0
405515	90680	7	0
405516	90681	7	0
405517	90682	7	0
405518	90683	7	0
405519	90684	7	0
405520	90685	7	0
405521	90686	7	0
405522	90687	7	0
405523	90688	7	0
405524	90689	7	0
405525	90690	7	0
405526	90691	7	0
405527	90692	7	0
405528	90693	7	0
405529	90694	7	0
405530	90695	7	0
405531	90696	7	0
405532	90697	7	0
405533	90698	7	0
405534	90699	7	0
405535	90700	7	0
405536	90701	7	0
405537	90702	7	0
405538	90703	7	0
405539	90704	7	0
405540	90705	7	0
405541	90706	7	0
405542	90707	7	0
405543	90708	7	0
405544	90709	7	0
405545	90710	7	0
405546	90711	7	0
405547	90712	7	0
405548	90713	7	0
405549	90714	7	0
405550	90715	7	0
405551	90716	7	0
405552	90717	7	0
405553	90718	7	0
405554	90719	7	0
405555	90720	7	0
405556	90721	7	0
405557	90722	7	0
405558	90723	7	0
405559	90724	7	0
405560	90725	7	0
405561	90726	7	0
405562	90727	7	0
405563	90728	7	0
405564	90729	7	0
405565	90730	7	0
405566	90731	7	0
405567	90732	7	0
405568	90733	7	0
405569	90734	7	0
405570	90735	7	0
405571	90736	7	0
405572	90737	7	0
405573	90738	7	0
405574	90739	7	0
405575	90740	7	0
405576	90741	7	0
405577	90742	7	0
405578	90743	7	0
405579	90744	7	0
405580	90745	7	0
405581	90746	7	0
405582	90747	7	0
405583	90748	7	0
405584	90749	7	0
405585	90750	7	0
405586	90751	7	0
405587	90752	7	0
405588	90753	7	0
405589	90754	7	0
405590	90755	7	0
405591	90756	7	0
405592	90757	7	0
405593	90758	7	0
405594	90759	7	0
405595	90760	7	0
405596	90761	7	0
405597	90762	7	0
405598	90763	7	0
405599	90764	7	0
405600	90765	7	0
405601	90766	7	0
405602	90767	8	0
405603	90768	8	0
405604	90769	8	0
405605	90770	8	0
405606	90771	8	0
405607	90772	8	0
405608	90773	8	0
405609	90774	8	0
405610	90775	8	0
405611	90776	8	0
405612	90777	8	0
405613	90778	8	0
405614	90779	8	0
405615	90780	8	0
405616	90781	8	0
405617	90782	8	0
405618	90783	8	0
405619	90784	8	0
405620	90785	8	0
405621	90786	8	0
405622	90787	8	0
405623	90788	8	0
405624	90789	8	0
405625	90790	8	0
405626	90791	8	0
405627	90792	8	0
405628	90793	8	0
405629	90794	8	0
405630	90795	8	0
405631	90796	8	0
405632	90797	8	0
405633	90798	8	0
405634	90799	8	0
405635	90800	8	0
405636	90801	8	0
405637	90802	8	0
405638	90803	8	0
405639	90804	8	0
405640	90805	8	0
405641	90806	8	0
405642	90807	8	0
405643	90808	8	0
405644	90809	8	0
405645	90810	8	0
405646	90811	8	0
405647	90812	8	0
405648	90813	8	0
405649	90814	8	0
405650	90815	8	0
405651	90816	8	0
405652	90817	8	0
405653	90818	8	0
405654	90819	8	0
405655	90820	8	0
405656	90821	8	0
405657	90822	8	0
405658	90823	8	0
405659	90824	8	0
405660	90825	8	0
405661	90826	8	0
405662	90827	8	0
405663	90828	8	0
405664	90829	8	0
405665	90830	8	0
405666	90831	8	0
405667	90832	8	0
405668	90833	8	0
405669	90834	8	0
405670	90835	8	0
405671	90836	8	0
405672	90837	8	0
405673	90838	8	0
405674	90839	8	0
405675	90840	8	0
405676	90841	8	0
405677	90842	8	0
405678	90843	8	0
405679	90844	8	0
405680	90845	8	0
405681	90846	8	0
405682	90847	8	0
405683	90848	8	0
405684	90849	8	0
405685	90850	8	0
405686	90851	8	0
405687	90852	8	0
405688	90853	8	0
405689	90854	8	0
405690	90855	8	0
405691	90856	8	0
405692	90857	8	0
405693	90858	8	0
405694	90859	8	0
405695	90860	8	0
405696	90861	8	0
405697	90862	8	0
405698	90863	8	0
405699	90864	8	0
405700	90865	8	0
405701	90866	8	0
405702	90867	8	0
405703	90868	8	0
405704	90869	8	0
405705	90870	8	0
405706	90871	8	0
405707	90872	8	0
405708	90873	8	0
405709	90874	8	0
405710	90875	8	0
405711	90876	8	0
405712	90877	8	0
405713	90878	8	0
405714	90879	8	0
405715	90880	8	0
405716	90881	8	0
405717	90882	8	0
405718	90883	8	0
405719	90884	8	0
405720	90885	8	0
405721	90886	8	0
405722	90887	8	0
405723	90888	8	0
405724	90889	8	0
405725	90890	8	0
405726	90891	8	0
405727	90892	8	0
405728	90893	8	0
405729	90894	8	0
405730	90895	8	0
405731	90896	8	0
405732	90897	8	0
405733	90898	8	0
405734	90899	8	0
405735	90900	8	0
405736	90901	8	0
405737	90902	8	0
405738	90903	8	0
405739	90904	8	0
405740	90905	8	0
405741	90906	8	0
405742	90907	8	0
405743	90908	8	0
405744	90909	8	0
405745	90910	8	0
405746	90911	8	0
405747	90912	8	0
405748	90913	8	0
405749	90914	8	0
405750	90915	8	0
405751	90916	8	0
405752	90917	8	0
405753	90918	8	0
405754	90919	8	0
405755	90920	8	0
405756	90921	8	0
405757	90922	8	0
405758	90923	8	0
405759	90924	8	0
405760	90925	8	0
405761	90926	8	0
405762	90927	8	0
405763	90928	8	0
405764	90929	8	0
405765	90930	8	0
405766	90931	8	0
405767	90932	8	0
405768	90933	8	0
405769	90934	8	0
405770	90935	8	0
405771	90936	8	0
405772	90937	8	0
405773	90938	8	0
405774	90939	8	0
405775	90940	8	0
405776	90941	8	0
405777	90942	8	0
405778	90943	8	0
405779	90944	8	0
405780	90945	8	0
405781	90946	8	0
405782	90947	8	0
405783	90948	8	0
405784	90949	8	0
405785	90950	8	0
405786	90951	8	0
405787	90952	8	0
405788	90953	8	0
405789	90954	8	0
405790	90955	8	0
405791	90956	8	0
405792	90957	8	0
405793	90958	8	0
405794	90959	8	0
405795	90960	8	0
405796	90961	8	0
405797	90962	8	0
405798	90963	8	0
405799	90964	8	0
405800	90965	8	0
405801	90966	8	0
405802	90967	8	0
405803	90968	8	0
405804	90969	8	0
405805	90970	8	0
405806	90971	8	0
405807	90972	8	0
405808	90973	8	0
405809	90974	8	0
405810	90975	8	0
405811	90976	8	0
405812	90977	8	0
405813	90978	8	0
405814	90979	8	0
405815	90980	8	0
405816	90981	8	0
405817	90982	8	0
405818	90983	8	0
405819	90984	8	0
405820	90985	8	0
405821	90986	8	0
405822	90987	8	0
405823	90988	8	0
405824	90989	8	0
405825	90990	8	0
405826	90991	8	0
405827	90992	8	0
405828	90993	8	0
405829	90994	8	0
405830	90995	8	0
405831	90996	8	0
405832	90997	8	0
405833	90998	8	0
405834	90999	8	0
405835	91000	8	0
405836	91001	8	0
405837	91002	8	0
405838	91003	8	0
405839	91004	8	0
405840	91005	8	0
405841	91006	8	0
405842	91007	8	0
405843	91008	8	0
405844	91009	8	0
405845	91010	8	0
405846	91011	8	0
405847	91012	8	0
405848	91013	8	0
405849	91014	8	0
405850	91015	8	0
405851	91016	8	0
405852	91017	8	0
405853	91018	8	0
405854	91019	8	0
405855	91020	8	0
405856	91021	8	0
405857	91022	8	0
405858	91023	8	0
405859	91024	8	0
405860	91025	8	0
405861	91026	8	0
405862	91027	8	0
405863	91028	8	0
405864	91029	8	0
405865	91030	8	0
405866	91031	8	0
405867	91032	8	0
405868	91033	8	0
405869	91034	8	0
405870	91035	8	0
405871	91036	8	0
405872	91037	8	0
405873	91038	8	0
405874	91039	8	0
405875	91040	8	0
405876	91041	8	0
405877	91042	8	0
405878	91043	8	0
405879	91044	8	0
405880	91045	8	0
405881	91046	8	0
405882	91047	8	0
405883	91048	8	0
405884	91049	8	0
405885	91050	8	0
405886	91051	8	0
405887	91052	8	0
405888	91053	8	0
405889	91054	8	0
405890	91055	8	0
405891	91056	8	0
405892	91057	8	0
405893	91058	8	0
405894	91059	8	0
405895	91060	8	0
405896	91061	8	0
405897	91062	8	0
405898	91063	8	0
405899	91064	8	0
405900	91065	8	0
405901	91066	8	0
405902	91067	8	0
405903	91068	8	0
405904	91069	8	0
405905	91070	8	0
405906	91071	8	0
405907	91072	8	0
405908	91073	8	0
405909	91074	8	0
405910	91075	8	0
405911	91076	8	0
405912	91077	8	0
405913	91078	8	0
405914	91079	8	0
405915	91080	8	0
405916	91081	8	0
405917	91082	8	0
405918	91083	8	0
405919	91084	8	0
405920	91085	8	0
405921	91086	8	0
405922	91087	8	0
405923	91088	8	0
405924	91089	8	0
405925	91090	8	0
405926	91091	8	0
405927	91092	8	0
405928	91093	8	0
405929	91094	8	0
405930	91095	8	0
405931	91096	8	0
405932	91097	8	0
405933	91098	8	0
405934	91099	8	0
405935	91100	8	0
405936	91101	8	0
405937	91102	8	0
405938	91103	8	0
405939	91104	8	0
405940	91105	8	0
405941	91106	8	0
405942	91107	8	0
405943	91108	8	0
405944	91109	8	0
405945	91110	8	0
405946	91111	8	0
405947	91112	8	0
405948	91113	8	0
405949	91114	8	0
405950	91115	8	0
405951	91116	8	0
405952	91117	8	0
405953	91118	8	0
405954	91119	8	0
405955	91120	8	0
405956	91121	8	0
405957	91122	8	0
405958	91123	8	0
405959	91124	8	0
405960	91125	8	0
405961	91126	8	0
405962	91127	8	0
405963	91128	8	0
405964	91129	8	0
405965	91130	8	0
405966	91131	8	0
405967	91132	8	0
405968	91133	8	0
405969	91134	8	0
405970	91135	9	0
405971	91136	9	0
405972	91137	9	0
405973	91138	9	0
405974	91139	9	0
405975	91140	9	0
405976	91141	9	0
405977	91142	9	0
405978	91143	9	0
405979	91144	9	0
405980	91145	9	0
405981	91146	9	0
405982	91147	9	0
405983	91148	9	0
405984	91149	9	0
405985	91150	9	0
405986	91151	9	0
405987	91152	9	0
405988	91153	9	0
405989	91154	9	0
405990	91155	9	0
405991	91156	9	0
405992	91157	9	0
405993	91158	9	0
405994	91159	9	0
405995	91160	9	0
405996	91161	9	0
405997	91162	9	0
405998	91163	9	0
405999	91164	9	0
406000	91165	9	0
406001	91166	9	0
406002	91167	9	0
406003	91168	9	0
406004	91169	9	0
406005	91170	9	0
406006	91171	9	0
406007	91172	9	0
406008	91173	9	0
406009	91174	9	0
406010	91175	9	0
406011	91176	9	0
406012	91177	9	0
406013	91178	9	0
406014	91179	9	0
406015	91180	9	0
406016	91181	9	0
406017	91182	9	0
406018	91183	9	0
406019	91184	9	0
406020	91185	9	0
406021	91186	9	0
406022	91187	9	0
406023	91188	9	0
406024	91189	9	0
406025	91190	9	0
406026	91191	9	0
406027	91192	9	0
406028	91193	9	0
406029	91194	9	0
406030	91195	9	0
406031	91196	9	0
406032	91197	9	0
406033	91198	9	0
406034	91199	9	0
406035	91200	9	0
406036	91201	9	0
406037	91202	9	0
406038	91203	9	0
406039	91204	9	0
406040	91205	9	0
406041	91206	9	0
406042	91207	9	0
406043	91208	9	0
406044	91209	9	0
406045	91210	9	0
406046	91211	9	0
406047	91212	9	0
406048	91213	9	0
406049	91214	9	0
406050	91215	9	0
406051	91216	9	0
406052	91217	9	0
406053	91218	9	0
406054	91219	9	0
406055	91220	9	0
406056	91221	9	0
406057	91222	9	0
406058	91223	9	0
406059	91224	9	0
406060	91225	9	0
406061	91226	9	0
406062	91227	9	0
406063	91228	9	0
406064	91229	9	0
406065	91230	9	0
406066	91231	9	0
406067	91232	9	0
406068	91233	9	0
406069	91234	9	0
406070	91235	9	0
406071	91236	9	0
406072	91237	9	0
406073	91238	9	0
406074	91239	9	0
406075	91240	9	0
406076	91241	9	0
406077	91242	9	0
406078	91243	9	0
406079	91244	9	0
406080	91245	9	0
406081	91246	9	0
406082	91247	9	0
406083	91248	9	0
406084	91249	9	0
406085	91250	9	0
406086	91251	9	0
406087	91252	9	0
406088	91253	9	0
406089	91254	9	0
406090	91255	9	0
406091	91256	9	0
406092	91257	9	0
406093	91258	9	0
406094	91259	9	0
406095	91260	9	0
406096	91261	9	0
406097	91262	9	0
406098	91263	9	0
406099	91264	9	0
406100	91265	9	0
406101	91266	9	0
406102	91267	9	0
406103	91268	9	0
406104	91269	9	0
406105	91270	9	0
406106	91271	9	0
406107	91272	9	0
406108	91273	9	0
406109	91274	9	0
406110	91275	9	0
406111	91276	9	0
406112	91277	9	0
406113	91278	9	0
406114	91279	9	0
406115	91280	9	0
406116	91281	9	0
406117	91282	9	0
406118	91283	9	0
406119	91284	9	0
406120	91285	9	0
406121	91286	9	0
406122	91287	9	0
406123	91288	9	0
406124	91289	9	0
406125	91290	9	0
406126	91291	9	0
406127	91292	9	0
406128	91293	9	0
406129	91294	9	0
406130	91295	9	0
406131	91296	9	0
406132	91297	9	0
406133	91298	9	0
406134	91299	9	0
406135	91300	9	0
406136	91301	9	0
406137	91302	9	0
406138	91303	9	0
406139	91304	9	0
406140	91305	9	0
406141	91306	9	0
406142	91307	9	0
406143	91308	9	0
406144	91309	9	0
406145	91310	9	0
406146	91311	9	0
406147	91312	9	0
406148	91313	9	0
406149	91314	9	0
406150	91315	9	0
406151	91316	9	0
406152	91317	9	0
406153	91318	9	0
406154	91319	9	0
406155	91320	9	0
406156	91321	9	0
406157	91322	9	0
406158	91323	9	0
406159	91324	9	0
406160	91325	9	0
406161	91326	9	0
406162	91327	9	0
406163	91328	9	0
406164	91329	9	0
406165	91330	9	0
406166	91331	9	0
406167	91332	9	0
406168	91333	9	0
406169	91334	9	0
406170	91335	9	0
406171	91336	9	0
406172	91337	9	0
406173	91338	9	0
406174	91339	9	0
406175	91340	9	0
406176	91341	9	0
406177	91342	9	0
406178	91343	9	0
406179	91344	9	0
406180	91345	9	0
406181	91346	9	0
406182	91347	9	0
406183	91348	9	0
406184	91349	9	0
406185	91350	9	0
406186	91351	9	0
406187	91352	9	0
406188	91353	9	0
406189	91354	9	0
406190	91355	9	0
406191	91356	9	0
406192	91357	9	0
406193	91358	9	0
406194	91359	9	0
406195	91360	9	0
406196	91361	9	0
406197	91362	9	0
406198	91363	9	0
406199	91364	9	0
406200	91365	9	0
406201	91366	9	0
406202	91367	9	0
406203	91368	9	0
406204	91369	9	0
406205	91370	9	0
406206	91371	9	0
406207	91372	9	0
406208	91373	9	0
406209	91374	9	0
406210	91375	9	0
406211	91376	9	0
406212	91377	9	0
406213	91378	9	0
406214	91379	9	0
406215	91380	9	0
406216	91381	9	0
406217	91382	9	0
406218	91383	9	0
406219	91384	9	0
406220	91385	9	0
406221	91386	9	0
406222	91387	9	0
406223	91388	9	0
406224	91389	9	0
406225	91390	9	0
406226	91391	9	0
406227	91392	9	0
406228	91393	9	0
406229	91394	9	0
406230	91395	9	0
406231	91396	9	0
406232	91397	9	0
406233	91398	9	0
406234	91399	9	0
406235	91400	9	0
406236	91401	9	0
406237	91402	9	0
406238	91403	9	0
406239	91404	9	0
406240	91405	9	0
406241	91406	9	0
406242	91407	9	0
406243	91408	9	0
406244	91409	9	0
406245	91410	9	0
406246	91411	9	0
406247	91412	9	0
406248	91413	9	0
406249	91414	9	0
406250	91415	9	0
406251	91416	9	0
406252	91417	9	0
406253	91418	9	0
406254	91419	9	0
406255	91420	9	0
406256	91421	9	0
406257	91422	9	0
406258	91423	9	0
406259	91424	9	0
406260	91425	9	0
406261	91426	9	0
406262	91427	9	0
406263	91428	9	0
406264	91429	9	0
406265	91430	9	0
406266	91431	9	0
406267	91432	9	0
406268	91433	9	0
406269	91434	9	0
406270	91435	9	0
406271	91436	9	0
406272	91437	9	0
406273	91438	9	0
406274	91439	9	0
406275	91440	9	0
406276	91441	9	0
406277	91442	9	0
406278	91443	9	0
406279	91444	9	0
406280	91445	9	0
406281	91446	9	0
406282	91447	9	0
406283	91448	9	0
406284	91449	9	0
406285	91450	9	0
406286	91451	9	0
406287	91452	9	0
406288	91453	9	0
406289	91454	9	0
406290	91455	9	0
406291	91456	9	0
406292	91457	9	0
406293	91458	9	0
406294	91459	9	0
406295	91460	9	0
406296	91461	9	0
406297	91462	9	0
406298	91463	9	0
406299	91464	9	0
406300	91465	9	0
406301	91466	9	0
406302	91467	9	0
406303	91468	9	0
406304	91469	9	0
406305	91470	9	0
406306	91471	9	0
406307	91472	9	0
406308	91473	9	0
406309	91474	9	0
406310	91475	9	0
406311	91476	9	0
406312	91477	9	0
406313	91478	9	0
406314	91479	9	0
406315	91480	9	0
406316	91481	9	0
406317	91482	9	0
406318	91483	9	0
406319	91484	9	0
406320	91485	9	0
406321	91486	9	0
406322	91487	9	0
406323	91488	9	0
406324	91489	9	0
406325	91490	9	0
406326	91491	9	0
406327	91492	9	0
406328	91493	9	0
406329	91494	9	0
406330	91495	9	0
406331	91496	9	0
406332	91497	9	0
406333	91498	9	0
406334	91499	9	0
406335	91500	9	0
406336	91501	9	0
406337	91502	9	0
406338	91503	10	0
406339	91504	10	0
406340	91505	10	0
406341	91506	10	0
406342	91507	10	0
406343	91508	10	0
406344	91509	10	0
406345	91510	10	0
406346	91511	10	0
406347	91512	10	0
406348	91513	10	0
406349	91514	10	0
406350	91515	10	0
406351	91516	10	0
406352	91517	10	0
406353	91518	10	0
406354	91519	10	0
406355	91520	10	0
406356	91521	10	0
406357	91522	10	0
406358	91523	10	0
406359	91524	10	0
406360	91525	10	0
406361	91526	10	0
406362	91527	10	0
406363	91528	10	0
406364	91529	10	0
406365	91530	10	0
406366	91531	10	0
406367	91532	10	0
406368	91533	10	0
406369	91534	10	0
406370	91535	10	0
406371	91536	10	0
406372	91537	10	0
406373	91538	10	0
406374	91539	10	0
406375	91540	10	0
406376	91541	10	0
406377	91542	10	0
406378	91543	10	0
406379	91544	10	0
406380	91545	10	0
406381	91546	10	0
406382	91547	10	0
406383	91548	10	0
406384	91549	10	0
406385	91550	10	0
406386	91551	10	0
406387	91552	10	0
406388	91553	10	0
406389	91554	10	0
406390	91555	10	0
406391	91556	10	0
406392	91557	10	0
406393	91558	10	0
406394	91559	10	0
406395	91560	10	0
406396	91561	10	0
406397	91562	10	0
406398	91563	10	0
406399	91564	10	0
406400	91565	10	0
406401	91566	10	0
406402	91567	10	0
406403	91568	10	0
406404	91569	10	0
406405	91570	10	0
406406	91571	10	0
406407	91572	10	0
406408	91573	10	0
406409	91574	10	0
406410	91575	10	0
406411	91576	10	0
406412	91577	10	0
406413	91578	10	0
406414	91579	10	0
406415	91580	10	0
406416	91581	10	0
406417	91582	10	0
406418	91583	10	0
406419	91584	10	0
406420	91585	10	0
406421	91586	10	0
406422	91587	10	0
406423	91588	10	0
406424	91589	10	0
406425	91590	10	0
406426	91591	10	0
406427	91592	10	0
406428	91593	10	0
406429	91594	10	0
406430	91595	10	0
406431	91596	10	0
406432	91597	10	0
406433	91598	10	0
406434	91599	10	0
406435	91600	10	0
406436	91601	10	0
406437	91602	10	0
406438	91603	10	0
406439	91604	10	0
406440	91605	10	0
406441	91606	10	0
406442	91607	10	0
406443	91608	10	0
406444	91609	10	0
406445	91610	10	0
406446	91611	10	0
406447	91612	10	0
406448	91613	10	0
406449	91614	10	0
406450	91615	10	0
406451	91616	10	0
406452	91617	10	0
406453	91618	10	0
406454	91619	10	0
406455	91620	10	0
406456	91621	10	0
406457	91622	10	0
406458	91623	10	0
406459	91624	10	0
406460	91625	10	0
406461	91626	10	0
406462	91627	10	0
406463	91628	10	0
406464	91629	10	0
406465	91630	10	0
406466	91631	10	0
406467	91632	10	0
406468	91633	10	0
406469	91634	10	0
406470	91635	10	0
406471	91636	10	0
406472	91637	10	0
406473	91638	10	0
406474	91639	10	0
406475	91640	10	0
406476	91641	10	0
406477	91642	10	0
406478	91643	10	0
406479	91644	10	0
406480	91645	10	0
406481	91646	10	0
406482	91647	10	0
406483	91648	10	0
406484	91649	10	0
406485	91650	10	0
406486	91651	10	0
406487	91652	10	0
406488	91653	10	0
406489	91654	10	0
406490	91655	10	0
406491	91656	10	0
406492	91657	10	0
406493	91658	10	0
406494	91659	10	0
406495	91660	10	0
406496	91661	10	0
406497	91662	10	0
406498	91663	10	0
406499	91664	10	0
406500	91665	10	0
406501	91666	10	0
406502	91667	10	0
406503	91668	10	0
406504	91669	10	0
406505	91670	10	0
406506	91671	10	0
406507	91672	10	0
406508	91673	10	0
406509	91674	10	0
406510	91675	10	0
406511	91676	10	0
406512	91677	10	0
406513	91678	10	0
406514	91679	10	0
406515	91680	10	0
406516	91681	10	0
406517	91682	10	0
406518	91683	10	0
406519	91684	10	0
406520	91685	10	0
406521	91686	10	0
406522	91687	10	0
406523	91688	10	0
406524	91689	10	0
406525	91690	10	0
406526	91691	10	0
406527	91692	10	0
406528	91693	10	0
406529	91694	10	0
406530	91695	10	0
406531	91696	10	0
406532	91697	10	0
406533	91698	10	0
406534	91699	10	0
406535	91700	10	0
406536	91701	10	0
406537	91702	10	0
406538	91703	10	0
406539	91704	10	0
406540	91705	10	0
406541	91706	10	0
406542	91707	10	0
406543	91708	10	0
406544	91709	10	0
406545	91710	10	0
406546	91711	10	0
406547	91712	10	0
406548	91713	10	0
406549	91714	10	0
406550	91715	10	0
406551	91716	10	0
406552	91717	10	0
406553	91718	10	0
406554	91719	10	0
406555	91720	10	0
406556	91721	10	0
406557	91722	10	0
406558	91723	10	0
406559	91724	10	0
406560	91725	10	0
406561	91726	10	0
406562	91727	10	0
406563	91728	10	0
406564	91729	10	0
406565	91730	10	0
406566	91731	10	0
406567	91732	10	0
406568	91733	10	0
406569	91734	10	0
406570	91735	10	0
406571	91736	10	0
406572	91737	10	0
406573	91738	10	0
406574	91739	10	0
406575	91740	10	0
406576	91741	10	0
406577	91742	10	0
406578	91743	10	0
406579	91744	10	0
406580	91745	10	0
406581	91746	10	0
406582	91747	10	0
406583	91748	10	0
406584	91749	10	0
406585	91750	10	0
406586	91751	10	0
406587	91752	10	0
406588	91753	10	0
406589	91754	10	0
406590	91755	10	0
406591	91756	10	0
406592	91757	10	0
406593	91758	10	0
406594	91759	11	0
406595	91760	11	0
406596	91761	11	0
406597	91762	11	0
406598	91763	11	0
406599	91764	11	0
406600	91765	11	0
406601	91766	11	0
406602	91767	11	0
406603	91768	11	0
406604	91769	11	0
406605	91770	11	0
406606	91771	11	0
406607	91772	11	0
406608	91773	11	0
406609	91774	11	0
406610	91775	11	0
406611	91776	11	0
406612	91777	11	0
406613	91778	11	0
406614	91779	11	0
406615	91780	11	0
406616	91781	11	0
406617	91782	11	0
406618	91783	11	0
406619	91784	11	0
406620	91785	11	0
406621	91786	11	0
406622	91787	11	0
406623	91788	11	0
406624	91789	11	0
406625	91790	11	0
406626	91791	11	0
406627	91792	11	0
406628	91793	11	0
406629	91794	11	0
406630	91795	11	0
406631	91796	11	0
406632	91797	11	0
406633	91798	11	0
406634	91799	11	0
406635	91800	11	0
406636	91801	11	0
406637	91802	11	0
406638	91803	11	0
406639	91804	11	0
406640	91805	11	0
406641	91806	11	0
406642	91807	11	0
406643	91808	11	0
406644	91809	11	0
406645	91810	11	0
406646	91811	11	0
406647	91812	11	0
406648	91813	11	0
406649	91814	11	0
406650	91815	11	0
406651	91816	11	0
406652	91817	11	0
406653	91818	11	0
406654	91819	11	0
406655	91820	11	0
406656	91821	11	0
406657	91822	11	0
406658	91823	11	0
406659	91824	11	0
406660	91825	11	0
406661	91826	11	0
406662	91827	11	0
406663	91828	11	0
406664	91829	11	0
406665	91830	11	0
406666	91831	11	0
406667	91832	11	0
406668	91833	11	0
406669	91834	11	0
406670	91835	11	0
406671	91836	11	0
406672	91837	11	0
406673	91838	11	0
406674	91839	11	0
406675	91840	11	0
406676	91841	11	0
406677	91842	11	0
406678	91843	11	0
406679	91844	11	0
406680	91845	11	0
406681	91846	11	0
406682	91847	11	0
406683	91848	11	0
406684	91849	11	0
406685	91850	11	0
406686	91851	11	0
406687	91852	11	0
406688	91853	11	0
406689	91854	11	0
406690	91855	11	0
406691	91856	11	0
406692	91857	11	0
406693	91858	11	0
406694	91859	11	0
406695	91860	11	0
406696	91861	11	0
406697	91862	11	0
406698	91863	11	0
406699	91864	11	0
406700	91865	11	0
406701	91866	11	0
406702	91867	11	0
406703	91868	11	0
406704	91869	11	0
406705	91870	11	0
406706	91871	11	0
406707	91872	11	0
406708	91873	11	0
406709	91874	11	0
406710	91875	11	0
406711	91876	11	0
406712	91877	11	0
406713	91878	11	0
406714	91879	11	0
406715	91880	11	0
406716	91881	11	0
406717	91882	11	0
406718	91883	11	0
406719	91884	11	0
406720	91885	11	0
406721	91886	11	0
406722	91887	11	0
406723	91888	11	0
406724	91889	11	0
406725	91890	11	0
406726	91891	11	0
406727	91892	11	0
406728	91893	11	0
406729	91894	11	0
406730	91895	11	0
406731	91896	11	0
406732	91897	11	0
406733	91898	11	0
406734	91899	11	0
406735	91900	11	0
406736	91901	11	0
406737	91902	11	0
406738	91903	11	0
406739	91904	11	0
406740	91905	11	0
406741	91906	11	0
406742	91907	11	0
406743	91908	11	0
406744	91909	11	0
406745	91910	11	0
406746	91911	11	0
406747	91912	11	0
406748	91913	11	0
406749	91914	11	0
406750	91915	11	0
406751	91916	11	0
406752	91917	11	0
406753	91918	11	0
406754	91919	11	0
406755	91920	11	0
406756	91921	11	0
406757	91922	11	0
406758	91923	11	0
406759	91924	11	0
406760	91925	11	0
406761	91926	11	0
406762	91927	11	0
406763	91928	11	0
406764	91929	11	0
406765	91930	11	0
406766	91931	11	0
406767	91932	11	0
406768	91933	11	0
406769	91934	11	0
406770	91935	11	0
406771	91936	11	0
406772	91937	11	0
406773	91938	11	0
406774	91939	11	0
406775	91940	11	0
406776	91941	11	0
406777	91942	11	0
406778	91943	11	0
406779	91944	11	0
406780	91945	11	0
406781	91946	11	0
406782	91947	11	0
406783	91948	11	0
406784	91949	11	0
406785	91950	11	0
406786	91951	11	0
406787	91952	11	0
406788	91953	11	0
406789	91954	11	0
406790	91955	11	0
406791	91956	11	0
406792	91957	11	0
406793	91958	11	0
406794	91959	11	0
406795	91960	11	0
406796	91961	11	0
406797	91962	11	0
406798	91963	11	0
406799	91964	11	0
406800	91965	11	0
406801	91966	11	0
406802	91967	0	0
406803	91968	0	0
406804	91969	0	0
406805	91970	0	0
406806	91971	0	0
406807	91972	0	0
406808	91973	0	0
406809	91974	0	0
406810	91975	0	0
406811	91976	0	0
406812	91977	0	0
406813	91978	0	0
406814	91979	0	0
406815	91980	0	0
406816	91981	0	0
406817	91982	0	0
406818	91983	1	0
406819	91984	1	0
406820	91985	1	0
406821	91986	1	0
406822	91987	1	0
406823	91988	1	0
406824	91989	1	0
406825	91990	1	0
406826	91991	1	0
406827	91992	1	0
406828	91993	1	0
406829	91994	1	0
406830	91995	1	0
406831	91996	1	0
406832	91997	1	0
406833	91998	1	0
406834	91999	2	0
406835	92000	2	0
406836	92001	2	0
406837	92002	2	0
406838	92003	2	0
406839	92004	2	0
406840	92005	2	0
406841	92006	2	0
406842	92007	2	0
406843	92008	2	0
406844	92009	2	0
406845	92010	2	0
406846	92011	2	0
406847	92012	2	0
406848	92013	2	0
406849	92014	2	0
406850	92015	3	0
406851	92016	3	0
406852	92017	3	0
406853	92018	3	0
406854	92019	3	0
406855	92020	3	0
406856	92021	3	0
406857	92022	3	0
406858	92023	3	0
406859	92024	3	0
406860	92025	3	0
406861	92026	3	0
406862	92027	3	0
406863	92028	3	0
406864	92029	3	0
406865	92030	3	0
406866	92031	4	0
406867	92032	4	0
406868	92033	4	0
406869	92034	4	0
406870	92035	4	0
406871	92036	4	0
406872	92037	4	0
406873	92038	4	0
406874	92039	4	0
406875	92040	4	0
406876	92041	4	0
406877	92042	4	0
406878	92043	4	0
406879	92044	4	0
406880	92045	4	0
406881	92046	4	0
406882	92047	4	0
406883	92048	5	0
406884	92049	5	0
406885	92050	5	0
406886	92051	5	0
406887	92052	5	0
406888	92053	5	0
406889	92054	5	0
406890	92055	5	0
406891	92056	5	0
406892	92057	5	0
406893	92058	5	0
406894	92059	5	0
406895	92060	5	0
406896	92061	5	0
406897	92062	5	0
406898	92063	5	0
406899	92064	5	0
406900	92065	6	0
406901	92066	6	0
406902	92067	6	0
406903	92068	6	0
406904	92069	6	0
406905	92070	6	0
406906	92071	6	0
406907	92072	6	0
406908	92073	6	0
406909	92074	6	0
406910	92075	6	0
406911	92076	6	0
406912	92077	6	0
406913	92078	6	0
406914	92079	6	0
406915	92080	7	0
406916	92081	7	0
406917	92082	7	0
406918	92083	7	0
406919	92084	7	0
406920	92085	7	0
406921	92086	7	0
406922	92087	7	0
406923	92088	7	0
406924	92089	7	0
406925	92090	7	0
406926	92091	7	0
406927	92092	7	0
406928	92093	7	0
406929	92094	7	0
406930	92095	8	0
406931	92096	8	0
406932	92097	8	0
406933	92098	8	0
406934	92099	8	0
406935	92100	8	0
406936	92101	8	0
406937	92102	8	0
406938	92103	8	0
406939	92104	8	0
406940	92105	8	0
406941	92106	8	0
406942	92107	8	0
406943	92108	8	0
406944	92109	8	0
406945	92110	8	0
406946	92111	8	0
406947	92112	8	0
406948	92113	9	0
406949	92114	9	0
406950	92115	9	0
406951	92116	9	0
406952	92117	9	0
406953	92118	9	0
406954	92119	9	0
406955	92120	9	0
406956	92121	9	0
406957	92122	9	0
406958	92123	9	0
406959	92124	9	0
406960	92125	9	0
406961	92126	9	0
406962	92127	9	0
406963	92128	9	0
406964	92129	9	0
406965	92130	9	0
406966	92131	10	0
406967	92132	10	0
406968	92133	10	0
406969	92134	10	0
406970	92135	10	0
406971	92136	10	0
406972	92137	10	0
406973	92138	10	0
406974	92139	10	0
406975	92140	10	0
406976	92141	10	0
406977	92142	10	0
406978	92143	10	0
406979	92144	11	0
406980	92145	11	0
406981	92146	11	0
406982	92147	11	0
406983	92148	11	0
406984	92149	11	0
406985	92150	11	0
406986	92151	11	0
406987	92152	11	0
406988	92153	11	0
406989	92154	11	0
406990	92155	11	0
406991	92156	11	0
406992	92157	11	0
431829	113402	0	0
431830	113403	0	0
431831	113404	0	0
431832	113405	0	0
431833	113406	0	0
431834	113407	0	0
431835	113408	0	0
431836	113409	0	0
431837	113410	0	0
431838	113411	0	0
431839	113412	0	0
431840	113413	0	0
431841	113414	0	0
431842	113415	0	0
431843	113416	0	0
431844	113417	0	0
431845	113418	0	0
431846	113419	0	0
431847	113420	0	0
431848	113421	0	0
431849	113422	0	0
431850	113423	0	0
431851	113424	0	0
431852	113425	0	0
431853	113426	0	0
431854	113427	0	0
431855	113428	0	0
431856	113429	0	0
431857	113430	0	0
431858	113431	0	0
431859	113432	0	0
431860	113433	0	0
431861	113434	0	1
431862	113435	0	1
431863	113436	0	1
431864	113437	0	1
431865	113438	0	1
431866	113439	0	1
431867	113440	0	1
431868	113441	0	1
431869	113442	0	1
431870	113443	0	1
431871	113444	0	1
431872	113445	0	1
431873	113446	0	1
431874	113447	0	1
431875	113448	0	1
431876	113449	0	1
431877	113450	0	2
431878	113451	0	2
431879	113452	0	2
431880	113453	0	2
431881	113454	0	2
431882	113455	0	2
431883	113456	0	2
431884	113457	0	2
431885	113458	0	2
431886	113459	0	2
431887	113460	0	2
431888	113461	0	2
431889	113462	0	2
431890	113463	0	2
431891	113464	0	2
431892	113465	0	2
431893	113466	0	0
431894	113467	0	0
431895	113468	0	0
431896	113469	0	0
431897	113470	0	0
431898	113471	0	0
431899	113472	0	0
431900	113473	0	0
431901	113474	0	0
431902	113475	0	0
431903	113476	0	0
431904	113477	0	0
431905	113478	0	0
431906	113479	0	0
431907	113480	0	0
431908	113481	0	0
431909	113482	0	0
431910	113483	0	0
431911	113484	0	0
431912	113485	0	0
431913	113486	0	0
431914	113487	0	0
431915	113488	0	0
431916	113489	0	0
431917	113490	0	0
431918	113491	0	0
431919	113492	0	0
431920	113493	0	0
431921	113494	0	0
431922	113495	0	0
431923	113496	0	0
431924	113497	0	0
431925	113498	0	0
431926	113499	0	0
431927	113500	0	0
431928	113501	0	0
431929	113502	0	0
431930	113503	0	0
431931	113504	0	0
431932	113505	0	0
431933	113506	0	0
431934	113507	0	0
431935	113508	0	0
431936	113509	0	0
431937	113510	0	0
431938	113511	0	0
431939	113512	0	0
431940	113513	0	0
431941	113514	0	0
431942	113515	0	0
431943	113516	0	0
431944	113517	0	0
431945	113518	0	0
431946	113519	0	0
431947	113520	0	0
431948	113521	0	0
431949	113522	0	0
431950	113523	0	0
431951	113524	0	0
431952	113525	0	0
431953	113526	0	0
431954	113527	0	0
431955	113528	0	0
431956	113529	0	0
431957	113530	0	0
431958	113531	0	0
431959	113532	0	0
431960	113533	0	0
431961	113534	0	0
431962	113535	0	0
431963	113536	0	0
431964	113537	0	0
431965	113538	0	0
431966	113539	0	0
431967	113540	0	0
431968	113541	0	0
431969	113542	0	0
431970	113543	0	0
431971	113544	0	0
431972	113545	0	0
431973	113546	0	0
431974	113547	0	0
431975	113548	0	0
431976	113549	0	0
431977	113550	0	0
431978	113551	0	0
431979	113552	0	0
431980	113553	0	0
431981	113554	0	0
431982	113555	0	0
431983	113556	0	0
431984	113557	0	0
431985	113558	0	0
431986	113559	0	0
431987	113560	0	0
431988	113561	0	0
431989	113562	0	0
431990	113563	0	0
431991	113564	0	0
431992	113565	0	0
431993	113566	0	0
431994	113567	0	0
431995	113568	0	0
431996	113569	0	0
431997	113570	0	0
431998	113571	0	0
431999	113572	0	0
432000	113573	0	0
432001	113574	0	0
432002	113575	0	0
432003	113576	0	0
432004	113577	0	0
432005	113578	0	0
432006	113579	0	0
432007	113580	0	0
432008	113581	0	0
432009	113582	0	0
432010	113583	0	0
432011	113584	0	0
432012	113585	0	0
432013	113586	0	0
432014	113587	0	0
432015	113588	0	0
432016	113589	0	0
432017	113590	0	0
432018	113591	0	0
432019	113592	0	0
432020	113593	0	0
432021	113594	0	0
432022	113595	0	0
432023	113596	0	0
432024	113597	0	0
432025	113598	0	0
432026	113599	0	0
432027	113600	0	0
432028	113601	0	0
432029	113602	0	0
432030	113603	0	0
432031	113604	0	0
432032	113605	0	0
432033	113606	0	0
432034	113607	0	0
432035	113608	0	0
432036	113609	0	0
432037	113610	0	0
432038	113611	0	0
432039	113612	0	0
432040	113613	0	0
432041	113614	0	0
432042	113615	0	0
432043	113616	0	0
432044	113617	0	0
432045	113618	0	0
432046	113619	0	0
432047	113620	0	0
432048	113621	0	0
432049	113622	0	0
432050	113623	0	0
432051	113624	0	0
432052	113625	0	0
432053	113626	0	1
432054	113627	0	1
432055	113628	0	1
432056	113629	0	1
432057	113630	0	1
432058	113631	0	1
432059	113632	0	1
432060	113633	0	1
432061	113634	0	1
432062	113635	0	1
432063	113636	0	1
432064	113637	0	1
432065	113638	0	1
432066	113639	0	1
432067	113640	0	1
432068	113641	0	1
432069	113642	0	0
432070	113643	0	0
432071	113644	0	0
432072	113645	0	0
432073	113646	0	0
432074	113647	0	0
432075	113648	0	0
432076	113649	0	0
432077	113650	0	0
432078	113651	0	0
432079	113652	0	0
432080	113653	0	0
432081	113654	0	0
432082	113655	0	0
432083	113656	0	0
432084	113657	0	0
432085	113658	0	0
432086	113659	0	0
432087	113660	0	0
432088	113661	0	0
432089	113662	0	0
432090	113663	0	0
432091	113664	0	0
432092	113665	0	0
432093	113666	0	0
432094	113667	0	0
432095	113668	0	0
432096	113669	0	0
432097	113670	0	0
432098	113671	0	0
432099	113672	0	0
432100	113673	0	0
432101	113674	0	0
432102	113675	0	0
432103	113676	0	0
432104	113677	0	0
432105	113678	0	0
432106	113679	0	0
432107	113680	0	0
432108	113681	0	0
432109	113682	0	0
432110	113683	0	0
432111	113684	0	0
432112	113685	0	0
432113	113686	0	0
432114	113687	0	0
432115	113688	0	0
432116	113689	0	0
432117	113690	0	1
432118	113691	0	1
432119	113692	0	1
432120	113693	0	1
432121	113694	0	1
432122	113695	0	1
432123	113696	0	1
432124	113697	0	1
432125	113698	0	2
432126	113699	0	2
432127	113700	0	2
432128	113701	0	2
432129	113702	0	2
432130	113703	0	2
432131	113704	0	2
432132	113705	0	2
432133	113706	0	2
432134	113707	0	2
432135	113708	0	2
432136	113709	0	2
432137	113710	0	2
432138	113711	0	2
432139	113712	0	2
432140	113713	0	2
432141	113714	0	2
432142	113715	0	2
432143	113716	0	2
432144	113717	0	2
432145	113718	0	2
432146	113719	0	2
432147	113720	0	2
432148	113721	0	2
432149	113722	1	0
432150	113723	1	0
432151	113724	1	0
432152	113725	1	0
432153	113726	1	0
432154	113727	1	0
432155	113728	1	0
432156	113729	1	0
432157	113730	1	0
432158	113731	1	0
432159	113732	1	0
432160	113733	1	0
432161	113734	1	0
432162	113735	1	0
432163	113736	1	0
432164	113737	1	0
432165	113738	1	0
432166	113739	1	0
432167	113740	1	0
432168	113741	1	0
432169	113742	1	0
432170	113743	1	0
432171	113744	1	0
432172	113745	1	0
432173	113746	1	0
432174	113747	1	0
432175	113748	1	0
432176	113749	1	0
432177	113750	1	0
432178	113751	1	0
432179	113752	1	0
432180	113753	1	0
432181	113754	1	0
432182	113755	1	0
432183	113756	1	0
432184	113757	1	0
432185	113758	1	0
432186	113759	1	0
432187	113760	1	0
432188	113761	1	0
432189	113762	1	0
432190	113763	1	0
432191	113764	1	0
432192	113765	1	0
432193	113766	1	0
432194	113767	1	0
432195	113768	1	0
432196	113769	1	0
432197	113770	1	0
432198	113771	1	0
432199	113772	1	0
432200	113773	1	0
432201	113774	1	0
432202	113775	1	0
432203	113776	1	0
432204	113777	1	0
432205	113778	1	0
432206	113779	1	0
432207	113780	1	0
432208	113781	1	0
432209	113782	1	0
432210	113783	1	0
432211	113784	1	0
432212	113785	1	0
432213	113786	1	0
432214	113787	1	0
432215	113788	1	0
432216	113789	1	0
432217	113790	1	0
432218	113791	1	0
432219	113792	1	0
432220	113793	1	0
432221	113794	1	0
432222	113795	1	0
432223	113796	1	0
432224	113797	1	0
432225	113798	1	0
432226	113799	1	0
432227	113800	1	0
432228	113801	1	0
432229	113802	1	0
432230	113803	1	0
432231	113804	1	0
432232	113805	1	0
432233	113806	1	0
432234	113807	1	0
432235	113808	1	0
432236	113809	1	0
432237	113810	1	0
432238	113811	1	0
432239	113812	1	0
432240	113813	1	0
432241	113814	1	0
432242	113815	1	0
432243	113816	1	0
432244	113817	1	0
432245	113482	1	0
432246	113483	1	0
432247	113484	1	0
432248	113485	1	0
432249	113486	1	0
432250	113487	1	0
432251	113488	1	0
432252	113489	1	0
432253	113490	1	0
432254	113491	1	0
432255	113492	1	0
432256	113493	1	0
432257	113494	1	0
432258	113495	1	0
432259	113496	1	0
432260	113497	1	0
432261	113498	1	0
432262	113499	1	0
432263	113500	1	0
432264	113501	1	0
432265	113502	1	0
432266	113503	1	0
432267	113504	1	0
432268	113505	1	0
432269	113506	1	0
432270	113507	1	0
432271	113508	1	0
432272	113509	1	0
432273	113510	1	0
432274	113511	1	0
432275	113512	1	0
432276	113513	1	0
432277	113818	1	0
432278	113819	1	0
432279	113820	1	0
432280	113821	1	0
432281	113822	1	0
432282	113823	1	0
432283	113824	1	0
432284	113825	1	0
432285	113826	1	0
432286	113827	1	0
432287	113828	1	0
432288	113829	1	0
432289	113830	1	0
432290	113831	1	0
432291	113832	1	0
432292	113833	1	0
432293	113834	1	0
432294	113835	1	0
432295	113836	1	0
432296	113837	1	0
432297	113838	1	0
432298	113839	1	0
432299	113840	1	0
432300	113841	1	0
432301	113842	1	0
432302	113843	1	0
432303	113844	1	0
432304	113845	1	0
432305	113846	1	0
432306	113847	1	0
432307	113848	1	0
432308	113849	1	0
432309	113530	1	0
432310	113531	1	0
432311	113532	1	0
432312	113533	1	0
432313	113534	1	0
432314	113535	1	0
432315	113536	1	0
432316	113537	1	0
432317	113538	1	0
432318	113539	1	0
432319	113540	1	0
432320	113541	1	0
432321	113542	1	0
432322	113543	1	0
432323	113544	1	0
432324	113545	1	0
432325	113546	1	0
432326	113547	1	0
432327	113548	1	0
432328	113549	1	0
432329	113550	1	0
432330	113551	1	0
432331	113552	1	0
432332	113553	1	0
432333	113554	1	0
432334	113555	1	0
432335	113556	1	0
432336	113557	1	0
432337	113558	1	0
432338	113559	1	0
432339	113560	1	0
432340	113561	1	0
432341	113850	1	1
432342	113851	1	1
432343	113852	1	1
432344	113853	1	1
432345	113854	1	1
432346	113855	1	1
432347	113856	1	1
432348	113857	1	1
432349	113858	1	1
432350	113859	1	1
432351	113860	1	1
432352	113861	1	1
432353	113862	1	1
432354	113863	1	1
432355	113864	1	1
432356	113865	1	1
432357	113866	1	2
432358	113867	1	2
432359	113868	1	2
432360	113869	1	2
432361	113870	1	2
432362	113871	1	2
432363	113872	1	2
432364	113873	1	2
432365	113874	1	2
432366	113875	1	2
432367	113876	1	2
432368	113877	1	2
432369	113878	1	2
432370	113879	1	2
432371	113880	1	2
432372	113881	1	2
432373	113594	1	0
432374	113595	1	0
432375	113596	1	0
432376	113597	1	0
432377	113598	1	0
432378	113599	1	0
432379	113600	1	0
432380	113601	1	0
432381	113602	1	0
432382	113603	1	0
432383	113604	1	0
432384	113605	1	0
432385	113606	1	0
432386	113607	1	0
432387	113608	1	0
432388	113609	1	0
432389	113882	1	1
432390	113883	1	1
432391	113884	1	1
432392	113885	1	1
432393	113886	1	1
432394	113887	1	1
432395	113888	1	1
432396	113889	1	1
432397	113890	1	1
432398	113891	1	1
432399	113892	1	1
432400	113893	1	1
432401	113894	1	1
432402	113895	1	1
432403	113896	1	1
432404	113897	1	1
432405	113658	1	0
432406	113659	1	0
432407	113660	1	0
432408	113661	1	0
432409	113662	1	0
432410	113663	1	0
432411	113664	1	0
432412	113665	1	0
432413	113666	1	0
432414	113667	1	0
432415	113668	1	0
432416	113669	1	0
432417	113670	1	0
432418	113671	1	0
432419	113672	1	0
432420	113673	1	0
432421	113674	1	0
432422	113675	1	0
432423	113676	1	0
432424	113677	1	0
432425	113678	1	0
432426	113679	1	0
432427	113680	1	0
432428	113681	1	0
432429	113682	1	0
432430	113683	1	0
432431	113684	1	0
432432	113685	1	0
432433	113686	1	0
432434	113687	1	0
432435	113688	1	0
432436	113689	1	0
432437	113898	1	2
432438	113899	1	2
432439	113900	1	2
432440	113901	1	2
432441	113902	1	2
432442	113903	1	2
432443	113904	1	2
432444	113905	1	2
432445	113906	1	2
432446	113907	1	2
432447	113908	1	2
432448	113909	1	2
432449	113910	1	2
432450	113911	1	2
432451	113912	1	2
432452	113913	1	2
432453	113914	1	0
432454	113915	1	0
432455	113916	1	0
432456	113917	1	0
432457	113918	1	0
432458	113919	1	0
432459	113920	1	0
432460	113921	1	0
432461	113922	2	1
432462	113923	2	1
432463	113924	2	1
432464	113925	2	1
432465	113926	2	1
432466	113927	2	1
432467	113928	2	1
432468	113929	2	1
432469	113930	2	1
432470	113931	2	1
432471	113932	2	1
432472	113933	2	1
432473	113934	2	1
432474	113935	2	1
432475	113936	2	1
432476	113937	2	1
432477	113938	2	2
432478	113939	2	2
432479	113940	2	2
432480	113941	2	2
432481	113942	2	2
432482	113943	2	2
432483	113944	2	2
432484	113945	2	2
432485	113946	2	2
432486	113947	2	2
432487	113948	2	2
432488	113949	2	2
432489	113950	2	2
432490	113951	2	2
432491	113952	2	2
432492	113953	2	2
432493	113954	2	1
432494	113955	2	1
432495	113956	2	1
432496	113957	2	1
432497	113958	2	1
432498	113959	2	1
432499	113960	2	1
432500	113961	2	1
432501	113962	2	1
432502	113963	2	1
432503	113964	2	1
432504	113965	2	1
432505	113966	2	1
432506	113967	2	1
432507	113968	2	1
432508	113969	2	1
432509	113970	2	2
432510	113971	2	2
432511	113972	2	2
432512	113973	2	2
432513	113974	2	2
432514	113975	2	2
432515	113976	2	2
432516	113977	2	2
432517	113978	2	2
432518	113979	2	2
432519	113980	2	2
432520	113981	2	2
432521	113982	2	2
432522	113983	2	2
432523	113984	2	2
432524	113985	2	2
432525	113986	2	0
432526	113987	2	0
432527	113988	2	0
432528	113989	2	0
432529	113990	2	0
432530	113991	2	0
432531	113992	2	0
432532	113993	2	0
432533	113994	2	0
432534	113995	2	0
432535	113996	2	0
432536	113997	2	0
432537	113998	2	0
432538	113999	2	0
432539	114000	2	0
432540	114001	2	0
432541	114002	2	0
432542	114003	2	0
432543	114004	2	0
432544	114005	2	0
432545	114006	2	0
432546	114007	2	0
432547	114008	2	0
432548	114009	2	0
432549	114010	2	0
432550	114011	2	0
432551	114012	2	0
432552	114013	2	0
432553	114014	2	0
432554	114015	2	0
432555	114016	2	0
432556	114017	2	0
432557	113482	2	0
432558	113483	2	0
432559	113484	2	0
432560	113485	2	0
432561	113486	2	0
432562	113487	2	0
432563	113488	2	0
432564	113489	2	0
432565	113490	2	0
432566	113491	2	0
432567	113492	2	0
432568	113493	2	0
432569	113494	2	0
432570	113495	2	0
432571	113496	2	0
432572	113497	2	0
432573	113498	2	0
432574	113499	2	0
432575	113500	2	0
432576	113501	2	0
432577	113502	2	0
432578	113503	2	0
432579	113504	2	0
432580	113505	2	0
432581	113506	2	0
432582	113507	2	0
432583	113508	2	0
432584	113509	2	0
432585	113510	2	0
432586	113511	2	0
432587	113512	2	0
432588	113513	2	0
432589	114018	2	0
432590	114019	2	0
432591	114020	2	0
432592	114021	2	0
432593	114022	2	0
432594	114023	2	0
432595	114024	2	0
432596	114025	2	0
432597	114026	2	0
432598	114027	2	0
432599	114028	2	0
432600	114029	2	0
432601	114030	2	0
432602	114031	2	0
432603	114032	2	0
432604	114033	2	0
432605	114034	2	0
432606	114035	2	0
432607	114036	2	0
432608	114037	2	0
432609	114038	2	0
432610	114039	2	0
432611	114040	2	0
432612	114041	2	0
432613	114042	2	0
432614	114043	2	0
432615	114044	2	0
432616	114045	2	0
432617	114046	2	0
432618	114047	2	0
432619	114048	2	0
432620	114049	2	0
432621	113530	2	0
432622	113531	2	0
432623	113532	2	0
432624	113533	2	0
432625	113534	2	0
432626	113535	2	0
432627	113536	2	0
432628	113537	2	0
432629	113538	2	0
432630	113539	2	0
432631	113540	2	0
432632	113541	2	0
432633	113542	2	0
432634	113543	2	0
432635	113544	2	0
432636	113545	2	0
432637	113546	2	0
432638	113547	2	0
432639	113548	2	0
432640	113549	2	0
432641	113550	2	0
432642	113551	2	0
432643	113552	2	0
432644	113553	2	0
432645	113554	2	0
432646	113555	2	0
432647	113556	2	0
432648	113557	2	0
432649	113558	2	0
432650	113559	2	0
432651	113560	2	0
432652	113561	2	0
432653	114050	2	0
432654	114051	2	0
432655	114052	2	0
432656	114053	2	0
432657	114054	2	0
432658	114055	2	0
432659	114056	2	0
432660	114057	2	0
432661	114058	2	0
432662	114059	2	0
432663	114060	2	0
432664	114061	2	0
432665	114062	2	0
432666	114063	2	0
432667	114064	2	0
432668	114065	2	0
432669	114066	2	0
432670	114067	2	0
432671	114068	2	0
432672	114069	2	0
432673	114070	2	0
432674	114071	2	0
432675	114072	2	0
432676	114073	2	0
432677	114074	2	0
432678	114075	2	0
432679	114076	2	0
432680	114077	2	0
432681	114078	2	0
432682	114079	2	0
432683	114080	2	0
432684	114081	2	0
432685	113594	2	0
432686	113595	2	0
432687	113596	2	0
432688	113597	2	0
432689	113598	2	0
432690	113599	2	0
432691	113600	2	0
432692	113601	2	0
432693	113602	2	0
432694	113603	2	0
432695	113604	2	0
432696	113605	2	0
432697	113606	2	0
432698	113607	2	0
432699	113608	2	0
432700	113609	2	0
432701	114082	2	0
432702	114083	2	0
432703	114084	2	0
432704	114085	2	0
432705	114086	2	0
432706	114087	2	0
432707	114088	2	0
432708	114089	2	0
432709	114090	2	0
432710	114091	2	0
432711	114092	2	0
432712	114093	2	0
432713	114094	2	0
432714	114095	2	0
432715	114096	2	0
432716	114097	2	0
432717	114098	2	0
432718	114099	2	0
432719	114100	2	0
432720	114101	2	0
432721	114102	2	0
432722	114103	2	0
432723	114104	2	0
432724	114105	2	0
432725	114106	2	0
432726	114107	2	0
432727	114108	2	0
432728	114109	2	0
432729	114110	2	0
432730	114111	2	0
432731	114112	2	0
432732	114113	2	0
432733	113658	2	0
432734	113659	2	0
432735	113660	2	0
432736	113661	2	0
432737	113662	2	0
432738	113663	2	0
432739	113664	2	0
432740	113665	2	0
432741	113666	2	0
432742	113667	2	0
432743	113668	2	0
432744	113669	2	0
432745	113670	2	0
432746	113671	2	0
432747	113672	2	0
432748	113673	2	0
432749	113674	2	0
432750	113675	2	0
432751	113676	2	0
432752	113677	2	0
432753	113678	2	0
432754	113679	2	0
432755	113680	2	0
432756	113681	2	0
432757	113682	2	0
432758	113683	2	0
432759	113684	2	0
432760	113685	2	0
432761	113686	2	0
432762	113687	2	0
432763	113688	2	0
432764	113689	2	0
432765	113914	2	0
432766	113915	2	0
432767	113916	2	0
432768	113917	2	0
432769	113918	2	0
432770	113919	2	0
432771	113920	2	0
432772	113921	2	0
432773	114114	3	1
432774	114115	3	1
432775	114116	3	1
432776	114117	3	1
432777	114118	3	1
432778	114119	3	1
432779	114120	3	1
432780	114121	3	1
432781	114122	3	1
432782	114123	3	1
432783	114124	3	1
432784	114125	3	1
432785	114126	3	1
432786	114127	3	1
432787	114128	3	1
432788	114129	3	1
432789	114130	3	2
432790	114131	3	2
432791	114132	3	2
432792	114133	3	2
432793	114134	3	2
432794	114135	3	2
432795	114136	3	2
432796	114137	3	2
432797	114138	3	2
432798	114139	3	2
432799	114140	3	2
432800	114141	3	2
432801	114142	3	2
432802	114143	3	2
432803	114144	3	2
432804	114145	3	2
432805	114146	3	0
432806	114147	3	0
432807	114148	3	0
432808	114149	3	0
432809	114150	3	0
432810	114151	3	0
432811	114152	3	0
432812	114153	3	0
432813	114154	3	0
432814	114155	3	0
432815	114156	3	0
432816	114157	3	0
432817	114158	3	0
432818	114159	3	0
432819	114160	3	0
432820	114161	3	0
432821	114162	3	0
432822	114163	3	0
432823	114164	3	0
432824	114165	3	0
432825	114166	3	0
432826	114167	3	0
432827	114168	3	0
432828	114169	3	0
432829	114170	3	0
432830	114171	3	0
432831	114172	3	0
432832	114173	3	0
432833	114174	3	0
432834	114175	3	0
432835	114176	3	0
432836	114177	3	0
432837	113482	3	0
432838	113483	3	0
432839	113484	3	0
432840	113485	3	0
432841	113486	3	0
432842	113487	3	0
432843	113488	3	0
432844	113489	3	0
432845	113490	3	0
432846	113491	3	0
432847	113492	3	0
432848	113493	3	0
432849	113494	3	0
432850	113495	3	0
432851	113496	3	0
432852	113497	3	0
432853	113498	3	0
432854	113499	3	0
432855	113500	3	0
432856	113501	3	0
432857	113502	3	0
432858	113503	3	0
432859	113504	3	0
432860	113505	3	0
432861	113506	3	0
432862	113507	3	0
432863	113508	3	0
432864	113509	3	0
432865	113510	3	0
432866	113511	3	0
432867	113512	3	0
432868	113513	3	0
432869	114178	3	0
432870	114179	3	0
432871	114180	3	0
432872	114181	3	0
432873	114182	3	0
432874	114183	3	0
432875	114184	3	0
432876	114185	3	0
432877	114186	3	0
432878	114187	3	0
432879	114188	3	0
432880	114189	3	0
432881	114190	3	0
432882	114191	3	0
432883	114192	3	0
432884	114193	3	0
432885	114194	3	0
432886	114195	3	0
432887	114196	3	0
432888	114197	3	0
432889	114198	3	0
432890	114199	3	0
432891	114200	3	0
432892	114201	3	0
432893	114202	3	0
432894	114203	3	0
432895	114204	3	0
432896	114205	3	0
432897	114206	3	0
432898	114207	3	0
432899	114208	3	0
432900	114209	3	0
432901	113530	3	0
432902	113531	3	0
432903	113532	3	0
432904	113533	3	0
432905	113534	3	0
432906	113535	3	0
432907	113536	3	0
432908	113537	3	0
432909	113538	3	0
432910	113539	3	0
432911	113540	3	0
432912	113541	3	0
432913	113542	3	0
432914	113543	3	0
432915	113544	3	0
432916	113545	3	0
432917	113546	3	0
432918	113547	3	0
432919	113548	3	0
432920	113549	3	0
432921	113550	3	0
432922	113551	3	0
432923	113552	3	0
432924	113553	3	0
432925	113554	3	0
432926	113555	3	0
432927	113556	3	0
432928	113557	3	0
432929	113558	3	0
432930	113559	3	0
432931	113560	3	0
432932	113561	3	0
432933	114210	3	0
432934	114211	3	0
432935	114212	3	0
432936	114213	3	0
432937	114214	3	0
432938	114215	3	0
432939	114216	3	0
432940	114217	3	0
432941	114218	3	0
432942	114219	3	0
432943	114220	3	0
432944	114221	3	0
432945	114222	3	0
432946	114223	3	0
432947	114224	3	0
432948	114225	3	0
432949	114226	3	0
432950	114227	3	0
432951	114228	3	0
432952	114229	3	0
432953	114230	3	0
432954	114231	3	0
432955	114232	3	0
432956	114233	3	0
432957	114234	3	0
432958	114235	3	0
432959	114236	3	0
432960	114237	3	0
432961	114238	3	0
432962	114239	3	0
432963	114240	3	0
432964	114241	3	0
432965	113594	3	0
432966	113595	3	0
432967	113596	3	0
432968	113597	3	0
432969	113598	3	0
432970	113599	3	0
432971	113600	3	0
432972	113601	3	0
432973	113602	3	0
432974	113603	3	0
432975	113604	3	0
432976	113605	3	0
432977	113606	3	0
432978	113607	3	0
432979	113608	3	0
432980	113609	3	0
432981	114242	3	0
432982	114243	3	0
432983	114244	3	0
432984	114245	3	0
432985	114246	3	0
432986	114247	3	0
432987	114248	3	0
432988	114249	3	0
432989	114250	3	0
432990	114251	3	0
432991	114252	3	0
432992	114253	3	0
432993	114254	3	0
432994	114255	3	0
432995	114256	3	0
432996	114257	3	0
432997	114258	3	0
432998	114259	3	0
432999	114260	3	0
433000	114261	3	0
433001	114262	3	0
433002	114263	3	0
433003	114264	3	0
433004	114265	3	0
433005	114266	3	0
433006	114267	3	0
433007	114268	3	0
433008	114269	3	0
433009	114270	3	0
433010	114271	3	0
433011	114272	3	0
433012	114273	3	0
433013	113658	3	0
433014	113659	3	0
433015	113660	3	0
433016	113661	3	0
433017	113662	3	0
433018	113663	3	0
433019	113664	3	0
433020	113665	3	0
433021	113666	3	0
433022	113667	3	0
433023	113668	3	0
433024	113669	3	0
433025	113670	3	0
433026	113671	3	0
433027	113672	3	0
433028	113673	3	0
433029	113674	3	0
433030	113675	3	0
433031	113676	3	0
433032	113677	3	0
433033	113678	3	0
433034	113679	3	0
433035	113680	3	0
433036	113681	3	0
433037	113682	3	0
433038	113683	3	0
433039	113684	3	0
433040	113685	3	0
433041	113686	3	0
433042	113687	3	0
433043	113688	3	0
433044	113689	3	0
433045	113914	3	0
433046	113915	3	0
433047	113916	3	0
433048	113917	3	0
433049	113918	3	0
433050	113919	3	0
433051	113920	3	0
433052	113921	3	0
433053	114274	3	1
433054	114275	3	1
433055	114276	3	1
433056	114277	3	1
433057	114278	3	1
433058	114279	3	1
433059	114280	3	1
433060	114281	3	1
433061	114282	3	1
433062	114283	3	1
433063	114284	3	1
433064	114285	3	1
433065	114286	3	1
433066	114287	3	1
433067	114288	3	1
433068	114289	3	1
433069	114290	3	2
433070	114291	3	2
433071	114292	3	2
433072	114293	3	2
433073	114294	3	2
433074	114295	3	2
433075	114296	3	2
433076	114297	3	2
433077	114298	3	2
433078	114299	3	2
433079	114300	3	2
433080	114301	3	2
433081	114302	3	2
433082	114303	3	2
433083	114304	3	2
433084	114305	3	2
433085	114306	4	0
433086	114307	4	0
433087	114308	4	0
433088	114309	4	0
433089	114310	4	0
433090	114311	4	0
433091	114312	4	0
433092	114313	4	0
433093	114314	4	0
433094	114315	4	0
433095	114316	4	0
433096	114317	4	0
433097	114318	4	0
433098	114319	4	0
433099	114320	4	0
433100	114321	4	0
433101	114322	4	0
433102	114323	4	0
433103	114324	4	0
433104	114325	4	0
433105	114326	4	0
433106	114327	4	0
433107	114328	4	0
433108	114329	4	0
433109	114330	4	0
433110	114331	4	0
433111	114332	4	0
433112	114333	4	0
433113	114334	4	0
433114	114335	4	0
433115	114336	4	0
433116	114337	4	0
433117	114338	4	0
433118	114339	4	0
433119	114340	4	0
433120	114341	4	0
433121	114342	4	0
433122	114343	4	0
433123	114344	4	0
433124	114345	4	0
433125	114346	4	0
433126	114347	4	0
433127	114348	4	0
433128	114349	4	0
433129	114350	4	0
433130	114351	4	0
433131	114352	4	0
433132	114353	4	0
433133	114354	4	0
433134	114355	4	0
433135	114356	4	0
433136	114357	4	0
433137	114358	4	0
433138	114359	4	0
433139	114360	4	0
433140	114361	4	0
433141	114362	4	0
433142	114363	4	0
433143	114364	4	0
433144	114365	4	0
433145	114366	4	0
433146	114367	4	0
433147	114368	4	0
433148	114369	4	0
433149	114370	4	0
433150	114371	4	0
433151	114372	4	0
433152	114373	4	0
433153	114374	4	0
433154	114375	4	0
433155	114376	4	0
433156	114377	4	0
433157	114378	4	0
433158	114379	4	0
433159	114380	4	0
433160	114381	4	0
433161	114382	4	0
433162	114383	4	0
433163	114384	4	0
433164	114385	4	0
433165	114386	4	0
433166	114387	4	0
433167	114388	4	0
433168	114389	4	0
433169	114390	4	0
433170	114391	4	0
433171	114392	4	0
433172	114393	4	0
433173	114394	4	0
433174	114395	4	0
433175	114396	4	0
433176	114397	4	0
433177	114398	4	0
433178	114399	4	0
433179	114400	4	0
433180	114401	4	0
433181	114402	4	0
433182	114403	4	0
433183	114404	4	0
433184	114405	4	0
433185	114406	4	0
433186	114407	4	0
433187	114408	4	0
433188	114409	4	0
433189	114410	4	0
433190	114411	4	0
433191	114412	4	0
433192	114413	4	0
433193	114414	4	0
433194	114415	4	0
433195	114416	4	0
433196	114417	4	0
433197	114418	4	0
433198	114419	4	0
433199	114420	4	0
433200	114421	4	0
433201	114422	4	0
433202	114423	4	0
433203	114424	4	0
433204	114425	4	0
433205	114426	4	0
433206	114427	4	0
433207	114428	4	0
433208	114429	4	0
433209	114430	4	0
433210	114431	4	0
433211	114432	4	0
433212	114433	4	0
433213	114434	4	0
433214	114435	4	0
433215	114436	4	0
433216	114437	4	0
433217	114438	4	0
433218	114439	4	0
433219	114440	4	0
433220	114441	4	0
433221	114442	4	0
433222	114443	4	0
433223	114444	4	0
433224	114445	4	0
433225	114446	4	0
433226	114447	4	0
433227	114448	4	0
433228	114449	4	0
433229	114450	4	0
433230	114451	4	0
433231	114452	4	0
433232	114453	4	0
433233	114454	4	0
433234	114455	4	0
433235	114456	4	0
433236	114457	4	0
433237	114458	4	0
433238	114459	4	0
433239	114460	4	0
433240	114461	4	0
433241	114462	4	0
433242	114463	4	0
433243	114464	4	0
433244	114465	4	0
433245	114466	4	0
433246	114467	4	0
433247	114468	4	0
433248	114469	4	0
433249	114470	4	0
433250	114471	4	0
433251	114472	4	0
433252	114473	4	0
433253	114474	4	0
433254	114475	4	0
433255	114476	4	0
433256	114477	4	0
433257	114478	4	0
433258	114479	4	0
433259	114480	4	0
433260	114481	4	0
433261	114482	4	0
433262	114483	4	0
433263	114484	4	0
433264	114485	4	0
433265	114486	4	0
433266	114487	4	0
433267	114488	4	0
433268	114489	4	0
433269	114490	4	0
433270	114491	4	0
433271	114492	4	0
433272	114493	4	0
433273	114494	4	0
433274	114495	4	0
433275	114496	4	0
433276	114497	4	0
433277	114498	4	0
433278	114499	4	0
433279	114500	4	0
433280	114501	4	0
433281	114502	4	0
433282	114503	4	0
433283	114504	4	0
433284	114505	4	0
433285	114506	4	0
433286	114507	4	0
433287	114508	4	0
433288	114509	4	0
433289	114510	4	0
433290	114511	4	0
433291	114512	4	0
433292	114513	4	0
433293	114514	4	0
433294	114515	4	0
433295	114516	4	0
433296	114517	4	0
433297	114518	4	0
433298	114519	4	0
433299	114520	4	0
433300	114521	4	0
433301	114522	4	0
433302	114523	4	0
433303	114524	4	0
433304	114525	4	0
433305	114526	4	0
433306	114527	4	0
433307	114528	4	0
433308	114529	4	0
433309	114530	4	0
433310	114531	4	0
433311	114532	4	0
433312	114533	4	0
433313	114534	4	0
433314	114535	4	0
433315	114536	4	0
433316	114537	4	0
433317	114538	4	0
433318	114539	4	0
433319	114540	4	0
433320	114541	4	0
433321	114542	4	0
433322	114543	4	0
433323	114544	4	0
433324	114545	4	0
433325	114546	4	0
433326	114547	4	0
433327	114548	4	0
433328	114549	4	0
433329	114550	4	0
433330	114551	4	0
433331	114552	4	0
433332	114553	4	0
433333	114554	4	0
433334	114555	4	0
433335	114556	4	0
433336	114557	4	0
433337	114558	4	0
433338	114559	4	0
433339	114560	4	0
433340	114561	4	0
433341	114562	4	0
433342	114563	4	0
433343	114564	4	0
433344	114565	4	0
433345	114566	4	0
433346	114567	4	0
433347	114568	4	0
433348	114569	4	0
433349	114570	4	0
433350	114571	4	0
433351	114572	4	0
433352	114573	4	0
433353	114574	4	0
433354	114575	4	0
433355	114576	4	0
433356	114577	4	0
433357	114306	5	0
433358	114307	5	0
433359	114308	5	0
433360	114309	5	0
433361	114310	5	0
433362	114311	5	0
433363	114312	5	0
433364	114313	5	0
433365	114314	5	0
433366	114315	5	0
433367	114316	5	0
433368	114317	5	0
433369	114318	5	0
433370	114319	5	0
433371	114320	5	0
433372	114321	5	0
433373	114578	5	0
433374	114579	5	0
433375	114580	5	0
433376	114581	5	0
433377	114582	5	0
433378	114583	5	0
433379	114584	5	0
433380	114585	5	0
433381	114586	5	0
433382	114587	5	0
433383	114588	5	0
433384	114589	5	0
433385	114590	5	0
433386	114591	5	0
433387	114592	5	0
433388	114593	5	0
433389	114594	5	0
433390	114595	5	0
433391	114596	5	0
433392	114597	5	0
433393	114598	5	0
433394	114599	5	0
433395	114600	5	0
433396	114601	5	0
433397	114602	5	0
433398	114603	5	0
433399	114604	5	0
433400	114605	5	0
433401	114606	5	0
433402	114607	5	0
433403	114608	5	0
433404	114609	5	0
433405	114610	5	0
433406	114611	5	0
433407	114612	5	0
433408	114613	5	0
433409	114614	5	0
433410	114615	5	0
433411	114616	5	0
433412	114617	5	0
433413	114618	5	0
433414	114619	5	0
433415	114620	5	0
433416	114621	5	0
433417	114622	5	0
433418	114623	5	0
433419	114624	5	0
433420	114625	5	0
433421	114386	5	0
433422	114387	5	0
433423	114388	5	0
433424	114389	5	0
433425	114390	5	0
433426	114391	5	0
433427	114392	5	0
433428	114393	5	0
433429	114394	5	0
433430	114395	5	0
433431	114396	5	0
433432	114397	5	0
433433	114398	5	0
433434	114399	5	0
433435	114400	5	0
433436	114401	5	0
433437	114626	5	0
433438	114627	5	0
433439	114628	5	0
433440	114629	5	0
433441	114630	5	0
433442	114631	5	0
433443	114632	5	0
433444	114633	5	0
433445	114634	5	0
433446	114635	5	0
433447	114636	5	0
433448	114637	5	0
433449	114638	5	0
433450	114639	5	0
433451	114640	5	0
433452	114641	5	0
433453	114642	5	0
433454	114643	5	0
433455	114644	5	0
433456	114645	5	0
433457	114646	5	0
433458	114647	5	0
433459	114648	5	0
433460	114649	5	0
433461	114418	5	0
433462	114419	5	0
433463	114420	5	0
433464	114421	5	0
433465	114422	5	0
433466	114423	5	0
433467	114424	5	0
433468	114425	5	0
433469	114650	5	0
433470	114651	5	0
433471	114652	5	0
433472	114653	5	0
433473	114654	5	0
433474	114655	5	0
433475	114656	5	0
433476	114657	5	0
433477	114658	5	0
433478	114659	5	0
433479	114660	5	0
433480	114661	5	0
433481	114662	5	0
433482	114663	5	0
433483	114664	5	0
433484	114665	5	0
433485	114666	5	0
433486	114667	5	0
433487	114668	5	0
433488	114669	5	0
433489	114670	5	0
433490	114671	5	0
433491	114672	5	0
433492	114673	5	0
433493	114674	5	0
433494	114675	5	0
433495	114676	5	0
433496	114677	5	0
433497	114678	5	0
433498	114679	5	0
433499	114680	5	0
433500	114681	5	0
433501	114682	5	0
433502	114683	5	0
433503	114684	5	0
433504	114685	5	0
433505	114686	5	0
433506	114687	5	0
433507	114688	5	0
433508	114689	5	0
433509	114466	5	0
433510	114467	5	0
433511	114468	5	0
433512	114469	5	0
433513	114470	5	0
433514	114471	5	0
433515	114472	5	0
433516	114473	5	0
433517	114474	5	0
433518	114475	5	0
433519	114476	5	0
433520	114477	5	0
433521	114478	5	0
433522	114479	5	0
433523	114480	5	0
433524	114481	5	0
433525	114482	5	0
433526	114483	5	0
433527	114484	5	0
433528	114485	5	0
433529	114486	5	0
433530	114487	5	0
433531	114488	5	0
433532	114489	5	0
433533	114490	5	0
433534	114491	5	0
433535	114492	5	0
433536	114493	5	0
433537	114494	5	0
433538	114495	5	0
433539	114496	5	0
433540	114497	5	0
433541	114690	5	0
433542	114691	5	0
433543	114692	5	0
433544	114693	5	0
433545	114694	5	0
433546	114695	5	0
433547	114696	5	0
433548	114697	5	0
433549	114506	5	0
433550	114507	5	0
433551	114508	5	0
433552	114509	5	0
433553	114510	5	0
433554	114511	5	0
433555	114512	5	0
433556	114513	5	0
433557	114514	5	0
433558	114515	5	0
433559	114516	5	0
433560	114517	5	0
433561	114518	5	0
433562	114519	5	0
433563	114520	5	0
433564	114521	5	0
433565	114698	5	0
433566	114699	5	0
433567	114700	5	0
433568	114701	5	0
433569	114702	5	0
433570	114703	5	0
433571	114704	5	0
433572	114705	5	0
433573	114706	5	0
433574	114707	5	0
433575	114708	5	0
433576	114709	5	0
433577	114710	5	0
433578	114711	5	0
433579	114712	5	0
433580	114713	5	0
433581	114714	5	0
433582	114715	5	0
433583	114716	5	0
433584	114717	5	0
433585	114718	5	0
433586	114719	5	0
433587	114720	5	0
433588	114721	5	0
433589	114722	5	0
433590	114723	5	0
433591	114724	5	0
433592	114725	5	0
433593	114726	5	0
433594	114727	5	0
433595	114728	5	0
433596	114729	5	0
433597	114538	5	0
433598	114539	5	0
433599	114540	5	0
433600	114541	5	0
433601	114542	5	0
433602	114543	5	0
433603	114544	5	0
433604	114545	5	0
433605	114730	5	0
433606	114731	5	0
433607	114732	5	0
433608	114733	5	0
433609	114734	5	0
433610	114735	5	0
433611	114736	5	0
433612	114737	5	0
433613	114738	5	0
433614	114739	5	0
433615	114740	5	0
433616	114741	5	0
433617	114742	5	0
433618	114743	5	0
433619	114744	5	0
433620	114745	5	0
433621	114746	5	0
433622	114747	5	0
433623	114748	5	0
433624	114749	5	0
433625	114750	5	0
433626	114751	5	0
433627	114752	5	0
433628	114753	5	0
433629	114754	6	0
433630	114755	6	0
433631	114756	6	0
433632	114757	6	0
433633	114758	6	0
433634	114759	6	0
433635	114760	6	0
433636	114761	6	0
433637	114762	6	0
433638	114763	6	0
433639	114764	6	0
433640	114765	6	0
433641	114766	6	0
433642	114767	6	0
433643	114768	6	0
433644	114769	6	0
433645	114770	6	0
433646	114771	6	0
433647	114772	6	0
433648	114773	6	0
433649	114774	6	0
433650	114775	6	0
433651	114776	6	0
433652	114777	6	0
433653	114778	6	0
433654	114779	6	0
433655	114780	6	0
433656	114781	6	0
433657	114782	6	0
433658	114783	6	0
433659	114784	6	0
433660	114785	6	0
433661	114786	6	0
433662	114787	6	0
433663	114788	6	0
433664	114789	6	0
433665	114790	6	0
433666	114791	6	0
433667	114792	6	0
433668	114793	6	0
433669	114794	6	0
433670	114795	6	0
433671	114796	6	0
433672	114797	6	0
433673	114798	6	0
433674	114799	6	0
433675	114800	6	0
433676	114801	6	0
433677	114802	6	0
433678	114803	6	0
433679	114804	6	0
433680	114805	6	0
433681	114806	6	0
433682	114807	6	0
433683	114808	6	0
433684	114809	6	0
433685	114810	6	0
433686	114811	6	0
433687	114812	6	0
433688	114813	6	0
433689	114814	6	0
433690	114815	6	0
433691	114816	6	0
433692	114817	6	0
433693	114818	6	0
433694	114819	6	0
433695	114820	6	0
433696	114821	6	0
433697	114822	6	0
433698	114823	6	0
433699	114824	6	0
433700	114825	6	0
433701	114826	6	0
433702	114827	6	0
433703	114828	6	0
433704	114829	6	0
433705	114830	6	0
433706	114831	6	0
433707	114832	6	0
433708	114833	6	0
433709	114834	6	0
433710	114835	6	0
433711	114836	6	0
433712	114837	6	0
433713	114838	6	0
433714	114839	6	0
433715	114840	6	0
433716	114841	6	0
433717	114842	6	0
433718	114843	6	0
433719	114844	6	0
433720	114845	6	0
433721	114846	6	0
433722	114847	6	0
433723	114848	6	0
433724	114849	6	0
433725	114850	6	0
433726	114851	6	0
433727	114852	6	0
433728	114853	6	0
433729	114854	6	0
433730	114855	6	0
433731	114856	6	0
433732	114857	6	0
433733	114858	6	0
433734	114859	6	0
433735	114860	6	0
433736	114861	6	0
433737	114862	6	0
433738	114863	6	0
433739	114864	6	0
433740	114865	6	0
433741	114866	6	0
433742	114867	6	0
433743	114868	6	0
433744	114869	6	0
433745	114870	6	0
433746	114871	6	0
433747	114872	6	0
433748	114873	6	0
433749	114874	6	0
433750	114875	6	0
433751	114876	6	0
433752	114877	6	0
433753	114878	6	0
433754	114879	6	0
433755	114880	6	0
433756	114881	6	0
433757	114882	6	0
433758	114883	6	0
433759	114884	6	0
433760	114885	6	0
433761	114886	6	0
433762	114887	6	0
433763	114888	6	0
433764	114889	6	0
433765	114890	6	0
433766	114891	6	0
433767	114892	6	0
433768	114893	6	0
433769	114894	6	0
433770	114895	6	0
433771	114896	6	0
433772	114897	6	0
433773	114898	6	0
433774	114899	6	0
433775	114900	6	0
433776	114901	6	0
433777	114902	6	0
433778	114903	6	0
433779	114904	6	0
433780	114905	6	0
433781	114906	6	0
433782	114907	6	0
433783	114908	6	0
433784	114909	6	0
433785	114910	6	0
433786	114911	6	0
433787	114912	6	0
433788	114913	6	0
433789	114914	6	0
433790	114915	6	0
433791	114916	6	0
433792	114917	6	0
433793	114918	6	0
433794	114919	6	0
433795	114920	6	0
433796	114921	6	0
433797	114922	6	0
433798	114923	6	0
433799	114924	6	0
433800	114925	6	0
433801	114926	6	0
433802	114927	6	0
433803	114928	6	0
433804	114929	6	0
433805	114930	6	0
433806	114931	6	0
433807	114932	6	0
433808	114933	6	0
433809	114934	6	0
433810	114935	6	0
433811	114936	6	0
433812	114937	6	0
433813	114938	6	0
433814	114939	6	0
433815	114940	6	0
433816	114941	6	0
433817	114942	6	0
433818	114943	6	0
433819	114944	6	0
433820	114945	6	0
433821	114946	6	0
433822	114947	6	0
433823	114948	6	0
433824	114949	6	0
433825	114950	6	0
433826	114951	6	0
433827	114952	6	0
433828	114953	6	0
433829	114954	6	0
433830	114955	6	0
433831	114956	6	0
433832	114957	6	0
433833	114958	6	0
433834	114959	6	0
433835	114960	6	0
433836	114961	6	0
433837	114962	6	0
433838	114963	6	0
433839	114964	6	0
433840	114965	6	0
433841	114966	6	0
433842	114967	6	0
433843	114968	6	0
433844	114969	6	0
433845	114970	6	0
433846	114971	6	0
433847	114972	6	0
433848	114973	6	0
433849	114974	6	0
433850	114975	6	0
433851	114976	6	0
433852	114977	6	0
433853	114978	6	0
433854	114979	6	0
433855	114980	6	0
433856	114981	6	0
433857	114982	6	0
433858	114983	6	0
433859	114984	6	0
433860	114985	6	0
433861	114986	6	0
433862	114987	6	0
433863	114988	6	0
433864	114989	6	0
433865	114990	6	0
433866	114991	6	0
433867	114992	6	0
433868	114993	6	0
433869	114994	6	0
433870	114995	6	0
433871	114996	6	0
433872	114997	6	0
433873	114998	6	0
433874	114999	6	0
433875	115000	6	0
433876	115001	6	0
433877	115002	6	0
433878	115003	6	0
433879	115004	6	0
433880	115005	6	0
433881	115006	6	0
433882	115007	6	0
433883	115008	6	0
433884	115009	6	0
433885	115010	6	0
433886	115011	6	0
433887	115012	6	0
433888	115013	6	0
433889	115014	6	0
433890	115015	6	0
433891	115016	6	0
433892	115017	6	0
433893	115018	6	0
433894	115019	6	0
433895	115020	6	0
433896	115021	6	0
433897	115022	6	0
433898	115023	6	0
433899	115024	6	0
433900	115025	6	0
433901	115026	6	0
433902	115027	6	0
433903	115028	6	0
433904	115029	6	0
433905	115030	6	0
433906	115031	6	0
433907	115032	6	0
433908	115033	6	0
433909	115034	6	0
433910	115035	6	0
433911	115036	6	0
433912	115037	6	0
433913	115038	6	0
433914	115039	6	0
433915	115040	6	0
433916	115041	6	0
433917	115042	6	0
433918	115043	6	0
433919	115044	6	0
433920	115045	6	0
433921	115046	6	0
433922	115047	6	0
433923	115048	6	0
433924	115049	6	0
433925	115050	6	0
433926	115051	6	0
433927	115052	6	0
433928	115053	6	0
433929	115054	6	0
433930	115055	6	0
433931	115056	6	0
433932	115057	6	0
433933	115058	6	0
433934	115059	6	0
433935	115060	6	0
433936	115061	6	0
433937	115062	6	0
433938	115063	6	0
433939	115064	6	0
433940	115065	6	0
433941	115066	6	0
433942	115067	6	0
433943	115068	6	0
433944	115069	6	0
433945	115070	6	0
433946	115071	6	0
433947	115072	6	0
433948	115073	6	0
433949	115074	6	0
433950	115075	6	0
433951	115076	6	0
433952	115077	6	0
433953	115078	6	0
433954	115079	6	0
433955	115080	6	0
433956	115081	6	0
433957	115082	6	0
433958	115083	6	0
433959	115084	6	0
433960	115085	6	0
433961	115086	6	0
433962	115087	6	0
433963	115088	6	0
433964	115089	6	0
433965	115090	6	0
433966	115091	6	0
433967	115092	6	0
433968	115093	6	0
433969	115094	6	0
433970	115095	6	0
433971	115096	6	0
433972	115097	6	0
433973	115098	6	0
433974	115099	6	0
433975	115100	6	0
433976	115101	6	0
433977	115102	6	0
433978	115103	6	0
433979	115104	6	0
433980	115105	6	0
433981	115106	6	0
433982	115107	6	0
433983	115108	6	0
433984	115109	6	0
433985	115110	6	0
433986	115111	6	0
433987	115112	6	0
433988	115113	6	0
433989	115114	6	0
433990	115115	6	0
433991	115116	6	0
433992	115117	6	0
433993	115118	6	0
433994	115119	6	0
433995	115120	6	0
433996	115121	6	0
433997	115122	6	0
433998	115123	6	0
433999	115124	6	0
434000	115125	6	0
434001	115126	6	0
434002	115127	6	0
434003	115128	6	0
434004	115129	6	0
434005	115130	7	0
434006	115131	7	0
434007	115132	7	0
434008	115133	7	0
434009	115134	7	0
434010	115135	7	0
434011	115136	7	0
434012	115137	7	0
434013	115138	7	0
434014	115139	7	0
434015	115140	7	0
434016	115141	7	0
434017	115142	7	0
434018	115143	7	0
434019	115144	7	0
434020	115145	7	0
434021	115146	7	0
434022	115147	7	0
434023	115148	7	0
434024	115149	7	0
434025	115150	7	0
434026	115151	7	0
434027	115152	7	0
434028	115153	7	0
434029	115154	7	0
434030	115155	7	0
434031	115156	7	0
434032	115157	7	0
434033	115158	7	0
434034	115159	7	0
434035	115160	7	0
434036	115161	7	0
434037	115162	7	0
434038	115163	7	0
434039	115164	7	0
434040	115165	7	0
434041	115166	7	0
434042	115167	7	0
434043	115168	7	0
434044	115169	7	0
434045	115170	7	0
434046	115171	7	0
434047	115172	7	0
434048	115173	7	0
434049	115174	7	0
434050	115175	7	0
434051	115176	7	0
434052	115177	7	0
434053	115178	7	0
434054	115179	7	0
434055	115180	7	0
434056	115181	7	0
434057	115182	7	0
434058	115183	7	0
434059	115184	7	0
434060	115185	7	0
434061	115186	7	0
434062	115187	7	0
434063	115188	7	0
434064	115189	7	0
434065	115190	7	0
434066	115191	7	0
434067	115192	7	0
434068	115193	7	0
434069	114818	7	0
434070	114819	7	0
434071	114820	7	0
434072	114821	7	0
434073	114822	7	0
434074	114823	7	0
434075	114824	7	0
434076	114825	7	0
434077	114826	7	0
434078	114827	7	0
434079	114828	7	0
434080	114829	7	0
434081	114830	7	0
434082	114831	7	0
434083	114832	7	0
434084	114833	7	0
434085	114834	7	0
434086	114835	7	0
434087	114836	7	0
434088	114837	7	0
434089	114838	7	0
434090	114839	7	0
434091	114840	7	0
434092	114841	7	0
434093	115194	7	0
434094	115195	7	0
434095	115196	7	0
434096	115197	7	0
434097	115198	7	0
434098	115199	7	0
434099	115200	7	0
434100	115201	7	0
434101	114850	7	0
434102	114851	7	0
434103	114852	7	0
434104	114853	7	0
434105	114854	7	0
434106	114855	7	0
434107	114856	7	0
434108	114857	7	0
434109	114858	7	0
434110	114859	7	0
434111	114860	7	0
434112	114861	7	0
434113	114862	7	0
434114	114863	7	0
434115	114864	7	0
434116	114865	7	0
434117	114866	7	0
434118	114867	7	0
434119	114868	7	0
434120	114869	7	0
434121	114870	7	0
434122	114871	7	0
434123	114872	7	0
434124	114873	7	0
434125	114874	7	0
434126	114875	7	0
434127	114876	7	0
434128	114877	7	0
434129	114878	7	0
434130	114879	7	0
434131	114880	7	0
434132	114881	7	0
434133	114882	7	0
434134	114883	7	0
434135	114884	7	0
434136	114885	7	0
434137	114886	7	0
434138	114887	7	0
434139	114888	7	0
434140	114889	7	0
434141	114890	7	0
434142	114891	7	0
434143	114892	7	0
434144	114893	7	0
434145	114894	7	0
434146	114895	7	0
434147	114896	7	0
434148	114897	7	0
434149	114898	7	0
434150	114899	7	0
434151	114900	7	0
434152	114901	7	0
434153	114902	7	0
434154	114903	7	0
434155	114904	7	0
434156	114905	7	0
434157	114906	7	0
434158	114907	7	0
434159	114908	7	0
434160	114909	7	0
434161	114910	7	0
434162	114911	7	0
434163	114912	7	0
434164	114913	7	0
434165	114914	7	0
434166	114915	7	0
434167	114916	7	0
434168	114917	7	0
434169	114918	7	0
434170	114919	7	0
434171	114920	7	0
434172	114921	7	0
434173	114922	7	0
434174	114923	7	0
434175	114924	7	0
434176	114925	7	0
434177	114926	7	0
434178	114927	7	0
434179	114928	7	0
434180	114929	7	0
434181	115202	7	0
434182	115203	7	0
434183	115204	7	0
434184	115205	7	0
434185	115206	7	0
434186	115207	7	0
434187	115208	7	0
434188	115209	7	0
434189	115210	7	0
434190	115211	7	0
434191	115212	7	0
434192	115213	7	0
434193	115214	7	0
434194	115215	7	0
434195	115216	7	0
434196	115217	7	0
434197	114946	7	0
434198	114947	7	0
434199	114948	7	0
434200	114949	7	0
434201	114950	7	0
434202	114951	7	0
434203	114952	7	0
434204	114953	7	0
434205	114954	7	0
434206	114955	7	0
434207	114956	7	0
434208	114957	7	0
434209	114958	7	0
434210	114959	7	0
434211	114960	7	0
434212	114961	7	0
434213	115218	7	0
434214	115219	7	0
434215	115220	7	0
434216	115221	7	0
434217	115222	7	0
434218	115223	7	0
434219	115224	7	0
434220	115225	7	0
434221	115226	7	0
434222	115227	7	0
434223	115228	7	0
434224	115229	7	0
434225	115230	7	0
434226	115231	7	0
434227	115232	7	0
434228	115233	7	0
434229	115234	7	0
434230	115235	7	0
434231	115236	7	0
434232	115237	7	0
434233	115238	7	0
434234	115239	7	0
434235	115240	7	0
434236	115241	7	0
434237	115242	7	0
434238	115243	7	0
434239	115244	7	0
434240	115245	7	0
434241	115246	7	0
434242	115247	7	0
434243	115248	7	0
434244	115249	7	0
434245	115250	7	0
434246	115251	7	0
434247	115252	7	0
434248	115253	7	0
434249	115254	7	0
434250	115255	7	0
434251	115256	7	0
434252	115257	7	0
434253	115258	7	0
434254	115259	7	0
434255	115260	7	0
434256	115261	7	0
434257	115262	7	0
434258	115263	7	0
434259	115264	7	0
434260	115265	7	0
434261	115266	7	0
434262	115267	7	0
434263	115268	7	0
434264	115269	7	0
434265	115270	7	0
434266	115271	7	0
434267	115272	7	0
434268	115273	7	0
434269	115274	7	0
434270	115275	7	0
434271	115276	7	0
434272	115277	7	0
434273	115278	7	0
434274	115279	7	0
434275	115280	7	0
434276	115281	7	0
434277	115026	7	0
434278	115027	7	0
434279	115028	7	0
434280	115029	7	0
434281	115030	7	0
434282	115031	7	0
434283	115032	7	0
434284	115033	7	0
434285	115034	7	0
434286	115035	7	0
434287	115036	7	0
434288	115037	7	0
434289	115038	7	0
434290	115039	7	0
434291	115040	7	0
434292	115041	7	0
434293	115042	7	0
434294	115043	7	0
434295	115044	7	0
434296	115045	7	0
434297	115046	7	0
434298	115047	7	0
434299	115048	7	0
434300	115049	7	0
434301	115050	7	0
434302	115051	7	0
434303	115052	7	0
434304	115053	7	0
434305	115054	7	0
434306	115055	7	0
434307	115056	7	0
434308	115057	7	0
434309	115058	7	0
434310	115059	7	0
434311	115060	7	0
434312	115061	7	0
434313	115062	7	0
434314	115063	7	0
434315	115064	7	0
434316	115065	7	0
434317	115282	7	0
434318	115283	7	0
434319	115284	7	0
434320	115285	7	0
434321	115286	7	0
434322	115287	7	0
434323	115288	7	0
434324	115289	7	0
434325	115290	7	0
434326	115291	7	0
434327	115292	7	0
434328	115293	7	0
434329	115294	7	0
434330	115295	7	0
434331	115296	7	0
434332	115297	7	0
434333	115298	7	0
434334	115299	7	0
434335	115300	7	0
434336	115301	7	0
434337	115302	7	0
434338	115303	7	0
434339	115304	7	0
434340	115305	7	0
434341	115306	7	0
434342	115307	7	0
434343	115308	7	0
434344	115309	7	0
434345	115310	7	0
434346	115311	7	0
434347	115312	7	0
434348	115313	7	0
434349	115314	7	0
434350	115315	7	0
434351	115316	7	0
434352	115317	7	0
434353	115318	7	0
434354	115319	7	0
434355	115320	7	0
434356	115321	7	0
434357	115322	7	0
434358	115323	7	0
434359	115324	7	0
434360	115325	7	0
434361	115326	7	0
434362	115327	7	0
434363	115328	7	0
434364	115329	7	0
434365	115114	7	0
434366	115115	7	0
434367	115116	7	0
434368	115117	7	0
434369	115118	7	0
434370	115119	7	0
434371	115120	7	0
434372	115121	7	0
434373	115122	7	0
434374	115123	7	0
434375	115124	7	0
434376	115125	7	0
434377	115126	7	0
434378	115127	7	0
434379	115128	7	0
434380	115129	7	0
434381	115330	8	0
434382	115331	8	0
434383	115332	8	0
434384	115333	8	0
434385	115334	8	0
434386	115335	8	0
434387	115336	8	0
434388	115337	8	0
434389	115338	8	0
434390	115339	8	0
434391	115340	8	0
434392	115341	8	0
434393	115342	8	0
434394	115343	8	0
434395	115344	8	0
434396	115345	8	0
434397	115346	8	0
434398	115347	8	0
434399	115348	8	0
434400	115349	8	0
434401	115350	8	0
434402	115351	8	0
434403	115352	8	0
434404	115353	8	0
434405	115354	8	0
434406	115355	8	0
434407	115356	8	0
434408	115357	8	0
434409	115358	8	0
434410	115359	8	0
434411	115360	8	0
434412	115361	8	0
434413	115362	8	0
434414	115363	8	0
434415	115364	8	0
434416	115365	8	0
434417	115366	8	0
434418	115367	8	0
434419	115368	8	0
434420	115369	8	0
434421	115370	8	0
434422	115371	8	0
434423	115372	8	0
434424	115373	8	0
434425	115374	8	0
434426	115375	8	0
434427	115376	8	0
434428	115377	8	0
434429	115378	8	0
434430	115379	8	0
434431	115380	8	0
434432	115381	8	0
434433	115382	8	0
434434	115383	8	0
434435	115384	8	0
434436	115385	8	0
434437	115386	8	0
434438	115387	8	0
434439	115388	8	0
434440	115389	8	0
434441	115390	8	0
434442	115391	8	0
434443	115392	8	0
434444	115393	8	0
434445	115394	8	0
434446	115395	8	0
434447	115396	8	0
434448	115397	8	0
434449	115398	8	0
434450	115399	8	0
434451	115400	8	0
434452	115401	8	0
434453	115402	8	0
434454	115403	8	0
434455	115404	8	0
434456	115405	8	0
434457	115406	8	0
434458	115407	8	0
434459	115408	8	0
434460	115409	8	0
434461	115410	8	0
434462	115411	8	0
434463	115412	8	0
434464	115413	8	0
434465	115414	8	0
434466	115415	8	0
434467	115416	8	0
434468	115417	8	0
434469	115418	8	0
434470	115419	8	0
434471	115420	8	0
434472	115421	8	0
434473	115422	8	0
434474	115423	8	0
434475	115424	8	0
434476	115425	8	0
434477	115426	8	0
434478	115427	8	0
434479	115428	8	0
434480	115429	8	0
434481	115430	8	0
434482	115431	8	0
434483	115432	8	0
434484	115433	8	0
434485	115434	8	0
434486	115435	8	0
434487	115436	8	0
434488	115437	8	0
434489	115438	8	0
434490	115439	8	0
434491	115440	8	0
434492	115441	8	0
434493	115442	8	0
434494	115443	8	0
434495	115444	8	0
434496	115445	8	0
434497	115446	8	0
434498	115447	8	0
434499	115448	8	0
434500	115449	8	0
434501	115450	8	0
434502	115451	8	0
434503	115452	8	0
434504	115453	8	0
434505	115454	8	0
434506	115455	8	0
434507	115456	8	0
434508	115457	8	0
434509	115458	8	0
434510	115459	8	0
434511	115460	8	0
434512	115461	8	0
434513	115462	8	0
434514	115463	8	0
434515	115464	8	0
434516	115465	8	0
434517	115466	8	0
434518	115467	8	0
434519	115468	8	0
434520	115469	8	0
434521	115470	8	0
434522	115471	8	0
434523	115472	8	0
434524	115473	8	0
434525	115474	8	0
434526	115475	8	0
434527	115476	8	0
434528	115477	8	0
434529	115478	8	0
434530	115479	8	0
434531	115480	8	0
434532	115481	8	0
434533	115482	8	0
434534	115483	8	0
434535	115484	8	0
434536	115485	8	0
434537	115486	8	0
434538	115487	8	0
434539	115488	8	0
434540	115489	8	0
434541	115490	8	0
434542	115491	8	0
434543	115492	8	0
434544	115493	8	0
434545	115494	8	0
434546	115495	8	0
434547	115496	8	0
434548	115497	8	0
434549	115498	8	0
434550	115499	8	0
434551	115500	8	0
434552	115501	8	0
434553	115502	8	0
434554	115503	8	0
434555	115504	8	0
434556	115505	8	0
434557	115506	8	0
434558	115507	8	0
434559	115508	8	0
434560	115509	8	0
434561	115510	8	0
434562	115511	8	0
434563	115512	8	0
434564	115513	8	0
434565	115514	8	0
434566	115515	8	0
434567	115516	8	0
434568	115517	8	0
434569	115518	8	0
434570	115519	8	0
434571	115520	8	0
434572	115521	8	0
434573	115522	8	0
434574	115523	8	0
434575	115524	8	0
434576	115525	8	0
434577	115526	8	0
434578	115527	8	0
434579	115528	8	0
434580	115529	8	0
434581	115530	8	0
434582	115531	8	0
434583	115532	8	0
434584	115533	8	0
434585	115534	8	0
434586	115535	8	0
434587	115536	8	0
434588	115537	8	0
434589	115538	8	0
434590	115539	8	0
434591	115540	8	0
434592	115541	8	0
434593	115542	8	0
434594	115543	8	0
434595	115544	8	0
434596	115545	8	0
434597	115546	8	0
434598	115547	8	0
434599	115548	8	0
434600	115549	8	0
434601	115550	8	0
434602	115551	8	0
434603	115552	8	0
434604	115553	8	0
434605	115554	8	0
434606	115555	8	0
434607	115556	8	0
434608	115557	8	0
434609	115330	9	0
434610	115331	9	0
434611	115332	9	0
434612	115333	9	0
434613	115334	9	0
434614	115335	9	0
434615	115336	9	0
434616	115337	9	0
434617	115338	9	0
434618	115339	9	0
434619	115340	9	0
434620	115341	9	0
434621	115342	9	0
434622	115343	9	0
434623	115344	9	0
434624	115345	9	0
434625	115346	9	0
434626	115347	9	0
434627	115348	9	0
434628	115349	9	0
434629	115350	9	0
434630	115351	9	0
434631	115352	9	0
434632	115353	9	0
434633	115354	9	0
434634	115355	9	0
434635	115356	9	0
434636	115357	9	0
434637	115358	9	0
434638	115359	9	0
434639	115360	9	0
434640	115361	9	0
434641	115362	9	0
434642	115363	9	0
434643	115364	9	0
434644	115365	9	0
434645	115558	9	0
434646	115559	9	0
434647	115560	9	0
434648	115561	9	0
434649	115562	9	0
434650	115563	9	0
434651	115564	9	0
434652	115565	9	0
434653	115566	9	0
434654	115567	9	0
434655	115568	9	0
434656	115569	9	0
434657	115570	9	0
434658	115571	9	0
434659	115572	9	0
434660	115573	9	0
434661	115574	9	0
434662	115575	9	0
434663	115576	9	0
434664	115577	9	0
434665	115578	9	0
434666	115579	9	0
434667	115580	9	0
434668	115581	9	0
434669	115582	9	0
434670	115583	9	0
434671	115584	9	0
434672	115585	9	0
434673	115586	9	0
434674	115587	9	0
434675	115588	9	0
434676	115589	9	0
434677	115590	9	0
434678	115591	9	0
434679	115592	9	0
434680	115593	9	0
434681	115594	9	0
434682	115595	9	0
434683	115596	9	0
434684	115597	9	0
434685	115598	9	0
434686	115599	9	0
434687	115600	9	0
434688	115601	9	0
434689	115602	9	0
434690	115603	9	0
434691	115604	9	0
434692	115605	9	0
434693	115606	9	0
434694	115607	9	0
434695	115608	9	0
434696	115609	9	0
434697	115610	9	0
434698	115611	9	0
434699	115612	9	0
434700	115613	9	0
434701	115614	9	0
434702	115615	9	0
434703	115616	9	0
434704	115617	9	0
434705	115618	9	0
434706	115619	9	0
434707	115620	9	0
434708	115621	9	0
434709	115430	9	0
434710	115431	9	0
434711	115432	9	0
434712	115433	9	0
434713	115434	9	0
434714	115435	9	0
434715	115436	9	0
434716	115437	9	0
434717	115438	9	0
434718	115439	9	0
434719	115440	9	0
434720	115441	9	0
434721	115442	9	0
434722	115443	9	0
434723	115444	9	0
434724	115445	9	0
434725	115446	9	0
434726	115447	9	0
434727	115448	9	0
434728	115449	9	0
434729	115450	9	0
434730	115451	9	0
434731	115452	9	0
434732	115453	9	0
434733	115454	9	0
434734	115455	9	0
434735	115456	9	0
434736	115457	9	0
434737	115458	9	0
434738	115459	9	0
434739	115460	9	0
434740	115461	9	0
434741	115462	9	0
434742	115463	9	0
434743	115464	9	0
434744	115465	9	0
434745	115466	9	0
434746	115467	9	0
434747	115468	9	0
434748	115469	9	0
434749	115470	9	0
434750	115471	9	0
434751	115472	9	0
434752	115473	9	0
434753	115474	9	0
434754	115475	9	0
434755	115476	9	0
434756	115477	9	0
434757	115622	9	0
434758	115623	9	0
434759	115624	9	0
434760	115625	9	0
434761	115626	9	0
434762	115627	9	0
434763	115628	9	0
434764	115629	9	0
434765	115630	9	0
434766	115631	9	0
434767	115632	9	0
434768	115633	9	0
434769	115634	9	0
434770	115635	9	0
434771	115636	9	0
434772	115637	9	0
434773	115638	9	0
434774	115639	9	0
434775	115640	9	0
434776	115641	9	0
434777	115642	9	0
434778	115643	9	0
434779	115644	9	0
434780	115645	9	0
434781	115646	9	0
434782	115647	9	0
434783	115648	9	0
434784	115649	9	0
434785	115650	9	0
434786	115651	9	0
434787	115652	9	0
434788	115653	9	0
434789	115654	9	0
434790	115655	9	0
434791	115656	9	0
434792	115657	9	0
434793	115658	9	0
434794	115659	9	0
434795	115660	9	0
434796	115661	9	0
434797	115662	9	0
434798	115663	9	0
434799	115664	9	0
434800	115665	9	0
434801	115666	9	0
434802	115667	9	0
434803	115668	9	0
434804	115669	9	0
434805	115670	9	0
434806	115671	9	0
434807	115672	9	0
434808	115673	9	0
434809	115674	9	0
434810	115675	9	0
434811	115676	9	0
434812	115677	9	0
434813	115678	9	0
434814	115679	9	0
434815	115680	9	0
434816	115681	9	0
434817	115682	9	0
434818	115683	9	0
434819	115684	9	0
434820	115685	9	0
434821	115686	9	0
434822	115687	9	0
434823	115688	9	0
434824	115689	9	0
434825	115690	9	0
434826	115691	9	0
434827	115692	9	0
434828	115693	9	0
434829	115694	9	0
434830	115695	9	0
434831	115696	9	0
434832	115697	9	0
434833	115698	9	0
434834	115699	9	0
434835	115700	9	0
434836	115701	9	0
434837	115702	10	1
434838	115703	10	1
434839	115704	10	1
434840	115705	10	1
434841	115706	10	1
434842	115707	10	1
434843	115708	10	1
434844	115709	10	1
434845	115710	10	1
434846	115711	10	1
434847	115712	10	1
434848	115713	10	1
434849	115714	10	1
434850	115715	10	1
434851	115716	10	1
434852	115717	10	1
434853	115718	10	1
434854	115719	10	1
434855	115720	10	1
434856	115721	10	1
434857	115722	10	1
434858	115723	10	1
434859	115724	10	1
434860	115725	10	1
434861	115726	10	1
434862	115727	10	1
434863	115728	10	1
434864	115729	10	1
434865	115730	10	1
434866	115731	10	1
434867	115732	10	1
434868	115733	10	1
434869	115734	10	1
434870	115735	10	1
434871	115736	10	1
434872	115737	10	1
434873	115738	10	1
434874	115739	10	1
434875	115740	10	1
434876	115741	10	1
434877	115742	10	1
434878	115743	10	1
434879	115744	10	1
434880	115745	10	1
434881	115746	10	1
434882	115747	10	1
434883	115748	10	1
434884	115749	10	1
434885	115750	10	1
434886	115751	10	1
434887	115752	10	1
434888	115753	10	1
434889	115754	10	1
434890	115755	10	1
434891	115756	10	1
434892	115757	10	1
434893	115758	10	1
434894	115759	10	1
434895	115760	10	1
434896	115761	10	1
434897	115762	10	1
434898	115763	10	1
434899	115764	10	1
434900	115765	10	1
434901	115766	10	1
434902	115767	10	1
434903	115768	10	1
434904	115769	10	1
434905	115770	10	1
434906	115771	10	1
434907	115772	10	1
434908	115773	10	1
434909	115774	10	1
434910	115775	10	1
434911	115776	10	1
434912	115777	10	1
434913	115778	10	1
434914	115779	10	1
434915	115780	10	1
434916	115781	10	1
434917	115782	10	1
434918	115783	10	1
434919	115784	10	1
434920	115785	10	1
434921	115786	10	1
434922	115787	10	1
434923	115788	10	1
434924	115789	10	1
434925	115790	10	1
434926	115791	10	1
434927	115792	10	1
434928	115793	10	1
434929	115794	10	1
434930	115795	10	1
434931	115796	10	1
434932	115797	10	1
434933	115798	10	1
434934	115799	10	1
434935	115800	10	1
434936	115801	10	1
434937	115802	10	1
434938	115803	10	1
434939	115804	10	1
434940	115805	10	1
434941	115806	10	1
434942	115807	10	1
434943	115808	10	1
434944	115809	10	1
434945	115810	10	1
434946	115811	10	1
434947	115812	10	1
434948	115813	10	1
434949	115814	10	1
434950	115815	10	1
434951	115816	10	1
434952	115817	10	1
434953	115818	10	1
434954	115819	10	1
434955	115820	10	1
434956	115821	10	1
434957	115822	10	1
434958	115823	10	1
434959	115824	10	1
434960	115825	10	1
434961	115826	10	1
434962	115827	10	1
434963	115828	10	1
434964	115829	10	1
434965	115830	10	1
434966	115831	10	1
434967	115832	10	1
434968	115833	10	1
434969	115834	10	1
434970	115835	10	1
434971	115836	10	1
434972	115837	10	1
434973	115838	10	1
434974	115839	10	1
434975	115840	10	1
434976	115841	10	1
434977	115842	10	1
434978	115843	10	1
434979	115844	10	1
434980	115845	10	1
434981	115846	10	1
434982	115847	10	1
434983	115848	10	1
434984	115849	10	1
434985	115850	10	1
434986	115851	10	1
434987	115852	10	1
434988	115853	10	1
434989	115854	10	1
434990	115855	10	1
434991	115856	10	1
434992	115857	10	1
434993	115858	10	1
434994	115859	10	1
434995	115860	10	1
434996	115861	10	1
434997	115862	10	1
434998	115863	10	1
434999	115864	10	1
435000	115865	10	1
435001	115866	10	1
435002	115867	10	1
435003	115868	10	1
435004	115869	10	1
435005	115870	10	1
435006	115871	10	1
435007	115872	10	1
435008	115873	10	1
435009	115874	10	1
435010	115875	10	1
435011	115876	10	1
435012	115877	10	1
435013	115878	10	1
435014	115879	10	1
435015	115880	10	1
435016	115881	10	1
435017	115882	10	1
435018	115883	10	1
435019	115884	10	1
435020	115885	10	1
435021	115886	10	1
435022	115887	10	1
435023	115888	10	1
435024	115889	10	1
435025	115890	10	1
435026	115891	10	1
435027	115892	10	1
435028	115893	10	1
435029	115894	10	1
435030	115895	10	1
435031	115896	10	1
435032	115897	10	1
435033	115898	10	1
435034	115899	10	1
435035	115900	10	1
435036	115901	10	1
435037	115902	10	1
435038	115903	10	1
435039	115904	10	1
435040	115905	10	1
435041	115906	10	1
435042	115907	10	1
435043	115908	10	1
435044	115909	10	1
435045	115910	10	1
435046	115911	10	1
435047	115912	10	1
435048	115913	10	1
435049	115914	10	1
435050	115915	10	1
435051	115916	10	1
435052	115917	10	1
435053	115918	10	1
435054	115919	10	1
435055	115920	10	1
435056	115921	10	1
435057	115922	10	1
435058	115923	10	1
435059	115924	10	1
435060	115925	10	1
435061	115926	10	1
435062	115927	10	1
435063	115928	10	1
435064	115929	10	1
435065	115930	10	1
435066	115931	10	1
435067	115932	10	1
435068	115933	10	1
435069	115934	10	1
435070	115935	10	1
435071	115936	10	1
435072	115937	10	1
435073	115938	10	1
435074	115939	10	1
435075	115940	10	1
435076	115941	10	1
435077	115942	10	1
435078	115943	10	1
435079	115944	10	1
435080	115945	10	1
435081	115946	10	1
435082	115947	10	1
435083	115948	10	1
435084	115949	10	1
435085	115950	10	1
435086	115951	10	1
435087	115952	10	1
435088	115953	10	1
435089	115954	10	1
435090	115955	10	1
435091	115956	10	1
435092	115957	10	1
435093	115958	10	1
435094	115959	10	1
435095	115960	10	1
435096	115961	10	1
435097	115962	10	1
435098	115963	10	1
435099	115964	10	1
435100	115965	10	1
435101	115966	10	1
435102	115967	10	1
435103	115968	10	1
435104	115969	10	1
435105	115970	10	1
435106	115971	10	1
435107	115972	10	1
435108	115973	10	1
435109	115974	10	1
435110	115975	10	1
435111	115976	10	1
435112	115977	10	1
435113	115978	10	1
435114	115979	10	1
435115	115980	10	1
435116	115981	10	1
435117	115982	10	1
435118	115983	10	1
435119	115984	10	1
435120	115985	10	1
435121	115986	10	1
435122	115987	10	1
435123	115988	10	1
435124	115989	10	1
435125	115990	10	1
435126	115991	10	1
435127	115992	10	1
435128	115993	10	1
435129	115994	10	1
435130	115995	10	1
435131	115996	10	1
435132	115997	10	1
435133	115998	10	1
435134	115999	10	1
435135	116000	10	1
435136	116001	10	1
435137	116002	10	1
435138	116003	10	1
435139	116004	10	1
435140	116005	10	1
435141	116006	10	1
435142	116007	10	1
435143	116008	10	1
435144	116009	10	1
435145	116010	10	1
435146	116011	10	1
435147	116012	10	1
435148	116013	10	1
435149	116014	10	1
435150	116015	10	1
435151	116016	10	1
435152	116017	10	1
435153	116018	10	1
435154	116019	10	1
435155	116020	10	1
435156	116021	10	1
435157	116022	10	1
435158	116023	10	1
435159	116024	10	1
435160	116025	10	1
435161	116026	10	1
435162	116027	10	1
435163	116028	10	1
435164	116029	10	1
435165	116030	10	1
435166	116031	10	1
435167	116032	10	1
435168	116033	10	1
435169	116034	10	1
435170	116035	10	1
435171	116036	10	1
435172	116037	10	1
435173	116038	10	1
435174	116039	10	1
435175	116040	10	1
435176	116041	10	1
435177	116042	10	1
435178	116043	10	1
435179	116044	10	1
435180	116045	10	1
435181	116046	10	1
435182	116047	10	1
435183	116048	10	1
435184	116049	10	1
435185	116050	10	1
435186	116051	10	1
435187	116052	10	1
435188	116053	10	2
435189	116054	10	2
435190	116055	10	2
435191	116056	10	2
435192	116057	10	2
435193	116058	10	2
435194	116059	10	2
435195	116060	10	2
435196	116061	10	2
435197	116062	10	2
435198	116063	10	2
435199	116064	10	2
435200	116065	10	2
435201	116066	10	2
435202	116067	10	2
435203	116068	10	2
435204	116069	10	2
435205	116070	10	2
435206	116071	10	2
435207	116072	10	2
435208	116073	10	2
435209	116074	10	2
435210	116075	10	2
435211	116076	10	2
435212	116077	10	2
435213	116078	10	2
435214	116079	10	2
435215	116080	10	2
435216	116081	10	2
435217	116082	10	2
435218	116083	10	2
435219	116084	10	2
435220	116085	10	2
435221	116086	10	2
435222	116087	10	2
435223	116088	10	2
435224	116089	10	2
435225	116090	10	2
435226	116091	10	2
435227	116092	10	2
435228	116093	10	2
435229	116094	10	2
435230	116095	10	2
435231	116096	10	2
435232	116097	10	2
435233	116098	10	2
435234	116099	10	2
435235	116100	10	2
435236	116101	10	2
435237	116102	10	2
435238	116103	10	2
435239	116104	10	2
435240	116105	10	2
435241	116106	10	2
435242	116107	10	2
435243	116108	10	2
435244	116109	10	2
435245	116110	10	2
435246	116111	10	2
435247	116112	10	2
435248	116113	10	2
435249	116114	10	2
435250	116115	10	2
435251	116116	10	2
435252	116117	10	2
435253	116118	10	2
435254	116119	10	2
435255	116120	10	2
435256	116121	10	2
435257	116122	10	2
435258	116123	10	2
435259	116124	10	2
435260	116125	10	2
435261	116126	10	2
435262	116127	10	2
435263	116128	10	2
435264	116129	10	2
435265	116130	10	2
435266	116131	10	2
435267	116132	10	2
435268	116133	10	2
435269	116134	10	2
435270	116135	10	2
435271	116136	10	2
435272	116137	10	2
435273	116138	10	2
435274	116139	10	2
435275	116140	10	2
435276	116141	10	2
435277	116142	10	2
435278	116143	10	2
435279	116144	10	2
435280	116145	10	2
435281	116146	10	2
435282	116147	10	2
435283	116148	10	2
435284	116149	10	2
435285	116150	10	2
435286	116151	10	2
435287	116152	10	2
435288	116153	10	2
435289	116154	10	2
435290	116155	10	2
435291	116156	10	2
435292	116157	10	2
435293	116158	10	2
435294	116159	10	2
435295	116160	10	2
435296	116161	10	2
435297	116162	10	2
435298	116163	10	2
435299	116164	10	2
435300	116165	10	2
435301	116166	10	2
435302	116167	10	2
435303	116168	10	2
435304	116169	10	2
435305	116170	10	2
435306	116171	10	2
435307	116172	10	2
435308	116173	10	2
435309	116174	10	2
435310	116175	10	2
435311	116176	10	2
435312	116177	10	2
435313	116178	10	2
435314	116179	10	2
435315	116180	10	2
435316	116181	10	2
435317	116182	10	2
435318	116183	10	2
435319	116184	10	2
435320	116185	10	2
435321	116186	10	2
435322	116187	10	2
435323	116188	10	2
435324	116189	10	2
435325	116190	10	2
435326	116191	10	2
435327	116192	10	2
435328	116193	10	2
435329	116194	10	2
435330	116195	10	2
435331	116196	10	2
435332	116197	10	2
435333	116198	10	2
435334	116199	10	2
435335	116200	10	2
435336	116201	10	2
435337	116202	10	2
435338	116203	10	2
435339	116204	10	2
435340	116205	10	2
435341	116206	10	2
435342	116207	10	2
435343	116208	10	2
435344	116209	10	2
435345	116210	10	2
435346	116211	10	2
435347	116212	10	2
435348	116213	10	2
435349	116214	10	2
435350	116215	10	2
435351	116216	10	2
435352	116217	10	2
435353	116218	10	2
435354	116219	10	2
435355	116220	10	2
435356	116221	10	2
435357	116222	10	2
435358	116223	10	2
435359	116224	10	2
435360	116225	10	2
435361	116226	10	2
435362	116227	10	2
435363	116228	10	2
435364	116229	10	2
435365	116230	10	2
435366	116231	10	2
435367	116232	10	2
435368	116233	10	2
435369	116234	10	2
435370	116235	10	2
435371	116236	10	2
435372	116237	10	2
435373	116238	10	2
435374	116239	10	2
435375	116240	10	2
435376	116241	10	2
435377	116242	10	2
435378	116243	10	2
435379	116244	10	2
435380	116245	10	2
435381	116246	10	2
435382	116247	10	2
435383	116248	10	2
435384	116249	10	2
435385	116250	10	2
435386	116251	10	2
435387	116252	10	2
435388	116253	10	2
435389	116254	10	2
435390	116255	10	2
435391	116256	10	2
435392	116257	10	2
435393	116258	10	2
435394	116259	10	2
435395	116260	10	2
435396	115877	10	2
435397	115878	10	2
435398	115879	10	2
435399	115880	10	2
435400	115881	10	2
435401	115882	10	2
435402	115883	10	2
435403	115884	10	2
435404	115885	10	2
435405	115886	10	2
435406	115887	10	2
435407	115888	10	2
435408	115889	10	2
435409	115890	10	2
435410	115891	10	2
435411	115892	10	2
435412	116261	10	2
435413	116262	10	2
435414	116263	10	2
435415	116264	10	2
435416	116265	10	2
435417	116266	10	2
435418	116267	10	2
435419	116268	10	2
435420	116269	10	2
435421	116270	10	2
435422	116271	10	2
435423	116272	10	2
435424	116273	10	2
435425	116274	10	2
435426	116275	10	2
435427	116276	10	2
435428	116277	10	2
435429	116278	10	2
435430	116279	10	2
435431	116280	10	2
435432	116281	10	2
435433	116282	10	2
435434	116283	10	2
435435	116284	10	2
435436	116285	10	2
435437	116286	10	2
435438	116287	10	2
435439	116288	10	2
435440	116289	10	2
435441	116290	10	2
435442	116291	10	2
435443	116292	10	2
435444	116293	10	2
435445	116294	10	2
435446	116295	10	2
435447	116296	10	2
435448	116297	10	2
435449	116298	10	2
435450	116299	10	2
435451	116300	10	2
435452	116301	10	2
435453	116302	10	2
435454	116303	10	2
435455	116304	10	2
435456	116305	10	2
435457	116306	10	2
435458	116307	10	2
435459	116308	10	2
435460	116309	10	2
435461	116310	10	2
435462	116311	10	2
435463	116312	10	2
435464	116313	10	2
435465	116314	10	2
435466	116315	10	2
435467	116316	10	2
435468	116317	10	2
435469	116318	10	2
435470	116319	10	2
435471	116320	10	2
435472	116321	10	2
435473	116322	10	2
435474	116323	10	2
435475	116324	10	2
435476	116325	10	2
435477	116326	10	2
435478	116327	10	2
435479	116328	10	2
435480	116329	10	2
435481	116330	10	2
435482	116331	10	2
435483	116332	10	2
435484	116333	10	2
435485	116334	10	2
435486	116335	10	2
435487	116336	10	2
435488	116337	10	2
435489	116338	10	2
435490	116339	10	2
435491	116340	10	2
435492	116341	10	2
435493	116342	10	2
435494	116343	10	2
435495	116344	10	2
435496	116345	10	2
435497	116346	10	2
435498	116347	10	2
435499	116348	10	2
435500	116349	10	2
435501	116350	10	2
435502	116351	10	2
435503	116352	10	2
435504	116353	10	2
435505	116354	10	2
435506	116355	10	2
435507	116356	10	2
435508	116357	10	2
435509	116358	10	2
435510	116359	10	2
435511	116360	10	2
435512	116361	10	2
435513	116362	10	2
435514	116363	10	2
435515	116364	10	2
\.


--
-- TOC entry 4927 (class 0 OID 142574)
-- Dependencies: 226
-- Data for Name: sc_rasp18_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp18_info (id, rasp18_id, kind, info) FROM stdin;
\.


--
-- TOC entry 4929 (class 0 OID 142580)
-- Dependencies: 228
-- Data for Name: sc_rasp18_move; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp18_move (id, rasp18_dest_id, reason, comment, rasp18_src_id) FROM stdin;
51	\N	\N	\N	\N
53	\N	\N	\N	\N
\.


--
-- TOC entry 4931 (class 0 OID 142586)
-- Dependencies: 230
-- Data for Name: sc_rasp18_preps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp18_preps (id, rasp18_id, prep_id) FROM stdin;
279538	88471	0
279539	88472	0
279540	88473	0
279541	88474	0
279542	88475	0
279543	88476	0
279544	88477	0
279545	88478	0
279546	88479	0
279547	88480	0
279548	88481	0
279549	88482	0
279550	88483	0
279551	88484	0
279552	88485	0
279553	88486	0
279554	88487	1
279555	88488	1
279556	88489	1
279557	88490	1
279558	88491	1
279559	88492	1
279560	88493	1
279561	88494	1
279562	88495	1
279563	88496	1
279564	88497	1
279565	88498	1
279566	88499	1
279567	88500	1
279568	88501	1
279569	88502	1
279570	88503	2
279571	88504	2
279572	88505	2
279573	88506	2
279574	88507	2
279575	88508	2
279576	88509	2
279577	88510	2
279578	88511	2
279579	88512	2
279580	88513	2
279581	88514	2
279582	88515	2
279583	88516	2
279584	88517	2
279585	88518	2
279586	88519	3
279587	88520	3
279588	88521	3
279589	88522	3
279590	88523	3
279591	88524	3
279592	88525	3
279593	88526	3
279594	88527	3
279595	88528	3
279596	88529	3
279597	88530	3
279598	88531	3
279599	88532	3
279600	88533	3
279601	88534	3
279602	88535	4
279603	88536	4
279604	88537	4
279605	88538	4
279606	88539	4
279607	88540	4
279608	88541	4
279609	88542	4
279610	88543	5
279611	88544	5
279612	88545	5
279613	88546	5
279614	88547	5
279615	88548	5
279616	88549	5
279617	88550	5
279618	88551	6
279619	88552	6
279620	88553	6
279621	88554	6
279622	88555	6
279623	88556	6
279624	88557	6
279625	88558	6
279626	88559	6
279627	88560	6
279628	88561	6
279629	88562	6
279630	88563	6
279631	88564	6
279632	88565	6
279633	88566	6
279634	88567	6
279635	88568	6
279636	88569	6
279637	88570	6
279638	88571	6
279639	88572	6
279640	88573	6
279641	88574	6
279642	88575	6
279643	88576	6
279644	88577	6
279645	88578	6
279646	88579	6
279647	88580	6
279648	88581	6
279649	88582	6
279650	88583	7
279651	88584	7
279652	88585	7
279653	88586	7
279654	88587	7
279655	88588	7
279656	88589	7
279657	88590	7
279658	88591	7
279659	88592	7
279660	88593	7
279661	88594	7
279662	88595	7
279663	88596	7
279664	88597	7
279665	88598	7
279666	88599	8
279667	88600	8
279668	88601	8
279669	88602	8
279670	88603	8
279671	88604	8
279672	88605	8
279673	88606	8
279674	88607	8
279675	88608	8
279676	88609	8
279677	88610	8
279678	88611	8
279679	88612	8
279680	88613	8
279681	88614	8
279682	88615	7
279683	88616	7
279684	88617	7
279685	88618	7
279686	88619	7
279687	88620	7
279688	88621	7
279689	88622	7
279690	88623	7
279691	88624	7
279692	88625	7
279693	88626	7
279694	88627	7
279695	88628	7
279696	88629	7
279697	88630	7
279698	88631	9
279699	88632	9
279700	88633	9
279701	88634	9
279702	88635	9
279703	88636	9
279704	88637	9
279705	88638	9
279706	88639	9
279707	88640	9
279708	88641	9
279709	88642	9
279710	88643	9
279711	88644	9
279712	88645	9
279713	88646	9
279714	88647	10
279715	88648	10
279716	88649	10
279717	88650	10
279718	88651	10
279719	88652	10
279720	88653	10
279721	88654	10
279722	88655	10
279723	88656	10
279724	88657	10
279725	88658	10
279726	88659	10
279727	88660	10
279728	88661	10
279729	88662	10
279730	88663	11
279731	88664	11
279732	88665	11
279733	88666	11
279734	88667	11
279735	88668	11
279736	88669	11
279737	88670	11
279738	88687	11
279739	88688	11
279740	88689	11
279741	88690	11
279742	88691	11
279743	88692	11
279744	88693	11
279745	88694	11
279746	88695	11
279747	88696	11
279748	88697	11
279749	88698	11
279750	88699	11
279751	88700	11
279752	88701	11
279753	88702	11
279754	88703	12
279755	88704	12
279756	88705	12
279757	88706	12
279758	88707	12
279759	88708	12
279760	88709	12
279761	88710	12
279762	88711	13
279763	88712	13
279764	88713	13
279765	88714	13
279766	88715	13
279767	88716	13
279768	88717	13
279769	88718	13
279770	88719	12
279771	88720	12
279772	88721	12
279773	88722	12
279774	88723	12
279775	88724	12
279776	88725	12
279777	88726	12
279778	88727	14
279779	88728	14
279780	88729	14
279781	88730	14
279782	88731	14
279783	88732	14
279784	88733	14
279785	88734	14
279786	88735	14
279787	88736	14
279788	88737	14
279789	88738	14
279790	88739	14
279791	88740	14
279792	88741	14
279793	88742	14
279794	88743	14
279795	88744	14
279796	88745	14
279797	88746	14
279798	88747	14
279799	88748	14
279800	88749	14
279801	88750	14
279802	88751	14
279803	88752	14
279804	88753	14
279805	88754	14
279806	88755	14
279807	88756	14
279808	88757	14
279809	88758	14
279810	88759	15
279811	88760	15
279812	88761	15
279813	88762	15
279814	88763	15
279815	88764	15
279816	88765	15
279817	88766	15
279818	88767	15
279819	88768	15
279820	88769	15
279821	88770	15
279822	88771	15
279823	88772	15
279824	88773	15
279825	88774	15
279826	88775	16
279827	88776	16
279828	88777	16
279829	88778	16
279830	88779	16
279831	88780	16
279832	88781	16
279833	88782	16
279834	88783	5
279835	88784	5
279836	88785	5
279837	88786	5
279838	88787	5
279839	88788	5
279840	88789	5
279841	88790	5
279842	88791	17
279843	88792	17
279844	88793	17
279845	88794	17
279846	88795	17
279847	88796	17
279848	88797	17
279849	88798	17
279850	88799	17
279851	88800	17
279852	88801	17
279853	88802	17
279854	88803	17
279855	88804	17
279856	88805	17
279857	88806	17
279858	88807	1
279859	88808	1
279860	88809	1
279861	88810	1
279862	88811	1
279863	88812	1
279864	88813	1
279865	88814	1
279866	88815	1
279867	88816	1
279868	88817	1
279869	88818	1
279870	88819	1
279871	88820	1
279872	88821	1
279873	88822	1
279874	88823	15
279875	88824	15
279876	88825	15
279877	88826	15
279878	88827	15
279879	88828	15
279880	88829	15
279881	88830	15
279882	88831	15
279883	88832	15
279884	88833	15
279885	88834	15
279886	88835	15
279887	88836	15
279888	88837	15
279889	88838	15
279890	88839	4
279891	88840	4
279892	88841	4
279893	88842	4
279894	88843	4
279895	88844	4
279896	88845	4
279897	88846	4
279898	88847	4
279899	88848	4
279900	88849	4
279901	88850	4
279902	88851	4
279903	88852	4
279904	88853	4
279905	88854	4
279906	88855	4
279907	88856	4
279908	88857	4
279909	88858	4
279910	88859	4
279911	88860	4
279912	88861	4
279913	88862	4
279914	88863	5
279915	88864	5
279916	88865	5
279917	88866	5
279918	88867	5
279919	88868	5
279920	88869	5
279921	88870	5
279922	88871	18
279923	88872	18
279924	88873	18
279925	88874	18
279926	88875	18
279927	88876	18
279928	88877	18
279929	88878	18
279930	88879	18
279931	88880	18
279932	88881	18
279933	88882	18
279934	88883	18
279935	88884	18
279936	88885	18
279937	88886	18
279938	88903	7
279939	88904	7
279940	88905	7
279941	88906	7
279942	88907	7
279943	88908	7
279944	88909	7
279945	88910	7
279946	88911	7
279947	88912	7
279948	88913	7
279949	88914	7
279950	88915	7
279951	88916	7
279952	88917	7
279953	88918	7
279954	88919	8
279955	88920	8
279956	88921	8
279957	88922	8
279958	88923	8
279959	88924	8
279960	88925	8
279961	88926	8
279962	88927	8
279963	88928	8
279964	88929	8
279965	88930	8
279966	88931	8
279967	88932	8
279968	88933	8
279969	88934	8
279970	88935	7
279971	88936	7
279972	88937	7
279973	88938	7
279974	88939	7
279975	88940	7
279976	88941	7
279977	88942	7
279978	88943	7
279979	88944	7
279980	88945	7
279981	88946	7
279982	88947	7
279983	88948	7
279984	88949	7
279985	88950	7
279986	88951	6
279987	88952	6
279988	88953	6
279989	88954	6
279990	88955	6
279991	88956	6
279992	88957	6
279993	88958	6
279994	88959	6
279995	88960	6
279996	88961	6
279997	88962	6
279998	88963	6
279999	88964	6
280000	88965	6
280001	88966	6
280002	88967	6
280003	88968	6
280004	88969	6
280005	88970	6
280006	88971	6
280007	88972	6
280008	88973	6
280009	88974	6
280010	88975	6
280011	88976	6
280012	88977	6
280013	88978	6
280014	88979	6
280015	88980	6
280016	88981	6
280017	88982	6
280018	88983	10
280019	88984	10
280020	88985	10
280021	88986	10
280022	88987	10
280023	88988	10
280024	88989	10
280025	88990	10
280026	88991	10
280027	88992	10
280028	88993	10
280029	88994	10
280030	88995	10
280031	88996	10
280032	88997	10
280033	88998	10
280034	88999	11
280035	89000	11
280036	89001	11
280037	89002	11
280038	89003	11
280039	89004	11
280040	89005	11
280041	89006	11
280042	89007	11
280043	89008	11
280044	89009	11
280045	89010	11
280046	89011	11
280047	89012	11
280048	89013	11
280049	89014	11
280050	89015	11
280051	89016	11
280052	89017	11
280053	89018	11
280054	89019	11
280055	89020	11
280056	89021	11
280057	89022	11
280058	89023	12
280059	89024	12
280060	89025	12
280061	89026	12
280062	89027	12
280063	89028	12
280064	89029	12
280065	89030	12
280066	89031	13
280067	89032	13
280068	89033	13
280069	89034	13
280070	89035	13
280071	89036	13
280072	89037	13
280073	89038	13
280074	89039	12
280075	89040	12
280076	89041	12
280077	89042	12
280078	89043	12
280079	89044	12
280080	89045	12
280081	89046	12
280082	89047	2
280083	89048	2
280084	89049	2
280085	89050	2
280086	89051	2
280087	89052	2
280088	89053	2
280089	89054	2
280090	89055	2
280091	89056	2
280092	89057	2
280093	89058	2
280094	89059	2
280095	89060	2
280096	89061	2
280097	89062	2
280098	89063	14
280099	89064	14
280100	89065	14
280101	89066	14
280102	89067	14
280103	89068	14
280104	89069	14
280105	89070	14
280106	89071	14
280107	89072	14
280108	89073	14
280109	89074	14
280110	89075	14
280111	89076	14
280112	89077	14
280113	89078	14
280114	89079	15
280115	89080	15
280116	89081	15
280117	89082	15
280118	89083	15
280119	89084	15
280120	89085	15
280121	89086	15
280122	89087	15
280123	89088	15
280124	89089	15
280125	89090	15
280126	89091	15
280127	89092	15
280128	89093	15
280129	89094	15
280130	89095	16
280131	89096	16
280132	89097	16
280133	89098	16
280134	89099	16
280135	89100	16
280136	89101	16
280137	89102	16
280138	89103	5
280139	89104	5
280140	89105	5
280141	89106	5
280142	89107	5
280143	89108	5
280144	89109	5
280145	89110	5
280146	89111	5
280147	89112	5
280148	89113	5
280149	89114	5
280150	89115	5
280151	89116	5
280152	89117	5
280153	89118	5
280154	89119	19
280155	89120	19
280156	89121	19
280157	89122	19
280158	89123	19
280159	89124	19
280160	89125	19
280161	89126	19
280162	89127	19
280163	89128	19
280164	89129	19
280165	89130	19
280166	89131	19
280167	89132	19
280168	89133	19
280169	89134	19
280170	89135	20
280171	89136	20
280172	89137	20
280173	89138	20
280174	89139	20
280175	89140	20
280176	89141	20
280177	89142	20
280178	89143	20
280179	89144	20
280180	89145	20
280181	89146	20
280182	89147	20
280183	89148	20
280184	89149	20
280185	89150	20
280186	89151	4
280187	89152	4
280188	89153	4
280189	89154	4
280190	89155	4
280191	89156	4
280192	89157	4
280193	89158	4
280194	89159	10
280195	89160	10
280196	89161	10
280197	89162	10
280198	89163	10
280199	89164	10
280200	89165	10
280201	89166	10
280202	89167	10
280203	89168	10
280204	89169	10
280205	89170	10
280206	89171	10
280207	89172	10
280208	89173	10
280209	89174	10
280210	89175	10
280211	89176	10
280212	89177	10
280213	89178	10
280214	89179	10
280215	89180	10
280216	89181	10
280217	89182	10
280218	89183	10
280219	89184	10
280220	89185	10
280221	89186	10
280222	89187	10
280223	89188	10
280224	89189	10
280225	89190	10
280226	89191	18
280227	89192	18
280228	89193	18
280229	89194	18
280230	89195	18
280231	89196	18
280232	89197	18
280233	89198	18
280234	89199	18
280235	89200	18
280236	89201	18
280237	89202	18
280238	89203	18
280239	89204	18
280240	89205	18
280241	89206	18
280242	89207	7
280243	89208	7
280244	89209	7
280245	89210	7
280246	89211	7
280247	89212	7
280248	89213	7
280249	89214	7
280250	89215	7
280251	89216	7
280252	89217	7
280253	89218	7
280254	89219	7
280255	89220	7
280256	89221	7
280257	89222	7
280258	89223	8
280259	89224	8
280260	89225	8
280261	89226	8
280262	89227	8
280263	89228	8
280264	89229	8
280265	89230	8
280266	89231	8
280267	89232	8
280268	89233	8
280269	89234	8
280270	89235	8
280271	89236	8
280272	89237	8
280273	89238	8
280274	89239	7
280275	89240	7
280276	89241	7
280277	89242	7
280278	89243	7
280279	89244	7
280280	89245	7
280281	89246	7
280282	89247	7
280283	89248	7
280284	89249	7
280285	89250	7
280286	89251	7
280287	89252	7
280288	89253	7
280289	89254	7
280290	89255	21
280291	89256	21
280292	89257	21
280293	89258	21
280294	89259	21
280295	89260	21
280296	89261	21
280297	89262	21
280298	89263	21
280299	89264	21
280300	89265	21
280301	89266	21
280302	89267	21
280303	89268	21
280304	89269	21
280305	89270	21
280306	89271	21
280307	89272	21
280308	89273	21
280309	89274	21
280310	89275	21
280311	89276	21
280312	89277	21
280313	89278	21
280314	89279	21
280315	89280	21
280316	89281	21
280317	89282	21
280318	89283	21
280319	89284	21
280320	89285	21
280321	89286	21
280322	89303	10
280323	89304	10
280324	89305	10
280325	89306	10
280326	89307	10
280327	89308	10
280328	89309	10
280329	89310	10
280330	89311	10
280331	89312	10
280332	89313	10
280333	89314	10
280334	89315	10
280335	89316	10
280336	89317	10
280337	89318	10
280338	89319	11
280339	89320	11
280340	89321	11
280341	89322	11
280342	89323	11
280343	89324	11
280344	89325	11
280345	89326	11
280346	89327	12
280347	89328	12
280348	89329	12
280349	89330	12
280350	89331	12
280351	89332	12
280352	89333	12
280353	89334	12
280354	89335	13
280355	89336	13
280356	89337	13
280357	89338	13
280358	89339	13
280359	89340	13
280360	89341	13
280361	89342	13
280362	89343	1
280363	89344	1
280364	89345	1
280365	89346	1
280366	89347	1
280367	89348	1
280368	89349	1
280369	89350	1
280370	89351	1
280371	89352	1
280372	89353	1
280373	89354	1
280374	89355	1
280375	89356	1
280376	89357	1
280377	89358	1
280378	89359	22
280379	89360	22
280380	89361	22
280381	89362	22
280382	89363	22
280383	89364	22
280384	89365	22
280385	89366	22
280386	89367	22
280387	89368	22
280388	89369	22
280389	89370	22
280390	89371	22
280391	89372	22
280392	89373	22
280393	89374	22
280394	89375	14
280395	89376	14
280396	89377	14
280397	89378	14
280398	89379	14
280399	89380	14
280400	89381	14
280401	89382	14
280402	89383	14
280403	89384	14
280404	89385	14
280405	89386	14
280406	89387	14
280407	89388	14
280408	89389	14
280409	89390	14
280410	89391	15
280411	89392	15
280412	89393	15
280413	89394	15
280414	89395	15
280415	89396	15
280416	89397	15
280417	89398	15
280418	89399	15
280419	89400	15
280420	89401	15
280421	89402	15
280422	89403	15
280423	89404	15
280424	89405	15
280425	89406	15
280426	89407	23
280427	89408	23
280428	89409	23
280429	89410	23
280430	89411	23
280431	89412	23
280432	89413	23
280433	89414	23
280434	89415	23
280435	89416	23
280436	89417	23
280437	89418	23
280438	89419	23
280439	89420	23
280440	89421	23
280441	89422	23
280442	89423	5
280443	89424	5
280444	89425	5
280445	89426	5
280446	89427	5
280447	89428	5
280448	89429	5
280449	89430	5
280450	89431	5
280451	89432	5
280452	89433	5
280453	89434	5
280454	89435	5
280455	89436	5
280456	89437	5
280457	89438	5
280458	89439	2
280459	89440	2
280460	89441	2
280461	89442	2
280462	89443	2
280463	89444	2
280464	89445	2
280465	89446	2
280466	89447	2
280467	89448	2
280468	89449	2
280469	89450	2
280470	89451	2
280471	89452	2
280472	89453	2
280473	89454	2
280474	89455	21
280475	89456	21
280476	89457	21
280477	89458	21
280478	89459	21
280479	89460	21
280480	89461	21
280481	89462	21
280482	89463	21
280483	89464	21
280484	89465	21
280485	89466	21
280486	89467	21
280487	89468	21
280488	89469	21
280489	89470	21
280490	89471	21
280491	89472	21
280492	89473	21
280493	89474	21
280494	89475	21
280495	89476	21
280496	89477	21
280497	89478	21
280498	89479	21
280499	89480	21
280500	89481	21
280501	89482	21
280502	89483	21
280503	89484	21
280504	89485	21
280505	89486	21
280506	89487	4
280507	89488	4
280508	89489	4
280509	89490	4
280510	89491	4
280511	89492	4
280512	89493	4
280513	89494	4
280514	89511	18
280515	89512	18
280516	89513	18
280517	89514	18
280518	89515	18
280519	89516	18
280520	89517	18
280521	89518	18
280522	89519	18
280523	89520	18
280524	89521	18
280525	89522	18
280526	89523	18
280527	89524	18
280528	89525	18
280529	89526	18
280530	89527	10
280531	89528	10
280532	89529	10
280533	89530	10
280534	89531	10
280535	89532	10
280536	89533	10
280537	89534	10
280538	89535	10
280539	89536	10
280540	89537	10
280541	89538	10
280542	89539	10
280543	89540	10
280544	89541	10
280545	89542	10
280546	89543	10
280547	89544	10
280548	89545	10
280549	89546	10
280550	89547	10
280551	89548	10
280552	89549	10
280553	89550	10
280554	89551	10
280555	89552	10
280556	89553	10
280557	89554	10
280558	89555	10
280559	89556	10
280560	89557	10
280561	89558	10
280562	89559	8
280563	89560	8
280564	89561	8
280565	89562	8
280566	89563	8
280567	89564	8
280568	89565	8
280569	89566	8
280570	89567	8
280571	89568	8
280572	89569	8
280573	89570	8
280574	89571	8
280575	89572	8
280576	89573	8
280577	89574	8
280578	89575	7
280579	89576	7
280580	89577	7
280581	89578	7
280582	89579	7
280583	89580	7
280584	89581	7
280585	89582	7
280586	89583	7
280587	89584	7
280588	89585	7
280589	89586	7
280590	89587	7
280591	89588	7
280592	89589	7
280593	89590	7
280594	89591	8
280595	89592	8
280596	89593	8
280597	89594	8
280598	89595	8
280599	89596	8
280600	89597	8
280601	89598	8
280602	89599	8
280603	89600	8
280604	89601	8
280605	89602	8
280606	89603	8
280607	89604	8
280608	89605	8
280609	89606	8
280610	89607	1
280611	89608	1
280612	89609	1
280613	89610	1
280614	89611	1
280615	89612	1
280616	89613	1
280617	89614	1
280618	89615	1
280619	89616	1
280620	89617	1
280621	89618	1
280622	89619	1
280623	89620	1
280624	89621	1
280625	89622	1
280626	89623	10
280627	89624	10
280628	89625	10
280629	89626	10
280630	89627	10
280631	89628	10
280632	89629	10
280633	89630	10
280634	89631	10
280635	89632	10
280636	89633	10
280637	89634	10
280638	89635	10
280639	89636	10
280640	89637	10
280641	89638	10
280642	89639	11
280643	89640	11
280644	89641	11
280645	89642	11
280646	89643	11
280647	89644	11
280648	89645	11
280649	89646	11
280650	89647	12
280651	89648	12
280652	89649	12
280653	89650	12
280654	89651	12
280655	89652	12
280656	89653	12
280657	89654	12
280658	89655	13
280659	89656	13
280660	89657	13
280661	89658	13
280662	89659	13
280663	89660	13
280664	89661	13
280665	89662	13
280666	89663	22
280667	89664	22
280668	89665	22
280669	89666	22
280670	89667	22
280671	89668	22
280672	89669	22
280673	89670	22
280674	89671	22
280675	89672	22
280676	89673	22
280677	89674	22
280678	89675	22
280679	89676	22
280680	89677	22
280681	89678	22
280682	89679	24
280683	89680	24
280684	89681	24
280685	89682	24
280686	89683	24
280687	89684	24
280688	89685	24
280689	89686	24
280690	89687	24
280691	89688	24
280692	89689	24
280693	89690	24
280694	89691	24
280695	89692	24
280696	89693	24
280697	89694	24
280698	89695	14
280699	89696	14
280700	89697	14
280701	89698	14
280702	89699	14
280703	89700	14
280704	89701	14
280705	89702	14
280706	89703	14
280707	89704	14
280708	89705	14
280709	89706	14
280710	89707	14
280711	89708	14
280712	89709	14
280713	89710	14
280714	89711	15
280715	89712	15
280716	89713	15
280717	89714	15
280718	89715	15
280719	89716	15
280720	89717	15
280721	89718	15
280722	89719	15
280723	89720	15
280724	89721	15
280725	89722	15
280726	89723	15
280727	89724	15
280728	89725	15
280729	89726	15
280730	89727	23
280731	89728	23
280732	89729	23
280733	89730	23
280734	89731	23
280735	89732	23
280736	89733	23
280737	89734	23
280738	89735	23
280739	89736	23
280740	89737	23
280741	89738	23
280742	89739	23
280743	89740	23
280744	89741	23
280745	89742	23
280746	89743	5
280747	89744	5
280748	89745	5
280749	89746	5
280750	89747	5
280751	89748	5
280752	89749	5
280753	89750	5
280754	89751	25
280755	89752	25
280756	89753	25
280757	89754	25
280758	89755	25
280759	89756	25
280760	89757	25
280761	89758	25
280762	89759	25
280763	89760	25
280764	89761	25
280765	89762	25
280766	89763	25
280767	89764	25
280768	89765	25
280769	89766	25
280770	89767	26
280771	89768	26
280772	89769	26
280773	89770	26
280774	89771	26
280775	89772	26
280776	89773	26
280777	89774	26
280778	89775	26
280779	89776	26
280780	89777	26
280781	89778	26
280782	89779	26
280783	89780	26
280784	89781	26
280785	89782	26
280786	89783	25
280787	89784	25
280788	89785	25
280789	89786	25
280790	89787	25
280791	89788	25
280792	89789	25
280793	89790	25
280794	89791	25
280795	89792	25
280796	89793	25
280797	89794	25
280798	89795	25
280799	89796	25
280800	89797	25
280801	89798	25
280802	89799	3
280803	89800	3
280804	89801	3
280805	89802	3
280806	89803	3
280807	89804	3
280808	89805	3
280809	89806	3
280810	89807	3
280811	89808	3
280812	89809	3
280813	89810	3
280814	89811	3
280815	89812	3
280816	89813	3
280817	89814	3
280818	89815	27
280819	89816	27
280820	89817	27
280821	89818	27
280822	89819	27
280823	89820	27
280824	89821	27
280825	89822	27
280826	89823	27
280827	89824	27
280828	89825	27
280829	89826	27
280830	89827	27
280831	89828	27
280832	89829	27
280833	89830	27
280834	89831	25
280835	89832	25
280836	89833	25
280837	89834	25
280838	89835	25
280839	89836	25
280840	89837	25
280841	89838	25
280842	89839	25
280843	89840	25
280844	89841	25
280845	89842	25
280846	89843	25
280847	89844	25
280848	89845	25
280849	89846	25
280850	89847	27
280851	89848	27
280852	89849	27
280853	89850	27
280854	89851	27
280855	89852	27
280856	89853	27
280857	89854	27
280858	89855	27
280859	89856	27
280860	89857	27
280861	89858	27
280862	89859	27
280863	89860	27
280864	89861	27
280865	89862	27
280866	89879	28
280867	89880	28
280868	89881	28
280869	89882	28
280870	89883	28
280871	89884	28
280872	89885	28
280873	89886	28
280874	89887	28
280875	89888	28
280876	89889	28
280877	89890	28
280878	89891	28
280879	89892	28
280880	89893	28
280881	89894	28
280882	89895	26
280883	89896	26
280884	89897	26
280885	89898	26
280886	89899	26
280887	89900	26
280888	89901	26
280889	89902	26
280890	89903	26
280891	89904	26
280892	89905	26
280893	89906	26
280894	89907	26
280895	89908	26
280896	89909	26
280897	89910	26
280898	89911	29
280899	89912	29
280900	89913	29
280901	89914	29
280902	89915	29
280903	89916	29
280904	89917	29
280905	89918	29
280906	89919	29
280907	89920	29
280908	89921	29
280909	89922	29
280910	89923	29
280911	89924	29
280912	89925	29
280913	89926	29
280914	89927	10
280915	89928	10
280916	89929	10
280917	89930	10
280918	89931	10
280919	89932	10
280920	89933	10
280921	89934	10
280922	89935	10
280923	89936	10
280924	89937	10
280925	89938	10
280926	89939	10
280927	89940	10
280928	89941	10
280929	89942	10
280930	89943	30
280931	89944	30
280932	89945	30
280933	89946	30
280934	89947	30
280935	89948	30
280936	89949	30
280937	89950	30
280938	89951	31
280939	89952	31
280940	89953	31
280941	89954	31
280942	89955	31
280943	89956	31
280944	89957	31
280945	89958	31
280946	89959	32
280947	89960	32
280948	89961	32
280949	89962	32
280950	89963	32
280951	89964	32
280952	89965	32
280953	89966	32
280954	89967	33
280955	89968	33
280956	89969	33
280957	89970	33
280958	89971	33
280959	89972	33
280960	89973	33
280961	89974	33
280962	89975	25
280963	89976	25
280964	89977	25
280965	89978	25
280966	89979	25
280967	89980	25
280968	89981	25
280969	89982	25
280970	89983	34
280971	89984	34
280972	89985	34
280973	89986	34
280974	89987	34
280975	89988	34
280976	89989	34
280977	89990	34
280978	89991	34
280979	89992	34
280980	89993	34
280981	89994	34
280982	89995	34
280983	89996	34
280984	89997	34
280985	89998	34
280986	89999	34
280987	90000	34
280988	90001	34
280989	90002	34
280990	90003	34
280991	90004	34
280992	90005	34
280993	90006	34
280994	90007	34
280995	90008	34
280996	90009	34
280997	90010	34
280998	90011	34
280999	90012	34
281000	90013	34
281001	90014	34
281002	90015	35
281003	90016	35
281004	90017	35
281005	90018	35
281006	90019	35
281007	90020	35
281008	90021	35
281009	90022	35
281010	90023	35
281011	90024	35
281012	90025	35
281013	90026	35
281014	90027	35
281015	90028	35
281016	90029	35
281017	90030	35
281018	90031	36
281019	90032	36
281020	90033	36
281021	90034	36
281022	90035	36
281023	90036	36
281024	90037	36
281025	90038	36
281026	90039	26
281027	90040	26
281028	90041	26
281029	90042	26
281030	90043	26
281031	90044	26
281032	90045	26
281033	90046	26
281034	90047	26
281035	90048	26
281036	90049	26
281037	90050	26
281038	90051	26
281039	90052	26
281040	90053	26
281041	90054	26
281042	90055	25
281043	90056	25
281044	90057	25
281045	90058	25
281046	90059	25
281047	90060	25
281048	90061	25
281049	90062	25
281050	90063	25
281051	90064	25
281052	90065	25
281053	90066	25
281054	90067	25
281055	90068	25
281056	90069	25
281057	90070	25
281058	90087	27
281059	90088	27
281060	90089	27
281061	90090	27
281062	90091	27
281063	90092	27
281064	90093	27
281065	90094	27
281066	90095	27
281067	90096	27
281068	90097	27
281069	90098	27
281070	90099	27
281071	90100	27
281072	90101	27
281073	90102	27
281074	90103	25
281075	90104	25
281076	90105	25
281077	90106	25
281078	90107	25
281079	90108	25
281080	90109	25
281081	90110	25
281082	90111	25
281083	90112	25
281084	90113	25
281085	90114	25
281086	90115	25
281087	90116	25
281088	90117	25
281089	90118	25
281090	90119	28
281091	90120	28
281092	90121	28
281093	90122	28
281094	90123	28
281095	90124	28
281096	90125	28
281097	90126	28
281098	90127	28
281099	90128	28
281100	90129	28
281101	90130	28
281102	90131	28
281103	90132	28
281104	90133	28
281105	90134	28
281106	90135	10
281107	90136	10
281108	90137	10
281109	90138	10
281110	90139	10
281111	90140	10
281112	90141	10
281113	90142	10
281114	90143	10
281115	90144	10
281116	90145	10
281117	90146	10
281118	90147	10
281119	90148	10
281120	90149	10
281121	90150	10
281122	90151	34
281123	90152	34
281124	90153	34
281125	90154	34
281126	90155	34
281127	90156	34
281128	90157	34
281129	90158	34
281130	90159	34
281131	90160	34
281132	90161	34
281133	90162	34
281134	90163	34
281135	90164	34
281136	90165	34
281137	90166	34
281138	90167	34
281139	90168	34
281140	90169	34
281141	90170	34
281142	90171	34
281143	90172	34
281144	90173	34
281145	90174	34
281146	90175	34
281147	90176	34
281148	90177	34
281149	90178	34
281150	90179	34
281151	90180	34
281152	90181	34
281153	90182	34
281154	90183	30
281155	90184	30
281156	90185	30
281157	90186	30
281158	90187	30
281159	90188	30
281160	90189	30
281161	90190	30
281162	90191	30
281163	90192	30
281164	90193	30
281165	90194	30
281166	90195	30
281167	90196	30
281168	90197	30
281169	90198	30
281170	90199	32
281171	90200	32
281172	90201	32
281173	90202	32
281174	90203	32
281175	90204	32
281176	90205	32
281177	90206	32
281178	90207	33
281179	90208	33
281180	90209	33
281181	90210	33
281182	90211	33
281183	90212	33
281184	90213	33
281185	90214	33
281186	90215	37
281187	90216	37
281188	90217	37
281189	90218	37
281190	90219	37
281191	90220	37
281192	90221	37
281193	90222	37
281194	90223	37
281195	90224	37
281196	90225	37
281197	90226	37
281198	90227	37
281199	90228	37
281200	90229	37
281201	90230	37
281202	90231	38
281203	90232	38
281204	90233	38
281205	90234	38
281206	90235	38
281207	90236	38
281208	90237	38
281209	90238	38
281210	90239	38
281211	90240	38
281212	90241	38
281213	90242	38
281214	90243	38
281215	90244	38
281216	90245	38
281217	90246	38
281218	90247	39
281219	90248	39
281220	90249	39
281221	90250	39
281222	90251	39
281223	90252	39
281224	90253	39
281225	90254	39
281226	90255	39
281227	90256	39
281228	90257	39
281229	90258	39
281230	90259	39
281231	90260	39
281232	90261	39
281233	90262	39
281234	90263	25
281235	90264	25
281236	90265	25
281237	90266	25
281238	90267	25
281239	90268	25
281240	90269	25
281241	90270	25
281242	90271	34
281243	90272	34
281244	90273	34
281245	90274	34
281246	90275	34
281247	90276	34
281248	90277	34
281249	90278	34
281250	90279	34
281251	90280	34
281252	90281	34
281253	90282	34
281254	90283	34
281255	90284	34
281256	90285	34
281257	90286	34
281258	90287	26
281259	90288	26
281260	90289	26
281261	90290	26
281262	90291	26
281263	90292	26
281264	90293	26
281265	90294	26
281266	90295	26
281267	90296	26
281268	90297	26
281269	90298	26
281270	90299	26
281271	90300	26
281272	90301	26
281273	90302	26
281274	90303	35
281275	90304	35
281276	90305	35
281277	90306	35
281278	90307	35
281279	90308	35
281280	90309	35
281281	90310	35
281282	90311	35
281283	90312	35
281284	90313	35
281285	90314	35
281286	90315	35
281287	90316	35
281288	90317	35
281289	90318	35
281290	90319	36
281291	90320	36
281292	90321	36
281293	90322	36
281294	90323	36
281295	90324	36
281296	90325	36
281297	90326	36
281298	90339	40
281299	90340	40
281300	90341	40
281301	90342	40
281302	90343	40
281303	90344	40
281304	90345	40
281305	90346	40
281306	90347	40
281307	90348	40
281308	90349	40
281309	90350	40
281310	90351	40
281311	90352	40
281312	90353	40
281313	90354	40
281314	90355	41
281315	90356	41
281316	90357	41
281317	90358	41
281318	90359	41
281319	90360	41
281320	90361	41
281321	90362	41
281322	90363	41
281323	90364	41
281324	90365	41
281325	90366	41
281326	90367	41
281327	90368	41
281328	90369	41
281329	90370	41
281330	90371	42
281331	90372	42
281332	90373	42
281333	90374	42
281334	90375	42
281335	90376	42
281336	90377	42
281337	90378	42
281338	90379	43
281339	90380	43
281340	90381	43
281341	90382	43
281342	90383	43
281343	90384	43
281344	90385	43
281345	90386	43
281346	90387	43
281347	90388	43
281348	90389	43
281349	90390	43
281350	90391	43
281351	90392	43
281352	90393	43
281353	90394	43
281354	90395	43
281355	90396	43
281356	90397	43
281357	90398	43
281358	90399	43
281359	90400	43
281360	90401	43
281361	90402	43
281362	90403	43
281363	90404	43
281364	90405	43
281365	90406	43
281366	90407	43
281367	90408	43
281368	90409	43
281369	90410	43
281370	90411	44
281371	90412	44
281372	90413	44
281373	90414	44
281374	90415	44
281375	90416	44
281376	90417	44
281377	90418	44
281378	90419	44
281379	90420	44
281380	90421	44
281381	90422	44
281382	90423	44
281383	90424	44
281384	90425	44
281385	90426	44
281386	90427	42
281387	90428	42
281388	90429	42
281389	90430	42
281390	90431	42
281391	90432	42
281392	90433	42
281393	90434	42
281394	90435	45
281395	90436	45
281396	90437	45
281397	90438	45
281398	90439	45
281399	90440	45
281400	90441	45
281401	90442	45
281402	90443	45
281403	90444	45
281404	90445	45
281405	90446	45
281406	90447	45
281407	90448	45
281408	90449	45
281409	90450	45
281410	90451	46
281411	90452	46
281412	90453	46
281413	90454	46
281414	90455	46
281415	90456	46
281416	90457	46
281417	90458	46
281418	90459	46
281419	90460	46
281420	90461	46
281421	90462	46
281422	90463	46
281423	90464	46
281424	90465	46
281425	90466	46
281426	90467	45
281427	90468	45
281428	90469	45
281429	90470	45
281430	90471	45
281431	90472	45
281432	90473	45
281433	90474	45
281434	90475	47
281435	90476	47
281436	90477	47
281437	90478	47
281438	90479	47
281439	90480	47
281440	90481	47
281441	90482	47
281442	90483	48
281443	90484	48
281444	90485	48
281445	90486	48
281446	90487	48
281447	90488	48
281448	90489	48
281449	90490	48
281450	90491	48
281451	90492	48
281452	90493	48
281453	90494	48
281454	90495	48
281455	90496	48
281456	90497	48
281457	90498	48
281458	90499	12
281459	90500	12
281460	90501	12
281461	90502	12
281462	90503	12
281463	90504	12
281464	90505	12
281465	90506	12
281466	90507	12
281467	90508	12
281468	90509	12
281469	90510	12
281470	90511	12
281471	90512	12
281472	90513	12
281473	90514	12
281474	90515	47
281475	90516	47
281476	90517	47
281477	90518	47
281478	90519	47
281479	90520	47
281480	90521	47
281481	90522	47
281482	90523	47
281483	90524	47
281484	90525	47
281485	90526	47
281486	90527	47
281487	90528	47
281488	90529	47
281489	90530	47
281490	90531	48
281491	90532	48
281492	90533	48
281493	90534	48
281494	90535	48
281495	90536	48
281496	90537	48
281497	90538	48
281498	90539	48
281499	90540	48
281500	90541	48
281501	90542	48
281502	90543	48
281503	90544	48
281504	90545	48
281505	90546	48
281506	90559	41
281507	90560	41
281508	90561	41
281509	90562	41
281510	90563	41
281511	90564	41
281512	90565	41
281513	90566	41
281514	90567	41
281515	90568	41
281516	90569	41
281517	90570	41
281518	90571	41
281519	90572	41
281520	90573	41
281521	90574	41
281522	90575	42
281523	90576	42
281524	90577	42
281525	90578	42
281526	90579	42
281527	90580	42
281528	90581	42
281529	90582	42
281530	90583	43
281531	90584	43
281532	90585	43
281533	90586	43
281534	90587	43
281535	90588	43
281536	90589	43
281537	90590	43
281538	90591	43
281539	90592	43
281540	90593	43
281541	90594	43
281542	90595	43
281543	90596	43
281544	90597	43
281545	90598	43
281546	90599	43
281547	90600	43
281548	90601	43
281549	90602	43
281550	90603	43
281551	90604	43
281552	90605	43
281553	90606	43
281554	90607	43
281555	90608	43
281556	90609	43
281557	90610	43
281558	90611	43
281559	90612	43
281560	90613	43
281561	90614	43
281562	90615	44
281563	90616	44
281564	90617	44
281565	90618	44
281566	90619	44
281567	90620	44
281568	90621	44
281569	90622	44
281570	90623	44
281571	90624	44
281572	90625	44
281573	90626	44
281574	90627	44
281575	90628	44
281576	90629	44
281577	90630	44
281578	90631	42
281579	90632	42
281580	90633	42
281581	90634	42
281582	90635	42
281583	90636	42
281584	90637	42
281585	90638	42
281586	90639	45
281587	90640	45
281588	90641	45
281589	90642	45
281590	90643	45
281591	90644	45
281592	90645	45
281593	90646	45
281594	90647	45
281595	90648	45
281596	90649	45
281597	90650	45
281598	90651	45
281599	90652	45
281600	90653	45
281601	90654	45
281602	90655	46
281603	90656	46
281604	90657	46
281605	90658	46
281606	90659	46
281607	90660	46
281608	90661	46
281609	90662	46
281610	90663	46
281611	90664	46
281612	90665	46
281613	90666	46
281614	90667	46
281615	90668	46
281616	90669	46
281617	90670	46
281618	90671	45
281619	90672	45
281620	90673	45
281621	90674	45
281622	90675	45
281623	90676	45
281624	90677	45
281625	90678	45
281626	90679	47
281627	90680	47
281628	90681	47
281629	90682	47
281630	90683	47
281631	90684	47
281632	90685	47
281633	90686	47
281634	90687	48
281635	90688	48
281636	90689	48
281637	90690	48
281638	90691	48
281639	90692	48
281640	90693	48
281641	90694	48
281642	90695	48
281643	90696	48
281644	90697	48
281645	90698	48
281646	90699	48
281647	90700	48
281648	90701	48
281649	90702	48
281650	90703	41
281651	90704	41
281652	90705	41
281653	90706	41
281654	90707	41
281655	90708	41
281656	90709	41
281657	90710	41
281658	90711	41
281659	90712	41
281660	90713	41
281661	90714	41
281662	90715	41
281663	90716	41
281664	90717	41
281665	90718	41
281666	90719	12
281667	90720	12
281668	90721	12
281669	90722	12
281670	90723	12
281671	90724	12
281672	90725	12
281673	90726	12
281674	90727	12
281675	90728	12
281676	90729	12
281677	90730	12
281678	90731	12
281679	90732	12
281680	90733	12
281681	90734	12
281682	90735	48
281683	90736	48
281684	90737	48
281685	90738	48
281686	90739	48
281687	90740	48
281688	90741	48
281689	90742	48
281690	90743	48
281691	90744	48
281692	90745	48
281693	90746	48
281694	90747	48
281695	90748	48
281696	90749	48
281697	90750	48
281698	90751	47
281699	90752	47
281700	90753	47
281701	90754	47
281702	90755	47
281703	90756	47
281704	90757	47
281705	90758	47
281706	90759	47
281707	90760	47
281708	90761	47
281709	90762	47
281710	90763	47
281711	90764	47
281712	90765	47
281713	90766	47
281714	90767	49
281715	90768	49
281716	90769	49
281717	90770	49
281718	90771	49
281719	90772	49
281720	90773	49
281721	90774	49
281722	90775	49
281723	90776	49
281724	90777	49
281725	90778	49
281726	90779	49
281727	90780	49
281728	90781	49
281729	90782	49
281730	90783	49
281731	90784	49
281732	90785	49
281733	90786	49
281734	90787	49
281735	90788	49
281736	90789	49
281737	90790	49
281738	90791	49
281739	90792	49
281740	90793	49
281741	90794	49
281742	90795	49
281743	90796	49
281744	90797	49
281745	90798	49
281746	90799	50
281747	90800	50
281748	90801	50
281749	90802	50
281750	90803	50
281751	90804	50
281752	90805	50
281753	90806	50
281754	90807	50
281755	90808	50
281756	90809	50
281757	90810	50
281758	90811	50
281759	90812	50
281760	90813	50
281761	90814	50
281762	90815	51
281763	90816	51
281764	90817	51
281765	90818	51
281766	90819	51
281767	90820	51
281768	90821	51
281769	90822	51
281770	90831	52
281771	90832	52
281772	90833	52
281773	90834	52
281774	90835	52
281775	90836	52
281776	90837	52
281777	90838	52
281778	90911	44
281779	90912	44
281780	90913	44
281781	90914	44
281782	90915	44
281783	90916	44
281784	90917	44
281785	90918	44
281786	90919	44
281787	90920	44
281788	90921	44
281789	90922	44
281790	90923	44
281791	90924	44
281792	90925	44
281793	90926	44
281794	90927	44
281795	90928	44
281796	90929	44
281797	90930	44
281798	90931	44
281799	90932	44
281800	90933	44
281801	90934	44
281802	90935	53
281803	90936	53
281804	90937	53
281805	90938	53
281806	90939	53
281807	90940	53
281808	90941	53
281809	90942	53
281810	90943	53
281811	90944	53
281812	90945	53
281813	90946	53
281814	90947	53
281815	90948	53
281816	90949	53
281817	90950	53
281818	90951	53
281819	90952	53
281820	90953	53
281821	90954	53
281822	90955	53
281823	90956	53
281824	90957	53
281825	90958	53
281826	90959	53
281827	90960	53
281828	90961	53
281829	90962	53
281830	90963	53
281831	90964	53
281832	90965	53
281833	90966	53
281834	90967	54
281835	90968	54
281836	90969	54
281837	90970	54
281838	90971	54
281839	90972	54
281840	90973	54
281841	90974	54
281842	90975	55
281843	90976	55
281844	90977	55
281845	90978	55
281846	90979	55
281847	90980	55
281848	90981	55
281849	90982	55
281850	90983	27
281851	90984	27
281852	90985	27
281853	90986	27
281854	90987	27
281855	90988	27
281856	90989	27
281857	90990	27
281858	90991	55
281859	90992	55
281860	90993	55
281861	90994	55
281862	90995	55
281863	90996	55
281864	90997	55
281865	90998	55
281866	90999	53
281867	91000	53
281868	91001	53
281869	91002	53
281870	91003	53
281871	91004	53
281872	91005	53
281873	91006	53
281874	91007	53
281875	91008	53
281876	91009	53
281877	91010	53
281878	91011	53
281879	91012	53
281880	91013	53
281881	91014	53
281882	91015	53
281883	91016	53
281884	91017	53
281885	91018	53
281886	91019	53
281887	91020	53
281888	91021	53
281889	91022	53
281890	91023	53
281891	91024	53
281892	91025	53
281893	91026	53
281894	91027	53
281895	91028	53
281896	91029	53
281897	91030	53
281898	91031	55
281899	91032	55
281900	91033	55
281901	91034	55
281902	91035	55
281903	91036	55
281904	91037	55
281905	91038	55
281906	91103	56
281907	91104	56
281908	91105	56
281909	91106	56
281910	91107	56
281911	91108	56
281912	91109	56
281913	91110	56
281914	91111	57
281915	91112	57
281916	91113	57
281917	91114	57
281918	91115	57
281919	91116	57
281920	91117	57
281921	91118	57
281922	91119	57
281923	91120	57
281924	91121	57
281925	91122	57
281926	91123	57
281927	91124	57
281928	91125	57
281929	91126	57
281930	91127	58
281931	91128	58
281932	91129	58
281933	91130	58
281934	91131	58
281935	91132	58
281936	91133	58
281937	91134	58
281938	91135	49
281939	91136	49
281940	91137	49
281941	91138	49
281942	91139	49
281943	91140	49
281944	91141	49
281945	91142	49
281946	91143	49
281947	91144	49
281948	91145	49
281949	91146	49
281950	91147	49
281951	91148	49
281952	91149	49
281953	91150	49
281954	91151	49
281955	91152	49
281956	91153	49
281957	91154	49
281958	91155	49
281959	91156	49
281960	91157	49
281961	91158	49
281962	91159	49
281963	91160	49
281964	91161	49
281965	91162	49
281966	91163	49
281967	91164	49
281968	91165	49
281969	91166	49
281970	91167	50
281971	91168	50
281972	91169	50
281973	91170	50
281974	91171	50
281975	91172	50
281976	91173	50
281977	91174	50
281978	91175	50
281979	91176	50
281980	91177	50
281981	91178	50
281982	91179	50
281983	91180	50
281984	91181	50
281985	91182	50
281986	91183	51
281987	91184	51
281988	91185	51
281989	91186	51
281990	91187	51
281991	91188	51
281992	91189	51
281993	91190	51
281994	91199	52
281995	91200	52
281996	91201	52
281997	91202	52
281998	91203	52
281999	91204	52
282000	91205	52
282001	91206	52
282002	91279	44
282003	91280	44
282004	91281	44
282005	91282	44
282006	91283	44
282007	91284	44
282008	91285	44
282009	91286	44
282010	91287	44
282011	91288	44
282012	91289	44
282013	91290	44
282014	91291	44
282015	91292	44
282016	91293	44
282017	91294	44
282018	91295	44
282019	91296	44
282020	91297	44
282021	91298	44
282022	91299	44
282023	91300	44
282024	91301	44
282025	91302	44
282026	91303	53
282027	91304	53
282028	91305	53
282029	91306	53
282030	91307	53
282031	91308	53
282032	91309	53
282033	91310	53
282034	91311	53
282035	91312	53
282036	91313	53
282037	91314	53
282038	91315	53
282039	91316	53
282040	91317	53
282041	91318	53
282042	91319	53
282043	91320	53
282044	91321	53
282045	91322	53
282046	91323	53
282047	91324	53
282048	91325	53
282049	91326	53
282050	91327	53
282051	91328	53
282052	91329	53
282053	91330	53
282054	91331	53
282055	91332	53
282056	91333	53
282057	91334	53
282058	91335	54
282059	91336	54
282060	91337	54
282061	91338	54
282062	91339	54
282063	91340	54
282064	91341	54
282065	91342	54
282066	91343	27
282067	91344	27
282068	91345	27
282069	91346	27
282070	91347	27
282071	91348	27
282072	91349	27
282073	91350	27
282074	91351	27
282075	91352	27
282076	91353	27
282077	91354	27
282078	91355	27
282079	91356	27
282080	91357	27
282081	91358	27
282082	91359	27
282083	91360	27
282084	91361	27
282085	91362	27
282086	91363	27
282087	91364	27
282088	91365	27
282089	91366	27
282090	91367	27
282091	91368	27
282092	91369	27
282093	91370	27
282094	91371	27
282095	91372	27
282096	91373	27
282097	91374	27
282098	91375	53
282099	91376	53
282100	91377	53
282101	91378	53
282102	91379	53
282103	91380	53
282104	91381	53
282105	91382	53
282106	91383	53
282107	91384	53
282108	91385	53
282109	91386	53
282110	91387	53
282111	91388	53
282112	91389	53
282113	91390	53
282114	91391	53
282115	91392	53
282116	91393	53
282117	91394	53
282118	91395	53
282119	91396	53
282120	91397	53
282121	91398	53
282122	91399	53
282123	91400	53
282124	91401	53
282125	91402	53
282126	91403	53
282127	91404	53
282128	91405	53
282129	91406	53
282130	91471	56
282131	91472	56
282132	91473	56
282133	91474	56
282134	91475	56
282135	91476	56
282136	91477	56
282137	91478	56
282138	91479	57
282139	91480	57
282140	91481	57
282141	91482	57
282142	91483	57
282143	91484	57
282144	91485	57
282145	91486	57
282146	91487	57
282147	91488	57
282148	91489	57
282149	91490	57
282150	91491	57
282151	91492	57
282152	91493	57
282153	91494	57
282154	91495	58
282155	91496	58
282156	91497	58
282157	91498	58
282158	91499	58
282159	91500	58
282160	91501	58
282161	91502	58
282162	91503	59
282163	91504	59
282164	91505	59
282165	91506	59
282166	91507	59
282167	91508	59
282168	91509	59
282169	91510	59
282170	91511	60
282171	91512	60
282172	91513	60
282173	91514	60
282174	91515	60
282175	91516	60
282176	91517	60
282177	91518	60
282178	91519	60
282179	91520	60
282180	91521	60
282181	91522	60
282182	91523	60
282183	91524	60
282184	91525	60
282185	91526	60
282186	91527	60
282187	91528	60
282188	91529	60
282189	91530	60
282190	91531	60
282191	91532	60
282192	91533	60
282193	91534	60
282194	91535	61
282195	91536	61
282196	91537	61
282197	91538	61
282198	91539	61
282199	91540	61
282200	91541	61
282201	91542	61
282202	91543	61
282203	91544	61
282204	91545	61
282205	91546	61
282206	91547	61
282207	91548	61
282208	91549	61
282209	91550	61
282210	91551	62
282211	91552	62
282212	91553	62
282213	91554	62
282214	91555	62
282215	91556	62
282216	91557	62
282217	91558	62
282218	91559	62
282219	91560	62
282220	91561	62
282221	91562	62
282222	91563	62
282223	91564	62
282224	91565	62
282225	91566	62
282226	91567	40
282227	91568	40
282228	91569	40
282229	91570	40
282230	91571	40
282231	91572	40
282232	91573	40
282233	91574	40
282234	91575	40
282235	91576	40
282236	91577	40
282237	91578	40
282238	91579	40
282239	91580	40
282240	91581	40
282241	91582	40
282242	91583	43
282243	91584	43
282244	91585	43
282245	91586	43
282246	91587	43
282247	91588	43
282248	91589	43
282249	91590	43
282250	91591	42
282251	91592	42
282252	91593	42
282253	91594	42
282254	91595	42
282255	91596	42
282256	91597	42
282257	91598	42
282258	91599	43
282259	91600	43
282260	91601	43
282261	91602	43
282262	91603	43
282263	91604	43
282264	91605	43
282265	91606	43
282266	91607	63
282267	91608	63
282268	91609	63
282269	91610	63
282270	91611	63
282271	91612	63
282272	91613	63
282273	91614	63
282274	91615	42
282275	91616	42
282276	91617	42
282277	91618	42
282278	91619	42
282279	91620	42
282280	91621	42
282281	91622	42
282282	91623	63
282283	91624	63
282284	91625	63
282285	91626	63
282286	91627	63
282287	91628	63
282288	91629	63
282289	91630	63
282290	91807	51
282291	91808	51
282292	91809	51
282293	91810	51
282294	91811	51
282295	91812	51
282296	91813	51
282297	91814	51
282298	91815	51
282299	91816	51
282300	91817	51
282301	91818	51
282302	91819	51
282303	91820	51
282304	91821	51
282305	91822	51
282306	91823	51
282307	91824	51
282308	91825	51
282309	91826	51
282310	91827	51
282311	91828	51
282312	91829	51
282313	91830	51
282314	91831	51
282315	91832	51
282316	91833	51
282317	91834	51
282318	91835	51
282319	91836	51
282320	91837	51
282321	91838	51
282322	91839	64
282323	91840	64
282324	91841	64
282325	91842	64
282326	91843	64
282327	91844	64
282328	91845	64
282329	91846	64
282330	91847	64
282331	91848	64
282332	91849	64
282333	91850	64
282334	91851	64
282335	91852	64
282336	91853	64
282337	91854	64
282338	91855	40
282339	91856	40
282340	91857	40
282341	91858	40
282342	91859	40
282343	91860	40
282344	91861	40
282345	91862	40
282346	91863	52
282347	91864	52
282348	91865	52
282349	91866	52
282350	91867	52
282351	91868	52
282352	91869	52
282353	91870	52
282354	91871	52
282355	91872	52
282356	91873	52
282357	91874	52
282358	91875	52
282359	91876	52
282360	91877	52
282361	91878	52
282362	91895	40
282363	91896	40
282364	91897	40
282365	91898	40
282366	91899	40
282367	91900	40
282368	91901	40
282369	91902	40
282370	91919	65
282371	91920	65
282372	91921	65
282373	91922	65
282374	91923	65
282375	91924	65
282376	91925	65
282377	91926	65
282378	91927	66
282379	91928	66
282380	91929	66
282381	91930	66
282382	91931	66
282383	91932	66
282384	91933	66
282385	91934	66
282386	91935	67
282387	91936	67
282388	91937	67
282389	91938	67
282390	91939	67
282391	91940	67
282392	91941	67
282393	91942	67
282394	91943	67
282395	91944	67
282396	91945	67
282397	91946	67
282398	91947	67
282399	91948	67
282400	91949	67
282401	91950	67
282402	91951	68
282403	91952	68
282404	91953	68
282405	91954	68
282406	91955	68
282407	91956	68
282408	91957	68
282409	91958	68
282410	91959	69
282411	91960	69
282412	91961	69
282413	91962	69
282414	91963	69
282415	91964	69
282416	91965	69
282417	91966	69
282418	91967	7
282419	91968	4
282420	91969	9
282421	91970	0
282422	91971	70
282423	91973	5
282424	91974	71
282425	91975	13
282426	91977	14
282427	91979	10
282428	91981	8
282429	91983	4
282430	91985	7
282431	91986	71
282432	91987	70
282433	91988	15
282434	91989	5
282435	91990	72
282436	91991	13
282437	91993	14
282438	91995	10
282439	91997	8
282440	91999	4
282441	92000	7
282442	92002	22
282443	92003	5
282444	92004	10
282445	92005	73
282446	92006	74
282447	92007	13
282448	92009	14
282449	92011	10
282450	92013	8
282451	92016	4
282452	92017	1
282453	92018	22
282454	92019	75
282455	92020	5
282456	92021	10
282457	92022	73
282458	92023	13
282459	92025	14
282460	92027	10
282461	92029	8
282462	92032	76
282463	92033	29
282464	92034	25
282465	92035	77
282466	92036	77
282467	92037	27
282468	92039	25
282469	92041	34
282470	92044	32
282471	92046	26
282472	92047	26
282473	92048	25
282474	92049	76
282475	92050	78
282476	92051	79
282477	92052	78
282478	92054	27
282479	92056	25
282480	92058	34
282481	92061	32
282482	92063	26
282483	92064	26
282484	92065	44
282485	92066	43
282486	92068	45
282487	92069	45
282488	92070	42
282489	92071	42
282490	92072	46
282491	92073	46
282492	92074	48
282493	92075	48
282494	92076	41
282495	92077	41
282496	92078	47
282497	92079	47
282498	92080	44
282499	92081	43
282500	92083	45
282501	92084	45
282502	92085	42
282503	92086	42
282504	92087	46
282505	92088	46
282506	92089	48
282507	92090	48
282508	92091	41
282509	92092	41
282510	92093	47
282511	92094	80
282512	92096	81
282513	92097	53
282514	92098	57
282515	92099	52
282516	92100	51
282517	92102	51
282518	92103	51
282519	92104	51
282520	92105	53
282521	92106	53
282522	92107	44
282523	92108	44
282524	92109	82
282525	92110	82
282526	92111	27
282527	92112	27
282528	92114	81
282529	92115	53
282530	92116	57
282531	92117	52
282532	92118	51
282533	92120	51
282534	92121	51
282535	92122	51
282536	92123	53
282537	92124	53
282538	92125	44
282539	92126	44
282540	92127	82
282541	92128	82
282542	92129	27
282543	92130	27
282544	92131	40
282545	92132	40
282546	92133	43
282547	92134	43
282548	92135	60
282549	92137	63
282550	92138	63
282551	92139	42
282552	92140	62
282553	92141	62
282554	92142	51
282555	92143	7
282556	92144	65
282557	92145	64
282558	92146	51
282559	92147	51
282560	92148	52
282561	92149	40
282562	92150	68
282563	92151	40
282564	92152	40
282565	92153	67
282566	92154	51
282567	92155	51
282568	92156	51
282569	92157	7
295310	113402	0
295311	113403	0
295312	113404	0
295313	113405	0
295314	113406	0
295315	113407	0
295316	113408	0
295317	113409	0
295318	113410	0
295319	113411	0
295320	113412	0
295321	113413	0
295322	113414	0
295323	113415	0
295324	113416	0
295325	113417	0
295326	113434	3
295327	113435	3
295328	113436	3
295329	113437	3
295330	113438	3
295331	113439	3
295332	113440	3
295333	113441	3
295334	113442	3
295335	113443	3
295336	113444	3
295337	113445	3
295338	113446	3
295339	113447	3
295340	113448	3
295341	113449	3
295342	113450	59
295343	113451	59
295344	113452	59
295345	113453	59
295346	113454	59
295347	113455	59
295348	113456	59
295349	113457	59
295350	113458	59
295351	113459	59
295352	113460	59
295353	113461	59
295354	113462	59
295355	113463	59
295356	113464	59
295357	113465	59
295358	113482	8
295359	113483	8
295360	113484	8
295361	113485	8
295362	113486	8
295363	113487	8
295364	113488	8
295365	113489	8
295366	113490	8
295367	113491	8
295368	113492	8
295369	113493	8
295370	113494	8
295371	113495	8
295372	113496	8
295373	113497	8
295374	113498	7
295375	113499	7
295376	113500	7
295377	113501	7
295378	113502	7
295379	113503	7
295380	113504	7
295381	113505	7
295382	113506	7
295383	113507	7
295384	113508	7
295385	113509	7
295386	113510	7
295387	113511	7
295388	113512	7
295389	113513	7
295390	113514	7
295391	113515	7
295392	113516	7
295393	113517	7
295394	113518	7
295395	113519	7
295396	113520	7
295397	113521	7
295398	113522	7
295399	113523	7
295400	113524	7
295401	113525	7
295402	113526	7
295403	113527	7
295404	113528	7
295405	113529	7
295406	113530	12
295407	113531	12
295408	113532	12
295409	113533	12
295410	113534	12
295411	113535	12
295412	113536	12
295413	113537	12
295414	113538	83
295415	113539	83
295416	113540	83
295417	113541	83
295418	113542	83
295419	113543	83
295420	113544	83
295421	113545	83
295422	113546	10
295423	113547	10
295424	113548	10
295425	113549	10
295426	113550	10
295427	113551	10
295428	113552	10
295429	113553	10
295430	113554	10
295431	113555	10
295432	113556	10
295433	113557	10
295434	113558	10
295435	113559	10
295436	113560	10
295437	113561	10
295438	113562	83
295439	113563	83
295440	113564	83
295441	113565	83
295442	113566	83
295443	113567	83
295444	113568	83
295445	113569	83
295446	113570	83
295447	113571	83
295448	113572	83
295449	113573	83
295450	113574	83
295451	113575	83
295452	113576	83
295453	113577	83
295454	113578	10
295455	113579	10
295456	113580	10
295457	113581	10
295458	113582	10
295459	113583	10
295460	113584	10
295461	113585	10
295462	113586	10
295463	113587	10
295464	113588	10
295465	113589	10
295466	113590	10
295467	113591	10
295468	113592	10
295469	113593	10
295470	113594	63
295471	113595	63
295472	113596	63
295473	113597	63
295474	113598	63
295475	113599	63
295476	113600	63
295477	113601	63
295478	113602	63
295479	113603	63
295480	113604	63
295481	113605	63
295482	113606	63
295483	113607	63
295484	113608	63
295485	113609	63
295486	113610	84
295487	113611	84
295488	113612	84
295489	113613	84
295490	113614	84
295491	113615	84
295492	113616	84
295493	113617	84
295494	113618	84
295495	113619	84
295496	113620	84
295497	113621	84
295498	113622	84
295499	113623	84
295500	113624	84
295501	113625	84
295502	113626	12
295503	113627	12
295504	113628	12
295505	113629	12
295506	113630	12
295507	113631	12
295508	113632	12
295509	113633	12
295510	113634	12
295511	113635	12
295512	113636	12
295513	113637	12
295514	113638	12
295515	113639	12
295516	113640	12
295517	113641	12
295518	113642	14
295519	113643	14
295520	113644	14
295521	113645	14
295522	113646	14
295523	113647	14
295524	113648	14
295525	113649	14
295526	113650	14
295527	113651	14
295528	113652	14
295529	113653	14
295530	113654	14
295531	113655	14
295532	113656	14
295533	113657	14
295534	113658	14
295535	113659	14
295536	113660	14
295537	113661	14
295538	113662	14
295539	113663	14
295540	113664	14
295541	113665	14
295542	113666	14
295543	113667	14
295544	113668	14
295545	113669	14
295546	113670	14
295547	113671	14
295548	113672	14
295549	113673	14
295550	113674	15
295551	113675	15
295552	113676	15
295553	113677	15
295554	113678	15
295555	113679	15
295556	113680	15
295557	113681	15
295558	113682	15
295559	113683	15
295560	113684	15
295561	113685	15
295562	113686	15
295563	113687	15
295564	113688	15
295565	113689	15
295566	113690	36
295567	113691	36
295568	113692	36
295569	113693	36
295570	113694	36
295571	113695	36
295572	113696	36
295573	113697	36
295574	113698	36
295575	113699	36
295576	113700	36
295577	113701	36
295578	113702	36
295579	113703	36
295580	113704	36
295581	113705	36
295582	113706	16
295583	113707	16
295584	113708	16
295585	113709	16
295586	113710	16
295587	113711	16
295588	113712	16
295589	113713	16
295590	113714	16
295591	113715	16
295592	113716	16
295593	113717	16
295594	113718	16
295595	113719	16
295596	113720	16
295597	113721	16
295598	113738	1
295599	113739	1
295600	113740	1
295601	113741	1
295602	113742	1
295603	113743	1
295604	113744	1
295605	113745	1
295606	113746	1
295607	113747	1
295608	113748	1
295609	113749	1
295610	113750	1
295611	113751	1
295612	113752	1
295613	113753	1
295614	113754	2
295615	113755	2
295616	113756	2
295617	113757	2
295618	113758	2
295619	113759	2
295620	113760	2
295621	113761	2
295622	113762	2
295623	113763	2
295624	113764	2
295625	113765	2
295626	113766	2
295627	113767	2
295628	113768	2
295629	113769	2
295630	113770	85
295631	113771	85
295632	113772	85
295633	113773	85
295634	113774	85
295635	113775	85
295636	113776	85
295637	113777	85
295638	113778	85
295639	113779	85
295640	113780	85
295641	113781	85
295642	113782	85
295643	113783	85
295644	113784	85
295645	113785	85
295646	113786	86
295647	113787	86
295648	113788	86
295649	113789	86
295650	113790	86
295651	113791	86
295652	113792	86
295653	113793	86
295654	113794	86
295655	113795	86
295656	113796	86
295657	113797	86
295658	113798	86
295659	113799	86
295660	113800	86
295661	113801	86
295662	113818	83
295663	113819	83
295664	113820	83
295665	113821	83
295666	113822	83
295667	113823	83
295668	113824	83
295669	113825	83
295670	113826	83
295671	113827	83
295672	113828	83
295673	113829	83
295674	113830	83
295675	113831	83
295676	113832	83
295677	113833	83
295678	113834	15
295679	113835	15
295680	113836	15
295681	113837	15
295682	113838	15
295683	113839	15
295684	113840	15
295685	113841	15
295686	113842	15
295687	113843	15
295688	113844	15
295689	113845	15
295690	113846	15
295691	113847	15
295692	113848	15
295693	113849	15
295694	113850	11
295695	113851	11
295696	113852	11
295697	113853	11
295698	113854	11
295699	113855	11
295700	113856	11
295701	113857	11
295702	113858	11
295703	113859	11
295704	113860	11
295705	113861	11
295706	113862	11
295707	113863	11
295708	113864	11
295709	113865	11
295710	113866	11
295711	113867	11
295712	113868	11
295713	113869	11
295714	113870	11
295715	113871	11
295716	113872	11
295717	113873	11
295718	113874	11
295719	113875	11
295720	113876	11
295721	113877	11
295722	113878	11
295723	113879	11
295724	113880	11
295725	113881	11
295726	113882	12
295727	113883	12
295728	113884	12
295729	113885	12
295730	113886	12
295731	113887	12
295732	113888	12
295733	113889	12
295734	113890	12
295735	113891	12
295736	113892	12
295737	113893	12
295738	113894	12
295739	113895	12
295740	113896	12
295741	113897	12
295742	113898	92
295743	113899	92
295744	113900	92
295745	113901	92
295746	113902	92
295747	113903	92
295748	113904	92
295749	113905	92
295750	113906	92
295751	113907	92
295752	113908	92
295753	113909	92
295754	113910	92
295755	113911	92
295756	113912	92
295757	113913	92
295758	113914	36
295759	113915	36
295760	113916	36
295761	113917	36
295762	113918	36
295763	113919	36
295764	113920	36
295765	113921	36
295766	113922	60
295767	113923	60
295768	113924	60
295769	113925	60
295770	113926	60
295771	113927	60
295772	113928	60
295773	113929	60
295774	113930	60
295775	113931	60
295776	113932	60
295777	113933	60
295778	113934	60
295779	113935	60
295780	113936	60
295781	113937	60
295782	113938	60
295783	113939	60
295784	113940	60
295785	113941	60
295786	113942	60
295787	113943	60
295788	113944	60
295789	113945	60
295790	113946	60
295791	113947	60
295792	113948	60
295793	113949	60
295794	113950	60
295795	113951	60
295796	113952	60
295797	113953	60
295798	113954	10
295799	113955	10
295800	113956	10
295801	113957	10
295802	113958	10
295803	113959	10
295804	113960	10
295805	113961	10
295806	113962	10
295807	113963	10
295808	113964	10
295809	113965	10
295810	113966	10
295811	113967	10
295812	113968	10
295813	113969	10
295814	113970	10
295815	113971	10
295816	113972	10
295817	113973	10
295818	113974	10
295819	113975	10
295820	113976	10
295821	113977	10
295822	113978	10
295823	113979	10
295824	113980	10
295825	113981	10
295826	113982	10
295827	113983	10
295828	113984	10
295829	113985	10
295830	113986	1
295831	113987	1
295832	113988	1
295833	113989	1
295834	113990	1
295835	113991	1
295836	113992	1
295837	113993	1
295838	113994	1
295839	113995	1
295840	113996	1
295841	113997	1
295842	113998	1
295843	113999	1
295844	114000	1
295845	114001	1
295846	114002	86
295847	114003	86
295848	114004	86
295849	114005	86
295850	114006	86
295851	114007	86
295852	114008	86
295853	114009	86
295854	114010	86
295855	114011	86
295856	114012	86
295857	114013	86
295858	114014	86
295859	114015	86
295860	114016	86
295861	114017	86
295862	114034	7
295863	114035	7
295864	114036	7
295865	114037	7
295866	114038	7
295867	114039	7
295868	114040	7
295869	114041	7
295870	114042	7
295871	114043	7
295872	114044	7
295873	114045	7
295874	114046	7
295875	114047	7
295876	114048	7
295877	114049	7
295878	114066	87
295879	114067	87
295880	114068	87
295881	114069	87
295882	114070	87
295883	114071	87
295884	114072	87
295885	114073	87
295886	114074	87
295887	114075	87
295888	114076	87
295889	114077	87
295890	114078	87
295891	114079	87
295892	114080	87
295893	114081	87
295894	114082	22
295895	114083	22
295896	114084	22
295897	114085	22
295898	114086	22
295899	114087	22
295900	114088	22
295901	114089	22
295902	114090	22
295903	114091	22
295904	114092	22
295905	114093	22
295906	114094	22
295907	114095	22
295908	114096	22
295909	114097	22
295910	114098	2
295911	114099	2
295912	114100	2
295913	114101	2
295914	114102	2
295915	114103	2
295916	114104	2
295917	114105	2
295918	114106	2
295919	114107	2
295920	114108	2
295921	114109	2
295922	114110	2
295923	114111	2
295924	114112	2
295925	114113	2
295926	114114	10
295927	114115	10
295928	114116	10
295929	114117	10
295930	114118	10
295931	114119	10
295932	114120	10
295933	114121	10
295934	114122	10
295935	114123	10
295936	114124	10
295937	114125	10
295938	114126	10
295939	114127	10
295940	114128	10
295941	114129	10
295942	114130	10
295943	114131	10
295944	114132	10
295945	114133	10
295946	114134	10
295947	114135	10
295948	114136	10
295949	114137	10
295950	114138	10
295951	114139	10
295952	114140	10
295953	114141	10
295954	114142	10
295955	114143	10
295956	114144	10
295957	114145	10
295958	114146	85
295959	114147	85
295960	114148	85
295961	114149	85
295962	114150	85
295963	114151	85
295964	114152	85
295965	114153	85
295966	114154	85
295967	114155	85
295968	114156	85
295969	114157	85
295970	114158	85
295971	114159	85
295972	114160	85
295973	114161	85
295974	114178	14
295975	114179	14
295976	114180	14
295977	114181	14
295978	114182	14
295979	114183	14
295980	114184	14
295981	114185	14
295982	114186	14
295983	114187	14
295984	114188	14
295985	114189	14
295986	114190	14
295987	114191	14
295988	114192	14
295989	114193	14
295990	114194	8
295991	114195	8
295992	114196	8
295993	114197	8
295994	114198	8
295995	114199	8
295996	114200	8
295997	114201	8
295998	114202	8
295999	114203	8
296000	114204	8
296001	114205	8
296002	114206	8
296003	114207	8
296004	114208	8
296005	114209	8
296006	114210	10
296007	114211	10
296008	114212	10
296009	114213	10
296010	114214	10
296011	114215	10
296012	114216	10
296013	114217	10
296014	114218	10
296015	114219	10
296016	114220	10
296017	114221	10
296018	114222	10
296019	114223	10
296020	114224	10
296021	114225	10
296022	114226	83
296023	114227	83
296024	114228	83
296025	114229	83
296026	114230	83
296027	114231	83
296028	114232	83
296029	114233	83
296030	114234	83
296031	114235	83
296032	114236	83
296033	114237	83
296034	114238	83
296035	114239	83
296036	114240	83
296037	114241	83
296038	114258	22
296039	114259	22
296040	114260	22
296041	114261	22
296042	114262	22
296043	114263	22
296044	114264	22
296045	114265	22
296046	114266	22
296047	114267	22
296048	114268	22
296049	114269	22
296050	114270	22
296051	114271	22
296052	114272	22
296053	114273	22
296054	114274	23
296055	114275	23
296056	114276	23
296057	114277	23
296058	114278	23
296059	114279	23
296060	114280	23
296061	114281	23
296062	114282	23
296063	114283	23
296064	114284	23
296065	114285	23
296066	114286	23
296067	114287	23
296068	114288	23
296069	114289	23
296070	114290	23
296071	114291	23
296072	114292	23
296073	114293	23
296074	114294	23
296075	114295	23
296076	114296	23
296077	114297	23
296078	114298	23
296079	114299	23
296080	114300	23
296081	114301	23
296082	114302	23
296083	114303	23
296084	114304	23
296085	114305	23
296086	114306	26
296087	114307	26
296088	114308	26
296089	114309	26
296090	114310	26
296091	114311	26
296092	114312	26
296093	114313	26
296094	114314	26
296095	114315	26
296096	114316	26
296097	114317	26
296098	114318	26
296099	114319	26
296100	114320	26
296101	114321	26
296102	114322	26
296103	114323	26
296104	114324	26
296105	114325	26
296106	114326	26
296107	114327	26
296108	114328	26
296109	114329	26
296110	114330	26
296111	114331	26
296112	114332	26
296113	114333	26
296114	114334	26
296115	114335	26
296116	114336	26
296117	114337	26
296118	114338	34
296119	114339	34
296120	114340	34
296121	114341	34
296122	114342	34
296123	114343	34
296124	114344	34
296125	114345	34
296126	114346	34
296127	114347	34
296128	114348	34
296129	114349	34
296130	114350	34
296131	114351	34
296132	114352	34
296133	114353	34
296134	114354	27
296135	114355	27
296136	114356	27
296137	114357	27
296138	114358	27
296139	114359	27
296140	114360	27
296141	114361	27
296142	114362	27
296143	114363	27
296144	114364	27
296145	114365	27
296146	114366	27
296147	114367	27
296148	114368	27
296149	114369	27
296150	114370	88
296151	114371	88
296152	114372	88
296153	114373	88
296154	114374	88
296155	114375	88
296156	114376	88
296157	114377	88
296158	114386	27
296159	114387	27
296160	114388	27
296161	114389	27
296162	114390	27
296163	114391	27
296164	114392	27
296165	114393	27
296166	114394	27
296167	114395	27
296168	114396	27
296169	114397	27
296170	114398	27
296171	114399	27
296172	114400	27
296173	114401	27
296174	114402	27
296175	114403	27
296176	114404	27
296177	114405	27
296178	114406	27
296179	114407	27
296180	114408	27
296181	114409	27
296182	114410	27
296183	114411	27
296184	114412	27
296185	114413	27
296186	114414	27
296187	114415	27
296188	114416	27
296189	114417	27
296190	114418	89
296191	114419	89
296192	114420	89
296193	114421	89
296194	114422	89
296195	114423	89
296196	114424	89
296197	114425	89
296198	114426	89
296199	114427	89
296200	114428	89
296201	114429	89
296202	114430	89
296203	114431	89
296204	114432	89
296205	114433	89
296206	114466	27
296207	114467	27
296208	114468	27
296209	114469	27
296210	114470	27
296211	114471	27
296212	114472	27
296213	114473	27
296214	114474	27
296215	114475	27
296216	114476	27
296217	114477	27
296218	114478	27
296219	114479	27
296220	114480	27
296221	114481	27
296222	114482	34
296223	114483	34
296224	114484	34
296225	114485	34
296226	114486	34
296227	114487	34
296228	114488	34
296229	114489	34
296230	114490	34
296231	114491	34
296232	114492	34
296233	114493	34
296234	114494	34
296235	114495	34
296236	114496	34
296237	114497	34
296238	114506	93
296239	114507	93
296240	114508	93
296241	114509	93
296242	114510	93
296243	114511	93
296244	114512	93
296245	114513	93
296246	114514	93
296247	114515	93
296248	114516	93
296249	114517	93
296250	114518	93
296251	114519	93
296252	114520	93
296253	114521	93
296254	114538	35
296255	114539	35
296256	114540	35
296257	114541	35
296258	114542	35
296259	114543	35
296260	114544	35
296261	114545	35
296262	114546	12
296263	114547	12
296264	114548	12
296265	114549	12
296266	114550	12
296267	114551	12
296268	114552	12
296269	114553	12
296270	114562	45
296271	114563	45
296272	114564	45
296273	114565	45
296274	114566	45
296275	114567	45
296276	114568	45
296277	114569	45
296278	114570	45
296279	114571	45
296280	114572	45
296281	114573	45
296282	114574	45
296283	114575	45
296284	114576	45
296285	114577	45
296286	114578	34
296287	114579	34
296288	114580	34
296289	114581	34
296290	114582	34
296291	114583	34
296292	114584	34
296293	114585	34
296294	114586	34
296295	114587	34
296296	114588	34
296297	114589	34
296298	114590	34
296299	114591	34
296300	114592	34
296301	114593	34
296302	114594	55
296303	114595	55
296304	114596	55
296305	114597	55
296306	114598	55
296307	114599	55
296308	114600	55
296309	114601	55
296310	114602	55
296311	114603	55
296312	114604	55
296313	114605	55
296314	114606	55
296315	114607	55
296316	114608	55
296317	114609	55
296318	114618	88
296319	114619	88
296320	114620	88
296321	114621	88
296322	114622	88
296323	114623	88
296324	114624	88
296325	114625	88
296326	114642	88
296327	114643	88
296328	114644	88
296329	114645	88
296330	114646	88
296331	114647	88
296332	114648	88
296333	114649	88
296334	114650	89
296335	114651	89
296336	114652	89
296337	114653	89
296338	114654	89
296339	114655	89
296340	114656	89
296341	114657	89
296342	114674	26
296343	114675	26
296344	114676	26
296345	114677	26
296346	114678	26
296347	114679	26
296348	114680	26
296349	114681	26
296350	114682	26
296351	114683	26
296352	114684	26
296353	114685	26
296354	114686	26
296355	114687	26
296356	114688	26
296357	114689	26
296358	114714	55
296359	114715	55
296360	114716	55
296361	114717	55
296362	114718	55
296363	114719	55
296364	114720	55
296365	114721	55
296366	114722	55
296367	114723	55
296368	114724	55
296369	114725	55
296370	114726	55
296371	114727	55
296372	114728	55
296373	114729	55
296374	114730	35
296375	114731	35
296376	114732	35
296377	114733	35
296378	114734	35
296379	114735	35
296380	114736	35
296381	114737	35
296382	114738	35
296383	114739	35
296384	114740	35
296385	114741	35
296386	114742	35
296387	114743	35
296388	114744	35
296389	114745	35
296390	114746	12
296391	114747	12
296392	114748	12
296393	114749	12
296394	114750	12
296395	114751	12
296396	114752	12
296397	114753	12
296398	114818	52
296399	114819	52
296400	114820	52
296401	114821	52
296402	114822	52
296403	114823	52
296404	114824	52
296405	114825	52
296406	114826	51
296407	114827	51
296408	114828	51
296409	114829	51
296410	114830	51
296411	114831	51
296412	114832	51
296413	114833	51
296414	114834	52
296415	114835	52
296416	114836	52
296417	114837	52
296418	114838	52
296419	114839	52
296420	114840	52
296421	114841	52
296422	114842	59
296423	114843	59
296424	114844	59
296425	114845	59
296426	114846	59
296427	114847	59
296428	114848	59
296429	114849	59
296430	114850	94
296431	114851	94
296432	114852	94
296433	114853	94
296434	114854	94
296435	114855	94
296436	114856	94
296437	114857	94
296438	114858	51
296439	114859	51
296440	114860	51
296441	114861	51
296442	114862	51
296443	114863	51
296444	114864	51
296445	114865	51
296446	114866	52
296447	114867	52
296448	114868	52
296449	114869	52
296450	114870	52
296451	114871	52
296452	114872	52
296453	114873	52
296454	114874	51
296455	114875	51
296456	114876	51
296457	114877	51
296458	114878	51
296459	114879	51
296460	114880	51
296461	114881	51
296462	114882	49
296463	114883	49
296464	114884	49
296465	114885	49
296466	114886	49
296467	114887	49
296468	114888	49
296469	114889	49
296470	114890	49
296471	114891	49
296472	114892	49
296473	114893	49
296474	114894	49
296475	114895	49
296476	114896	49
296477	114897	49
296478	114898	39
296479	114899	39
296480	114900	39
296481	114901	39
296482	114902	39
296483	114903	39
296484	114904	39
296485	114905	39
296486	114906	39
296487	114907	39
296488	114908	39
296489	114909	39
296490	114910	39
296491	114911	39
296492	114912	39
296493	114913	39
296494	114914	44
296495	114915	44
296496	114916	44
296497	114917	44
296498	114918	44
296499	114919	44
296500	114920	44
296501	114921	44
296502	114922	44
296503	114923	44
296504	114924	44
296505	114925	44
296506	114926	44
296507	114927	44
296508	114928	44
296509	114929	44
296510	114930	44
296511	114931	44
296512	114932	44
296513	114933	44
296514	114934	44
296515	114935	44
296516	114936	44
296517	114937	44
296518	114938	44
296519	114939	44
296520	114940	44
296521	114941	44
296522	114942	44
296523	114943	44
296524	114944	44
296525	114945	44
296526	114946	42
296527	114947	42
296528	114948	42
296529	114949	42
296530	114950	42
296531	114951	42
296532	114952	42
296533	114953	42
296534	114954	42
296535	114955	42
296536	114956	42
296537	114957	42
296538	114958	42
296539	114959	42
296540	114960	42
296541	114961	42
296542	115026	47
296543	115027	47
296544	115028	47
296545	115029	47
296546	115030	47
296547	115031	47
296548	115032	47
296549	115033	47
296550	115034	53
296551	115035	53
296552	115036	53
296553	115037	53
296554	115038	53
296555	115039	53
296556	115040	53
296557	115041	53
296558	115042	53
296559	115043	53
296560	115044	53
296561	115045	53
296562	115046	53
296563	115047	53
296564	115048	53
296565	115049	53
296566	115050	48
296567	115051	48
296568	115052	48
296569	115053	48
296570	115054	48
296571	115055	48
296572	115056	48
296573	115057	48
296574	115058	48
296575	115059	48
296576	115060	48
296577	115061	48
296578	115062	48
296579	115063	48
296580	115064	48
296581	115065	48
296582	115066	48
296583	115067	48
296584	115068	48
296585	115069	48
296586	115070	48
296587	115071	48
296588	115072	48
296589	115073	48
296590	115074	48
296591	115075	48
296592	115076	48
296593	115077	48
296594	115078	48
296595	115079	48
296596	115080	48
296597	115081	48
296598	115082	53
296599	115083	53
296600	115084	53
296601	115085	53
296602	115086	53
296603	115087	53
296604	115088	53
296605	115089	53
296606	115090	53
296607	115091	53
296608	115092	53
296609	115093	53
296610	115094	53
296611	115095	53
296612	115096	53
296613	115097	53
296614	115098	47
296615	115099	47
296616	115100	47
296617	115101	47
296618	115102	47
296619	115103	47
296620	115104	47
296621	115105	47
296622	115106	47
296623	115107	47
296624	115108	47
296625	115109	47
296626	115110	47
296627	115111	47
296628	115112	47
296629	115113	47
296630	115114	16
296631	115115	16
296632	115116	16
296633	115117	16
296634	115118	16
296635	115119	16
296636	115120	16
296637	115121	16
296638	115122	16
296639	115123	16
296640	115124	16
296641	115125	16
296642	115126	16
296643	115127	16
296644	115128	16
296645	115129	16
296646	115194	59
296647	115195	59
296648	115196	59
296649	115197	59
296650	115198	59
296651	115199	59
296652	115200	59
296653	115201	59
296654	115202	30
296655	115203	30
296656	115204	30
296657	115205	30
296658	115206	30
296659	115207	30
296660	115208	30
296661	115209	30
296662	115210	30
296663	115211	30
296664	115212	30
296665	115213	30
296666	115214	30
296667	115215	30
296668	115216	30
296669	115217	30
296670	115282	53
296671	115283	53
296672	115284	53
296673	115285	53
296674	115286	53
296675	115287	53
296676	115288	53
296677	115289	53
296678	115290	53
296679	115291	53
296680	115292	53
296681	115293	53
296682	115294	53
296683	115295	53
296684	115296	53
296685	115297	53
296686	115298	47
296687	115299	47
296688	115300	47
296689	115301	47
296690	115302	47
296691	115303	47
296692	115304	47
296693	115305	47
296694	115306	47
296695	115307	47
296696	115308	47
296697	115309	47
296698	115310	47
296699	115311	47
296700	115312	47
296701	115313	47
296702	115314	48
296703	115315	48
296704	115316	48
296705	115317	48
296706	115318	48
296707	115319	48
296708	115320	48
296709	115321	48
296710	115322	48
296711	115323	48
296712	115324	48
296713	115325	48
296714	115326	48
296715	115327	48
296716	115328	48
296717	115329	48
296718	115330	95
296719	115331	95
296720	115332	95
296721	115333	95
296722	115334	90
296723	115335	90
296724	115336	90
296725	115337	90
296726	115338	90
296727	115339	90
296728	115340	90
296729	115341	90
296730	115342	90
296731	115343	90
296732	115344	90
296733	115345	90
296734	115346	90
296735	115347	90
296736	115348	90
296737	115349	90
296738	115350	90
296739	115351	90
296740	115352	90
296741	115353	90
296742	115354	90
296743	115355	90
296744	115356	90
296745	115357	90
296746	115358	90
296747	115359	90
296748	115360	90
296749	115361	90
296750	115362	90
296751	115363	90
296752	115364	90
296753	115365	90
296754	115430	49
296755	115431	49
296756	115432	49
296757	115433	49
296758	115434	49
296759	115435	49
296760	115436	49
296761	115437	49
296762	115438	49
296763	115439	49
296764	115440	49
296765	115441	49
296766	115442	49
296767	115443	49
296768	115444	49
296769	115445	49
296770	115446	39
296771	115447	39
296772	115448	39
296773	115449	39
296774	115450	39
296775	115451	39
296776	115452	39
296777	115453	39
296778	115454	39
296779	115455	39
296780	115456	39
296781	115457	39
296782	115458	39
296783	115459	39
296784	115460	39
296785	115461	39
296786	115462	44
296787	115463	44
296788	115464	44
296789	115465	44
296790	115466	44
296791	115467	44
296792	115468	44
296793	115469	44
296794	115470	44
296795	115471	44
296796	115472	44
296797	115473	44
296798	115474	44
296799	115475	44
296800	115476	44
296801	115477	44
296802	115782	96
296803	115783	96
296804	115784	96
296805	115785	96
296806	115786	96
296807	115787	96
296808	115788	96
296809	115789	96
296810	115790	96
296811	115791	96
296812	115792	96
296813	115793	96
296814	115794	96
296815	115795	96
296816	115796	96
296817	115797	96
296818	115798	97
296819	115799	97
296820	115800	97
296821	115801	97
296822	115802	97
296823	115803	97
296824	115804	97
296825	115805	97
296826	115806	97
296827	115807	97
296828	115808	97
296829	115809	97
296830	115810	97
296831	115811	97
296832	115812	97
296833	115813	97
296834	115814	97
296835	115815	97
296836	115816	97
296837	115817	97
296838	115818	97
296839	115819	97
296840	115820	97
296841	115821	97
296842	115822	97
296843	115823	97
296844	115824	97
296845	115825	97
296846	115826	97
296847	115827	97
296848	115828	97
296849	115829	97
296850	115830	98
296851	115831	98
296852	115832	98
296853	115833	98
296854	115834	98
296855	115835	98
296856	115836	98
296857	115837	98
296858	115838	98
296859	115839	98
296860	115840	98
296861	115841	98
296862	115842	98
296863	115843	98
296864	115844	98
296865	115845	46
296866	115846	46
296867	115847	46
296868	115848	46
296869	115849	46
296870	115850	46
296871	115851	46
296872	115852	46
296873	115853	46
296874	115854	46
296875	115855	46
296876	115856	46
296877	115857	46
296878	115858	46
296879	115859	46
296880	115860	46
296881	115861	91
296882	115862	91
296883	115863	91
296884	115864	91
296885	115865	91
296886	115866	91
296887	115867	91
296888	115868	91
296889	115869	91
296890	115870	91
296891	115871	91
296892	115872	91
296893	115873	91
296894	115874	91
296895	115875	91
296896	115876	91
296897	115877	42
296898	115878	42
296899	115879	42
296900	115880	42
296901	115881	42
296902	115882	42
296903	115883	42
296904	115884	42
296905	115885	42
296906	115886	42
296907	115887	42
296908	115888	42
296909	115889	42
296910	115890	42
296911	115891	42
296912	115892	42
296913	116117	62
296914	116118	62
296915	116119	62
296916	116120	62
296917	116121	62
296918	116122	62
296919	116123	62
296920	116124	62
296921	116205	99
296922	116206	99
296923	116207	99
296924	116208	99
296925	116209	99
296926	116210	99
296927	116211	99
296928	116212	99
296929	116213	99
296930	116214	99
296931	116215	99
296932	116216	99
296933	116217	99
296934	116218	99
296935	116219	99
296936	116220	99
296937	116221	62
296938	116222	62
296939	116223	62
296940	116224	62
296941	116225	62
296942	116226	62
296943	116227	62
296944	116228	62
296945	116229	100
296946	116230	100
296947	116231	100
296948	116232	100
296949	116233	100
296950	116234	100
296951	116235	100
296952	116236	100
296953	116237	62
296954	116238	62
296955	116239	62
296956	116240	62
296957	116241	62
296958	116242	62
296959	116243	62
296960	116244	62
296961	116245	100
296962	116246	100
296963	116247	100
296964	116248	100
296965	116249	100
296966	116250	100
296967	116251	100
296968	116252	100
296969	116253	100
296970	116254	100
296971	116255	100
296972	116256	100
296973	116257	100
296974	116258	100
296975	116259	100
296976	116260	100
296977	116341	53
296978	116342	53
296979	116343	53
296980	116344	53
296981	116345	53
296982	116346	53
296983	116347	53
296984	116348	53
296985	116349	53
296986	116350	53
296987	116351	53
296988	116352	53
296989	116353	53
296990	116354	53
296991	116355	53
296992	116356	53
296993	116357	53
296994	116358	53
296995	116359	53
296996	116360	53
296997	116361	53
296998	116362	53
296999	116363	53
297000	116364	53
\.


--
-- TOC entry 4933 (class 0 OID 142590)
-- Dependencies: 232
-- Data for Name: sc_rasp18_rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp18_rooms (id, rasp18_id, room) FROM stdin;
283517	88471	А-307
283518	88472	А-307
283519	88473	А-307
283520	88474	А-307
283521	88475	А-307
283522	88476	А-307
283523	88477	А-307
283524	88478	А-307
283525	88479	А-307
283526	88480	А-307
283527	88481	А-307
283528	88482	А-307
283529	88483	А-307
283530	88484	А-307
283531	88485	А-307
283532	88486	А-307
283533	88487	Д-210
283534	88488	Д-210
283535	88489	Д-210
283536	88490	Д-210
283537	88491	Д-210
283538	88492	Д-210
283539	88493	Д-210
283540	88494	Д-210
283541	88495	Д-210
283542	88496	Д-210
283543	88497	Д-210
283544	88498	Д-210
283545	88499	Д-210
283546	88500	Д-210
283547	88501	Д-210
283548	88502	Д-210
283549	88503	Г-102
283550	88504	Г-102
283551	88505	Г-102
283552	88506	Г-102
283553	88507	Г-102
283554	88508	Г-102
283555	88509	Г-102
283556	88510	Г-102
283557	88511	Г-102
283558	88512	Г-102
283559	88513	Г-102
283560	88514	Г-102
283561	88515	Г-102
283562	88516	Г-102
283563	88517	Г-102
283564	88518	Г-102
283565	88519	Б-209-2
283566	88520	Б-209-2
283567	88521	Б-209-2
283568	88522	Б-209-2
283569	88523	Б-209-2
283570	88524	Б-209-2
283571	88525	Б-209-2
283572	88526	Б-209-2
283573	88527	Б-209-2
283574	88528	Б-209-2
283575	88529	Б-209-2
283576	88530	Б-209-2
283577	88531	Б-209-2
283578	88532	Б-209-2
283579	88533	Б-209-2
283580	88534	Б-209-2
283581	88535	А-2
283582	88536	А-2
283583	88537	А-2
283584	88538	А-2
283585	88539	А-2
283586	88540	А-2
283587	88541	А-2
283588	88542	А-2
283589	88543	А-314
283590	88544	А-314
283591	88545	А-314
283592	88546	А-314
283593	88547	А-314
283594	88548	А-314
283595	88549	А-314
283596	88550	А-314
283597	88551	И-205-а
283598	88552	И-205-а
283599	88553	И-205-а
283600	88554	И-205-а
283601	88555	И-205-а
283602	88556	И-205-а
283603	88557	И-205-а
283604	88558	И-205-а
283605	88559	И-205-а
283606	88560	И-205-а
283607	88561	И-205-а
283608	88562	И-205-а
283609	88563	И-205-а
283610	88564	И-205-а
283611	88565	И-205-а
283612	88566	И-205-а
283613	88567	И-205-а
283614	88568	И-205-а
283615	88569	И-205-а
283616	88570	И-205-а
283617	88571	И-205-а
283618	88572	И-205-а
283619	88573	И-205-а
283620	88574	И-205-а
283621	88575	И-205-а
283622	88576	И-205-а
283623	88577	И-205-а
283624	88578	И-205-а
283625	88579	И-205-а
283626	88580	И-205-а
283627	88581	И-205-а
283628	88582	И-205-а
283629	88583	А-177
283630	88584	А-177
283631	88585	А-177
283632	88586	А-177
283633	88587	А-177
283634	88588	А-177
283635	88589	А-177
283636	88590	А-177
283637	88591	А-177
283638	88592	А-177
283639	88593	А-177
283640	88594	А-177
283641	88595	А-177
283642	88596	А-177
283643	88597	А-177
283644	88598	А-177
283645	88599	А-13
283646	88600	А-13
283647	88601	А-13
283648	88602	А-13
283649	88603	А-13
283650	88604	А-13
283651	88605	А-13
283652	88606	А-13
283653	88607	А-13
283654	88608	А-13
283655	88609	А-13
283656	88610	А-13
283657	88611	А-13
283658	88612	А-13
283659	88613	А-13
283660	88614	А-13
283661	88615	А-13
283662	88616	А-13
283663	88617	А-13
283664	88618	А-13
283665	88619	А-13
283666	88620	А-13
283667	88621	А-13
283668	88622	А-13
283669	88623	А-13
283670	88624	А-13
283671	88625	А-13
283672	88626	А-13
283673	88627	А-13
283674	88628	А-13
283675	88629	А-13
283676	88630	А-13
283677	88631	И-317
283678	88632	И-317
283679	88633	И-317
283680	88634	И-317
283681	88635	И-317
283682	88636	И-317
283683	88637	И-317
283684	88638	И-317
283685	88639	И-317
283686	88640	И-317
283687	88641	И-317
283688	88642	И-317
283689	88643	И-317
283690	88644	И-317
283691	88645	И-317
283692	88646	И-317
283693	88647	А-13
283694	88648	А-13
283695	88649	А-13
283696	88650	А-13
283697	88651	А-13
283698	88652	А-13
283699	88653	А-13
283700	88654	А-13
283701	88655	А-13
283702	88656	А-13
283703	88657	А-13
283704	88658	А-13
283705	88659	А-13
283706	88660	А-13
283707	88661	А-13
283708	88662	А-13
283709	88663	Б-115
283710	88664	Б-115
283711	88665	Б-115
283712	88666	Б-115
283713	88667	Б-115
283714	88668	Б-115
283715	88669	Б-115
283716	88670	Б-115
283717	88671	ФОК-9
283718	88672	ФОК-9
283719	88673	ФОК-9
283720	88674	ФОК-9
283721	88675	ФОК-9
283722	88676	ФОК-9
283723	88677	ФОК-9
283724	88678	ФОК-9
283725	88679	ФОК-9
283726	88680	ФОК-9
283727	88681	ФОК-9
283728	88682	ФОК-9
283729	88683	ФОК-9
283730	88684	ФОК-9
283731	88685	ФОК-9
283732	88686	ФОК-9
283733	88687	Б-209-2
283734	88688	Б-209-2
283735	88689	Б-209-2
283736	88690	Б-209-2
283737	88691	Б-209-2
283738	88692	Б-209-2
283739	88693	Б-209-2
283740	88694	Б-209-2
283741	88695	Б-209-2
283742	88696	Б-209-2
283743	88697	Б-209-2
283744	88698	Б-209-2
283745	88699	Б-209-2
283746	88700	Б-209-2
283747	88701	Б-209-2
283748	88702	Б-209-2
283749	88703	А-17
283750	88704	А-17
283751	88705	А-17
283752	88706	А-17
283753	88707	А-17
283754	88708	А-17
283755	88709	А-17
283756	88710	А-17
283757	88711	А-13
283758	88712	А-13
283759	88713	А-13
283760	88714	А-13
283761	88715	А-13
283762	88716	А-13
283763	88717	А-13
283764	88718	А-13
283765	88719	Б-209-2
283766	88720	Б-209-2
283767	88721	Б-209-2
283768	88722	Б-209-2
283769	88723	Б-209-2
283770	88724	Б-209-2
283771	88725	Б-209-2
283772	88726	Б-209-2
283773	88727	Г-102
283774	88728	Г-102
283775	88729	Г-102
283776	88730	Г-102
283777	88731	Г-102
283778	88732	Г-102
283779	88733	Г-102
283780	88734	Г-102
283781	88735	Г-102
283782	88736	Г-102
283783	88737	Г-102
283784	88738	Г-102
283785	88739	Г-102
283786	88740	Г-102
283787	88741	Г-102
283788	88742	Г-102
283789	88743	А-13
283790	88744	А-13
283791	88745	А-13
283792	88746	А-13
283793	88747	А-13
283794	88748	А-13
283795	88749	А-13
283796	88750	А-13
283797	88751	А-13
283798	88752	А-13
283799	88753	А-13
283800	88754	А-13
283801	88755	А-13
283802	88756	А-13
283803	88757	А-13
283804	88758	А-13
283805	88759	А-13
283806	88760	А-13
283807	88761	А-13
283808	88762	А-13
283809	88763	А-13
283810	88764	А-13
283811	88765	А-13
283812	88766	А-13
283813	88767	А-13
283814	88768	А-13
283815	88769	А-13
283816	88770	А-13
283817	88771	А-13
283818	88772	А-13
283819	88773	А-13
283820	88774	А-13
283821	88775	Б-209-2
283822	88776	Б-209-2
283823	88777	Б-209-2
283824	88778	Б-209-2
283825	88779	Б-209-2
283826	88780	Б-209-2
283827	88781	Б-209-2
283828	88782	Б-209-2
283829	88783	дист.
283830	88784	дист.
283831	88785	дист.
283832	88786	дист.
283833	88787	дист.
283834	88788	дист.
283835	88789	дист.
283836	88790	дист.
283837	88791	И-329\nИ-318
283838	88792	И-329\nИ-318
283839	88793	И-329\nИ-318
283840	88794	И-329\nИ-318
283841	88795	И-329\nИ-318
283842	88796	И-329\nИ-318
283843	88797	И-329\nИ-318
283844	88798	И-329\nИ-318
283845	88799	И-329\nИ-318
283846	88800	И-329\nИ-318
283847	88801	И-329\nИ-318
283848	88802	И-329\nИ-318
283849	88803	И-329\nИ-318
283850	88804	И-329\nИ-318
283851	88805	И-329\nИ-318
283852	88806	И-329\nИ-318
283853	88807	А-214
283854	88808	А-214
283855	88809	А-214
283856	88810	А-214
283857	88811	А-214
283858	88812	А-214
283859	88813	А-214
283860	88814	А-214
283861	88815	А-214
283862	88816	А-214
283863	88817	А-214
283864	88818	А-214
283865	88819	А-214
283866	88820	А-214
283867	88821	А-214
283868	88822	А-214
283869	88823	А-222
283870	88824	А-222
283871	88825	А-222
283872	88826	А-222
283873	88827	А-222
283874	88828	А-222
283875	88829	А-222
283876	88830	А-222
283877	88831	А-222
283878	88832	А-222
283879	88833	А-222
283880	88834	А-222
283881	88835	А-222
283882	88836	А-222
283883	88837	А-222
283884	88838	А-222
283885	88839	А-2
283886	88840	А-2
283887	88841	А-2
283888	88842	А-2
283889	88843	А-2
283890	88844	А-2
283891	88845	А-2
283892	88846	А-2
283893	88847	Б-209-2
283894	88848	Б-209-2
283895	88849	Б-209-2
283896	88850	Б-209-2
283897	88851	Б-209-2
283898	88852	Б-209-2
283899	88853	Б-209-2
283900	88854	Б-209-2
283901	88855	Б-209-2
283902	88856	Б-209-2
283903	88857	Б-209-2
283904	88858	Б-209-2
283905	88859	Б-209-2
283906	88860	Б-209-2
283907	88861	Б-209-2
283908	88862	Б-209-2
283909	88863	А-3
283910	88864	А-3
283911	88865	А-3
283912	88866	А-3
283913	88867	А-3
283914	88868	А-3
283915	88869	А-3
283916	88870	А-3
283917	88871	Г-102
283918	88872	Г-102
283919	88873	Г-102
283920	88874	Г-102
283921	88875	Г-102
283922	88876	Г-102
283923	88877	Г-102
283924	88878	Г-102
283925	88879	Г-102
283926	88880	Г-102
283927	88881	Г-102
283928	88882	Г-102
283929	88883	Г-102
283930	88884	Г-102
283931	88885	Г-102
283932	88886	Г-102
283933	88887	ФОК-11
283934	88888	ФОК-11
283935	88889	ФОК-11
283936	88890	ФОК-11
283937	88891	ФОК-11
283938	88892	ФОК-11
283939	88893	ФОК-11
283940	88894	ФОК-11
283941	88895	ФОК-11
283942	88896	ФОК-11
283943	88897	ФОК-11
283944	88898	ФОК-11
283945	88899	ФОК-11
283946	88900	ФОК-11
283947	88901	ФОК-11
283948	88902	ФОК-11
283949	88903	А-177
283950	88904	А-177
283951	88905	А-177
283952	88906	А-177
283953	88907	А-177
283954	88908	А-177
283955	88909	А-177
283956	88910	А-177
283957	88911	А-177
283958	88912	А-177
283959	88913	А-177
283960	88914	А-177
283961	88915	А-177
283962	88916	А-177
283963	88917	А-177
283964	88918	А-177
283965	88919	А-13
283966	88920	А-13
283967	88921	А-13
283968	88922	А-13
283969	88923	А-13
283970	88924	А-13
283971	88925	А-13
283972	88926	А-13
283973	88927	А-13
283974	88928	А-13
283975	88929	А-13
283976	88930	А-13
283977	88931	А-13
283978	88932	А-13
283979	88933	А-13
283980	88934	А-13
283981	88935	А-13
283982	88936	А-13
283983	88937	А-13
283984	88938	А-13
283985	88939	А-13
283986	88940	А-13
283987	88941	А-13
283988	88942	А-13
283989	88943	А-13
283990	88944	А-13
283991	88945	А-13
283992	88946	А-13
283993	88947	А-13
283994	88948	А-13
283995	88949	А-13
283996	88950	А-13
283997	88951	И-203-б
283998	88952	И-203-б
283999	88953	И-203-б
284000	88954	И-203-б
284001	88955	И-203-б
284002	88956	И-203-б
284003	88957	И-203-б
284004	88958	И-203-б
284005	88959	И-203-б
284006	88960	И-203-б
284007	88961	И-203-б
284008	88962	И-203-б
284009	88963	И-203-б
284010	88964	И-203-б
284011	88965	И-203-б
284012	88966	И-203-б
284013	88967	И-203-б
284014	88968	И-203-б
284015	88969	И-203-б
284016	88970	И-203-б
284017	88971	И-203-б
284018	88972	И-203-б
284019	88973	И-203-б
284020	88974	И-203-б
284021	88975	И-203-б
284022	88976	И-203-б
284023	88977	И-203-б
284024	88978	И-203-б
284025	88979	И-203-б
284026	88980	И-203-б
284027	88981	И-203-б
284028	88982	И-203-б
284029	88983	А-13
284030	88984	А-13
284031	88985	А-13
284032	88986	А-13
284033	88987	А-13
284034	88988	А-13
284035	88989	А-13
284036	88990	А-13
284037	88991	А-13
284038	88992	А-13
284039	88993	А-13
284040	88994	А-13
284041	88995	А-13
284042	88996	А-13
284043	88997	А-13
284044	88998	А-13
284045	88999	Б-115
284046	89000	Б-115
284047	89001	Б-115
284048	89002	Б-115
284049	89003	Б-115
284050	89004	Б-115
284051	89005	Б-115
284052	89006	Б-115
284053	89007	Б-209-2
284054	89008	Б-209-2
284055	89009	Б-209-2
284056	89010	Б-209-2
284057	89011	Б-209-2
284058	89012	Б-209-2
284059	89013	Б-209-2
284060	89014	Б-209-2
284061	89015	Б-209-2
284062	89016	Б-209-2
284063	89017	Б-209-2
284064	89018	Б-209-2
284065	89019	Б-209-2
284066	89020	Б-209-2
284067	89021	Б-209-2
284068	89022	Б-209-2
284069	89023	А-17
284070	89024	А-17
284071	89025	А-17
284072	89026	А-17
284073	89027	А-17
284074	89028	А-17
284075	89029	А-17
284076	89030	А-17
284077	89031	А-13
284078	89032	А-13
284079	89033	А-13
284080	89034	А-13
284081	89035	А-13
284082	89036	А-13
284083	89037	А-13
284084	89038	А-13
284085	89039	Б-209-2
284086	89040	Б-209-2
284087	89041	Б-209-2
284088	89042	Б-209-2
284089	89043	Б-209-2
284090	89044	Б-209-2
284091	89045	Б-209-2
284092	89046	Б-209-2
284093	89047	А-177
284094	89048	А-177
284095	89049	А-177
284096	89050	А-177
284097	89051	А-177
284098	89052	А-177
284099	89053	А-177
284100	89054	А-177
284101	89055	А-177
284102	89056	А-177
284103	89057	А-177
284104	89058	А-177
284105	89059	А-177
284106	89060	А-177
284107	89061	А-177
284108	89062	А-177
284109	89063	А-13
284110	89064	А-13
284111	89065	А-13
284112	89066	А-13
284113	89067	А-13
284114	89068	А-13
284115	89069	А-13
284116	89070	А-13
284117	89071	А-13
284118	89072	А-13
284119	89073	А-13
284120	89074	А-13
284121	89075	А-13
284122	89076	А-13
284123	89077	А-13
284124	89078	А-13
284125	89079	А-13
284126	89080	А-13
284127	89081	А-13
284128	89082	А-13
284129	89083	А-13
284130	89084	А-13
284131	89085	А-13
284132	89086	А-13
284133	89087	А-13
284134	89088	А-13
284135	89089	А-13
284136	89090	А-13
284137	89091	А-13
284138	89092	А-13
284139	89093	А-13
284140	89094	А-13
284141	89095	Б-209-2
284142	89096	Б-209-2
284143	89097	Б-209-2
284144	89098	Б-209-2
284145	89099	Б-209-2
284146	89100	Б-209-2
284147	89101	Б-209-2
284148	89102	Б-209-2
284149	89103	дист.
284150	89104	дист.
284151	89105	дист.
284152	89106	дист.
284153	89107	дист.
284154	89108	дист.
284155	89109	дист.
284156	89110	дист.
284157	89111	А-321
284158	89112	А-321
284159	89113	А-321
284160	89114	А-321
284161	89115	А-321
284162	89116	А-321
284163	89117	А-321
284164	89118	А-321
284165	89119	И-306\nИ-319
284166	89120	И-306\nИ-319
284167	89121	И-306\nИ-319
284168	89122	И-306\nИ-319
284169	89123	И-306\nИ-319
284170	89124	И-306\nИ-319
284171	89125	И-306\nИ-319
284172	89126	И-306\nИ-319
284173	89127	И-306\nИ-319
284174	89128	И-306\nИ-319
284175	89129	И-306\nИ-319
284176	89130	И-306\nИ-319
284177	89131	И-306\nИ-319
284178	89132	И-306\nИ-319
284179	89133	И-306\nИ-319
284180	89134	И-306\nИ-319
284181	89135	Г-102
284182	89136	Г-102
284183	89137	Г-102
284184	89138	Г-102
284185	89139	Г-102
284186	89140	Г-102
284187	89141	Г-102
284188	89142	Г-102
284189	89143	Г-102
284190	89144	Г-102
284191	89145	Г-102
284192	89146	Г-102
284193	89147	Г-102
284194	89148	Г-102
284195	89149	Г-102
284196	89150	Г-102
284197	89151	А-2
284198	89152	А-2
284199	89153	А-2
284200	89154	А-2
284201	89155	А-2
284202	89156	А-2
284203	89157	А-2
284204	89158	А-2
284205	89159	Б-209-2
284206	89160	Б-209-2
284207	89161	Б-209-2
284208	89162	Б-209-2
284209	89163	Б-209-2
284210	89164	Б-209-2
284211	89165	Б-209-2
284212	89166	Б-209-2
284213	89167	Б-209-2
284214	89168	Б-209-2
284215	89169	Б-209-2
284216	89170	Б-209-2
284217	89171	Б-209-2
284218	89172	Б-209-2
284219	89173	Б-209-2
284220	89174	Б-209-2
284221	89175	Б-209-2
284222	89176	Б-209-2
284223	89177	Б-209-2
284224	89178	Б-209-2
284225	89179	Б-209-2
284226	89180	Б-209-2
284227	89181	Б-209-2
284228	89182	Б-209-2
284229	89183	Б-209-2
284230	89184	Б-209-2
284231	89185	Б-209-2
284232	89186	Б-209-2
284233	89187	Б-209-2
284234	89188	Б-209-2
284235	89189	Б-209-2
284236	89190	Б-209-2
284237	89191	Г-102
284238	89192	Г-102
284239	89193	Г-102
284240	89194	Г-102
284241	89195	Г-102
284242	89196	Г-102
284243	89197	Г-102
284244	89198	Г-102
284245	89199	Г-102
284246	89200	Г-102
284247	89201	Г-102
284248	89202	Г-102
284249	89203	Г-102
284250	89204	Г-102
284251	89205	Г-102
284252	89206	Г-102
284253	89207	А-177
284254	89208	А-177
284255	89209	А-177
284256	89210	А-177
284257	89211	А-177
284258	89212	А-177
284259	89213	А-177
284260	89214	А-177
284261	89215	А-177
284262	89216	А-177
284263	89217	А-177
284264	89218	А-177
284265	89219	А-177
284266	89220	А-177
284267	89221	А-177
284268	89222	А-177
284269	89223	А-13
284270	89224	А-13
284271	89225	А-13
284272	89226	А-13
284273	89227	А-13
284274	89228	А-13
284275	89229	А-13
284276	89230	А-13
284277	89231	А-13
284278	89232	А-13
284279	89233	А-13
284280	89234	А-13
284281	89235	А-13
284282	89236	А-13
284283	89237	А-13
284284	89238	А-13
284285	89239	А-13
284286	89240	А-13
284287	89241	А-13
284288	89242	А-13
284289	89243	А-13
284290	89244	А-13
284291	89245	А-13
284292	89246	А-13
284293	89247	А-13
284294	89248	А-13
284295	89249	А-13
284296	89250	А-13
284297	89251	А-13
284298	89252	А-13
284299	89253	А-13
284300	89254	А-13
284301	89255	Г-420-1
284302	89256	Г-420-1
284303	89257	Г-420-1
284304	89258	Г-420-1
284305	89259	Г-420-1
284306	89260	Г-420-1
284307	89261	Г-420-1
284308	89262	Г-420-1
284309	89263	Г-420-1
284310	89264	Г-420-1
284311	89265	Г-420-1
284312	89266	Г-420-1
284313	89267	Г-420-1
284314	89268	Г-420-1
284315	89269	Г-420-1
284316	89270	Г-420-1
284317	89271	Г-420-1
284318	89272	Г-420-1
284319	89273	Г-420-1
284320	89274	Г-420-1
284321	89275	Г-420-1
284322	89276	Г-420-1
284323	89277	Г-420-1
284324	89278	Г-420-1
284325	89279	Г-420-1
284326	89280	Г-420-1
284327	89281	Г-420-1
284328	89282	Г-420-1
284329	89283	Г-420-1
284330	89284	Г-420-1
284331	89285	Г-420-1
284332	89286	Г-420-1
284333	89287	ФОК-4
284334	89288	ФОК-4
284335	89289	ФОК-4
284336	89290	ФОК-4
284337	89291	ФОК-4
284338	89292	ФОК-4
284339	89293	ФОК-4
284340	89294	ФОК-4
284341	89295	ФОК-4
284342	89296	ФОК-4
284343	89297	ФОК-4
284344	89298	ФОК-4
284345	89299	ФОК-4
284346	89300	ФОК-4
284347	89301	ФОК-4
284348	89302	ФОК-4
284349	89303	А-13
284350	89304	А-13
284351	89305	А-13
284352	89306	А-13
284353	89307	А-13
284354	89308	А-13
284355	89309	А-13
284356	89310	А-13
284357	89311	А-13
284358	89312	А-13
284359	89313	А-13
284360	89314	А-13
284361	89315	А-13
284362	89316	А-13
284363	89317	А-13
284364	89318	А-13
284365	89319	Б-115
284366	89320	Б-115
284367	89321	Б-115
284368	89322	Б-115
284369	89323	Б-115
284370	89324	Б-115
284371	89325	Б-115
284372	89326	Б-115
284373	89327	А-17
284374	89328	А-17
284375	89329	А-17
284376	89330	А-17
284377	89331	А-17
284378	89332	А-17
284379	89333	А-17
284380	89334	А-17
284381	89335	А-13
284382	89336	А-13
284383	89337	А-13
284384	89338	А-13
284385	89339	А-13
284386	89340	А-13
284387	89341	А-13
284388	89342	А-13
284389	89343	А-208
284390	89344	А-208
284391	89345	А-208
284392	89346	А-208
284393	89347	А-208
284394	89348	А-208
284395	89349	А-208
284396	89350	А-208
284397	89351	А-208
284398	89352	А-208
284399	89353	А-208
284400	89354	А-208
284401	89355	А-208
284402	89356	А-208
284403	89357	А-208
284404	89358	А-208
284405	89359	А-217
284406	89360	А-217
284407	89361	А-217
284408	89362	А-217
284409	89363	А-217
284410	89364	А-217
284411	89365	А-217
284412	89366	А-217
284413	89367	А-217
284414	89368	А-217
284415	89369	А-217
284416	89370	А-217
284417	89371	А-217
284418	89372	А-217
284419	89373	А-217
284420	89374	А-217
284421	89375	А-13
284422	89376	А-13
284423	89377	А-13
284424	89378	А-13
284425	89379	А-13
284426	89380	А-13
284427	89381	А-13
284428	89382	А-13
284429	89383	А-13
284430	89384	А-13
284431	89385	А-13
284432	89386	А-13
284433	89387	А-13
284434	89388	А-13
284435	89389	А-13
284436	89390	А-13
284437	89391	А-13
284438	89392	А-13
284439	89393	А-13
284440	89394	А-13
284441	89395	А-13
284442	89396	А-13
284443	89397	А-13
284444	89398	А-13
284445	89399	А-13
284446	89400	А-13
284447	89401	А-13
284448	89402	А-13
284449	89403	А-13
284450	89404	А-13
284451	89405	А-13
284452	89406	А-13
284453	89407	Б-209-2
284454	89408	Б-209-2
284455	89409	Б-209-2
284456	89410	Б-209-2
284457	89411	Б-209-2
284458	89412	Б-209-2
284459	89413	Б-209-2
284460	89414	Б-209-2
284461	89415	Б-209-2
284462	89416	Б-209-2
284463	89417	Б-209-2
284464	89418	Б-209-2
284465	89419	Б-209-2
284466	89420	Б-209-2
284467	89421	Б-209-2
284468	89422	Б-209-2
284469	89423	дист.
284470	89424	дист.
284471	89425	дист.
284472	89426	дист.
284473	89427	дист.
284474	89428	дист.
284475	89429	дист.
284476	89430	дист.
284477	89431	А-321
284478	89432	А-321
284479	89433	А-321
284480	89434	А-321
284481	89435	А-321
284482	89436	А-321
284483	89437	А-321
284484	89438	А-321
284485	89439	Г-102
284486	89440	Г-102
284487	89441	Г-102
284488	89442	Г-102
284489	89443	Г-102
284490	89444	Г-102
284491	89445	Г-102
284492	89446	Г-102
284493	89447	Г-102
284494	89448	Г-102
284495	89449	Г-102
284496	89450	Г-102
284497	89451	Г-102
284498	89452	Г-102
284499	89453	Г-102
284500	89454	Г-102
284501	89455	Г-412
284502	89456	Г-412
284503	89457	Г-412
284504	89458	Г-412
284505	89459	Г-412
284506	89460	Г-412
284507	89461	Г-412
284508	89462	Г-412
284509	89463	Г-412
284510	89464	Г-412
284511	89465	Г-412
284512	89466	Г-412
284513	89467	Г-412
284514	89468	Г-412
284515	89469	Г-412
284516	89470	Г-412
284517	89471	Г-412
284518	89472	Г-412
284519	89473	Г-412
284520	89474	Г-412
284521	89475	Г-412
284522	89476	Г-412
284523	89477	Г-412
284524	89478	Г-412
284525	89479	Г-412
284526	89480	Г-412
284527	89481	Г-412
284528	89482	Г-412
284529	89483	Г-412
284530	89484	Г-412
284531	89485	Г-412
284532	89486	Г-412
284533	89487	А-2
284534	89488	А-2
284535	89489	А-2
284536	89490	А-2
284537	89491	А-2
284538	89492	А-2
284539	89493	А-2
284540	89494	А-2
284541	89495	ФОК-5
284542	89496	ФОК-5
284543	89497	ФОК-5
284544	89498	ФОК-5
284545	89499	ФОК-5
284546	89500	ФОК-5
284547	89501	ФОК-5
284548	89502	ФОК-5
284549	89503	ФОК-5
284550	89504	ФОК-5
284551	89505	ФОК-5
284552	89506	ФОК-5
284553	89507	ФОК-5
284554	89508	ФОК-5
284555	89509	ФОК-5
284556	89510	ФОК-5
284557	89511	Г-102
284558	89512	Г-102
284559	89513	Г-102
284560	89514	Г-102
284561	89515	Г-102
284562	89516	Г-102
284563	89517	Г-102
284564	89518	Г-102
284565	89519	Г-102
284566	89520	Г-102
284567	89521	Г-102
284568	89522	Г-102
284569	89523	Г-102
284570	89524	Г-102
284571	89525	Г-102
284572	89526	Г-102
284573	89527	Б-209-2
284574	89528	Б-209-2
284575	89529	Б-209-2
284576	89530	Б-209-2
284577	89531	Б-209-2
284578	89532	Б-209-2
284579	89533	Б-209-2
284580	89534	Б-209-2
284581	89535	Б-209-2
284582	89536	Б-209-2
284583	89537	Б-209-2
284584	89538	Б-209-2
284585	89539	Б-209-2
284586	89540	Б-209-2
284587	89541	Б-209-2
284588	89542	Б-209-2
284589	89543	Б-209-2
284590	89544	Б-209-2
284591	89545	Б-209-2
284592	89546	Б-209-2
284593	89547	Б-209-2
284594	89548	Б-209-2
284595	89549	Б-209-2
284596	89550	Б-209-2
284597	89551	Б-209-2
284598	89552	Б-209-2
284599	89553	Б-209-2
284600	89554	Б-209-2
284601	89555	Б-209-2
284602	89556	Б-209-2
284603	89557	Б-209-2
284604	89558	Б-209-2
284605	89559	А-13
284606	89560	А-13
284607	89561	А-13
284608	89562	А-13
284609	89563	А-13
284610	89564	А-13
284611	89565	А-13
284612	89566	А-13
284613	89567	А-13
284614	89568	А-13
284615	89569	А-13
284616	89570	А-13
284617	89571	А-13
284618	89572	А-13
284619	89573	А-13
284620	89574	А-13
284621	89575	А-13
284622	89576	А-13
284623	89577	А-13
284624	89578	А-13
284625	89579	А-13
284626	89580	А-13
284627	89581	А-13
284628	89582	А-13
284629	89583	А-13
284630	89584	А-13
284631	89585	А-13
284632	89586	А-13
284633	89587	А-13
284634	89588	А-13
284635	89589	А-13
284636	89590	А-13
284637	89591	Г-102
284638	89592	Г-102
284639	89593	Г-102
284640	89594	Г-102
284641	89595	Г-102
284642	89596	Г-102
284643	89597	Г-102
284644	89598	Г-102
284645	89599	Г-102
284646	89600	Г-102
284647	89601	Г-102
284648	89602	Г-102
284649	89603	Г-102
284650	89604	Г-102
284651	89605	Г-102
284652	89606	Г-102
284653	89607	Д-210
284654	89608	Д-210
284655	89609	Д-210
284656	89610	Д-210
284657	89611	Д-210
284658	89612	Д-210
284659	89613	Д-210
284660	89614	Д-210
284661	89615	Д-210
284662	89616	Д-210
284663	89617	Д-210
284664	89618	Д-210
284665	89619	Д-210
284666	89620	Д-210
284667	89621	Д-210
284668	89622	Д-210
284669	89623	А-13
284670	89624	А-13
284671	89625	А-13
284672	89626	А-13
284673	89627	А-13
284674	89628	А-13
284675	89629	А-13
284676	89630	А-13
284677	89631	А-13
284678	89632	А-13
284679	89633	А-13
284680	89634	А-13
284681	89635	А-13
284682	89636	А-13
284683	89637	А-13
284684	89638	А-13
284685	89639	Б-115
284686	89640	Б-115
284687	89641	Б-115
284688	89642	Б-115
284689	89643	Б-115
284690	89644	Б-115
284691	89645	Б-115
284692	89646	Б-115
284693	89647	А-17
284694	89648	А-17
284695	89649	А-17
284696	89650	А-17
284697	89651	А-17
284698	89652	А-17
284699	89653	А-17
284700	89654	А-17
284701	89655	А-13
284702	89656	А-13
284703	89657	А-13
284704	89658	А-13
284705	89659	А-13
284706	89660	А-13
284707	89661	А-13
284708	89662	А-13
284709	89663	А-217
284710	89664	А-217
284711	89665	А-217
284712	89666	А-217
284713	89667	А-217
284714	89668	А-217
284715	89669	А-217
284716	89670	А-217
284717	89671	А-217
284718	89672	А-217
284719	89673	А-217
284720	89674	А-217
284721	89675	А-217
284722	89676	А-217
284723	89677	А-217
284724	89678	А-217
284725	89679	И-302\nИ-318
284726	89680	И-302\nИ-318
284727	89681	И-302\nИ-318
284728	89682	И-302\nИ-318
284729	89683	И-302\nИ-318
284730	89684	И-302\nИ-318
284731	89685	И-302\nИ-318
284732	89686	И-302\nИ-318
284733	89687	И-302\nИ-318
284734	89688	И-302\nИ-318
284735	89689	И-302\nИ-318
284736	89690	И-302\nИ-318
284737	89691	И-302\nИ-318
284738	89692	И-302\nИ-318
284739	89693	И-302\nИ-318
284740	89694	И-302\nИ-318
284741	89695	А-13
284742	89696	А-13
284743	89697	А-13
284744	89698	А-13
284745	89699	А-13
284746	89700	А-13
284747	89701	А-13
284748	89702	А-13
284749	89703	А-13
284750	89704	А-13
284751	89705	А-13
284752	89706	А-13
284753	89707	А-13
284754	89708	А-13
284755	89709	А-13
284756	89710	А-13
284757	89711	А-13
284758	89712	А-13
284759	89713	А-13
284760	89714	А-13
284761	89715	А-13
284762	89716	А-13
284763	89717	А-13
284764	89718	А-13
284765	89719	А-13
284766	89720	А-13
284767	89721	А-13
284768	89722	А-13
284769	89723	А-13
284770	89724	А-13
284771	89725	А-13
284772	89726	А-13
284773	89727	Б-209-2
284774	89728	Б-209-2
284775	89729	Б-209-2
284776	89730	Б-209-2
284777	89731	Б-209-2
284778	89732	Б-209-2
284779	89733	Б-209-2
284780	89734	Б-209-2
284781	89735	Б-209-2
284782	89736	Б-209-2
284783	89737	Б-209-2
284784	89738	Б-209-2
284785	89739	Б-209-2
284786	89740	Б-209-2
284787	89741	Б-209-2
284788	89742	Б-209-2
284789	89743	дист.
284790	89744	дист.
284791	89745	дист.
284792	89746	дист.
284793	89747	дист.
284794	89748	дист.
284795	89749	дист.
284796	89750	дист.
284797	89751	А-318
284798	89752	А-318
284799	89753	А-318
284800	89754	А-318
284801	89755	А-318
284802	89756	А-318
284803	89757	А-318
284804	89758	А-318
284805	89759	А-318
284806	89760	А-318
284807	89761	А-318
284808	89762	А-318
284809	89763	А-318
284810	89764	А-318
284811	89765	А-318
284812	89766	А-318
284813	89767	А-13
284814	89768	А-13
284815	89769	А-13
284816	89770	А-13
284817	89771	А-13
284818	89772	А-13
284819	89773	А-13
284820	89774	А-13
284821	89775	А-13
284822	89776	А-13
284823	89777	А-13
284824	89778	А-13
284825	89779	А-13
284826	89780	А-13
284827	89781	А-13
284828	89782	А-13
284829	89783	А-13
284830	89784	А-13
284831	89785	А-13
284832	89786	А-13
284833	89787	А-13
284834	89788	А-13
284835	89789	А-13
284836	89790	А-13
284837	89791	А-13
284838	89792	А-13
284839	89793	А-13
284840	89794	А-13
284841	89795	А-13
284842	89796	А-13
284843	89797	А-13
284844	89798	А-13
284845	89799	Б-209-2
284846	89800	Б-209-2
284847	89801	Б-209-2
284848	89802	Б-209-2
284849	89803	Б-209-2
284850	89804	Б-209-2
284851	89805	Б-209-2
284852	89806	Б-209-2
284853	89807	Б-209-2
284854	89808	Б-209-2
284855	89809	Б-209-2
284856	89810	Б-209-2
284857	89811	Б-209-2
284858	89812	Б-209-2
284859	89813	Б-209-2
284860	89814	Б-209-2
284861	89815	А-16
284862	89816	А-16
284863	89817	А-16
284864	89818	А-16
284865	89819	А-16
284866	89820	А-16
284867	89821	А-16
284868	89822	А-16
284869	89823	А-16
284870	89824	А-16
284871	89825	А-16
284872	89826	А-16
284873	89827	А-16
284874	89828	А-16
284875	89829	А-16
284876	89830	А-16
284877	89831	А-13
284878	89832	А-13
284879	89833	А-13
284880	89834	А-13
284881	89835	А-13
284882	89836	А-13
284883	89837	А-13
284884	89838	А-13
284885	89839	А-13
284886	89840	А-13
284887	89841	А-13
284888	89842	А-13
284889	89843	А-13
284890	89844	А-13
284891	89845	А-13
284892	89846	А-13
284893	89847	А-218
284894	89848	А-218
284895	89849	А-218
284896	89850	А-218
284897	89851	А-218
284898	89852	А-218
284899	89853	А-218
284900	89854	А-218
284901	89855	А-218
284902	89856	А-218
284903	89857	А-218
284904	89858	А-218
284905	89859	А-218
284906	89860	А-218
284907	89861	А-218
284908	89862	А-218
284909	89863	ФОК-12
284910	89864	ФОК-12
284911	89865	ФОК-12
284912	89866	ФОК-12
284913	89867	ФОК-12
284914	89868	ФОК-12
284915	89869	ФОК-12
284916	89870	ФОК-12
284917	89871	ФОК-12
284918	89872	ФОК-12
284919	89873	ФОК-12
284920	89874	ФОК-12
284921	89875	ФОК-12
284922	89876	ФОК-12
284923	89877	ФОК-12
284924	89878	ФОК-12
284925	89879	И-202-б
284926	89880	И-202-б
284927	89881	И-202-б
284928	89882	И-202-б
284929	89883	И-202-б
284930	89884	И-202-б
284931	89885	И-202-б
284932	89886	И-202-б
284933	89887	И-202-б
284934	89888	И-202-б
284935	89889	И-202-б
284936	89890	И-202-б
284937	89891	И-202-б
284938	89892	И-202-б
284939	89893	И-202-б
284940	89894	И-202-б
284941	89895	А-215
284942	89896	А-215
284943	89897	А-215
284944	89898	А-215
284945	89899	А-215
284946	89900	А-215
284947	89901	А-215
284948	89902	А-215
284949	89903	А-215
284950	89904	А-215
284951	89905	А-215
284952	89906	А-215
284953	89907	А-215
284954	89908	А-215
284955	89909	А-215
284956	89910	А-215
284957	89911	И-324
284958	89912	И-324
284959	89913	И-324
284960	89914	И-324
284961	89915	И-324
284962	89916	И-324
284963	89917	И-324
284964	89918	И-324
284965	89919	И-324
284966	89920	И-324
284967	89921	И-324
284968	89922	И-324
284969	89923	И-324
284970	89924	И-324
284971	89925	И-324
284972	89926	И-324
284973	89927	А-180
284974	89928	А-180
284975	89929	А-180
284976	89930	А-180
284977	89931	А-180
284978	89932	А-180
284979	89933	А-180
284980	89934	А-180
284981	89935	А-180
284982	89936	А-180
284983	89937	А-180
284984	89938	А-180
284985	89939	А-180
284986	89940	А-180
284987	89941	А-180
284988	89942	А-180
284989	89943	А-4
284990	89944	А-4
284991	89945	А-4
284992	89946	А-4
284993	89947	А-4
284994	89948	А-4
284995	89949	А-4
284996	89950	А-4
284997	89951	Б-209-2
284998	89952	Б-209-2
284999	89953	Б-209-2
285000	89954	Б-209-2
285001	89955	Б-209-2
285002	89956	Б-209-2
285003	89957	Б-209-2
285004	89958	Б-209-2
285005	89959	А-13
285006	89960	А-13
285007	89961	А-13
285008	89962	А-13
285009	89963	А-13
285010	89964	А-13
285011	89965	А-13
285012	89966	А-13
285013	89967	А-13
285014	89968	А-13
285015	89969	А-13
285016	89970	А-13
285017	89971	А-13
285018	89972	А-13
285019	89973	А-13
285020	89974	А-13
285021	89975	А-211
285022	89976	А-211
285023	89977	А-211
285024	89978	А-211
285025	89979	А-211
285026	89980	А-211
285027	89981	А-211
285028	89982	А-211
285029	89983	А-174-б
285030	89984	А-174-б
285031	89985	А-174-б
285032	89986	А-174-б
285033	89987	А-174-б
285034	89988	А-174-б
285035	89989	А-174-б
285036	89990	А-174-б
285037	89991	А-174-б
285038	89992	А-174-б
285039	89993	А-174-б
285040	89994	А-174-б
285041	89995	А-174-б
285042	89996	А-174-б
285043	89997	А-174-б
285044	89998	А-174-б
285045	89999	А-13
285046	90000	А-13
285047	90001	А-13
285048	90002	А-13
285049	90003	А-13
285050	90004	А-13
285051	90005	А-13
285052	90006	А-13
285053	90007	А-13
285054	90008	А-13
285055	90009	А-13
285056	90010	А-13
285057	90011	А-13
285058	90012	А-13
285059	90013	А-13
285060	90014	А-13
285061	90015	Б-209-2
285062	90016	Б-209-2
285063	90017	Б-209-2
285064	90018	Б-209-2
285065	90019	Б-209-2
285066	90020	Б-209-2
285067	90021	Б-209-2
285068	90022	Б-209-2
285069	90023	Б-209-2
285070	90024	Б-209-2
285071	90025	Б-209-2
285072	90026	Б-209-2
285073	90027	Б-209-2
285074	90028	Б-209-2
285075	90029	Б-209-2
285076	90030	Б-209-2
285077	90031	дист.
285078	90032	дист.
285079	90033	дист.
285080	90034	дист.
285081	90035	дист.
285082	90036	дист.
285083	90037	дист.
285084	90038	дист.
285085	90039	А-13
285086	90040	А-13
285087	90041	А-13
285088	90042	А-13
285089	90043	А-13
285090	90044	А-13
285091	90045	А-13
285092	90046	А-13
285093	90047	А-13
285094	90048	А-13
285095	90049	А-13
285096	90050	А-13
285097	90051	А-13
285098	90052	А-13
285099	90053	А-13
285100	90054	А-13
285101	90055	А-13
285102	90056	А-13
285103	90057	А-13
285104	90058	А-13
285105	90059	А-13
285106	90060	А-13
285107	90061	А-13
285108	90062	А-13
285109	90063	А-13
285110	90064	А-13
285111	90065	А-13
285112	90066	А-13
285113	90067	А-13
285114	90068	А-13
285115	90069	А-13
285116	90070	А-13
285117	90071	ФОК-3
285118	90072	ФОК-3
285119	90073	ФОК-3
285120	90074	ФОК-3
285121	90075	ФОК-3
285122	90076	ФОК-3
285123	90077	ФОК-3
285124	90078	ФОК-3
285125	90079	ФОК-3
285126	90080	ФОК-3
285127	90081	ФОК-3
285128	90082	ФОК-3
285129	90083	ФОК-3
285130	90084	ФОК-3
285131	90085	ФОК-3
285132	90086	ФОК-3
285133	90087	А-16
285134	90088	А-16
285135	90089	А-16
285136	90090	А-16
285137	90091	А-16
285138	90092	А-16
285139	90093	А-16
285140	90094	А-16
285141	90095	А-16
285142	90096	А-16
285143	90097	А-16
285144	90098	А-16
285145	90099	А-16
285146	90100	А-16
285147	90101	А-16
285148	90102	А-16
285149	90103	А-13
285150	90104	А-13
285151	90105	А-13
285152	90106	А-13
285153	90107	А-13
285154	90108	А-13
285155	90109	А-13
285156	90110	А-13
285157	90111	А-13
285158	90112	А-13
285159	90113	А-13
285160	90114	А-13
285161	90115	А-13
285162	90116	А-13
285163	90117	А-13
285164	90118	А-13
285165	90119	Г-413
285166	90120	Г-413
285167	90121	Г-413
285168	90122	Г-413
285169	90123	Г-413
285170	90124	Г-413
285171	90125	Г-413
285172	90126	Г-413
285173	90127	Г-413
285174	90128	Г-413
285175	90129	Г-413
285176	90130	Г-413
285177	90131	Г-413
285178	90132	Г-413
285179	90133	Г-413
285180	90134	Г-413
285181	90135	А-180
285182	90136	А-180
285183	90137	А-180
285184	90138	А-180
285185	90139	А-180
285186	90140	А-180
285187	90141	А-180
285188	90142	А-180
285189	90143	А-180
285190	90144	А-180
285191	90145	А-180
285192	90146	А-180
285193	90147	А-180
285194	90148	А-180
285195	90149	А-180
285196	90150	А-180
285197	90151	А-174-б
285198	90152	А-174-б
285199	90153	А-174-б
285200	90154	А-174-б
285201	90155	А-174-б
285202	90156	А-174-б
285203	90157	А-174-б
285204	90158	А-174-б
285205	90159	А-174-б
285206	90160	А-174-б
285207	90161	А-174-б
285208	90162	А-174-б
285209	90163	А-174-б
285210	90164	А-174-б
285211	90165	А-174-б
285212	90166	А-174-б
285213	90167	А-174-б
285214	90168	А-174-б
285215	90169	А-174-б
285216	90170	А-174-б
285217	90171	А-174-б
285218	90172	А-174-б
285219	90173	А-174-б
285220	90174	А-174-б
285221	90175	А-174-б
285222	90176	А-174-б
285223	90177	А-174-б
285224	90178	А-174-б
285225	90179	А-174-б
285226	90180	А-174-б
285227	90181	А-174-б
285228	90182	А-174-б
285229	90183	Б-209-2
285230	90184	Б-209-2
285231	90185	Б-209-2
285232	90186	Б-209-2
285233	90187	Б-209-2
285234	90188	Б-209-2
285235	90189	Б-209-2
285236	90190	Б-209-2
285237	90191	А-4
285238	90192	А-4
285239	90193	А-4
285240	90194	А-4
285241	90195	А-4
285242	90196	А-4
285243	90197	А-4
285244	90198	А-4
285245	90199	А-13
285246	90200	А-13
285247	90201	А-13
285248	90202	А-13
285249	90203	А-13
285250	90204	А-13
285251	90205	А-13
285252	90206	А-13
285253	90207	А-13
285254	90208	А-13
285255	90209	А-13
285256	90210	А-13
285257	90211	А-13
285258	90212	А-13
285259	90213	А-13
285260	90214	А-13
285261	90215	А-218
285262	90216	А-218
285263	90217	А-218
285264	90218	А-218
285265	90219	А-218
285266	90220	А-218
285267	90221	А-218
285268	90222	А-218
285269	90223	А-218
285270	90224	А-218
285271	90225	А-218
285272	90226	А-218
285273	90227	А-218
285274	90228	А-218
285275	90229	А-218
285276	90230	А-218
285277	90231	И-307\nИ-314
285278	90232	И-307\nИ-314
285279	90233	И-307\nИ-314
285280	90234	И-307\nИ-314
285281	90235	И-307\nИ-314
285282	90236	И-307\nИ-314
285283	90237	И-307\nИ-314
285284	90238	И-307\nИ-314
285285	90239	И-307\nИ-314
285286	90240	И-307\nИ-314
285287	90241	И-307\nИ-314
285288	90242	И-307\nИ-314
285289	90243	И-307\nИ-314
285290	90244	И-307\nИ-314
285291	90245	И-307\nИ-314
285292	90246	И-307\nИ-314
285293	90247	Б-209-2
285294	90248	Б-209-2
285295	90249	Б-209-2
285296	90250	Б-209-2
285297	90251	Б-209-2
285298	90252	Б-209-2
285299	90253	Б-209-2
285300	90254	Б-209-2
285301	90255	Б-209-2
285302	90256	Б-209-2
285303	90257	Б-209-2
285304	90258	Б-209-2
285305	90259	Б-209-2
285306	90260	Б-209-2
285307	90261	Б-209-2
285308	90262	Б-209-2
285309	90263	А-211
285310	90264	А-211
285311	90265	А-211
285312	90266	А-211
285313	90267	А-211
285314	90268	А-211
285315	90269	А-211
285316	90270	А-211
285317	90271	А-13
285318	90272	А-13
285319	90273	А-13
285320	90274	А-13
285321	90275	А-13
285322	90276	А-13
285323	90277	А-13
285324	90278	А-13
285325	90279	А-13
285326	90280	А-13
285327	90281	А-13
285328	90282	А-13
285329	90283	А-13
285330	90284	А-13
285331	90285	А-13
285332	90286	А-13
285333	90287	А-216
285334	90288	А-216
285335	90289	А-216
285336	90290	А-216
285337	90291	А-216
285338	90292	А-216
285339	90293	А-216
285340	90294	А-216
285341	90295	А-216
285342	90296	А-216
285343	90297	А-216
285344	90298	А-216
285345	90299	А-216
285346	90300	А-216
285347	90301	А-216
285348	90302	А-216
285349	90303	Б-209-2
285350	90304	Б-209-2
285351	90305	Б-209-2
285352	90306	Б-209-2
285353	90307	Б-209-2
285354	90308	Б-209-2
285355	90309	Б-209-2
285356	90310	Б-209-2
285357	90311	Б-209-2
285358	90312	Б-209-2
285359	90313	Б-209-2
285360	90314	Б-209-2
285361	90315	Б-209-2
285362	90316	Б-209-2
285363	90317	Б-209-2
285364	90318	Б-209-2
285365	90319	дист.
285366	90320	дист.
285367	90321	дист.
285368	90322	дист.
285369	90323	дист.
285370	90324	дист.
285371	90325	дист.
285372	90326	дист.
285373	90331	дист.
285374	90332	дист.
285375	90333	дист.
285376	90334	дист.
285377	90335	дист.
285378	90336	дист.
285379	90337	дист.
285380	90338	дист.
285381	90339	А-173
285382	90340	А-173
285383	90341	А-173
285384	90342	А-173
285385	90343	А-173
285386	90344	А-173
285387	90345	А-173
285388	90346	А-173
285389	90347	А-173
285390	90348	А-173
285391	90349	А-173
285392	90350	А-173
285393	90351	А-173
285394	90352	А-173
285395	90353	А-173
285396	90354	А-173
285397	90355	А-13
285398	90356	А-13
285399	90357	А-13
285400	90358	А-13
285401	90359	А-13
285402	90360	А-13
285403	90361	А-13
285404	90362	А-13
285405	90363	А-13
285406	90364	А-13
285407	90365	А-13
285408	90366	А-13
285409	90367	А-13
285410	90368	А-13
285411	90369	А-13
285412	90370	А-13
285413	90371	Б-209
285414	90372	Б-209
285415	90373	Б-209
285416	90374	Б-209
285417	90375	Б-209
285418	90376	Б-209
285419	90377	Б-209
285420	90378	Б-209
285421	90379	Б-209
285422	90380	Б-209
285423	90381	Б-209
285424	90382	Б-209
285425	90383	Б-209
285426	90384	Б-209
285427	90385	Б-209
285428	90386	Б-209
285429	90387	А-113
285430	90388	А-113
285431	90389	А-113
285432	90390	А-113
285433	90391	А-113
285434	90392	А-113
285435	90393	А-113
285436	90394	А-113
285437	90395	Б-209
285438	90396	Б-209
285439	90397	Б-209
285440	90398	Б-209
285441	90399	Б-209
285442	90400	Б-209
285443	90401	Б-209
285444	90402	Б-209
285445	90403	А-113
285446	90404	А-113
285447	90405	А-113
285448	90406	А-113
285449	90407	А-113
285450	90408	А-113
285451	90409	А-113
285452	90410	А-113
285453	90411	Б-209
285454	90412	Б-209
285455	90413	Б-209
285456	90414	Б-209
285457	90415	Б-209
285458	90416	Б-209
285459	90417	Б-209
285460	90418	Б-209
285461	90419	Б-209
285462	90420	Б-209
285463	90421	Б-209
285464	90422	Б-209
285465	90423	Б-209
285466	90424	Б-209
285467	90425	Б-209
285468	90426	Б-209
285469	90427	А-113
285470	90428	А-113
285471	90429	А-113
285472	90430	А-113
285473	90431	А-113
285474	90432	А-113
285475	90433	А-113
285476	90434	А-113
285477	90435	Б-209
285478	90436	Б-209
285479	90437	Б-209
285480	90438	Б-209
285481	90439	Б-209
285482	90440	Б-209
285483	90441	Б-209
285484	90442	Б-209
285485	90443	Б-209
285486	90444	Б-209
285487	90445	Б-209
285488	90446	Б-209
285489	90447	Б-209
285490	90448	Б-209
285491	90449	Б-209
285492	90450	Б-209
285493	90451	А-113
285494	90452	А-113
285495	90453	А-113
285496	90454	А-113
285497	90455	А-113
285498	90456	А-113
285499	90457	А-113
285500	90458	А-113
285501	90459	А-113
285502	90460	А-113
285503	90461	А-113
285504	90462	А-113
285505	90463	А-113
285506	90464	А-113
285507	90465	А-113
285508	90466	А-113
285509	90467	Б-209-1
285510	90468	Б-209-1
285511	90469	Б-209-1
285512	90470	Б-209-1
285513	90471	Б-209-1
285514	90472	Б-209-1
285515	90473	Б-209-1
285516	90474	Б-209-1
285517	90475	А-13
285518	90476	А-13
285519	90477	А-13
285520	90478	А-13
285521	90479	А-13
285522	90480	А-13
285523	90481	А-13
285524	90482	А-13
285525	90483	А-13
285526	90484	А-13
285527	90485	А-13
285528	90486	А-13
285529	90487	А-13
285530	90488	А-13
285531	90489	А-13
285532	90490	А-13
285533	90491	А-13
285534	90492	А-13
285535	90493	А-13
285536	90494	А-13
285537	90495	А-13
285538	90496	А-13
285539	90497	А-13
285540	90498	А-13
285541	90499	Б-209-2
285542	90500	Б-209-2
285543	90501	Б-209-2
285544	90502	Б-209-2
285545	90503	Б-209-2
285546	90504	Б-209-2
285547	90505	Б-209-2
285548	90506	Б-209-2
285549	90507	Б-209-2
285550	90508	Б-209-2
285551	90509	Б-209-2
285552	90510	Б-209-2
285553	90511	Б-209-2
285554	90512	Б-209-2
285555	90513	Б-209-2
285556	90514	Б-209-2
285557	90515	А-318
285558	90516	А-318
285559	90517	А-318
285560	90518	А-318
285561	90519	А-318
285562	90520	А-318
285563	90521	А-318
285564	90522	А-318
285565	90523	А-318
285566	90524	А-318
285567	90525	А-318
285568	90526	А-318
285569	90527	А-318
285570	90528	А-318
285571	90529	А-318
285572	90530	А-318
285573	90531	А-216
285574	90532	А-216
285575	90533	А-216
285576	90534	А-216
285577	90535	А-216
285578	90536	А-216
285579	90537	А-216
285580	90538	А-216
285581	90539	А-216
285582	90540	А-216
285583	90541	А-216
285584	90542	А-216
285585	90543	А-216
285586	90544	А-216
285587	90545	А-216
285588	90546	А-216
285589	90551	дист.
285590	90552	дист.
285591	90553	дист.
285592	90554	дист.
285593	90555	дист.
285594	90556	дист.
285595	90557	дист.
285596	90558	дист.
285597	90559	А-13
285598	90560	А-13
285599	90561	А-13
285600	90562	А-13
285601	90563	А-13
285602	90564	А-13
285603	90565	А-13
285604	90566	А-13
285605	90567	А-13
285606	90568	А-13
285607	90569	А-13
285608	90570	А-13
285609	90571	А-13
285610	90572	А-13
285611	90573	А-13
285612	90574	А-13
285613	90575	Б-209
285614	90576	Б-209
285615	90577	Б-209
285616	90578	Б-209
285617	90579	Б-209
285618	90580	Б-209
285619	90581	Б-209
285620	90582	Б-209
285621	90583	Б-209
285622	90584	Б-209
285623	90585	Б-209
285624	90586	Б-209
285625	90587	Б-209
285626	90588	Б-209
285627	90589	Б-209
285628	90590	Б-209
285629	90591	А-113
285630	90592	А-113
285631	90593	А-113
285632	90594	А-113
285633	90595	А-113
285634	90596	А-113
285635	90597	А-113
285636	90598	А-113
285637	90599	Б-209
285638	90600	Б-209
285639	90601	Б-209
285640	90602	Б-209
285641	90603	Б-209
285642	90604	Б-209
285643	90605	Б-209
285644	90606	Б-209
285645	90607	А-113
285646	90608	А-113
285647	90609	А-113
285648	90610	А-113
285649	90611	А-113
285650	90612	А-113
285651	90613	А-113
285652	90614	А-113
285653	90615	Б-209
285654	90616	Б-209
285655	90617	Б-209
285656	90618	Б-209
285657	90619	Б-209
285658	90620	Б-209
285659	90621	Б-209
285660	90622	Б-209
285661	90623	Б-209
285662	90624	Б-209
285663	90625	Б-209
285664	90626	Б-209
285665	90627	Б-209
285666	90628	Б-209
285667	90629	Б-209
285668	90630	Б-209
285669	90631	А-113
285670	90632	А-113
285671	90633	А-113
285672	90634	А-113
285673	90635	А-113
285674	90636	А-113
285675	90637	А-113
285676	90638	А-113
285677	90639	Б-209
285678	90640	Б-209
285679	90641	Б-209
285680	90642	Б-209
285681	90643	Б-209
285682	90644	Б-209
285683	90645	Б-209
285684	90646	Б-209
285685	90647	Б-209
285686	90648	Б-209
285687	90649	Б-209
285688	90650	Б-209
285689	90651	Б-209
285690	90652	Б-209
285691	90653	Б-209
285692	90654	Б-209
285693	90655	А-113
285694	90656	А-113
285695	90657	А-113
285696	90658	А-113
285697	90659	А-113
285698	90660	А-113
285699	90661	А-113
285700	90662	А-113
285701	90663	А-113
285702	90664	А-113
285703	90665	А-113
285704	90666	А-113
285705	90667	А-113
285706	90668	А-113
285707	90669	А-113
285708	90670	А-113
285709	90671	Б-209-1
285710	90672	Б-209-1
285711	90673	Б-209-1
285712	90674	Б-209-1
285713	90675	Б-209-1
285714	90676	Б-209-1
285715	90677	Б-209-1
285716	90678	Б-209-1
285717	90679	А-13
285718	90680	А-13
285719	90681	А-13
285720	90682	А-13
285721	90683	А-13
285722	90684	А-13
285723	90685	А-13
285724	90686	А-13
285725	90687	А-13
285726	90688	А-13
285727	90689	А-13
285728	90690	А-13
285729	90691	А-13
285730	90692	А-13
285731	90693	А-13
285732	90694	А-13
285733	90695	А-13
285734	90696	А-13
285735	90697	А-13
285736	90698	А-13
285737	90699	А-13
285738	90700	А-13
285739	90701	А-13
285740	90702	А-13
285741	90703	А-305
285742	90704	А-305
285743	90705	А-305
285744	90706	А-305
285745	90707	А-305
285746	90708	А-305
285747	90709	А-305
285748	90710	А-305
285749	90711	А-305
285750	90712	А-305
285751	90713	А-305
285752	90714	А-305
285753	90715	А-305
285754	90716	А-305
285755	90717	А-305
285756	90718	А-305
285757	90719	Б-209-1
285758	90720	Б-209-1
285759	90721	Б-209-1
285760	90722	Б-209-1
285761	90723	Б-209-1
285762	90724	Б-209-1
285763	90725	Б-209-1
285764	90726	Б-209-1
285765	90727	Б-209-1
285766	90728	Б-209-1
285767	90729	Б-209-1
285768	90730	Б-209-1
285769	90731	Б-209-1
285770	90732	Б-209-1
285771	90733	Б-209-1
285772	90734	Б-209-1
285773	90735	А-216
285774	90736	А-216
285775	90737	А-216
285776	90738	А-216
285777	90739	А-216
285778	90740	А-216
285779	90741	А-216
285780	90742	А-216
285781	90743	А-216
285782	90744	А-216
285783	90745	А-216
285784	90746	А-216
285785	90747	А-216
285786	90748	А-216
285787	90749	А-216
285788	90750	А-216
285789	90751	А-318
285790	90752	А-318
285791	90753	А-318
285792	90754	А-318
285793	90755	А-318
285794	90756	А-318
285795	90757	А-318
285796	90758	А-318
285797	90759	А-318
285798	90760	А-318
285799	90761	А-318
285800	90762	А-318
285801	90763	А-318
285802	90764	А-318
285803	90765	А-318
285804	90766	А-318
285805	90767	Б-209
285806	90768	Б-209
285807	90769	Б-209
285808	90770	Б-209
285809	90771	Б-209
285810	90772	Б-209
285811	90773	Б-209
285812	90774	Б-209
285813	90775	Б-209
285814	90776	Б-209
285815	90777	Б-209
285816	90778	Б-209
285817	90779	Б-209
285818	90780	Б-209
285819	90781	Б-209
285820	90782	Б-209
285821	90783	Б-209
285822	90784	Б-209
285823	90785	Б-209
285824	90786	Б-209
285825	90787	Б-209
285826	90788	Б-209
285827	90789	Б-209
285828	90790	Б-209
285829	90791	Б-209
285830	90792	Б-209
285831	90793	Б-209
285832	90794	Б-209
285833	90795	Б-209
285834	90796	Б-209
285835	90797	Б-209
285836	90798	Б-209
285837	90799	Б-209
285838	90800	Б-209
285839	90801	Б-209
285840	90802	Б-209
285841	90803	Б-209
285842	90804	Б-209
285843	90805	Б-209
285844	90806	Б-209
285845	90807	Б-209
285846	90808	Б-209
285847	90809	Б-209
285848	90810	Б-209
285849	90811	Б-209
285850	90812	Б-209
285851	90813	Б-209
285852	90814	Б-209
285853	90815	А-316
285854	90816	А-316
285855	90817	А-316
285856	90818	А-316
285857	90819	А-316
285858	90820	А-316
285859	90821	А-316
285860	90822	А-316
285861	90823	А-113
285862	90824	А-113
285863	90825	А-113
285864	90826	А-113
285865	90827	А-113
285866	90828	А-113
285867	90829	А-113
285868	90830	А-113
285869	90831	А-316
285870	90832	А-316
285871	90833	А-316
285872	90834	А-316
285873	90835	А-316
285874	90836	А-316
285875	90837	А-316
285876	90838	А-316
285877	90839	А-113
285878	90840	А-113
285879	90841	А-113
285880	90842	А-113
285881	90843	А-113
285882	90844	А-113
285883	90845	А-113
285884	90846	А-113
285885	90847	НИР
285886	90848	НИР
285887	90849	НИР
285888	90850	НИР
285889	90851	НИР
285890	90852	НИР
285891	90853	НИР
285892	90854	НИР
285893	90855	НИР
285894	90856	НИР
285895	90857	НИР
285896	90858	НИР
285897	90859	НИР
285898	90860	НИР
285899	90861	НИР
285900	90862	НИР
285901	90863	НИР
285902	90864	НИР
285903	90865	НИР
285904	90866	НИР
285905	90867	НИР
285906	90868	НИР
285907	90869	НИР
285908	90870	НИР
285909	90871	НИР
285910	90872	НИР
285911	90873	НИР
285912	90874	НИР
285913	90875	НИР
285914	90876	НИР
285915	90877	НИР
285916	90878	НИР
285917	90879	НИР
285918	90880	НИР
285919	90881	НИР
285920	90882	НИР
285921	90883	НИР
285922	90884	НИР
285923	90885	НИР
285924	90886	НИР
285925	90887	НИР
285926	90888	НИР
285927	90889	НИР
285928	90890	НИР
285929	90891	НИР
285930	90892	НИР
285931	90893	НИР
285932	90894	НИР
285933	90895	НИР
285934	90896	НИР
285935	90897	НИР
285936	90898	НИР
285937	90899	НИР
285938	90900	НИР
285939	90901	НИР
285940	90902	НИР
285941	90903	НИР
285942	90904	НИР
285943	90905	НИР
285944	90906	НИР
285945	90907	НИР
285946	90908	НИР
285947	90909	НИР
285948	90910	НИР
285949	90911	Б-209
285950	90912	Б-209
285951	90913	Б-209
285952	90914	Б-209
285953	90915	Б-209
285954	90916	Б-209
285955	90917	Б-209
285956	90918	Б-209
285957	90919	А-113
285958	90920	А-113
285959	90921	А-113
285960	90922	А-113
285961	90923	А-113
285962	90924	А-113
285963	90925	А-113
285964	90926	А-113
285965	90927	Б-209
285966	90928	Б-209
285967	90929	Б-209
285968	90930	Б-209
285969	90931	Б-209
285970	90932	Б-209
285971	90933	Б-209
285972	90934	Б-209
285973	90935	Б-115
285974	90936	Б-115
285975	90937	Б-115
285976	90938	Б-115
285977	90939	Б-115
285978	90940	Б-115
285979	90941	Б-115
285980	90942	Б-115
285981	90943	Б-115
285982	90944	Б-115
285983	90945	Б-115
285984	90946	Б-115
285985	90947	Б-115
285986	90948	Б-115
285987	90949	Б-115
285988	90950	Б-115
285989	90951	Г-102
285990	90952	Г-102
285991	90953	Г-102
285992	90954	Г-102
285993	90955	Г-102
285994	90956	Г-102
285995	90957	Г-102
285996	90958	Г-102
285997	90959	Г-102
285998	90960	Г-102
285999	90961	Г-102
286000	90962	Г-102
286001	90963	Г-102
286002	90964	Г-102
286003	90965	Г-102
286004	90966	Г-102
286005	90967	А-205
286006	90968	А-205
286007	90969	А-205
286008	90970	А-205
286009	90971	А-205
286010	90972	А-205
286011	90973	А-205
286012	90974	А-205
286013	90975	А-173
286014	90976	А-173
286015	90977	А-173
286016	90978	А-173
286017	90979	А-173
286018	90980	А-173
286019	90981	А-173
286020	90982	А-173
286021	90983	А-8
286022	90984	А-8
286023	90985	А-8
286024	90986	А-8
286025	90987	А-8
286026	90988	А-8
286027	90989	А-8
286028	90990	А-8
286029	90991	А-173
286030	90992	А-173
286031	90993	А-173
286032	90994	А-173
286033	90995	А-173
286034	90996	А-173
286035	90997	А-173
286036	90998	А-173
286037	90999	Б-115
286038	91000	Б-115
286039	91001	Б-115
286040	91002	Б-115
286041	91003	Б-115
286042	91004	Б-115
286043	91005	Б-115
286044	91006	Б-115
286045	91007	Б-115
286046	91008	Б-115
286047	91009	Б-115
286048	91010	Б-115
286049	91011	Б-115
286050	91012	Б-115
286051	91013	Б-115
286052	91014	Б-115
286053	91015	А-181
286054	91016	А-181
286055	91017	А-181
286056	91018	А-181
286057	91019	А-181
286058	91020	А-181
286059	91021	А-181
286060	91022	А-181
286061	91023	А-181
286062	91024	А-181
286063	91025	А-181
286064	91026	А-181
286065	91027	А-181
286066	91028	А-181
286067	91029	А-181
286068	91030	А-181
286069	91031	А-173
286070	91032	А-173
286071	91033	А-173
286072	91034	А-173
286073	91035	А-173
286074	91036	А-173
286075	91037	А-173
286076	91038	А-173
286077	91103	А-4
286078	91104	А-4
286079	91105	А-4
286080	91106	А-4
286081	91107	А-4
286082	91108	А-4
286083	91109	А-4
286084	91110	А-4
286085	91111	А-4
286086	91112	А-4
286087	91113	А-4
286088	91114	А-4
286089	91115	А-4
286090	91116	А-4
286091	91117	А-4
286092	91118	А-4
286093	91119	А-314
286094	91120	А-314
286095	91121	А-314
286096	91122	А-314
286097	91123	А-314
286098	91124	А-314
286099	91125	А-314
286100	91126	А-314
286101	91127	А-207
286102	91128	А-207
286103	91129	А-207
286104	91130	А-207
286105	91131	А-207
286106	91132	А-207
286107	91133	А-207
286108	91134	А-207
286109	91135	Б-209
286110	91136	Б-209
286111	91137	Б-209
286112	91138	Б-209
286113	91139	Б-209
286114	91140	Б-209
286115	91141	Б-209
286116	91142	Б-209
286117	91143	Б-209
286118	91144	Б-209
286119	91145	Б-209
286120	91146	Б-209
286121	91147	Б-209
286122	91148	Б-209
286123	91149	Б-209
286124	91150	Б-209
286125	91151	Б-209
286126	91152	Б-209
286127	91153	Б-209
286128	91154	Б-209
286129	91155	Б-209
286130	91156	Б-209
286131	91157	Б-209
286132	91158	Б-209
286133	91159	Б-209
286134	91160	Б-209
286135	91161	Б-209
286136	91162	Б-209
286137	91163	Б-209
286138	91164	Б-209
286139	91165	Б-209
286140	91166	Б-209
286141	91167	Б-209
286142	91168	Б-209
286143	91169	Б-209
286144	91170	Б-209
286145	91171	Б-209
286146	91172	Б-209
286147	91173	Б-209
286148	91174	Б-209
286149	91175	Б-209
286150	91176	Б-209
286151	91177	Б-209
286152	91178	Б-209
286153	91179	Б-209
286154	91180	Б-209
286155	91181	Б-209
286156	91182	Б-209
286157	91183	А-316
286158	91184	А-316
286159	91185	А-316
286160	91186	А-316
286161	91187	А-316
286162	91188	А-316
286163	91189	А-316
286164	91190	А-316
286165	91191	А-113
286166	91192	А-113
286167	91193	А-113
286168	91194	А-113
286169	91195	А-113
286170	91196	А-113
286171	91197	А-113
286172	91198	А-113
286173	91199	А-316
286174	91200	А-316
286175	91201	А-316
286176	91202	А-316
286177	91203	А-316
286178	91204	А-316
286179	91205	А-316
286180	91206	А-316
286181	91207	А-113
286182	91208	А-113
286183	91209	А-113
286184	91210	А-113
286185	91211	А-113
286186	91212	А-113
286187	91213	А-113
286188	91214	А-113
286189	91215	НИР
286190	91216	НИР
286191	91217	НИР
286192	91218	НИР
286193	91219	НИР
286194	91220	НИР
286195	91221	НИР
286196	91222	НИР
286197	91223	НИР
286198	91224	НИР
286199	91225	НИР
286200	91226	НИР
286201	91227	НИР
286202	91228	НИР
286203	91229	НИР
286204	91230	НИР
286205	91231	НИР
286206	91232	НИР
286207	91233	НИР
286208	91234	НИР
286209	91235	НИР
286210	91236	НИР
286211	91237	НИР
286212	91238	НИР
286213	91239	НИР
286214	91240	НИР
286215	91241	НИР
286216	91242	НИР
286217	91243	НИР
286218	91244	НИР
286219	91245	НИР
286220	91246	НИР
286221	91247	НИР
286222	91248	НИР
286223	91249	НИР
286224	91250	НИР
286225	91251	НИР
286226	91252	НИР
286227	91253	НИР
286228	91254	НИР
286229	91255	НИР
286230	91256	НИР
286231	91257	НИР
286232	91258	НИР
286233	91259	НИР
286234	91260	НИР
286235	91261	НИР
286236	91262	НИР
286237	91263	НИР
286238	91264	НИР
286239	91265	НИР
286240	91266	НИР
286241	91267	НИР
286242	91268	НИР
286243	91269	НИР
286244	91270	НИР
286245	91271	НИР
286246	91272	НИР
286247	91273	НИР
286248	91274	НИР
286249	91275	НИР
286250	91276	НИР
286251	91277	НИР
286252	91278	НИР
286253	91279	Б-209
286254	91280	Б-209
286255	91281	Б-209
286256	91282	Б-209
286257	91283	Б-209
286258	91284	Б-209
286259	91285	Б-209
286260	91286	Б-209
286261	91287	А-113
286262	91288	А-113
286263	91289	А-113
286264	91290	А-113
286265	91291	А-113
286266	91292	А-113
286267	91293	А-113
286268	91294	А-113
286269	91295	Б-209
286270	91296	Б-209
286271	91297	Б-209
286272	91298	Б-209
286273	91299	Б-209
286274	91300	Б-209
286275	91301	Б-209
286276	91302	Б-209
286277	91303	Б-115
286278	91304	Б-115
286279	91305	Б-115
286280	91306	Б-115
286281	91307	Б-115
286282	91308	Б-115
286283	91309	Б-115
286284	91310	Б-115
286285	91311	Б-115
286286	91312	Б-115
286287	91313	Б-115
286288	91314	Б-115
286289	91315	Б-115
286290	91316	Б-115
286291	91317	Б-115
286292	91318	Б-115
286293	91319	Г-102
286294	91320	Г-102
286295	91321	Г-102
286296	91322	Г-102
286297	91323	Г-102
286298	91324	Г-102
286299	91325	Г-102
286300	91326	Г-102
286301	91327	Г-102
286302	91328	Г-102
286303	91329	Г-102
286304	91330	Г-102
286305	91331	Г-102
286306	91332	Г-102
286307	91333	Г-102
286308	91334	Г-102
286309	91335	А-205
286310	91336	А-205
286311	91337	А-205
286312	91338	А-205
286313	91339	А-205
286314	91340	А-205
286315	91341	А-205
286316	91342	А-205
286317	91343	А-204
286318	91344	А-204
286319	91345	А-204
286320	91346	А-204
286321	91347	А-204
286322	91348	А-204
286323	91349	А-204
286324	91350	А-204
286325	91351	А-204
286326	91352	А-204
286327	91353	А-204
286328	91354	А-204
286329	91355	А-204
286330	91356	А-204
286331	91357	А-204
286332	91358	А-204
286333	91359	А-8
286334	91360	А-8
286335	91361	А-8
286336	91362	А-8
286337	91363	А-8
286338	91364	А-8
286339	91365	А-8
286340	91366	А-8
286341	91367	А-204
286342	91368	А-204
286343	91369	А-204
286344	91370	А-204
286345	91371	А-204
286346	91372	А-204
286347	91373	А-204
286348	91374	А-204
286349	91375	Б-115
286350	91376	Б-115
286351	91377	Б-115
286352	91378	Б-115
286353	91379	Б-115
286354	91380	Б-115
286355	91381	Б-115
286356	91382	Б-115
286357	91383	Б-115
286358	91384	Б-115
286359	91385	Б-115
286360	91386	Б-115
286361	91387	Б-115
286362	91388	Б-115
286363	91389	Б-115
286364	91390	Б-115
286365	91391	А-181
286366	91392	А-181
286367	91393	А-181
286368	91394	А-181
286369	91395	А-181
286370	91396	А-181
286371	91397	А-181
286372	91398	А-181
286373	91399	А-181
286374	91400	А-181
286375	91401	А-181
286376	91402	А-181
286377	91403	А-181
286378	91404	А-181
286379	91405	А-181
286380	91406	А-181
286381	91471	А-4
286382	91472	А-4
286383	91473	А-4
286384	91474	А-4
286385	91475	А-4
286386	91476	А-4
286387	91477	А-4
286388	91478	А-4
286389	91479	А-4
286390	91480	А-4
286391	91481	А-4
286392	91482	А-4
286393	91483	А-4
286394	91484	А-4
286395	91485	А-4
286396	91486	А-4
286397	91487	А-314
286398	91488	А-314
286399	91489	А-314
286400	91490	А-314
286401	91491	А-314
286402	91492	А-314
286403	91493	А-314
286404	91494	А-314
286405	91495	А-207
286406	91496	А-207
286407	91497	А-207
286408	91498	А-207
286409	91499	А-207
286410	91500	А-207
286411	91501	А-207
286412	91502	А-207
286413	91503	Б-209-1
286414	91504	Б-209-1
286415	91505	Б-209-1
286416	91506	Б-209-1
286417	91507	Б-209-1
286418	91508	Б-209-1
286419	91509	Б-209-1
286420	91510	Б-209-1
286421	91511	А-107
286422	91512	А-107
286423	91513	А-107
286424	91514	А-107
286425	91515	А-107
286426	91516	А-107
286427	91517	А-107
286428	91518	А-107
286429	91519	А-107
286430	91520	А-107
286431	91521	А-107
286432	91522	А-107
286433	91523	А-107
286434	91524	А-107
286435	91525	А-107
286436	91526	А-107
286437	91527	А-107
286438	91528	А-107
286439	91529	А-107
286440	91530	А-107
286441	91531	А-107
286442	91532	А-107
286443	91533	А-107
286444	91534	А-107
286445	91535	И-315
286446	91536	И-315
286447	91537	И-315
286448	91538	И-315
286449	91539	И-315
286450	91540	И-315
286451	91541	И-315
286452	91542	И-315
286453	91543	И-315
286454	91544	И-315
286455	91545	И-315
286456	91546	И-315
286457	91547	И-315
286458	91548	И-315
286459	91549	И-315
286460	91550	И-315
286461	91551	А-311
286462	91552	А-311
286463	91553	А-311
286464	91554	А-311
286465	91555	А-311
286466	91556	А-311
286467	91557	А-311
286468	91558	А-311
286469	91559	А-311
286470	91560	А-311
286471	91561	А-311
286472	91562	А-311
286473	91563	А-311
286474	91564	А-311
286475	91565	А-311
286476	91566	А-311
286477	91567	А-325
286478	91568	А-325
286479	91569	А-325
286480	91570	А-325
286481	91571	А-325
286482	91572	А-325
286483	91573	А-325
286484	91574	А-325
286485	91575	ИВЦ-117
286486	91576	ИВЦ-117
286487	91577	ИВЦ-117
286488	91578	ИВЦ-117
286489	91579	ИВЦ-117
286490	91580	ИВЦ-117
286491	91581	ИВЦ-117
286492	91582	ИВЦ-117
286493	91583	Б-209-1
286494	91584	Б-209-1
286495	91585	Б-209-1
286496	91586	Б-209-1
286497	91587	Б-209-1
286498	91588	Б-209-1
286499	91589	Б-209-1
286500	91590	Б-209-1
286501	91591	А-211
286502	91592	А-211
286503	91593	А-211
286504	91594	А-211
286505	91595	А-211
286506	91596	А-211
286507	91597	А-211
286508	91598	А-211
286509	91599	Б-209-1
286510	91600	Б-209-1
286511	91601	Б-209-1
286512	91602	Б-209-1
286513	91603	Б-209-1
286514	91604	Б-209-1
286515	91605	Б-209-1
286516	91606	Б-209-1
286517	91607	Б-209
286518	91608	Б-209
286519	91609	Б-209
286520	91610	Б-209
286521	91611	Б-209
286522	91612	Б-209
286523	91613	Б-209
286524	91614	Б-209
286525	91615	А-205
286526	91616	А-205
286527	91617	А-205
286528	91618	А-205
286529	91619	А-205
286530	91620	А-205
286531	91621	А-205
286532	91622	А-205
286533	91623	Б-209
286534	91624	Б-209
286535	91625	Б-209
286536	91626	Б-209
286537	91627	Б-209
286538	91628	Б-209
286539	91629	Б-209
286540	91630	Б-209
286541	91807	Б-209-1
286542	91808	Б-209-1
286543	91809	Б-209-1
286544	91810	Б-209-1
286545	91811	Б-209-1
286546	91812	Б-209-1
286547	91813	Б-209-1
286548	91814	Б-209-1
286549	91815	Б-209-1
286550	91816	Б-209-1
286551	91817	Б-209-1
286552	91818	Б-209-1
286553	91819	Б-209-1
286554	91820	Б-209-1
286555	91821	Б-209-1
286556	91822	Б-209-1
286557	91823	Б-209-1
286558	91824	Б-209-1
286559	91825	Б-209-1
286560	91826	Б-209-1
286561	91827	Б-209-1
286562	91828	Б-209-1
286563	91829	Б-209-1
286564	91830	Б-209-1
286565	91831	Б-209-1
286566	91832	Б-209-1
286567	91833	Б-209-1
286568	91834	Б-209-1
286569	91835	Б-209-1
286570	91836	Б-209-1
286571	91837	Б-209-1
286572	91838	Б-209-1
286573	91839	Г-423
286574	91840	Г-423
286575	91841	Г-423
286576	91842	Г-423
286577	91843	Г-423
286578	91844	Г-423
286579	91845	Г-423
286580	91846	Г-423
286581	91847	Г-423
286582	91848	Г-423
286583	91849	Г-423
286584	91850	Г-423
286585	91851	Г-423
286586	91852	Г-423
286587	91853	Г-423
286588	91854	Г-423
286589	91855	Г-213
286590	91856	Г-213
286591	91857	Г-213
286592	91858	Г-213
286593	91859	Г-213
286594	91860	Г-213
286595	91861	Г-213
286596	91862	Г-213
286597	91863	База
286598	91864	База
286599	91865	База
286600	91866	База
286601	91867	База
286602	91868	База
286603	91869	База
286604	91870	База
286605	91871	База
286606	91872	База
286607	91873	База
286608	91874	База
286609	91875	База
286610	91876	База
286611	91877	База
286612	91878	База
286613	91895	А-178
286614	91896	А-178
286615	91897	А-178
286616	91898	А-178
286617	91899	А-178
286618	91900	А-178
286619	91901	А-178
286620	91902	А-178
286621	91919	А-307
286622	91920	А-307
286623	91921	А-307
286624	91922	А-307
286625	91923	А-307
286626	91924	А-307
286627	91925	А-307
286628	91926	А-307
286629	91927	дист.
286630	91928	дист.
286631	91929	дист.
286632	91930	дист.
286633	91931	дист.
286634	91932	дист.
286635	91933	дист.
286636	91934	дист.
286637	91935	дист.
286638	91936	дист.
286639	91937	дист.
286640	91938	дист.
286641	91939	дист.
286642	91940	дист.
286643	91941	дист.
286644	91942	дист.
286645	91943	А-243-а\nМП-1
286646	91944	А-243-а\nМП-1
286647	91945	А-243-а\nМП-1
286648	91946	А-243-а\nМП-1
286649	91947	А-243-а\nМП-1
286650	91948	А-243-а\nМП-1
286651	91949	А-243-а\nМП-1
286652	91950	А-243-а\nМП-1
286653	91951	А-311
286654	91952	А-311
286655	91953	А-311
286656	91954	А-311
286657	91955	А-311
286658	91956	А-311
286659	91957	А-311
286660	91958	А-311
286661	91959	дист.
286662	91960	дист.
286663	91961	дист.
286664	91962	дист.
286665	91963	дист.
286666	91964	дист.
286667	91965	дист.
286668	91966	дист.
286669	91967	Г-102
286670	91968	Б-209-1
286671	91969	И-317
286672	91970	А-327
286673	91971	Б-209-2
286674	91972	ФОК-9
286675	91973	СДО
286676	91974	Б-209-1
286677	91975	дист
286678	91976	ИВЦ-103
286679	91977	дист
286680	91978	А-12
286681	91979	дист
286682	91980	А-12
286683	91981	дист
286684	91982	А-12
286685	91983	Б-209-1
286686	91984	ФОК-11
286687	91985	Г-102
286688	91986	Б-209-1
286689	91987	Б-209-2
286690	91988	А-409
286691	91989	СДО
286692	91990	И-329\nИ-318
286693	91991	дист
286694	91992	ИВЦ-103
286695	91993	дист
286696	91994	А-12
286697	91995	дист
286698	91996	А-12
286699	91997	дист
286700	91998	А-12
286701	91999	Б-209-1
286702	92000	Г-102
286703	92001	ФОК-4
286704	92002	А-405
286705	92003	СДО
286706	92004	Б-209-2
286707	92005	Б-209-1
286708	92006	И-306\nИ-319
286709	92007	дист
286710	92008	ИВЦ-103
286711	92009	дист
286712	92010	А-12
286713	92011	дист
286714	92012	А-12
286715	92013	дист
286716	92014	А-12
286717	92015	ФОК-5
286718	92016	Б-209-1
286719	92017	А-323
286720	92018	А-405
286721	92019	И-302\nИ-318
286722	92020	СДО
286723	92021	Б-209-2
286724	92022	Б-209-1
286725	92023	дист
286726	92024	ИВЦ-103
286727	92025	дист
286728	92026	А-12
286729	92027	дист
286730	92028	А-12
286731	92029	дист
286732	92030	А-12
286733	92031	ФОК-12
286734	92032	Б-209-2
286735	92033	И-324
286736	92034	А-182
286737	92035	Б-209-2
286738	92036	Б-209-2
286739	92037	дист
286740	92038	А-17
286741	92039	дист
286742	92040	А-17
286743	92041	дист
286744	92042	А-12
286745	92043	И-203-б
286746	92044	дист
286747	92045	А-16
286748	92046	дист
286749	92047	А-12
286750	92048	А-182
286751	92049	Б-209-2
286752	92050	Б-209-2
286753	92051	И-307\nИ-314
286754	92052	Б-209-2
286755	92053	ФОК-3
286756	92054	дист
286757	92055	А-17
286758	92056	дист
286759	92057	А-17
286760	92058	дист
286761	92059	А-12
286762	92060	И-203-б
286763	92061	дист
286764	92062	А-16
286765	92063	дист
286766	92064	А-12
286767	92065	Б-209-2
286768	92066	Б-209-1
286769	92067	СДО
286770	92068	Б-209-1
286771	92069	Б-209-1
286772	92070	дист
286773	92071	Б-209
286774	92072	Б-209
286775	92073	Б-209
286776	92074	дист
286777	92075	А-6
286778	92076	дист
286779	92077	А-17
286780	92078	дист
286781	92079	А-6
286782	92080	Б-209-2
286783	92081	Б-209-1
286784	92082	СДО
286785	92083	Б-209-1
286786	92084	Б-209-1
286787	92085	дист
286788	92086	Б-209
286789	92087	Б-209
286790	92088	Б-209
286791	92089	дист
286792	92090	А-6
286793	92091	дист
286794	92092	А-17
286795	92093	дист
286796	92094	А-7
286797	92096	Б-209
286798	92097	Г-213
286799	92098	А-150
286800	92099	Б-209
286801	92100	Б-209-2
286802	92101	А-12
286803	92102	Б-209-2
286804	92103	Б-209
286805	92104	Б-209
286806	92105	дист
286807	92106	А-6
286808	92107	дист
286809	92108	Б-209
286810	92109	дист
286811	92110	Б-209
286812	92111	дист
286813	92112	А-7
286814	92114	Б-209
286815	92115	Г-213
286816	92116	А-150
286817	92117	Б-209
286818	92118	Б-209-2
286819	92119	А-12
286820	92120	Б-209-2
286821	92121	Б-209
286822	92122	Б-209
286823	92123	дист
286824	92124	А-6
286825	92125	дист
286826	92126	Б-209
286827	92127	дист
286828	92128	Б-209
286829	92129	дист
286830	92130	А-7
286831	92131	дист.
286832	92132	ИВЦ-117
286833	92133	Б-209
286834	92134	Б-209
286835	92135	А-215
286836	92136	И-315
286837	92137	дист.
286838	92138	Б-209
286839	92139	Б-209
286840	92140	дист.
286841	92141	А-215
286842	92142	Б-209-2
286843	92143	Б-209-1
286844	92144	А-462 \n(МП-1)
286845	92145	Б-209-1
286846	92146	Б-209-1
286847	92147	Б-209-1
286848	92148	Б-209-1
286849	92149	Г-213
286850	92150	А-523\n (МП-1)
286851	92151	дист.
286852	92152	Г-213
286853	92153	А-525\n(МП-1)
286854	92154	Б-209-1
286855	92155	Б-209-1
286856	92156	Б-209-2
286857	92157	Б-209-1
300974	113402	А-206
300975	113403	А-206
300976	113404	А-206
300977	113405	А-206
300978	113406	А-206
300979	113407	А-206
300980	113408	А-206
300981	113409	А-206
300982	113410	А-206
300983	113411	А-206
300984	113412	А-206
300985	113413	А-206
300986	113414	А-206
300987	113415	А-206
300988	113416	А-206
300989	113417	А-206
300990	113418	И-309\nИ-308
300991	113419	И-309\nИ-308
300992	113420	И-309\nИ-308
300993	113421	И-309\nИ-308
300994	113422	И-309\nИ-308
300995	113423	И-309\nИ-308
300996	113424	И-309\nИ-308
300997	113425	И-309\nИ-308
300998	113426	И-309\nИ-308
300999	113427	И-309\nИ-308
301000	113428	И-309\nИ-308
301001	113429	И-309\nИ-308
301002	113430	И-309\nИ-308
301003	113431	И-309\nИ-308
301004	113432	И-309\nИ-308
301005	113433	И-309\nИ-308
301006	113434	Б-209-2
301007	113435	Б-209-2
301008	113436	Б-209-2
301009	113437	Б-209-2
301010	113438	Б-209-2
301011	113439	Б-209-2
301012	113440	Б-209-2
301013	113441	Б-209-2
301014	113442	Б-209-2
301015	113443	Б-209-2
301016	113444	Б-209-2
301017	113445	Б-209-2
301018	113446	Б-209-2
301019	113447	Б-209-2
301020	113448	Б-209-2
301021	113449	Б-209-2
301022	113450	Б-209-2
301023	113451	Б-209-2
301024	113452	Б-209-2
301025	113453	Б-209-2
301026	113454	Б-209-2
301027	113455	Б-209-2
301028	113456	Б-209-2
301029	113457	Б-209-2
301030	113458	Б-209-2
301031	113459	Б-209-2
301032	113460	Б-209-2
301033	113461	Б-209-2
301034	113462	Б-209-2
301035	113463	Б-209-2
301036	113464	Б-209-2
301037	113465	Б-209-2
301038	113466	ФОК
301039	113467	ФОК
301040	113468	ФОК
301041	113469	ФОК
301042	113470	ФОК
301043	113471	ФОК
301044	113472	ФОК
301045	113473	ФОК
301046	113474	ФОК
301047	113475	ФОК
301048	113476	ФОК
301049	113477	ФОК
301050	113478	ФОК
301051	113479	ФОК
301052	113480	ФОК
301053	113481	ФОК
301054	113482	А-13
301055	113483	А-13
301056	113484	А-13
301057	113485	А-13
301058	113486	А-13
301059	113487	А-13
301060	113488	А-13
301061	113489	А-13
301062	113490	А-13
301063	113491	А-13
301064	113492	А-13
301065	113493	А-13
301066	113494	А-13
301067	113495	А-13
301068	113496	А-13
301069	113497	А-13
301070	113498	А-13
301071	113499	А-13
301072	113500	А-13
301073	113501	А-13
301074	113502	А-13
301075	113503	А-13
301076	113504	А-13
301077	113505	А-13
301078	113506	А-13
301079	113507	А-13
301080	113508	А-13
301081	113509	А-13
301082	113510	А-13
301083	113511	А-13
301084	113512	А-13
301085	113513	А-13
301086	113514	А-217
301087	113515	А-217
301088	113516	А-217
301089	113517	А-217
301090	113518	А-217
301091	113519	А-217
301092	113520	А-217
301093	113521	А-217
301094	113522	А-217
301095	113523	А-217
301096	113524	А-217
301097	113525	А-217
301098	113526	А-217
301099	113527	А-217
301100	113528	А-217
301101	113529	А-217
301102	113530	А-1
301103	113531	А-1
301104	113532	А-1
301105	113533	А-1
301106	113534	А-1
301107	113535	А-1
301108	113536	А-1
301109	113537	А-1
301110	113538	А-13
301111	113539	А-13
301112	113540	А-13
301113	113541	А-13
301114	113542	А-13
301115	113543	А-13
301116	113544	А-13
301117	113545	А-13
301118	113546	А-13
301119	113547	А-13
301120	113548	А-13
301121	113549	А-13
301122	113550	А-13
301123	113551	А-13
301124	113552	А-13
301125	113553	А-13
301126	113554	А-13
301127	113555	А-13
301128	113556	А-13
301129	113557	А-13
301130	113558	А-13
301131	113559	А-13
301132	113560	А-13
301133	113561	А-13
301134	113562	А-328
301135	113563	А-328
301136	113564	А-328
301137	113565	А-328
301138	113566	А-328
301139	113567	А-328
301140	113568	А-328
301141	113569	А-328
301142	113570	А-328
301143	113571	А-328
301144	113572	А-328
301145	113573	А-328
301146	113574	А-328
301147	113575	А-328
301148	113576	А-328
301149	113577	А-328
301150	113578	А-173
301151	113579	А-173
301152	113580	А-173
301153	113581	А-173
301154	113582	А-173
301155	113583	А-173
301156	113584	А-173
301157	113585	А-173
301158	113586	А-173
301159	113587	А-173
301160	113588	А-173
301161	113589	А-173
301162	113590	А-173
301163	113591	А-173
301164	113592	А-173
301165	113593	А-173
301166	113594	А-1
301167	113595	А-1
301168	113596	А-1
301169	113597	А-1
301170	113598	А-1
301171	113599	А-1
301172	113600	А-1
301173	113601	А-1
301174	113602	А-1
301175	113603	А-1
301176	113604	А-1
301177	113605	А-1
301178	113606	А-1
301179	113607	А-1
301180	113608	А-1
301181	113609	А-1
301182	113610	А-173
301183	113611	А-173
301184	113612	А-173
301185	113613	А-173
301186	113614	А-173
301187	113615	А-173
301188	113616	А-173
301189	113617	А-173
301190	113618	А-173
301191	113619	А-173
301192	113620	А-173
301193	113621	А-173
301194	113622	А-173
301195	113623	А-173
301196	113624	А-173
301197	113625	А-173
301198	113626	Б-209-2
301199	113627	Б-209-2
301200	113628	Б-209-2
301201	113629	Б-209-2
301202	113630	Б-209-2
301203	113631	Б-209-2
301204	113632	Б-209-2
301205	113633	Б-209-2
301206	113634	Б-209-2
301207	113635	Б-209-2
301208	113636	Б-209-2
301209	113637	Б-209-2
301210	113638	Б-209-2
301211	113639	Б-209-2
301212	113640	Б-209-2
301213	113641	Б-209-2
301214	113642	Г-102
301215	113643	Г-102
301216	113644	Г-102
301217	113645	Г-102
301218	113646	Г-102
301219	113647	Г-102
301220	113648	Г-102
301221	113649	Г-102
301222	113650	Г-102
301223	113651	Г-102
301224	113652	Г-102
301225	113653	Г-102
301226	113654	Г-102
301227	113655	Г-102
301228	113656	Г-102
301229	113657	Г-102
301230	113658	А-13
301231	113659	А-13
301232	113660	А-13
301233	113661	А-13
301234	113662	А-13
301235	113663	А-13
301236	113664	А-13
301237	113665	А-13
301238	113666	А-13
301239	113667	А-13
301240	113668	А-13
301241	113669	А-13
301242	113670	А-13
301243	113671	А-13
301244	113672	А-13
301245	113673	А-13
301246	113674	А-13
301247	113675	А-13
301248	113676	А-13
301249	113677	А-13
301250	113678	А-13
301251	113679	А-13
301252	113680	А-13
301253	113681	А-13
301254	113682	А-13
301255	113683	А-13
301256	113684	А-13
301257	113685	А-13
301258	113686	А-13
301259	113687	А-13
301260	113688	А-13
301261	113689	А-13
301262	113690	Дист.
301263	113691	Дист.
301264	113692	Дист.
301265	113693	Дист.
301266	113694	Дист.
301267	113695	Дист.
301268	113696	Дист.
301269	113697	Дист.
301270	113698	Б-209-2
301271	113699	Б-209-2
301272	113700	Б-209-2
301273	113701	Б-209-2
301274	113702	Б-209-2
301275	113703	Б-209-2
301276	113704	Б-209-2
301277	113705	Б-209-2
301278	113706	Б-209-2
301279	113707	Б-209-2
301280	113708	Б-209-2
301281	113709	Б-209-2
301282	113710	Б-209-2
301283	113711	Б-209-2
301284	113712	Б-209-2
301285	113713	Б-209-2
301286	113714	Б-209-2
301287	113715	Б-209-2
301288	113716	Б-209-2
301289	113717	Б-209-2
301290	113718	Б-209-2
301291	113719	Б-209-2
301292	113720	Б-209-2
301293	113721	Б-209-2
301294	113722	И-307\nИ-308
301295	113723	И-307\nИ-308
301296	113724	И-307\nИ-308
301297	113725	И-307\nИ-308
301298	113726	И-307\nИ-308
301299	113727	И-307\nИ-308
301300	113728	И-307\nИ-308
301301	113729	И-307\nИ-308
301302	113730	И-307\nИ-308
301303	113731	И-307\nИ-308
301304	113732	И-307\nИ-308
301305	113733	И-307\nИ-308
301306	113734	И-307\nИ-308
301307	113735	И-307\nИ-308
301308	113736	И-307\nИ-308
301309	113737	И-307\nИ-308
301310	113738	А-174-б
301311	113739	А-174-б
301312	113740	А-174-б
301313	113741	А-174-б
301314	113742	А-174-б
301315	113743	А-174-б
301316	113744	А-174-б
301317	113745	А-174-б
301318	113746	А-174-б
301319	113747	А-174-б
301320	113748	А-174-б
301321	113749	А-174-б
301322	113750	А-174-б
301323	113751	А-174-б
301324	113752	А-174-б
301325	113753	А-174-б
301326	113754	Г-102
301327	113755	Г-102
301328	113756	Г-102
301329	113757	Г-102
301330	113758	Г-102
301331	113759	Г-102
301332	113760	Г-102
301333	113761	Г-102
301334	113762	Г-102
301335	113763	Г-102
301336	113764	Г-102
301337	113765	Г-102
301338	113766	Г-102
301339	113767	Г-102
301340	113768	Г-102
301341	113769	Г-102
301342	113770	А-218
301343	113771	А-218
301344	113772	А-218
301345	113773	А-218
301346	113774	А-218
301347	113775	А-218
301348	113776	А-218
301349	113777	А-218
301350	113778	А-218
301351	113779	А-218
301352	113780	А-218
301353	113781	А-218
301354	113782	А-218
301355	113783	А-218
301356	113784	А-218
301357	113785	А-218
301358	113786	Г-102
301359	113787	Г-102
301360	113788	Г-102
301361	113789	Г-102
301362	113790	Г-102
301363	113791	Г-102
301364	113792	Г-102
301365	113793	Г-102
301366	113794	Г-102
301367	113795	Г-102
301368	113796	Г-102
301369	113797	Г-102
301370	113798	Г-102
301371	113799	Г-102
301372	113800	Г-102
301373	113801	Г-102
301374	113802	ФОК
301375	113803	ФОК
301376	113804	ФОК
301377	113805	ФОК
301378	113806	ФОК
301379	113807	ФОК
301380	113808	ФОК
301381	113809	ФОК
301382	113810	ФОК
301383	113811	ФОК
301384	113812	ФОК
301385	113813	ФОК
301386	113814	ФОК
301387	113815	ФОК
301388	113816	ФОК
301389	113817	ФОК
301390	113818	А-203
301391	113819	А-203
301392	113820	А-203
301393	113821	А-203
301394	113822	А-203
301395	113823	А-203
301396	113824	А-203
301397	113825	А-203
301398	113826	А-203
301399	113827	А-203
301400	113828	А-203
301401	113829	А-203
301402	113830	А-203
301403	113831	А-203
301404	113832	А-203
301405	113833	А-203
301406	113834	А-207
301407	113835	А-207
301408	113836	А-207
301409	113837	А-207
301410	113838	А-207
301411	113839	А-207
301412	113840	А-207
301413	113841	А-207
301414	113842	А-207
301415	113843	А-207
301416	113844	А-207
301417	113845	А-207
301418	113846	А-207
301419	113847	А-207
301420	113848	А-207
301421	113849	А-207
301422	113850	Б-209-2
301423	113851	Б-209-2
301424	113852	Б-209-2
301425	113853	Б-209-2
301426	113854	Б-209-2
301427	113855	Б-209-2
301428	113856	Б-209-2
301429	113857	Б-209-2
301430	113858	Б-209-2
301431	113859	Б-209-2
301432	113860	Б-209-2
301433	113861	Б-209-2
301434	113862	Б-209-2
301435	113863	Б-209-2
301436	113864	Б-209-2
301437	113865	Б-209-2
301438	113866	Б-209-2
301439	113867	Б-209-2
301440	113868	Б-209-2
301441	113869	Б-209-2
301442	113870	Б-209-2
301443	113871	Б-209-2
301444	113872	Б-209-2
301445	113873	Б-209-2
301446	113874	Б-209-2
301447	113875	Б-209-2
301448	113876	Б-209-2
301449	113877	Б-209-2
301450	113878	Б-209-2
301451	113879	Б-209-2
301452	113880	Б-209-2
301453	113881	Б-209-2
301454	113882	Б-209-2
301455	113883	Б-209-2
301456	113884	Б-209-2
301457	113885	Б-209-2
301458	113886	Б-209-2
301459	113887	Б-209-2
301460	113888	Б-209-2
301461	113889	Б-209-2
301462	113890	Б-209-2
301463	113891	Б-209-2
301464	113892	Б-209-2
301465	113893	Б-209-2
301466	113894	Б-209-2
301467	113895	Б-209-2
301468	113896	Б-209-2
301469	113897	Б-209-2
301470	113898	Б-209-2
301471	113899	Б-209-2
301472	113900	Б-209-2
301473	113901	Б-209-2
301474	113902	Б-209-2
301475	113903	Б-209-2
301476	113904	Б-209-2
301477	113905	Б-209-2
301478	113906	Б-209-2
301479	113907	Б-209-2
301480	113908	Б-209-2
301481	113909	Б-209-2
301482	113910	Б-209-2
301483	113911	Б-209-2
301484	113912	Б-209-2
301485	113913	Б-209-2
301486	113914	Дист.
301487	113915	Дист.
301488	113916	Дист.
301489	113917	Дист.
301490	113918	Дист.
301491	113919	Дист.
301492	113920	Дист.
301493	113921	Дист.
301494	113922	ИВЦ-116
301495	113923	ИВЦ-116
301496	113924	ИВЦ-116
301497	113925	ИВЦ-116
301498	113926	ИВЦ-116
301499	113927	ИВЦ-116
301500	113928	ИВЦ-116
301501	113929	ИВЦ-116
301502	113930	ИВЦ-116
301503	113931	ИВЦ-116
301504	113932	ИВЦ-116
301505	113933	ИВЦ-116
301506	113934	ИВЦ-116
301507	113935	ИВЦ-116
301508	113936	ИВЦ-116
301509	113937	ИВЦ-116
301510	113938	ИВЦ-116
301511	113939	ИВЦ-116
301512	113940	ИВЦ-116
301513	113941	ИВЦ-116
301514	113942	ИВЦ-116
301515	113943	ИВЦ-116
301516	113944	ИВЦ-116
301517	113945	ИВЦ-116
301518	113946	ИВЦ-116
301519	113947	ИВЦ-116
301520	113948	ИВЦ-116
301521	113949	ИВЦ-116
301522	113950	ИВЦ-116
301523	113951	ИВЦ-116
301524	113952	ИВЦ-116
301525	113953	ИВЦ-116
301526	113954	Б-209-2
301527	113955	Б-209-2
301528	113956	Б-209-2
301529	113957	Б-209-2
301530	113958	Б-209-2
301531	113959	Б-209-2
301532	113960	Б-209-2
301533	113961	Б-209-2
301534	113962	Б-209-2
301535	113963	Б-209-2
301536	113964	Б-209-2
301537	113965	Б-209-2
301538	113966	Б-209-2
301539	113967	Б-209-2
301540	113968	Б-209-2
301541	113969	Б-209-2
301542	113970	Б-209-2
301543	113971	Б-209-2
301544	113972	Б-209-2
301545	113973	Б-209-2
301546	113974	Б-209-2
301547	113975	Б-209-2
301548	113976	Б-209-2
301549	113977	Б-209-2
301550	113978	Б-209-2
301551	113979	Б-209-2
301552	113980	Б-209-2
301553	113981	Б-209-2
301554	113982	Б-209-2
301555	113983	Б-209-2
301556	113984	Б-209-2
301557	113985	Б-209-2
301558	113986	А-173
301559	113987	А-173
301560	113988	А-173
301561	113989	А-173
301562	113990	А-173
301563	113991	А-173
301564	113992	А-173
301565	113993	А-173
301566	113994	А-173
301567	113995	А-173
301568	113996	А-173
301569	113997	А-173
301570	113998	А-173
301571	113999	А-173
301572	114000	А-173
301573	114001	А-173
301574	114002	Г-102
301575	114003	Г-102
301576	114004	Г-102
301577	114005	Г-102
301578	114006	Г-102
301579	114007	Г-102
301580	114008	Г-102
301581	114009	Г-102
301582	114010	Г-102
301583	114011	Г-102
301584	114012	Г-102
301585	114013	Г-102
301586	114014	Г-102
301587	114015	Г-102
301588	114016	Г-102
301589	114017	Г-102
301590	114018	И-304\nИ-305
301591	114019	И-304\nИ-305
301592	114020	И-304\nИ-305
301593	114021	И-304\nИ-305
301594	114022	И-304\nИ-305
301595	114023	И-304\nИ-305
301596	114024	И-304\nИ-305
301597	114025	И-304\nИ-305
301598	114026	И-304\nИ-305
301599	114027	И-304\nИ-305
301600	114028	И-304\nИ-305
301601	114029	И-304\nИ-305
301602	114030	И-304\nИ-305
301603	114031	И-304\nИ-305
301604	114032	И-304\nИ-305
301605	114033	И-304\nИ-305
301606	114034	А-217
301607	114035	А-217
301608	114036	А-217
301609	114037	А-217
301610	114038	А-217
301611	114039	А-217
301612	114040	А-217
301613	114041	А-217
301614	114042	А-217
301615	114043	А-217
301616	114044	А-217
301617	114045	А-217
301618	114046	А-217
301619	114047	А-217
301620	114048	А-217
301621	114049	А-217
301622	114050	ФОК
301623	114051	ФОК
301624	114052	ФОК
301625	114053	ФОК
301626	114054	ФОК
301627	114055	ФОК
301628	114056	ФОК
301629	114057	ФОК
301630	114058	ФОК
301631	114059	ФОК
301632	114060	ФОК
301633	114061	ФОК
301634	114062	ФОК
301635	114063	ФОК
301636	114064	ФОК
301637	114065	ФОК
301638	114066	А-203
301639	114067	А-203
301640	114068	А-203
301641	114069	А-203
301642	114070	А-203
301643	114071	А-203
301644	114072	А-203
301645	114073	А-203
301646	114074	А-203
301647	114075	А-203
301648	114076	А-203
301649	114077	А-203
301650	114078	А-203
301651	114079	А-203
301652	114080	А-203
301653	114081	А-203
301654	114082	А-328
301655	114083	А-328
301656	114084	А-328
301657	114085	А-328
301658	114086	А-328
301659	114087	А-328
301660	114088	А-328
301661	114089	А-328
301662	114090	А-328
301663	114091	А-328
301664	114092	А-328
301665	114093	А-328
301666	114094	А-328
301667	114095	А-328
301668	114096	А-328
301669	114097	А-328
301670	114098	А-177
301671	114099	А-177
301672	114100	А-177
301673	114101	А-177
301674	114102	А-177
301675	114103	А-177
301676	114104	А-177
301677	114105	А-177
301678	114106	А-177
301679	114107	А-177
301680	114108	А-177
301681	114109	А-177
301682	114110	А-177
301683	114111	А-177
301684	114112	А-177
301685	114113	А-177
301686	114114	Б-209-2
301687	114115	Б-209-2
301688	114116	Б-209-2
301689	114117	Б-209-2
301690	114118	Б-209-2
301691	114119	Б-209-2
301692	114120	Б-209-2
301693	114121	Б-209-2
301694	114122	Б-209-2
301695	114123	Б-209-2
301696	114124	Б-209-2
301697	114125	Б-209-2
301698	114126	Б-209-2
301699	114127	Б-209-2
301700	114128	Б-209-2
301701	114129	Б-209-2
301702	114130	Б-209-2
301703	114131	Б-209-2
301704	114132	Б-209-2
301705	114133	Б-209-2
301706	114134	Б-209-2
301707	114135	Б-209-2
301708	114136	Б-209-2
301709	114137	Б-209-2
301710	114138	Б-209-2
301711	114139	Б-209-2
301712	114140	Б-209-2
301713	114141	Б-209-2
301714	114142	Б-209-2
301715	114143	Б-209-2
301716	114144	Б-209-2
301717	114145	Б-209-2
301718	114146	А-218
301719	114147	А-218
301720	114148	А-218
301721	114149	А-218
301722	114150	А-218
301723	114151	А-218
301724	114152	А-218
301725	114153	А-218
301726	114154	А-218
301727	114155	А-218
301728	114156	А-218
301729	114157	А-218
301730	114158	А-218
301731	114159	А-218
301732	114160	А-218
301733	114161	А-218
301734	114162	ФОК
301735	114163	ФОК
301736	114164	ФОК
301737	114165	ФОК
301738	114166	ФОК
301739	114167	ФОК
301740	114168	ФОК
301741	114169	ФОК
301742	114170	ФОК
301743	114171	ФОК
301744	114172	ФОК
301745	114173	ФОК
301746	114174	ФОК
301747	114175	ФОК
301748	114176	ФОК
301749	114177	ФОК
301750	114178	А-318
301751	114179	А-318
301752	114180	А-318
301753	114181	А-318
301754	114182	А-318
301755	114183	А-318
301756	114184	А-318
301757	114185	А-318
301758	114186	А-318
301759	114187	А-318
301760	114188	А-318
301761	114189	А-318
301762	114190	А-318
301763	114191	А-318
301764	114192	А-318
301765	114193	А-318
301766	114194	Г-102
301767	114195	Г-102
301768	114196	Г-102
301769	114197	Г-102
301770	114198	Г-102
301771	114199	Г-102
301772	114200	Г-102
301773	114201	Г-102
301774	114202	Г-102
301775	114203	Г-102
301776	114204	Г-102
301777	114205	Г-102
301778	114206	Г-102
301779	114207	Г-102
301780	114208	Г-102
301781	114209	Г-102
301782	114210	А-173
301783	114211	А-173
301784	114212	А-173
301785	114213	А-173
301786	114214	А-173
301787	114215	А-173
301788	114216	А-173
301789	114217	А-173
301790	114218	А-173
301791	114219	А-173
301792	114220	А-173
301793	114221	А-173
301794	114222	А-173
301795	114223	А-173
301796	114224	А-173
301797	114225	А-173
301798	114226	А-328
301799	114227	А-328
301800	114228	А-328
301801	114229	А-328
301802	114230	А-328
301803	114231	А-328
301804	114232	А-328
301805	114233	А-328
301806	114234	А-328
301807	114235	А-328
301808	114236	А-328
301809	114237	А-328
301810	114238	А-328
301811	114239	А-328
301812	114240	А-328
301813	114241	А-328
301814	114242	И-315\nИ-317
301815	114243	И-315\nИ-317
301816	114244	И-315\nИ-317
301817	114245	И-315\nИ-317
301818	114246	И-315\nИ-317
301819	114247	И-315\nИ-317
301820	114248	И-315\nИ-317
301821	114249	И-315\nИ-317
301822	114250	И-315\nИ-317
301823	114251	И-315\nИ-317
301824	114252	И-315\nИ-317
301825	114253	И-315\nИ-317
301826	114254	И-315\nИ-317
301827	114255	И-315\nИ-317
301828	114256	И-315\nИ-317
301829	114257	И-315\nИ-317
301830	114258	А-328
301831	114259	А-328
301832	114260	А-328
301833	114261	А-328
301834	114262	А-328
301835	114263	А-328
301836	114264	А-328
301837	114265	А-328
301838	114266	А-328
301839	114267	А-328
301840	114268	А-328
301841	114269	А-328
301842	114270	А-328
301843	114271	А-328
301844	114272	А-328
301845	114273	А-328
301846	114274	Б-209-2
301847	114275	Б-209-2
301848	114276	Б-209-2
301849	114277	Б-209-2
301850	114278	Б-209-2
301851	114279	Б-209-2
301852	114280	Б-209-2
301853	114281	Б-209-2
301854	114282	Б-209-2
301855	114283	Б-209-2
301856	114284	Б-209-2
301857	114285	Б-209-2
301858	114286	Б-209-2
301859	114287	Б-209-2
301860	114288	Б-209-2
301861	114289	Б-209-2
301862	114290	Б-209-2
301863	114291	Б-209-2
301864	114292	Б-209-2
301865	114293	Б-209-2
301866	114294	Б-209-2
301867	114295	Б-209-2
301868	114296	Б-209-2
301869	114297	Б-209-2
301870	114298	Б-209-2
301871	114299	Б-209-2
301872	114300	Б-209-2
301873	114301	Б-209-2
301874	114302	Б-209-2
301875	114303	Б-209-2
301876	114304	Б-209-2
301877	114305	Б-209-2
301878	114306	А-13
301879	114307	А-13
301880	114308	А-13
301881	114309	А-13
301882	114310	А-13
301883	114311	А-13
301884	114312	А-13
301885	114313	А-13
301886	114314	А-13
301887	114315	А-13
301888	114316	А-13
301889	114317	А-13
301890	114318	А-13
301891	114319	А-13
301892	114320	А-13
301893	114321	А-13
301894	114322	А-215
301895	114323	А-215
301896	114324	А-215
301897	114325	А-215
301898	114326	А-215
301899	114327	А-215
301900	114328	А-215
301901	114329	А-215
301902	114330	А-215
301903	114331	А-215
301904	114332	А-215
301905	114333	А-215
301906	114334	А-215
301907	114335	А-215
301908	114336	А-215
301909	114337	А-215
301910	114338	А-107
301911	114339	А-107
301912	114340	А-107
301913	114341	А-107
301914	114342	А-107
301915	114343	А-107
301916	114344	А-107
301917	114345	А-107
301918	114346	А-107
301919	114347	А-107
301920	114348	А-107
301921	114349	А-107
301922	114350	А-107
301923	114351	А-107
301924	114352	А-107
301925	114353	А-107
301926	114354	А-217
301927	114355	А-217
301928	114356	А-217
301929	114357	А-217
301930	114358	А-217
301931	114359	А-217
301932	114360	А-217
301933	114361	А-217
301934	114362	А-217
301935	114363	А-217
301936	114364	А-217
301937	114365	А-217
301938	114366	А-217
301939	114367	А-217
301940	114368	А-217
301941	114369	А-217
301942	114370	А-213-м
301943	114371	А-213-м
301944	114372	А-213-м
301945	114373	А-213-м
301946	114374	А-213-м
301947	114375	А-213-м
301948	114376	А-213-м
301949	114377	А-213-м
301950	114378	А-13
301951	114379	А-13
301952	114380	А-13
301953	114381	А-13
301954	114382	А-13
301955	114383	А-13
301956	114384	А-13
301957	114385	А-13
301958	114386	А-13
301959	114387	А-13
301960	114388	А-13
301961	114389	А-13
301962	114390	А-13
301963	114391	А-13
301964	114392	А-13
301965	114393	А-13
301966	114394	А-13
301967	114395	А-13
301968	114396	А-13
301969	114397	А-13
301970	114398	А-13
301971	114399	А-13
301972	114400	А-13
301973	114401	А-13
301974	114402	А-215
301975	114403	А-215
301976	114404	А-215
301977	114405	А-215
301978	114406	А-215
301979	114407	А-215
301980	114408	А-215
301981	114409	А-215
301982	114410	А-215
301983	114411	А-215
301984	114412	А-215
301985	114413	А-215
301986	114414	А-215
301987	114415	А-215
301988	114416	А-215
301989	114417	А-215
301990	114418	А-182
301991	114419	А-182
301992	114420	А-182
301993	114421	А-182
301994	114422	А-182
301995	114423	А-182
301996	114424	А-182
301997	114425	А-182
301998	114426	Б-209-2
301999	114427	Б-209-2
302000	114428	Б-209-2
302001	114429	Б-209-2
302002	114430	Б-209-2
302003	114431	Б-209-2
302004	114432	Б-209-2
302005	114433	Б-209-2
302006	114434	ФОК
302007	114435	ФОК
302008	114436	ФОК
302009	114437	ФОК
302010	114438	ФОК
302011	114439	ФОК
302012	114440	ФОК
302013	114441	ФОК
302014	114442	ФОК
302015	114443	ФОК
302016	114444	ФОК
302017	114445	ФОК
302018	114446	ФОК
302019	114447	ФОК
302020	114448	ФОК
302021	114449	ФОК
302022	114450	???
302023	114451	???
302024	114452	???
302025	114453	???
302026	114454	???
302027	114455	???
302028	114456	???
302029	114457	???
302030	114458	???
302031	114459	???
302032	114460	???
302033	114461	???
302034	114462	???
302035	114463	???
302036	114464	???
302037	114465	???
302038	114466	А-13
302039	114467	А-13
302040	114468	А-13
302041	114469	А-13
302042	114470	А-13
302043	114471	А-13
302044	114472	А-13
302045	114473	А-13
302046	114474	А-13
302047	114475	А-13
302048	114476	А-13
302049	114477	А-13
302050	114478	А-13
302051	114479	А-13
302052	114480	А-13
302053	114481	А-13
302054	114482	А-13
302055	114483	А-13
302056	114484	А-13
302057	114485	А-13
302058	114486	А-13
302059	114487	А-13
302060	114488	А-13
302061	114489	А-13
302062	114490	А-13
302063	114491	А-13
302064	114492	А-13
302065	114493	А-13
302066	114494	А-13
302067	114495	А-13
302068	114496	А-13
302069	114497	А-13
302070	114498	А-13
302071	114499	А-13
302072	114500	А-13
302073	114501	А-13
302074	114502	А-13
302075	114503	А-13
302076	114504	А-13
302077	114505	А-13
302078	114506	Б-209
302079	114507	Б-209
302080	114508	Б-209
302081	114509	Б-209
302082	114510	Б-209
302083	114511	Б-209
302084	114512	Б-209
302085	114513	Б-209
302086	114514	Б-209
302087	114515	Б-209
302088	114516	Б-209
302089	114517	Б-209
302090	114518	Б-209
302091	114519	Б-209
302092	114520	Б-209
302093	114521	Б-209
302094	114522	А-61\n(МП-1)
302095	114523	А-61\n(МП-1)
302096	114524	А-61\n(МП-1)
302097	114525	А-61\n(МП-1)
302098	114526	А-61\n(МП-1)
302099	114527	А-61\n(МП-1)
302100	114528	А-61\n(МП-1)
302101	114529	А-61\n(МП-1)
302102	114530	А-231\n(МП-1)
302103	114531	А-231\n(МП-1)
302104	114532	А-231\n(МП-1)
302105	114533	А-231\n(МП-1)
302106	114534	А-231\n(МП-1)
302107	114535	А-231\n(МП-1)
302108	114536	А-231\n(МП-1)
302109	114537	А-231\n(МП-1)
302110	114538	А-175
302111	114539	А-175
302112	114540	А-175
302113	114541	А-175
302114	114542	А-175
302115	114543	А-175
302116	114544	А-175
302117	114545	А-175
302118	114546	Б-209-1
302119	114547	Б-209-1
302120	114548	Б-209-1
302121	114549	Б-209-1
302122	114550	Б-209-1
302123	114551	Б-209-1
302124	114552	Б-209-1
302125	114553	Б-209-1
302126	114554	И-201
302127	114555	И-201
302128	114556	И-201
302129	114557	И-201
302130	114558	И-201
302131	114559	И-201
302132	114560	И-201
302133	114561	И-201
302134	114562	Б-209-2
302135	114563	Б-209-2
302136	114564	Б-209-2
302137	114565	Б-209-2
302138	114566	Б-209-2
302139	114567	Б-209-2
302140	114568	Б-209-2
302141	114569	Б-209-2
302142	114570	Б-209-2
302143	114571	Б-209-2
302144	114572	Б-209-2
302145	114573	Б-209-2
302146	114574	Б-209-2
302147	114575	Б-209-2
302148	114576	Б-209-2
302149	114577	Б-209-2
302150	114578	А-107
302151	114579	А-107
302152	114580	А-107
302153	114581	А-107
302154	114582	А-107
302155	114583	А-107
302156	114584	А-107
302157	114585	А-107
302158	114586	А-107
302159	114587	А-107
302160	114588	А-107
302161	114589	А-107
302162	114590	А-107
302163	114591	А-107
302164	114592	А-107
302165	114593	А-107
302166	114594	Г-102
302167	114595	Г-102
302168	114596	Г-102
302169	114597	Г-102
302170	114598	Г-102
302171	114599	Г-102
302172	114600	Г-102
302173	114601	Г-102
302174	114602	Г-102
302175	114603	Г-102
302176	114604	Г-102
302177	114605	Г-102
302178	114606	Г-102
302179	114607	Г-102
302180	114608	Г-102
302181	114609	Г-102
302182	114610	И-201
302183	114611	И-201
302184	114612	И-201
302185	114613	И-201
302186	114614	И-201
302187	114615	И-201
302188	114616	И-201
302189	114617	И-201
302190	114618	А-13
302191	114619	А-13
302192	114620	А-13
302193	114621	А-13
302194	114622	А-13
302195	114623	А-13
302196	114624	А-13
302197	114625	А-13
302198	114626	И-313
302199	114627	И-313
302200	114628	И-313
302201	114629	И-313
302202	114630	И-313
302203	114631	И-313
302204	114632	И-313
302205	114633	И-313
302206	114634	И-313
302207	114635	И-313
302208	114636	И-313
302209	114637	И-313
302210	114638	И-313
302211	114639	И-313
302212	114640	И-313
302213	114641	И-313
302214	114642	А-213-м
302215	114643	А-213-м
302216	114644	А-213-м
302217	114645	А-213-м
302218	114646	А-213-м
302219	114647	А-213-м
302220	114648	А-213-м
302221	114649	А-213-м
302222	114650	Б-209-2
302223	114651	Б-209-2
302224	114652	Б-209-2
302225	114653	Б-209-2
302226	114654	Б-209-2
302227	114655	Б-209-2
302228	114656	Б-209-2
302229	114657	Б-209-2
302230	114658	ФОК
302231	114659	ФОК
302232	114660	ФОК
302233	114661	ФОК
302234	114662	ФОК
302235	114663	ФОК
302236	114664	ФОК
302237	114665	ФОК
302238	114666	ФОК
302239	114667	ФОК
302240	114668	ФОК
302241	114669	ФОК
302242	114670	ФОК
302243	114671	ФОК
302244	114672	ФОК
302245	114673	ФОК
302246	114674	А-215
302247	114675	А-215
302248	114676	А-215
302249	114677	А-215
302250	114678	А-215
302251	114679	А-215
302252	114680	А-215
302253	114681	А-215
302254	114682	А-215
302255	114683	А-215
302256	114684	А-215
302257	114685	А-215
302258	114686	А-215
302259	114687	А-215
302260	114688	А-215
302261	114689	А-215
302262	114690	А-13
302263	114691	А-13
302264	114692	А-13
302265	114693	А-13
302266	114694	А-13
302267	114695	А-13
302268	114696	А-13
302269	114697	А-13
302270	114698	А-61\n(МП-1)
302271	114699	А-61\n(МП-1)
302272	114700	А-61\n(МП-1)
302273	114701	А-61\n(МП-1)
302274	114702	А-61\n(МП-1)
302275	114703	А-61\n(МП-1)
302276	114704	А-61\n(МП-1)
302277	114705	А-61\n(МП-1)
302278	114706	А-350\n(МП-1)
302279	114707	А-350\n(МП-1)
302280	114708	А-350\n(МП-1)
302281	114709	А-350\n(МП-1)
302282	114710	А-350\n(МП-1)
302283	114711	А-350\n(МП-1)
302284	114712	А-350\n(МП-1)
302285	114713	А-350\n(МП-1)
302286	114714	А-107
302287	114715	А-107
302288	114716	А-107
302289	114717	А-107
302290	114718	А-107
302291	114719	А-107
302292	114720	А-107
302293	114721	А-107
302294	114722	А-107
302295	114723	А-107
302296	114724	А-107
302297	114725	А-107
302298	114726	А-107
302299	114727	А-107
302300	114728	А-107
302301	114729	А-107
302302	114730	Б-209-2
302303	114731	Б-209-2
302304	114732	Б-209-2
302305	114733	Б-209-2
302306	114734	Б-209-2
302307	114735	Б-209-2
302308	114736	Б-209-2
302309	114737	Б-209-2
302310	114738	Б-209-2
302311	114739	Б-209-2
302312	114740	Б-209-2
302313	114741	Б-209-2
302314	114742	Б-209-2
302315	114743	Б-209-2
302316	114744	Б-209-2
302317	114745	Б-209-2
302318	114746	Б-209-1
302319	114747	Б-209-1
302320	114748	Б-209-1
302321	114749	Б-209-1
302322	114750	Б-209-1
302323	114751	Б-209-1
302324	114752	Б-209-1
302325	114753	Б-209-1
302326	114818	Д-208
302327	114819	Д-208
302328	114820	Д-208
302329	114821	Д-208
302330	114822	Д-208
302331	114823	Д-208
302332	114824	Д-208
302333	114825	Д-208
302334	114826	ИВЦ-116
302335	114827	ИВЦ-116
302336	114828	ИВЦ-116
302337	114829	ИВЦ-116
302338	114830	ИВЦ-116
302339	114831	ИВЦ-116
302340	114832	ИВЦ-116
302341	114833	ИВЦ-116
302342	114834	ИВЦ-116
302343	114835	ИВЦ-116
302344	114836	ИВЦ-116
302345	114837	ИВЦ-116
302346	114838	ИВЦ-116
302347	114839	ИВЦ-116
302348	114840	ИВЦ-116
302349	114841	ИВЦ-116
302350	114842	Б-209-2
302351	114843	Б-209-2
302352	114844	Б-209-2
302353	114845	Б-209-2
302354	114846	Б-209-2
302355	114847	Б-209-2
302356	114848	Б-209-2
302357	114849	Б-209-2
302358	114850	Б-209-1
302359	114851	Б-209-1
302360	114852	Б-209-1
302361	114853	Б-209-1
302362	114854	Б-209-1
302363	114855	Б-209-1
302364	114856	Б-209-1
302365	114857	Б-209-1
302366	114858	ИВЦ-116
302367	114859	ИВЦ-116
302368	114860	ИВЦ-116
302369	114861	ИВЦ-116
302370	114862	ИВЦ-116
302371	114863	ИВЦ-116
302372	114864	ИВЦ-116
302373	114865	ИВЦ-116
302374	114866	Б-209
302375	114867	Б-209
302376	114868	Б-209
302377	114869	Б-209
302378	114870	Б-209
302379	114871	Б-209
302380	114872	Б-209
302381	114873	Б-209
302382	114874	Б-209
302383	114875	Б-209
302384	114876	Б-209
302385	114877	Б-209
302386	114878	Б-209
302387	114879	Б-209
302388	114880	Б-209
302389	114881	Б-209
302390	114882	Б-209
302391	114883	Б-209
302392	114884	Б-209
302393	114885	Б-209
302394	114886	Б-209
302395	114887	Б-209
302396	114888	Б-209
302397	114889	Б-209
302398	114890	Б-209
302399	114891	Б-209
302400	114892	Б-209
302401	114893	Б-209
302402	114894	Б-209
302403	114895	Б-209
302404	114896	Б-209
302405	114897	Б-209
302406	114898	Б-209
302407	114899	Б-209
302408	114900	Б-209
302409	114901	Б-209
302410	114902	Б-209
302411	114903	Б-209
302412	114904	Б-209
302413	114905	Б-209
302414	114906	Б-209
302415	114907	Б-209
302416	114908	Б-209
302417	114909	Б-209
302418	114910	Б-209
302419	114911	Б-209
302420	114912	Б-209
302421	114913	Б-209
302422	114914	Д-208
302423	114915	Д-208
302424	114916	Д-208
302425	114917	Д-208
302426	114918	Д-208
302427	114919	Д-208
302428	114920	Д-208
302429	114921	Д-208
302430	114922	Д-208
302431	114923	Д-208
302432	114924	Д-208
302433	114925	Д-208
302434	114926	Д-208
302435	114927	Д-208
302436	114928	Д-208
302437	114929	Д-208
302438	114930	А-329
302439	114931	А-329
302440	114932	А-329
302441	114933	А-329
302442	114934	А-329
302443	114935	А-329
302444	114936	А-329
302445	114937	А-329
302446	114938	А-329
302447	114939	А-329
302448	114940	А-329
302449	114941	А-329
302450	114942	А-329
302451	114943	А-329
302452	114944	А-329
302453	114945	А-329
302454	114946	Д-208
302455	114947	Д-208
302456	114948	Д-208
302457	114949	Д-208
302458	114950	Д-208
302459	114951	Д-208
302460	114952	Д-208
302461	114953	Д-208
302462	114954	Д-208
302463	114955	Д-208
302464	114956	Д-208
302465	114957	Д-208
302466	114958	Д-208
302467	114959	Д-208
302468	114960	Д-208
302469	114961	Д-208
302470	115026	А-15
302471	115027	А-15
302472	115028	А-15
302473	115029	А-15
302474	115030	А-15
302475	115031	А-15
302476	115032	А-15
302477	115033	А-15
302478	115034	А-11
302479	115035	А-11
302480	115036	А-11
302481	115037	А-11
302482	115038	А-11
302483	115039	А-11
302484	115040	А-11
302485	115041	А-11
302486	115042	А-11
302487	115043	А-11
302488	115044	А-11
302489	115045	А-11
302490	115046	А-11
302491	115047	А-11
302492	115048	А-11
302493	115049	А-11
302494	115050	А-11
302495	115051	А-11
302496	115052	А-11
302497	115053	А-11
302498	115054	А-11
302499	115055	А-11
302500	115056	А-11
302501	115057	А-11
302502	115058	А-11
302503	115059	А-11
302504	115060	А-11
302505	115061	А-11
302506	115062	А-11
302507	115063	А-11
302508	115064	А-11
302509	115065	А-11
302510	115066	А-107
302511	115067	А-107
302512	115068	А-107
302513	115069	А-107
302514	115070	А-107
302515	115071	А-107
302516	115072	А-107
302517	115073	А-107
302518	115074	А-107
302519	115075	А-107
302520	115076	А-107
302521	115077	А-107
302522	115078	А-107
302523	115079	А-107
302524	115080	А-107
302525	115081	А-107
302526	115082	Г-213
302527	115083	Г-213
302528	115084	Г-213
302529	115085	Г-213
302530	115086	Г-213
302531	115087	Г-213
302532	115088	Г-213
302533	115089	Г-213
302534	115090	Г-213
302535	115091	Г-213
302536	115092	Г-213
302537	115093	Г-213
302538	115094	Г-213
302539	115095	Г-213
302540	115096	Г-213
302541	115097	Г-213
302542	115098	А-217
302543	115099	А-217
302544	115100	А-217
302545	115101	А-217
302546	115102	А-217
302547	115103	А-217
302548	115104	А-217
302549	115105	А-217
302550	115106	А-217
302551	115107	А-217
302552	115108	А-217
302553	115109	А-217
302554	115110	А-217
302555	115111	А-217
302556	115112	А-217
302557	115113	А-217
302558	115114	А-1
302559	115115	А-1
302560	115116	А-1
302561	115117	А-1
302562	115118	А-1
302563	115119	А-1
302564	115120	А-1
302565	115121	А-1
302566	115122	Б-209
302567	115123	Б-209
302568	115124	Б-209
302569	115125	Б-209
302570	115126	Б-209
302571	115127	Б-209
302572	115128	Б-209
302573	115129	Б-209
302574	115194	Б-209-2
302575	115195	Б-209-2
302576	115196	Б-209-2
302577	115197	Б-209-2
302578	115198	Б-209-2
302579	115199	Б-209-2
302580	115200	Б-209-2
302581	115201	Б-209-2
302582	115202	А-222
302583	115203	А-222
302584	115204	А-222
302585	115205	А-222
302586	115206	А-222
302587	115207	А-222
302588	115208	А-222
302589	115209	А-222
302590	115210	А-222
302591	115211	А-222
302592	115212	А-222
302593	115213	А-222
302594	115214	А-222
302595	115215	А-222
302596	115216	А-222
302597	115217	А-222
302598	115282	Г-213
302599	115283	Г-213
302600	115284	Г-213
302601	115285	Г-213
302602	115286	Г-213
302603	115287	Г-213
302604	115288	Г-213
302605	115289	Г-213
302606	115290	Г-213
302607	115291	Г-213
302608	115292	Г-213
302609	115293	Г-213
302610	115294	Г-213
302611	115295	Г-213
302612	115296	Г-213
302613	115297	Г-213
302614	115298	А-217
302615	115299	А-217
302616	115300	А-217
302617	115301	А-217
302618	115302	А-217
302619	115303	А-217
302620	115304	А-217
302621	115305	А-217
302622	115306	А-217
302623	115307	А-217
302624	115308	А-217
302625	115309	А-217
302626	115310	А-217
302627	115311	А-217
302628	115312	А-217
302629	115313	А-217
302630	115314	А-107
302631	115315	А-107
302632	115316	А-107
302633	115317	А-107
302634	115318	А-107
302635	115319	А-107
302636	115320	А-107
302637	115321	А-107
302638	115322	А-107
302639	115323	А-107
302640	115324	А-107
302641	115325	А-107
302642	115326	А-107
302643	115327	А-107
302644	115328	А-107
302645	115329	А-107
302646	115330	База
302647	115331	База
302648	115332	База
302649	115333	База
302650	115334	Б-209
302651	115335	Б-209
302652	115336	Б-209
302653	115337	Б-209
302654	115338	Б-209
302655	115339	Б-209
302656	115340	Б-209
302657	115341	Б-209
302658	115342	Б-209
302659	115343	Б-209
302660	115344	Б-209
302661	115345	Б-209
302662	115346	Б-209
302663	115347	Б-209
302664	115348	Б-209
302665	115349	Б-209
302666	115350	Б-209
302667	115351	Б-209
302668	115352	Б-209
302669	115353	Б-209
302670	115354	Б-209
302671	115355	Б-209
302672	115356	Б-209
302673	115357	Б-209
302674	115358	Б-209
302675	115359	Б-209
302676	115360	Б-209
302677	115361	Б-209
302678	115362	Б-209
302679	115363	Б-209
302680	115364	Б-209
302681	115365	Б-209
302682	115430	Б-209
302683	115431	Б-209
302684	115432	Б-209
302685	115433	Б-209
302686	115434	Б-209
302687	115435	Б-209
302688	115436	Б-209
302689	115437	Б-209
302690	115438	Б-209
302691	115439	Б-209
302692	115440	Б-209
302693	115441	Б-209
302694	115442	Б-209
302695	115443	Б-209
302696	115444	Б-209
302697	115445	Б-209
302698	115446	Б-209
302699	115447	Б-209
302700	115448	Б-209
302701	115449	Б-209
302702	115450	Б-209
302703	115451	Б-209
302704	115452	Б-209
302705	115453	Б-209
302706	115454	Б-209
302707	115455	Б-209
302708	115456	Б-209
302709	115457	Б-209
302710	115458	Б-209
302711	115459	Б-209
302712	115460	Б-209
302713	115461	Б-209
302714	115462	А-316
302715	115463	А-316
302716	115464	А-316
302717	115465	А-316
302718	115466	А-316
302719	115467	А-316
302720	115468	А-316
302721	115469	А-316
302722	115470	А-316
302723	115471	А-316
302724	115472	А-316
302725	115473	А-316
302726	115474	А-316
302727	115475	А-316
302728	115476	А-316
302729	115477	А-316
302730	115782	Б-209-1
302731	115783	Б-209-1
302732	115784	Б-209-1
302733	115785	Б-209-1
302734	115786	Б-209-1
302735	115787	Б-209-1
302736	115788	Б-209-1
302737	115789	Б-209-1
302738	115790	Б-209-1
302739	115791	Б-209-1
302740	115792	Б-209-1
302741	115793	Б-209-1
302742	115794	Б-209-1
302743	115795	Б-209-1
302744	115796	Б-209-1
302745	115797	Б-209-1
302746	115798	Б-209-1
302747	115799	Б-209-1
302748	115800	Б-209-1
302749	115801	Б-209-1
302750	115802	Б-209-1
302751	115803	Б-209-1
302752	115804	Б-209-1
302753	115805	Б-209-1
302754	115806	Б-209-1
302755	115807	Б-209-1
302756	115808	Б-209-1
302757	115809	Б-209-1
302758	115810	Б-209-1
302759	115811	Б-209-1
302760	115812	Б-209-1
302761	115813	Б-209-1
302762	115814	Б-209-2
302763	115815	Б-209-2
302764	115816	Б-209-2
302765	115817	Б-209-2
302766	115818	Б-209-2
302767	115819	Б-209-2
302768	115820	Б-209-2
302769	115821	Б-209-2
302770	115822	Б-209-2
302771	115823	Б-209-2
302772	115824	Б-209-2
302773	115825	Б-209-2
302774	115826	Б-209-2
302775	115827	Б-209-2
302776	115828	Б-209-2
302777	115829	Б-209-2
302778	115830	База
302779	115831	База
302780	115832	База
302781	115833	База
302782	115834	База
302783	115835	База
302784	115836	База
302785	115837	База
302786	115838	База
302787	115839	База
302788	115840	База
302789	115841	База
302790	115842	База
302791	115843	База
302792	115844	База
302793	115845	???
302794	115846	???
302795	115847	???
302796	115848	???
302797	115849	???
302798	115850	???
302799	115851	???
302800	115852	???
302801	115853	???
302802	115854	???
302803	115855	???
302804	115856	???
302805	115857	???
302806	115858	???
302807	115859	???
302808	115860	???
302809	115861	Б-209-2
302810	115862	Б-209-2
302811	115863	Б-209-2
302812	115864	Б-209-2
302813	115865	Б-209-2
302814	115866	Б-209-2
302815	115867	Б-209-2
302816	115868	Б-209-2
302817	115869	Б-209-2
302818	115870	Б-209-2
302819	115871	Б-209-2
302820	115872	Б-209-2
302821	115873	Б-209-2
302822	115874	Б-209-2
302823	115875	Б-209-2
302824	115876	Б-209-2
302825	115877	Б-209-1
302826	115878	Б-209-1
302827	115879	Б-209-1
302828	115880	Б-209-1
302829	115881	Б-209-1
302830	115882	Б-209-1
302831	115883	Б-209-1
302832	115884	Б-209-1
302833	115885	Б-209-1
302834	115886	Б-209-1
302835	115887	Б-209-1
302836	115888	Б-209-1
302837	115889	Б-209-1
302838	115890	Б-209-1
302839	115891	Б-209-1
302840	115892	Б-209-1
302841	116117	А-215
302842	116118	А-215
302843	116119	А-215
302844	116120	А-215
302845	116121	А-215
302846	116122	А-215
302847	116123	А-215
302848	116124	А-215
\.


--
-- TOC entry 4935 (class 0 OID 142596)
-- Dependencies: 234
-- Data for Name: sc_rasp7; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp7 (id, semcode, version, disc_id, weekday, pair, weeksarray, weekstext) FROM stdin;
4221	242500	13	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4222	242500	13	1	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4223	242500	13	2	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4224	242500	13	3	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4225	242500	13	4	1	5	{2,4,6,8,10,12,14,16}	IIн
4226	242500	13	5	2	2	{2,4,6,8,10,12,14,16}	IIн
4227	242500	13	6	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4228	242500	13	6	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4229	242500	13	7	2	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4230	242500	13	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4231	242500	13	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4232	242500	13	8	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4233	242500	13	2	4	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4234	242500	13	3	4	2	{1,3,5,7,9,11,13,15}	Iн
4235	242500	13	9	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4236	242500	13	3	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4237	242500	13	10	5	1	{1,3,5,7,9,11,13,15}	Iн
4238	242500	13	6	5	1	{2,4,6,8,10,12,14,16}	IIн
4239	242500	13	10	5	2	{1,3,5,7,9,11,13,15}	Iн
4240	242500	13	11	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4241	242500	13	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4242	242500	13	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4243	242500	13	10	6	1	{1,3,5,7,9,11,13,15}	Iн
4244	242500	13	5	6	6	{1,3,5,7,9,11,13,15}	Iн
4245	242500	13	8	1	1	{2,4,6,8,10,12,14,16}	IIн
4246	242500	13	8	1	2	{2,4,6,8,10,12,14,16}	IIн
4247	242500	13	1	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4248	242500	13	0	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4249	242500	13	4	1	5	{2,4,6,8,10,12,14,16}	IIн
4250	242500	13	3	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4251	242500	13	5	2	3	{2,4,6,8,10,12,14,16}	IIн
4252	242500	13	11	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4253	242500	13	9	2	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4254	242500	13	7	2	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4255	242500	13	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4256	242500	13	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4257	242500	13	6	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4258	242500	13	6	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4259	242500	13	2	4	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4260	242500	13	3	4	2	{1,3,5,7,9,11,13,15}	Iн
4261	242500	13	3	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4262	242500	13	12	5	1	{1,3,5,7,9,11,13,15}	Iн
4263	242500	13	6	5	1	{2,4,6,8,10,12,14,16}	IIн
4264	242500	13	10	5	2	{2,4,6,8,10,12,14,16}	IIн
4265	242500	13	2	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4266	242500	13	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4267	242500	13	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4268	242500	13	12	6	2	{1,3,5,7,9,11,13,15}	Iн
4269	242500	13	5	6	6	{1,3,5,7,9,11,13,15}	Iн
4270	242500	13	5	1	2	{1,3,5,7,9,11,13,15}	Iн
4271	242500	13	8	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4272	242500	13	2	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4273	242500	13	4	1	5	{2,4,6,8,10,12,14,16}	IIн
4274	242500	13	3	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4275	242500	13	3	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4276	242500	13	11	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4277	242500	13	7	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4278	242500	13	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4279	242500	13	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4280	242500	13	6	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4281	242500	13	6	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4282	242500	13	9	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4283	242500	13	2	4	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4284	242500	13	3	4	2	{1,3,5,7,9,11,13,15}	Iн
4285	242500	13	12	5	1	{1,3,5,7,9,11,13,15}	Iн
4286	242500	13	6	5	1	{2,4,6,8,10,12,14,16}	IIн
4287	242500	13	13	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4288	242500	13	0	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4289	242500	13	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4290	242500	13	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4291	242500	13	10	6	2	{2,4,6,8,10,12,14,16}	IIн
4292	242500	13	10	6	3	{2,4,6,8,10,12,14,16}	IIн
4293	242500	13	5	6	6	{1,3,5,7,9,11,13,15}	Iн
4294	242500	13	5	1	1	{2,4,6,8,10,12,14,16}	IIн
4295	242500	13	2	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4296	242500	13	6	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4297	242500	13	6	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4298	242500	13	4	1	5	{2,4,6,8,10,12,14,16}	IIн
4299	242500	13	9	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4300	242500	13	11	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4301	242500	13	3	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4302	242500	13	3	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4303	242500	13	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4304	242500	13	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4305	242500	13	1	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4306	242500	13	7	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4307	242500	13	2	4	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4308	242500	13	3	4	2	{1,3,5,7,9,11,13,15}	Iн
4309	242500	13	10	5	1	{1,3,5,7,9,11,13,15}	Iн
4310	242500	13	6	5	1	{2,4,6,8,10,12,14,16}	IIн
4311	242500	13	0	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4312	242500	13	8	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4313	242500	13	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4314	242500	13	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4315	242500	13	10	6	4	{2,4,6,8,10,12,14,16}	IIн
4316	242500	13	10	6	5	{2,4,6,8,10,12,14,16}	IIн
4317	242500	13	5	6	6	{1,3,5,7,9,11,13,15}	Iн
4318	242500	13	14	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4319	242500	13	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4320	242500	13	14	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4321	242500	13	16	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4322	242500	13	7	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4323	242500	13	1	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4324	242500	13	7	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4325	242500	13	9	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4326	242500	13	17	2	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4327	242500	13	15	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4328	242500	13	8	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4329	242500	13	2	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4330	242500	13	18	4	1	{1,3,5,7,9,11,13,15}	Iн
4331	242500	13	18	4	1	{2,4,6,8,10,12,14,16}	IIн
4332	242500	13	2	4	2	{1,3,5,7,9,11,13,15}	Iн
4333	242500	13	17	4	2	{2,4,6,8,10,12,14,16}	IIн
4334	242500	13	1	5	1	{1,3,5,7,9,11,13,15}	Iн
4335	242500	13	19	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4336	242500	13	19	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4337	242500	13	16	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4338	242500	13	16	6	2	{1,3,5,7,9,11,13,15}	Iн
4339	242500	13	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4340	242500	13	14	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4341	242500	13	9	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4342	242500	13	20	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4343	242500	13	1	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4344	242500	13	17	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4345	242500	13	2	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4346	242500	13	21	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4347	242500	13	14	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4348	242500	13	18	3	5	{2,4,6,8,10,12,14,16}	IIн
4349	242500	13	18	4	1	{1,3,5,7,9,11,13,15}	Iн
4350	242500	13	2	4	2	{1,3,5,7,9,11,13,15}	Iн
4351	242500	13	17	4	2	{2,4,6,8,10,12,14,16}	IIн
4352	242500	13	20	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4353	242500	13	8	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4354	242500	13	16	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4355	242500	13	1	5	2	{1,3,5,7,9,11,13,15}	Iн
4356	242500	13	19	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4357	242500	13	15	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4358	242500	13	16	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4359	242500	13	16	6	2	{1,3,5,7,9,11,13,15}	Iн
4360	242500	13	22	1	1	{2}	2н
4361	242500	13	22	1	2	{2}	2н
4362	242500	13	22	1	3	{2}	2н
4363	242500	13	22	1	4	{2}	2н
4364	242500	13	23	1	6	{1,3,5,7,9,11,13,15}	Iн
4365	242500	13	24	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4366	242500	13	24	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4367	242500	13	25	3	1	{2,4,6,8,10,12,14,16}	IIн
4368	242500	13	26	3	2	{1,3,5,7,9,11,13,15}	Iн
4369	242500	13	26	3	2	{2,4,6,8,10,12,14,16}	IIн
4370	242500	13	26	3	3	{1,3,5,7,9,11,13,15}	Iн
4371	242500	13	26	3	3	{2,4,6,8,10,12,14,16}	IIн
4372	242500	13	27	3	4	{1,3,5,7,9,11,13,15}	Iн
4373	242500	13	27	3	5	{1,3,5,7,9,11,13,15}	Iн
4374	242500	13	25	3	6	{1,3,5,7,9,11,13,15}	Iн
4375	242500	13	28	4	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4376	242500	13	29	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4377	242500	13	28	4	4	{1,3,5,7,9,11,13,15}	Iн
4378	242500	13	30	5	1	{1,3,5,7,9,11,13,15}	Iн
4379	242500	13	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4380	242500	13	25	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4381	242500	13	30	6	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4382	242500	13	31	6	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4383	242500	13	32	1	1	{3}	3н
4384	242500	13	32	1	2	{3}	3н
4385	242500	13	32	1	3	{3}	3н
4386	242500	13	32	1	4	{3}	3н
4387	242500	13	23	1	6	{1,3,5,7,9,11,13,15}	Iн
4388	242500	13	24	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4389	242500	13	25	3	1	{2,4,6,8,10,12,14,16}	IIн
4390	242500	13	26	3	2	{1,3,5,7,9,11,13,15}	Iн
4391	242500	13	26	3	2	{2,4,6,8,10,12,14,16}	IIн
4392	242500	13	26	3	3	{1,3,5,7,9,11,13,15}	Iн
4393	242500	13	26	3	3	{2,4,6,8,10,12,14,16}	IIн
4394	242500	13	27	3	4	{1,3,5,7,9,11,13,15}	Iн
4395	242500	13	27	3	5	{1,3,5,7,9,11,13,15}	Iн
4396	242500	13	25	3	6	{1,3,5,7,9,11,13,15}	Iн
4397	242500	13	28	4	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4398	242500	13	29	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4399	242500	13	28	4	4	{2,4,6,8,10,12,14,16}	IIн
4400	242500	13	30	5	1	{1,3,5,7,9,11,13,15}	Iн
4401	242500	13	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4402	242500	13	24	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4403	242500	13	25	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4404	242500	13	31	6	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4405	242500	13	30	6	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4406	242500	13	33	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4407	242500	13	33	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4408	242500	13	34	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4409	242500	13	35	1	4	{1,3,5,7,9,11,13,15}	Iн
4410	242500	13	35	1	4	{2,4,6,8,10,12,14,16}	IIн
4411	242500	13	36	1	5	{1,3,5,7,9,11,13,15}	Iн
4412	242500	13	36	1	5	{2,4,6,8,10,12,14,16}	IIн
4413	242500	13	37	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4414	242500	13	37	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4415	242500	13	37	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4416	242500	13	37	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4417	242500	13	38	3	2	{2,4,6,8,10,12,14,16}	IIн
4418	242500	13	38	3	3	{1,3,5,7,9,11,13,15}	Iн
4419	242500	13	38	3	3	{2,4,6,8,10,12,14,16}	IIн
4420	242500	13	39	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4421	242500	13	39	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4422	242500	13	35	3	6	{1,3,5,7,9,11,13,15}	Iн
4423	242500	13	40	4	1	{2,4,6,8,10,12,14,16}	IIн
4424	242500	13	40	4	2	{1,3,5,7,9,11,13,15}	Iн
4425	242500	13	40	4	2	{2,4,6,8,10,12,14,16}	IIн
4426	242500	13	41	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4427	242500	13	41	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4428	242500	13	40	4	5	{1,3,5,7,9,11,13,15}	Iн
4429	242500	13	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4430	242500	13	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4431	242500	13	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4432	242500	13	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4433	242500	13	43	6	3	{1,3,5,7,9,11,13,15}	Iн
4434	242500	13	44	6	3	{2,4,6,8,10,12,14,16}	IIн
4435	242500	13	44	6	4	{1,3,5,7,9,11,13,15}	Iн
4436	242500	13	45	6	4	{2,4,6,8,10,12,14,16}	IIн
4437	242500	13	33	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4438	242500	13	33	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4439	242500	13	34	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4440	242500	13	35	1	4	{1,3,5,7,9,11,13,15}	Iн
4441	242500	13	35	1	4	{2,4,6,8,10,12,14,16}	IIн
4442	242500	13	36	1	5	{1,3,5,7,9,11,13,15}	Iн
4443	242500	13	36	1	5	{2,4,6,8,10,12,14,16}	IIн
4444	242500	13	37	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4445	242500	13	37	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4446	242500	13	37	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4447	242500	13	37	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4448	242500	13	38	3	2	{2,4,6,8,10,12,14,16}	IIн
4449	242500	13	38	3	3	{1,3,5,7,9,11,13,15}	Iн
4450	242500	13	38	3	3	{2,4,6,8,10,12,14,16}	IIн
4451	242500	13	39	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4452	242500	13	39	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4453	242500	13	35	3	6	{1,3,5,7,9,11,13,15}	Iн
4454	242500	13	40	4	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4455	242500	13	40	4	2	{1,3,5,7,9,11,13,15}	Iн
4456	242500	13	40	4	2	{2,4,6,8,10,12,14,16}	IIн
4457	242500	13	41	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4458	242500	13	41	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4459	242500	13	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4460	242500	13	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4461	242500	13	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4462	242500	13	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4463	242500	13	43	6	3	{1,3,5,7,9,11,13,15}	Iн
4464	242500	13	44	6	3	{2,4,6,8,10,12,14,16}	IIн
4465	242500	13	44	6	4	{1,3,5,7,9,11,13,15}	Iн
4466	242500	13	45	6	4	{2,4,6,8,10,12,14,16}	IIн
4467	242500	13	46	1	4	{2,4,6,8,10,12,14,16}	IIн
4468	242500	13	47	1	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4469	242500	13	47	1	6	{3,5,7,9,11,13,15,17}	Iн
4470	242500	13	8	1	6	{2,4,6,8,10,12,14,16}	IIн
4471	242500	13	8	1	7	{2,4,6,8,10,12,14,16}	IIн
4472	242500	13	48	2	2	{3,5,7,9,11,13,15,17}	Iн
4473	242500	13	48	2	3	{3,5,7,9,11,13,15,17}	Iн
4474	242500	13	49	3	3	{3,5,7,9,11,13,15,17}	Iн
4475	242500	13	49	3	4	{3,5,7,9,11,13,15,17}	Iн
4476	242500	13	50	3	4	{2,4,6,8,10,12,14,16}	IIн
4477	242500	13	51	3	5	{3,5,7,9,11,13,15,17}	Iн
4478	242500	13	50	3	5	{2,4,6,8,10,12,14,16}	IIн
4479	242500	13	46	3	6	{3,5,7,9,11,13,15,17}	Iн
4480	242500	13	51	3	6	{2,4,6,8,10,12,14,16}	IIн
4481	242500	13	46	3	7	{3,5,7,9,11,13,15,17}	Iн
4482	242500	13	42	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4483	242500	13	42	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4484	242500	13	42	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4485	242500	13	42	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4486	242500	13	42	5	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4487	242500	13	42	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4488	242500	13	42	5	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4489	242500	13	42	5	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4490	242500	13	42	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4491	242500	13	42	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4492	242500	13	42	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4493	242500	13	52	1	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4494	242500	13	53	1	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4495	242500	13	54	2	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4496	242500	13	55	2	6	{2,4,6,8,10,12,14,16}	IIн
4497	242500	13	56	3	1	{3,5,7,9,11,13,15,17}	Iн
4498	242500	13	56	3	2	{3,5,7,9,11,13,15,17}	Iн
4499	242500	13	42	3	3	{3,5,7,9,11,13,15,17}	Iн
4500	242500	13	42	3	4	{3,5,7,9,11,13,15,17}	Iн
4501	242500	13	57	3	4	{2,4,6,8,10,12,14,16}	IIн
4502	242500	13	42	3	5	{3,5,7,9,11,13,15,17}	Iн
4503	242500	13	42	3	6	{3,5,7,9,11,13,15,17}	Iн
4504	242500	13	58	3	6	{2,4,6,8,10,12,14,16}	IIн
4505	242500	13	59	4	1	{3,5,7,9,11,13,15,17}	Iн
4506	242500	13	60	4	1	{2,4,6,8,10,12,14,16}	IIн
4507	242500	13	60	4	6	{2,6,10,14}	2,6,10,14н
4508	242500	13	60	4	7	{2,6,10,14}	2,6,10,14н
4509	242500	13	61	5	6	{4,8,12,16}	4,8,12,16н
4510	242500	13	61	5	7	{4,8,12,16}	4,8,12,16н
4511	242500	13	62	6	5	{3,5,7,9,11,13,15,17}	Iн
4512	242501	15	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4513	242501	15	88	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4514	242501	15	89	2	2	{1,3,5,7,9,11,13,15}	Iн
4515	242501	15	16	2	2	{2,4,6,8,10,12,14,16}	IIн
4516	242501	15	16	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4517	242501	15	9	2	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4518	242501	15	10	2	6	{1,3,5,7,9,11,13,15}	Iн
4519	242501	15	90	2	6	{2,4,6,8,10,12,14,16}	IIн
4520	242501	15	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4521	242501	15	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4522	242501	15	7	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4523	242501	15	10	3	5	{2,4,6,8,10,12,14,16}	IIн
4524	242501	15	91	4	2	{1,3,5,7,9,11,13,15}	Iн
4525	242501	15	92	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4526	242501	15	91	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4527	242501	15	92	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4528	242501	15	42	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4529	242501	15	1	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4530	242501	15	10	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4531	242501	15	21	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4532	242501	15	21	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4533	242501	15	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4534	242501	15	16	6	2	{1,3,5,7,9,11,13,15}	Iн
4535	242501	15	8	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4536	242501	15	8	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4537	242501	15	1	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4538	242501	15	2	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4539	242501	15	7	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4540	242501	15	21	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4541	242501	15	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4542	242501	15	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4543	242501	15	10	3	5	{2,4,6,8,10,12,14,16}	IIн
4544	242501	15	91	4	2	{1,3,5,7,9,11,13,15}	Iн
4545	242501	15	92	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4546	242501	15	16	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4547	242501	15	16	4	5	{1,3,5,7,9,11,13,15}	Iн
4548	242501	15	89	4	5	{2,4,6,8,10,12,14,16}	IIн
4549	242501	15	42	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4550	242501	15	10	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4551	242501	15	21	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4552	242501	15	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4553	242501	15	16	6	2	{1,3,5,7,9,11,13,15}	Iн
4554	242501	15	93	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4555	242501	15	93	1	2	{1,3,5,7,9,11,13,15}	Iн
4556	242501	15	94	1	2	{2,4,6,8,10,12,14,16}	IIн
4557	242501	15	10	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4558	242501	15	10	1	4	{1,3,5,7,9,11,13,15}	Iн
4559	242501	15	90	1	4	{2,4,6,8,10,12,14,16}	IIн
4560	242501	15	1	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4561	242501	15	21	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4562	242501	15	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4563	242501	15	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4564	242501	15	8	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4565	242501	15	8	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4566	242501	15	10	3	5	{2,4,6,8,10,12,14,16}	IIн
4567	242501	15	91	4	2	{1,3,5,7,9,11,13,15}	Iн
4568	242501	15	92	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4569	242501	15	9	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4570	242501	15	91	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4571	242501	15	42	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4572	242501	15	0	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4573	242501	15	2	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4574	242501	15	21	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4575	242501	15	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4576	242501	15	16	6	2	{1,3,5,7,9,11,13,15}	Iн
4577	242501	15	10	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4578	242501	15	10	1	2	{1,3,5,7,9,11,13,15}	Iн
4579	242501	15	90	1	2	{2,4,6,8,10,12,14,16}	IIн
4580	242501	15	7	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4581	242501	15	9	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4582	242501	15	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4583	242501	15	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4584	242501	15	21	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4585	242501	15	1	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4586	242501	15	10	3	5	{2,4,6,8,10,12,14,16}	IIн
4587	242501	15	91	4	2	{1,3,5,7,9,11,13,15}	Iн
4588	242501	15	92	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4589	242501	15	91	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4590	242501	15	42	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4591	242501	15	21	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4592	242501	15	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4593	242501	15	16	6	2	{1,3,5,7,9,11,13,15}	Iн
4594	242501	15	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4595	242501	15	95	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4596	242501	15	21	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4597	242501	15	96	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4598	242501	15	97	2	1	{1,3,5,7,9,11,13,15}	Iн
4599	242501	15	97	2	1	{2,4,6,8,10,12,14,16}	IIн
4600	242501	15	96	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4601	242501	15	96	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4602	242501	15	98	2	4	{1,3,5,7,9,11,13,15}	Iн
4603	242501	15	98	2	4	{2,4,6,8,10,12,14,16}	IIн
4604	242501	15	9	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4605	242501	15	8	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4606	242501	15	96	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4607	242501	15	21	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4608	242501	15	99	3	5	{2,4,6,8,10,12,14,16}	IIн
4609	242501	15	34	4	1	{2,4,6,8,10,12,14,16}	IIн
4610	242501	15	34	4	3	{2,4,6,8,10,12,14,16}	IIн
4611	242501	15	100	4	4	{1,3,5,7,9,11,13,15}	Iн
4612	242501	15	100	4	5	{1,3,5,7,9,11,13,15}	Iн
4613	242501	15	18	5	3	{1,3,5,7,9,11,13,15}	Iн
4614	242501	15	98	5	4	{1,3,5,7,9,11,13,15}	Iн
4615	242501	15	101	5	4	{2,4,6,8,10,12,14,16}	IIн
4616	242501	15	18	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4617	242501	15	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4618	242501	15	21	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4619	242501	15	96	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4620	242501	15	99	2	1	{1,3,5,7,9,11,13,15}	Iн
4621	242501	15	97	2	1	{2,4,6,8,10,12,14,16}	IIн
4622	242501	15	96	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4623	242501	15	8	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4624	242501	15	98	2	4	{1,3,5,7,9,11,13,15}	Iн
4625	242501	15	97	2	4	{2,4,6,8,10,12,14,16}	IIн
4626	242501	15	98	2	5	{1,3,5,7,9,11,13,15}	Iн
4627	242501	15	9	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4628	242501	15	95	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4629	242501	15	96	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4630	242501	15	21	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4631	242501	15	99	3	5	{2,4,6,8,10,12,14,16}	IIн
4632	242501	15	34	4	2	{2,4,6,8,10,12,14,16}	IIн
4633	242501	15	34	4	3	{2,4,6,8,10,12,14,16}	IIн
4634	242501	15	100	4	4	{1,3,5,7,9,11,13,15}	Iн
4635	242501	15	100	4	5	{1,3,5,7,9,11,13,15}	Iн
4636	242501	15	18	5	3	{1,3,5,7,9,11,13,15}	Iн
4637	242501	15	18	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4638	242501	15	98	5	5	{1,3,5,7,9,11,13,15}	Iн
4639	242501	15	22	1	1	{2}	2н
4640	242501	15	22	1	2	{2}	2н
4641	242501	15	22	1	3	{2}	2н
4642	242501	15	22	1	4	{2}	2н
4643	242501	15	102	2	1	{1,3,5,7,9,11,13,15}	Iн
4644	242501	15	26	2	2	{1,3,5,7,9,11,13,15}	Iн
4645	242501	15	26	2	2	{2,4,6,8,10,12,14,16}	IIн
4646	242501	15	26	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4647	242501	15	65	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4648	242501	15	65	2	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4649	242501	15	33	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4650	242501	15	27	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4651	242501	15	33	3	3	{1,3,5,7,9,11,13,15}	Iн
4652	242501	15	27	3	3	{2,4,6,8,10,12,14,16}	IIн
4653	242501	15	103	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4654	242501	15	103	3	5	{1,3,5,7,9,11,13,15}	Iн
4655	242501	15	65	3	5	{2,4,6,8,10,12,14,16}	IIн
4656	242501	15	42	4	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4657	242501	15	42	4	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4658	242501	15	42	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4659	242501	15	104	4	4	{1,3,5,7,9,11,13,15}	Iн
4660	242501	15	24	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4661	242501	15	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4662	242501	15	31	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4663	242501	15	24	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4664	242501	15	104	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4665	242501	15	102	6	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4666	242501	15	32	1	1	{3}	3н
4667	242501	15	32	1	2	{3}	3н
4668	242501	15	32	1	3	{3}	3н
4669	242501	15	32	1	4	{3}	3н
4670	242501	15	102	2	1	{2,4,6,8,10,12,14,16}	IIн
4671	242501	15	26	2	2	{1,3,5,7,9,11,13,15}	Iн
4672	242501	15	26	2	2	{2,4,6,8,10,12,14,16}	IIн
4673	242501	15	26	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4674	242501	15	65	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4675	242501	15	65	2	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4676	242501	15	27	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4677	242501	15	33	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4678	242501	15	33	3	3	{1,3,5,7,9,11,13,15}	Iн
4679	242501	15	27	3	3	{2,4,6,8,10,12,14,16}	IIн
4680	242501	15	103	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4681	242501	15	103	3	5	{1,3,5,7,9,11,13,15}	Iн
4682	242501	15	65	3	5	{2,4,6,8,10,12,14,16}	IIн
4683	242501	15	42	4	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4684	242501	15	42	4	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4685	242501	15	42	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4686	242501	15	104	4	4	{1,3,5,7,9,11,13,15}	Iн
4687	242501	15	24	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4688	242501	15	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4689	242501	15	24	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4690	242501	15	104	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4691	242501	15	102	6	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4692	242501	15	27	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4693	242501	15	105	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4694	242501	15	37	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4695	242501	15	37	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4696	242501	15	37	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4697	242501	15	37	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4698	242501	15	33	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4699	242501	15	33	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4700	242501	15	33	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4701	242501	15	105	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4702	242501	15	105	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4703	242501	15	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4704	242501	15	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4705	242501	15	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4706	242501	15	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4707	242501	15	27	6	2	{1,3,5,7,9,11,13,15}	Iн
4708	242501	15	27	6	3	{1,3,5,7,9,11,13,15}	Iн
4709	242501	15	33	6	4	{1,3,5,7,9,11,13,15}	Iн
4710	242501	15	33	6	5	{1,3,5,7,9,11,13,15}	Iн
4711	242501	15	27	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4712	242501	15	105	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4713	242501	15	37	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4714	242501	15	37	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4715	242501	15	37	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4716	242501	15	37	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4717	242501	15	105	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4718	242501	15	105	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4719	242501	15	33	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4720	242501	15	33	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4721	242501	15	33	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4722	242501	15	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4723	242501	15	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4724	242501	15	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4725	242501	15	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4726	242501	15	33	6	2	{1,3,5,7,9,11,13,15}	Iн
4727	242501	15	33	6	3	{1,3,5,7,9,11,13,15}	Iн
4728	242501	15	27	6	4	{1,3,5,7,9,11,13,15}	Iн
4729	242501	15	27	6	5	{1,3,5,7,9,11,13,15}	Iн
4730	242501	15	42	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4731	242501	15	42	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4732	242501	15	42	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4733	242501	15	42	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4734	242501	15	42	1	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4735	242501	15	42	1	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4736	242501	15	106	2	3	{3,5,7,9,11,13,15,17}	Iн
4737	242501	15	107	2	3	{2,4,6,8,10,12,14,16}	IIн
4738	242501	15	108	2	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4739	242501	15	109	3	4	{3,5,7,9,11,13,15,17}	Iн
4740	242501	15	108	3	4	{2,4,6,8,10,12,14,16}	IIн
4741	242501	15	109	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4742	242501	15	110	3	6	{3,5,7,9,11,13,15,17}	Iн
4743	242501	15	110	3	6	{2,4,6,8,10,12,14,16}	IIн
4744	242501	15	106	4	1	{3,5,7,9,11,13,15,17}	Iн
4745	242501	15	107	4	2	{3,5,7,9,11,13,15,17}	Iн
4746	242501	15	107	4	3	{3,5,7,9,11,13,15,17}	Iн
4747	242501	15	42	5	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4748	242501	15	42	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4749	242501	15	42	5	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4750	242501	15	42	5	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4751	242501	15	42	5	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4752	242501	15	42	5	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4753	242501	15	42	6	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4754	242501	15	42	6	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4755	242501	15	42	6	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4756	242501	15	42	6	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4757	242501	15	42	6	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4758	242501	15	42	6	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4759	242501	15	42	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4760	242501	15	42	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4761	242501	15	42	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4762	242501	15	42	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4763	242501	15	42	1	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4764	242501	15	42	1	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4765	242501	15	42	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4766	242501	15	42	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4767	242501	15	42	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4768	242501	15	42	2	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4769	242501	15	42	2	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4905	242501	0	98	5	4	{1,3,5,7,9,11,13,15}	Iн
4770	242501	15	42	2	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4771	242501	15	42	3	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4772	242501	15	42	3	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4773	242501	15	42	3	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4774	242501	15	42	3	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4775	242501	15	42	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4776	242501	15	42	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4777	242501	15	42	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4778	242501	15	42	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4779	242501	15	42	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4780	242501	15	42	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4781	242501	15	42	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4782	242501	15	42	4	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4783	242501	15	42	5	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4784	242501	15	42	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4785	242501	15	42	5	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4786	242501	15	42	5	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4787	242501	15	42	5	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4788	242501	15	42	5	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4789	242501	15	42	6	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4790	242501	15	42	6	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4791	242501	15	42	6	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4792	242501	15	42	6	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4793	242501	15	42	6	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4794	242501	15	42	6	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
4795	242501	0	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4796	242501	0	8	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4797	242501	0	16	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4798	242501	0	16	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4799	242501	0	9	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4800	242501	0	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4801	242501	0	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4802	242501	0	7	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4803	242501	0	10	3	5	{2,4,6,8,10,12,14,16}	IIн
4804	242501	0	91	4	2	{1,3,5,7,9,11,13,15}	Iн
4805	242501	0	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4806	242501	0	91	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4807	242501	0	2	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4808	242501	0	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4809	242501	0	1	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4810	242501	0	10	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4811	242501	0	11	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4812	242501	0	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4813	242501	0	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4814	242501	0	16	6	1	{1,3,5,7,9,11,13,15}	Iн
4815	242501	0	10	6	2	{1,3,5,7,9,11,13,15}	Iн
4816	242501	0	10	6	3	{1,3,5,7,9,11,13,15}	Iн
4817	242501	0	8	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4818	242501	0	8	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4819	242501	0	1	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4820	242501	0	2	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4821	242501	0	7	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4822	242501	0	21	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4823	242501	0	9	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4824	242501	0	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4825	242501	0	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4826	242501	0	91	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4827	242501	0	0	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4828	242501	0	10	3	5	{2,4,6,8,10,12,14,16}	IIн
4829	242501	0	91	4	2	{1,3,5,7,9,11,13,15}	Iн
4830	242501	0	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4831	242501	0	16	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4832	242501	0	16	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4833	242501	0	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4834	242501	0	10	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4835	242501	0	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4836	242501	0	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4837	242501	0	10	5	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4838	242501	0	16	6	1	{1,3,5,7,9,11,13,15}	Iн
4839	242501	0	16	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4840	242501	0	16	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4841	242501	0	10	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4842	242501	0	10	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4843	242501	0	1	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4844	242501	0	21	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4845	242501	0	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4846	242501	0	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4847	242501	0	8	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4848	242501	0	8	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4849	242501	0	7	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4850	242501	0	10	3	5	{2,4,6,8,10,12,14,16}	IIн
4851	242501	0	91	4	2	{1,3,5,7,9,11,13,15}	Iн
4852	242501	0	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4853	242501	0	9	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4854	242501	0	91	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4855	242501	0	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4906	242501	0	17	5	4	{2,4,6,8,10,12,14,16}	IIн
4856	242501	0	0	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4857	242501	0	2	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4858	242501	0	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4859	242501	0	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4860	242501	0	16	6	1	{1,3,5,7,9,11,13,15}	Iн
4861	242501	0	10	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4862	242501	0	10	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4863	242501	0	7	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4864	242501	0	9	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4865	242501	0	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4866	242501	0	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4867	242501	0	21	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4868	242501	0	1	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4869	242501	0	10	3	5	{2,4,6,8,10,12,14,16}	IIн
4870	242501	0	91	4	2	{1,3,5,7,9,11,13,15}	Iн
4871	242501	0	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4872	242501	0	2	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4873	242501	0	91	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4874	242501	0	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4875	242501	0	8	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4876	242501	0	8	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4877	242501	0	0	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4878	242501	0	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4879	242501	0	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4880	242501	0	16	6	1	{1,3,5,7,9,11,13,15}	Iн
4881	242501	0	16	6	2	{2,4,6,8,10,12,14,16}	IIн
4882	242501	0	16	6	3	{2,4,6,8,10,12,14,16}	IIн
4883	242501	0	16	6	4	{2,4,6,8,10,12,14,16}	IIн
4884	242501	0	16	6	5	{2,4,6,8,10,12,14,16}	IIн
4885	242501	0	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4886	242501	0	95	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4887	242501	0	21	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4888	242501	0	96	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4889	242501	0	97	2	1	{1,3,5,7,9,11,13,15}	Iн
4890	242501	0	97	2	1	{2,4,6,8,10,12,14,16}	IIн
4891	242501	0	96	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4892	242501	0	96	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4893	242501	0	98	2	4	{2,4,6,8,10,12,14,16}	IIн
4894	242501	0	98	2	5	{2,4,6,8,10,12,14,16}	IIн
4895	242501	0	9	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4896	242501	0	8	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4897	242501	0	96	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4898	242501	0	21	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4899	242501	0	17	3	5	{2,4,6,8,10,12,14,16}	IIн
4900	242501	0	112	4	2	{2,4,6,8,10,12,14,16}	IIн
4901	242501	0	112	4	3	{2,4,6,8,10,12,14,16}	IIн
4902	242501	0	100	4	4	{1,3,5,7,9,11,13,15}	Iн
4903	242501	0	100	4	5	{1,3,5,7,9,11,13,15}	Iн
4904	242501	0	18	5	3	{1,3,5,7,9,11,13,15}	Iн
4907	242501	0	18	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4908	242501	0	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4909	242501	0	21	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4910	242501	0	96	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4911	242501	0	17	2	1	{1,3,5,7,9,11,13,15}	Iн
4912	242501	0	97	2	1	{2,4,6,8,10,12,14,16}	IIн
4913	242501	0	96	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4914	242501	0	8	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4915	242501	0	97	2	4	{1,3,5,7,9,11,13,15}	Iн
4916	242501	0	98	2	4	{2,4,6,8,10,12,14,16}	IIн
4917	242501	0	98	2	5	{1,3,5,7,9,11,13,15}	Iн
4918	242501	0	9	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4919	242501	0	95	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4920	242501	0	96	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4921	242501	0	21	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4922	242501	0	17	3	5	{2,4,6,8,10,12,14,16}	IIн
4923	242501	0	112	4	2	{2,4,6,8,10,12,14,16}	IIн
4924	242501	0	112	4	3	{2,4,6,8,10,12,14,16}	IIн
4925	242501	0	100	4	4	{1,3,5,7,9,11,13,15}	Iн
4926	242501	0	100	4	5	{1,3,5,7,9,11,13,15}	Iн
4927	242501	0	113	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4928	242501	0	18	5	3	{1,3,5,7,9,11,13,15}	Iн
4929	242501	0	18	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4930	242501	0	98	5	5	{1,3,5,7,9,11,13,15}	Iн
4931	242501	0	37	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4932	242501	0	37	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4933	242501	0	37	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4934	242501	0	37	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4935	242501	0	26	2	2	{2,4,6,8,10,12,14,16}	IIн
4936	242501	0	65	2	3	{1,3,5,7,9,11,13,15}	Iн
4937	242501	0	26	2	3	{2,4,6,8,10,12,14,16}	IIн
4938	242501	0	102	2	4	{1,3,5,7,9,11,13,15}	Iн
4939	242501	0	114	2	5	{1,3,5,7,9,11,13,15}	Iн
4940	242501	0	65	2	5	{2,4,6,8,10,12,14,16}	IIн
4941	242501	0	26	2	6	{1,3,5,7,9,11,13,15}	Iн
4942	242501	0	65	2	6	{2,4,6,8,10,12,14,16}	IIн
4943	242501	0	33	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4944	242501	0	33	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4945	242501	0	27	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4946	242501	0	65	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4947	242501	0	103	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4948	242501	0	115	4	1	{2,4,6,8,10,12,14,16}	IIн
4949	242501	0	115	4	2	{2,4,6,8,10,12,14,16}	IIн
4950	242501	0	115	4	3	{2,4,6,8,10,12,14,16}	IIн
4951	242501	0	104	4	4	{1,3,5,7,9,11,13,15}	Iн
4952	242501	0	24	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4953	242501	0	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4954	242501	0	31	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4955	242501	0	24	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4956	242501	0	104	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4957	242501	0	102	6	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4958	242501	0	37	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4959	242501	0	37	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4960	242501	0	37	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4961	242501	0	37	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4962	242501	0	26	2	2	{2,4,6,8,10,12,14,16}	IIн
4963	242501	0	65	2	3	{1,3,5,7,9,11,13,15}	Iн
4964	242501	0	26	2	3	{2,4,6,8,10,12,14,16}	IIн
4965	242501	0	102	2	4	{1,3,5,7,9,11,13,15}	Iн
4966	242501	0	114	2	5	{1,3,5,7,9,11,13,15}	Iн
4967	242501	0	65	2	5	{2,4,6,8,10,12,14,16}	IIн
4968	242501	0	26	2	6	{1,3,5,7,9,11,13,15}	Iн
4969	242501	0	65	2	6	{2,4,6,8,10,12,14,16}	IIн
4970	242501	0	33	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4971	242501	0	33	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4972	242501	0	27	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4973	242501	0	65	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4974	242501	0	103	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4975	242501	0	115	4	1	{2,4,6,8,10,12,14,16}	IIн
4976	242501	0	115	4	2	{2,4,6,8,10,12,14,16}	IIн
4977	242501	0	115	4	3	{2,4,6,8,10,12,14,16}	IIн
4978	242501	0	104	4	4	{1,3,5,7,9,11,13,15}	Iн
4979	242501	0	24	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4980	242501	0	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4981	242501	0	24	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4982	242501	0	104	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4983	242501	0	31	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4984	242501	0	102	6	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4985	242501	0	116	1	3	{8}	8н
4986	242501	0	105	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4987	242501	0	105	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4988	242501	0	37	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4989	242501	0	37	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4990	242501	0	37	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4991	242501	0	37	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4992	242501	0	33	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4993	242501	0	33	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4994	242501	0	27	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4995	242501	0	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4996	242501	0	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4997	242501	0	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4998	242501	0	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
4999	242501	0	42	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5000	242501	0	116	1	3	{8}	8н
5001	242501	0	105	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5002	242501	0	105	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5003	242501	0	37	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5004	242501	0	37	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5191	242501	0	115	4	2	{2,4,6,8,10,12,14,16}	IIн
5005	242501	0	37	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5006	242501	0	37	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5007	242501	0	33	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5008	242501	0	33	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5009	242501	0	27	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5010	242501	0	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5011	242501	0	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5012	242501	0	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5013	242501	0	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5014	242501	0	42	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5015	242501	0	42	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5016	242501	0	42	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5017	242501	0	42	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5018	242501	0	42	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5019	242501	0	42	1	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5020	242501	0	117	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5021	242501	0	118	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5022	242501	0	119	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5023	242501	0	117	2	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5024	242501	0	120	3	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5025	242501	0	121	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5026	242501	0	122	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5027	242501	0	42	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5028	242501	0	42	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5029	242501	0	42	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5030	242501	0	42	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5031	242501	0	42	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5032	242501	0	42	5	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5033	242501	0	42	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5034	242501	0	42	5	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5035	242501	0	42	5	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5036	242501	0	42	5	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5037	242501	0	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5038	242501	0	8	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5039	242501	0	16	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5040	242501	0	16	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5041	242501	0	9	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5042	242501	0	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5043	242501	0	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5044	242501	0	7	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5045	242501	0	10	3	5	{2,4,6,8,10,12,14,16}	IIн
5046	242501	0	91	4	2	{1,3,5,7,9,11,13,15}	Iн
5047	242501	0	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5048	242501	0	91	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5049	242501	0	2	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5050	242501	0	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5051	242501	0	1	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5052	242501	0	10	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5053	242501	0	11	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5054	242501	0	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5055	242501	0	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5056	242501	0	16	6	1	{1,3,5,7,9,11,13,15}	Iн
5057	242501	0	10	6	2	{1,3,5,7,9,11,13,15}	Iн
5058	242501	0	10	6	3	{1,3,5,7,9,11,13,15}	Iн
5059	242501	0	8	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5060	242501	0	8	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5061	242501	0	1	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5062	242501	0	2	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5063	242501	0	7	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5064	242501	0	21	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5065	242501	0	9	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5066	242501	0	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5067	242501	0	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5068	242501	0	91	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5069	242501	0	0	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5070	242501	0	10	3	5	{2,4,6,8,10,12,14,16}	IIн
5071	242501	0	91	4	2	{1,3,5,7,9,11,13,15}	Iн
5072	242501	0	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5073	242501	0	16	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5074	242501	0	16	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5075	242501	0	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5076	242501	0	10	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5077	242501	0	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5078	242501	0	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5079	242501	0	10	5	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5080	242501	0	16	6	1	{1,3,5,7,9,11,13,15}	Iн
5081	242501	0	16	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5082	242501	0	16	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5083	242501	0	10	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5084	242501	0	10	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5085	242501	0	1	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5086	242501	0	21	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5087	242501	0	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5088	242501	0	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5089	242501	0	8	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5090	242501	0	8	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5091	242501	0	7	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5092	242501	0	10	3	5	{2,4,6,8,10,12,14,16}	IIн
5093	242501	0	91	4	2	{1,3,5,7,9,11,13,15}	Iн
5094	242501	0	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5095	242501	0	9	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5096	242501	0	91	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5097	242501	0	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5098	242501	0	0	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5099	242501	0	2	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5100	242501	0	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5101	242501	0	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5102	242501	0	16	6	1	{1,3,5,7,9,11,13,15}	Iн
5103	242501	0	10	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5104	242501	0	10	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5105	242501	0	7	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5106	242501	0	9	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5107	242501	0	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5108	242501	0	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5109	242501	0	21	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5110	242501	0	1	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5111	242501	0	10	3	5	{2,4,6,8,10,12,14,16}	IIн
5112	242501	0	91	4	2	{1,3,5,7,9,11,13,15}	Iн
5113	242501	0	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5114	242501	0	2	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5115	242501	0	91	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5116	242501	0	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5117	242501	0	8	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5118	242501	0	8	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5119	242501	0	0	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5120	242501	0	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5121	242501	0	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5122	242501	0	16	6	1	{1,3,5,7,9,11,13,15}	Iн
5123	242501	0	16	6	2	{2,4,6,8,10,12,14,16}	IIн
5124	242501	0	16	6	3	{2,4,6,8,10,12,14,16}	IIн
5125	242501	0	16	6	4	{2,4,6,8,10,12,14,16}	IIн
5126	242501	0	16	6	5	{2,4,6,8,10,12,14,16}	IIн
5127	242501	0	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5128	242501	0	95	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5129	242501	0	21	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5130	242501	0	96	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5131	242501	0	97	2	1	{1,3,5,7,9,11,13,15}	Iн
5132	242501	0	97	2	1	{2,4,6,8,10,12,14,16}	IIн
5133	242501	0	96	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5134	242501	0	96	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5135	242501	0	98	2	4	{2,4,6,8,10,12,14,16}	IIн
5136	242501	0	98	2	5	{2,4,6,8,10,12,14,16}	IIн
5137	242501	0	9	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5138	242501	0	8	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5139	242501	0	96	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5140	242501	0	21	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5141	242501	0	17	3	5	{2,4,6,8,10,12,14,16}	IIн
5142	242501	0	112	4	2	{2,4,6,8,10,12,14,16}	IIн
5143	242501	0	112	4	3	{2,4,6,8,10,12,14,16}	IIн
5144	242501	0	100	4	4	{1,3,5,7,9,11,13,15}	Iн
5145	242501	0	100	4	5	{1,3,5,7,9,11,13,15}	Iн
5146	242501	0	18	5	3	{1,3,5,7,9,11,13,15}	Iн
5147	242501	0	98	5	4	{1,3,5,7,9,11,13,15}	Iн
5148	242501	0	17	5	4	{2,4,6,8,10,12,14,16}	IIн
5149	242501	0	18	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5150	242501	0	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5151	242501	0	21	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5152	242501	0	96	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5153	242501	0	17	2	1	{1,3,5,7,9,11,13,15}	Iн
5154	242501	0	97	2	1	{2,4,6,8,10,12,14,16}	IIн
5155	242501	0	96	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5156	242501	0	8	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5157	242501	0	97	2	4	{1,3,5,7,9,11,13,15}	Iн
5158	242501	0	98	2	4	{2,4,6,8,10,12,14,16}	IIн
5159	242501	0	98	2	5	{1,3,5,7,9,11,13,15}	Iн
5160	242501	0	9	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5161	242501	0	95	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5162	242501	0	96	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5163	242501	0	21	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5164	242501	0	17	3	5	{2,4,6,8,10,12,14,16}	IIн
5165	242501	0	112	4	2	{2,4,6,8,10,12,14,16}	IIн
5166	242501	0	112	4	3	{2,4,6,8,10,12,14,16}	IIн
5167	242501	0	100	4	4	{1,3,5,7,9,11,13,15}	Iн
5168	242501	0	100	4	5	{1,3,5,7,9,11,13,15}	Iн
5169	242501	0	113	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5170	242501	0	18	5	3	{1,3,5,7,9,11,13,15}	Iн
5171	242501	0	18	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5172	242501	0	98	5	5	{1,3,5,7,9,11,13,15}	Iн
5173	242501	0	37	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5174	242501	0	37	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5175	242501	0	37	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5176	242501	0	37	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5177	242501	0	26	2	2	{2,4,6,8,10,12,14,16}	IIн
5178	242501	0	65	2	3	{1,3,5,7,9,11,13,15}	Iн
5179	242501	0	26	2	3	{2,4,6,8,10,12,14,16}	IIн
5180	242501	0	102	2	4	{1,3,5,7,9,11,13,15}	Iн
5181	242501	0	114	2	5	{1,3,5,7,9,11,13,15}	Iн
5182	242501	0	65	2	5	{2,4,6,8,10,12,14,16}	IIн
5183	242501	0	26	2	6	{1,3,5,7,9,11,13,15}	Iн
5184	242501	0	65	2	6	{2,4,6,8,10,12,14,16}	IIн
5185	242501	0	33	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5186	242501	0	33	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5187	242501	0	27	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5188	242501	0	65	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5189	242501	0	103	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5190	242501	0	115	4	1	{2,4,6,8,10,12,14,16}	IIн
5192	242501	0	115	4	3	{2,4,6,8,10,12,14,16}	IIн
5193	242501	0	104	4	4	{1,3,5,7,9,11,13,15}	Iн
5194	242501	0	24	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5195	242501	0	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5196	242501	0	31	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5197	242501	0	24	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5198	242501	0	104	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5199	242501	0	102	6	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5200	242501	0	37	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5201	242501	0	37	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5202	242501	0	37	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5203	242501	0	37	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5204	242501	0	26	2	2	{2,4,6,8,10,12,14,16}	IIн
5205	242501	0	65	2	3	{1,3,5,7,9,11,13,15}	Iн
5206	242501	0	26	2	3	{2,4,6,8,10,12,14,16}	IIн
5207	242501	0	102	2	4	{1,3,5,7,9,11,13,15}	Iн
5208	242501	0	114	2	5	{1,3,5,7,9,11,13,15}	Iн
5209	242501	0	65	2	5	{2,4,6,8,10,12,14,16}	IIн
5210	242501	0	26	2	6	{1,3,5,7,9,11,13,15}	Iн
5211	242501	0	65	2	6	{2,4,6,8,10,12,14,16}	IIн
5212	242501	0	33	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5213	242501	0	33	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5214	242501	0	27	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5215	242501	0	65	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5216	242501	0	103	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5217	242501	0	115	4	1	{2,4,6,8,10,12,14,16}	IIн
5218	242501	0	115	4	2	{2,4,6,8,10,12,14,16}	IIн
5219	242501	0	115	4	3	{2,4,6,8,10,12,14,16}	IIн
5220	242501	0	104	4	4	{1,3,5,7,9,11,13,15}	Iн
5221	242501	0	24	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5222	242501	0	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5223	242501	0	24	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5224	242501	0	104	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5225	242501	0	31	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5226	242501	0	102	6	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5227	242501	0	116	1	3	{8}	8н
5228	242501	0	105	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5229	242501	0	105	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5230	242501	0	37	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5231	242501	0	37	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5232	242501	0	37	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5233	242501	0	37	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5234	242501	0	33	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5235	242501	0	33	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5236	242501	0	27	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5237	242501	0	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5238	242501	0	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5372	242501	3	97	2	1	{2,4,6,8,10,12,14,16}	IIн
5239	242501	0	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5240	242501	0	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5241	242501	0	42	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5242	242501	0	116	1	3	{8}	8н
5243	242501	0	105	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5244	242501	0	105	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5245	242501	0	37	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5246	242501	0	37	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5247	242501	0	37	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5248	242501	0	37	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5249	242501	0	33	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5250	242501	0	33	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5251	242501	0	27	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5252	242501	0	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5253	242501	0	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5254	242501	0	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5255	242501	0	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5256	242501	0	42	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5257	242501	0	42	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5258	242501	0	42	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5259	242501	0	42	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5260	242501	0	42	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5261	242501	0	42	1	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5262	242501	0	117	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5263	242501	0	118	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5264	242501	0	119	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5265	242501	0	117	2	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5266	242501	0	120	3	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5267	242501	0	121	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5268	242501	0	123	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5269	242501	0	42	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5270	242501	0	42	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5271	242501	0	42	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5272	242501	0	42	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5273	242501	0	42	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5274	242501	0	42	5	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5275	242501	0	42	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5276	242501	0	42	5	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5277	242501	0	42	5	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5278	242501	0	42	5	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5279	242501	3	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5280	242501	3	124	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5281	242501	3	16	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5282	242501	3	16	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5283	242501	3	9	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5284	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5285	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5286	242501	3	7	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5287	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
5288	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
5289	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5290	242501	3	91	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5291	242501	3	2	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5292	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5293	242501	3	1	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5294	242501	3	10	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5295	242501	3	11	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5296	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5297	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5298	242501	3	125	6	1	{1,3,5,7,9,11,13,15}	Iн
5299	242501	3	125	6	1	{1,3,5,7,9,11,13,15}	Iн
5300	242501	3	10	6	2	{1,3,5,7,9,11,13,15}	Iн
5301	242501	3	10	6	3	{1,3,5,7,9,11,13,15}	Iн
5302	242501	3	124	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5303	242501	3	1	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5304	242501	3	2	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5305	242501	3	7	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5306	242501	3	21	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5307	242501	3	9	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5308	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5309	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5310	242501	3	91	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5311	242501	3	0	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5312	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
5313	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
5314	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5315	242501	3	16	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5316	242501	3	16	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5317	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5318	242501	3	10	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5319	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5320	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5321	242501	3	10	5	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5322	242501	3	16	6	1	{1,3,5,7,9,11,13,15}	Iн
5323	242501	3	16	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5324	242501	3	16	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5325	242501	3	10	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5326	242501	3	10	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5327	242501	3	1	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5328	242501	3	21	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5329	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5330	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5331	242501	3	124	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5332	242501	3	7	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5333	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
5334	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
5335	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5336	242501	3	9	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5337	242501	3	91	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5338	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5339	242501	3	0	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5340	242501	3	2	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5341	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5342	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5343	242501	3	16	6	1	{1,3,5,7,9,11,13,15}	Iн
5344	242501	3	10	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5345	242501	3	10	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5346	242501	3	7	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5347	242501	3	9	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5348	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5349	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5350	242501	3	21	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5351	242501	3	1	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5352	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
5353	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
5354	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5355	242501	3	2	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5356	242501	3	91	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5357	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5358	242501	3	124	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5359	242501	3	0	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5360	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5361	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5362	242501	3	16	6	1	{1,3,5,7,9,11,13,15}	Iн
5363	242501	3	16	6	2	{2,4,6,8,10,12,14,16}	IIн
5364	242501	3	16	6	3	{2,4,6,8,10,12,14,16}	IIн
5365	242501	3	16	6	4	{2,4,6,8,10,12,14,16}	IIн
5366	242501	3	16	6	5	{2,4,6,8,10,12,14,16}	IIн
5367	242501	3	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5368	242501	3	95	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5369	242501	3	21	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5370	242501	3	96	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5371	242501	3	97	2	1	{1,3,5,7,9,11,13,15}	Iн
5373	242501	3	96	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5374	242501	3	96	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5375	242501	3	98	2	4	{2,4,6,8,10,12,14,16}	IIн
5376	242501	3	98	2	5	{2,4,6,8,10,12,14,16}	IIн
5377	242501	3	9	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5378	242501	3	8	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5379	242501	3	96	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5380	242501	3	21	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5381	242501	3	17	3	5	{2,4,6,8,10,12,14,16}	IIн
5382	242501	3	112	4	2	{2,4,6,8,10,12,14,16}	IIн
5383	242501	3	112	4	3	{2,4,6,8,10,12,14,16}	IIн
5384	242501	3	100	4	4	{1,3,5,7,9,11,13,15}	Iн
5385	242501	3	100	4	5	{1,3,5,7,9,11,13,15}	Iн
5386	242501	3	18	5	3	{1,3,5,7,9,11,13,15}	Iн
5387	242501	3	98	5	4	{1,3,5,7,9,11,13,15}	Iн
5388	242501	3	17	5	4	{2,4,6,8,10,12,14,16}	IIн
5389	242501	3	18	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5390	242501	3	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5391	242501	3	21	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5392	242501	3	96	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5393	242501	3	17	2	1	{1,3,5,7,9,11,13,15}	Iн
5394	242501	3	97	2	1	{2,4,6,8,10,12,14,16}	IIн
5395	242501	3	96	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5396	242501	3	8	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5397	242501	3	97	2	4	{1,3,5,7,9,11,13,15}	Iн
5398	242501	3	98	2	4	{2,4,6,8,10,12,14,16}	IIн
5399	242501	3	98	2	5	{1,3,5,7,9,11,13,15}	Iн
5400	242501	3	9	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5401	242501	3	95	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5402	242501	3	96	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5403	242501	3	21	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5404	242501	3	17	3	5	{2,4,6,8,10,12,14,16}	IIн
5405	242501	3	112	4	2	{2,4,6,8,10,12,14,16}	IIн
5406	242501	3	112	4	3	{2,4,6,8,10,12,14,16}	IIн
5407	242501	3	100	4	4	{1,3,5,7,9,11,13,15}	Iн
5408	242501	3	100	4	5	{1,3,5,7,9,11,13,15}	Iн
5409	242501	3	113	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5410	242501	3	18	5	3	{1,3,5,7,9,11,13,15}	Iн
5411	242501	3	18	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5412	242501	3	98	5	5	{1,3,5,7,9,11,13,15}	Iн
5413	242501	3	126	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5414	242501	3	126	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5415	242501	3	126	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5416	242501	3	126	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5417	242501	3	26	2	2	{2,4,6,8,10,12,14,16}	IIн
5418	242501	3	65	2	3	{1,3,5,7,9,11,13,15}	Iн
5419	242501	3	26	2	3	{2,4,6,8,10,12,14,16}	IIн
5420	242501	3	102	2	4	{1,3,5,7,9,11,13,15}	Iн
5421	242501	3	114	2	5	{1,3,5,7,9,11,13,15}	Iн
5422	242501	3	65	2	5	{2,4,6,8,10,12,14,16}	IIн
5423	242501	3	26	2	6	{1,3,5,7,9,11,13,15}	Iн
5424	242501	3	65	2	6	{2,4,6,8,10,12,14,16}	IIн
5425	242501	3	33	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5799	242501	3	129	3	4	{2,4,6,8,10,12,14,16}	IIн
5426	242501	3	33	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5427	242501	3	27	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5428	242501	3	65	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5429	242501	3	103	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5430	242501	3	115	4	1	{2,4,6,8,10,12,14,16}	IIн
5431	242501	3	115	4	2	{2,4,6,8,10,12,14,16}	IIн
5432	242501	3	115	4	3	{2,4,6,8,10,12,14,16}	IIн
5433	242501	3	104	4	4	{1,3,5,7,9,11,13,15}	Iн
5434	242501	3	24	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5435	242501	3	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5436	242501	3	31	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5437	242501	3	24	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5438	242501	3	104	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5439	242501	3	102	6	1	{1,3,5,7,9,11,13,15}	Iн
5440	242501	3	102	6	1	{2,4,6,8,10,12,14,16}	IIн
5441	242501	3	127	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5442	242501	3	127	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5443	242501	3	127	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5444	242501	3	127	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5445	242501	3	26	2	2	{2,4,6,8,10,12,14,16}	IIн
5446	242501	3	65	2	3	{1,3,5,7,9,11,13,15}	Iн
5447	242501	3	26	2	3	{2,4,6,8,10,12,14,16}	IIн
5448	242501	3	102	2	4	{2,4,6,8,10,12,14,16}	IIн
5449	242501	3	114	2	5	{1,3,5,7,9,11,13,15}	Iн
5450	242501	3	65	2	5	{2,4,6,8,10,12,14,16}	IIн
5451	242501	3	26	2	6	{1,3,5,7,9,11,13,15}	Iн
5452	242501	3	65	2	6	{2,4,6,8,10,12,14,16}	IIн
5453	242501	3	33	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5454	242501	3	33	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5455	242501	3	27	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5456	242501	3	65	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5457	242501	3	103	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5458	242501	3	115	4	1	{2,4,6,8,10,12,14,16}	IIн
5459	242501	3	115	4	2	{2,4,6,8,10,12,14,16}	IIн
5460	242501	3	115	4	3	{2,4,6,8,10,12,14,16}	IIн
5461	242501	3	104	4	4	{1,3,5,7,9,11,13,15}	Iн
5462	242501	3	24	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5463	242501	3	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5464	242501	3	24	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5465	242501	3	104	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5466	242501	3	31	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5467	242501	3	102	6	1	{1,3,5,7,9,11,13,15}	Iн
5468	242501	3	102	6	1	{2,4,6,8,10,12,14,16}	IIн
5469	242501	3	116	1	3	{8}	8н
5470	242501	3	105	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5471	242501	3	105	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5472	242501	3	126	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5473	242501	3	126	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5474	242501	3	126	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5475	242501	3	126	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5476	242501	3	33	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5477	242501	3	33	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5478	242501	3	27	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5479	242501	3	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5480	242501	3	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5481	242501	3	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5482	242501	3	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5483	242501	3	42	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5484	242501	3	116	1	3	{8}	8н
5485	242501	3	105	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5486	242501	3	105	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5487	242501	3	126	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5488	242501	3	126	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5489	242501	3	126	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5490	242501	3	126	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5491	242501	3	33	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5492	242501	3	33	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5493	242501	3	27	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5494	242501	3	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5495	242501	3	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5496	242501	3	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5497	242501	3	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5498	242501	3	42	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5499	242501	3	42	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5500	242501	3	42	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5501	242501	3	42	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5502	242501	3	42	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5503	242501	3	42	1	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5504	242501	3	117	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5505	242501	3	118	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5506	242501	3	119	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5507	242501	3	128	2	4	{1,2}	1,2н
5508	242501	3	120	3	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5509	242501	3	121	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5510	242501	3	123	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5511	242501	3	42	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5512	242501	3	42	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5513	242501	3	42	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5514	242501	3	42	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5515	242501	3	42	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5516	242501	3	42	5	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5517	242501	3	42	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5942	242501	3	98	5	5	{1,3,5,7,9,11,13,15}	Iн
5518	242501	3	42	5	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5519	242501	3	42	5	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5520	242501	3	42	5	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5521	242501	3	87	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5522	242501	3	87	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5523	242501	3	87	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5524	242501	3	87	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5525	242501	3	129	1	5	{2,4,6,8,10,12,14,16}	IIн
5526	242501	3	87	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5527	242501	3	87	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5528	242501	3	87	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5529	242501	3	87	2	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5530	242501	3	87	2	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5531	242501	3	130	3	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5532	242501	3	129	3	3	{2,4,6,8,10,12,14,16}	IIн
5533	242501	3	131	3	4	{3,5,7,9,11,13,15,17}	Iн
5534	242501	3	129	3	4	{2,4,6,8,10,12,14,16}	IIн
5535	242501	3	131	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5536	242501	3	123	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5537	242501	3	87	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5538	242501	3	87	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5539	242501	3	87	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5540	242501	3	87	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5541	242501	3	87	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5542	242501	3	132	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5543	242501	3	132	5	5	{3,5,7,9,11,13,15,17}	Iн
5544	242501	3	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5545	242501	3	124	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5546	242501	3	16	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5547	242501	3	16	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5548	242501	3	9	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5549	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5550	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5551	242501	3	7	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5552	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
5553	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
5554	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5555	242501	3	91	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5556	242501	3	2	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5557	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5558	242501	3	1	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5559	242501	3	10	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5560	242501	3	11	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5561	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5562	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5563	242501	3	125	6	1	{1,3,5,7,9,11,13,15}	Iн
5564	242501	3	125	6	1	{1,3,5,7,9,11,13,15}	Iн
5565	242501	3	10	6	2	{1,3,5,7,9,11,13,15}	Iн
5566	242501	3	10	6	3	{1,3,5,7,9,11,13,15}	Iн
5567	242501	3	124	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5568	242501	3	1	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5569	242501	3	2	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5570	242501	3	7	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5571	242501	3	21	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5572	242501	3	9	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5573	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5574	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5575	242501	3	91	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5576	242501	3	0	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5577	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
5578	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
5579	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5580	242501	3	16	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5581	242501	3	16	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5582	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5583	242501	3	10	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5584	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5585	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5586	242501	3	10	5	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5587	242501	3	16	6	1	{1,3,5,7,9,11,13,15}	Iн
5588	242501	3	16	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5589	242501	3	16	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5590	242501	3	10	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5591	242501	3	10	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5592	242501	3	1	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5593	242501	3	21	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5594	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5595	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5596	242501	3	124	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5597	242501	3	7	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5598	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
5599	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
5600	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5601	242501	3	9	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5602	242501	3	91	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5603	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5604	242501	3	0	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5605	242501	3	2	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5606	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5607	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5608	242501	3	16	6	1	{1,3,5,7,9,11,13,15}	Iн
5609	242501	3	10	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5610	242501	3	10	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5611	242501	3	7	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5612	242501	3	9	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5613	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5614	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5615	242501	3	21	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5616	242501	3	1	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5617	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
5618	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
5619	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5620	242501	3	2	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5621	242501	3	91	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5622	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5623	242501	3	124	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5624	242501	3	0	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5625	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5626	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5627	242501	3	16	6	1	{1,3,5,7,9,11,13,15}	Iн
5628	242501	3	16	6	2	{2,4,6,8,10,12,14,16}	IIн
5629	242501	3	16	6	3	{2,4,6,8,10,12,14,16}	IIн
5630	242501	3	16	6	4	{2,4,6,8,10,12,14,16}	IIн
5631	242501	3	16	6	5	{2,4,6,8,10,12,14,16}	IIн
5632	242501	3	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5633	242501	3	95	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5634	242501	3	21	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5635	242501	3	96	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5636	242501	3	97	2	1	{1,3,5,7,9,11,13,15}	Iн
5637	242501	3	97	2	1	{2,4,6,8,10,12,14,16}	IIн
5638	242501	3	96	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5639	242501	3	96	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5640	242501	3	98	2	4	{2,4,6,8,10,12,14,16}	IIн
5641	242501	3	98	2	5	{2,4,6,8,10,12,14,16}	IIн
5642	242501	3	9	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5643	242501	3	8	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5644	242501	3	96	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5645	242501	3	21	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5646	242501	3	17	3	5	{2,4,6,8,10,12,14,16}	IIн
5647	242501	3	112	4	2	{2,4,6,8,10,12,14,16}	IIн
5648	242501	3	112	4	3	{2,4,6,8,10,12,14,16}	IIн
5649	242501	3	100	4	4	{1,3,5,7,9,11,13,15}	Iн
5650	242501	3	100	4	5	{1,3,5,7,9,11,13,15}	Iн
5651	242501	3	18	5	3	{1,3,5,7,9,11,13,15}	Iн
5652	242501	3	98	5	4	{1,3,5,7,9,11,13,15}	Iн
5653	242501	3	17	5	4	{2,4,6,8,10,12,14,16}	IIн
5654	242501	3	18	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5655	242501	3	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6083	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
5656	242501	3	21	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5657	242501	3	96	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5658	242501	3	17	2	1	{1,3,5,7,9,11,13,15}	Iн
5659	242501	3	97	2	1	{2,4,6,8,10,12,14,16}	IIн
5660	242501	3	96	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5661	242501	3	8	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5662	242501	3	97	2	4	{1,3,5,7,9,11,13,15}	Iн
5663	242501	3	98	2	4	{2,4,6,8,10,12,14,16}	IIн
5664	242501	3	98	2	5	{1,3,5,7,9,11,13,15}	Iн
5665	242501	3	9	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5666	242501	3	95	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5667	242501	3	96	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5668	242501	3	21	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5669	242501	3	17	3	5	{2,4,6,8,10,12,14,16}	IIн
5670	242501	3	112	4	2	{2,4,6,8,10,12,14,16}	IIн
5671	242501	3	112	4	3	{2,4,6,8,10,12,14,16}	IIн
5672	242501	3	100	4	4	{1,3,5,7,9,11,13,15}	Iн
5673	242501	3	100	4	5	{1,3,5,7,9,11,13,15}	Iн
5674	242501	3	113	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5675	242501	3	18	5	3	{1,3,5,7,9,11,13,15}	Iн
5676	242501	3	18	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5677	242501	3	98	5	5	{1,3,5,7,9,11,13,15}	Iн
5678	242501	3	126	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5679	242501	3	126	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5680	242501	3	126	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5681	242501	3	126	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5682	242501	3	26	2	2	{2,4,6,8,10,12,14,16}	IIн
5683	242501	3	65	2	3	{1,3,5,7,9,11,13,15}	Iн
5684	242501	3	26	2	3	{2,4,6,8,10,12,14,16}	IIн
5685	242501	3	102	2	4	{1,3,5,7,9,11,13,15}	Iн
5686	242501	3	114	2	5	{1,3,5,7,9,11,13,15}	Iн
5687	242501	3	65	2	5	{2,4,6,8,10,12,14,16}	IIн
5688	242501	3	26	2	6	{1,3,5,7,9,11,13,15}	Iн
5689	242501	3	65	2	6	{2,4,6,8,10,12,14,16}	IIн
5690	242501	3	33	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5691	242501	3	33	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5692	242501	3	27	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5693	242501	3	65	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5694	242501	3	103	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5695	242501	3	115	4	1	{2,4,6,8,10,12,14,16}	IIн
5696	242501	3	115	4	2	{2,4,6,8,10,12,14,16}	IIн
5697	242501	3	115	4	3	{2,4,6,8,10,12,14,16}	IIн
5698	242501	3	104	4	4	{1,3,5,7,9,11,13,15}	Iн
5699	242501	3	24	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5700	242501	3	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5701	242501	3	31	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5702	242501	3	24	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5703	242501	3	104	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5704	242501	3	102	6	1	{1,3,5,7,9,11,13,15}	Iн
5705	242501	3	102	6	1	{2,4,6,8,10,12,14,16}	IIн
5706	242501	3	127	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5707	242501	3	127	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5708	242501	3	127	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5709	242501	3	127	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5710	242501	3	26	2	2	{2,4,6,8,10,12,14,16}	IIн
5711	242501	3	65	2	3	{1,3,5,7,9,11,13,15}	Iн
5712	242501	3	26	2	3	{2,4,6,8,10,12,14,16}	IIн
5713	242501	3	102	2	4	{2,4,6,8,10,12,14,16}	IIн
5714	242501	3	114	2	5	{1,3,5,7,9,11,13,15}	Iн
5715	242501	3	65	2	5	{2,4,6,8,10,12,14,16}	IIн
5716	242501	3	26	2	6	{1,3,5,7,9,11,13,15}	Iн
5717	242501	3	65	2	6	{2,4,6,8,10,12,14,16}	IIн
5718	242501	3	33	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5719	242501	3	33	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5720	242501	3	27	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5721	242501	3	65	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5722	242501	3	103	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5723	242501	3	115	4	1	{2,4,6,8,10,12,14,16}	IIн
5724	242501	3	115	4	2	{2,4,6,8,10,12,14,16}	IIн
5725	242501	3	115	4	3	{2,4,6,8,10,12,14,16}	IIн
5726	242501	3	104	4	4	{1,3,5,7,9,11,13,15}	Iн
5727	242501	3	24	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5728	242501	3	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5729	242501	3	24	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5730	242501	3	104	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5731	242501	3	31	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5732	242501	3	102	6	1	{1,3,5,7,9,11,13,15}	Iн
5733	242501	3	102	6	1	{2,4,6,8,10,12,14,16}	IIн
5734	242501	3	116	1	3	{8}	8н
5735	242501	3	105	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5736	242501	3	105	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5737	242501	3	126	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5738	242501	3	126	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5739	242501	3	126	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5740	242501	3	126	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5741	242501	3	33	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5742	242501	3	33	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5743	242501	3	27	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5744	242501	3	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5745	242501	3	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5746	242501	3	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5747	242501	3	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5748	242501	3	42	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5749	242501	3	116	1	3	{8}	8н
5750	242501	3	105	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5751	242501	3	105	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5752	242501	3	126	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5753	242501	3	126	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5754	242501	3	126	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5755	242501	3	126	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5756	242501	3	33	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5757	242501	3	33	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5758	242501	3	27	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5759	242501	3	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5760	242501	3	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5761	242501	3	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5762	242501	3	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5763	242501	3	42	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5764	242501	3	42	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5765	242501	3	42	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5766	242501	3	42	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5767	242501	3	42	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5768	242501	3	42	1	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5769	242501	3	117	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5770	242501	3	118	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5771	242501	3	119	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5772	242501	3	128	2	4	{1,2}	1,2н
5773	242501	3	120	3	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5774	242501	3	121	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5775	242501	3	123	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5776	242501	3	42	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5777	242501	3	42	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5778	242501	3	42	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5779	242501	3	42	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5780	242501	3	42	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5781	242501	3	42	5	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5782	242501	3	42	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5783	242501	3	42	5	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5784	242501	3	42	5	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5785	242501	3	42	5	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5786	242501	3	87	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5787	242501	3	87	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5788	242501	3	87	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5789	242501	3	87	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5790	242501	3	129	1	5	{2,4,6,8,10,12,14,16}	IIн
5791	242501	3	87	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5792	242501	3	87	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5793	242501	3	87	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5794	242501	3	87	2	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5795	242501	3	87	2	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5796	242501	3	130	3	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5797	242501	3	129	3	3	{2,4,6,8,10,12,14,16}	IIн
5798	242501	3	131	3	4	{3,5,7,9,11,13,15,17}	Iн
5800	242501	3	131	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5801	242501	3	123	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5802	242501	3	87	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5803	242501	3	87	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5804	242501	3	87	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5805	242501	3	87	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5806	242501	3	87	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5807	242501	3	132	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
5808	242501	3	132	5	5	{3,5,7,9,11,13,15,17}	Iн
5809	242501	3	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5810	242501	3	124	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5811	242501	3	16	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5812	242501	3	16	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5813	242501	3	9	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5814	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5815	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5816	242501	3	7	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5817	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
5818	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
5819	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5820	242501	3	91	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5821	242501	3	2	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5822	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5823	242501	3	1	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5824	242501	3	10	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5825	242501	3	11	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5826	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5827	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5828	242501	3	125	6	1	{1,3,5,7,9,11,13,15}	Iн
5829	242501	3	125	6	1	{1,3,5,7,9,11,13,15}	Iн
5830	242501	3	10	6	2	{1,3,5,7,9,11,13,15}	Iн
5831	242501	3	10	6	3	{1,3,5,7,9,11,13,15}	Iн
5832	242501	3	124	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5833	242501	3	1	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5834	242501	3	2	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5835	242501	3	7	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5836	242501	3	21	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5837	242501	3	9	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5838	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5839	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5840	242501	3	91	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5841	242501	3	0	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5842	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
5843	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
5844	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5845	242501	3	16	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5846	242501	3	16	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5847	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5848	242501	3	10	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5849	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5850	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5851	242501	3	10	5	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5852	242501	3	16	6	1	{1,3,5,7,9,11,13,15}	Iн
5853	242501	3	16	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5854	242501	3	16	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5855	242501	3	10	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5856	242501	3	10	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5857	242501	3	1	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5858	242501	3	21	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5859	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5860	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5861	242501	3	124	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5862	242501	3	7	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5863	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
5864	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
5865	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5866	242501	3	9	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5867	242501	3	91	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5868	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5869	242501	3	0	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5870	242501	3	2	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5871	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5872	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5873	242501	3	16	6	1	{1,3,5,7,9,11,13,15}	Iн
5874	242501	3	10	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5875	242501	3	10	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5876	242501	3	7	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5877	242501	3	9	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5878	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5879	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5880	242501	3	21	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5881	242501	3	1	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5882	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
5883	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
5884	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5885	242501	3	2	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5886	242501	3	91	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5887	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5888	242501	3	124	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5889	242501	3	0	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5890	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5891	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5892	242501	3	16	6	1	{1,3,5,7,9,11,13,15}	Iн
5893	242501	3	16	6	2	{2,4,6,8,10,12,14,16}	IIн
5894	242501	3	16	6	3	{2,4,6,8,10,12,14,16}	IIн
5895	242501	3	16	6	4	{2,4,6,8,10,12,14,16}	IIн
5896	242501	3	16	6	5	{2,4,6,8,10,12,14,16}	IIн
5897	242501	3	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5898	242501	3	95	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5899	242501	3	21	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5900	242501	3	96	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5901	242501	3	97	2	1	{1,3,5,7,9,11,13,15}	Iн
5902	242501	3	97	2	1	{2,4,6,8,10,12,14,16}	IIн
5903	242501	3	96	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5904	242501	3	96	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5905	242501	3	98	2	4	{2,4,6,8,10,12,14,16}	IIн
5906	242501	3	98	2	5	{2,4,6,8,10,12,14,16}	IIн
5907	242501	3	9	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5908	242501	3	8	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5909	242501	3	96	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5910	242501	3	21	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5911	242501	3	17	3	5	{2,4,6,8,10,12,14,16}	IIн
5912	242501	3	112	4	2	{2,4,6,8,10,12,14,16}	IIн
5913	242501	3	112	4	3	{2,4,6,8,10,12,14,16}	IIн
5914	242501	3	100	4	4	{1,3,5,7,9,11,13,15}	Iн
5915	242501	3	100	4	5	{1,3,5,7,9,11,13,15}	Iн
5916	242501	3	18	5	3	{1,3,5,7,9,11,13,15}	Iн
5917	242501	3	98	5	4	{1,3,5,7,9,11,13,15}	Iн
5918	242501	3	17	5	4	{2,4,6,8,10,12,14,16}	IIн
5919	242501	3	18	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5920	242501	3	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5921	242501	3	21	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5922	242501	3	96	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5923	242501	3	17	2	1	{1,3,5,7,9,11,13,15}	Iн
5924	242501	3	97	2	1	{2,4,6,8,10,12,14,16}	IIн
5925	242501	3	96	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5926	242501	3	8	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5927	242501	3	97	2	4	{1,3,5,7,9,11,13,15}	Iн
5928	242501	3	98	2	4	{2,4,6,8,10,12,14,16}	IIн
5929	242501	3	98	2	5	{1,3,5,7,9,11,13,15}	Iн
5930	242501	3	9	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5931	242501	3	95	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5932	242501	3	96	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5933	242501	3	21	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5934	242501	3	17	3	5	{2,4,6,8,10,12,14,16}	IIн
5935	242501	3	112	4	2	{2,4,6,8,10,12,14,16}	IIн
5936	242501	3	112	4	3	{2,4,6,8,10,12,14,16}	IIн
5937	242501	3	100	4	4	{1,3,5,7,9,11,13,15}	Iн
5938	242501	3	100	4	5	{1,3,5,7,9,11,13,15}	Iн
5939	242501	3	113	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5940	242501	3	18	5	3	{1,3,5,7,9,11,13,15}	Iн
5941	242501	3	18	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5943	242501	3	126	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5944	242501	3	126	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5945	242501	3	126	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5946	242501	3	126	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5947	242501	3	26	2	2	{2,4,6,8,10,12,14,16}	IIн
5948	242501	3	65	2	3	{1,3,5,7,9,11,13,15}	Iн
5949	242501	3	26	2	3	{2,4,6,8,10,12,14,16}	IIн
5950	242501	3	102	2	4	{1,3,5,7,9,11,13,15}	Iн
5951	242501	3	114	2	5	{1,3,5,7,9,11,13,15}	Iн
5952	242501	3	65	2	5	{2,4,6,8,10,12,14,16}	IIн
5953	242501	3	26	2	6	{1,3,5,7,9,11,13,15}	Iн
5954	242501	3	65	2	6	{2,4,6,8,10,12,14,16}	IIн
5955	242501	3	33	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5956	242501	3	33	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5957	242501	3	27	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5958	242501	3	65	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5959	242501	3	103	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5960	242501	3	133	4	1	{2,4,6,8,10,12,14,16}	IIн
5961	242501	3	133	4	2	{2,4,6,8,10,12,14,16}	IIн
5962	242501	3	133	4	3	{2,4,6,8,10,12,14,16}	IIн
5963	242501	3	104	4	4	{1,3,5,7,9,11,13,15}	Iн
5964	242501	3	24	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5965	242501	3	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5966	242501	3	31	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5967	242501	3	24	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5968	242501	3	104	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5969	242501	3	102	6	1	{1,3,5,7,9,11,13,15}	Iн
5970	242501	3	102	6	1	{2,4,6,8,10,12,14,16}	IIн
5971	242501	3	127	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5972	242501	3	127	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5973	242501	3	127	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5974	242501	3	127	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5975	242501	3	26	2	2	{2,4,6,8,10,12,14,16}	IIн
5976	242501	3	65	2	3	{1,3,5,7,9,11,13,15}	Iн
5977	242501	3	26	2	3	{2,4,6,8,10,12,14,16}	IIн
5978	242501	3	102	2	4	{2,4,6,8,10,12,14,16}	IIн
5979	242501	3	114	2	5	{1,3,5,7,9,11,13,15}	Iн
5980	242501	3	65	2	5	{2,4,6,8,10,12,14,16}	IIн
5981	242501	3	26	2	6	{1,3,5,7,9,11,13,15}	Iн
5982	242501	3	65	2	6	{2,4,6,8,10,12,14,16}	IIн
5983	242501	3	33	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5984	242501	3	33	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5985	242501	3	27	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5986	242501	3	65	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5987	242501	3	103	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5988	242501	3	133	4	1	{2,4,6,8,10,12,14,16}	IIн
5989	242501	3	133	4	2	{2,4,6,8,10,12,14,16}	IIн
5990	242501	3	133	4	3	{2,4,6,8,10,12,14,16}	IIн
5991	242501	3	104	4	4	{1,3,5,7,9,11,13,15}	Iн
5992	242501	3	24	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5993	242501	3	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5994	242501	3	24	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5995	242501	3	104	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5996	242501	3	31	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
5997	242501	3	102	6	1	{1,3,5,7,9,11,13,15}	Iн
5998	242501	3	102	6	1	{2,4,6,8,10,12,14,16}	IIн
5999	242501	3	116	1	3	{8}	8н
6000	242501	3	105	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6001	242501	3	105	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6002	242501	3	126	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6003	242501	3	126	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6004	242501	3	126	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6005	242501	3	126	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6006	242501	3	33	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6007	242501	3	33	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6008	242501	3	27	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6009	242501	3	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6010	242501	3	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6011	242501	3	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6012	242501	3	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6013	242501	3	42	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6014	242501	3	116	1	3	{8}	8н
6015	242501	3	105	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6016	242501	3	105	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6017	242501	3	126	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6018	242501	3	126	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6019	242501	3	126	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6020	242501	3	126	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6021	242501	3	33	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6022	242501	3	33	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6023	242501	3	27	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6024	242501	3	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6025	242501	3	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6026	242501	3	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6027	242501	3	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6028	242501	3	42	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6029	242501	3	42	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6030	242501	3	42	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6031	242501	3	42	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6032	242501	3	42	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6033	242501	3	42	1	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6034	242501	3	117	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6035	242501	3	118	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6036	242501	3	134	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6037	242501	3	128	2	4	{1,2}	1,2н
6038	242501	3	120	3	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6039	242501	3	121	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6040	242501	3	123	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6041	242501	3	42	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6042	242501	3	42	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6043	242501	3	42	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6044	242501	3	42	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6045	242501	3	42	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6046	242501	3	42	5	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6047	242501	3	42	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6048	242501	3	42	5	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6049	242501	3	42	5	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6050	242501	3	42	5	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6051	242501	3	87	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6052	242501	3	87	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6053	242501	3	87	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6054	242501	3	87	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6055	242501	3	129	1	5	{2,4,6,8,10,12,14,16}	IIн
6056	242501	3	87	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6057	242501	3	87	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6058	242501	3	87	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6059	242501	3	87	2	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6060	242501	3	87	2	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6061	242501	3	130	3	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6062	242501	3	129	3	3	{2,4,6,8,10,12,14,16}	IIн
6063	242501	3	131	3	4	{3,5,7,9,11,13,15,17}	Iн
6064	242501	3	129	3	4	{2,4,6,8,10,12,14,16}	IIн
6065	242501	3	131	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6066	242501	3	123	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6067	242501	3	87	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6068	242501	3	87	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6069	242501	3	87	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6070	242501	3	87	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6071	242501	3	87	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6072	242501	3	132	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6073	242501	3	132	5	5	{3,5,7,9,11,13,15,17}	Iн
6074	242501	3	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6075	242501	3	135	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6076	242501	3	16	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6077	242501	3	16	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6078	242501	3	9	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6079	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6080	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6081	242501	3	7	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6082	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
6084	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6085	242501	3	91	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6086	242501	3	2	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6087	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6088	242501	3	1	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6089	242501	3	10	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6090	242501	3	11	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6091	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6092	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6093	242501	3	125	6	1	{1,3,5,7,9,11,13,15}	Iн
6094	242501	3	125	6	1	{1,3,5,7,9,11,13,15}	Iн
6095	242501	3	10	6	2	{1,3,5,7,9,11,13,15}	Iн
6096	242501	3	10	6	3	{1,3,5,7,9,11,13,15}	Iн
6097	242501	3	135	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6098	242501	3	1	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6099	242501	3	2	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6100	242501	3	7	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6101	242501	3	21	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6102	242501	3	9	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6103	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6104	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6105	242501	3	91	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6106	242501	3	0	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6107	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
6108	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
6109	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6110	242501	3	16	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6111	242501	3	16	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6112	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6113	242501	3	10	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6114	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6115	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6116	242501	3	10	5	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6117	242501	3	16	6	1	{1,3,5,7,9,11,13,15}	Iн
6118	242501	3	16	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6119	242501	3	16	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6120	242501	3	10	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6121	242501	3	10	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6122	242501	3	1	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6123	242501	3	21	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6124	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6125	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6126	242501	3	135	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6127	242501	3	7	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6128	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
6129	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
6130	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6131	242501	3	9	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6132	242501	3	91	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6133	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6134	242501	3	0	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6135	242501	3	2	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6136	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6137	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6138	242501	3	16	6	1	{1,3,5,7,9,11,13,15}	Iн
6139	242501	3	10	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6140	242501	3	10	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6141	242501	3	7	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6142	242501	3	9	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6143	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6144	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6145	242501	3	21	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6146	242501	3	1	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6147	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
6148	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
6149	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6150	242501	3	2	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6151	242501	3	91	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6152	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6153	242501	3	135	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6154	242501	3	0	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6155	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6156	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6157	242501	3	16	6	1	{1,3,5,7,9,11,13,15}	Iн
6158	242501	3	16	6	2	{2,4,6,8,10,12,14,16}	IIн
6159	242501	3	16	6	3	{2,4,6,8,10,12,14,16}	IIн
6160	242501	3	16	6	4	{2,4,6,8,10,12,14,16}	IIн
6161	242501	3	16	6	5	{2,4,6,8,10,12,14,16}	IIн
6162	242501	3	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6163	242501	3	95	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6164	242501	3	21	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6165	242501	3	96	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6166	242501	3	97	2	1	{1,3,5,7,9,11,13,15}	Iн
6167	242501	3	97	2	1	{2,4,6,8,10,12,14,16}	IIн
6168	242501	3	96	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6169	242501	3	96	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6170	242501	3	98	2	4	{2,4,6,8,10,12,14,16}	IIн
6171	242501	3	98	2	5	{2,4,6,8,10,12,14,16}	IIн
6172	242501	3	9	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6173	242501	3	8	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6174	242501	3	96	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6175	242501	3	21	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6176	242501	3	17	3	5	{2,4,6,8,10,12,14,16}	IIн
6177	242501	3	112	4	2	{2,4,6,8,10,12,14,16}	IIн
6178	242501	3	112	4	3	{2,4,6,8,10,12,14,16}	IIн
6179	242501	3	100	4	4	{1,3,5,7,9,11,13,15}	Iн
6180	242501	3	100	4	5	{1,3,5,7,9,11,13,15}	Iн
6181	242501	3	18	5	3	{1,3,5,7,9,11,13,15}	Iн
6182	242501	3	98	5	4	{1,3,5,7,9,11,13,15}	Iн
6183	242501	3	17	5	4	{2,4,6,8,10,12,14,16}	IIн
6184	242501	3	18	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6185	242501	3	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6186	242501	3	21	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6187	242501	3	96	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6188	242501	3	17	2	1	{1,3,5,7,9,11,13,15}	Iн
6189	242501	3	97	2	1	{2,4,6,8,10,12,14,16}	IIн
6190	242501	3	96	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6191	242501	3	8	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6192	242501	3	97	2	4	{1,3,5,7,9,11,13,15}	Iн
6193	242501	3	98	2	4	{2,4,6,8,10,12,14,16}	IIн
6194	242501	3	98	2	5	{1,3,5,7,9,11,13,15}	Iн
6195	242501	3	9	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6196	242501	3	95	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6197	242501	3	96	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6198	242501	3	21	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6199	242501	3	17	3	5	{2,4,6,8,10,12,14,16}	IIн
6200	242501	3	112	4	2	{2,4,6,8,10,12,14,16}	IIн
6201	242501	3	112	4	3	{2,4,6,8,10,12,14,16}	IIн
6202	242501	3	100	4	4	{1,3,5,7,9,11,13,15}	Iн
6203	242501	3	100	4	5	{1,3,5,7,9,11,13,15}	Iн
6204	242501	3	113	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6205	242501	3	18	5	3	{1,3,5,7,9,11,13,15}	Iн
6206	242501	3	18	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6207	242501	3	98	5	5	{1,3,5,7,9,11,13,15}	Iн
6208	242501	3	136	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6209	242501	3	136	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6210	242501	3	136	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6211	242501	3	136	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6212	242501	3	26	2	2	{2,4,6,8,10,12,14,16}	IIн
6213	242501	3	65	2	3	{1,3,5,7,9,11,13,15}	Iн
6214	242501	3	26	2	3	{2,4,6,8,10,12,14,16}	IIн
6215	242501	3	102	2	4	{1,3,5,7,9,11,13,15}	Iн
6216	242501	3	114	2	5	{1,3,5,7,9,11,13,15}	Iн
6217	242501	3	65	2	5	{2,4,6,8,10,12,14,16}	IIн
6218	242501	3	26	2	6	{1,3,5,7,9,11,13,15}	Iн
6219	242501	3	65	2	6	{2,4,6,8,10,12,14,16}	IIн
6220	242501	3	33	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6221	242501	3	33	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6222	242501	3	27	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6223	242501	3	65	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6224	242501	3	103	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6225	242501	3	42	4	1	{1,3,5,7,9,11,13,15}	Iн
6226	242501	3	42	4	2	{1,3,5,7,9,11,13,15}	Iн
6227	242501	3	42	4	3	{1,3,5,7,9,11,13,15}	Iн
6228	242501	3	42	4	1	{2,4,6,8,10,12,14,16}	IIн
6229	242501	3	42	4	2	{2,4,6,8,10,12,14,16}	IIн
6230	242501	3	42	4	3	{2,4,6,8,10,12,14,16}	IIн
6231	242501	3	42	4	4	{2,4,6,8,10,12,14,16}	IIн
6232	242501	3	42	4	5	{2,4,6,8,10,12,14,16}	IIн
6233	242501	3	104	4	4	{1,3,5,7,9,11,13,15}	Iн
6234	242501	3	24	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6235	242501	3	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6236	242501	3	31	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6237	242501	3	24	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6238	242501	3	104	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6239	242501	3	102	6	1	{1,3,5,7,9,11,13,15}	Iн
6240	242501	3	102	6	1	{2,4,6,8,10,12,14,16}	IIн
6241	242501	3	137	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6242	242501	3	137	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6243	242501	3	137	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6244	242501	3	137	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6245	242501	3	26	2	2	{2,4,6,8,10,12,14,16}	IIн
6246	242501	3	65	2	3	{1,3,5,7,9,11,13,15}	Iн
6247	242501	3	26	2	3	{2,4,6,8,10,12,14,16}	IIн
6248	242501	3	102	2	4	{2,4,6,8,10,12,14,16}	IIн
6249	242501	3	114	2	5	{1,3,5,7,9,11,13,15}	Iн
6250	242501	3	65	2	5	{2,4,6,8,10,12,14,16}	IIн
6251	242501	3	26	2	6	{1,3,5,7,9,11,13,15}	Iн
6252	242501	3	65	2	6	{2,4,6,8,10,12,14,16}	IIн
6253	242501	3	33	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6254	242501	3	33	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6255	242501	3	27	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6256	242501	3	65	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6257	242501	3	103	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6258	242501	3	42	4	1	{1,3,5,7,9,11,13,15}	Iн
6259	242501	3	42	4	2	{1,3,5,7,9,11,13,15}	Iн
6260	242501	3	42	4	3	{1,3,5,7,9,11,13,15}	Iн
6261	242501	3	42	4	1	{2,4,6,8,10,12,14,16}	IIн
6262	242501	3	42	4	2	{2,4,6,8,10,12,14,16}	IIн
6263	242501	3	42	4	3	{2,4,6,8,10,12,14,16}	IIн
6264	242501	3	42	4	4	{2,4,6,8,10,12,14,16}	IIн
6265	242501	3	42	4	5	{2,4,6,8,10,12,14,16}	IIн
6266	242501	3	104	4	4	{1,3,5,7,9,11,13,15}	Iн
6267	242501	3	24	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6268	242501	3	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6269	242501	3	24	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6270	242501	3	104	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6271	242501	3	31	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6272	242501	3	102	6	1	{1,3,5,7,9,11,13,15}	Iн
6273	242501	3	102	6	1	{2,4,6,8,10,12,14,16}	IIн
6274	242501	3	138	1	3	{5,6,7,8}	5-8
6275	242501	3	105	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6276	242501	3	105	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6277	242501	3	136	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6278	242501	3	136	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6279	242501	3	136	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6280	242501	3	136	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6281	242501	3	33	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6282	242501	3	33	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6283	242501	3	27	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6284	242501	3	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6285	242501	3	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6286	242501	3	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6287	242501	3	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6288	242501	3	42	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6289	242501	3	138	1	3	{5,6,7,8}	5-8
6290	242501	3	105	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6291	242501	3	105	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6292	242501	3	136	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6293	242501	3	136	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6294	242501	3	136	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6295	242501	3	136	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6296	242501	3	33	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6297	242501	3	33	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6298	242501	3	27	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6299	242501	3	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6300	242501	3	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6301	242501	3	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6302	242501	3	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6303	242501	3	42	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6304	242501	3	42	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6305	242501	3	42	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6306	242501	3	42	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6307	242501	3	42	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6308	242501	3	42	1	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6309	242501	3	117	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6310	242501	3	118	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6311	242501	3	118	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6312	242501	3	117	2	4	{3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6313	242501	3	120	3	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6314	242501	3	121	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6315	242501	3	123	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6316	242501	3	42	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6317	242501	3	42	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6318	242501	3	42	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6319	242501	3	42	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6320	242501	3	42	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6321	242501	3	42	5	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6322	242501	3	42	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6323	242501	3	42	5	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6324	242501	3	42	5	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6325	242501	3	42	5	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6326	242501	3	87	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6327	242501	3	87	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6328	242501	3	87	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6329	242501	3	87	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6330	242501	3	129	1	5	{2,4,6,8,10,12,14,16}	IIн
6331	242501	3	87	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6332	242501	3	87	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6333	242501	3	87	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6334	242501	3	87	2	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6335	242501	3	87	2	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6336	242501	3	130	3	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6337	242501	3	129	3	3	{2,4,6,8,10,12,14,16}	IIн
6338	242501	3	131	3	4	{3,5,7,9,11,13,15,17}	Iн
6339	242501	3	129	3	4	{2,4,6,8,10,12,14,16}	IIн
6340	242501	3	131	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6341	242501	3	123	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6342	242501	3	87	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6343	242501	3	87	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6344	242501	3	87	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6345	242501	3	87	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6346	242501	3	87	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6347	242501	3	132	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6348	242501	3	132	5	5	{3,5,7,9,11,13,15,17}	Iн
6349	242501	3	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6350	242501	3	124	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6351	242501	3	16	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6352	242501	3	16	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6353	242501	3	9	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6354	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6355	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6356	242501	3	7	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6357	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
6358	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
6359	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6360	242501	3	91	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6361	242501	3	2	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6362	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6363	242501	3	1	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6364	242501	3	10	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6365	242501	3	11	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6366	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6367	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6368	242501	3	125	6	1	{1,3,5,7,9,11,13,15}	Iн
6369	242501	3	125	6	1	{1,3,5,7,9,11,13,15}	Iн
6370	242501	3	10	6	2	{1,3,5,7,9,11,13,15}	Iн
6371	242501	3	10	6	3	{1,3,5,7,9,11,13,15}	Iн
6372	242501	3	124	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6373	242501	3	1	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6374	242501	3	2	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6375	242501	3	7	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6376	242501	3	21	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6377	242501	3	9	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6378	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6379	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6380	242501	3	91	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6381	242501	3	0	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6382	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
6383	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
6384	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6385	242501	3	16	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6386	242501	3	16	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6387	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6388	242501	3	10	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6389	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6390	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6391	242501	3	10	5	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6392	242501	3	16	6	1	{1,3,5,7,9,11,13,15}	Iн
6393	242501	3	16	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6394	242501	3	16	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6395	242501	3	10	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6396	242501	3	10	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6397	242501	3	1	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6398	242501	3	21	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6399	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6400	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6401	242501	3	124	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6402	242501	3	7	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6403	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
6404	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
6405	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6406	242501	3	9	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6407	242501	3	91	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6408	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6409	242501	3	0	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6410	242501	3	2	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6411	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6412	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6413	242501	3	16	6	1	{1,3,5,7,9,11,13,15}	Iн
6414	242501	3	10	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6415	242501	3	10	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6416	242501	3	7	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6417	242501	3	9	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6418	242501	3	1	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6419	242501	3	7	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6420	242501	3	21	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6421	242501	3	1	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6422	242501	3	10	3	5	{2,4,6,8,10,12,14,16}	IIн
6423	242501	3	91	4	2	{1,3,5,7,9,11,13,15}	Iн
6424	242501	3	2	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6425	242501	3	2	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6426	242501	3	91	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6427	242501	3	111	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6428	242501	3	124	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6429	242501	3	0	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6430	242501	3	11	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6431	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6432	242501	3	16	6	1	{1,3,5,7,9,11,13,15}	Iн
6433	242501	3	16	6	2	{2,4,6,8,10,12,14,16}	IIн
6434	242501	3	16	6	3	{2,4,6,8,10,12,14,16}	IIн
6435	242501	3	16	6	4	{2,4,6,8,10,12,14,16}	IIн
6436	242501	3	16	6	5	{2,4,6,8,10,12,14,16}	IIн
6437	242501	3	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6438	242501	3	95	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6439	242501	3	21	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6440	242501	3	96	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6441	242501	3	97	2	1	{1,3,5,7,9,11,13,15}	Iн
6442	242501	3	97	2	1	{2,4,6,8,10,12,14,16}	IIн
6443	242501	3	96	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6444	242501	3	96	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6445	242501	3	98	2	4	{2,4,6,8,10,12,14,16}	IIн
6446	242501	3	98	2	5	{2,4,6,8,10,12,14,16}	IIн
6447	242501	3	9	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6448	242501	3	8	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6449	242501	3	96	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6450	242501	3	21	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6451	242501	3	17	3	5	{2,4,6,8,10,12,14,16}	IIн
6452	242501	3	112	4	2	{2,4,6,8,10,12,14,16}	IIн
6453	242501	3	112	4	3	{2,4,6,8,10,12,14,16}	IIн
6454	242501	3	100	4	4	{1,3,5,7,9,11,13,15}	Iн
6455	242501	3	100	4	5	{1,3,5,7,9,11,13,15}	Iн
6456	242501	3	18	5	3	{1,3,5,7,9,11,13,15}	Iн
6457	242501	3	98	5	4	{1,3,5,7,9,11,13,15}	Iн
6458	242501	3	17	5	4	{2,4,6,8,10,12,14,16}	IIн
6459	242501	3	18	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6460	242501	3	15	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6461	242501	3	21	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6462	242501	3	96	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6463	242501	3	17	2	1	{1,3,5,7,9,11,13,15}	Iн
6464	242501	3	97	2	1	{2,4,6,8,10,12,14,16}	IIн
6465	242501	3	96	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6466	242501	3	8	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6467	242501	3	97	2	4	{1,3,5,7,9,11,13,15}	Iн
6468	242501	3	98	2	4	{2,4,6,8,10,12,14,16}	IIн
6469	242501	3	98	2	5	{1,3,5,7,9,11,13,15}	Iн
6470	242501	3	9	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6471	242501	3	95	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6472	242501	3	96	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6473	242501	3	21	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6474	242501	3	17	3	5	{2,4,6,8,10,12,14,16}	IIн
6475	242501	3	112	4	2	{2,4,6,8,10,12,14,16}	IIн
6476	242501	3	112	4	3	{2,4,6,8,10,12,14,16}	IIн
6477	242501	3	100	4	4	{1,3,5,7,9,11,13,15}	Iн
6478	242501	3	100	4	5	{1,3,5,7,9,11,13,15}	Iн
6479	242501	3	113	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6480	242501	3	18	5	3	{1,3,5,7,9,11,13,15}	Iн
6481	242501	3	18	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6482	242501	3	98	5	5	{1,3,5,7,9,11,13,15}	Iн
6483	242501	3	136	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6484	242501	3	136	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6485	242501	3	136	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6486	242501	3	136	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6487	242501	3	26	2	2	{2,4,6,8,10,12,14,16}	IIн
6488	242501	3	65	2	3	{1,3,5,7,9,11,13,15}	Iн
6489	242501	3	26	2	3	{2,4,6,8,10,12,14,16}	IIн
6490	242501	3	102	2	4	{1,3,5,7,9,11,13,15}	Iн
6491	242501	3	114	2	5	{1,3,5,7,9,11,13,15}	Iн
6492	242501	3	65	2	5	{2,4,6,8,10,12,14,16}	IIн
6493	242501	3	26	2	6	{1,3,5,7,9,11,13,15}	Iн
6494	242501	3	65	2	6	{2,4,6,8,10,12,14,16}	IIн
6495	242501	3	33	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6496	242501	3	33	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6497	242501	3	27	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6498	242501	3	65	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6499	242501	3	103	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6500	242501	3	42	4	1	{1,3,5,7,9,11,13,15}	Iн
6501	242501	3	42	4	2	{1,3,5,7,9,11,13,15}	Iн
6502	242501	3	42	4	3	{1,3,5,7,9,11,13,15}	Iн
6503	242501	3	42	4	1	{2,4,6,8,10,12,14,16}	IIн
6504	242501	3	42	4	2	{2,4,6,8,10,12,14,16}	IIн
6505	242501	3	42	4	3	{2,4,6,8,10,12,14,16}	IIн
6506	242501	3	42	4	4	{2,4,6,8,10,12,14,16}	IIн
6507	242501	3	42	4	5	{2,4,6,8,10,12,14,16}	IIн
6508	242501	3	104	4	4	{1,3,5,7,9,11,13,15}	Iн
6509	242501	3	24	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6510	242501	3	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6511	242501	3	31	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6512	242501	3	24	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6513	242501	3	104	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6514	242501	3	102	6	1	{1,3,5,7,9,11,13,15}	Iн
6515	242501	3	102	6	1	{2,4,6,8,10,12,14,16}	IIн
6516	242501	3	137	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6517	242501	3	137	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6518	242501	3	137	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6519	242501	3	137	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6520	242501	3	26	2	2	{2,4,6,8,10,12,14,16}	IIн
6521	242501	3	65	2	3	{1,3,5,7,9,11,13,15}	Iн
6522	242501	3	26	2	3	{2,4,6,8,10,12,14,16}	IIн
6523	242501	3	102	2	4	{2,4,6,8,10,12,14,16}	IIн
6524	242501	3	114	2	5	{1,3,5,7,9,11,13,15}	Iн
6525	242501	3	65	2	5	{2,4,6,8,10,12,14,16}	IIн
6526	242501	3	26	2	6	{1,3,5,7,9,11,13,15}	Iн
6527	242501	3	65	2	6	{2,4,6,8,10,12,14,16}	IIн
6528	242501	3	33	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6529	242501	3	33	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6530	242501	3	27	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6531	242501	3	65	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6532	242501	3	103	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6533	242501	3	42	4	1	{1,3,5,7,9,11,13,15}	Iн
6534	242501	3	42	4	2	{1,3,5,7,9,11,13,15}	Iн
6535	242501	3	42	4	3	{1,3,5,7,9,11,13,15}	Iн
6536	242501	3	42	4	1	{2,4,6,8,10,12,14,16}	IIн
6537	242501	3	42	4	2	{2,4,6,8,10,12,14,16}	IIн
6538	242501	3	42	4	3	{2,4,6,8,10,12,14,16}	IIн
6539	242501	3	42	4	4	{2,4,6,8,10,12,14,16}	IIн
6540	242501	3	42	4	5	{2,4,6,8,10,12,14,16}	IIн
6541	242501	3	104	4	4	{1,3,5,7,9,11,13,15}	Iн
6542	242501	3	24	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6543	242501	3	31	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6544	242501	3	24	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6545	242501	3	104	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6546	242501	3	31	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6547	242501	3	102	6	1	{1,3,5,7,9,11,13,15}	Iн
6548	242501	3	102	6	1	{2,4,6,8,10,12,14,16}	IIн
6549	242501	3	138	1	3	{5,6,7,8}	5-8
6550	242501	3	105	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6551	242501	3	105	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6552	242501	3	136	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6553	242501	3	136	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6554	242501	3	136	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6555	242501	3	136	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6556	242501	3	33	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6557	242501	3	33	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6558	242501	3	27	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6559	242501	3	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6560	242501	3	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6561	242501	3	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6562	242501	3	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6563	242501	3	42	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6564	242501	3	138	1	3	{5,6,7,8}	5-8
6565	242501	3	105	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6566	242501	3	105	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6567	242501	3	136	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6568	242501	3	136	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6569	242501	3	136	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6570	242501	3	136	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6571	242501	3	33	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6572	242501	3	33	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6573	242501	3	27	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6574	242501	3	42	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6575	242501	3	42	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6576	242501	3	42	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6577	242501	3	42	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6578	242501	3	42	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
6579	242501	3	42	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6580	242501	3	42	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6581	242501	3	42	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6582	242501	3	42	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6583	242501	3	42	1	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6584	242501	3	117	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6585	242501	3	118	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6586	242501	3	118	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6587	242501	3	117	2	4	{3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6588	242501	3	120	3	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6589	242501	3	121	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6590	242501	3	123	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6591	242501	3	42	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6592	242501	3	42	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6593	242501	3	42	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6594	242501	3	42	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6595	242501	3	42	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6596	242501	3	42	5	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6597	242501	3	42	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6598	242501	3	42	5	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6599	242501	3	42	5	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6600	242501	3	42	5	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6601	242501	3	87	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6602	242501	3	87	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6603	242501	3	87	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6604	242501	3	87	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6605	242501	3	129	1	5	{2,4,6,8,10,12,14,16}	IIн
6606	242501	3	87	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6607	242501	3	87	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6608	242501	3	87	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6609	242501	3	87	2	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6610	242501	3	87	2	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6611	242501	3	130	3	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6612	242501	3	129	3	3	{2,4,6,8,10,12,14,16}	IIн
6613	242501	3	131	3	4	{3,5,7,9,11,13,15,17}	Iн
6614	242501	3	129	3	4	{2,4,6,8,10,12,14,16}	IIн
6615	242501	3	131	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6616	242501	3	123	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6617	242501	3	87	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6618	242501	3	87	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6619	242501	3	87	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6620	242501	3	87	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6621	242501	3	87	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6622	242501	3	132	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
6623	242501	3	132	5	5	{3,5,7,9,11,13,15,17}	Iн
\.


--
-- TOC entry 4936 (class 0 OID 142601)
-- Dependencies: 235
-- Data for Name: sc_rasp7_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp7_groups (id, rasp7_id, group_id, subgroup) FROM stdin;
4222	4221	0	0
4223	4222	0	0
4224	4223	0	0
4225	4224	0	1
4226	4225	0	0
4227	4226	0	0
4228	4227	0	0
4229	4228	0	0
4230	4229	0	0
4231	4230	0	0
4232	4231	0	0
4233	4232	0	0
4234	4233	0	0
4235	4234	0	0
4236	4235	0	0
4237	4236	0	2
4238	4237	0	0
4239	4238	0	0
4240	4239	0	1
4241	4240	0	0
4242	4241	0	0
4243	4242	0	0
4244	4243	0	2
4245	4244	0	0
4246	4245	1	0
4247	4246	1	0
4248	4247	1	0
4249	4248	1	0
4250	4249	1	0
4251	4250	1	2
4252	4251	1	0
4253	4252	1	0
4254	4253	1	0
4255	4254	1	0
4256	4255	1	0
4257	4256	1	0
4258	4257	1	0
4259	4258	1	0
4260	4259	1	0
4261	4260	1	0
4262	4261	1	1
4263	4262	1	0
4264	4263	1	0
4265	4264	1	1
4266	4265	1	0
4267	4266	1	0
4268	4267	1	0
4269	4268	1	2
4270	4269	1	0
4271	4270	2	0
4272	4271	2	0
4273	4272	2	0
4274	4273	2	0
4275	4274	2	2
4276	4275	2	1
4277	4276	2	0
4278	4277	2	0
4279	4278	2	0
4280	4279	2	0
4281	4280	2	0
4282	4281	2	0
4283	4282	2	0
4284	4283	2	0
4285	4284	2	0
4286	4285	2	0
4287	4286	2	0
4288	4287	2	0
4289	4288	2	0
4290	4289	2	0
4291	4290	2	0
4292	4291	2	1
4293	4292	2	2
4294	4293	2	0
4295	4294	3	0
4296	4295	3	0
4297	4296	3	0
4298	4297	3	0
4299	4298	3	0
4300	4299	3	0
4301	4300	3	0
4302	4301	3	2
4303	4302	3	1
4304	4303	3	0
4305	4304	3	0
4306	4305	3	0
4307	4306	3	0
4308	4307	3	0
4309	4308	3	0
4310	4309	3	0
4311	4310	3	0
4312	4311	3	0
4313	4312	3	0
4314	4313	3	0
4315	4314	3	0
4316	4315	3	1
4317	4316	3	2
4318	4317	3	0
4319	4318	4	0
4320	4319	4	0
4321	4320	4	0
4322	4321	4	1
4323	4322	4	0
4324	4323	4	0
4325	4324	4	0
4326	4325	4	0
4327	4326	4	0
4328	4327	4	0
4329	4328	4	0
4330	4329	4	0
4331	4330	4	0
4332	4331	4	0
4333	4332	4	0
4334	4333	4	0
4335	4334	4	0
4336	4335	4	0
4337	4336	4	0
4338	4337	4	2
4339	4338	4	0
4340	4339	5	0
4341	4340	5	0
4342	4341	5	0
4343	4342	5	0
4344	4343	5	0
4345	4344	5	0
4346	4345	5	0
4347	4346	5	0
4348	4347	5	0
4349	4348	5	0
4350	4349	5	0
4351	4350	5	0
4352	4351	5	0
4353	4352	5	0
4354	4353	5	0
4355	4354	5	2
4356	4355	5	0
4357	4356	5	0
4358	4357	5	0
4359	4358	5	1
4360	4359	5	0
4361	4360	6	0
4362	4361	6	0
4363	4362	6	0
4364	4363	6	0
4365	4364	6	0
4366	4365	6	0
4367	4366	6	0
4368	4367	6	0
4369	4368	6	0
4370	4369	6	0
4371	4370	6	0
4372	4371	6	0
4373	4372	6	0
4374	4373	6	0
4375	4374	6	0
4376	4375	6	0
4377	4376	6	0
4378	4377	6	0
4379	4378	6	0
4380	4379	6	0
4381	4380	6	0
4382	4381	6	0
4383	4382	6	0
4384	4383	7	0
4385	4384	7	0
4386	4385	7	0
4387	4386	7	0
4388	4387	7	0
4389	4388	7	0
4390	4389	7	0
4391	4390	7	0
4392	4391	7	0
4393	4392	7	0
4394	4393	7	0
4395	4394	7	0
4396	4395	7	0
4397	4396	7	0
4398	4397	7	0
4399	4398	7	0
4400	4399	7	0
4401	4400	7	0
4402	4401	7	0
4403	4402	7	0
4404	4403	7	0
4405	4404	7	0
4406	4405	7	0
4407	4406	8	0
4408	4407	8	0
4409	4408	8	0
4410	4409	8	0
4411	4410	8	0
4412	4411	8	0
4413	4412	8	0
4414	4413	8	0
4415	4414	8	0
4416	4415	8	0
4417	4416	8	0
4418	4417	8	0
4419	4418	8	0
4420	4419	8	0
4421	4420	8	0
4422	4421	8	0
4423	4422	8	0
4424	4423	8	0
4425	4424	8	0
4426	4425	8	0
4427	4426	8	0
4428	4427	8	0
4429	4428	8	0
4430	4429	8	0
4431	4430	8	0
4432	4431	8	0
4433	4432	8	0
4434	4433	8	0
4435	4434	8	0
4436	4435	8	0
4437	4436	8	0
4438	4437	9	0
4439	4438	9	0
4440	4439	9	0
4441	4440	9	0
4442	4441	9	0
4443	4442	9	0
4444	4443	9	0
4445	4444	9	0
4446	4445	9	0
4447	4446	9	0
4448	4447	9	0
4449	4448	9	0
4450	4449	9	0
4451	4450	9	0
4452	4451	9	0
4453	4452	9	0
4454	4453	9	0
4455	4454	9	0
4456	4455	9	0
4457	4456	9	0
4458	4457	9	0
4459	4458	9	0
4460	4459	9	0
4461	4460	9	0
4462	4461	9	0
4463	4462	9	0
4464	4463	9	0
4465	4464	9	0
4466	4465	9	0
4467	4466	9	0
4468	4467	10	0
4469	4468	10	0
4470	4469	10	0
4471	4470	10	0
4472	4471	10	0
4473	4472	10	0
4474	4473	10	0
4475	4474	10	0
4476	4475	10	0
4477	4476	10	0
4478	4477	10	0
4479	4478	10	0
4480	4479	10	0
4481	4480	10	0
4482	4481	10	0
4483	4482	10	0
4484	4483	10	0
4485	4484	10	0
4486	4485	10	0
4487	4486	10	0
4488	4487	10	0
4489	4488	10	0
4490	4489	10	0
4491	4490	11	0
4492	4491	11	0
4493	4492	11	0
4494	4493	11	0
4495	4494	11	0
4496	4495	11	0
4497	4496	11	0
4498	4497	11	0
4499	4498	11	0
4500	4499	11	0
4501	4500	11	0
4502	4501	11	0
4503	4502	11	0
4504	4503	11	0
4505	4504	11	0
4506	4505	11	0
4507	4506	11	0
4508	4507	11	0
4509	4508	11	0
4510	4509	11	0
4511	4510	11	0
4512	4511	11	0
4513	4512	0	0
4514	4513	0	0
4515	4514	0	0
4516	4515	0	0
4517	4516	0	0
4518	4517	0	0
4519	4518	0	0
4520	4519	0	0
4521	4520	0	0
4522	4521	0	0
4523	4522	0	0
4524	4523	0	0
4525	4524	0	0
4526	4525	0	0
4527	4526	0	0
4528	4527	0	0
4529	4528	0	0
4530	4529	0	0
4531	4530	0	0
4532	4531	0	0
4533	4532	0	0
4534	4533	0	0
4535	4534	0	0
4536	4535	1	1
4537	4536	1	2
4538	4537	1	0
4539	4538	1	0
4540	4539	1	0
4541	4540	1	0
4542	4541	1	0
4543	4542	1	0
4544	4543	1	0
4545	4544	1	0
4546	4545	1	0
4547	4546	1	0
4548	4547	1	0
4549	4548	1	0
4550	4549	1	0
4551	4550	1	0
4552	4551	1	0
4553	4552	1	0
4554	4553	1	0
4555	4554	2	0
4556	4555	2	0
4557	4556	2	0
4558	4557	2	0
4559	4558	2	0
4560	4559	2	0
4561	4560	2	0
4562	4561	2	0
4563	4562	2	0
4564	4563	2	0
4565	4564	2	1
4566	4565	2	2
4567	4566	2	0
4568	4567	2	0
4569	4568	2	0
4570	4569	2	0
4571	4570	2	0
4572	4571	2	0
4573	4572	2	0
4574	4573	2	0
4575	4574	2	0
4576	4575	2	0
4577	4576	2	0
4578	4577	3	0
4579	4578	3	0
4580	4579	3	0
4581	4580	3	0
4582	4581	3	0
4583	4582	3	0
4584	4583	3	0
4585	4584	3	0
4586	4585	3	0
4587	4586	3	0
4588	4587	3	0
4589	4588	3	0
4590	4589	3	0
4591	4590	3	0
4592	4591	3	0
4593	4592	3	0
4594	4593	3	0
4595	4594	4	0
4596	4595	4	0
4597	4596	4	0
4598	4597	4	0
4599	4598	4	0
4600	4599	4	0
4601	4600	4	0
4602	4601	4	0
4603	4602	4	0
4604	4603	4	0
4605	4604	4	0
4606	4605	4	0
4607	4606	4	0
4608	4607	4	0
4609	4608	4	0
4610	4609	4	0
4611	4610	4	0
4612	4611	4	0
4613	4612	4	0
4614	4613	4	0
4615	4614	4	0
4616	4615	4	0
4617	4616	4	0
4618	4617	5	0
4619	4618	5	0
4620	4619	5	0
4621	4620	5	0
4622	4621	5	0
4623	4622	5	0
4624	4623	5	0
4625	4624	5	0
4626	4625	5	0
4627	4626	5	0
4628	4627	5	0
4629	4628	5	0
4630	4629	5	0
4631	4630	5	0
4632	4631	5	0
4633	4632	5	0
4634	4633	5	0
4635	4634	5	0
4636	4635	5	0
4637	4636	5	0
4638	4637	5	0
4639	4638	5	0
4640	4639	6	0
4641	4640	6	0
4642	4641	6	0
4643	4642	6	0
4644	4643	6	0
4645	4644	6	0
4646	4645	6	0
4647	4646	6	0
4648	4647	6	0
4649	4648	6	0
4650	4649	6	0
4651	4650	6	0
4652	4651	6	0
4653	4652	6	0
4654	4653	6	0
4655	4654	6	0
4656	4655	6	0
4657	4656	6	0
4658	4657	6	0
4659	4658	6	0
4660	4659	6	0
4661	4660	6	0
4662	4661	6	0
4663	4662	6	0
4664	4663	6	0
4665	4664	6	0
4666	4665	6	0
4667	4666	7	0
4668	4667	7	0
4669	4668	7	0
4670	4669	7	0
4671	4670	7	0
4672	4671	7	0
4673	4672	7	0
4674	4673	7	0
4675	4674	7	0
4676	4675	7	0
4677	4676	7	0
4678	4677	7	0
4679	4678	7	0
4680	4679	7	0
4681	4680	7	0
4682	4681	7	0
4683	4682	7	0
4684	4683	7	0
4685	4684	7	0
4686	4685	7	0
4687	4686	7	0
4688	4687	7	0
4689	4688	7	0
4690	4689	7	0
4691	4690	7	0
4692	4691	7	0
4693	4692	8	0
4694	4693	8	0
4695	4694	8	0
4696	4695	8	0
4697	4696	8	0
4698	4697	8	0
4699	4698	8	0
4700	4699	8	0
4701	4700	8	0
4702	4701	8	0
4703	4702	8	0
4704	4703	8	0
4705	4704	8	0
4706	4705	8	0
4707	4706	8	0
4708	4707	8	0
4709	4708	8	0
4710	4709	8	0
4711	4710	8	0
4712	4711	9	0
4713	4712	9	0
4714	4713	9	0
4715	4714	9	0
4716	4715	9	0
4717	4716	9	0
4718	4717	9	0
4719	4718	9	0
4720	4719	9	0
4721	4720	9	0
4722	4721	9	0
4723	4722	9	0
4724	4723	9	0
4725	4724	9	0
4726	4725	9	0
4727	4726	9	0
4728	4727	9	0
4729	4728	9	0
4730	4729	9	0
4731	4730	10	0
4732	4731	10	0
4733	4732	10	0
4734	4733	10	0
4735	4734	10	0
4736	4735	10	0
4737	4736	10	0
4738	4737	10	0
4739	4738	10	0
4740	4739	10	0
4741	4740	10	0
4742	4741	10	0
4743	4742	10	0
4744	4743	10	0
4745	4744	10	0
4746	4745	10	0
4747	4746	10	0
4748	4747	10	0
4749	4748	10	0
4750	4749	10	0
4751	4750	10	0
4752	4751	10	0
4753	4752	10	0
4754	4753	10	0
4755	4754	10	0
4756	4755	10	0
4757	4756	10	0
4758	4757	10	0
4759	4758	10	0
4760	4759	11	0
4761	4760	11	0
4762	4761	11	0
4763	4762	11	0
4764	4763	11	0
4765	4764	11	0
4766	4765	11	0
4767	4766	11	0
4768	4767	11	0
4769	4768	11	0
4770	4769	11	0
4771	4770	11	0
4772	4771	11	0
4773	4772	11	0
4774	4773	11	0
4775	4774	11	0
4776	4775	11	0
4777	4776	11	0
4778	4777	11	0
4779	4778	11	0
4780	4779	11	0
4781	4780	11	0
4782	4781	11	0
4783	4782	11	0
4784	4783	11	0
4785	4784	11	0
4786	4785	11	0
4787	4786	11	0
4788	4787	11	0
4789	4788	11	0
4790	4789	11	0
4791	4790	11	0
4792	4791	11	0
4793	4792	11	0
4794	4793	11	0
4795	4794	11	0
4796	4795	0	0
4797	4796	0	0
4798	4797	0	2
4799	4798	0	2
4800	4799	0	0
4801	4800	0	0
4802	4801	0	0
4803	4802	0	0
4804	4803	0	0
4805	4804	0	0
4806	4805	0	0
4807	4806	0	0
4808	4807	0	0
4809	4808	0	0
4810	4809	0	0
4811	4810	0	1
4812	4811	0	0
4813	4812	0	0
4814	4813	0	0
4815	4814	0	0
4816	4815	0	2
4817	4816	0	2
4818	4817	1	1
4819	4818	1	2
4820	4819	1	0
4821	4820	1	0
4822	4821	1	0
4823	4822	1	0
4824	4823	1	0
4825	4824	1	0
4826	4825	1	0
4827	4826	1	0
4828	4827	1	0
4829	4828	1	0
4830	4829	1	0
4831	4830	1	0
4832	4831	1	1
4833	4832	1	2
4834	4833	1	0
4835	4834	1	1
4836	4835	1	0
4837	4836	1	0
4838	4837	1	2
4839	4838	1	0
4840	4839	2	1
4841	4840	2	2
4842	4841	2	1
4843	4842	2	2
4844	4843	2	0
4845	4844	2	0
4846	4845	2	0
4847	4846	2	0
4848	4847	2	1
4849	4848	2	2
4850	4849	2	0
4851	4850	2	0
4852	4851	2	0
4853	4852	2	0
4854	4853	2	0
4855	4854	2	0
4856	4855	2	0
4857	4856	2	0
4858	4857	2	0
4859	4858	2	0
4860	4859	2	0
4861	4860	2	0
4862	4861	3	1
4863	4862	3	2
4864	4863	3	0
4865	4864	3	0
4866	4865	3	0
4867	4866	3	0
4868	4867	3	0
4869	4868	3	0
4870	4869	3	0
4871	4870	3	0
4872	4871	3	0
4873	4872	3	0
4874	4873	3	0
4875	4874	3	0
4876	4875	3	1
4877	4876	3	2
4878	4877	3	0
4879	4878	3	0
4880	4879	3	0
4881	4880	3	0
4882	4881	3	1
4883	4882	3	1
4884	4883	3	2
4885	4884	3	2
4886	4885	4	0
4887	4886	4	0
4888	4887	4	0
4889	4888	4	0
4890	4889	4	0
4891	4890	4	0
4892	4891	4	0
4893	4892	4	0
4894	4893	4	0
4895	4894	4	0
4896	4895	4	0
4897	4896	4	0
4898	4897	4	0
4899	4898	4	0
4900	4899	4	0
4901	4900	4	0
4902	4901	4	0
4903	4902	4	0
4904	4903	4	0
4905	4904	4	0
4906	4905	4	0
4907	4906	4	0
4908	4907	4	0
4909	4908	5	0
4910	4909	5	0
4911	4910	5	0
4912	4911	5	0
4913	4912	5	0
4914	4913	5	0
4915	4914	5	0
4916	4915	5	0
4917	4916	5	0
4918	4917	5	0
4919	4918	5	0
4920	4919	5	0
4921	4920	5	0
4922	4921	5	0
4923	4922	5	0
4924	4923	5	0
4925	4924	5	0
4926	4925	5	0
4927	4926	5	0
4928	4927	5	0
4929	4928	5	0
4930	4929	5	0
4931	4930	5	0
4932	4931	6	0
4933	4932	6	0
4934	4933	6	0
4935	4934	6	0
4936	4935	6	0
4937	4936	6	0
4938	4937	6	0
4939	4938	6	0
4940	4939	6	0
4941	4940	6	0
4942	4941	6	0
4943	4942	6	0
4944	4943	6	0
4945	4944	6	0
4946	4945	6	0
4947	4946	6	0
4948	4947	6	0
4949	4948	6	0
4950	4949	6	0
4951	4950	6	0
4952	4951	6	0
4953	4952	6	0
4954	4953	6	0
4955	4954	6	0
4956	4955	6	0
4957	4956	6	0
4958	4957	6	0
4959	4958	7	0
4960	4959	7	0
4961	4960	7	0
4962	4961	7	0
4963	4962	7	0
4964	4963	7	0
4965	4964	7	0
4966	4965	7	0
4967	4966	7	0
4968	4967	7	0
4969	4968	7	0
4970	4969	7	0
4971	4970	7	0
4972	4971	7	0
4973	4972	7	0
4974	4973	7	0
4975	4974	7	0
4976	4975	7	0
4977	4976	7	0
4978	4977	7	0
4979	4978	7	0
4980	4979	7	0
4981	4980	7	0
4982	4981	7	0
4983	4982	7	0
4984	4983	7	0
4985	4984	7	0
4986	4985	8	0
4987	4986	8	0
4988	4987	8	0
4989	4988	8	0
4990	4989	8	0
4991	4990	8	0
4992	4991	8	0
4993	4992	8	0
4994	4993	8	0
4995	4994	8	0
4996	4995	8	0
4997	4996	8	0
4998	4997	8	0
4999	4998	8	0
5000	4999	8	0
5001	5000	9	0
5002	5001	9	0
5003	5002	9	0
5004	5003	9	0
5005	5004	9	0
5006	5005	9	0
5007	5006	9	0
5008	5007	9	0
5009	5008	9	0
5010	5009	9	0
5011	5010	9	0
5012	5011	9	0
5013	5012	9	0
5014	5013	9	0
5015	5014	9	0
5016	5015	10	0
5017	5016	10	0
5018	5017	10	0
5019	5018	10	0
5020	5019	10	0
5021	5020	10	0
5022	5021	10	0
5023	5022	10	0
5024	5023	10	0
5025	5024	10	0
5026	5025	10	0
5027	5026	10	0
5028	5027	10	0
5029	5028	10	0
5030	5029	10	0
5031	5030	10	0
5032	5031	10	0
5033	5032	10	0
5034	5033	10	0
5035	5034	10	0
5036	5035	10	0
5037	5036	10	0
5038	5037	0	0
5039	5038	0	0
5040	5039	0	2
5041	5040	0	2
5042	5041	0	0
5043	5042	0	0
5044	5043	0	0
5045	5044	0	0
5046	5045	0	0
5047	5046	0	0
5048	5047	0	0
5049	5048	0	0
5050	5049	0	0
5051	5050	0	0
5052	5051	0	0
5053	5052	0	1
5054	5053	0	0
5055	5054	0	0
5056	5055	0	0
5057	5056	0	0
5058	5057	0	2
5059	5058	0	2
5060	5059	1	1
5061	5060	1	2
5062	5061	1	0
5063	5062	1	0
5064	5063	1	0
5065	5064	1	0
5066	5065	1	0
5067	5066	1	0
5068	5067	1	0
5069	5068	1	0
5070	5069	1	0
5071	5070	1	0
5072	5071	1	0
5073	5072	1	0
5074	5073	1	1
5075	5074	1	2
5076	5075	1	0
5077	5076	1	1
5078	5077	1	0
5079	5078	1	0
5080	5079	1	2
5081	5080	1	0
5082	5081	2	1
5083	5082	2	2
5084	5083	2	1
5085	5084	2	2
5086	5085	2	0
5087	5086	2	0
5088	5087	2	0
5089	5088	2	0
5090	5089	2	1
5091	5090	2	2
5092	5091	2	0
5093	5092	2	0
5094	5093	2	0
5095	5094	2	0
5096	5095	2	0
5097	5096	2	0
5098	5097	2	0
5099	5098	2	0
5100	5099	2	0
5101	5100	2	0
5102	5101	2	0
5103	5102	2	0
5104	5103	3	1
5105	5104	3	2
5106	5105	3	0
5107	5106	3	0
5108	5107	3	0
5109	5108	3	0
5110	5109	3	0
5111	5110	3	0
5112	5111	3	0
5113	5112	3	0
5114	5113	3	0
5115	5114	3	0
5116	5115	3	0
5117	5116	3	0
5118	5117	3	1
5119	5118	3	2
5120	5119	3	0
5121	5120	3	0
5122	5121	3	0
5123	5122	3	0
5124	5123	3	1
5125	5124	3	1
5126	5125	3	2
5127	5126	3	2
5128	5127	4	0
5129	5128	4	0
5130	5129	4	0
5131	5130	4	0
5132	5131	4	0
5133	5132	4	0
5134	5133	4	0
5135	5134	4	0
5136	5135	4	0
5137	5136	4	0
5138	5137	4	0
5139	5138	4	0
5140	5139	4	0
5141	5140	4	0
5142	5141	4	0
5143	5142	4	0
5144	5143	4	0
5145	5144	4	0
5146	5145	4	0
5147	5146	4	0
5148	5147	4	0
5149	5148	4	0
5150	5149	4	0
5151	5150	5	0
5152	5151	5	0
5153	5152	5	0
5154	5153	5	0
5155	5154	5	0
5156	5155	5	0
5157	5156	5	0
5158	5157	5	0
5159	5158	5	0
5160	5159	5	0
5161	5160	5	0
5162	5161	5	0
5163	5162	5	0
5164	5163	5	0
5165	5164	5	0
5166	5165	5	0
5167	5166	5	0
5168	5167	5	0
5169	5168	5	0
5170	5169	5	0
5171	5170	5	0
5172	5171	5	0
5173	5172	5	0
5174	5173	6	0
5175	5174	6	0
5176	5175	6	0
5177	5176	6	0
5178	5177	6	0
5179	5178	6	0
5180	5179	6	0
5181	5180	6	0
5182	5181	6	0
5183	5182	6	0
5184	5183	6	0
5185	5184	6	0
5186	5185	6	0
5187	5186	6	0
5188	5187	6	0
5189	5188	6	0
5190	5189	6	0
5191	5190	6	0
5192	5191	6	0
5193	5192	6	0
5194	5193	6	0
5195	5194	6	0
5196	5195	6	0
5197	5196	6	0
5198	5197	6	0
5199	5198	6	0
5200	5199	6	0
5201	5200	7	0
5202	5201	7	0
5203	5202	7	0
5204	5203	7	0
5205	5204	7	0
5206	5205	7	0
5207	5206	7	0
5208	5207	7	0
5209	5208	7	0
5210	5209	7	0
5211	5210	7	0
5212	5211	7	0
5213	5212	7	0
5214	5213	7	0
5215	5214	7	0
5216	5215	7	0
5217	5216	7	0
5218	5217	7	0
5219	5218	7	0
5220	5219	7	0
5221	5220	7	0
5222	5221	7	0
5223	5222	7	0
5224	5223	7	0
5225	5224	7	0
5226	5225	7	0
5227	5226	7	0
5228	5227	8	0
5229	5228	8	0
5230	5229	8	0
5231	5230	8	0
5232	5231	8	0
5233	5232	8	0
5234	5233	8	0
5235	5234	8	0
5236	5235	8	0
5237	5236	8	0
5238	5237	8	0
5239	5238	8	0
5240	5239	8	0
5241	5240	8	0
5242	5241	8	0
5243	5242	9	0
5244	5243	9	0
5245	5244	9	0
5246	5245	9	0
5247	5246	9	0
5248	5247	9	0
5249	5248	9	0
5250	5249	9	0
5251	5250	9	0
5252	5251	9	0
5253	5252	9	0
5254	5253	9	0
5255	5254	9	0
5256	5255	9	0
5257	5256	9	0
5258	5257	10	0
5259	5258	10	0
5260	5259	10	0
5261	5260	10	0
5262	5261	10	0
5263	5262	10	0
5264	5263	10	0
5265	5264	10	0
5266	5265	10	0
5267	5266	10	0
5268	5267	10	0
5269	5268	10	0
5270	5269	10	0
5271	5270	10	0
5272	5271	10	0
5273	5272	10	0
5274	5273	10	0
5275	5274	10	0
5276	5275	10	0
5277	5276	10	0
5278	5277	10	0
5279	5278	10	0
5280	5279	0	0
5281	5280	0	0
5282	5281	0	1
5283	5282	0	2
5284	5283	0	0
5285	5284	0	0
5286	5285	0	0
5287	5286	0	0
5288	5287	0	0
5289	5288	0	0
5290	5289	0	0
5291	5290	0	0
5292	5291	0	0
5293	5292	0	0
5294	5293	0	0
5295	5294	0	1
5296	5295	0	0
5297	5296	0	0
5298	5297	0	0
5299	5298	0	1
5300	5299	0	2
5301	5300	0	2
5302	5301	0	2
5303	5302	1	0
5304	5303	1	0
5305	5304	1	0
5306	5305	1	0
5307	5306	1	0
5308	5307	1	0
5309	5308	1	0
5310	5309	1	0
5311	5310	1	0
5312	5311	1	0
5313	5312	1	0
5314	5313	1	0
5315	5314	1	0
5316	5315	1	1
5317	5316	1	2
5318	5317	1	0
5319	5318	1	1
5320	5319	1	0
5321	5320	1	0
5322	5321	1	2
5323	5322	1	0
5324	5323	2	1
5325	5324	2	2
5326	5325	2	1
5327	5326	2	2
5328	5327	2	0
5329	5328	2	0
5330	5329	2	0
5331	5330	2	0
5332	5331	2	0
5333	5332	2	0
5334	5333	2	0
5335	5334	2	0
5336	5335	2	0
5337	5336	2	0
5338	5337	2	0
5339	5338	2	0
5340	5339	2	0
5341	5340	2	0
5342	5341	2	0
5343	5342	2	0
5344	5343	2	0
5345	5344	3	1
5346	5345	3	2
5347	5346	3	0
5348	5347	3	0
5349	5348	3	0
5350	5349	3	0
5351	5350	3	0
5352	5351	3	0
5353	5352	3	0
5354	5353	3	0
5355	5354	3	0
5356	5355	3	0
5357	5356	3	0
5358	5357	3	0
5359	5358	3	0
5360	5359	3	0
5361	5360	3	0
5362	5361	3	0
5363	5362	3	0
5364	5363	3	1
5365	5364	3	1
5366	5365	3	2
5367	5366	3	2
5368	5367	4	0
5369	5368	4	0
5370	5369	4	0
5371	5370	4	0
5372	5371	4	0
5373	5372	4	0
5374	5373	4	0
5375	5374	4	0
5376	5375	4	0
5377	5376	4	0
5378	5377	4	0
5379	5378	4	0
5380	5379	4	0
5381	5380	4	0
5382	5381	4	0
5383	5382	4	0
5384	5383	4	0
5385	5384	4	0
5386	5385	4	0
5387	5386	4	0
5388	5387	4	0
5389	5388	4	0
5390	5389	4	0
5391	5390	5	0
5392	5391	5	0
5393	5392	5	0
5394	5393	5	0
5395	5394	5	0
5396	5395	5	0
5397	5396	5	0
5398	5397	5	0
5399	5398	5	0
5400	5399	5	0
5401	5400	5	0
5402	5401	5	0
5403	5402	5	0
5404	5403	5	0
5405	5404	5	0
5406	5405	5	0
5407	5406	5	0
5408	5407	5	0
5409	5408	5	0
5410	5409	5	0
5411	5410	5	0
5412	5411	5	0
5413	5412	5	0
5414	5413	6	0
5415	5414	6	0
5416	5415	6	0
5417	5416	6	0
5418	5417	6	0
5419	5418	6	0
5420	5419	6	0
5421	5420	6	0
5422	5421	6	0
5423	5422	6	0
5424	5423	6	0
5425	5424	6	0
5426	5425	6	0
5427	5426	6	0
5428	5427	6	0
5429	5428	6	0
5430	5429	6	0
5431	5430	6	0
5432	5431	6	0
5433	5432	6	0
5434	5433	6	0
5435	5434	6	0
5436	5435	6	0
5437	5436	6	0
5438	5437	6	0
5439	5438	6	0
5440	5439	6	0
5441	5440	6	0
5442	5441	7	0
5443	5442	7	0
5444	5443	7	0
5445	5444	7	0
5446	5445	7	0
5447	5446	7	0
5448	5447	7	0
5449	5448	7	0
5450	5449	7	0
5451	5450	7	0
5452	5451	7	0
5453	5452	7	0
5454	5453	7	0
5455	5454	7	0
5456	5455	7	0
5457	5456	7	0
5458	5457	7	0
5459	5458	7	0
5460	5459	7	0
5461	5460	7	0
5462	5461	7	0
5463	5462	7	0
5464	5463	7	0
5465	5464	7	0
5466	5465	7	0
5467	5466	7	0
5468	5467	7	0
5469	5468	7	0
5470	5469	8	0
5471	5470	8	0
5472	5471	8	0
5473	5472	8	0
5474	5473	8	0
5475	5474	8	0
5476	5475	8	0
5477	5476	8	0
5478	5477	8	0
5479	5478	8	0
5480	5479	8	0
5481	5480	8	0
5482	5481	8	0
5483	5482	8	0
5484	5483	8	0
5485	5484	9	0
5486	5485	9	0
5487	5486	9	0
5488	5487	9	0
5489	5488	9	0
5490	5489	9	0
5491	5490	9	0
5492	5491	9	0
5493	5492	9	0
5494	5493	9	0
5495	5494	9	0
5496	5495	9	0
5497	5496	9	0
5498	5497	9	0
5499	5498	9	0
5500	5499	12	0
5501	5500	12	0
5502	5501	12	0
5503	5502	12	0
5504	5503	12	0
5505	5504	12	0
5506	5505	12	0
5507	5506	12	0
5508	5507	12	0
5509	5508	12	0
5510	5509	12	0
5511	5510	12	0
5512	5511	12	0
5513	5512	12	0
5514	5513	12	0
5515	5514	12	0
5516	5515	12	0
5517	5516	12	0
5518	5517	12	0
5519	5518	12	0
5520	5519	12	0
5521	5520	12	0
5522	5521	13	0
5523	5522	13	0
5524	5523	13	0
5525	5524	13	0
5526	5525	13	0
5527	5526	13	0
5528	5527	13	0
5529	5528	13	0
5530	5529	13	0
5531	5530	13	0
5532	5531	13	0
5533	5532	13	0
5534	5533	13	0
5535	5534	13	0
5536	5535	13	0
5537	5536	13	0
5538	5537	13	0
5539	5538	13	0
5540	5539	13	0
5541	5540	13	0
5542	5541	13	0
5543	5542	13	0
5544	5543	13	0
5545	5544	0	0
5546	5545	0	0
5547	5546	0	0
5548	5547	0	0
5549	5548	0	0
5550	5549	0	0
5551	5550	0	0
5552	5551	0	0
5553	5552	0	0
5554	5553	0	0
5555	5554	0	0
5556	5555	0	0
5557	5556	0	0
5558	5557	0	0
5559	5558	0	0
5560	5559	0	0
5561	5560	0	0
5562	5561	0	0
5563	5562	0	0
5564	5563	0	0
5565	5564	0	0
5566	5565	0	0
5567	5566	0	0
5568	5567	1	0
5569	5568	1	0
5570	5569	1	0
5571	5570	1	0
5572	5571	1	0
5573	5572	1	0
5574	5573	1	0
5575	5574	1	0
5576	5575	1	0
5577	5576	1	0
5578	5577	1	0
5579	5578	1	0
5580	5579	1	0
5581	5580	1	0
5582	5581	1	0
5583	5582	1	0
5584	5583	1	0
5585	5584	1	0
5586	5585	1	0
5587	5586	1	0
5588	5587	1	0
5589	5588	2	0
5590	5589	2	0
5591	5590	2	0
5592	5591	2	0
5593	5592	2	0
5594	5593	2	0
5595	5594	2	0
5596	5595	2	0
5597	5596	2	0
5598	5597	2	0
5599	5598	2	0
5600	5599	2	0
5601	5600	2	0
5602	5601	2	0
5603	5602	2	0
5604	5603	2	0
5605	5604	2	0
5606	5605	2	0
5607	5606	2	0
5608	5607	2	0
5609	5608	2	0
5610	5609	3	0
5611	5610	3	0
5612	5611	3	0
5613	5612	3	0
5614	5613	3	0
5615	5614	3	0
5616	5615	3	0
5617	5616	3	0
5618	5617	3	0
5619	5618	3	0
5620	5619	3	0
5621	5620	3	0
5622	5621	3	0
5623	5622	3	0
5624	5623	3	0
5625	5624	3	0
5626	5625	3	0
5627	5626	3	0
5628	5627	3	0
5629	5628	3	0
5630	5629	3	0
5631	5630	3	0
5632	5631	3	0
5633	5632	4	0
5634	5633	4	0
5635	5634	4	0
5636	5635	4	0
5637	5636	4	0
5638	5637	4	0
5639	5638	4	0
5640	5639	4	0
5641	5640	4	0
5642	5641	4	0
5643	5642	4	0
5644	5643	4	0
5645	5644	4	0
5646	5645	4	0
5647	5646	4	0
5648	5647	4	0
5649	5648	4	0
5650	5649	4	0
5651	5650	4	0
5652	5651	4	0
5653	5652	4	0
5654	5653	4	0
5655	5654	4	0
5656	5655	5	0
5657	5656	5	0
5658	5657	5	0
5659	5658	5	0
5660	5659	5	0
5661	5660	5	0
5662	5661	5	0
5663	5662	5	0
5664	5663	5	0
5665	5664	5	0
5666	5665	5	0
5667	5666	5	0
5668	5667	5	0
5669	5668	5	0
5670	5669	5	0
5671	5670	5	0
5672	5671	5	0
5673	5672	5	0
5674	5673	5	0
5675	5674	5	0
5676	5675	5	0
5677	5676	5	0
5678	5677	5	0
5679	5678	6	0
5680	5679	6	0
5681	5680	6	0
5682	5681	6	0
5683	5682	6	0
5684	5683	6	0
5685	5684	6	0
5686	5685	6	0
5687	5686	6	0
5688	5687	6	0
5689	5688	6	0
5690	5689	6	0
5691	5690	6	0
5692	5691	6	0
5693	5692	6	0
5694	5693	6	0
5695	5694	6	0
5696	5695	6	0
5697	5696	6	0
5698	5697	6	0
5699	5698	6	0
5700	5699	6	0
5701	5700	6	0
5702	5701	6	0
5703	5702	6	0
5704	5703	6	0
5705	5704	6	0
5706	5705	6	0
5707	5706	7	0
5708	5707	7	0
5709	5708	7	0
5710	5709	7	0
5711	5710	7	0
5712	5711	7	0
5713	5712	7	0
5714	5713	7	0
5715	5714	7	0
5716	5715	7	0
5717	5716	7	0
5718	5717	7	0
5719	5718	7	0
5720	5719	7	0
5721	5720	7	0
5722	5721	7	0
5723	5722	7	0
5724	5723	7	0
5725	5724	7	0
5726	5725	7	0
5727	5726	7	0
5728	5727	7	0
5729	5728	7	0
5730	5729	7	0
5731	5730	7	0
5732	5731	7	0
5733	5732	7	0
5734	5733	7	0
5735	5734	8	0
5736	5735	8	0
5737	5736	8	0
5738	5737	8	0
5739	5738	8	0
5740	5739	8	0
5741	5740	8	0
5742	5741	8	0
5743	5742	8	0
5744	5743	8	0
5745	5744	8	0
5746	5745	8	0
5747	5746	8	0
5748	5747	8	0
5749	5748	8	0
5750	5749	9	0
5751	5750	9	0
5752	5751	9	0
5753	5752	9	0
5754	5753	9	0
5755	5754	9	0
5756	5755	9	0
5757	5756	9	0
5758	5757	9	0
5759	5758	9	0
5760	5759	9	0
5761	5760	9	0
5762	5761	9	0
5763	5762	9	0
5764	5763	9	0
5765	5764	10	1
5766	5765	10	1
5767	5766	10	1
5768	5767	10	1
5769	5768	10	1
5770	5769	10	1
5771	5770	10	1
5772	5771	10	1
5773	5772	10	1
5774	5773	10	1
5775	5774	10	1
5776	5775	10	1
5777	5776	10	1
5778	5777	10	1
5779	5778	10	1
5780	5779	10	1
5781	5780	10	1
5782	5781	10	1
5783	5782	10	1
5784	5783	10	1
5785	5784	10	1
5786	5785	10	1
5787	5786	10	2
5788	5787	10	2
5789	5788	10	2
5790	5789	10	2
5791	5790	10	2
5792	5791	10	2
5793	5792	10	2
5794	5793	10	2
5795	5794	10	2
5796	5795	10	2
5797	5796	10	2
5798	5797	10	2
5799	5798	10	2
5800	5799	10	2
5801	5800	10	2
5802	5801	10	2
5803	5802	10	2
5804	5803	10	2
5805	5804	10	2
5806	5805	10	2
5807	5806	10	2
5808	5807	10	2
5809	5808	10	2
5810	5809	0	0
5811	5810	0	0
5812	5811	0	1
5813	5812	0	2
5814	5813	0	0
5815	5814	0	0
5816	5815	0	0
5817	5816	0	0
5818	5817	0	0
5819	5818	0	0
5820	5819	0	0
5821	5820	0	0
5822	5821	0	0
5823	5822	0	0
5824	5823	0	0
5825	5824	0	1
5826	5825	0	0
5827	5826	0	0
5828	5827	0	0
5829	5828	0	1
5830	5829	0	2
5831	5830	0	2
5832	5831	0	2
5833	5832	1	0
5834	5833	1	0
5835	5834	1	0
5836	5835	1	0
5837	5836	1	0
5838	5837	1	0
5839	5838	1	0
5840	5839	1	0
5841	5840	1	0
5842	5841	1	0
5843	5842	1	0
5844	5843	1	0
5845	5844	1	0
5846	5845	1	1
5847	5846	1	2
5848	5847	1	0
5849	5848	1	1
5850	5849	1	0
5851	5850	1	0
5852	5851	1	2
5853	5852	1	0
5854	5853	2	1
5855	5854	2	2
5856	5855	2	1
5857	5856	2	2
5858	5857	2	0
5859	5858	2	0
5860	5859	2	0
5861	5860	2	0
5862	5861	2	0
5863	5862	2	0
5864	5863	2	0
5865	5864	2	0
5866	5865	2	0
5867	5866	2	0
5868	5867	2	0
5869	5868	2	0
5870	5869	2	0
5871	5870	2	0
5872	5871	2	0
5873	5872	2	0
5874	5873	2	0
5875	5874	3	1
5876	5875	3	2
5877	5876	3	0
5878	5877	3	0
5879	5878	3	0
5880	5879	3	0
5881	5880	3	0
5882	5881	3	0
5883	5882	3	0
5884	5883	3	0
5885	5884	3	0
5886	5885	3	0
5887	5886	3	0
5888	5887	3	0
5889	5888	3	0
5890	5889	3	0
5891	5890	3	0
5892	5891	3	0
5893	5892	3	0
5894	5893	3	1
5895	5894	3	1
5896	5895	3	2
5897	5896	3	2
5898	5897	4	0
5899	5898	4	0
5900	5899	4	0
5901	5900	4	0
5902	5901	4	0
5903	5902	4	0
5904	5903	4	0
5905	5904	4	0
5906	5905	4	0
5907	5906	4	0
5908	5907	4	0
5909	5908	4	0
5910	5909	4	0
5911	5910	4	0
5912	5911	4	0
5913	5912	4	0
5914	5913	4	0
5915	5914	4	0
5916	5915	4	0
5917	5916	4	0
5918	5917	4	0
5919	5918	4	0
5920	5919	4	0
5921	5920	5	0
5922	5921	5	0
5923	5922	5	0
5924	5923	5	0
5925	5924	5	0
5926	5925	5	0
5927	5926	5	0
5928	5927	5	0
5929	5928	5	0
5930	5929	5	0
5931	5930	5	0
5932	5931	5	0
5933	5932	5	0
5934	5933	5	0
5935	5934	5	0
5936	5935	5	0
5937	5936	5	0
5938	5937	5	0
5939	5938	5	0
5940	5939	5	0
5941	5940	5	0
5942	5941	5	0
5943	5942	5	0
5944	5943	6	0
5945	5944	6	0
5946	5945	6	0
5947	5946	6	0
5948	5947	6	0
5949	5948	6	0
5950	5949	6	0
5951	5950	6	0
5952	5951	6	0
5953	5952	6	0
5954	5953	6	0
5955	5954	6	0
5956	5955	6	0
5957	5956	6	0
5958	5957	6	0
5959	5958	6	0
5960	5959	6	0
5961	5960	6	0
5962	5961	6	0
5963	5962	6	0
5964	5963	6	0
5965	5964	6	0
5966	5965	6	0
5967	5966	6	0
5968	5967	6	0
5969	5968	6	0
5970	5969	6	0
5971	5970	6	0
5972	5971	7	0
5973	5972	7	0
5974	5973	7	0
5975	5974	7	0
5976	5975	7	0
5977	5976	7	0
5978	5977	7	0
5979	5978	7	0
5980	5979	7	0
5981	5980	7	0
5982	5981	7	0
5983	5982	7	0
5984	5983	7	0
5985	5984	7	0
5986	5985	7	0
5987	5986	7	0
5988	5987	7	0
5989	5988	7	0
5990	5989	7	0
5991	5990	7	0
5992	5991	7	0
5993	5992	7	0
5994	5993	7	0
5995	5994	7	0
5996	5995	7	0
5997	5996	7	0
5998	5997	7	0
5999	5998	7	0
6000	5999	8	0
6001	6000	8	0
6002	6001	8	0
6003	6002	8	0
6004	6003	8	0
6005	6004	8	0
6006	6005	8	0
6007	6006	8	0
6008	6007	8	0
6009	6008	8	0
6010	6009	8	0
6011	6010	8	0
6012	6011	8	0
6013	6012	8	0
6014	6013	8	0
6015	6014	9	0
6016	6015	9	0
6017	6016	9	0
6018	6017	9	0
6019	6018	9	0
6020	6019	9	0
6021	6020	9	0
6022	6021	9	0
6023	6022	9	0
6024	6023	9	0
6025	6024	9	0
6026	6025	9	0
6027	6026	9	0
6028	6027	9	0
6029	6028	9	0
6030	6029	10	1
6031	6030	10	1
6032	6031	10	1
6033	6032	10	1
6034	6033	10	1
6035	6034	10	1
6036	6035	10	1
6037	6036	10	1
6038	6037	10	1
6039	6038	10	1
6040	6039	10	1
6041	6040	10	1
6042	6041	10	1
6043	6042	10	1
6044	6043	10	1
6045	6044	10	1
6046	6045	10	1
6047	6046	10	1
6048	6047	10	1
6049	6048	10	1
6050	6049	10	1
6051	6050	10	1
6052	6051	10	2
6053	6052	10	2
6054	6053	10	2
6055	6054	10	2
6056	6055	10	2
6057	6056	10	2
6058	6057	10	2
6059	6058	10	2
6060	6059	10	2
6061	6060	10	2
6062	6061	10	2
6063	6062	10	2
6064	6063	10	2
6065	6064	10	2
6066	6065	10	2
6067	6066	10	2
6068	6067	10	2
6069	6068	10	2
6070	6069	10	2
6071	6070	10	2
6072	6071	10	2
6073	6072	10	2
6074	6073	10	2
6075	6074	0	0
6076	6075	0	0
6077	6076	0	1
6078	6077	0	2
6079	6078	0	0
6080	6079	0	0
6081	6080	0	0
6082	6081	0	0
6083	6082	0	0
6084	6083	0	0
6085	6084	0	0
6086	6085	0	0
6087	6086	0	0
6088	6087	0	0
6089	6088	0	0
6090	6089	0	1
6091	6090	0	0
6092	6091	0	0
6093	6092	0	0
6094	6093	0	1
6095	6094	0	2
6096	6095	0	2
6097	6096	0	2
6098	6097	1	0
6099	6098	1	0
6100	6099	1	0
6101	6100	1	0
6102	6101	1	0
6103	6102	1	0
6104	6103	1	0
6105	6104	1	0
6106	6105	1	0
6107	6106	1	0
6108	6107	1	0
6109	6108	1	0
6110	6109	1	0
6111	6110	1	1
6112	6111	1	2
6113	6112	1	0
6114	6113	1	1
6115	6114	1	0
6116	6115	1	0
6117	6116	1	2
6118	6117	1	0
6119	6118	2	1
6120	6119	2	2
6121	6120	2	1
6122	6121	2	2
6123	6122	2	0
6124	6123	2	0
6125	6124	2	0
6126	6125	2	0
6127	6126	2	0
6128	6127	2	0
6129	6128	2	0
6130	6129	2	0
6131	6130	2	0
6132	6131	2	0
6133	6132	2	0
6134	6133	2	0
6135	6134	2	0
6136	6135	2	0
6137	6136	2	0
6138	6137	2	0
6139	6138	2	0
6140	6139	3	1
6141	6140	3	2
6142	6141	3	0
6143	6142	3	0
6144	6143	3	0
6145	6144	3	0
6146	6145	3	0
6147	6146	3	0
6148	6147	3	0
6149	6148	3	0
6150	6149	3	0
6151	6150	3	0
6152	6151	3	0
6153	6152	3	0
6154	6153	3	0
6155	6154	3	0
6156	6155	3	0
6157	6156	3	0
6158	6157	3	0
6159	6158	3	1
6160	6159	3	1
6161	6160	3	2
6162	6161	3	2
6163	6162	4	0
6164	6163	4	0
6165	6164	4	0
6166	6165	4	0
6167	6166	4	0
6168	6167	4	0
6169	6168	4	0
6170	6169	4	0
6171	6170	4	0
6172	6171	4	0
6173	6172	4	0
6174	6173	4	0
6175	6174	4	0
6176	6175	4	0
6177	6176	4	0
6178	6177	4	0
6179	6178	4	0
6180	6179	4	0
6181	6180	4	0
6182	6181	4	0
6183	6182	4	0
6184	6183	4	0
6185	6184	4	0
6186	6185	5	0
6187	6186	5	0
6188	6187	5	0
6189	6188	5	0
6190	6189	5	0
6191	6190	5	0
6192	6191	5	0
6193	6192	5	0
6194	6193	5	0
6195	6194	5	0
6196	6195	5	0
6197	6196	5	0
6198	6197	5	0
6199	6198	5	0
6200	6199	5	0
6201	6200	5	0
6202	6201	5	0
6203	6202	5	0
6204	6203	5	0
6205	6204	5	0
6206	6205	5	0
6207	6206	5	0
6208	6207	5	0
6209	6208	6	0
6210	6209	6	0
6211	6210	6	0
6212	6211	6	0
6213	6212	6	0
6214	6213	6	0
6215	6214	6	0
6216	6215	6	0
6217	6216	6	0
6218	6217	6	0
6219	6218	6	0
6220	6219	6	0
6221	6220	6	0
6222	6221	6	0
6223	6222	6	0
6224	6223	6	0
6225	6224	6	0
6226	6225	6	0
6227	6226	6	0
6228	6227	6	0
6229	6228	6	0
6230	6229	6	0
6231	6230	6	0
6232	6231	6	0
6233	6232	6	0
6234	6233	6	0
6235	6234	6	0
6236	6235	6	0
6237	6236	6	0
6238	6237	6	0
6239	6238	6	0
6240	6239	6	0
6241	6240	6	0
6242	6241	7	0
6243	6242	7	0
6244	6243	7	0
6245	6244	7	0
6246	6245	7	0
6247	6246	7	0
6248	6247	7	0
6249	6248	7	0
6250	6249	7	0
6251	6250	7	0
6252	6251	7	0
6253	6252	7	0
6254	6253	7	0
6255	6254	7	0
6256	6255	7	0
6257	6256	7	0
6258	6257	7	0
6259	6258	7	0
6260	6259	7	0
6261	6260	7	0
6262	6261	7	0
6263	6262	7	0
6264	6263	7	0
6265	6264	7	0
6266	6265	7	0
6267	6266	7	0
6268	6267	7	0
6269	6268	7	0
6270	6269	7	0
6271	6270	7	0
6272	6271	7	0
6273	6272	7	0
6274	6273	7	0
6275	6274	8	0
6276	6275	8	0
6277	6276	8	0
6278	6277	8	0
6279	6278	8	0
6280	6279	8	0
6281	6280	8	0
6282	6281	8	0
6283	6282	8	0
6284	6283	8	0
6285	6284	8	0
6286	6285	8	0
6287	6286	8	0
6288	6287	8	0
6289	6288	8	0
6290	6289	9	0
6291	6290	9	0
6292	6291	9	0
6293	6292	9	0
6294	6293	9	0
6295	6294	9	0
6296	6295	9	0
6297	6296	9	0
6298	6297	9	0
6299	6298	9	0
6300	6299	9	0
6301	6300	9	0
6302	6301	9	0
6303	6302	9	0
6304	6303	9	0
6305	6304	10	1
6306	6305	10	1
6307	6306	10	1
6308	6307	10	1
6309	6308	10	1
6310	6309	10	1
6311	6310	10	1
6312	6311	10	1
6313	6312	10	1
6314	6313	10	1
6315	6314	10	1
6316	6315	10	1
6317	6316	10	1
6318	6317	10	1
6319	6318	10	1
6320	6319	10	1
6321	6320	10	1
6322	6321	10	1
6323	6322	10	1
6324	6323	10	1
6325	6324	10	1
6326	6325	10	1
6327	6326	10	2
6328	6327	10	2
6329	6328	10	2
6330	6329	10	2
6331	6330	10	2
6332	6331	10	2
6333	6332	10	2
6334	6333	10	2
6335	6334	10	2
6336	6335	10	2
6337	6336	10	2
6338	6337	10	2
6339	6338	10	2
6340	6339	10	2
6341	6340	10	2
6342	6341	10	2
6343	6342	10	2
6344	6343	10	2
6345	6344	10	2
6346	6345	10	2
6347	6346	10	2
6348	6347	10	2
6349	6348	10	2
6350	6349	0	0
6351	6350	0	0
6352	6351	0	1
6353	6352	0	2
6354	6353	0	0
6355	6354	0	0
6356	6355	0	0
6357	6356	0	0
6358	6357	0	0
6359	6358	0	0
6360	6359	0	0
6361	6360	0	0
6362	6361	0	0
6363	6362	0	0
6364	6363	0	0
6365	6364	0	1
6366	6365	0	0
6367	6366	0	0
6368	6367	0	0
6369	6368	0	1
6370	6369	0	2
6371	6370	0	2
6372	6371	0	2
6373	6372	1	0
6374	6373	1	0
6375	6374	1	0
6376	6375	1	0
6377	6376	1	0
6378	6377	1	0
6379	6378	1	0
6380	6379	1	0
6381	6380	1	0
6382	6381	1	0
6383	6382	1	0
6384	6383	1	0
6385	6384	1	0
6386	6385	1	1
6387	6386	1	2
6388	6387	1	0
6389	6388	1	1
6390	6389	1	0
6391	6390	1	0
6392	6391	1	2
6393	6392	1	0
6394	6393	2	1
6395	6394	2	2
6396	6395	2	1
6397	6396	2	2
6398	6397	2	0
6399	6398	2	0
6400	6399	2	0
6401	6400	2	0
6402	6401	2	0
6403	6402	2	0
6404	6403	2	0
6405	6404	2	0
6406	6405	2	0
6407	6406	2	0
6408	6407	2	0
6409	6408	2	0
6410	6409	2	0
6411	6410	2	0
6412	6411	2	0
6413	6412	2	0
6414	6413	2	0
6415	6414	3	1
6416	6415	3	2
6417	6416	3	0
6418	6417	3	0
6419	6418	3	0
6420	6419	3	0
6421	6420	3	0
6422	6421	3	0
6423	6422	3	0
6424	6423	3	0
6425	6424	3	0
6426	6425	3	0
6427	6426	3	0
6428	6427	3	0
6429	6428	3	0
6430	6429	3	0
6431	6430	3	0
6432	6431	3	0
6433	6432	3	0
6434	6433	3	1
6435	6434	3	1
6436	6435	3	2
6437	6436	3	2
6438	6437	4	0
6439	6438	4	0
6440	6439	4	0
6441	6440	4	0
6442	6441	4	0
6443	6442	4	0
6444	6443	4	0
6445	6444	4	0
6446	6445	4	0
6447	6446	4	0
6448	6447	4	0
6449	6448	4	0
6450	6449	4	0
6451	6450	4	0
6452	6451	4	0
6453	6452	4	0
6454	6453	4	0
6455	6454	4	0
6456	6455	4	0
6457	6456	4	0
6458	6457	4	0
6459	6458	4	0
6460	6459	4	0
6461	6460	5	0
6462	6461	5	0
6463	6462	5	0
6464	6463	5	0
6465	6464	5	0
6466	6465	5	0
6467	6466	5	0
6468	6467	5	0
6469	6468	5	0
6470	6469	5	0
6471	6470	5	0
6472	6471	5	0
6473	6472	5	0
6474	6473	5	0
6475	6474	5	0
6476	6475	5	0
6477	6476	5	0
6478	6477	5	0
6479	6478	5	0
6480	6479	5	0
6481	6480	5	0
6482	6481	5	0
6483	6482	5	0
6484	6483	6	0
6485	6484	6	0
6486	6485	6	0
6487	6486	6	0
6488	6487	6	0
6489	6488	6	0
6490	6489	6	0
6491	6490	6	0
6492	6491	6	0
6493	6492	6	0
6494	6493	6	0
6495	6494	6	0
6496	6495	6	0
6497	6496	6	0
6498	6497	6	0
6499	6498	6	0
6500	6499	6	0
6501	6500	6	0
6502	6501	6	0
6503	6502	6	0
6504	6503	6	0
6505	6504	6	0
6506	6505	6	0
6507	6506	6	0
6508	6507	6	0
6509	6508	6	0
6510	6509	6	0
6511	6510	6	0
6512	6511	6	0
6513	6512	6	0
6514	6513	6	0
6515	6514	6	0
6516	6515	6	0
6517	6516	7	0
6518	6517	7	0
6519	6518	7	0
6520	6519	7	0
6521	6520	7	0
6522	6521	7	0
6523	6522	7	0
6524	6523	7	0
6525	6524	7	0
6526	6525	7	0
6527	6526	7	0
6528	6527	7	0
6529	6528	7	0
6530	6529	7	0
6531	6530	7	0
6532	6531	7	0
6533	6532	7	0
6534	6533	7	0
6535	6534	7	0
6536	6535	7	0
6537	6536	7	0
6538	6537	7	0
6539	6538	7	0
6540	6539	7	0
6541	6540	7	0
6542	6541	7	0
6543	6542	7	0
6544	6543	7	0
6545	6544	7	0
6546	6545	7	0
6547	6546	7	0
6548	6547	7	0
6549	6548	7	0
6550	6549	8	0
6551	6550	8	0
6552	6551	8	0
6553	6552	8	0
6554	6553	8	0
6555	6554	8	0
6556	6555	8	0
6557	6556	8	0
6558	6557	8	0
6559	6558	8	0
6560	6559	8	0
6561	6560	8	0
6562	6561	8	0
6563	6562	8	0
6564	6563	8	0
6565	6564	9	0
6566	6565	9	0
6567	6566	9	0
6568	6567	9	0
6569	6568	9	0
6570	6569	9	0
6571	6570	9	0
6572	6571	9	0
6573	6572	9	0
6574	6573	9	0
6575	6574	9	0
6576	6575	9	0
6577	6576	9	0
6578	6577	9	0
6579	6578	9	0
6580	6579	10	1
6581	6580	10	1
6582	6581	10	1
6583	6582	10	1
6584	6583	10	1
6585	6584	10	1
6586	6585	10	1
6587	6586	10	1
6588	6587	10	1
6589	6588	10	1
6590	6589	10	1
6591	6590	10	1
6592	6591	10	1
6593	6592	10	1
6594	6593	10	1
6595	6594	10	1
6596	6595	10	1
6597	6596	10	1
6598	6597	10	1
6599	6598	10	1
6600	6599	10	1
6601	6600	10	1
6602	6601	10	2
6603	6602	10	2
6604	6603	10	2
6605	6604	10	2
6606	6605	10	2
6607	6606	10	2
6608	6607	10	2
6609	6608	10	2
6610	6609	10	2
6611	6610	10	2
6612	6611	10	2
6613	6612	10	2
6614	6613	10	2
6615	6614	10	2
6616	6615	10	2
6617	6616	10	2
6618	6617	10	2
6619	6618	10	2
6620	6619	10	2
6621	6620	10	2
6622	6621	10	2
6623	6622	10	2
6624	6623	10	2
\.


--
-- TOC entry 4939 (class 0 OID 142606)
-- Dependencies: 238
-- Data for Name: sc_rasp7_preps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp7_preps (id, rasp7_id, prep_id) FROM stdin;
3288	4221	0
3289	4222	1
3290	4223	2
3291	4224	3
3292	4225	4
3293	4226	5
3294	4227	6
3295	4228	6
3296	4229	7
3297	4230	8
3298	4231	7
3299	4232	9
3300	4233	10
3301	4234	11
3302	4236	11
3303	4237	12
3304	4238	13
3305	4239	12
3306	4240	14
3307	4241	14
3308	4242	15
3309	4243	16
3310	4244	5
3311	4245	17
3312	4246	17
3313	4247	1
3314	4248	15
3315	4249	4
3316	4250	4
3317	4251	5
3318	4252	18
3319	4254	7
3320	4255	8
3321	4256	7
3322	4257	6
3323	4258	6
3324	4259	10
3325	4260	11
3326	4261	11
3327	4262	12
3328	4263	13
3329	4264	12
3330	4265	2
3331	4266	14
3332	4267	15
3333	4268	16
3334	4269	5
3335	4270	5
3336	4271	19
3337	4272	20
3338	4273	4
3339	4274	10
3340	4275	10
3341	4276	18
3342	4277	7
3343	4278	8
3344	4279	7
3345	4280	21
3346	4281	21
3347	4283	10
3348	4284	11
3349	4285	12
3350	4286	13
3351	4287	1
3352	4288	22
3353	4289	14
3354	4290	15
3355	4291	23
3356	4292	23
3357	4293	5
3358	4294	5
3359	4295	2
3360	4296	21
3361	4297	21
3362	4298	4
3363	4300	18
3364	4301	10
3365	4302	10
3366	4303	8
3367	4304	7
3368	4305	8
3369	4306	1
3370	4307	10
3371	4308	11
3372	4309	12
3373	4310	13
3374	4311	22
3375	4312	24
3376	4313	14
3377	4314	15
3378	4315	23
3379	4316	23
3380	4317	5
3381	4318	25
3382	4319	26
3383	4320	25
3384	4321	3
3385	4322	27
3386	4323	25
3387	4324	27
3388	4326	28
3389	4327	26
3390	4328	29
3391	4329	10
3392	4330	30
3393	4331	31
3394	4332	32
3395	4333	33
3396	4334	25
3397	4335	34
3398	4336	34
3399	4337	35
3400	4338	36
3401	4339	26
3402	4340	25
3403	4342	27
3404	4343	25
3405	4344	28
3406	4345	10
3407	4346	34
3408	4347	34
3409	4348	30
3410	4349	30
3411	4350	32
3412	4351	33
3413	4352	37
3414	4353	38
3415	4354	39
3416	4355	25
3417	4356	34
3418	4357	26
3419	4358	35
3420	4359	36
3421	4365	40
3422	4366	41
3423	4367	42
3424	4368	43
3425	4369	43
3426	4370	43
3427	4371	43
3428	4372	44
3429	4373	44
3430	4374	42
3431	4375	45
3432	4376	46
3433	4377	45
3434	4378	47
3435	4379	48
3436	4380	12
3437	4381	47
3438	4382	48
3439	4388	41
3440	4389	42
3441	4390	43
3442	4391	43
3443	4392	43
3444	4393	43
3445	4394	44
3446	4395	44
3447	4396	42
3448	4397	45
3449	4398	46
3450	4399	45
3451	4400	47
3452	4401	48
3453	4402	41
3454	4403	12
3455	4404	48
3456	4405	47
3457	4406	49
3458	4407	49
3459	4408	50
3460	4409	51
3461	4411	52
3462	4417	44
3463	4418	44
3464	4419	44
3465	4420	53
3466	4421	53
3467	4422	54
3468	4423	55
3469	4424	27
3470	4425	55
3471	4426	53
3472	4427	53
3473	4428	55
3474	4433	56
3475	4434	57
3476	4435	57
3477	4436	58
3478	4437	49
3479	4438	49
3480	4439	50
3481	4440	51
3482	4442	52
3483	4448	44
3484	4449	44
3485	4450	44
3486	4451	53
3487	4452	53
3488	4453	54
3489	4454	27
3490	4455	27
3491	4456	27
3492	4457	53
3493	4458	53
3494	4463	56
3495	4464	57
3496	4465	57
3497	4466	58
3498	4467	59
3499	4468	60
3500	4469	60
3501	4470	61
3502	4471	61
3503	4472	62
3504	4473	62
3505	4474	40
3506	4475	40
3507	4476	43
3508	4477	42
3509	4478	43
3510	4479	63
3511	4480	42
3512	4481	63
3513	4493	51
3514	4494	51
3515	4495	64
3516	4496	40
3517	4497	52
3518	4498	52
3519	4501	40
3520	4504	65
3521	4505	66
3522	4506	67
3523	4507	67
3524	4508	67
3525	4509	68
3526	4510	68
3527	4511	69
3528	4512	0
3529	4514	59
3530	4515	3
3531	4516	3
3532	4518	16
3533	4520	8
3534	4521	7
3535	4522	7
3536	4523	12
3537	4524	83
3538	4525	10
3539	4526	83
3540	4527	10
3541	4529	84
3542	4530	12
3543	4531	14
3544	4532	14
3545	4533	15
3546	4534	36
3547	4537	1
3548	4538	2
3549	4539	85
3550	4540	86
3551	4541	8
3552	4542	7
3553	4543	12
3554	4544	83
3555	4545	10
3556	4546	11
3557	4547	11
3558	4550	12
3559	4551	14
3560	4552	15
3561	4553	36
3562	4554	60
3563	4555	60
3564	4557	10
3565	4558	10
3566	4560	1
3567	4561	86
3568	4562	8
3569	4563	7
3570	4566	12
3571	4567	83
3572	4568	10
3573	4570	87
3574	4572	22
3575	4573	2
3576	4574	14
3577	4575	15
3578	4576	36
3579	4577	10
3580	4578	10
3581	4580	85
3582	4582	8
3583	4583	7
3584	4584	14
3585	4585	8
3586	4586	12
3587	4587	83
3588	4588	10
3589	4589	83
3590	4591	14
3591	4592	15
3592	4593	36
3593	4594	26
3594	4595	26
3595	4596	34
3596	4597	27
3597	4598	88
3598	4600	27
3599	4601	27
3600	4602	89
3601	4606	27
3602	4607	34
3603	4609	31
3604	4610	11
3605	4613	4
3606	4614	12
3607	4616	45
3608	4617	26
3609	4618	34
3610	4619	55
3611	4621	88
3612	4622	27
3613	4624	89
3614	4625	88
3615	4626	89
3616	4628	26
3617	4629	27
3618	4630	34
3619	4632	59
3620	4633	11
3621	4636	4
3622	4637	35
3623	4638	12
3624	4643	59
3625	4644	52
3626	4645	59
3627	4646	59
3628	4647	44
3629	4648	44
3630	4649	39
3631	4650	45
3632	4651	49
3633	4653	4
3634	4654	42
3635	4655	51
3636	4659	47
3637	4660	53
3638	4661	48
3639	4662	48
3640	4663	53
3641	4664	47
3642	4665	16
3643	4670	59
3644	4671	52
3645	4672	35
3646	4673	35
3647	4674	30
3648	4675	30
3649	4676	44
3650	4677	39
3651	4678	49
3652	4680	12
3653	4681	42
3654	4682	51
3655	4686	47
3656	4687	53
3657	4688	48
3658	4689	53
3659	4690	47
3660	4691	16
3661	4692	90
3662	4693	90
3663	4698	39
3664	4699	39
3665	4700	49
3666	4701	44
3667	4702	44
3668	4707	44
3669	4708	44
3670	4709	39
3671	4710	39
3672	4711	90
3673	4712	90
3674	4717	59
3675	4718	59
3676	4719	49
3677	4720	46
3678	4721	46
3679	4726	46
3680	4727	46
3681	4728	44
3682	4729	44
3683	4736	3
3684	4737	4
3685	4738	46
3686	4739	91
3687	4740	46
3688	4741	91
3689	4742	42
3690	4744	89
3691	4745	89
3692	4746	89
3693	4795	0
3694	4797	3
3695	4798	59
3696	4800	8
3697	4801	7
3698	4802	7
3699	4803	12
3700	4804	83
3701	4805	10
3702	4806	83
3703	4807	10
3704	4808	63
3705	4809	84
3706	4810	12
3707	4811	14
3708	4812	14
3709	4813	15
3710	4814	36
3711	4815	16
3712	4816	16
3713	4819	1
3714	4820	2
3715	4821	85
3716	4822	86
3717	4824	8
3718	4825	7
3719	4826	83
3720	4827	15
3721	4828	12
3722	4829	83
3723	4830	10
3724	4831	11
3725	4832	11
3726	4833	63
3727	4834	12
3728	4835	14
3729	4836	15
3730	4837	92
3731	4838	36
3732	4839	60
3733	4840	60
3734	4841	10
3735	4842	10
3736	4843	1
3737	4844	86
3738	4845	8
3739	4846	7
3740	4849	7
3741	4850	12
3742	4851	83
3743	4852	10
3744	4854	87
3745	4855	63
3746	4856	22
3747	4857	2
3748	4858	14
3749	4859	15
3750	4860	36
3751	4861	10
3752	4862	10
3753	4863	85
3754	4865	8
3755	4866	7
3756	4867	14
3757	4868	8
3758	4869	12
3759	4870	83
3760	4871	10
3761	4872	10
3762	4873	83
3763	4874	63
3764	4877	22
3765	4878	14
3766	4879	15
3767	4880	36
3768	4881	23
3769	4882	23
3770	4883	23
3771	4884	23
3772	4885	26
3773	4886	26
3774	4887	34
3775	4888	27
3776	4889	88
3777	4891	27
3778	4892	27
3779	4893	89
3780	4894	89
3781	4897	27
3782	4898	34
3783	4900	93
3784	4901	93
3785	4904	4
3786	4905	12
3787	4907	45
3788	4908	26
3789	4909	34
3790	4910	55
3791	4912	88
3792	4913	27
3793	4915	88
3794	4916	89
3795	4917	89
3796	4919	26
3797	4920	27
3798	4921	34
3799	4923	93
3800	4924	93
3801	4927	55
3802	4928	35
3803	4929	35
3804	4930	12
3805	4935	52
3806	4936	51
3807	4937	52
3808	4938	59
3809	4939	94
3810	4940	51
3811	4941	52
3812	4942	51
3813	4943	49
3814	4944	39
3815	4945	44
3816	4946	44
3817	4947	42
3818	4951	47
3819	4952	53
3820	4953	48
3821	4954	48
3822	4955	53
3823	4956	47
3824	4957	16
3825	4962	52
3826	4963	51
3827	4964	52
3828	4965	59
3829	4966	94
3830	4967	51
3831	4968	52
3832	4969	51
3833	4970	49
3834	4971	39
3835	4972	44
3836	4973	30
3837	4974	42
3838	4978	47
3839	4979	53
3840	4980	48
3841	4981	53
3842	4982	47
3843	4983	48
3844	4984	16
3845	4985	95
3846	4986	90
3847	4987	90
3848	4992	49
3849	4993	39
3850	4994	44
3851	5000	95
3852	5001	90
3853	5002	90
3854	5007	49
3855	5008	39
3856	5009	44
3857	5020	96
3858	5021	97
3859	5022	97
3860	5023	98
3861	5024	46
3862	5025	91
3863	5026	42
3864	5037	0
3865	5039	3
3866	5040	59
3867	5042	8
3868	5043	7
3869	5044	7
3870	5045	12
3871	5046	83
3872	5047	10
3873	5048	83
3874	5049	10
3875	5050	63
3876	5051	84
3877	5052	12
3878	5053	14
3879	5054	14
3880	5055	15
3881	5056	36
3882	5057	16
3883	5058	16
3884	5061	1
3885	5062	2
3886	5063	85
3887	5064	86
3888	5066	8
3889	5067	7
3890	5068	83
3891	5069	15
3892	5070	12
3893	5071	83
3894	5072	10
3895	5073	11
3896	5074	11
3897	5075	63
3898	5076	12
3899	5077	14
3900	5078	15
3901	5079	92
3902	5080	36
3903	5081	60
3904	5082	60
3905	5083	10
3906	5084	10
3907	5085	1
3908	5086	86
3909	5087	8
3910	5088	7
3911	5091	7
3912	5092	12
3913	5093	83
3914	5094	10
3915	5096	87
3916	5097	63
3917	5098	22
3918	5099	2
3919	5100	14
3920	5101	15
3921	5102	36
3922	5103	10
3923	5104	10
3924	5105	85
3925	5107	8
3926	5108	7
3927	5109	14
3928	5110	8
3929	5111	12
3930	5112	83
3931	5113	10
3932	5114	10
3933	5115	83
3934	5116	63
3935	5119	22
3936	5120	14
3937	5121	15
3938	5122	36
3939	5123	23
3940	5124	23
3941	5125	23
3942	5126	23
3943	5127	26
3944	5128	26
3945	5129	34
3946	5130	27
3947	5131	88
3948	5133	27
3949	5134	27
3950	5135	89
3951	5136	89
3952	5139	27
3953	5140	34
3954	5142	93
3955	5143	93
3956	5146	4
3957	5147	12
3958	5149	45
3959	5150	26
3960	5151	34
3961	5152	55
3962	5154	88
3963	5155	27
3964	5157	88
3965	5158	89
3966	5159	89
3967	5161	26
3968	5162	27
3969	5163	34
3970	5165	93
3971	5166	93
3972	5169	55
3973	5170	35
3974	5171	35
3975	5172	12
3976	5177	52
3977	5178	51
3978	5179	52
3979	5180	59
3980	5181	94
3981	5182	51
3982	5183	52
3983	5184	51
3984	5185	49
3985	5186	39
3986	5187	44
3987	5188	44
3988	5189	42
3989	5193	47
3990	5194	53
3991	5195	48
3992	5196	48
3993	5197	53
3994	5198	47
3995	5199	16
3996	5204	52
3997	5205	51
3998	5206	52
3999	5207	59
4000	5208	94
4001	5209	51
4002	5210	52
4003	5211	51
4004	5212	49
4005	5213	39
4006	5214	44
4007	5215	30
4008	5216	42
4009	5220	47
4010	5221	53
4011	5222	48
4012	5223	53
4013	5224	47
4014	5225	48
4015	5226	16
4016	5227	95
4017	5228	90
4018	5229	90
4019	5234	49
4020	5235	39
4021	5236	44
4022	5242	95
4023	5243	90
4024	5244	90
4025	5249	49
4026	5250	39
4027	5251	44
4028	5262	96
4029	5263	97
4030	5264	97
4031	5265	98
4032	5266	46
4033	5267	91
4034	5268	42
4035	5279	0
4036	5281	3
4037	5282	59
4038	5284	8
4039	5285	7
4040	5286	7
4041	5287	12
4042	5288	83
4043	5289	10
4044	5290	83
4045	5291	10
4046	5292	63
4047	5293	84
4048	5294	12
4049	5295	14
4050	5296	14
4051	5297	15
4052	5298	36
4053	5299	36
4054	5300	16
4055	5301	16
4056	5303	1
4057	5304	2
4058	5305	85
4059	5306	86
4060	5308	8
4061	5309	7
4062	5310	83
4063	5311	15
4064	5312	12
4065	5313	83
4066	5314	10
4067	5315	11
4068	5316	11
4069	5317	63
4070	5318	12
4071	5319	14
4072	5320	15
4073	5321	92
4074	5322	36
4075	5323	60
4076	5324	60
4077	5325	10
4078	5326	10
4079	5327	1
4080	5328	86
4081	5329	8
4082	5330	7
4083	5332	7
4084	5333	12
4085	5334	83
4086	5335	10
4087	5337	87
4088	5338	63
4089	5339	22
4090	5340	2
4091	5341	14
4092	5342	15
4093	5343	36
4094	5344	10
4095	5345	10
4096	5346	85
4097	5348	8
4098	5349	7
4099	5350	14
4100	5351	8
4101	5352	12
4102	5353	83
4103	5354	10
4104	5355	10
4105	5356	83
4106	5357	63
4107	5359	22
4108	5360	14
4109	5361	15
4110	5362	36
4111	5363	23
4112	5364	23
4113	5365	23
4114	5366	23
4115	5367	26
4116	5368	26
4117	5369	34
4118	5370	27
4119	5371	88
4120	5373	27
4121	5374	27
4122	5375	89
4123	5376	89
4124	5379	27
4125	5380	34
4126	5382	93
4127	5383	93
4128	5386	35
4129	5387	12
4130	5389	45
4131	5390	26
4132	5391	34
4133	5392	55
4134	5394	88
4135	5395	27
4136	5397	88
4137	5398	89
4138	5399	89
4139	5401	26
4140	5402	27
4141	5403	34
4142	5405	93
4143	5406	93
4144	5409	55
4145	5410	35
4146	5411	35
4147	5412	12
4148	5417	52
4149	5418	51
4150	5419	52
4151	5420	59
4152	5421	94
4153	5422	51
4154	5423	52
4155	5424	51
4156	5425	49
4157	5426	39
4158	5427	44
4159	5428	44
4160	5429	42
4161	5433	47
4162	5434	53
4163	5435	48
4164	5436	48
4165	5437	53
4166	5438	47
4167	5439	16
4168	5440	16
4169	5445	52
4170	5446	51
4171	5447	52
4172	5448	59
4173	5449	94
4174	5450	51
4175	5451	52
4176	5452	51
4177	5453	49
4178	5454	39
4179	5455	44
4180	5456	30
4181	5457	42
4182	5461	47
4183	5462	53
4184	5463	48
4185	5464	53
4186	5465	47
4187	5466	48
4188	5467	16
4189	5468	16
4190	5469	95
4191	5470	90
4192	5471	90
4193	5476	49
4194	5477	39
4195	5478	44
4196	5484	95
4197	5485	90
4198	5486	90
4199	5491	49
4200	5492	39
4201	5493	44
4202	5504	96
4203	5505	97
4204	5506	97
4205	5507	98
4206	5508	46
4207	5509	91
4208	5510	42
4209	5525	62
4210	5531	99
4211	5532	62
4212	5533	100
4213	5534	62
4214	5535	100
4215	5536	42
4216	5542	53
4217	5543	53
4218	5544	0
4219	5546	3
4220	5547	59
4221	5549	8
4222	5550	7
4223	5551	7
4224	5552	12
4225	5553	83
4226	5554	10
4227	5555	83
4228	5556	10
4229	5557	63
4230	5558	84
4231	5559	12
4232	5560	14
4233	5561	14
4234	5562	15
4235	5563	36
4236	5564	36
4237	5565	16
4238	5566	16
4239	5568	1
4240	5569	2
4241	5570	85
4242	5571	86
4243	5573	8
4244	5574	7
4245	5575	83
4246	5576	15
4247	5577	12
4248	5578	83
4249	5579	10
4250	5580	11
4251	5581	11
4252	5582	63
4253	5583	12
4254	5584	14
4255	5585	15
4256	5586	92
4257	5587	36
4258	5588	60
4259	5589	60
4260	5590	10
4261	5591	10
4262	5592	1
4263	5593	86
4264	5594	8
4265	5595	7
4266	5597	7
4267	5598	12
4268	5599	83
4269	5600	10
4270	5602	87
4271	5603	63
4272	5604	22
4273	5605	2
4274	5606	14
4275	5607	15
4276	5608	36
4277	5609	10
4278	5610	10
4279	5611	85
4280	5613	8
4281	5614	7
4282	5615	14
4283	5616	8
4284	5617	12
4285	5618	83
4286	5619	10
4287	5620	10
4288	5621	83
4289	5622	63
4290	5624	22
4291	5625	14
4292	5626	15
4293	5627	36
4294	5628	23
4295	5629	23
4296	5630	23
4297	5631	23
4298	5632	26
4299	5633	26
4300	5634	34
4301	5635	27
4302	5636	88
4303	5638	27
4304	5639	27
4305	5640	89
4306	5641	89
4307	5644	27
4308	5645	34
4309	5647	93
4310	5648	93
4311	5651	35
4312	5652	12
4313	5654	45
4314	5655	26
4315	5656	34
4316	5657	55
4317	5659	88
4318	5660	27
4319	5662	88
4320	5663	89
4321	5664	89
4322	5666	26
4323	5667	27
4324	5668	34
4325	5670	93
4326	5671	93
4327	5674	55
4328	5675	35
4329	5676	35
4330	5677	12
4331	5682	52
4332	5683	51
4333	5684	52
4334	5685	59
4335	5686	94
4336	5687	51
4337	5688	52
4338	5689	51
4339	5690	49
4340	5691	39
4341	5692	44
4342	5693	44
4343	5694	42
4344	5698	47
4345	5699	53
4346	5700	48
4347	5701	48
4348	5702	53
4349	5703	47
4350	5704	16
4351	5705	16
4352	5710	52
4353	5711	51
4354	5712	52
4355	5713	59
4356	5714	94
4357	5715	51
4358	5716	52
4359	5717	51
4360	5718	49
4361	5719	39
4362	5720	44
4363	5721	30
4364	5722	42
4365	5726	47
4366	5727	53
4367	5728	48
4368	5729	53
4369	5730	47
4370	5731	48
4371	5732	16
4372	5733	16
4373	5734	95
4374	5735	90
4375	5736	90
4376	5741	49
4377	5742	39
4378	5743	44
4379	5749	95
4380	5750	90
4381	5751	90
4382	5756	49
4383	5757	39
4384	5758	44
4385	5769	96
4386	5770	97
4387	5771	97
4388	5772	98
4389	5773	46
4390	5774	91
4391	5775	42
4392	5790	62
4393	5796	99
4394	5797	62
4395	5798	100
4396	5799	62
4397	5800	100
4398	5801	42
4399	5807	53
4400	5808	53
4401	5809	0
4402	5811	3
4403	5812	59
4404	5814	8
4405	5815	7
4406	5816	7
4407	5817	12
4408	5818	83
4409	5819	10
4410	5820	83
4411	5821	10
4412	5822	63
4413	5823	84
4414	5824	12
4415	5825	14
4416	5826	14
4417	5827	15
4418	5828	36
4419	5829	36
4420	5830	16
4421	5831	16
4422	5833	1
4423	5834	2
4424	5835	85
4425	5836	86
4426	5838	8
4427	5839	7
4428	5840	83
4429	5841	15
4430	5842	12
4431	5843	83
4432	5844	10
4433	5845	11
4434	5846	11
4435	5847	63
4436	5848	12
4437	5849	14
4438	5850	15
4439	5851	92
4440	5852	36
4441	5853	60
4442	5854	60
4443	5855	10
4444	5856	10
4445	5857	1
4446	5858	86
4447	5859	8
4448	5860	7
4449	5862	7
4450	5863	12
4451	5864	83
4452	5865	10
4453	5867	87
4454	5868	63
4455	5869	22
4456	5870	2
4457	5871	14
4458	5872	15
4459	5873	36
4460	5874	10
4461	5875	10
4462	5876	85
4463	5878	8
4464	5879	7
4465	5880	14
4466	5881	8
4467	5882	12
4468	5883	83
4469	5884	10
4470	5885	10
4471	5886	83
4472	5887	63
4473	5889	22
4474	5890	14
4475	5891	15
4476	5892	36
4477	5893	23
4478	5894	23
4479	5895	23
4480	5896	23
4481	5897	26
4482	5898	26
4483	5899	34
4484	5900	27
4485	5901	88
4486	5903	27
4487	5904	27
4488	5905	89
4489	5906	89
4490	5909	27
4491	5910	34
4492	5912	93
4493	5913	93
4494	5916	35
4495	5917	12
4496	5919	45
4497	5920	26
4498	5921	34
4499	5922	55
4500	5924	88
4501	5925	27
4502	5927	88
4503	5928	89
4504	5929	89
4505	5931	26
4506	5932	27
4507	5933	34
4508	5935	93
4509	5936	93
4510	5939	55
4511	5940	35
4512	5941	35
4513	5942	12
4514	5947	52
4515	5948	51
4516	5949	52
4517	5950	59
4518	5951	94
4519	5952	51
4520	5953	52
4521	5954	51
4522	5955	49
4523	5956	39
4524	5957	44
4525	5958	44
4526	5959	42
4527	5963	47
4528	5964	53
4529	5965	48
4530	5966	48
4531	5967	53
4532	5968	47
4533	5969	16
4534	5970	16
4535	5975	52
4536	5976	51
4537	5977	52
4538	5978	59
4539	5979	94
4540	5980	51
4541	5981	52
4542	5982	51
4543	5983	49
4544	5984	39
4545	5985	44
4546	5986	30
4547	5987	42
4548	5991	47
4549	5992	53
4550	5993	48
4551	5994	53
4552	5995	47
4553	5996	48
4554	5997	16
4555	5998	16
4556	5999	95
4557	6000	90
4558	6001	90
4559	6006	49
4560	6007	39
4561	6008	44
4562	6014	95
4563	6015	90
4564	6016	90
4565	6021	49
4566	6022	39
4567	6023	44
4568	6034	96
4569	6035	97
4570	6036	97
4571	6037	98
4572	6038	46
4573	6039	91
4574	6040	42
4575	6055	62
4576	6061	99
4577	6062	62
4578	6063	100
4579	6064	62
4580	6065	100
4581	6066	42
4582	6072	53
4583	6073	53
4584	6074	0
4585	6076	3
4586	6077	59
4587	6079	8
4588	6080	7
4589	6081	7
4590	6082	12
4591	6083	83
4592	6084	10
4593	6085	83
4594	6086	10
4595	6087	63
4596	6088	84
4597	6089	12
4598	6090	14
4599	6091	14
4600	6092	15
4601	6093	36
4602	6094	36
4603	6095	16
4604	6096	16
4605	6098	1
4606	6099	2
4607	6100	85
4608	6101	86
4609	6103	8
4610	6104	7
4611	6105	83
4612	6106	15
4613	6107	12
4614	6108	83
4615	6109	10
4616	6110	11
4617	6111	11
4618	6112	63
4619	6113	12
4620	6114	14
4621	6115	15
4622	6116	92
4623	6117	36
4624	6118	60
4625	6119	60
4626	6120	10
4627	6121	10
4628	6122	1
4629	6123	86
4630	6124	8
4631	6125	7
4632	6127	7
4633	6128	12
4634	6129	83
4635	6130	10
4636	6132	87
4637	6133	63
4638	6134	22
4639	6135	2
4640	6136	14
4641	6137	15
4642	6138	36
4643	6139	10
4644	6140	10
4645	6141	85
4646	6143	8
4647	6144	7
4648	6145	14
4649	6146	8
4650	6147	12
4651	6148	83
4652	6149	10
4653	6150	10
4654	6151	83
4655	6152	63
4656	6154	22
4657	6155	14
4658	6156	15
4659	6157	36
4660	6158	23
4661	6159	23
4662	6160	23
4663	6161	23
4664	6162	26
4665	6163	26
4666	6164	34
4667	6165	27
4668	6166	88
4669	6168	27
4670	6169	27
4671	6170	89
4672	6171	89
4673	6174	27
4674	6175	34
4675	6177	93
4676	6178	93
4677	6181	35
4678	6182	12
4679	6184	45
4680	6185	26
4681	6186	34
4682	6187	55
4683	6189	88
4684	6190	27
4685	6192	88
4686	6193	89
4687	6194	89
4688	6196	26
4689	6197	27
4690	6198	34
4691	6200	93
4692	6201	93
4693	6204	55
4694	6205	35
4695	6206	35
4696	6207	12
4697	6212	52
4698	6213	51
4699	6214	52
4700	6215	59
4701	6216	94
4702	6217	51
4703	6218	52
4704	6219	51
4705	6220	49
4706	6221	39
4707	6222	44
4708	6223	44
4709	6224	42
4710	6233	47
4711	6234	53
4712	6235	48
4713	6236	48
4714	6237	53
4715	6238	47
4716	6239	16
4717	6240	16
4718	6245	52
4719	6246	51
4720	6247	52
4721	6248	59
4722	6249	94
4723	6250	51
4724	6251	52
4725	6252	51
4726	6253	49
4727	6254	39
4728	6255	44
4729	6256	30
4730	6257	42
4731	6266	47
4732	6267	53
4733	6268	48
4734	6269	53
4735	6270	47
4736	6271	48
4737	6272	16
4738	6273	16
4739	6274	95
4740	6275	90
4741	6276	90
4742	6281	49
4743	6282	39
4744	6283	44
4745	6289	95
4746	6290	90
4747	6291	90
4748	6296	49
4749	6297	39
4750	6298	44
4751	6309	96
4752	6310	97
4753	6311	97
4754	6312	98
4755	6313	46
4756	6314	91
4757	6315	42
4758	6330	62
4759	6336	99
4760	6337	62
4761	6338	100
4762	6339	62
4763	6340	100
4764	6341	42
4765	6347	53
4766	6348	53
4767	6349	0
4768	6351	3
4769	6352	59
4770	6354	8
4771	6355	7
4772	6356	7
4773	6357	12
4774	6358	83
4775	6359	10
4776	6360	83
4777	6361	10
4778	6362	63
4779	6363	84
4780	6364	12
4781	6365	14
4782	6366	14
4783	6367	15
4784	6368	36
4785	6369	36
4786	6370	16
4787	6371	16
4788	6373	1
4789	6374	2
4790	6375	85
4791	6376	86
4792	6378	8
4793	6379	7
4794	6380	83
4795	6381	15
4796	6382	12
4797	6383	83
4798	6384	10
4799	6385	11
4800	6386	11
4801	6387	63
4802	6388	12
4803	6389	14
4804	6390	15
4805	6391	92
4806	6392	36
4807	6393	60
4808	6394	60
4809	6395	10
4810	6396	10
4811	6397	1
4812	6398	86
4813	6399	8
4814	6400	7
4815	6402	7
4816	6403	12
4817	6404	83
4818	6405	10
4819	6407	87
4820	6408	63
4821	6409	22
4822	6410	2
4823	6411	14
4824	6412	15
4825	6413	36
4826	6414	10
4827	6415	10
4828	6416	85
4829	6418	8
4830	6419	7
4831	6420	14
4832	6421	8
4833	6422	12
4834	6423	83
4835	6424	10
4836	6425	10
4837	6426	83
4838	6427	63
4839	6429	22
4840	6430	14
4841	6431	15
4842	6432	36
4843	6433	23
4844	6434	23
4845	6435	23
4846	6436	23
4847	6437	26
4848	6438	26
4849	6439	34
4850	6440	27
4851	6441	88
4852	6443	27
4853	6444	27
4854	6445	89
4855	6446	89
4856	6449	27
4857	6450	34
4858	6452	93
4859	6453	93
4860	6456	35
4861	6457	12
4862	6459	45
4863	6460	26
4864	6461	34
4865	6462	55
4866	6464	88
4867	6465	27
4868	6467	88
4869	6468	89
4870	6469	89
4871	6471	26
4872	6472	27
4873	6473	34
4874	6475	93
4875	6476	93
4876	6479	55
4877	6480	35
4878	6481	35
4879	6482	12
4880	6487	52
4881	6488	51
4882	6489	52
4883	6490	59
4884	6491	94
4885	6492	51
4886	6493	52
4887	6494	51
4888	6495	49
4889	6496	39
4890	6497	44
4891	6498	44
4892	6499	42
4893	6508	47
4894	6509	53
4895	6510	48
4896	6511	48
4897	6512	53
4898	6513	47
4899	6514	16
4900	6515	16
4901	6520	52
4902	6521	51
4903	6522	52
4904	6523	59
4905	6524	94
4906	6525	51
4907	6526	52
4908	6527	51
4909	6528	49
4910	6529	39
4911	6530	44
4912	6531	30
4913	6532	42
4914	6541	47
4915	6542	53
4916	6543	48
4917	6544	53
4918	6545	47
4919	6546	48
4920	6547	16
4921	6548	16
4922	6549	95
4923	6550	90
4924	6551	90
4925	6556	49
4926	6557	39
4927	6558	44
4928	6564	95
4929	6565	90
4930	6566	90
4931	6571	49
4932	6572	39
4933	6573	44
4934	6584	96
4935	6585	97
4936	6586	97
4937	6587	98
4938	6588	46
4939	6589	91
4940	6590	42
4941	6605	62
4942	6611	99
4943	6612	62
4944	6613	100
4945	6614	62
4946	6615	100
4947	6616	42
4948	6622	53
4949	6623	53
\.


--
-- TOC entry 4941 (class 0 OID 142610)
-- Dependencies: 240
-- Data for Name: sc_rasp7_rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp7_rooms (id, rasp7_id, room) FROM stdin;
4221	4221	А-307
4222	4222	Д-210
4223	4223	Г-102
4224	4224	Б-209-2
4225	4225	А-2
4226	4226	А-314
4227	4227	И-205-а
4228	4228	И-205-а
4229	4229	А-177
4230	4230	А-13
4231	4231	А-13
4232	4232	И-317
4233	4233	А-13
4234	4234	Б-115
4235	4235	ФОК-9
4236	4236	Б-209-2
4237	4237	А-17
4238	4238	А-13
4239	4239	Б-209-2
4240	4240	Г-102
4241	4241	А-13
4242	4242	А-13
4243	4243	Б-209-2
4244	4244	дист.
4245	4245	И-329\nИ-318
4246	4246	И-329\nИ-318
4247	4247	А-214
4248	4248	А-222
4249	4249	А-2
4250	4250	Б-209-2
4251	4251	А-3
4252	4252	Г-102
4253	4253	ФОК-11
4254	4254	А-177
4255	4255	А-13
4256	4256	А-13
4257	4257	И-203-б
4258	4258	И-203-б
4259	4259	А-13
4260	4260	Б-115
4261	4261	Б-209-2
4262	4262	А-17
4263	4263	А-13
4264	4264	Б-209-2
4265	4265	А-177
4266	4266	А-13
4267	4267	А-13
4268	4268	Б-209-2
4269	4269	дист.
4270	4270	А-321
4271	4271	И-306\nИ-319
4272	4272	Г-102
4273	4273	А-2
4274	4274	Б-209-2
4275	4275	Б-209-2
4276	4276	Г-102
4277	4277	А-177
4278	4278	А-13
4279	4279	А-13
4280	4280	Г-420-1
4281	4281	Г-420-1
4282	4282	ФОК-4
4283	4283	А-13
4284	4284	Б-115
4285	4285	А-17
4286	4286	А-13
4287	4287	А-208
4288	4288	А-217
4289	4289	А-13
4290	4290	А-13
4291	4291	Б-209-2
4292	4292	Б-209-2
4293	4293	дист.
4294	4294	А-321
4295	4295	Г-102
4296	4296	Г-412
4297	4297	Г-412
4298	4298	А-2
4299	4299	ФОК-5
4300	4300	Г-102
4301	4301	Б-209-2
4302	4302	Б-209-2
4303	4303	А-13
4304	4304	А-13
4305	4305	Г-102
4306	4306	Д-210
4307	4307	А-13
4308	4308	Б-115
4309	4309	А-17
4310	4310	А-13
4311	4311	А-217
4312	4312	И-302\nИ-318
4313	4313	А-13
4314	4314	А-13
4315	4315	Б-209-2
4316	4316	Б-209-2
4317	4317	дист.
4318	4318	А-318
4319	4319	А-13
4320	4320	А-13
4321	4321	Б-209-2
4322	4322	А-16
4323	4323	А-13
4324	4324	А-218
4325	4325	ФОК-12
4326	4326	И-202-б
4327	4327	А-215
4328	4328	И-324
4329	4329	А-180
4330	4330	А-4
4331	4331	Б-209-2
4332	4332	А-13
4333	4333	А-13
4334	4334	А-211
4335	4335	А-174-б
4336	4336	А-13
4337	4337	Б-209-2
4338	4338	дист.
4339	4339	А-13
4340	4340	А-13
4341	4341	ФОК-3
4342	4342	А-16
4343	4343	А-13
4344	4344	Г-413
4345	4345	А-180
4346	4346	А-174-б
4347	4347	А-174-б
4348	4348	Б-209-2
4349	4349	А-4
4350	4350	А-13
4351	4351	А-13
4352	4352	А-218
4353	4353	И-307\nИ-314
4354	4354	Б-209-2
4355	4355	А-211
4356	4356	А-13
4357	4357	А-216
4358	4358	Б-209-2
4359	4359	дист.
4360	4360	None
4361	4361	None
4362	4362	None
4363	4363	None
4364	4364	дист.
4365	4365	А-173
4366	4366	А-13
4367	4367	Б-209
4368	4368	Б-209
4369	4369	А-113
4370	4370	Б-209
4371	4371	А-113
4372	4372	Б-209
4373	4373	Б-209
4374	4374	А-113
4375	4375	Б-209
4376	4376	А-113
4377	4377	Б-209-1
4378	4378	А-13
4379	4379	А-13
4380	4380	Б-209-2
4381	4381	А-318
4382	4382	А-216
4383	4383	None
4384	4384	None
4385	4385	None
4386	4386	None
4387	4387	дист.
4388	4388	А-13
4389	4389	Б-209
4390	4390	Б-209
4391	4391	А-113
4392	4392	Б-209
4393	4393	А-113
4394	4394	Б-209
4395	4395	Б-209
4396	4396	А-113
4397	4397	Б-209
4398	4398	А-113
4399	4399	Б-209-1
4400	4400	А-13
4401	4401	А-13
4402	4402	А-305
4403	4403	Б-209-1
4404	4404	А-216
4405	4405	А-318
4406	4406	Б-209
4407	4407	Б-209
4408	4408	Б-209
4409	4409	А-316
4410	4410	А-113
4411	4411	А-316
4412	4412	А-113
4413	4413	НИР
4414	4414	НИР
4415	4415	НИР
4416	4416	НИР
4417	4417	Б-209
4418	4418	А-113
4419	4419	Б-209
4420	4420	Б-115
4421	4421	Г-102
4422	4422	А-205
4423	4423	А-173
4424	4424	А-8
4425	4425	А-173
4426	4426	Б-115
4427	4427	А-181
4428	4428	А-173
4429	4429	None
4430	4430	None
4431	4431	None
4432	4432	None
4433	4433	А-4
4434	4434	А-4
4435	4435	А-314
4436	4436	А-207
4437	4437	Б-209
4438	4438	Б-209
4439	4439	Б-209
4440	4440	А-316
4441	4441	А-113
4442	4442	А-316
4443	4443	А-113
4444	4444	НИР
4445	4445	НИР
4446	4446	НИР
4447	4447	НИР
4448	4448	Б-209
4449	4449	А-113
4450	4450	Б-209
4451	4451	Б-115
4452	4452	Г-102
4453	4453	А-205
4454	4454	А-204
4455	4455	А-8
4456	4456	А-204
4457	4457	Б-115
4458	4458	А-181
4459	4459	None
4460	4460	None
4461	4461	None
4462	4462	None
4463	4463	А-4
4464	4464	А-4
4465	4465	А-314
4466	4466	А-207
4467	4467	Б-209-1
4468	4468	А-107
4469	4469	А-107
4470	4470	И-315
4471	4471	И-315
4472	4472	А-311
4473	4473	А-311
4474	4474	А-325
4475	4475	ИВЦ-117
4476	4476	Б-209-1
4477	4477	А-211
4478	4478	Б-209-1
4479	4479	Б-209
4480	4480	А-205
4481	4481	Б-209
4482	4482	None
4483	4483	None
4484	4484	None
4485	4485	None
4486	4486	None
4487	4487	None
4488	4488	None
4489	4489	None
4490	4490	None
4491	4491	None
4492	4492	None
4493	4493	Б-209-1
4494	4494	Б-209-1
4495	4495	Г-423
4496	4496	Г-213
4497	4497	База
4498	4498	База
4499	4499	None
4500	4500	None
4501	4501	А-178
4502	4502	None
4503	4503	None
4504	4504	А-307
4505	4505	дист.
4506	4506	дист.
4507	4507	А-243-а\nМП-1
4508	4508	А-243-а\nМП-1
4509	4509	А-311
4510	4510	А-311
4511	4511	дист.
4512	4512	А-206
4513	4513	None
4514	4514	Б-209
4515	4515	None
4516	4516	Б-209
4517	4517	ФОК
4518	4518	Б-209
4519	4519	None
4520	4520	А-13
4521	4521	А-13
4522	4522	А-217
4523	4523	А-1
4524	4524	А-13
4525	4525	А-13
4526	4526	А-328
4527	4527	А-173
4528	4528	А-1
4529	4529	А-173
4530	4530	Б-209
4531	4531	Г-102
4532	4532	А-13
4533	4533	А-13
4534	4534	А-1
4535	4535	None
4536	4536	None
4537	4537	А-174-б
4538	4538	Г-102
4539	4539	А-218
4540	4540	Г-102
4541	4541	А-13
4542	4542	А-13
4543	4543	А-1
4544	4544	А-13
4545	4545	А-13
4546	4546	Б-209
4547	4547	Б-209
4548	4548	None
4549	4549	А-1
4550	4550	Б-209
4551	4551	А-13
4552	4552	А-13
4553	4553	А-1
4554	4554	ИВЦ-116
4555	4555	ИВЦ-116
4556	4556	None
4557	4557	Б-209
4558	4558	Б-209
4559	4559	None
4560	4560	А-173
4561	4561	Г-102
4562	4562	А-13
4563	4563	А-13
4564	4564	None
4565	4565	None
4566	4566	А-1
4567	4567	А-13
4568	4568	А-13
4569	4569	ФОК
4570	4570	А-203
4571	4571	А-1
4572	4572	А-328
4573	4573	А-177
4574	4574	А-13
4575	4575	А-13
4576	4576	А-1
4577	4577	Б-209
4578	4578	Б-209
4579	4579	None
4580	4580	А-218
4581	4581	ФОК
4582	4582	А-13
4583	4583	А-13
4584	4584	А-318
4585	4585	Г-102
4586	4586	А-1
4587	4587	А-13
4588	4588	А-13
4589	4589	А-328
4590	4590	А-1
4591	4591	А-13
4592	4592	А-13
4593	4593	А-1
4594	4594	А-13
4595	4595	А-215
4596	4596	А-107
4597	4597	А-217
4598	4598	А-213-м
4599	4599	А-13
4600	4600	А-13
4601	4601	А-215
4602	4602	Б-209
4603	4603	None
4604	4604	ФОК
4605	4605	None
4606	4606	А-13
4607	4607	А-13
4608	4608	А-13
4609	4609	Б-209
4610	4610	Б-209
4611	4611	А-61(МП-1)
4612	4612	А-231(МП-1)
4613	4613	А-175
4614	4614	Б-209-1
4615	4615	И-201
4616	4616	Б-209-2
4617	4617	А-13
4618	4618	А-107
4619	4619	Г-102
4620	4620	И-201
4621	4621	А-13
4622	4622	А-13
4623	4623	None
4624	4624	Б-209
4625	4625	А-213-м
4626	4626	Б-209
4627	4627	ФОК
4628	4628	А-215
4629	4629	А-13
4630	4630	А-13
4631	4631	А-13
4632	4632	Б-209
4633	4633	Б-209
4634	4634	А-61(МП-1)
4635	4635	А-350(МП-1)
4636	4636	А-175
4637	4637	Б-209-2
4638	4638	Б-209-1
4639	4639	None
4640	4640	None
4641	4641	None
4642	4642	None
4643	4643	Б-209
4644	4644	Д-208
4645	4645	ИВЦ-105-1
4646	4646	ИВЦ-105-1
4647	4647	ИВЦ-105-1
4648	4648	ИВЦ-105-1
4649	4649	Б-209-2
4650	4650	Б-209-1
4651	4651	Д-208
4652	4652	None
4653	4653	ИВЦ-105-1
4654	4654	Д-208
4655	4655	None
4656	4656	None
4657	4657	None
4658	4658	None
4659	4659	А-15
4660	4660	А-11
4661	4661	А-11
4662	4662	А-107
4663	4663	Г-213
4664	4664	А-217
4665	4665	Б-209
4666	4666	None
4667	4667	None
4668	4668	None
4669	4669	None
4670	4670	Б-209
4671	4671	Д-208
4672	4672	ИВЦ-105-2
4673	4673	ИВЦ-105-2
4674	4674	ИВЦ-105-2
4675	4675	ИВЦ-105-2
4676	4676	Б-209-1
4677	4677	Б-209-2
4678	4678	Д-208
4679	4679	None
4680	4680	ИВЦ-105-2
4681	4681	Д-208
4682	4682	None
4683	4683	None
4684	4684	None
4685	4685	None
4686	4686	А-15
4687	4687	А-11
4688	4688	А-11
4689	4689	Г-213
4690	4690	А-217
4691	4691	Б-209
4692	4692	Б-209
4693	4693	Б-209
4694	4694	НИР
4695	4695	НИР
4696	4696	НИР
4697	4697	НИР
4698	4698	Б-209-2
4699	4699	Б-209-2
4700	4700	А-316
4701	4701	Б-209-1
4702	4702	Б-209-1
4703	4703	None
4704	4704	None
4705	4705	None
4706	4706	None
4707	4707	Б-209-1
4708	4708	Б-209-1
4709	4709	Б-209-2
4710	4710	Б-209-2
4711	4711	Б-209
4712	4712	Б-209
4713	4713	НИР
4714	4714	НИР
4715	4715	НИР
4716	4716	НИР
4717	4717	Б-209-1
4718	4718	Б-209-1
4719	4719	А-316
4720	4720	Б-209-2
4721	4721	Б-209-2
4722	4722	None
4723	4723	None
4724	4724	None
4725	4725	None
4726	4726	Б-209-2
4727	4727	Б-209-2
4728	4728	Б-209-1
4729	4729	Б-209-1
4730	4730	None
4731	4731	None
4732	4732	None
4733	4733	None
4734	4734	None
4735	4735	None
4736	4736	Б-209-2
4737	4737	None
4738	4738	База
4739	4739	ауд-78
4740	4740	None
4741	4741	Б-209-2
4742	4742	Б-209-1
4743	4743	None
4744	4744	Б-209-2
4745	4745	Б-209-2
4746	4746	Б-209-2
4747	4747	None
4748	4748	None
4749	4749	None
4750	4750	None
4751	4751	None
4752	4752	None
4753	4753	None
4754	4754	None
4755	4755	None
4756	4756	None
4757	4757	None
4758	4758	None
4759	4759	None
4760	4760	None
4761	4761	None
4762	4762	None
4763	4763	None
4764	4764	None
4765	4765	None
4766	4766	None
4767	4767	None
4768	4768	None
4769	4769	None
4770	4770	None
4771	4771	None
4772	4772	None
4773	4773	None
4774	4774	None
4775	4775	None
4776	4776	None
4777	4777	None
4778	4778	None
4779	4779	None
4780	4780	None
4781	4781	None
4782	4782	None
4783	4783	None
4784	4784	None
4785	4785	None
4786	4786	None
4787	4787	None
4788	4788	None
4789	4789	None
4790	4790	None
4791	4791	None
4792	4792	None
4793	4793	None
4794	4794	None
4795	4795	А-206
4796	4796	None
4797	4797	Б-209-2
4798	4798	Б-209-2
4799	4799	ФОК
4800	4800	А-13
4801	4801	А-13
4802	4802	А-217
4803	4803	А-1
4804	4804	А-13
4805	4805	А-13
4806	4806	А-328
4807	4807	А-173
4808	4808	А-1
4809	4809	А-173
4810	4810	Б-209-2
4811	4811	Г-102
4812	4812	А-13
4813	4813	А-13
4814	4814	А-1
4815	4815	Б-209-2
4816	4816	Б-209-2
4817	4817	None
4818	4818	None
4819	4819	А-174-б
4820	4820	Г-102
4821	4821	А-218
4822	4822	Г-102
4823	4823	ФОК
4824	4824	А-13
4825	4825	А-13
4826	4826	А-203
4827	4827	А-207
4828	4828	А-1
4829	4829	А-13
4830	4830	А-13
4831	4831	Б-209-2
4832	4832	Б-209-2
4833	4833	А-1
4834	4834	Б-209-2
4835	4835	А-13
4836	4836	А-13
4837	4837	Б-209-2
4838	4838	А-1
4839	4839	ИВЦ-116
4840	4840	ИВЦ-116
4841	4841	Б-209-2
4842	4842	Б-209-2
4843	4843	А-173
4844	4844	Г-102
4845	4845	А-13
4846	4846	А-13
4847	4847	None
4848	4848	None
4849	4849	А-217
4850	4850	А-1
4851	4851	А-13
4852	4852	А-13
4853	4853	ФОК
4854	4854	А-203
4855	4855	А-1
4856	4856	А-328
4857	4857	А-177
4858	4858	А-13
4859	4859	А-13
4860	4860	А-1
4861	4861	Б-209-2
4862	4862	Б-209-2
4863	4863	А-218
4864	4864	ФОК
4865	4865	А-13
4866	4866	А-13
4867	4867	А-318
4868	4868	Г-102
4869	4869	А-1
4870	4870	А-13
4871	4871	А-13
4872	4872	А-173
4873	4873	А-328
4874	4874	А-1
4875	4875	None
4876	4876	None
4877	4877	А-328
4878	4878	А-13
4879	4879	А-13
4880	4880	А-1
4881	4881	Б-209-2
4882	4882	Б-209-2
4883	4883	Б-209-2
4884	4884	Б-209-2
4885	4885	А-13
4886	4886	А-215
4887	4887	А-107
4888	4888	А-217
4889	4889	А-213-м
4890	4890	А-13
4891	4891	А-13
4892	4892	А-215
4893	4893	А-182
4894	4894	Б-209-2
4895	4895	ФОК
4896	4896	None
4897	4897	А-13
4898	4898	А-13
4899	4899	А-13
4900	4900	Б-209
4901	4901	Б-209
4902	4902	А-61(МП-1)
4903	4903	А-231(МП-1)
4904	4904	А-175
4905	4905	Б-209-1
4906	4906	И-201
4907	4907	Б-209-2
4908	4908	А-13
4909	4909	А-107
4910	4910	Г-102
4911	4911	И-201
4912	4912	А-13
4913	4913	А-13
4914	4914	None
4915	4915	А-213-м
4916	4916	А-182
4917	4917	Б-209-2
4918	4918	ФОК
4919	4919	А-215
4920	4920	А-13
4921	4921	А-13
4922	4922	А-13
4923	4923	Б-209
4924	4924	Б-209
4925	4925	А-61(МП-1)
4926	4926	А-350(МП-1)
4927	4927	А-107
4928	4928	А-175
4929	4929	Б-209-2
4930	4930	Б-209-1
4931	4931	None
4932	4932	None
4933	4933	None
4934	4934	None
4935	4935	Д-208
4936	4936	ИВЦ-116
4937	4937	ИВЦ-116
4938	4938	Б-209-2
4939	4939	ИВЦ-116
4940	4940	ИВЦ-116
4941	4941	Б-209
4942	4942	Б-209
4943	4943	Б-209
4944	4944	Б-209
4945	4945	Д-208
4946	4946	???
4947	4947	Д-208
4948	4948	None
4949	4949	None
4950	4950	None
4951	4951	А-15
4952	4952	А-11
4953	4953	А-11
4954	4954	А-107
4955	4955	Г-213
4956	4956	А-217
4957	4957	Б-209
4958	4958	None
4959	4959	None
4960	4960	None
4961	4961	None
4962	4962	Д-208
4963	4963	ИВЦ-116
4964	4964	ИВЦ-116
4965	4965	Б-209-2
4966	4966	ИВЦ-116
4967	4967	ИВЦ-116
4968	4968	Б-209
4969	4969	Б-209
4970	4970	Б-209
4971	4971	Б-209
4972	4972	Д-208
4973	4973	???
4974	4974	Д-208
4975	4975	None
4976	4976	None
4977	4977	None
4978	4978	А-15
4979	4979	А-11
4980	4980	А-11
4981	4981	Г-213
4982	4982	А-217
4983	4983	А-107
4984	4984	Б-209
4985	4985	База
4986	4986	Б-209
4987	4987	Б-209
4988	4988	None
4989	4989	None
4990	4990	None
4991	4991	None
4992	4992	Б-209
4993	4993	Б-209
4994	4994	А-316
4995	4995	None
4996	4996	None
4997	4997	None
4998	4998	None
4999	4999	None
5000	5000	База
5001	5001	Б-209
5002	5002	Б-209
5003	5003	None
5004	5004	None
5005	5005	None
5006	5006	None
5007	5007	Б-209
5008	5008	Б-209
5009	5009	А-316
5010	5010	None
5011	5011	None
5012	5012	None
5013	5013	None
5014	5014	None
5015	5015	None
5016	5016	None
5017	5017	None
5018	5018	None
5019	5019	None
5020	5020	Б-209-1
5021	5021	Б-209-1
5022	5022	Б-209-2
5023	5023	База
5024	5024	???
5025	5025	Б-209-2
5026	5026	Б-209-1
5027	5027	None
5028	5028	None
5029	5029	None
5030	5030	None
5031	5031	None
5032	5032	None
5033	5033	None
5034	5034	None
5035	5035	None
5036	5036	None
5037	5037	А-206
5038	5038	None
5039	5039	Б-209-2
5040	5040	Б-209-2
5041	5041	ФОК
5042	5042	А-13
5043	5043	А-13
5044	5044	А-217
5045	5045	А-1
5046	5046	А-13
5047	5047	А-13
5048	5048	А-328
5049	5049	А-173
5050	5050	А-1
5051	5051	А-173
5052	5052	Б-209-2
5053	5053	Г-102
5054	5054	А-13
5055	5055	А-13
5056	5056	А-1
5057	5057	Б-209-2
5058	5058	Б-209-2
5059	5059	None
5060	5060	None
5061	5061	А-174-б
5062	5062	Г-102
5063	5063	А-218
5064	5064	Г-102
5065	5065	ФОК
5066	5066	А-13
5067	5067	А-13
5068	5068	А-203
5069	5069	А-207
5070	5070	А-1
5071	5071	А-13
5072	5072	А-13
5073	5073	Б-209-2
5074	5074	Б-209-2
5075	5075	А-1
5076	5076	Б-209-2
5077	5077	А-13
5078	5078	А-13
5079	5079	Б-209-2
5080	5080	А-1
5081	5081	ИВЦ-116
5082	5082	ИВЦ-116
5083	5083	Б-209-2
5084	5084	Б-209-2
5085	5085	А-173
5086	5086	Г-102
5087	5087	А-13
5088	5088	А-13
5089	5089	None
5090	5090	None
5091	5091	А-217
5092	5092	А-1
5093	5093	А-13
5094	5094	А-13
5095	5095	ФОК
5096	5096	А-203
5097	5097	А-1
5098	5098	А-328
5099	5099	А-177
5100	5100	А-13
5101	5101	А-13
5102	5102	А-1
5103	5103	Б-209-2
5104	5104	Б-209-2
5105	5105	А-218
5106	5106	ФОК
5107	5107	А-13
5108	5108	А-13
5109	5109	А-318
5110	5110	Г-102
5111	5111	А-1
5112	5112	А-13
5113	5113	А-13
5114	5114	А-173
5115	5115	А-328
5116	5116	А-1
5117	5117	None
5118	5118	None
5119	5119	А-328
5120	5120	А-13
5121	5121	А-13
5122	5122	А-1
5123	5123	Б-209-2
5124	5124	Б-209-2
5125	5125	Б-209-2
5126	5126	Б-209-2
5127	5127	А-13
5128	5128	А-215
5129	5129	А-107
5130	5130	А-217
5131	5131	А-213-м
5132	5132	А-13
5133	5133	А-13
5134	5134	А-215
5135	5135	А-182
5136	5136	Б-209-2
5137	5137	ФОК
5138	5138	None
5139	5139	А-13
5140	5140	А-13
5141	5141	А-13
5142	5142	Б-209
5143	5143	Б-209
5144	5144	А-61(МП-1)
5145	5145	А-231(МП-1)
5146	5146	А-175
5147	5147	Б-209-1
5148	5148	И-201
5149	5149	Б-209-2
5150	5150	А-13
5151	5151	А-107
5152	5152	Г-102
5153	5153	И-201
5154	5154	А-13
5155	5155	А-13
5156	5156	None
5157	5157	А-213-м
5158	5158	А-182
5159	5159	Б-209-2
5160	5160	ФОК
5161	5161	А-215
5162	5162	А-13
5163	5163	А-13
5164	5164	А-13
5165	5165	Б-209
5166	5166	Б-209
5167	5167	А-61(МП-1)
5168	5168	А-350(МП-1)
5169	5169	А-107
5170	5170	А-175
5171	5171	Б-209-2
5172	5172	Б-209-1
5173	5173	None
5174	5174	None
5175	5175	None
5176	5176	None
5177	5177	Д-208
5178	5178	ИВЦ-116
5179	5179	ИВЦ-116
5180	5180	Б-209-2
5181	5181	ИВЦ-116
5182	5182	ИВЦ-116
5183	5183	Б-209
5184	5184	Б-209
5185	5185	Б-209
5186	5186	Б-209
5187	5187	Д-208
5188	5188	???
5189	5189	Д-208
5190	5190	None
5191	5191	None
5192	5192	None
5193	5193	А-15
5194	5194	А-11
5195	5195	А-11
5196	5196	А-107
5197	5197	Г-213
5198	5198	А-217
5199	5199	Б-209
5200	5200	None
5201	5201	None
5202	5202	None
5203	5203	None
5204	5204	Д-208
5205	5205	ИВЦ-116
5206	5206	ИВЦ-116
5207	5207	Б-209-2
5208	5208	ИВЦ-116
5209	5209	ИВЦ-116
5210	5210	Б-209
5211	5211	Б-209
5212	5212	Б-209
5213	5213	Б-209
5214	5214	Д-208
5215	5215	???
5216	5216	Д-208
5217	5217	None
5218	5218	None
5219	5219	None
5220	5220	А-15
5221	5221	А-11
5222	5222	А-11
5223	5223	Г-213
5224	5224	А-217
5225	5225	А-107
5226	5226	Б-209
5227	5227	База
5228	5228	Б-209
5229	5229	Б-209
5230	5230	None
5231	5231	None
5232	5232	None
5233	5233	None
5234	5234	Б-209
5235	5235	Б-209
5236	5236	А-316
5237	5237	None
5238	5238	None
5239	5239	None
5240	5240	None
5241	5241	None
5242	5242	База
5243	5243	Б-209
5244	5244	Б-209
5245	5245	None
5246	5246	None
5247	5247	None
5248	5248	None
5249	5249	Б-209
5250	5250	Б-209
5251	5251	А-316
5252	5252	None
5253	5253	None
5254	5254	None
5255	5255	None
5256	5256	None
5257	5257	None
5258	5258	None
5259	5259	None
5260	5260	None
5261	5261	None
5262	5262	Б-209-1
5263	5263	Б-209-1
5264	5264	Б-209-2
5265	5265	База
5266	5266	???
5267	5267	Б-209-2
5268	5268	Б-209-1
5269	5269	None
5270	5270	None
5271	5271	None
5272	5272	None
5273	5273	None
5274	5274	None
5275	5275	None
5276	5276	None
5277	5277	None
5278	5278	None
5279	5279	А-206
5280	5280	И-309\nИ-308
5281	5281	Б-209-2
5282	5282	Б-209-2
5283	5283	ФОК
5284	5284	А-13
5285	5285	А-13
5286	5286	А-217
5287	5287	А-1
5288	5288	А-13
5289	5289	А-13
5290	5290	А-328
5291	5291	А-173
5292	5292	А-1
5293	5293	А-173
5294	5294	Б-209-2
5295	5295	Г-102
5296	5296	А-13
5297	5297	А-13
5298	5298	Дист.
5299	5299	Б-209-2
5300	5300	Б-209-2
5301	5301	Б-209-2
5302	5302	И-307\nИ-308
5303	5303	А-174-б
5304	5304	Г-102
5305	5305	А-218
5306	5306	Г-102
5307	5307	ФОК
5308	5308	А-13
5309	5309	А-13
5310	5310	А-203
5311	5311	А-207
5312	5312	А-1
5313	5313	А-13
5314	5314	А-13
5315	5315	Б-209-2
5316	5316	Б-209-2
5317	5317	А-1
5318	5318	Б-209-2
5319	5319	А-13
5320	5320	А-13
5321	5321	Б-209-2
5322	5322	Дист.
5323	5323	ИВЦ-116
5324	5324	ИВЦ-116
5325	5325	Б-209-2
5326	5326	Б-209-2
5327	5327	А-173
5328	5328	Г-102
5329	5329	А-13
5330	5330	А-13
5331	5331	И-304\nИ-305
5332	5332	А-217
5333	5333	А-1
5334	5334	А-13
5335	5335	А-13
5336	5336	ФОК
5337	5337	А-203
5338	5338	А-1
5339	5339	А-328
5340	5340	А-177
5341	5341	А-13
5342	5342	А-13
5343	5343	Дист.
5344	5344	Б-209-2
5345	5345	Б-209-2
5346	5346	А-218
5347	5347	ФОК
5348	5348	А-13
5349	5349	А-13
5350	5350	А-318
5351	5351	Г-102
5352	5352	А-1
5353	5353	А-13
5354	5354	А-13
5355	5355	А-173
5356	5356	А-328
5357	5357	А-1
5358	5358	И-315\nИ-317
5359	5359	А-328
5360	5360	А-13
5361	5361	А-13
5362	5362	Дист.
5363	5363	Б-209-2
5364	5364	Б-209-2
5365	5365	Б-209-2
5366	5366	Б-209-2
5367	5367	А-13
5368	5368	А-215
5369	5369	А-107
5370	5370	А-217
5371	5371	А-213-м
5372	5372	А-13
5373	5373	А-13
5374	5374	А-215
5375	5375	А-182
5376	5376	Б-209-2
5377	5377	ФОК
5378	5378	???
5379	5379	А-13
5380	5380	А-13
5381	5381	А-13
5382	5382	Б-209
5383	5383	Б-209
5384	5384	А-61\n(МП-1)
5385	5385	А-231\n(МП-1)
5386	5386	А-175
5387	5387	Б-209-1
5388	5388	И-201
5389	5389	Б-209-2
5390	5390	А-13
5391	5391	А-107
5392	5392	Г-102
5393	5393	И-201
5394	5394	А-13
5395	5395	А-13
5396	5396	И-313
5397	5397	А-213-м
5398	5398	А-182
5399	5399	Б-209-2
5400	5400	ФОК
5401	5401	А-215
5402	5402	А-13
5403	5403	А-13
5404	5404	А-13
5405	5405	Б-209
5406	5406	Б-209
5407	5407	А-61\n(МП-1)
5408	5408	А-350\n(МП-1)
5409	5409	А-107
5410	5410	А-175
5411	5411	Б-209-2
5412	5412	Б-209-1
5413	5413	None
5414	5414	None
5415	5415	None
5416	5416	None
5417	5417	Д-208
5418	5418	ИВЦ-116
5419	5419	ИВЦ-116
5420	5420	Б-209-2
5421	5421	Б-209-1
5422	5422	ИВЦ-116
5423	5423	Б-209
5424	5424	Б-209
5425	5425	Б-209
5426	5426	Б-209
5427	5427	Д-208
5428	5428	А-329
5429	5429	Д-208
5430	5430	None
5431	5431	None
5432	5432	None
5433	5433	А-15
5434	5434	А-11
5435	5435	А-11
5436	5436	А-107
5437	5437	Г-213
5438	5438	А-217
5439	5439	А-1
5440	5440	Б-209
5441	5441	None
5442	5442	None
5443	5443	None
5444	5444	None
5445	5445	Д-208
5446	5446	ИВЦ-116
5447	5447	ИВЦ-116
5448	5448	Б-209-2
5449	5449	Б-209-1
5450	5450	ИВЦ-116
5451	5451	Б-209
5452	5452	Б-209
5453	5453	Б-209
5454	5454	Б-209
5455	5455	Д-208
5456	5456	А-222
5457	5457	Д-208
5458	5458	None
5459	5459	None
5460	5460	None
5461	5461	А-15
5462	5462	А-11
5463	5463	А-11
5464	5464	Г-213
5465	5465	А-217
5466	5466	А-107
5467	5467	А-1
5468	5468	Б-209
5469	5469	База
5470	5470	Б-209
5471	5471	Б-209
5472	5472	None
5473	5473	None
5474	5474	None
5475	5475	None
5476	5476	Б-209
5477	5477	Б-209
5478	5478	А-316
5479	5479	None
5480	5480	None
5481	5481	None
5482	5482	None
5483	5483	None
5484	5484	База
5485	5485	Б-209
5486	5486	Б-209
5487	5487	None
5488	5488	None
5489	5489	None
5490	5490	None
5491	5491	Б-209
5492	5492	Б-209
5493	5493	А-316
5494	5494	None
5495	5495	None
5496	5496	None
5497	5497	None
5498	5498	None
5499	5499	None
5500	5500	None
5501	5501	None
5502	5502	None
5503	5503	None
5504	5504	Б-209-1
5505	5505	Б-209-1
5506	5506	Б-209-2
5507	5507	База
5508	5508	???
5509	5509	Б-209-2
5510	5510	Б-209-1
5511	5511	None
5512	5512	None
5513	5513	None
5514	5514	None
5515	5515	None
5516	5516	None
5517	5517	None
5518	5518	None
5519	5519	None
5520	5520	None
5521	5521	None
5522	5522	None
5523	5523	None
5524	5524	None
5525	5525	А-215
5526	5526	None
5527	5527	None
5528	5528	None
5529	5529	None
5530	5530	None
5531	5531	None
5532	5532	None
5533	5533	None
5534	5534	None
5535	5535	None
5536	5536	Б-209-1
5537	5537	None
5538	5538	None
5539	5539	None
5540	5540	None
5541	5541	None
5542	5542	None
5543	5543	None
5544	5544	А-206
5545	5545	И-309\nИ-308
5546	5546	Б-209-2
5547	5547	Б-209-2
5548	5548	ФОК
5549	5549	А-13
5550	5550	А-13
5551	5551	А-217
5552	5552	А-1
5553	5553	А-13
5554	5554	А-13
5555	5555	А-328
5556	5556	А-173
5557	5557	А-1
5558	5558	А-173
5559	5559	Б-209-2
5560	5560	Г-102
5561	5561	А-13
5562	5562	А-13
5563	5563	Дист.
5564	5564	Б-209-2
5565	5565	Б-209-2
5566	5566	Б-209-2
5567	5567	И-307\nИ-308
5568	5568	А-174-б
5569	5569	Г-102
5570	5570	А-218
5571	5571	Г-102
5572	5572	ФОК
5573	5573	А-13
5574	5574	А-13
5575	5575	А-203
5576	5576	А-207
5577	5577	А-1
5578	5578	А-13
5579	5579	А-13
5580	5580	Б-209-2
5581	5581	Б-209-2
5582	5582	А-1
5583	5583	Б-209-2
5584	5584	А-13
5585	5585	А-13
5586	5586	Б-209-2
5587	5587	Дист.
5588	5588	ИВЦ-116
5589	5589	ИВЦ-116
5590	5590	Б-209-2
5591	5591	Б-209-2
5592	5592	А-173
5593	5593	Г-102
5594	5594	А-13
5595	5595	А-13
5596	5596	И-304\nИ-305
5597	5597	А-217
5598	5598	А-1
5599	5599	А-13
5600	5600	А-13
5601	5601	ФОК
5602	5602	А-203
5603	5603	А-1
5604	5604	А-328
5605	5605	А-177
5606	5606	А-13
5607	5607	А-13
5608	5608	Дист.
5609	5609	Б-209-2
5610	5610	Б-209-2
5611	5611	А-218
5612	5612	ФОК
5613	5613	А-13
5614	5614	А-13
5615	5615	А-318
5616	5616	Г-102
5617	5617	А-1
5618	5618	А-13
5619	5619	А-13
5620	5620	А-173
5621	5621	А-328
5622	5622	А-1
5623	5623	И-315\nИ-317
5624	5624	А-328
5625	5625	А-13
5626	5626	А-13
5627	5627	Дист.
5628	5628	Б-209-2
5629	5629	Б-209-2
5630	5630	Б-209-2
5631	5631	Б-209-2
5632	5632	А-13
5633	5633	А-215
5634	5634	А-107
5635	5635	А-217
5636	5636	А-213-м
5637	5637	А-13
5638	5638	А-13
5639	5639	А-215
5640	5640	А-182
5641	5641	Б-209-2
5642	5642	ФОК
5643	5643	???
5644	5644	А-13
5645	5645	А-13
5646	5646	А-13
5647	5647	Б-209
5648	5648	Б-209
5649	5649	А-61\n(МП-1)
5650	5650	А-231\n(МП-1)
5651	5651	А-175
5652	5652	Б-209-1
5653	5653	И-201
5654	5654	Б-209-2
5655	5655	А-13
5656	5656	А-107
5657	5657	Г-102
5658	5658	И-201
5659	5659	А-13
5660	5660	А-13
5661	5661	И-313
5662	5662	А-213-м
5663	5663	А-182
5664	5664	Б-209-2
5665	5665	ФОК
5666	5666	А-215
5667	5667	А-13
5668	5668	А-13
5669	5669	А-13
5670	5670	Б-209
5671	5671	Б-209
5672	5672	А-61\n(МП-1)
5673	5673	А-350\n(МП-1)
5674	5674	А-107
5675	5675	А-175
5676	5676	Б-209-2
5677	5677	Б-209-1
5678	5678	None
5679	5679	None
5680	5680	None
5681	5681	None
5682	5682	Д-208
5683	5683	ИВЦ-116
5684	5684	ИВЦ-116
5685	5685	Б-209-2
5686	5686	Б-209-1
5687	5687	ИВЦ-116
5688	5688	Б-209
5689	5689	Б-209
5690	5690	Б-209
5691	5691	Б-209
5692	5692	Д-208
5693	5693	А-329
5694	5694	Д-208
5695	5695	None
5696	5696	None
5697	5697	None
5698	5698	А-15
5699	5699	А-11
5700	5700	А-11
5701	5701	А-107
5702	5702	Г-213
5703	5703	А-217
5704	5704	А-1
5705	5705	Б-209
5706	5706	None
5707	5707	None
5708	5708	None
5709	5709	None
5710	5710	Д-208
5711	5711	ИВЦ-116
5712	5712	ИВЦ-116
5713	5713	Б-209-2
5714	5714	Б-209-1
5715	5715	ИВЦ-116
5716	5716	Б-209
5717	5717	Б-209
5718	5718	Б-209
5719	5719	Б-209
5720	5720	Д-208
5721	5721	А-222
5722	5722	Д-208
5723	5723	None
5724	5724	None
5725	5725	None
5726	5726	А-15
5727	5727	А-11
5728	5728	А-11
5729	5729	Г-213
5730	5730	А-217
5731	5731	А-107
5732	5732	А-1
5733	5733	Б-209
5734	5734	База
5735	5735	Б-209
5736	5736	Б-209
5737	5737	None
5738	5738	None
5739	5739	None
5740	5740	None
5741	5741	Б-209
5742	5742	Б-209
5743	5743	А-316
5744	5744	None
5745	5745	None
5746	5746	None
5747	5747	None
5748	5748	None
5749	5749	База
5750	5750	Б-209
5751	5751	Б-209
5752	5752	None
5753	5753	None
5754	5754	None
5755	5755	None
5756	5756	Б-209
5757	5757	Б-209
5758	5758	А-316
5759	5759	None
5760	5760	None
5761	5761	None
5762	5762	None
5763	5763	None
5764	5764	None
5765	5765	None
5766	5766	None
5767	5767	None
5768	5768	None
5769	5769	Б-209-1
5770	5770	Б-209-1
5771	5771	Б-209-2
5772	5772	База
5773	5773	???
5774	5774	Б-209-2
5775	5775	Б-209-1
5776	5776	None
5777	5777	None
5778	5778	None
5779	5779	None
5780	5780	None
5781	5781	None
5782	5782	None
5783	5783	None
5784	5784	None
5785	5785	None
5786	5786	None
5787	5787	None
5788	5788	None
5789	5789	None
5790	5790	А-215
5791	5791	None
5792	5792	None
5793	5793	None
5794	5794	None
5795	5795	None
5796	5796	None
5797	5797	None
5798	5798	None
5799	5799	None
5800	5800	None
5801	5801	Б-209-1
5802	5802	None
5803	5803	None
5804	5804	None
5805	5805	None
5806	5806	None
5807	5807	None
5808	5808	None
5809	5809	А-206
5810	5810	И-309\nИ-308
5811	5811	Б-209-2
5812	5812	Б-209-2
5813	5813	ФОК
5814	5814	А-13
5815	5815	А-13
5816	5816	А-217
5817	5817	А-1
5818	5818	А-13
5819	5819	А-13
5820	5820	А-328
5821	5821	А-173
5822	5822	А-1
5823	5823	А-173
5824	5824	Б-209-2
5825	5825	Г-102
5826	5826	А-13
5827	5827	А-13
5828	5828	Дист.
5829	5829	Б-209-2
5830	5830	Б-209-2
5831	5831	Б-209-2
5832	5832	И-307\nИ-308
5833	5833	А-174-б
5834	5834	Г-102
5835	5835	А-218
5836	5836	Г-102
5837	5837	ФОК
5838	5838	А-13
5839	5839	А-13
5840	5840	А-203
5841	5841	А-207
5842	5842	А-1
5843	5843	А-13
5844	5844	А-13
5845	5845	Б-209-2
5846	5846	Б-209-2
5847	5847	А-1
5848	5848	Б-209-2
5849	5849	А-13
5850	5850	А-13
5851	5851	Б-209-2
5852	5852	Дист.
5853	5853	ИВЦ-116
5854	5854	ИВЦ-116
5855	5855	Б-209-2
5856	5856	Б-209-2
5857	5857	А-173
5858	5858	Г-102
5859	5859	А-13
5860	5860	А-13
5861	5861	И-304\nИ-305
5862	5862	А-217
5863	5863	А-1
5864	5864	А-13
5865	5865	А-13
5866	5866	ФОК
5867	5867	А-203
5868	5868	А-1
5869	5869	А-328
5870	5870	А-177
5871	5871	А-13
5872	5872	А-13
5873	5873	Дист.
5874	5874	Б-209-2
5875	5875	Б-209-2
5876	5876	А-218
5877	5877	ФОК
5878	5878	А-13
5879	5879	А-13
5880	5880	А-318
5881	5881	Г-102
5882	5882	А-1
5883	5883	А-13
5884	5884	А-13
5885	5885	А-173
5886	5886	А-328
5887	5887	А-1
5888	5888	И-315\nИ-317
5889	5889	А-328
5890	5890	А-13
5891	5891	А-13
5892	5892	Дист.
5893	5893	Б-209-2
5894	5894	Б-209-2
5895	5895	Б-209-2
5896	5896	Б-209-2
5897	5897	А-13
5898	5898	А-215
5899	5899	А-107
5900	5900	А-217
5901	5901	А-213-м
5902	5902	А-13
5903	5903	А-13
5904	5904	А-215
5905	5905	А-182
5906	5906	Б-209-2
5907	5907	ФОК
5908	5908	???
5909	5909	А-13
5910	5910	А-13
5911	5911	А-13
5912	5912	Б-209
5913	5913	Б-209
5914	5914	А-61\n(МП-1)
5915	5915	А-231\n(МП-1)
5916	5916	А-175
5917	5917	Б-209-1
5918	5918	И-201
5919	5919	Б-209-2
5920	5920	А-13
5921	5921	А-107
5922	5922	Г-102
5923	5923	И-201
5924	5924	А-13
5925	5925	А-13
5926	5926	И-313
5927	5927	А-213-м
5928	5928	А-182
5929	5929	Б-209-2
5930	5930	ФОК
5931	5931	А-215
5932	5932	А-13
5933	5933	А-13
5934	5934	А-13
5935	5935	Б-209
5936	5936	Б-209
5937	5937	А-61\n(МП-1)
5938	5938	А-350\n(МП-1)
5939	5939	А-107
5940	5940	А-175
5941	5941	Б-209-2
5942	5942	Б-209-1
5943	5943	None
5944	5944	None
5945	5945	None
5946	5946	None
5947	5947	Д-208
5948	5948	ИВЦ-116
5949	5949	ИВЦ-116
5950	5950	Б-209-2
5951	5951	Б-209-1
5952	5952	ИВЦ-116
5953	5953	Б-209
5954	5954	Б-209
5955	5955	Б-209
5956	5956	Б-209
5957	5957	Д-208
5958	5958	А-329
5959	5959	Д-208
5960	5960	None
5961	5961	None
5962	5962	None
5963	5963	А-15
5964	5964	А-11
5965	5965	А-11
5966	5966	А-107
5967	5967	Г-213
5968	5968	А-217
5969	5969	А-1
5970	5970	Б-209
5971	5971	None
5972	5972	None
5973	5973	None
5974	5974	None
5975	5975	Д-208
5976	5976	ИВЦ-116
5977	5977	ИВЦ-116
5978	5978	Б-209-2
5979	5979	Б-209-1
5980	5980	ИВЦ-116
5981	5981	Б-209
5982	5982	Б-209
5983	5983	Б-209
5984	5984	Б-209
5985	5985	Д-208
5986	5986	А-222
5987	5987	Д-208
5988	5988	None
5989	5989	None
5990	5990	None
5991	5991	А-15
5992	5992	А-11
5993	5993	А-11
5994	5994	Г-213
5995	5995	А-217
5996	5996	А-107
5997	5997	А-1
5998	5998	Б-209
5999	5999	База
6000	6000	Б-209
6001	6001	Б-209
6002	6002	None
6003	6003	None
6004	6004	None
6005	6005	None
6006	6006	Б-209
6007	6007	Б-209
6008	6008	А-316
6009	6009	None
6010	6010	None
6011	6011	None
6012	6012	None
6013	6013	None
6014	6014	База
6015	6015	Б-209
6016	6016	Б-209
6017	6017	None
6018	6018	None
6019	6019	None
6020	6020	None
6021	6021	Б-209
6022	6022	Б-209
6023	6023	А-316
6024	6024	None
6025	6025	None
6026	6026	None
6027	6027	None
6028	6028	None
6029	6029	None
6030	6030	None
6031	6031	None
6032	6032	None
6033	6033	None
6034	6034	Б-209-1
6035	6035	Б-209-1
6036	6036	Б-209-2
6037	6037	База
6038	6038	???
6039	6039	Б-209-2
6040	6040	Б-209-1
6041	6041	None
6042	6042	None
6043	6043	None
6044	6044	None
6045	6045	None
6046	6046	None
6047	6047	None
6048	6048	None
6049	6049	None
6050	6050	None
6051	6051	None
6052	6052	None
6053	6053	None
6054	6054	None
6055	6055	А-215
6056	6056	None
6057	6057	None
6058	6058	None
6059	6059	None
6060	6060	None
6061	6061	None
6062	6062	None
6063	6063	None
6064	6064	None
6065	6065	None
6066	6066	Б-209-1
6067	6067	None
6068	6068	None
6069	6069	None
6070	6070	None
6071	6071	None
6072	6072	None
6073	6073	None
6074	6074	А-206
6075	6075	И-309\nИ-308
6076	6076	Б-209-2
6077	6077	Б-209-2
6078	6078	ФОК
6079	6079	А-13
6080	6080	А-13
6081	6081	А-217
6082	6082	А-1
6083	6083	А-13
6084	6084	А-13
6085	6085	А-328
6086	6086	А-173
6087	6087	А-1
6088	6088	А-173
6089	6089	Б-209-2
6090	6090	Г-102
6091	6091	А-13
6092	6092	А-13
6093	6093	Дист.
6094	6094	Б-209-2
6095	6095	Б-209-2
6096	6096	Б-209-2
6097	6097	И-307\nИ-308
6098	6098	А-174-б
6099	6099	Г-102
6100	6100	А-218
6101	6101	Г-102
6102	6102	ФОК
6103	6103	А-13
6104	6104	А-13
6105	6105	А-203
6106	6106	А-207
6107	6107	А-1
6108	6108	А-13
6109	6109	А-13
6110	6110	Б-209-2
6111	6111	Б-209-2
6112	6112	А-1
6113	6113	Б-209-2
6114	6114	А-13
6115	6115	А-13
6116	6116	Б-209-2
6117	6117	Дист.
6118	6118	ИВЦ-116
6119	6119	ИВЦ-116
6120	6120	Б-209-2
6121	6121	Б-209-2
6122	6122	А-173
6123	6123	Г-102
6124	6124	А-13
6125	6125	А-13
6126	6126	И-304\nИ-305
6127	6127	А-217
6128	6128	А-1
6129	6129	А-13
6130	6130	А-13
6131	6131	ФОК
6132	6132	А-203
6133	6133	А-1
6134	6134	А-328
6135	6135	А-177
6136	6136	А-13
6137	6137	А-13
6138	6138	Дист.
6139	6139	Б-209-2
6140	6140	Б-209-2
6141	6141	А-218
6142	6142	ФОК
6143	6143	А-13
6144	6144	А-13
6145	6145	А-318
6146	6146	Г-102
6147	6147	А-1
6148	6148	А-13
6149	6149	А-13
6150	6150	А-173
6151	6151	А-328
6152	6152	А-1
6153	6153	И-315\nИ-317
6154	6154	А-328
6155	6155	А-13
6156	6156	А-13
6157	6157	Дист.
6158	6158	Б-209-2
6159	6159	Б-209-2
6160	6160	Б-209-2
6161	6161	Б-209-2
6162	6162	А-13
6163	6163	А-215
6164	6164	А-107
6165	6165	А-217
6166	6166	А-213-м
6167	6167	А-13
6168	6168	А-13
6169	6169	А-215
6170	6170	А-182
6171	6171	Б-209-2
6172	6172	ФОК
6173	6173	???
6174	6174	А-13
6175	6175	А-13
6176	6176	А-13
6177	6177	Б-209
6178	6178	Б-209
6179	6179	А-61\n(МП-1)
6180	6180	А-231\n(МП-1)
6181	6181	А-175
6182	6182	Б-209-1
6183	6183	И-201
6184	6184	Б-209-2
6185	6185	А-13
6186	6186	А-107
6187	6187	Г-102
6188	6188	И-201
6189	6189	А-13
6190	6190	А-13
6191	6191	И-313
6192	6192	А-213-м
6193	6193	А-182
6194	6194	Б-209-2
6195	6195	ФОК
6196	6196	А-215
6197	6197	А-13
6198	6198	А-13
6199	6199	А-13
6200	6200	Б-209
6201	6201	Б-209
6202	6202	А-61\n(МП-1)
6203	6203	А-350\n(МП-1)
6204	6204	А-107
6205	6205	А-175
6206	6206	Б-209-2
6207	6207	Б-209-1
6208	6208	None
6209	6209	None
6210	6210	None
6211	6211	None
6212	6212	Д-208
6213	6213	ИВЦ-116
6214	6214	ИВЦ-116
6215	6215	Б-209-2
6216	6216	Б-209-1
6217	6217	ИВЦ-116
6218	6218	Б-209
6219	6219	Б-209
6220	6220	Б-209
6221	6221	Б-209
6222	6222	Д-208
6223	6223	А-329
6224	6224	Д-208
6225	6225	None
6226	6226	None
6227	6227	None
6228	6228	None
6229	6229	None
6230	6230	None
6231	6231	None
6232	6232	None
6233	6233	А-15
6234	6234	А-11
6235	6235	А-11
6236	6236	А-107
6237	6237	Г-213
6238	6238	А-217
6239	6239	А-1
6240	6240	Б-209
6241	6241	None
6242	6242	None
6243	6243	None
6244	6244	None
6245	6245	Д-208
6246	6246	ИВЦ-116
6247	6247	ИВЦ-116
6248	6248	Б-209-2
6249	6249	Б-209-1
6250	6250	ИВЦ-116
6251	6251	Б-209
6252	6252	Б-209
6253	6253	Б-209
6254	6254	Б-209
6255	6255	Д-208
6256	6256	А-222
6257	6257	Д-208
6258	6258	None
6259	6259	None
6260	6260	None
6261	6261	None
6262	6262	None
6263	6263	None
6264	6264	None
6265	6265	None
6266	6266	А-15
6267	6267	А-11
6268	6268	А-11
6269	6269	Г-213
6270	6270	А-217
6271	6271	А-107
6272	6272	А-1
6273	6273	Б-209
6274	6274	База
6275	6275	Б-209
6276	6276	Б-209
6277	6277	None
6278	6278	None
6279	6279	None
6280	6280	None
6281	6281	Б-209
6282	6282	Б-209
6283	6283	А-316
6284	6284	None
6285	6285	None
6286	6286	None
6287	6287	None
6288	6288	None
6289	6289	База
6290	6290	Б-209
6291	6291	Б-209
6292	6292	None
6293	6293	None
6294	6294	None
6295	6295	None
6296	6296	Б-209
6297	6297	Б-209
6298	6298	А-316
6299	6299	None
6300	6300	None
6301	6301	None
6302	6302	None
6303	6303	None
6304	6304	None
6305	6305	None
6306	6306	None
6307	6307	None
6308	6308	None
6309	6309	Б-209-1
6310	6310	Б-209-1
6311	6311	Б-209-2
6312	6312	База
6313	6313	???
6314	6314	Б-209-2
6315	6315	Б-209-1
6316	6316	None
6317	6317	None
6318	6318	None
6319	6319	None
6320	6320	None
6321	6321	None
6322	6322	None
6323	6323	None
6324	6324	None
6325	6325	None
6326	6326	None
6327	6327	None
6328	6328	None
6329	6329	None
6330	6330	А-215
6331	6331	None
6332	6332	None
6333	6333	None
6334	6334	None
6335	6335	None
6336	6336	None
6337	6337	None
6338	6338	None
6339	6339	None
6340	6340	None
6341	6341	Б-209-1
6342	6342	None
6343	6343	None
6344	6344	None
6345	6345	None
6346	6346	None
6347	6347	None
6348	6348	None
6349	6349	А-206
6350	6350	И-309\nИ-308
6351	6351	Б-209-2
6352	6352	Б-209-2
6353	6353	ФОК
6354	6354	А-13
6355	6355	А-13
6356	6356	А-217
6357	6357	А-1
6358	6358	А-13
6359	6359	А-13
6360	6360	А-328
6361	6361	А-173
6362	6362	А-1
6363	6363	А-173
6364	6364	Б-209-2
6365	6365	Г-102
6366	6366	А-13
6367	6367	А-13
6368	6368	Дист.
6369	6369	Б-209-2
6370	6370	Б-209-2
6371	6371	Б-209-2
6372	6372	И-307\nИ-308
6373	6373	А-174-б
6374	6374	Г-102
6375	6375	А-218
6376	6376	Г-102
6377	6377	ФОК
6378	6378	А-13
6379	6379	А-13
6380	6380	А-203
6381	6381	А-207
6382	6382	А-1
6383	6383	А-13
6384	6384	А-13
6385	6385	Б-209-2
6386	6386	Б-209-2
6387	6387	А-1
6388	6388	Б-209-2
6389	6389	А-13
6390	6390	А-13
6391	6391	Б-209-2
6392	6392	Дист.
6393	6393	ИВЦ-116
6394	6394	ИВЦ-116
6395	6395	Б-209-2
6396	6396	Б-209-2
6397	6397	А-173
6398	6398	Г-102
6399	6399	А-13
6400	6400	А-13
6401	6401	И-304\nИ-305
6402	6402	А-217
6403	6403	А-1
6404	6404	А-13
6405	6405	А-13
6406	6406	ФОК
6407	6407	А-203
6408	6408	А-1
6409	6409	А-328
6410	6410	А-177
6411	6411	А-13
6412	6412	А-13
6413	6413	Дист.
6414	6414	Б-209-2
6415	6415	Б-209-2
6416	6416	А-218
6417	6417	ФОК
6418	6418	А-13
6419	6419	А-13
6420	6420	А-318
6421	6421	Г-102
6422	6422	А-1
6423	6423	А-13
6424	6424	А-13
6425	6425	А-173
6426	6426	А-328
6427	6427	А-1
6428	6428	И-315\nИ-317
6429	6429	А-328
6430	6430	А-13
6431	6431	А-13
6432	6432	Дист.
6433	6433	Б-209-2
6434	6434	Б-209-2
6435	6435	Б-209-2
6436	6436	Б-209-2
6437	6437	А-13
6438	6438	А-215
6439	6439	А-107
6440	6440	А-217
6441	6441	А-213-м
6442	6442	А-13
6443	6443	А-13
6444	6444	А-215
6445	6445	А-182
6446	6446	Б-209-2
6447	6447	ФОК
6448	6448	???
6449	6449	А-13
6450	6450	А-13
6451	6451	А-13
6452	6452	Б-209
6453	6453	Б-209
6454	6454	А-61\n(МП-1)
6455	6455	А-231\n(МП-1)
6456	6456	А-175
6457	6457	Б-209-1
6458	6458	И-201
6459	6459	Б-209-2
6460	6460	А-13
6461	6461	А-107
6462	6462	Г-102
6463	6463	И-201
6464	6464	А-13
6465	6465	А-13
6466	6466	И-313
6467	6467	А-213-м
6468	6468	А-182
6469	6469	Б-209-2
6470	6470	ФОК
6471	6471	А-215
6472	6472	А-13
6473	6473	А-13
6474	6474	А-13
6475	6475	Б-209
6476	6476	Б-209
6477	6477	А-61\n(МП-1)
6478	6478	А-350\n(МП-1)
6479	6479	А-107
6480	6480	А-175
6481	6481	Б-209-2
6482	6482	Б-209-1
6483	6483	None
6484	6484	None
6485	6485	None
6486	6486	None
6487	6487	Д-208
6488	6488	ИВЦ-116
6489	6489	ИВЦ-116
6490	6490	Б-209-2
6491	6491	Б-209-1
6492	6492	ИВЦ-116
6493	6493	Б-209
6494	6494	Б-209
6495	6495	Б-209
6496	6496	Б-209
6497	6497	Д-208
6498	6498	А-329
6499	6499	Д-208
6500	6500	None
6501	6501	None
6502	6502	None
6503	6503	None
6504	6504	None
6505	6505	None
6506	6506	None
6507	6507	None
6508	6508	А-15
6509	6509	А-11
6510	6510	А-11
6511	6511	А-107
6512	6512	Г-213
6513	6513	А-217
6514	6514	А-1
6515	6515	Б-209
6516	6516	None
6517	6517	None
6518	6518	None
6519	6519	None
6520	6520	Д-208
6521	6521	ИВЦ-116
6522	6522	ИВЦ-116
6523	6523	Б-209-2
6524	6524	Б-209-1
6525	6525	ИВЦ-116
6526	6526	Б-209
6527	6527	Б-209
6528	6528	Б-209
6529	6529	Б-209
6530	6530	Д-208
6531	6531	А-222
6532	6532	Д-208
6533	6533	None
6534	6534	None
6535	6535	None
6536	6536	None
6537	6537	None
6538	6538	None
6539	6539	None
6540	6540	None
6541	6541	А-15
6542	6542	А-11
6543	6543	А-11
6544	6544	Г-213
6545	6545	А-217
6546	6546	А-107
6547	6547	А-1
6548	6548	Б-209
6549	6549	База
6550	6550	Б-209
6551	6551	Б-209
6552	6552	None
6553	6553	None
6554	6554	None
6555	6555	None
6556	6556	Б-209
6557	6557	Б-209
6558	6558	А-316
6559	6559	None
6560	6560	None
6561	6561	None
6562	6562	None
6563	6563	None
6564	6564	База
6565	6565	Б-209
6566	6566	Б-209
6567	6567	None
6568	6568	None
6569	6569	None
6570	6570	None
6571	6571	Б-209
6572	6572	Б-209
6573	6573	А-316
6574	6574	None
6575	6575	None
6576	6576	None
6577	6577	None
6578	6578	None
6579	6579	None
6580	6580	None
6581	6581	None
6582	6582	None
6583	6583	None
6584	6584	Б-209-1
6585	6585	Б-209-1
6586	6586	Б-209-2
6587	6587	База
6588	6588	???
6589	6589	Б-209-2
6590	6590	Б-209-1
6591	6591	None
6592	6592	None
6593	6593	None
6594	6594	None
6595	6595	None
6596	6596	None
6597	6597	None
6598	6598	None
6599	6599	None
6600	6600	None
6601	6601	None
6602	6602	None
6603	6603	None
6604	6604	None
6605	6605	А-215
6606	6606	None
6607	6607	None
6608	6608	None
6609	6609	None
6610	6610	None
6611	6611	None
6612	6612	None
6613	6613	None
6614	6614	None
6615	6615	None
6616	6616	Б-209-1
6617	6617	None
6618	6618	None
6619	6619	None
6620	6620	None
6621	6621	None
6622	6622	None
6623	6623	None
\.


--
-- TOC entry 4947 (class 0 OID 192025)
-- Dependencies: 246
-- Data for Name: sc_worktypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_worktypes (id, title) FROM stdin;
0	пр
1	лк
2	лб
10	конс
11	экз
12	зач
13	зач-д
14	кр
15	кп
\.


--
-- TOC entry 4944 (class 0 OID 142617)
-- Dependencies: 243
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, first_name, middle_name, last_name, email, login, add_date, subgroup, locked) FROM stdin;
\.


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 216
-- Name: sc_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_department_id_seq', 1, false);


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 222
-- Name: sc_rasp18_days_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp18_days_id_seq', 6983, true);


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 224
-- Name: sc_rasp18_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp18_groups_id_seq', 435515, true);


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 225
-- Name: sc_rasp18_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp18_id_seq', 116364, true);


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 227
-- Name: sc_rasp18_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp18_info_id_seq', 1, false);


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 229
-- Name: sc_rasp18_move_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp18_move_id_seq', 53, true);


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 231
-- Name: sc_rasp18_preps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp18_preps_id_seq', 297000, true);


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 233
-- Name: sc_rasp18_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp18_rooms_id_seq', 302848, true);


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 236
-- Name: sc_rasp7_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp7_groups_id_seq', 6624, true);


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 237
-- Name: sc_rasp7_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp7_id_seq', 6623, true);


--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 239
-- Name: sc_rasp7_preps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp7_preps_id_seq', 4949, true);


--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 241
-- Name: sc_rasp7_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp7_rooms_id_seq', 6623, true);


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 242
-- Name: sc_rasp7_version_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp7_version_seq', 1, false);


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 245
-- Name: sc_worktypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_worktypes_id_seq', 1, false);


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 244
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 1, false);


--
-- TOC entry 4727 (class 2606 OID 142637)
-- Name: sc_department sc_department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_department
    ADD CONSTRAINT sc_department_pkey PRIMARY KEY (id);


--
-- TOC entry 4731 (class 2606 OID 142639)
-- Name: sc_disc sc_disc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_disc
    ADD CONSTRAINT sc_disc_pkey PRIMARY KEY (id);


--
-- TOC entry 4734 (class 2606 OID 142641)
-- Name: sc_group sc_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_group
    ADD CONSTRAINT sc_group_pkey PRIMARY KEY (id);


--
-- TOC entry 4738 (class 2606 OID 142643)
-- Name: sc_prep sc_prep_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_prep
    ADD CONSTRAINT sc_prep_pkey PRIMARY KEY (id);


--
-- TOC entry 4745 (class 2606 OID 142645)
-- Name: sc_rasp18_days sc_rasp18_days_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_days
    ADD CONSTRAINT sc_rasp18_days_pkey PRIMARY KEY (id);


--
-- TOC entry 4748 (class 2606 OID 142647)
-- Name: sc_rasp18_groups sc_rasp18_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_groups
    ADD CONSTRAINT sc_rasp18_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4751 (class 2606 OID 142649)
-- Name: sc_rasp18_info sc_rasp18_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_info
    ADD CONSTRAINT sc_rasp18_info_pkey PRIMARY KEY (id);


--
-- TOC entry 4753 (class 2606 OID 142651)
-- Name: sc_rasp18_move sc_rasp18_move_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_move
    ADD CONSTRAINT sc_rasp18_move_pkey PRIMARY KEY (id);


--
-- TOC entry 4743 (class 2606 OID 142653)
-- Name: sc_rasp18 sc_rasp18_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18
    ADD CONSTRAINT sc_rasp18_pkey PRIMARY KEY (id);


--
-- TOC entry 4755 (class 2606 OID 142655)
-- Name: sc_rasp18_preps sc_rasp18_preps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_preps
    ADD CONSTRAINT sc_rasp18_preps_pkey PRIMARY KEY (id);


--
-- TOC entry 4759 (class 2606 OID 142657)
-- Name: sc_rasp18_rooms sc_rasp18_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_rooms
    ADD CONSTRAINT sc_rasp18_rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 4764 (class 2606 OID 142659)
-- Name: sc_rasp7_groups sc_rasp7_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp7_groups
    ADD CONSTRAINT sc_rasp7_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4762 (class 2606 OID 142661)
-- Name: sc_rasp7 sc_rasp7_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp7
    ADD CONSTRAINT sc_rasp7_pkey PRIMARY KEY (id);


--
-- TOC entry 4766 (class 2606 OID 142663)
-- Name: sc_rasp7_preps sc_rasp7_preps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp7_preps
    ADD CONSTRAINT sc_rasp7_preps_pkey PRIMARY KEY (id);


--
-- TOC entry 4768 (class 2606 OID 142665)
-- Name: sc_rasp7_rooms sc_rasp7_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp7_rooms
    ADD CONSTRAINT sc_rasp7_rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 4772 (class 2606 OID 192032)
-- Name: sc_worktypes sc_worktypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_worktypes
    ADD CONSTRAINT sc_worktypes_pkey PRIMARY KEY (id);


--
-- TOC entry 4770 (class 2606 OID 142667)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- TOC entry 4728 (class 1259 OID 192196)
-- Name: sc_disc_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sc_disc_id_idx ON public.sc_disc USING btree (id);


--
-- TOC entry 4729 (class 1259 OID 192204)
-- Name: sc_disc_id_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sc_disc_id_idx1 ON public.sc_disc USING btree (id);


--
-- TOC entry 4732 (class 1259 OID 192205)
-- Name: sc_group_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sc_group_id_idx ON public.sc_group USING btree (id);


--
-- TOC entry 4735 (class 1259 OID 192203)
-- Name: sc_prep_fio_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sc_prep_fio_idx ON public.sc_prep USING btree (fio);


--
-- TOC entry 4736 (class 1259 OID 192202)
-- Name: sc_prep_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sc_prep_id_idx ON public.sc_prep USING btree (id);


--
-- TOC entry 4739 (class 1259 OID 192207)
-- Name: sc_rasp18_day_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sc_rasp18_day_id_idx ON public.sc_rasp18 USING btree (day_id);


--
-- TOC entry 4740 (class 1259 OID 192208)
-- Name: sc_rasp18_disc_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sc_rasp18_disc_id_idx ON public.sc_rasp18 USING btree (disc_id);


--
-- TOC entry 4746 (class 1259 OID 192201)
-- Name: sc_rasp18_groups_group_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sc_rasp18_groups_group_id_idx ON public.sc_rasp18_groups USING btree (group_id);


--
-- TOC entry 4749 (class 1259 OID 192200)
-- Name: sc_rasp18_groups_rasp18_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sc_rasp18_groups_rasp18_id_idx ON public.sc_rasp18_groups USING btree (rasp18_id);


--
-- TOC entry 4741 (class 1259 OID 192206)
-- Name: sc_rasp18_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sc_rasp18_id_idx ON public.sc_rasp18 USING btree (id);


--
-- TOC entry 4756 (class 1259 OID 192198)
-- Name: sc_rasp18_preps_prep_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sc_rasp18_preps_prep_id_idx ON public.sc_rasp18_preps USING btree (prep_id);


--
-- TOC entry 4757 (class 1259 OID 192197)
-- Name: sc_rasp18_preps_rasp18_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sc_rasp18_preps_rasp18_id_idx ON public.sc_rasp18_preps USING btree (rasp18_id);


--
-- TOC entry 4760 (class 1259 OID 192199)
-- Name: sc_rasp18_rooms_rasp18_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sc_rasp18_rooms_rasp18_id_idx ON public.sc_rasp18_rooms USING btree (rasp18_id);


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2025-06-02 08:48:34

--
-- PostgreSQL database dump complete
--

