--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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

--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: sc_department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_department (
    id integer NOT NULL,
    title text
);


ALTER TABLE public.sc_department OWNER TO postgres;

--
-- Name: TABLE sc_department; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_department IS 'кафедры';


--
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
-- Name: sc_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_department_id_seq OWNED BY public.sc_department.id;


--
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
-- Name: TABLE sc_disc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_disc IS 'кафедры';


--
-- Name: sc_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_group (
    id integer NOT NULL,
    title text
);


ALTER TABLE public.sc_group OWNER TO postgres;

--
-- Name: TABLE sc_group; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_group IS 'преподавательский состав';


--
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
-- Name: TABLE sc_rasp18; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp18 IS 'расписание на каждый день (18 недель)';


--
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
-- Name: TABLE sc_rasp18_days; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp18_days IS 'недели и дни недели по датам (18 недель)';


--
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
-- Name: sc_rasp18_days_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp18_days_id_seq OWNED BY public.sc_rasp18_days.id;


--
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
-- Name: TABLE sc_rasp18_groups; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp18_groups IS 'группы для расписания (18 недель)';


--
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
-- Name: sc_rasp18_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp18_groups_id_seq OWNED BY public.sc_rasp18_groups.id;


--
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
-- Name: sc_rasp18_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp18_id_seq OWNED BY public.sc_rasp18.id;


--
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
-- Name: TABLE sc_rasp18_info; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp18_info IS 'доп. информация к занятиям для расписания (18 недель)';


--
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
-- Name: sc_rasp18_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp18_info_id_seq OWNED BY public.sc_rasp18_info.id;


--
-- Name: sc_rasp18_move; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_rasp18_move (
    id integer NOT NULL,
    rasp18_dest_id integer,
    src_day_id integer,
    src_pair integer,
    reason text,
    comment text
);


ALTER TABLE public.sc_rasp18_move OWNER TO postgres;

--
-- Name: TABLE sc_rasp18_move; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp18_move IS 'информация по переносам для расписания (18 недель)';


--
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
-- Name: sc_rasp18_move_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp18_move_id_seq OWNED BY public.sc_rasp18_move.id;


--
-- Name: sc_rasp18_preps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_rasp18_preps (
    id integer NOT NULL,
    rasp18_id integer,
    prep_id integer
);


ALTER TABLE public.sc_rasp18_preps OWNER TO postgres;

--
-- Name: TABLE sc_rasp18_preps; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp18_preps IS 'преподаватели для расписания (18 недель)';


--
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
-- Name: sc_rasp18_preps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp18_preps_id_seq OWNED BY public.sc_rasp18_preps.id;


--
-- Name: sc_rasp18_rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_rasp18_rooms (
    id integer NOT NULL,
    rasp18_id integer,
    room text
);


ALTER TABLE public.sc_rasp18_rooms OWNER TO postgres;

--
-- Name: TABLE sc_rasp18_rooms; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp18_rooms IS 'аудитории для расписания (18 недель)';


--
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
-- Name: sc_rasp18_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp18_rooms_id_seq OWNED BY public.sc_rasp18_rooms.id;


--
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
-- Name: TABLE sc_rasp7; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp7 IS 'расписание на 7 дней (универсальное)';


--
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
-- Name: TABLE sc_rasp7_groups; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp7_groups IS ' группы для расписания на 7 дней';


--
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
-- Name: sc_rasp7_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp7_groups_id_seq OWNED BY public.sc_rasp7_groups.id;


--
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
-- Name: sc_rasp7_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp7_id_seq OWNED BY public.sc_rasp7.id;


--
-- Name: sc_rasp7_preps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_rasp7_preps (
    id integer NOT NULL,
    rasp7_id integer,
    prep_id integer
);


ALTER TABLE public.sc_rasp7_preps OWNER TO postgres;

--
-- Name: TABLE sc_rasp7_preps; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp7_preps IS 'преподаватели для расписания на 7 дней';


--
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
-- Name: sc_rasp7_preps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp7_preps_id_seq OWNED BY public.sc_rasp7_preps.id;


--
-- Name: sc_rasp7_rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_rasp7_rooms (
    id integer NOT NULL,
    rasp7_id integer,
    room text
);


ALTER TABLE public.sc_rasp7_rooms OWNER TO postgres;

--
-- Name: TABLE sc_rasp7_rooms; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sc_rasp7_rooms IS 'аудитории для расписания на 7 дней';


--
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
-- Name: sc_rasp7_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_rasp7_rooms_id_seq OWNED BY public.sc_rasp7_rooms.id;


--
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
-- Name: sc_worktypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sc_worktypes (
    id integer NOT NULL,
    title text
);


ALTER TABLE public.sc_worktypes OWNER TO postgres;

--
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
-- Name: sc_worktypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sc_worktypes_id_seq OWNED BY public.sc_worktypes.id;


--
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
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: sc_department id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_department ALTER COLUMN id SET DEFAULT nextval('public.sc_department_id_seq'::regclass);


--
-- Name: sc_rasp18 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18 ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp18_id_seq'::regclass);


--
-- Name: sc_rasp18_days id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_days ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp18_days_id_seq'::regclass);


--
-- Name: sc_rasp18_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_groups ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp18_groups_id_seq'::regclass);


--
-- Name: sc_rasp18_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_info ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp18_info_id_seq'::regclass);


--
-- Name: sc_rasp18_move id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_move ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp18_move_id_seq'::regclass);


--
-- Name: sc_rasp18_preps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_preps ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp18_preps_id_seq'::regclass);


--
-- Name: sc_rasp18_rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_rooms ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp18_rooms_id_seq'::regclass);


--
-- Name: sc_rasp7 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp7 ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp7_id_seq'::regclass);


--
-- Name: sc_rasp7_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp7_groups ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp7_groups_id_seq'::regclass);


--
-- Name: sc_rasp7_preps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp7_preps ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp7_preps_id_seq'::regclass);


--
-- Name: sc_rasp7_rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp7_rooms ALTER COLUMN id SET DEFAULT nextval('public.sc_rasp7_rooms_id_seq'::regclass);


--
-- Name: sc_worktypes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_worktypes ALTER COLUMN id SET DEFAULT nextval('public.sc_worktypes_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
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
-- Data for Name: sc_disc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_disc (id, title, shorttitle, department_id, varmask) FROM stdin;
0	null	История России	5	null
1	null	Ин. язык (1*пг)\nИн. язык (2*пг)	5	null
2	null	Мет. и ст. прогр.	1	null
3	null	Физ-ра	5	null
4	null	Мат. анализ	2	null
5	null	Мет. мат. анализа	2	null
6	null	Прогр. в ЗРЛ	1	null
7	null	Осн. росс. госуд.	5	null
8	null	Дискр. математика	2	null
9	null	Арх. компьютеров	1	null
10	null	Лин. алг. и ан. геом.	2	null
11	null	Мет. и ст. прогр. лк	1	null
12	null	Алгебра и геометрия	2	null
13	null	Спец. главы ВМ	2	null
14	null	Спец. главы ВМ 	2	null
15	null	Компл. анализ	2	null
16	null	Экон. культура	5	null
17	null	ТСПП	1	null
18	null	Ин. язык	5	null
19	null	Системы ИИ и БД	5	null
20	null	Прикл. программир-е	1	null
21	null	Философия	5	null
22	null	Базы данных	1	null
23	null	Компл. анализ	5	null
24	null	НИР/спецрасписание	1	null
25	null	Числ. методы	1	null
26	null	АПИС	1	null
27	null	Комп. графика	1	null
28	null	Теория алгоритмов	1	null
29	null	САПР	1	null
30	null	Проект. трансляторов	1	null
31	null	Комп. сети	1	null
32	null	НИР	1	null
33	null	Мат. мет. мех.	2	null
34	null	ТВ и МС	2	null
35	null	Функц. анализ	2	null
36	null	Спецрасписание/НИР	5	null
37	null	Защита инф-ции	1	null
38	null	ОСРВ	1	null
39	null	Интелл. системы	1	null
40	null	Адм. Линукс и DevOps	1	null
41	null	Обработка РЛИ	1	null
42	null	Функц. программир-е	1	null
43	null	Прогр. пар. вычислений	1	null
44	null	НИР	4	null
45	null	Мат. модели механики	4	null
46	null	Мат. мод. в различных ОС	4	null
47	null	Методы кодирования	4	null
48	null	Спец. методы моделир.	4	null
\.


--
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
\.


--
-- Data for Name: sc_prep; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_prep (id, fio, chair, degree, photo) FROM stdin;
0	Верченкова В.В.	None	None	None
1	Черноусов И.Д.	None	None	None
2	Смирнов В.И.	None	None	None
3	Лаврова О.Ю.	None	None	None
4	Хрычев Д.А.	None	None	None
5	Качалов С.К.	None	None	None
6	Шумский К.В.	None	None	None
7	Дроздов И.Ю.	None	None	None
8	Пистун Е.Н.	None	None	None
9	Костин С.В.	None	None	None
10	Сазонов А.И.	None	None	None
11	Смеловский Е.А.	None	None	None
12	Кочерова А.А.	None	None	None
13	Меретукова Б.Ш.	None	None	None
14	Старостина А.В.	None	None	None
15	Хазиев Г.А.	None	None	None
16	Демидова А.А.	None	None	None
17	Борец А.С.	None	None	None
18	Шульгина А.С.	None	None	None
19	Левинский Г.Д.	None	None	None
20	Парфенов Д.В.	None	None	None
21	Иванова Е.А.	None	None	None
22	Угрюмова М.В.	None	None	None
23	Критский А.В.	None	None	None
24	Хачлаев Т.С.	None	None	None
25	Воловиков А.Ю.	None	None	None
26	Шатина А.В.	None	None	None
27	Чугумбаева Н.Н.	None	None	None
28	Абрамов А.С.	None	None	None
29	Шульгина А.С.\nДрейфельд Д.Э.\nСмирнов В.И.	None	None	None
30	Кодзасова Д.А.	None	None	None
31	Рыжик Д.А.	None	None	None
32	Харламов С.Г.	None	None	None
33	Кирсанов А.П.	None	None	None
34	Завьялов А.В.	None	None	None
35	Бредихин В.А.	None	None	None
36	Коновалова И.В.	None	None	None
37	Одегов Р.А.	None	None	None
38	Волков А.В.	None	None	None
39	Власов Е.Е.	None	None	None
40	Кишкин А.М.	None	None	None
41	Лобузов А.А.	None	None	None
42	Плаченов А.Б.	None	None	None
43	Дрейфельд И.А.	None	None	None
44	Садовский П.А.	None	None	None
45	Борисов Н.К.	None	None	None
46	Соловьев Д.Р.	None	None	None
47	Абрамов А.С.\nЧерноусов И.Д.	None	None	None
48	Черниенко А.А.	None	None	None
49	Манаков В.Ю.	None	None	None
50	Милонов Г.А.	None	None	None
51	Булычев Г.Г.	None	None	None
52	Жуков В.А.	None	None	None
53	Зайцев А.Б.	None	None	None
\.


--
-- Data for Name: sc_rasp18; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp18 (id, semcode, day_id, pair, kind, worktype, disc_id, timestart, timeend) FROM stdin;
412682	242501	33130	1	0	0	0	09:00	10:30
412683	242501	33137	1	0	0	0	09:00	10:30
412684	242501	33144	1	0	0	0	09:00	10:30
412685	242501	33151	1	0	0	0	09:00	10:30
412686	242501	33158	1	0	0	0	09:00	10:30
412687	242501	33165	1	0	0	0	09:00	10:30
412688	242501	33172	1	0	0	0	09:00	10:30
412689	242501	33179	1	0	0	0	09:00	10:30
412690	242501	33186	1	0	0	0	09:00	10:30
412691	242501	33193	1	0	0	0	09:00	10:30
412692	242501	33200	1	0	0	0	09:00	10:30
412693	242501	33207	1	0	0	0	09:00	10:30
412694	242501	33214	1	0	0	0	09:00	10:30
412695	242501	33221	1	0	0	0	09:00	10:30
412696	242501	33228	1	0	0	0	09:00	10:30
412697	242501	33235	1	0	0	0	09:00	10:30
412698	242501	33130	2	0	0	1	10:40	12:10
412699	242501	33137	2	0	0	1	10:40	12:10
412700	242501	33144	2	0	0	1	10:40	12:10
412701	242501	33151	2	0	0	1	10:40	12:10
412702	242501	33158	2	0	0	1	10:40	12:10
412703	242501	33165	2	0	0	1	10:40	12:10
412704	242501	33172	2	0	0	1	10:40	12:10
412705	242501	33179	2	0	0	1	10:40	12:10
412706	242501	33186	2	0	0	1	10:40	12:10
412707	242501	33193	2	0	0	1	10:40	12:10
412708	242501	33200	2	0	0	1	10:40	12:10
412709	242501	33207	2	0	0	1	10:40	12:10
412710	242501	33214	2	0	0	1	10:40	12:10
412711	242501	33221	2	0	0	1	10:40	12:10
412712	242501	33228	2	0	0	1	10:40	12:10
412713	242501	33235	2	0	0	1	10:40	12:10
412714	242501	33131	1	0	0	2	09:00	10:30
412715	242501	33138	1	0	0	2	09:00	10:30
412716	242501	33145	1	0	0	2	09:00	10:30
412717	242501	33152	1	0	0	2	09:00	10:30
412718	242501	33159	1	0	0	2	09:00	10:30
412719	242501	33166	1	0	0	2	09:00	10:30
412720	242501	33173	1	0	0	2	09:00	10:30
412721	242501	33180	1	0	0	2	09:00	10:30
412722	242501	33187	1	0	0	2	09:00	10:30
412723	242501	33194	1	0	0	2	09:00	10:30
412724	242501	33201	1	0	0	2	09:00	10:30
412725	242501	33208	1	0	0	2	09:00	10:30
412726	242501	33215	1	0	0	2	09:00	10:30
412727	242501	33222	1	0	0	2	09:00	10:30
412728	242501	33229	1	0	0	2	09:00	10:30
412729	242501	33236	1	0	0	2	09:00	10:30
412730	242501	33131	2	0	0	2	10:40	12:10
412731	242501	33138	2	0	0	2	10:40	12:10
412732	242501	33145	2	0	0	2	10:40	12:10
412733	242501	33152	2	0	0	2	10:40	12:10
412734	242501	33159	2	0	0	2	10:40	12:10
412735	242501	33166	2	0	0	2	10:40	12:10
412736	242501	33173	2	0	0	2	10:40	12:10
412737	242501	33180	2	0	0	2	10:40	12:10
412738	242501	33187	2	0	0	2	10:40	12:10
412739	242501	33194	2	0	0	2	10:40	12:10
412740	242501	33201	2	0	0	2	10:40	12:10
412741	242501	33208	2	0	0	2	10:40	12:10
412742	242501	33215	2	0	0	2	10:40	12:10
412743	242501	33222	2	0	0	2	10:40	12:10
412744	242501	33229	2	0	0	2	10:40	12:10
412745	242501	33236	2	0	0	2	10:40	12:10
412746	242501	33131	3	0	0	3	12:40	14:10
412747	242501	33138	3	0	0	3	12:40	14:10
412748	242501	33145	3	0	0	3	12:40	14:10
412749	242501	33152	3	0	0	3	12:40	14:10
412750	242501	33159	3	0	0	3	12:40	14:10
412751	242501	33166	3	0	0	3	12:40	14:10
412752	242501	33173	3	0	0	3	12:40	14:10
412753	242501	33180	3	0	0	3	12:40	14:10
412754	242501	33187	3	0	0	3	12:40	14:10
412755	242501	33194	3	0	0	3	12:40	14:10
412756	242501	33201	3	0	0	3	12:40	14:10
412757	242501	33208	3	0	0	3	12:40	14:10
412758	242501	33215	3	0	0	3	12:40	14:10
412759	242501	33222	3	0	0	3	12:40	14:10
412760	242501	33229	3	0	0	3	12:40	14:10
412761	242501	33236	3	0	0	3	12:40	14:10
412762	242501	33132	1	0	1	4	09:00	10:30
412763	242501	33139	1	0	1	4	09:00	10:30
412764	242501	33146	1	0	1	4	09:00	10:30
412765	242501	33153	1	0	1	4	09:00	10:30
412766	242501	33160	1	0	1	4	09:00	10:30
412767	242501	33167	1	0	1	4	09:00	10:30
412768	242501	33174	1	0	1	4	09:00	10:30
412769	242501	33181	1	0	1	4	09:00	10:30
412770	242501	33188	1	0	1	4	09:00	10:30
412771	242501	33195	1	0	1	4	09:00	10:30
412772	242501	33202	1	0	1	4	09:00	10:30
412773	242501	33209	1	0	1	4	09:00	10:30
412774	242501	33216	1	0	1	4	09:00	10:30
412775	242501	33223	1	0	1	4	09:00	10:30
412776	242501	33230	1	0	1	4	09:00	10:30
412777	242501	33237	1	0	1	4	09:00	10:30
412778	242501	33132	2	0	1	5	10:40	12:10
412779	242501	33139	2	0	1	5	10:40	12:10
412780	242501	33146	2	0	1	5	10:40	12:10
412781	242501	33153	2	0	1	5	10:40	12:10
412782	242501	33160	2	0	1	5	10:40	12:10
412783	242501	33167	2	0	1	5	10:40	12:10
412784	242501	33174	2	0	1	5	10:40	12:10
412785	242501	33181	2	0	1	5	10:40	12:10
412786	242501	33188	2	0	1	5	10:40	12:10
412787	242501	33195	2	0	1	5	10:40	12:10
412788	242501	33202	2	0	1	5	10:40	12:10
412789	242501	33209	2	0	1	5	10:40	12:10
412790	242501	33216	2	0	1	5	10:40	12:10
412791	242501	33223	2	0	1	5	10:40	12:10
412792	242501	33230	2	0	1	5	10:40	12:10
412793	242501	33237	2	0	1	5	10:40	12:10
412794	242501	33132	3	0	0	5	12:40	14:10
412795	242501	33139	3	0	0	5	12:40	14:10
412796	242501	33146	3	0	0	5	12:40	14:10
412797	242501	33153	3	0	0	5	12:40	14:10
412798	242501	33160	3	0	0	5	12:40	14:10
412799	242501	33167	3	0	0	5	12:40	14:10
412800	242501	33174	3	0	0	5	12:40	14:10
412801	242501	33181	3	0	0	5	12:40	14:10
412802	242501	33188	3	0	0	5	12:40	14:10
412803	242501	33195	3	0	0	5	12:40	14:10
412804	242501	33202	3	0	0	5	12:40	14:10
412805	242501	33209	3	0	0	5	12:40	14:10
412806	242501	33216	3	0	0	5	12:40	14:10
412807	242501	33223	3	0	0	5	12:40	14:10
412808	242501	33230	3	0	0	5	12:40	14:10
412809	242501	33237	3	0	0	5	12:40	14:10
412810	242501	33139	5	0	1	6	16:20	17:50
412811	242501	33153	5	0	1	6	16:20	17:50
412812	242501	33167	5	0	1	6	16:20	17:50
412813	242501	33181	5	0	1	6	16:20	17:50
412814	242501	33195	5	0	1	6	16:20	17:50
412815	242501	33209	5	0	1	6	16:20	17:50
412816	242501	33223	5	0	1	6	16:20	17:50
412817	242501	33237	5	0	1	6	16:20	17:50
412818	242501	33133	2	0	1	7	10:40	12:10
412819	242501	33147	2	0	1	7	10:40	12:10
412820	242501	33161	2	0	1	7	10:40	12:10
412821	242501	33175	2	0	1	7	10:40	12:10
412822	242501	33189	2	0	1	7	10:40	12:10
412823	242501	33203	2	0	1	7	10:40	12:10
412824	242501	33217	2	0	1	7	10:40	12:10
412825	242501	33231	2	0	1	7	10:40	12:10
412826	242501	33133	3	0	1	8	12:40	14:10
412827	242501	33140	3	0	1	8	12:40	14:10
412828	242501	33147	3	0	1	8	12:40	14:10
412829	242501	33154	3	0	1	8	12:40	14:10
412830	242501	33161	3	0	1	8	12:40	14:10
412831	242501	33168	3	0	1	8	12:40	14:10
412832	242501	33175	3	0	1	8	12:40	14:10
412833	242501	33182	3	0	1	8	12:40	14:10
412834	242501	33189	3	0	1	8	12:40	14:10
412835	242501	33196	3	0	1	8	12:40	14:10
412836	242501	33203	3	0	1	8	12:40	14:10
412837	242501	33210	3	0	1	8	12:40	14:10
412838	242501	33217	3	0	1	8	12:40	14:10
412839	242501	33224	3	0	1	8	12:40	14:10
412840	242501	33231	3	0	1	8	12:40	14:10
412841	242501	33238	3	0	1	8	12:40	14:10
412842	242501	33133	4	0	0	7	14:20	15:50
412843	242501	33140	4	0	0	7	14:20	15:50
412844	242501	33147	4	0	0	7	14:20	15:50
412845	242501	33154	4	0	0	7	14:20	15:50
412846	242501	33161	4	0	0	7	14:20	15:50
412847	242501	33168	4	0	0	7	14:20	15:50
412848	242501	33175	4	0	0	7	14:20	15:50
412849	242501	33182	4	0	0	7	14:20	15:50
412850	242501	33189	4	0	0	7	14:20	15:50
412851	242501	33196	4	0	0	7	14:20	15:50
412852	242501	33203	4	0	0	7	14:20	15:50
412853	242501	33210	4	0	0	7	14:20	15:50
412854	242501	33217	4	0	0	7	14:20	15:50
412855	242501	33224	4	0	0	7	14:20	15:50
412856	242501	33231	4	0	0	7	14:20	15:50
412857	242501	33238	4	0	0	7	14:20	15:50
412858	242501	33133	5	0	0	8	16:20	17:50
412859	242501	33140	5	0	0	8	16:20	17:50
412860	242501	33147	5	0	0	8	16:20	17:50
412861	242501	33154	5	0	0	8	16:20	17:50
412862	242501	33161	5	0	0	8	16:20	17:50
412863	242501	33168	5	0	0	8	16:20	17:50
412864	242501	33175	5	0	0	8	16:20	17:50
412865	242501	33182	5	0	0	8	16:20	17:50
412866	242501	33189	5	0	0	8	16:20	17:50
412867	242501	33196	5	0	0	8	16:20	17:50
412868	242501	33203	5	0	0	8	16:20	17:50
412869	242501	33210	5	0	0	8	16:20	17:50
412870	242501	33217	5	0	0	8	16:20	17:50
412871	242501	33224	5	0	0	8	16:20	17:50
412872	242501	33231	5	0	0	8	16:20	17:50
412873	242501	33238	5	0	0	8	16:20	17:50
412874	242501	33133	6	0	0	9	18:00	19:30
412875	242501	33140	6	0	0	9	18:00	19:30
412876	242501	33147	6	0	0	9	18:00	19:30
412877	242501	33154	6	0	0	9	18:00	19:30
412878	242501	33161	6	0	0	9	18:00	19:30
412879	242501	33168	6	0	0	9	18:00	19:30
412880	242501	33175	6	0	0	9	18:00	19:30
412881	242501	33182	6	0	0	9	18:00	19:30
412882	242501	33189	6	0	0	9	18:00	19:30
412883	242501	33196	6	0	0	9	18:00	19:30
412884	242501	33203	6	0	0	9	18:00	19:30
412885	242501	33210	6	0	0	9	18:00	19:30
412886	242501	33217	6	0	0	9	18:00	19:30
412887	242501	33224	6	0	0	9	18:00	19:30
412888	242501	33231	6	0	0	9	18:00	19:30
412889	242501	33238	6	0	0	9	18:00	19:30
412890	242501	33134	1	0	0	4	09:00	10:30
412891	242501	33141	1	0	0	4	09:00	10:30
412892	242501	33148	1	0	0	4	09:00	10:30
412893	242501	33155	1	0	0	4	09:00	10:30
412894	242501	33162	1	0	0	4	09:00	10:30
412895	242501	33169	1	0	0	4	09:00	10:30
412896	242501	33176	1	0	0	4	09:00	10:30
412897	242501	33183	1	0	0	4	09:00	10:30
412898	242501	33190	1	0	0	4	09:00	10:30
412899	242501	33197	1	0	0	4	09:00	10:30
412900	242501	33204	1	0	0	4	09:00	10:30
412901	242501	33211	1	0	0	4	09:00	10:30
412902	242501	33218	1	0	0	4	09:00	10:30
412903	242501	33225	1	0	0	4	09:00	10:30
412904	242501	33232	1	0	0	4	09:00	10:30
412905	242501	33239	1	0	0	4	09:00	10:30
412906	242501	33134	2	0	0	6	10:40	12:10
412907	242501	33141	2	0	0	6	10:40	12:10
412908	242501	33148	2	0	0	6	10:40	12:10
412909	242501	33155	2	0	0	6	10:40	12:10
412910	242501	33162	2	0	0	6	10:40	12:10
412911	242501	33169	2	0	0	6	10:40	12:10
412912	242501	33176	2	0	0	6	10:40	12:10
412913	242501	33183	2	0	0	6	10:40	12:10
412914	242501	33190	2	0	0	6	10:40	12:10
412915	242501	33197	2	0	0	6	10:40	12:10
412916	242501	33204	2	0	0	6	10:40	12:10
412917	242501	33211	2	0	0	6	10:40	12:10
412918	242501	33218	2	0	0	6	10:40	12:10
412919	242501	33225	2	0	0	6	10:40	12:10
412920	242501	33232	2	0	0	6	10:40	12:10
412921	242501	33239	2	0	0	6	10:40	12:10
412922	242501	33134	3	0	0	10	12:40	14:10
412923	242501	33141	3	0	0	10	12:40	14:10
412924	242501	33148	3	0	0	10	12:40	14:10
412925	242501	33155	3	0	0	10	12:40	14:10
412926	242501	33162	3	0	0	10	12:40	14:10
412927	242501	33169	3	0	0	10	12:40	14:10
412928	242501	33176	3	0	0	10	12:40	14:10
412929	242501	33183	3	0	0	10	12:40	14:10
412930	242501	33190	3	0	0	10	12:40	14:10
412931	242501	33197	3	0	0	10	12:40	14:10
412932	242501	33204	3	0	0	10	12:40	14:10
412933	242501	33211	3	0	0	10	12:40	14:10
412934	242501	33218	3	0	0	10	12:40	14:10
412935	242501	33225	3	0	0	10	12:40	14:10
412936	242501	33232	3	0	0	10	12:40	14:10
412937	242501	33239	3	0	0	10	12:40	14:10
412938	242501	33134	4	0	1	10	14:20	15:50
412939	242501	33141	4	0	1	10	14:20	15:50
412940	242501	33148	4	0	1	10	14:20	15:50
412941	242501	33155	4	0	1	10	14:20	15:50
412942	242501	33162	4	0	1	10	14:20	15:50
412943	242501	33169	4	0	1	10	14:20	15:50
412944	242501	33176	4	0	1	10	14:20	15:50
412945	242501	33183	4	0	1	10	14:20	15:50
412946	242501	33190	4	0	1	10	14:20	15:50
412947	242501	33197	4	0	1	10	14:20	15:50
412948	242501	33204	4	0	1	10	14:20	15:50
412949	242501	33211	4	0	1	10	14:20	15:50
412950	242501	33218	4	0	1	10	14:20	15:50
412951	242501	33225	4	0	1	10	14:20	15:50
412952	242501	33232	4	0	1	10	14:20	15:50
412953	242501	33239	4	0	1	10	14:20	15:50
412954	242501	33134	5	0	1	0	16:20	17:50
412955	242501	33141	5	0	1	0	16:20	17:50
412956	242501	33148	5	0	1	0	16:20	17:50
412957	242501	33155	5	0	1	0	16:20	17:50
412958	242501	33162	5	0	1	0	16:20	17:50
412959	242501	33169	5	0	1	0	16:20	17:50
412960	242501	33176	5	0	1	0	16:20	17:50
412961	242501	33183	5	0	1	0	16:20	17:50
412962	242501	33190	5	0	1	0	16:20	17:50
412963	242501	33197	5	0	1	0	16:20	17:50
412964	242501	33204	5	0	1	0	16:20	17:50
412965	242501	33211	5	0	1	0	16:20	17:50
412966	242501	33218	5	0	1	0	16:20	17:50
412967	242501	33225	5	0	1	0	16:20	17:50
412968	242501	33232	5	0	1	0	16:20	17:50
412969	242501	33239	5	0	1	0	16:20	17:50
412970	242501	33135	1	0	1	11	09:00	10:30
412971	242501	33149	1	0	1	11	09:00	10:30
412972	242501	33163	1	0	1	11	09:00	10:30
412973	242501	33177	1	0	1	11	09:00	10:30
412974	242501	33191	1	0	1	11	09:00	10:30
412975	242501	33205	1	0	1	11	09:00	10:30
412976	242501	33219	1	0	1	11	09:00	10:30
412977	242501	33233	1	0	1	11	09:00	10:30
412978	242501	33135	1	0	1	11	09:00	10:30
412979	242501	33149	1	0	1	11	09:00	10:30
412980	242501	33163	1	0	1	11	09:00	10:30
412981	242501	33177	1	0	1	11	09:00	10:30
412982	242501	33191	1	0	1	11	09:00	10:30
412983	242501	33205	1	0	1	11	09:00	10:30
412984	242501	33219	1	0	1	11	09:00	10:30
412985	242501	33233	1	0	1	11	09:00	10:30
412986	242501	33135	2	0	0	6	10:40	12:10
412987	242501	33149	2	0	0	6	10:40	12:10
412988	242501	33163	2	0	0	6	10:40	12:10
412989	242501	33177	2	0	0	6	10:40	12:10
412990	242501	33191	2	0	0	6	10:40	12:10
412991	242501	33205	2	0	0	6	10:40	12:10
412992	242501	33219	2	0	0	6	10:40	12:10
412993	242501	33233	2	0	0	6	10:40	12:10
412994	242501	33135	3	0	0	6	12:40	14:10
412995	242501	33149	3	0	0	6	12:40	14:10
412996	242501	33163	3	0	0	6	12:40	14:10
412997	242501	33177	3	0	0	6	12:40	14:10
412998	242501	33191	3	0	0	6	12:40	14:10
412999	242501	33205	3	0	0	6	12:40	14:10
413000	242501	33219	3	0	0	6	12:40	14:10
413001	242501	33233	3	0	0	6	12:40	14:10
413002	242501	33130	1	0	0	1	09:00	10:30
413003	242501	33137	1	0	0	1	09:00	10:30
413004	242501	33144	1	0	0	1	09:00	10:30
413005	242501	33151	1	0	0	1	09:00	10:30
413006	242501	33158	1	0	0	1	09:00	10:30
413007	242501	33165	1	0	0	1	09:00	10:30
413008	242501	33172	1	0	0	1	09:00	10:30
413009	242501	33179	1	0	0	1	09:00	10:30
413010	242501	33186	1	0	0	1	09:00	10:30
413011	242501	33193	1	0	0	1	09:00	10:30
413012	242501	33200	1	0	0	1	09:00	10:30
413013	242501	33207	1	0	0	1	09:00	10:30
413014	242501	33214	1	0	0	1	09:00	10:30
413015	242501	33221	1	0	0	1	09:00	10:30
413016	242501	33228	1	0	0	1	09:00	10:30
413017	242501	33235	1	0	0	1	09:00	10:30
413018	242501	33130	2	0	0	4	10:40	12:10
413019	242501	33137	2	0	0	4	10:40	12:10
413020	242501	33144	2	0	0	4	10:40	12:10
413021	242501	33151	2	0	0	4	10:40	12:10
413022	242501	33158	2	0	0	4	10:40	12:10
413023	242501	33165	2	0	0	4	10:40	12:10
413024	242501	33172	2	0	0	4	10:40	12:10
413025	242501	33179	2	0	0	4	10:40	12:10
413026	242501	33186	2	0	0	4	10:40	12:10
413027	242501	33193	2	0	0	4	10:40	12:10
413028	242501	33200	2	0	0	4	10:40	12:10
413029	242501	33207	2	0	0	4	10:40	12:10
413030	242501	33214	2	0	0	4	10:40	12:10
413031	242501	33221	2	0	0	4	10:40	12:10
413032	242501	33228	2	0	0	4	10:40	12:10
413033	242501	33235	2	0	0	4	10:40	12:10
413034	242501	33130	3	0	0	8	12:40	14:10
413035	242501	33137	3	0	0	8	12:40	14:10
413036	242501	33144	3	0	0	8	12:40	14:10
413037	242501	33151	3	0	0	8	12:40	14:10
413038	242501	33158	3	0	0	8	12:40	14:10
413039	242501	33165	3	0	0	8	12:40	14:10
413040	242501	33172	3	0	0	8	12:40	14:10
413041	242501	33179	3	0	0	8	12:40	14:10
413042	242501	33186	3	0	0	8	12:40	14:10
413043	242501	33193	3	0	0	8	12:40	14:10
413044	242501	33200	3	0	0	8	12:40	14:10
413045	242501	33207	3	0	0	8	12:40	14:10
413046	242501	33214	3	0	0	8	12:40	14:10
413047	242501	33221	3	0	0	8	12:40	14:10
413048	242501	33228	3	0	0	8	12:40	14:10
413049	242501	33235	3	0	0	8	12:40	14:10
413050	242501	33131	2	0	0	5	10:40	12:10
413051	242501	33138	2	0	0	5	10:40	12:10
413052	242501	33145	2	0	0	5	10:40	12:10
413053	242501	33152	2	0	0	5	10:40	12:10
413054	242501	33159	2	0	0	5	10:40	12:10
413055	242501	33166	2	0	0	5	10:40	12:10
413056	242501	33173	2	0	0	5	10:40	12:10
413057	242501	33180	2	0	0	5	10:40	12:10
413058	242501	33187	2	0	0	5	10:40	12:10
413059	242501	33194	2	0	0	5	10:40	12:10
413060	242501	33201	2	0	0	5	10:40	12:10
413061	242501	33208	2	0	0	5	10:40	12:10
413062	242501	33215	2	0	0	5	10:40	12:10
413063	242501	33222	2	0	0	5	10:40	12:10
413064	242501	33229	2	0	0	5	10:40	12:10
413065	242501	33236	2	0	0	5	10:40	12:10
413066	242501	33131	3	0	0	12	12:40	14:10
413067	242501	33138	3	0	0	12	12:40	14:10
413068	242501	33145	3	0	0	12	12:40	14:10
413069	242501	33152	3	0	0	12	12:40	14:10
413070	242501	33159	3	0	0	12	12:40	14:10
413071	242501	33166	3	0	0	12	12:40	14:10
413072	242501	33173	3	0	0	12	12:40	14:10
413073	242501	33180	3	0	0	12	12:40	14:10
413074	242501	33187	3	0	0	12	12:40	14:10
413075	242501	33194	3	0	0	12	12:40	14:10
413076	242501	33201	3	0	0	12	12:40	14:10
413077	242501	33208	3	0	0	12	12:40	14:10
413078	242501	33215	3	0	0	12	12:40	14:10
413079	242501	33222	3	0	0	12	12:40	14:10
413080	242501	33229	3	0	0	12	12:40	14:10
413081	242501	33236	3	0	0	12	12:40	14:10
413082	242501	33131	4	0	0	3	14:20	15:50
413083	242501	33138	4	0	0	3	14:20	15:50
413084	242501	33145	4	0	0	3	14:20	15:50
413085	242501	33152	4	0	0	3	14:20	15:50
413086	242501	33159	4	0	0	3	14:20	15:50
413087	242501	33166	4	0	0	3	14:20	15:50
413088	242501	33173	4	0	0	3	14:20	15:50
413089	242501	33180	4	0	0	3	14:20	15:50
413090	242501	33187	4	0	0	3	14:20	15:50
413091	242501	33194	4	0	0	3	14:20	15:50
413092	242501	33201	4	0	0	3	14:20	15:50
413093	242501	33208	4	0	0	3	14:20	15:50
413094	242501	33215	4	0	0	3	14:20	15:50
413095	242501	33222	4	0	0	3	14:20	15:50
413096	242501	33229	4	0	0	3	14:20	15:50
413097	242501	33236	4	0	0	3	14:20	15:50
413098	242501	33132	3	0	0	7	12:40	14:10
413099	242501	33139	3	0	0	7	12:40	14:10
413100	242501	33146	3	0	0	7	12:40	14:10
413101	242501	33153	3	0	0	7	12:40	14:10
413102	242501	33160	3	0	0	7	12:40	14:10
413103	242501	33167	3	0	0	7	12:40	14:10
413104	242501	33174	3	0	0	7	12:40	14:10
413105	242501	33181	3	0	0	7	12:40	14:10
413106	242501	33188	3	0	0	7	12:40	14:10
413107	242501	33195	3	0	0	7	12:40	14:10
413108	242501	33202	3	0	0	7	12:40	14:10
413109	242501	33209	3	0	0	7	12:40	14:10
413110	242501	33216	3	0	0	7	12:40	14:10
413111	242501	33223	3	0	0	7	12:40	14:10
413112	242501	33230	3	0	0	7	12:40	14:10
413113	242501	33237	3	0	0	7	12:40	14:10
413114	242501	33132	4	0	0	0	14:20	15:50
413115	242501	33139	4	0	0	0	14:20	15:50
413116	242501	33146	4	0	0	0	14:20	15:50
413117	242501	33153	4	0	0	0	14:20	15:50
413118	242501	33160	4	0	0	0	14:20	15:50
413119	242501	33167	4	0	0	0	14:20	15:50
413120	242501	33174	4	0	0	0	14:20	15:50
413121	242501	33181	4	0	0	0	14:20	15:50
413122	242501	33188	4	0	0	0	14:20	15:50
413123	242501	33195	4	0	0	0	14:20	15:50
413124	242501	33202	4	0	0	0	14:20	15:50
413125	242501	33209	4	0	0	0	14:20	15:50
413126	242501	33216	4	0	0	0	14:20	15:50
413127	242501	33223	4	0	0	0	14:20	15:50
413128	242501	33230	4	0	0	0	14:20	15:50
413129	242501	33237	4	0	0	0	14:20	15:50
413130	242501	33133	4	0	0	2	14:20	15:50
413131	242501	33140	4	0	0	2	14:20	15:50
413132	242501	33147	4	0	0	2	14:20	15:50
413133	242501	33154	4	0	0	2	14:20	15:50
413134	242501	33161	4	0	0	2	14:20	15:50
413135	242501	33168	4	0	0	2	14:20	15:50
413136	242501	33175	4	0	0	2	14:20	15:50
413137	242501	33182	4	0	0	2	14:20	15:50
413138	242501	33189	4	0	0	2	14:20	15:50
413139	242501	33196	4	0	0	2	14:20	15:50
413140	242501	33203	4	0	0	2	14:20	15:50
413141	242501	33210	4	0	0	2	14:20	15:50
413142	242501	33217	4	0	0	2	14:20	15:50
413143	242501	33224	4	0	0	2	14:20	15:50
413144	242501	33231	4	0	0	2	14:20	15:50
413145	242501	33238	4	0	0	2	14:20	15:50
413146	242501	33133	5	0	0	2	16:20	17:50
413147	242501	33140	5	0	0	2	16:20	17:50
413148	242501	33147	5	0	0	2	16:20	17:50
413149	242501	33154	5	0	0	2	16:20	17:50
413150	242501	33161	5	0	0	2	16:20	17:50
413151	242501	33168	5	0	0	2	16:20	17:50
413152	242501	33175	5	0	0	2	16:20	17:50
413153	242501	33182	5	0	0	2	16:20	17:50
413154	242501	33189	5	0	0	2	16:20	17:50
413155	242501	33196	5	0	0	2	16:20	17:50
413156	242501	33203	5	0	0	2	16:20	17:50
413157	242501	33210	5	0	0	2	16:20	17:50
413158	242501	33217	5	0	0	2	16:20	17:50
413159	242501	33224	5	0	0	2	16:20	17:50
413160	242501	33231	5	0	0	2	16:20	17:50
413161	242501	33238	5	0	0	2	16:20	17:50
413162	242501	33134	3	0	0	6	12:40	14:10
413163	242501	33141	3	0	0	6	12:40	14:10
413164	242501	33148	3	0	0	6	12:40	14:10
413165	242501	33155	3	0	0	6	12:40	14:10
413166	242501	33162	3	0	0	6	12:40	14:10
413167	242501	33169	3	0	0	6	12:40	14:10
413168	242501	33176	3	0	0	6	12:40	14:10
413169	242501	33183	3	0	0	6	12:40	14:10
413170	242501	33190	3	0	0	6	12:40	14:10
413171	242501	33197	3	0	0	6	12:40	14:10
413172	242501	33204	3	0	0	6	12:40	14:10
413173	242501	33211	3	0	0	6	12:40	14:10
413174	242501	33218	3	0	0	6	12:40	14:10
413175	242501	33225	3	0	0	6	12:40	14:10
413176	242501	33232	3	0	0	6	12:40	14:10
413177	242501	33239	3	0	0	6	12:40	14:10
413178	242501	33134	6	0	0	6	18:00	19:30
413179	242501	33141	6	0	0	6	18:00	19:30
413180	242501	33148	6	0	0	6	18:00	19:30
413181	242501	33155	6	0	0	6	18:00	19:30
413182	242501	33162	6	0	0	6	18:00	19:30
413183	242501	33169	6	0	0	6	18:00	19:30
413184	242501	33176	6	0	0	6	18:00	19:30
413185	242501	33183	6	0	0	6	18:00	19:30
413186	242501	33190	6	0	0	6	18:00	19:30
413187	242501	33197	6	0	0	6	18:00	19:30
413188	242501	33204	6	0	0	6	18:00	19:30
413189	242501	33211	6	0	0	6	18:00	19:30
413190	242501	33218	6	0	0	6	18:00	19:30
413191	242501	33225	6	0	0	6	18:00	19:30
413192	242501	33232	6	0	0	6	18:00	19:30
413193	242501	33239	6	0	0	6	18:00	19:30
413194	242501	33135	1	0	1	2	09:00	10:30
413195	242501	33149	1	0	1	2	09:00	10:30
413196	242501	33163	1	0	1	2	09:00	10:30
413197	242501	33177	1	0	1	2	09:00	10:30
413198	242501	33191	1	0	1	2	09:00	10:30
413199	242501	33205	1	0	1	2	09:00	10:30
413200	242501	33219	1	0	1	2	09:00	10:30
413201	242501	33233	1	0	1	2	09:00	10:30
413202	242501	33130	1	0	0	2	09:00	10:30
413203	242501	33137	1	0	0	2	09:00	10:30
413204	242501	33144	1	0	0	2	09:00	10:30
413205	242501	33151	1	0	0	2	09:00	10:30
413206	242501	33158	1	0	0	2	09:00	10:30
413207	242501	33165	1	0	0	2	09:00	10:30
413208	242501	33172	1	0	0	2	09:00	10:30
413209	242501	33179	1	0	0	2	09:00	10:30
413210	242501	33186	1	0	0	2	09:00	10:30
413211	242501	33193	1	0	0	2	09:00	10:30
413212	242501	33200	1	0	0	2	09:00	10:30
413213	242501	33207	1	0	0	2	09:00	10:30
413214	242501	33214	1	0	0	2	09:00	10:30
413215	242501	33221	1	0	0	2	09:00	10:30
413216	242501	33228	1	0	0	2	09:00	10:30
413217	242501	33235	1	0	0	2	09:00	10:30
413218	242501	33130	2	0	0	2	10:40	12:10
413219	242501	33137	2	0	0	2	10:40	12:10
413220	242501	33144	2	0	0	2	10:40	12:10
413221	242501	33151	2	0	0	2	10:40	12:10
413222	242501	33158	2	0	0	2	10:40	12:10
413223	242501	33165	2	0	0	2	10:40	12:10
413224	242501	33172	2	0	0	2	10:40	12:10
413225	242501	33179	2	0	0	2	10:40	12:10
413226	242501	33186	2	0	0	2	10:40	12:10
413227	242501	33193	2	0	0	2	10:40	12:10
413228	242501	33200	2	0	0	2	10:40	12:10
413229	242501	33207	2	0	0	2	10:40	12:10
413230	242501	33214	2	0	0	2	10:40	12:10
413231	242501	33221	2	0	0	2	10:40	12:10
413232	242501	33228	2	0	0	2	10:40	12:10
413233	242501	33235	2	0	0	2	10:40	12:10
413234	242501	33130	3	0	0	6	12:40	14:10
413235	242501	33137	3	0	0	6	12:40	14:10
413236	242501	33144	3	0	0	6	12:40	14:10
413237	242501	33151	3	0	0	6	12:40	14:10
413238	242501	33158	3	0	0	6	12:40	14:10
413239	242501	33165	3	0	0	6	12:40	14:10
413240	242501	33172	3	0	0	6	12:40	14:10
413241	242501	33179	3	0	0	6	12:40	14:10
413242	242501	33186	3	0	0	6	12:40	14:10
413243	242501	33193	3	0	0	6	12:40	14:10
413244	242501	33200	3	0	0	6	12:40	14:10
413245	242501	33207	3	0	0	6	12:40	14:10
413246	242501	33214	3	0	0	6	12:40	14:10
413247	242501	33221	3	0	0	6	12:40	14:10
413248	242501	33228	3	0	0	6	12:40	14:10
413249	242501	33235	3	0	0	6	12:40	14:10
413250	242501	33130	4	0	0	6	14:20	15:50
413251	242501	33137	4	0	0	6	14:20	15:50
413252	242501	33144	4	0	0	6	14:20	15:50
413253	242501	33151	4	0	0	6	14:20	15:50
413254	242501	33158	4	0	0	6	14:20	15:50
413255	242501	33165	4	0	0	6	14:20	15:50
413256	242501	33172	4	0	0	6	14:20	15:50
413257	242501	33179	4	0	0	6	14:20	15:50
413258	242501	33186	4	0	0	6	14:20	15:50
413259	242501	33193	4	0	0	6	14:20	15:50
413260	242501	33200	4	0	0	6	14:20	15:50
413261	242501	33207	4	0	0	6	14:20	15:50
413262	242501	33214	4	0	0	6	14:20	15:50
413263	242501	33221	4	0	0	6	14:20	15:50
413264	242501	33228	4	0	0	6	14:20	15:50
413265	242501	33235	4	0	0	6	14:20	15:50
413266	242501	33131	1	0	0	4	09:00	10:30
413267	242501	33138	1	0	0	4	09:00	10:30
413268	242501	33145	1	0	0	4	09:00	10:30
413269	242501	33152	1	0	0	4	09:00	10:30
413270	242501	33159	1	0	0	4	09:00	10:30
413271	242501	33166	1	0	0	4	09:00	10:30
413272	242501	33173	1	0	0	4	09:00	10:30
413273	242501	33180	1	0	0	4	09:00	10:30
413274	242501	33187	1	0	0	4	09:00	10:30
413275	242501	33194	1	0	0	4	09:00	10:30
413276	242501	33201	1	0	0	4	09:00	10:30
413277	242501	33208	1	0	0	4	09:00	10:30
413278	242501	33215	1	0	0	4	09:00	10:30
413279	242501	33222	1	0	0	4	09:00	10:30
413280	242501	33229	1	0	0	4	09:00	10:30
413281	242501	33236	1	0	0	4	09:00	10:30
413282	242501	33131	2	0	0	12	10:40	12:10
413283	242501	33138	2	0	0	12	10:40	12:10
413284	242501	33145	2	0	0	12	10:40	12:10
413285	242501	33152	2	0	0	12	10:40	12:10
413286	242501	33159	2	0	0	12	10:40	12:10
413287	242501	33166	2	0	0	12	10:40	12:10
413288	242501	33173	2	0	0	12	10:40	12:10
413289	242501	33180	2	0	0	12	10:40	12:10
413290	242501	33187	2	0	0	12	10:40	12:10
413291	242501	33194	2	0	0	12	10:40	12:10
413292	242501	33201	2	0	0	12	10:40	12:10
413293	242501	33208	2	0	0	12	10:40	12:10
413294	242501	33215	2	0	0	12	10:40	12:10
413295	242501	33222	2	0	0	12	10:40	12:10
413296	242501	33229	2	0	0	12	10:40	12:10
413297	242501	33236	2	0	0	12	10:40	12:10
413298	242501	33132	3	0	0	1	12:40	14:10
413299	242501	33139	3	0	0	1	12:40	14:10
413300	242501	33146	3	0	0	1	12:40	14:10
413301	242501	33153	3	0	0	1	12:40	14:10
413302	242501	33160	3	0	0	1	12:40	14:10
413303	242501	33167	3	0	0	1	12:40	14:10
413304	242501	33174	3	0	0	1	12:40	14:10
413305	242501	33181	3	0	0	1	12:40	14:10
413306	242501	33188	3	0	0	1	12:40	14:10
413307	242501	33195	3	0	0	1	12:40	14:10
413308	242501	33202	3	0	0	1	12:40	14:10
413309	242501	33209	3	0	0	1	12:40	14:10
413310	242501	33216	3	0	0	1	12:40	14:10
413311	242501	33223	3	0	0	1	12:40	14:10
413312	242501	33230	3	0	0	1	12:40	14:10
413313	242501	33237	3	0	0	1	12:40	14:10
413314	242501	33132	4	0	0	5	14:20	15:50
413315	242501	33139	4	0	0	5	14:20	15:50
413316	242501	33146	4	0	0	5	14:20	15:50
413317	242501	33153	4	0	0	5	14:20	15:50
413318	242501	33160	4	0	0	5	14:20	15:50
413319	242501	33167	4	0	0	5	14:20	15:50
413320	242501	33174	4	0	0	5	14:20	15:50
413321	242501	33181	4	0	0	5	14:20	15:50
413322	242501	33188	4	0	0	5	14:20	15:50
413323	242501	33195	4	0	0	5	14:20	15:50
413324	242501	33202	4	0	0	5	14:20	15:50
413325	242501	33209	4	0	0	5	14:20	15:50
413326	242501	33216	4	0	0	5	14:20	15:50
413327	242501	33223	4	0	0	5	14:20	15:50
413328	242501	33230	4	0	0	5	14:20	15:50
413329	242501	33237	4	0	0	5	14:20	15:50
413330	242501	33133	4	0	0	3	14:20	15:50
413331	242501	33140	4	0	0	3	14:20	15:50
413332	242501	33147	4	0	0	3	14:20	15:50
413333	242501	33154	4	0	0	3	14:20	15:50
413334	242501	33161	4	0	0	3	14:20	15:50
413335	242501	33168	4	0	0	3	14:20	15:50
413336	242501	33175	4	0	0	3	14:20	15:50
413337	242501	33182	4	0	0	3	14:20	15:50
413338	242501	33189	4	0	0	3	14:20	15:50
413339	242501	33196	4	0	0	3	14:20	15:50
413340	242501	33203	4	0	0	3	14:20	15:50
413341	242501	33210	4	0	0	3	14:20	15:50
413342	242501	33217	4	0	0	3	14:20	15:50
413343	242501	33224	4	0	0	3	14:20	15:50
413344	242501	33231	4	0	0	3	14:20	15:50
413345	242501	33238	4	0	0	3	14:20	15:50
413346	242501	33133	5	0	0	7	16:20	17:50
413347	242501	33140	5	0	0	7	16:20	17:50
413348	242501	33147	5	0	0	7	16:20	17:50
413349	242501	33154	5	0	0	7	16:20	17:50
413350	242501	33161	5	0	0	7	16:20	17:50
413351	242501	33168	5	0	0	7	16:20	17:50
413352	242501	33175	5	0	0	7	16:20	17:50
413353	242501	33182	5	0	0	7	16:20	17:50
413354	242501	33189	5	0	0	7	16:20	17:50
413355	242501	33196	5	0	0	7	16:20	17:50
413356	242501	33203	5	0	0	7	16:20	17:50
413357	242501	33210	5	0	0	7	16:20	17:50
413358	242501	33217	5	0	0	7	16:20	17:50
413359	242501	33224	5	0	0	7	16:20	17:50
413360	242501	33231	5	0	0	7	16:20	17:50
413361	242501	33238	5	0	0	7	16:20	17:50
413362	242501	33134	2	0	0	0	10:40	12:10
413363	242501	33141	2	0	0	0	10:40	12:10
413364	242501	33148	2	0	0	0	10:40	12:10
413365	242501	33155	2	0	0	0	10:40	12:10
413366	242501	33162	2	0	0	0	10:40	12:10
413367	242501	33169	2	0	0	0	10:40	12:10
413368	242501	33176	2	0	0	0	10:40	12:10
413369	242501	33183	2	0	0	0	10:40	12:10
413370	242501	33190	2	0	0	0	10:40	12:10
413371	242501	33197	2	0	0	0	10:40	12:10
413372	242501	33204	2	0	0	0	10:40	12:10
413373	242501	33211	2	0	0	0	10:40	12:10
413374	242501	33218	2	0	0	0	10:40	12:10
413375	242501	33225	2	0	0	0	10:40	12:10
413376	242501	33232	2	0	0	0	10:40	12:10
413377	242501	33239	2	0	0	0	10:40	12:10
413378	242501	33134	3	0	0	8	12:40	14:10
413379	242501	33141	3	0	0	8	12:40	14:10
413380	242501	33148	3	0	0	8	12:40	14:10
413381	242501	33155	3	0	0	8	12:40	14:10
413382	242501	33162	3	0	0	8	12:40	14:10
413383	242501	33169	3	0	0	8	12:40	14:10
413384	242501	33176	3	0	0	8	12:40	14:10
413385	242501	33183	3	0	0	8	12:40	14:10
413386	242501	33190	3	0	0	8	12:40	14:10
413387	242501	33197	3	0	0	8	12:40	14:10
413388	242501	33204	3	0	0	8	12:40	14:10
413389	242501	33211	3	0	0	8	12:40	14:10
413390	242501	33218	3	0	0	8	12:40	14:10
413391	242501	33225	3	0	0	8	12:40	14:10
413392	242501	33232	3	0	0	8	12:40	14:10
413393	242501	33239	3	0	0	8	12:40	14:10
413394	242501	33130	1	0	0	6	09:00	10:30
413395	242501	33137	1	0	0	6	09:00	10:30
413396	242501	33144	1	0	0	6	09:00	10:30
413397	242501	33151	1	0	0	6	09:00	10:30
413398	242501	33158	1	0	0	6	09:00	10:30
413399	242501	33165	1	0	0	6	09:00	10:30
413400	242501	33172	1	0	0	6	09:00	10:30
413401	242501	33179	1	0	0	6	09:00	10:30
413402	242501	33186	1	0	0	6	09:00	10:30
413403	242501	33193	1	0	0	6	09:00	10:30
413404	242501	33200	1	0	0	6	09:00	10:30
413405	242501	33207	1	0	0	6	09:00	10:30
413406	242501	33214	1	0	0	6	09:00	10:30
413407	242501	33221	1	0	0	6	09:00	10:30
413408	242501	33228	1	0	0	6	09:00	10:30
413409	242501	33235	1	0	0	6	09:00	10:30
413410	242501	33130	2	0	0	6	10:40	12:10
413411	242501	33137	2	0	0	6	10:40	12:10
413412	242501	33144	2	0	0	6	10:40	12:10
413413	242501	33151	2	0	0	6	10:40	12:10
413414	242501	33158	2	0	0	6	10:40	12:10
413415	242501	33165	2	0	0	6	10:40	12:10
413416	242501	33172	2	0	0	6	10:40	12:10
413417	242501	33179	2	0	0	6	10:40	12:10
413418	242501	33186	2	0	0	6	10:40	12:10
413419	242501	33193	2	0	0	6	10:40	12:10
413420	242501	33200	2	0	0	6	10:40	12:10
413421	242501	33207	2	0	0	6	10:40	12:10
413422	242501	33214	2	0	0	6	10:40	12:10
413423	242501	33221	2	0	0	6	10:40	12:10
413424	242501	33228	2	0	0	6	10:40	12:10
413425	242501	33235	2	0	0	6	10:40	12:10
413426	242501	33131	3	0	0	5	12:40	14:10
413427	242501	33138	3	0	0	5	12:40	14:10
413428	242501	33145	3	0	0	5	12:40	14:10
413429	242501	33152	3	0	0	5	12:40	14:10
413430	242501	33159	3	0	0	5	12:40	14:10
413431	242501	33166	3	0	0	5	12:40	14:10
413432	242501	33173	3	0	0	5	12:40	14:10
413433	242501	33180	3	0	0	5	12:40	14:10
413434	242501	33187	3	0	0	5	12:40	14:10
413435	242501	33194	3	0	0	5	12:40	14:10
413436	242501	33201	3	0	0	5	12:40	14:10
413437	242501	33208	3	0	0	5	12:40	14:10
413438	242501	33215	3	0	0	5	12:40	14:10
413439	242501	33222	3	0	0	5	12:40	14:10
413440	242501	33229	3	0	0	5	12:40	14:10
413441	242501	33236	3	0	0	5	12:40	14:10
413442	242501	33131	4	0	0	3	14:20	15:50
413443	242501	33138	4	0	0	3	14:20	15:50
413444	242501	33145	4	0	0	3	14:20	15:50
413445	242501	33152	4	0	0	3	14:20	15:50
413446	242501	33159	4	0	0	3	14:20	15:50
413447	242501	33166	4	0	0	3	14:20	15:50
413448	242501	33173	4	0	0	3	14:20	15:50
413449	242501	33180	4	0	0	3	14:20	15:50
413450	242501	33187	4	0	0	3	14:20	15:50
413451	242501	33194	4	0	0	3	14:20	15:50
413452	242501	33201	4	0	0	3	14:20	15:50
413453	242501	33208	4	0	0	3	14:20	15:50
413454	242501	33215	4	0	0	3	14:20	15:50
413455	242501	33222	4	0	0	3	14:20	15:50
413456	242501	33229	4	0	0	3	14:20	15:50
413457	242501	33236	4	0	0	3	14:20	15:50
413458	242501	33132	3	0	0	12	12:40	14:10
413459	242501	33139	3	0	0	12	12:40	14:10
413460	242501	33146	3	0	0	12	12:40	14:10
413461	242501	33153	3	0	0	12	12:40	14:10
413462	242501	33160	3	0	0	12	12:40	14:10
413463	242501	33167	3	0	0	12	12:40	14:10
413464	242501	33174	3	0	0	12	12:40	14:10
413465	242501	33181	3	0	0	12	12:40	14:10
413466	242501	33188	3	0	0	12	12:40	14:10
413467	242501	33195	3	0	0	12	12:40	14:10
413468	242501	33202	3	0	0	12	12:40	14:10
413469	242501	33209	3	0	0	12	12:40	14:10
413470	242501	33216	3	0	0	12	12:40	14:10
413471	242501	33223	3	0	0	12	12:40	14:10
413472	242501	33230	3	0	0	12	12:40	14:10
413473	242501	33237	3	0	0	12	12:40	14:10
413474	242501	33132	4	0	0	4	14:20	15:50
413475	242501	33139	4	0	0	4	14:20	15:50
413476	242501	33146	4	0	0	4	14:20	15:50
413477	242501	33153	4	0	0	4	14:20	15:50
413478	242501	33160	4	0	0	4	14:20	15:50
413479	242501	33167	4	0	0	4	14:20	15:50
413480	242501	33174	4	0	0	4	14:20	15:50
413481	242501	33181	4	0	0	4	14:20	15:50
413482	242501	33188	4	0	0	4	14:20	15:50
413483	242501	33195	4	0	0	4	14:20	15:50
413484	242501	33202	4	0	0	4	14:20	15:50
413485	242501	33209	4	0	0	4	14:20	15:50
413486	242501	33216	4	0	0	4	14:20	15:50
413487	242501	33223	4	0	0	4	14:20	15:50
413488	242501	33230	4	0	0	4	14:20	15:50
413489	242501	33237	4	0	0	4	14:20	15:50
413490	242501	33133	4	0	1	8	14:20	15:50
413491	242501	33140	4	0	1	8	14:20	15:50
413492	242501	33147	4	0	1	8	14:20	15:50
413493	242501	33154	4	0	1	8	14:20	15:50
413494	242501	33161	4	0	1	8	14:20	15:50
413495	242501	33168	4	0	1	8	14:20	15:50
413496	242501	33175	4	0	1	8	14:20	15:50
413497	242501	33182	4	0	1	8	14:20	15:50
413498	242501	33189	4	0	1	8	14:20	15:50
413499	242501	33196	4	0	1	8	14:20	15:50
413500	242501	33203	4	0	1	8	14:20	15:50
413501	242501	33210	4	0	1	8	14:20	15:50
413502	242501	33217	4	0	1	8	14:20	15:50
413503	242501	33224	4	0	1	8	14:20	15:50
413504	242501	33231	4	0	1	8	14:20	15:50
413505	242501	33238	4	0	1	8	14:20	15:50
413506	242501	33133	5	0	0	7	16:20	17:50
413507	242501	33140	5	0	0	7	16:20	17:50
413508	242501	33147	5	0	0	7	16:20	17:50
413509	242501	33154	5	0	0	7	16:20	17:50
413510	242501	33161	5	0	0	7	16:20	17:50
413511	242501	33168	5	0	0	7	16:20	17:50
413512	242501	33175	5	0	0	7	16:20	17:50
413513	242501	33182	5	0	0	7	16:20	17:50
413514	242501	33189	5	0	0	7	16:20	17:50
413515	242501	33196	5	0	0	7	16:20	17:50
413516	242501	33203	5	0	0	7	16:20	17:50
413517	242501	33210	5	0	0	7	16:20	17:50
413518	242501	33217	5	0	0	7	16:20	17:50
413519	242501	33224	5	0	0	7	16:20	17:50
413520	242501	33231	5	0	0	7	16:20	17:50
413521	242501	33238	5	0	0	7	16:20	17:50
413522	242501	33134	2	0	0	1	10:40	12:10
413523	242501	33141	2	0	0	1	10:40	12:10
413524	242501	33148	2	0	0	1	10:40	12:10
413525	242501	33155	2	0	0	1	10:40	12:10
413526	242501	33162	2	0	0	1	10:40	12:10
413527	242501	33169	2	0	0	1	10:40	12:10
413528	242501	33176	2	0	0	1	10:40	12:10
413529	242501	33183	2	0	0	1	10:40	12:10
413530	242501	33190	2	0	0	1	10:40	12:10
413531	242501	33197	2	0	0	1	10:40	12:10
413532	242501	33204	2	0	0	1	10:40	12:10
413533	242501	33211	2	0	0	1	10:40	12:10
413534	242501	33218	2	0	0	1	10:40	12:10
413535	242501	33225	2	0	0	1	10:40	12:10
413536	242501	33232	2	0	0	1	10:40	12:10
413537	242501	33239	2	0	0	1	10:40	12:10
413538	242501	33134	3	0	0	0	12:40	14:10
413539	242501	33141	3	0	0	0	12:40	14:10
413540	242501	33148	3	0	0	0	12:40	14:10
413541	242501	33155	3	0	0	0	12:40	14:10
413542	242501	33162	3	0	0	0	12:40	14:10
413543	242501	33169	3	0	0	0	12:40	14:10
413544	242501	33176	3	0	0	0	12:40	14:10
413545	242501	33183	3	0	0	0	12:40	14:10
413546	242501	33190	3	0	0	0	12:40	14:10
413547	242501	33197	3	0	0	0	12:40	14:10
413548	242501	33204	3	0	0	0	12:40	14:10
413549	242501	33211	3	0	0	0	12:40	14:10
413550	242501	33218	3	0	0	0	12:40	14:10
413551	242501	33225	3	0	0	0	12:40	14:10
413552	242501	33232	3	0	0	0	12:40	14:10
413553	242501	33239	3	0	0	0	12:40	14:10
413554	242501	33142	2	0	0	2	10:40	12:10
413555	242501	33156	2	0	0	2	10:40	12:10
413556	242501	33170	2	0	0	2	10:40	12:10
413557	242501	33184	2	0	0	2	10:40	12:10
413558	242501	33198	2	0	0	2	10:40	12:10
413559	242501	33212	2	0	0	2	10:40	12:10
413560	242501	33226	2	0	0	2	10:40	12:10
413561	242501	33240	2	0	0	2	10:40	12:10
413562	242501	33142	3	0	0	2	12:40	14:10
413563	242501	33156	3	0	0	2	12:40	14:10
413564	242501	33170	3	0	0	2	12:40	14:10
413565	242501	33184	3	0	0	2	12:40	14:10
413566	242501	33198	3	0	0	2	12:40	14:10
413567	242501	33212	3	0	0	2	12:40	14:10
413568	242501	33226	3	0	0	2	12:40	14:10
413569	242501	33240	3	0	0	2	12:40	14:10
413570	242501	33142	4	0	0	2	14:20	15:50
413571	242501	33156	4	0	0	2	14:20	15:50
413572	242501	33170	4	0	0	2	14:20	15:50
413573	242501	33184	4	0	0	2	14:20	15:50
413574	242501	33198	4	0	0	2	14:20	15:50
413575	242501	33212	4	0	0	2	14:20	15:50
413576	242501	33226	4	0	0	2	14:20	15:50
413577	242501	33240	4	0	0	2	14:20	15:50
413578	242501	33142	5	0	0	2	16:20	17:50
413579	242501	33156	5	0	0	2	16:20	17:50
413580	242501	33170	5	0	0	2	16:20	17:50
413581	242501	33184	5	0	0	2	16:20	17:50
413582	242501	33198	5	0	0	2	16:20	17:50
413583	242501	33212	5	0	0	2	16:20	17:50
413584	242501	33226	5	0	0	2	16:20	17:50
413585	242501	33240	5	0	0	2	16:20	17:50
413586	242501	33130	3	0	1	13	12:40	14:10
413587	242501	33137	3	0	1	13	12:40	14:10
413588	242501	33144	3	0	1	13	12:40	14:10
413589	242501	33151	3	0	1	13	12:40	14:10
413590	242501	33158	3	0	1	13	12:40	14:10
413591	242501	33165	3	0	1	13	12:40	14:10
413592	242501	33172	3	0	1	13	12:40	14:10
413593	242501	33179	3	0	1	13	12:40	14:10
413594	242501	33186	3	0	1	13	12:40	14:10
413595	242501	33193	3	0	1	13	12:40	14:10
413596	242501	33200	3	0	1	13	12:40	14:10
413597	242501	33207	3	0	1	13	12:40	14:10
413598	242501	33214	3	0	1	13	12:40	14:10
413599	242501	33221	3	0	1	13	12:40	14:10
413600	242501	33228	3	0	1	13	12:40	14:10
413601	242501	33235	3	0	1	13	12:40	14:10
413602	242501	33130	4	0	0	14	14:20	15:50
413603	242501	33137	4	0	0	14	14:20	15:50
413604	242501	33144	4	0	0	14	14:20	15:50
413605	242501	33151	4	0	0	14	14:20	15:50
413606	242501	33158	4	0	0	14	14:20	15:50
413607	242501	33165	4	0	0	14	14:20	15:50
413608	242501	33172	4	0	0	14	14:20	15:50
413609	242501	33179	4	0	0	14	14:20	15:50
413610	242501	33186	4	0	0	14	14:20	15:50
413611	242501	33193	4	0	0	14	14:20	15:50
413612	242501	33200	4	0	0	14	14:20	15:50
413613	242501	33207	4	0	0	14	14:20	15:50
413614	242501	33214	4	0	0	14	14:20	15:50
413615	242501	33221	4	0	0	14	14:20	15:50
413616	242501	33228	4	0	0	14	14:20	15:50
413617	242501	33235	4	0	0	14	14:20	15:50
413618	242501	33130	5	0	0	12	16:20	17:50
413619	242501	33137	5	0	0	12	16:20	17:50
413620	242501	33144	5	0	0	12	16:20	17:50
413621	242501	33151	5	0	0	12	16:20	17:50
413622	242501	33158	5	0	0	12	16:20	17:50
413623	242501	33165	5	0	0	12	16:20	17:50
413624	242501	33172	5	0	0	12	16:20	17:50
413625	242501	33179	5	0	0	12	16:20	17:50
413626	242501	33186	5	0	0	12	16:20	17:50
413627	242501	33193	5	0	0	12	16:20	17:50
413628	242501	33200	5	0	0	12	16:20	17:50
413629	242501	33207	5	0	0	12	16:20	17:50
413630	242501	33214	5	0	0	12	16:20	17:50
413631	242501	33221	5	0	0	12	16:20	17:50
413632	242501	33228	5	0	0	12	16:20	17:50
413633	242501	33235	5	0	0	12	16:20	17:50
413634	242501	33130	6	0	0	15	18:00	19:30
413635	242501	33137	6	0	0	15	18:00	19:30
413636	242501	33144	6	0	0	15	18:00	19:30
413637	242501	33151	6	0	0	15	18:00	19:30
413638	242501	33158	6	0	0	15	18:00	19:30
413639	242501	33165	6	0	0	15	18:00	19:30
413640	242501	33172	6	0	0	15	18:00	19:30
413641	242501	33179	6	0	0	15	18:00	19:30
413642	242501	33186	6	0	0	15	18:00	19:30
413643	242501	33193	6	0	0	15	18:00	19:30
413644	242501	33200	6	0	0	15	18:00	19:30
413645	242501	33207	6	0	0	15	18:00	19:30
413646	242501	33214	6	0	0	15	18:00	19:30
413647	242501	33221	6	0	0	15	18:00	19:30
413648	242501	33228	6	0	0	15	18:00	19:30
413649	242501	33235	6	0	0	15	18:00	19:30
413650	242501	33131	1	0	0	16	09:00	10:30
413651	242501	33145	1	0	0	16	09:00	10:30
413652	242501	33159	1	0	0	16	09:00	10:30
413653	242501	33173	1	0	0	16	09:00	10:30
413654	242501	33187	1	0	0	16	09:00	10:30
413655	242501	33201	1	0	0	16	09:00	10:30
413656	242501	33215	1	0	0	16	09:00	10:30
413657	242501	33229	1	0	0	16	09:00	10:30
413658	242501	33138	1	0	1	16	09:00	10:30
413659	242501	33152	1	0	1	16	09:00	10:30
413660	242501	33166	1	0	1	16	09:00	10:30
413661	242501	33180	1	0	1	16	09:00	10:30
413662	242501	33194	1	0	1	16	09:00	10:30
413663	242501	33208	1	0	1	16	09:00	10:30
413664	242501	33222	1	0	1	16	09:00	10:30
413665	242501	33236	1	0	1	16	09:00	10:30
413666	242501	33131	2	0	1	15	10:40	12:10
413667	242501	33138	2	0	1	15	10:40	12:10
413668	242501	33145	2	0	1	15	10:40	12:10
413669	242501	33152	2	0	1	15	10:40	12:10
413670	242501	33159	2	0	1	15	10:40	12:10
413671	242501	33166	2	0	1	15	10:40	12:10
413672	242501	33173	2	0	1	15	10:40	12:10
413673	242501	33180	2	0	1	15	10:40	12:10
413674	242501	33187	2	0	1	15	10:40	12:10
413675	242501	33194	2	0	1	15	10:40	12:10
413676	242501	33201	2	0	1	15	10:40	12:10
413677	242501	33208	2	0	1	15	10:40	12:10
413678	242501	33215	2	0	1	15	10:40	12:10
413679	242501	33222	2	0	1	15	10:40	12:10
413680	242501	33229	2	0	1	15	10:40	12:10
413681	242501	33236	2	0	1	15	10:40	12:10
413682	242501	33131	3	0	0	15	12:40	14:10
413683	242501	33138	3	0	0	15	12:40	14:10
413684	242501	33145	3	0	0	15	12:40	14:10
413685	242501	33152	3	0	0	15	12:40	14:10
413686	242501	33159	3	0	0	15	12:40	14:10
413687	242501	33166	3	0	0	15	12:40	14:10
413688	242501	33173	3	0	0	15	12:40	14:10
413689	242501	33180	3	0	0	15	12:40	14:10
413690	242501	33187	3	0	0	15	12:40	14:10
413691	242501	33194	3	0	0	15	12:40	14:10
413692	242501	33201	3	0	0	15	12:40	14:10
413693	242501	33208	3	0	0	15	12:40	14:10
413694	242501	33215	3	0	0	15	12:40	14:10
413695	242501	33222	3	0	0	15	12:40	14:10
413696	242501	33229	3	0	0	15	12:40	14:10
413697	242501	33236	3	0	0	15	12:40	14:10
413698	242501	33138	4	0	1	17	14:20	15:50
413699	242501	33152	4	0	1	17	14:20	15:50
413700	242501	33166	4	0	1	17	14:20	15:50
413701	242501	33180	4	0	1	17	14:20	15:50
413702	242501	33194	4	0	1	17	14:20	15:50
413703	242501	33208	4	0	1	17	14:20	15:50
413704	242501	33222	4	0	1	17	14:20	15:50
413705	242501	33236	4	0	1	17	14:20	15:50
413706	242501	33138	5	0	0	17	16:20	17:50
413707	242501	33152	5	0	0	17	16:20	17:50
413708	242501	33166	5	0	0	17	16:20	17:50
413709	242501	33180	5	0	0	17	16:20	17:50
413710	242501	33194	5	0	0	17	16:20	17:50
413711	242501	33208	5	0	0	17	16:20	17:50
413712	242501	33222	5	0	0	17	16:20	17:50
413713	242501	33236	5	0	0	17	16:20	17:50
413714	242501	33132	1	0	0	3	09:00	10:30
413715	242501	33139	1	0	0	3	09:00	10:30
413716	242501	33146	1	0	0	3	09:00	10:30
413717	242501	33153	1	0	0	3	09:00	10:30
413718	242501	33160	1	0	0	3	09:00	10:30
413719	242501	33167	1	0	0	3	09:00	10:30
413720	242501	33174	1	0	0	3	09:00	10:30
413721	242501	33181	1	0	0	3	09:00	10:30
413722	242501	33188	1	0	0	3	09:00	10:30
413723	242501	33195	1	0	0	3	09:00	10:30
413724	242501	33202	1	0	0	3	09:00	10:30
413725	242501	33209	1	0	0	3	09:00	10:30
413726	242501	33216	1	0	0	3	09:00	10:30
413727	242501	33223	1	0	0	3	09:00	10:30
413728	242501	33230	1	0	0	3	09:00	10:30
413729	242501	33237	1	0	0	3	09:00	10:30
413730	242501	33132	2	0	0	18	10:40	12:10
413731	242501	33139	2	0	0	18	10:40	12:10
413732	242501	33146	2	0	0	18	10:40	12:10
413733	242501	33153	2	0	0	18	10:40	12:10
413734	242501	33160	2	0	0	18	10:40	12:10
413735	242501	33167	2	0	0	18	10:40	12:10
413736	242501	33174	2	0	0	18	10:40	12:10
413737	242501	33181	2	0	0	18	10:40	12:10
413738	242501	33188	2	0	0	18	10:40	12:10
413739	242501	33195	2	0	0	18	10:40	12:10
413740	242501	33202	2	0	0	18	10:40	12:10
413741	242501	33209	2	0	0	18	10:40	12:10
413742	242501	33216	2	0	0	18	10:40	12:10
413743	242501	33223	2	0	0	18	10:40	12:10
413744	242501	33230	2	0	0	18	10:40	12:10
413745	242501	33237	2	0	0	18	10:40	12:10
413746	242501	33132	3	0	1	15	12:40	14:10
413747	242501	33139	3	0	1	15	12:40	14:10
413748	242501	33146	3	0	1	15	12:40	14:10
413749	242501	33153	3	0	1	15	12:40	14:10
413750	242501	33160	3	0	1	15	12:40	14:10
413751	242501	33167	3	0	1	15	12:40	14:10
413752	242501	33174	3	0	1	15	12:40	14:10
413753	242501	33181	3	0	1	15	12:40	14:10
413754	242501	33188	3	0	1	15	12:40	14:10
413755	242501	33195	3	0	1	15	12:40	14:10
413756	242501	33202	3	0	1	15	12:40	14:10
413757	242501	33209	3	0	1	15	12:40	14:10
413758	242501	33216	3	0	1	15	12:40	14:10
413759	242501	33223	3	0	1	15	12:40	14:10
413760	242501	33230	3	0	1	15	12:40	14:10
413761	242501	33237	3	0	1	15	12:40	14:10
413762	242501	33132	4	0	1	12	14:20	15:50
413763	242501	33139	4	0	1	12	14:20	15:50
413764	242501	33146	4	0	1	12	14:20	15:50
413765	242501	33153	4	0	1	12	14:20	15:50
413766	242501	33160	4	0	1	12	14:20	15:50
413767	242501	33167	4	0	1	12	14:20	15:50
413768	242501	33174	4	0	1	12	14:20	15:50
413769	242501	33181	4	0	1	12	14:20	15:50
413770	242501	33188	4	0	1	12	14:20	15:50
413771	242501	33195	4	0	1	12	14:20	15:50
413772	242501	33202	4	0	1	12	14:20	15:50
413773	242501	33209	4	0	1	12	14:20	15:50
413774	242501	33216	4	0	1	12	14:20	15:50
413775	242501	33223	4	0	1	12	14:20	15:50
413776	242501	33230	4	0	1	12	14:20	15:50
413777	242501	33237	4	0	1	12	14:20	15:50
413778	242501	33139	5	0	1	19	16:20	17:50
413779	242501	33153	5	0	1	19	16:20	17:50
413780	242501	33167	5	0	1	19	16:20	17:50
413781	242501	33181	5	0	1	19	16:20	17:50
413782	242501	33195	5	0	1	19	16:20	17:50
413783	242501	33209	5	0	1	19	16:20	17:50
413784	242501	33223	5	0	1	19	16:20	17:50
413785	242501	33237	5	0	1	19	16:20	17:50
413786	242501	33140	2	0	0	20	10:40	12:10
413787	242501	33154	2	0	0	20	10:40	12:10
413788	242501	33168	2	0	0	20	10:40	12:10
413789	242501	33182	2	0	0	20	10:40	12:10
413790	242501	33196	2	0	0	20	10:40	12:10
413791	242501	33210	2	0	0	20	10:40	12:10
413792	242501	33224	2	0	0	20	10:40	12:10
413793	242501	33238	2	0	0	20	10:40	12:10
413794	242501	33140	3	0	0	20	12:40	14:10
413795	242501	33154	3	0	0	20	12:40	14:10
413796	242501	33168	3	0	0	20	12:40	14:10
413797	242501	33182	3	0	0	20	12:40	14:10
413798	242501	33196	3	0	0	20	12:40	14:10
413799	242501	33210	3	0	0	20	12:40	14:10
413800	242501	33224	3	0	0	20	12:40	14:10
413801	242501	33238	3	0	0	20	12:40	14:10
413802	242501	33133	4	0	1	21	14:20	15:50
413803	242501	33147	4	0	1	21	14:20	15:50
413804	242501	33161	4	0	1	21	14:20	15:50
413805	242501	33175	4	0	1	21	14:20	15:50
413806	242501	33189	4	0	1	21	14:20	15:50
413807	242501	33203	4	0	1	21	14:20	15:50
413808	242501	33217	4	0	1	21	14:20	15:50
413809	242501	33231	4	0	1	21	14:20	15:50
413810	242501	33133	5	0	0	21	16:20	17:50
413811	242501	33147	5	0	0	21	16:20	17:50
413812	242501	33161	5	0	0	21	16:20	17:50
413813	242501	33175	5	0	0	21	16:20	17:50
413814	242501	33189	5	0	0	21	16:20	17:50
413815	242501	33203	5	0	0	21	16:20	17:50
413816	242501	33217	5	0	0	21	16:20	17:50
413817	242501	33231	5	0	0	21	16:20	17:50
413818	242501	33134	3	0	1	22	12:40	14:10
413819	242501	33148	3	0	1	22	12:40	14:10
413820	242501	33162	3	0	1	22	12:40	14:10
413821	242501	33176	3	0	1	22	12:40	14:10
413822	242501	33190	3	0	1	22	12:40	14:10
413823	242501	33204	3	0	1	22	12:40	14:10
413824	242501	33218	3	0	1	22	12:40	14:10
413825	242501	33232	3	0	1	22	12:40	14:10
413826	242501	33134	4	0	0	17	14:20	15:50
413827	242501	33148	4	0	0	17	14:20	15:50
413828	242501	33162	4	0	0	17	14:20	15:50
413829	242501	33176	4	0	0	17	14:20	15:50
413830	242501	33190	4	0	0	17	14:20	15:50
413831	242501	33204	4	0	0	17	14:20	15:50
413832	242501	33218	4	0	0	17	14:20	15:50
413833	242501	33232	4	0	0	17	14:20	15:50
413834	242501	33141	4	0	0	19	14:20	15:50
413835	242501	33155	4	0	0	19	14:20	15:50
413836	242501	33169	4	0	0	19	14:20	15:50
413837	242501	33183	4	0	0	19	14:20	15:50
413838	242501	33197	4	0	0	19	14:20	15:50
413839	242501	33211	4	0	0	19	14:20	15:50
413840	242501	33225	4	0	0	19	14:20	15:50
413841	242501	33239	4	0	0	19	14:20	15:50
413842	242501	33134	5	0	0	22	16:20	17:50
413843	242501	33141	5	0	0	22	16:20	17:50
413844	242501	33148	5	0	0	22	16:20	17:50
413845	242501	33155	5	0	0	22	16:20	17:50
413846	242501	33162	5	0	0	22	16:20	17:50
413847	242501	33169	5	0	0	22	16:20	17:50
413848	242501	33176	5	0	0	22	16:20	17:50
413849	242501	33183	5	0	0	22	16:20	17:50
413850	242501	33190	5	0	0	22	16:20	17:50
413851	242501	33197	5	0	0	22	16:20	17:50
413852	242501	33204	5	0	0	22	16:20	17:50
413853	242501	33211	5	0	0	22	16:20	17:50
413854	242501	33218	5	0	0	22	16:20	17:50
413855	242501	33225	5	0	0	22	16:20	17:50
413856	242501	33232	5	0	0	22	16:20	17:50
413857	242501	33239	5	0	0	22	16:20	17:50
413858	242501	33130	4	0	0	12	14:20	15:50
413859	242501	33137	4	0	0	12	14:20	15:50
413860	242501	33144	4	0	0	12	14:20	15:50
413861	242501	33151	4	0	0	12	14:20	15:50
413862	242501	33158	4	0	0	12	14:20	15:50
413863	242501	33165	4	0	0	12	14:20	15:50
413864	242501	33172	4	0	0	12	14:20	15:50
413865	242501	33179	4	0	0	12	14:20	15:50
413866	242501	33186	4	0	0	12	14:20	15:50
413867	242501	33193	4	0	0	12	14:20	15:50
413868	242501	33200	4	0	0	12	14:20	15:50
413869	242501	33207	4	0	0	12	14:20	15:50
413870	242501	33214	4	0	0	12	14:20	15:50
413871	242501	33221	4	0	0	12	14:20	15:50
413872	242501	33228	4	0	0	12	14:20	15:50
413873	242501	33235	4	0	0	12	14:20	15:50
413874	242501	33130	5	0	0	15	16:20	17:50
413875	242501	33137	5	0	0	15	16:20	17:50
413876	242501	33144	5	0	0	15	16:20	17:50
413877	242501	33151	5	0	0	15	16:20	17:50
413878	242501	33158	5	0	0	15	16:20	17:50
413879	242501	33165	5	0	0	15	16:20	17:50
413880	242501	33172	5	0	0	15	16:20	17:50
413881	242501	33179	5	0	0	15	16:20	17:50
413882	242501	33186	5	0	0	15	16:20	17:50
413883	242501	33193	5	0	0	15	16:20	17:50
413884	242501	33200	5	0	0	15	16:20	17:50
413885	242501	33207	5	0	0	15	16:20	17:50
413886	242501	33214	5	0	0	15	16:20	17:50
413887	242501	33221	5	0	0	15	16:20	17:50
413888	242501	33228	5	0	0	15	16:20	17:50
413889	242501	33235	5	0	0	15	16:20	17:50
413890	242501	33131	1	0	0	19	09:00	10:30
413891	242501	33145	1	0	0	19	09:00	10:30
413892	242501	33159	1	0	0	19	09:00	10:30
413893	242501	33173	1	0	0	19	09:00	10:30
413894	242501	33187	1	0	0	19	09:00	10:30
413895	242501	33201	1	0	0	19	09:00	10:30
413896	242501	33215	1	0	0	19	09:00	10:30
413897	242501	33229	1	0	0	19	09:00	10:30
413898	242501	33138	1	0	1	16	09:00	10:30
413899	242501	33152	1	0	1	16	09:00	10:30
413900	242501	33166	1	0	1	16	09:00	10:30
413901	242501	33180	1	0	1	16	09:00	10:30
413902	242501	33194	1	0	1	16	09:00	10:30
413903	242501	33208	1	0	1	16	09:00	10:30
413904	242501	33222	1	0	1	16	09:00	10:30
413905	242501	33236	1	0	1	16	09:00	10:30
413906	242501	33131	3	0	0	18	12:40	14:10
413907	242501	33138	3	0	0	18	12:40	14:10
413908	242501	33145	3	0	0	18	12:40	14:10
413909	242501	33152	3	0	0	18	12:40	14:10
413910	242501	33159	3	0	0	18	12:40	14:10
413911	242501	33166	3	0	0	18	12:40	14:10
413912	242501	33173	3	0	0	18	12:40	14:10
413913	242501	33180	3	0	0	18	12:40	14:10
413914	242501	33187	3	0	0	18	12:40	14:10
413915	242501	33194	3	0	0	18	12:40	14:10
413916	242501	33201	3	0	0	18	12:40	14:10
413917	242501	33208	3	0	0	18	12:40	14:10
413918	242501	33215	3	0	0	18	12:40	14:10
413919	242501	33222	3	0	0	18	12:40	14:10
413920	242501	33229	3	0	0	18	12:40	14:10
413921	242501	33236	3	0	0	18	12:40	14:10
413922	242501	33131	4	0	0	16	14:20	15:50
413923	242501	33145	4	0	0	16	14:20	15:50
413924	242501	33159	4	0	0	16	14:20	15:50
413925	242501	33173	4	0	0	16	14:20	15:50
413926	242501	33187	4	0	0	16	14:20	15:50
413927	242501	33201	4	0	0	16	14:20	15:50
413928	242501	33215	4	0	0	16	14:20	15:50
413929	242501	33229	4	0	0	16	14:20	15:50
413930	242501	33131	5	0	0	17	16:20	17:50
413931	242501	33145	5	0	0	17	16:20	17:50
413932	242501	33159	5	0	0	17	16:20	17:50
413933	242501	33173	5	0	0	17	16:20	17:50
413934	242501	33187	5	0	0	17	16:20	17:50
413935	242501	33201	5	0	0	17	16:20	17:50
413936	242501	33215	5	0	0	17	16:20	17:50
413937	242501	33229	5	0	0	17	16:20	17:50
413938	242501	33132	1	0	0	3	09:00	10:30
413939	242501	33139	1	0	0	3	09:00	10:30
413940	242501	33146	1	0	0	3	09:00	10:30
413941	242501	33153	1	0	0	3	09:00	10:30
413942	242501	33160	1	0	0	3	09:00	10:30
413943	242501	33167	1	0	0	3	09:00	10:30
413944	242501	33174	1	0	0	3	09:00	10:30
413945	242501	33181	1	0	0	3	09:00	10:30
413946	242501	33188	1	0	0	3	09:00	10:30
413947	242501	33195	1	0	0	3	09:00	10:30
413948	242501	33202	1	0	0	3	09:00	10:30
413949	242501	33209	1	0	0	3	09:00	10:30
413950	242501	33216	1	0	0	3	09:00	10:30
413951	242501	33223	1	0	0	3	09:00	10:30
413952	242501	33230	1	0	0	3	09:00	10:30
413953	242501	33237	1	0	0	3	09:00	10:30
413954	242501	33132	2	0	0	14	10:40	12:10
413955	242501	33139	2	0	0	14	10:40	12:10
413956	242501	33146	2	0	0	14	10:40	12:10
413957	242501	33153	2	0	0	14	10:40	12:10
413958	242501	33160	2	0	0	14	10:40	12:10
413959	242501	33167	2	0	0	14	10:40	12:10
413960	242501	33174	2	0	0	14	10:40	12:10
413961	242501	33181	2	0	0	14	10:40	12:10
413962	242501	33188	2	0	0	14	10:40	12:10
413963	242501	33195	2	0	0	14	10:40	12:10
413964	242501	33202	2	0	0	14	10:40	12:10
413965	242501	33209	2	0	0	14	10:40	12:10
413966	242501	33216	2	0	0	14	10:40	12:10
413967	242501	33223	2	0	0	14	10:40	12:10
413968	242501	33230	2	0	0	14	10:40	12:10
413969	242501	33237	2	0	0	14	10:40	12:10
413970	242501	33139	5	0	1	19	16:20	17:50
413971	242501	33153	5	0	1	19	16:20	17:50
413972	242501	33167	5	0	1	19	16:20	17:50
413973	242501	33181	5	0	1	19	16:20	17:50
413974	242501	33195	5	0	1	19	16:20	17:50
413975	242501	33209	5	0	1	19	16:20	17:50
413976	242501	33223	5	0	1	19	16:20	17:50
413977	242501	33237	5	0	1	19	16:20	17:50
413978	242501	33133	4	0	1	21	14:20	15:50
413979	242501	33147	4	0	1	21	14:20	15:50
413980	242501	33161	4	0	1	21	14:20	15:50
413981	242501	33175	4	0	1	21	14:20	15:50
413982	242501	33189	4	0	1	21	14:20	15:50
413983	242501	33203	4	0	1	21	14:20	15:50
413984	242501	33217	4	0	1	21	14:20	15:50
413985	242501	33231	4	0	1	21	14:20	15:50
413986	242501	33133	5	0	0	21	16:20	17:50
413987	242501	33147	5	0	0	21	16:20	17:50
413988	242501	33161	5	0	0	21	16:20	17:50
413989	242501	33175	5	0	0	21	16:20	17:50
413990	242501	33189	5	0	0	21	16:20	17:50
413991	242501	33203	5	0	0	21	16:20	17:50
413992	242501	33217	5	0	0	21	16:20	17:50
413993	242501	33231	5	0	0	21	16:20	17:50
413994	242501	33134	2	0	0	23	10:40	12:10
413995	242501	33141	2	0	0	23	10:40	12:10
413996	242501	33148	2	0	0	23	10:40	12:10
413997	242501	33155	2	0	0	23	10:40	12:10
413998	242501	33162	2	0	0	23	10:40	12:10
413999	242501	33169	2	0	0	23	10:40	12:10
414000	242501	33176	2	0	0	23	10:40	12:10
414001	242501	33183	2	0	0	23	10:40	12:10
414002	242501	33190	2	0	0	23	10:40	12:10
414003	242501	33197	2	0	0	23	10:40	12:10
414004	242501	33204	2	0	0	23	10:40	12:10
414005	242501	33211	2	0	0	23	10:40	12:10
414006	242501	33218	2	0	0	23	10:40	12:10
414007	242501	33225	2	0	0	23	10:40	12:10
414008	242501	33232	2	0	0	23	10:40	12:10
414009	242501	33239	2	0	0	23	10:40	12:10
414010	242501	33134	4	0	0	22	14:20	15:50
414011	242501	33141	4	0	0	22	14:20	15:50
414012	242501	33148	4	0	0	22	14:20	15:50
414013	242501	33155	4	0	0	22	14:20	15:50
414014	242501	33162	4	0	0	22	14:20	15:50
414015	242501	33169	4	0	0	22	14:20	15:50
414016	242501	33176	4	0	0	22	14:20	15:50
414017	242501	33183	4	0	0	22	14:20	15:50
414018	242501	33190	4	0	0	22	14:20	15:50
414019	242501	33197	4	0	0	22	14:20	15:50
414020	242501	33204	4	0	0	22	14:20	15:50
414021	242501	33211	4	0	0	22	14:20	15:50
414022	242501	33218	4	0	0	22	14:20	15:50
414023	242501	33225	4	0	0	22	14:20	15:50
414024	242501	33232	4	0	0	22	14:20	15:50
414025	242501	33239	4	0	0	22	14:20	15:50
414026	242501	33134	5	0	0	17	16:20	17:50
414027	242501	33148	5	0	0	17	16:20	17:50
414028	242501	33162	5	0	0	17	16:20	17:50
414029	242501	33176	5	0	0	17	16:20	17:50
414030	242501	33190	5	0	0	17	16:20	17:50
414031	242501	33204	5	0	0	17	16:20	17:50
414032	242501	33218	5	0	0	17	16:20	17:50
414033	242501	33232	5	0	0	17	16:20	17:50
414034	242501	33130	1	0	0	24	09:00	10:30
414035	242501	33137	1	0	0	24	09:00	10:30
414036	242501	33144	1	0	0	24	09:00	10:30
414037	242501	33151	1	0	0	24	09:00	10:30
414038	242501	33158	1	0	0	24	09:00	10:30
414039	242501	33165	1	0	0	24	09:00	10:30
414040	242501	33172	1	0	0	24	09:00	10:30
414041	242501	33179	1	0	0	24	09:00	10:30
414042	242501	33186	1	0	0	24	09:00	10:30
414043	242501	33193	1	0	0	24	09:00	10:30
414044	242501	33200	1	0	0	24	09:00	10:30
414045	242501	33207	1	0	0	24	09:00	10:30
414046	242501	33214	1	0	0	24	09:00	10:30
414047	242501	33221	1	0	0	24	09:00	10:30
414048	242501	33228	1	0	0	24	09:00	10:30
414049	242501	33235	1	0	0	24	09:00	10:30
414050	242501	33130	2	0	0	24	10:40	12:10
414051	242501	33137	2	0	0	24	10:40	12:10
414052	242501	33144	2	0	0	24	10:40	12:10
414053	242501	33151	2	0	0	24	10:40	12:10
414054	242501	33158	2	0	0	24	10:40	12:10
414055	242501	33165	2	0	0	24	10:40	12:10
414056	242501	33172	2	0	0	24	10:40	12:10
414057	242501	33179	2	0	0	24	10:40	12:10
414058	242501	33186	2	0	0	24	10:40	12:10
414059	242501	33193	2	0	0	24	10:40	12:10
414060	242501	33200	2	0	0	24	10:40	12:10
414061	242501	33207	2	0	0	24	10:40	12:10
414062	242501	33214	2	0	0	24	10:40	12:10
414063	242501	33221	2	0	0	24	10:40	12:10
414064	242501	33228	2	0	0	24	10:40	12:10
414065	242501	33235	2	0	0	24	10:40	12:10
414066	242501	33130	3	0	0	24	12:40	14:10
414067	242501	33137	3	0	0	24	12:40	14:10
414068	242501	33144	3	0	0	24	12:40	14:10
414069	242501	33151	3	0	0	24	12:40	14:10
414070	242501	33158	3	0	0	24	12:40	14:10
414071	242501	33165	3	0	0	24	12:40	14:10
414072	242501	33172	3	0	0	24	12:40	14:10
414073	242501	33179	3	0	0	24	12:40	14:10
414074	242501	33186	3	0	0	24	12:40	14:10
414075	242501	33193	3	0	0	24	12:40	14:10
414076	242501	33200	3	0	0	24	12:40	14:10
414077	242501	33207	3	0	0	24	12:40	14:10
414078	242501	33214	3	0	0	24	12:40	14:10
414079	242501	33221	3	0	0	24	12:40	14:10
414080	242501	33228	3	0	0	24	12:40	14:10
414081	242501	33235	3	0	0	24	12:40	14:10
414082	242501	33130	4	0	0	24	14:20	15:50
414083	242501	33137	4	0	0	24	14:20	15:50
414084	242501	33144	4	0	0	24	14:20	15:50
414085	242501	33151	4	0	0	24	14:20	15:50
414086	242501	33158	4	0	0	24	14:20	15:50
414087	242501	33165	4	0	0	24	14:20	15:50
414088	242501	33172	4	0	0	24	14:20	15:50
414089	242501	33179	4	0	0	24	14:20	15:50
414090	242501	33186	4	0	0	24	14:20	15:50
414091	242501	33193	4	0	0	24	14:20	15:50
414092	242501	33200	4	0	0	24	14:20	15:50
414093	242501	33207	4	0	0	24	14:20	15:50
414094	242501	33214	4	0	0	24	14:20	15:50
414095	242501	33221	4	0	0	24	14:20	15:50
414096	242501	33228	4	0	0	24	14:20	15:50
414097	242501	33235	4	0	0	24	14:20	15:50
414098	242501	33138	2	0	0	25	10:40	12:10
414099	242501	33152	2	0	0	25	10:40	12:10
414100	242501	33166	2	0	0	25	10:40	12:10
414101	242501	33180	2	0	0	25	10:40	12:10
414102	242501	33194	2	0	0	25	10:40	12:10
414103	242501	33208	2	0	0	25	10:40	12:10
414104	242501	33222	2	0	0	25	10:40	12:10
414105	242501	33236	2	0	0	25	10:40	12:10
414106	242501	33131	3	0	1	26	12:40	14:10
414107	242501	33145	3	0	1	26	12:40	14:10
414108	242501	33159	3	0	1	26	12:40	14:10
414109	242501	33173	3	0	1	26	12:40	14:10
414110	242501	33187	3	0	1	26	12:40	14:10
414111	242501	33201	3	0	1	26	12:40	14:10
414112	242501	33215	3	0	1	26	12:40	14:10
414113	242501	33229	3	0	1	26	12:40	14:10
414114	242501	33138	3	0	0	25	12:40	14:10
414115	242501	33152	3	0	0	25	12:40	14:10
414116	242501	33166	3	0	0	25	12:40	14:10
414117	242501	33180	3	0	0	25	12:40	14:10
414118	242501	33194	3	0	0	25	12:40	14:10
414119	242501	33208	3	0	0	25	12:40	14:10
414120	242501	33222	3	0	0	25	12:40	14:10
414121	242501	33236	3	0	0	25	12:40	14:10
414122	242501	33131	4	0	0	27	14:20	15:50
414123	242501	33145	4	0	0	27	14:20	15:50
414124	242501	33159	4	0	0	27	14:20	15:50
414125	242501	33173	4	0	0	27	14:20	15:50
414126	242501	33187	4	0	0	27	14:20	15:50
414127	242501	33201	4	0	0	27	14:20	15:50
414128	242501	33215	4	0	0	27	14:20	15:50
414129	242501	33229	4	0	0	27	14:20	15:50
414130	242501	33131	5	0	0	28	16:20	17:50
414131	242501	33145	5	0	0	28	16:20	17:50
414132	242501	33159	5	0	0	28	16:20	17:50
414133	242501	33173	5	0	0	28	16:20	17:50
414134	242501	33187	5	0	0	28	16:20	17:50
414135	242501	33201	5	0	0	28	16:20	17:50
414136	242501	33215	5	0	0	28	16:20	17:50
414137	242501	33229	5	0	0	28	16:20	17:50
414138	242501	33138	5	0	1	26	16:20	17:50
414139	242501	33152	5	0	1	26	16:20	17:50
414140	242501	33166	5	0	1	26	16:20	17:50
414141	242501	33180	5	0	1	26	16:20	17:50
414142	242501	33194	5	0	1	26	16:20	17:50
414143	242501	33208	5	0	1	26	16:20	17:50
414144	242501	33222	5	0	1	26	16:20	17:50
414145	242501	33236	5	0	1	26	16:20	17:50
414146	242501	33131	6	0	0	25	18:00	19:30
414147	242501	33145	6	0	0	25	18:00	19:30
414148	242501	33159	6	0	0	25	18:00	19:30
414149	242501	33173	6	0	0	25	18:00	19:30
414150	242501	33187	6	0	0	25	18:00	19:30
414151	242501	33201	6	0	0	25	18:00	19:30
414152	242501	33215	6	0	0	25	18:00	19:30
414153	242501	33229	6	0	0	25	18:00	19:30
414154	242501	33138	6	0	1	26	18:00	19:30
414155	242501	33152	6	0	1	26	18:00	19:30
414156	242501	33166	6	0	1	26	18:00	19:30
414157	242501	33180	6	0	1	26	18:00	19:30
414158	242501	33194	6	0	1	26	18:00	19:30
414159	242501	33208	6	0	1	26	18:00	19:30
414160	242501	33222	6	0	1	26	18:00	19:30
414161	242501	33236	6	0	1	26	18:00	19:30
414162	242501	33132	1	0	0	29	09:00	10:30
414163	242501	33139	1	0	0	29	09:00	10:30
414164	242501	33146	1	0	0	29	09:00	10:30
414165	242501	33153	1	0	0	29	09:00	10:30
414166	242501	33160	1	0	0	29	09:00	10:30
414167	242501	33167	1	0	0	29	09:00	10:30
414168	242501	33174	1	0	0	29	09:00	10:30
414169	242501	33181	1	0	0	29	09:00	10:30
414170	242501	33188	1	0	0	29	09:00	10:30
414171	242501	33195	1	0	0	29	09:00	10:30
414172	242501	33202	1	0	0	29	09:00	10:30
414173	242501	33209	1	0	0	29	09:00	10:30
414174	242501	33216	1	0	0	29	09:00	10:30
414175	242501	33223	1	0	0	29	09:00	10:30
414176	242501	33230	1	0	0	29	09:00	10:30
414177	242501	33237	1	0	0	29	09:00	10:30
414178	242501	33132	2	0	0	29	10:40	12:10
414179	242501	33139	2	0	0	29	10:40	12:10
414180	242501	33146	2	0	0	29	10:40	12:10
414181	242501	33153	2	0	0	29	10:40	12:10
414182	242501	33160	2	0	0	29	10:40	12:10
414183	242501	33167	2	0	0	29	10:40	12:10
414184	242501	33174	2	0	0	29	10:40	12:10
414185	242501	33181	2	0	0	29	10:40	12:10
414186	242501	33188	2	0	0	29	10:40	12:10
414187	242501	33195	2	0	0	29	10:40	12:10
414188	242501	33202	2	0	0	29	10:40	12:10
414189	242501	33209	2	0	0	29	10:40	12:10
414190	242501	33216	2	0	0	29	10:40	12:10
414191	242501	33223	2	0	0	29	10:40	12:10
414192	242501	33230	2	0	0	29	10:40	12:10
414193	242501	33237	2	0	0	29	10:40	12:10
414194	242501	33132	3	0	0	30	12:40	14:10
414195	242501	33139	3	0	0	30	12:40	14:10
414196	242501	33146	3	0	0	30	12:40	14:10
414197	242501	33153	3	0	0	30	12:40	14:10
414198	242501	33160	3	0	0	30	12:40	14:10
414199	242501	33167	3	0	0	30	12:40	14:10
414200	242501	33174	3	0	0	30	12:40	14:10
414201	242501	33181	3	0	0	30	12:40	14:10
414202	242501	33188	3	0	0	30	12:40	14:10
414203	242501	33195	3	0	0	30	12:40	14:10
414204	242501	33202	3	0	0	30	12:40	14:10
414205	242501	33209	3	0	0	30	12:40	14:10
414206	242501	33216	3	0	0	30	12:40	14:10
414207	242501	33223	3	0	0	30	12:40	14:10
414208	242501	33230	3	0	0	30	12:40	14:10
414209	242501	33237	3	0	0	30	12:40	14:10
414210	242501	33132	4	0	0	26	14:20	15:50
414211	242501	33139	4	0	0	26	14:20	15:50
414212	242501	33146	4	0	0	26	14:20	15:50
414213	242501	33153	4	0	0	26	14:20	15:50
414214	242501	33160	4	0	0	26	14:20	15:50
414215	242501	33167	4	0	0	26	14:20	15:50
414216	242501	33174	4	0	0	26	14:20	15:50
414217	242501	33181	4	0	0	26	14:20	15:50
414218	242501	33188	4	0	0	26	14:20	15:50
414219	242501	33195	4	0	0	26	14:20	15:50
414220	242501	33202	4	0	0	26	14:20	15:50
414221	242501	33209	4	0	0	26	14:20	15:50
414222	242501	33216	4	0	0	26	14:20	15:50
414223	242501	33223	4	0	0	26	14:20	15:50
414224	242501	33230	4	0	0	26	14:20	15:50
414225	242501	33237	4	0	0	26	14:20	15:50
414226	242501	33132	5	0	0	31	16:20	17:50
414227	242501	33139	5	0	0	31	16:20	17:50
414228	242501	33146	5	0	0	31	16:20	17:50
414229	242501	33153	5	0	0	31	16:20	17:50
414230	242501	33160	5	0	0	31	16:20	17:50
414231	242501	33167	5	0	0	31	16:20	17:50
414232	242501	33174	5	0	0	31	16:20	17:50
414233	242501	33181	5	0	0	31	16:20	17:50
414234	242501	33188	5	0	0	31	16:20	17:50
414235	242501	33195	5	0	0	31	16:20	17:50
414236	242501	33202	5	0	0	31	16:20	17:50
414237	242501	33209	5	0	0	31	16:20	17:50
414238	242501	33216	5	0	0	31	16:20	17:50
414239	242501	33223	5	0	0	31	16:20	17:50
414240	242501	33230	5	0	0	31	16:20	17:50
414241	242501	33237	5	0	0	31	16:20	17:50
414242	242501	33133	1	0	0	32	09:00	10:30
414243	242501	33147	1	0	0	32	09:00	10:30
414244	242501	33161	1	0	0	32	09:00	10:30
414245	242501	33175	1	0	0	32	09:00	10:30
414246	242501	33189	1	0	0	32	09:00	10:30
414247	242501	33203	1	0	0	32	09:00	10:30
414248	242501	33217	1	0	0	32	09:00	10:30
414249	242501	33231	1	0	0	32	09:00	10:30
414250	242501	33133	2	0	0	32	10:40	12:10
414251	242501	33147	2	0	0	32	10:40	12:10
414252	242501	33161	2	0	0	32	10:40	12:10
414253	242501	33175	2	0	0	32	10:40	12:10
414254	242501	33189	2	0	0	32	10:40	12:10
414255	242501	33203	2	0	0	32	10:40	12:10
414256	242501	33217	2	0	0	32	10:40	12:10
414257	242501	33231	2	0	0	32	10:40	12:10
414258	242501	33133	3	0	0	32	12:40	13:00
414259	242501	33147	3	0	0	32	12:40	13:00
414260	242501	33161	3	0	0	32	12:40	13:00
414261	242501	33175	3	0	0	32	12:40	13:00
414262	242501	33189	3	0	0	32	12:40	13:00
414263	242501	33203	3	0	0	32	12:40	13:00
414264	242501	33217	3	0	0	32	12:40	13:00
414265	242501	33231	3	0	0	32	12:40	13:00
414266	242501	33140	1	0	0	32	09:00	10:30
414267	242501	33154	1	0	0	32	09:00	10:30
414268	242501	33168	1	0	0	32	09:00	10:30
414269	242501	33182	1	0	0	32	09:00	10:30
414270	242501	33196	1	0	0	32	09:00	10:30
414271	242501	33210	1	0	0	32	09:00	10:30
414272	242501	33224	1	0	0	32	09:00	10:30
414273	242501	33238	1	0	0	32	09:00	10:30
414274	242501	33140	2	0	0	32	10:40	12:10
414275	242501	33154	2	0	0	32	10:40	12:10
414276	242501	33168	2	0	0	32	10:40	12:10
414277	242501	33182	2	0	0	32	10:40	12:10
414278	242501	33196	2	0	0	32	10:40	12:10
414279	242501	33210	2	0	0	32	10:40	12:10
414280	242501	33224	2	0	0	32	10:40	12:10
414281	242501	33238	2	0	0	32	10:40	12:10
414282	242501	33140	3	0	0	32	12:40	14:10
414283	242501	33154	3	0	0	32	12:40	14:10
414284	242501	33168	3	0	0	32	12:40	14:10
414285	242501	33182	3	0	0	32	12:40	14:10
414286	242501	33196	3	0	0	32	12:40	14:10
414287	242501	33210	3	0	0	32	12:40	14:10
414288	242501	33224	3	0	0	32	12:40	14:10
414289	242501	33238	3	0	0	32	12:40	14:10
414290	242501	33140	4	0	0	32	14:20	15:50
414291	242501	33154	4	0	0	32	14:20	15:50
414292	242501	33168	4	0	0	32	14:20	15:50
414293	242501	33182	4	0	0	32	14:20	15:50
414294	242501	33196	4	0	0	32	14:20	15:50
414295	242501	33210	4	0	0	32	14:20	15:50
414296	242501	33224	4	0	0	32	14:20	15:50
414297	242501	33238	4	0	0	32	14:20	15:50
414298	242501	33140	5	0	0	32	16:20	17:00
414299	242501	33154	5	0	0	32	16:20	17:00
414300	242501	33168	5	0	0	32	16:20	17:00
414301	242501	33182	5	0	0	32	16:20	17:00
414302	242501	33196	5	0	0	32	16:20	17:00
414303	242501	33210	5	0	0	32	16:20	17:00
414304	242501	33224	5	0	0	32	16:20	17:00
414305	242501	33238	5	0	0	32	16:20	17:00
414306	242501	33133	4	0	1	33	14:20	15:50
414307	242501	33147	4	0	1	33	14:20	15:50
414308	242501	33161	4	0	1	33	14:20	15:50
414309	242501	33175	4	0	1	33	14:20	15:50
414310	242501	33189	4	0	1	33	14:20	15:50
414311	242501	33203	4	0	1	33	14:20	15:50
414312	242501	33217	4	0	1	33	14:20	15:50
414313	242501	33231	4	0	1	33	14:20	15:50
414314	242501	33134	1	0	1	34	09:00	10:30
414315	242501	33141	1	0	1	34	09:00	10:30
414316	242501	33148	1	0	1	34	09:00	10:30
414317	242501	33155	1	0	1	34	09:00	10:30
414318	242501	33162	1	0	1	34	09:00	10:30
414319	242501	33169	1	0	1	34	09:00	10:30
414320	242501	33176	1	0	1	34	09:00	10:30
414321	242501	33183	1	0	1	34	09:00	10:30
414322	242501	33190	1	0	1	34	09:00	10:30
414323	242501	33197	1	0	1	34	09:00	10:30
414324	242501	33204	1	0	1	34	09:00	10:30
414325	242501	33211	1	0	1	34	09:00	10:30
414326	242501	33218	1	0	1	34	09:00	10:30
414327	242501	33225	1	0	1	34	09:00	10:30
414328	242501	33232	1	0	1	34	09:00	10:30
414329	242501	33239	1	0	1	34	09:00	10:30
414330	242501	33134	2	0	1	35	10:40	12:10
414331	242501	33141	2	0	1	35	10:40	12:10
414332	242501	33148	2	0	1	35	10:40	12:10
414333	242501	33155	2	0	1	35	10:40	12:10
414334	242501	33162	2	0	1	35	10:40	12:10
414335	242501	33169	2	0	1	35	10:40	12:10
414336	242501	33176	2	0	1	35	10:40	12:10
414337	242501	33183	2	0	1	35	10:40	12:10
414338	242501	33190	2	0	1	35	10:40	12:10
414339	242501	33197	2	0	1	35	10:40	12:10
414340	242501	33204	2	0	1	35	10:40	12:10
414341	242501	33211	2	0	1	35	10:40	12:10
414342	242501	33218	2	0	1	35	10:40	12:10
414343	242501	33225	2	0	1	35	10:40	12:10
414344	242501	33232	2	0	1	35	10:40	12:10
414345	242501	33239	2	0	1	35	10:40	12:10
414346	242501	33134	3	0	0	35	12:40	14:10
414347	242501	33141	3	0	0	35	12:40	14:10
414348	242501	33148	3	0	0	35	12:40	14:10
414349	242501	33155	3	0	0	35	12:40	14:10
414350	242501	33162	3	0	0	35	12:40	14:10
414351	242501	33169	3	0	0	35	12:40	14:10
414352	242501	33176	3	0	0	35	12:40	14:10
414353	242501	33183	3	0	0	35	12:40	14:10
414354	242501	33190	3	0	0	35	12:40	14:10
414355	242501	33197	3	0	0	35	12:40	14:10
414356	242501	33204	3	0	0	35	12:40	14:10
414357	242501	33211	3	0	0	35	12:40	14:10
414358	242501	33218	3	0	0	35	12:40	14:10
414359	242501	33225	3	0	0	35	12:40	14:10
414360	242501	33232	3	0	0	35	12:40	14:10
414361	242501	33239	3	0	0	35	12:40	14:10
414362	242501	33134	4	0	0	34	14:20	15:50
414363	242501	33141	4	0	0	34	14:20	15:50
414364	242501	33148	4	0	0	34	14:20	15:50
414365	242501	33155	4	0	0	34	14:20	15:50
414366	242501	33162	4	0	0	34	14:20	15:50
414367	242501	33169	4	0	0	34	14:20	15:50
414368	242501	33176	4	0	0	34	14:20	15:50
414369	242501	33183	4	0	0	34	14:20	15:50
414370	242501	33190	4	0	0	34	14:20	15:50
414371	242501	33197	4	0	0	34	14:20	15:50
414372	242501	33204	4	0	0	34	14:20	15:50
414373	242501	33211	4	0	0	34	14:20	15:50
414374	242501	33218	4	0	0	34	14:20	15:50
414375	242501	33225	4	0	0	34	14:20	15:50
414376	242501	33232	4	0	0	34	14:20	15:50
414377	242501	33239	4	0	0	34	14:20	15:50
414378	242501	33134	5	0	0	33	16:20	17:50
414379	242501	33141	5	0	0	33	16:20	17:50
414380	242501	33148	5	0	0	33	16:20	17:50
414381	242501	33155	5	0	0	33	16:20	17:50
414382	242501	33162	5	0	0	33	16:20	17:50
414383	242501	33169	5	0	0	33	16:20	17:50
414384	242501	33176	5	0	0	33	16:20	17:50
414385	242501	33183	5	0	0	33	16:20	17:50
414386	242501	33190	5	0	0	33	16:20	17:50
414387	242501	33197	5	0	0	33	16:20	17:50
414388	242501	33204	5	0	0	33	16:20	17:50
414389	242501	33211	5	0	0	33	16:20	17:50
414390	242501	33218	5	0	0	33	16:20	17:50
414391	242501	33225	5	0	0	33	16:20	17:50
414392	242501	33232	5	0	0	33	16:20	17:50
414393	242501	33239	5	0	0	33	16:20	17:50
414394	242501	33135	1	0	1	27	09:00	10:30
414395	242501	33149	1	0	1	27	09:00	10:30
414396	242501	33163	1	0	1	27	09:00	10:30
414397	242501	33177	1	0	1	27	09:00	10:30
414398	242501	33191	1	0	1	27	09:00	10:30
414399	242501	33205	1	0	1	27	09:00	10:30
414400	242501	33219	1	0	1	27	09:00	10:30
414401	242501	33233	1	0	1	27	09:00	10:30
414402	242501	33142	1	0	1	27	09:00	10:30
414403	242501	33156	1	0	1	27	09:00	10:30
414404	242501	33170	1	0	1	27	09:00	10:30
414405	242501	33184	1	0	1	27	09:00	10:30
414406	242501	33198	1	0	1	27	09:00	10:30
414407	242501	33212	1	0	1	27	09:00	10:30
414408	242501	33226	1	0	1	27	09:00	10:30
414409	242501	33240	1	0	1	27	09:00	10:30
414410	242501	33130	1	0	0	36	09:00	10:30
414411	242501	33137	1	0	0	36	09:00	10:30
414412	242501	33144	1	0	0	36	09:00	10:30
414413	242501	33151	1	0	0	36	09:00	10:30
414414	242501	33158	1	0	0	36	09:00	10:30
414415	242501	33165	1	0	0	36	09:00	10:30
414416	242501	33172	1	0	0	36	09:00	10:30
414417	242501	33179	1	0	0	36	09:00	10:30
414418	242501	33186	1	0	0	36	09:00	10:30
414419	242501	33193	1	0	0	36	09:00	10:30
414420	242501	33200	1	0	0	36	09:00	10:30
414421	242501	33207	1	0	0	36	09:00	10:30
414422	242501	33214	1	0	0	36	09:00	10:30
414423	242501	33221	1	0	0	36	09:00	10:30
414424	242501	33228	1	0	0	36	09:00	10:30
414425	242501	33235	1	0	0	36	09:00	10:30
414426	242501	33130	2	0	0	36	10:40	12:10
414427	242501	33137	2	0	0	36	10:40	12:10
414428	242501	33144	2	0	0	36	10:40	12:10
414429	242501	33151	2	0	0	36	10:40	12:10
414430	242501	33158	2	0	0	36	10:40	12:10
414431	242501	33165	2	0	0	36	10:40	12:10
414432	242501	33172	2	0	0	36	10:40	12:10
414433	242501	33179	2	0	0	36	10:40	12:10
414434	242501	33186	2	0	0	36	10:40	12:10
414435	242501	33193	2	0	0	36	10:40	12:10
414436	242501	33200	2	0	0	36	10:40	12:10
414437	242501	33207	2	0	0	36	10:40	12:10
414438	242501	33214	2	0	0	36	10:40	12:10
414439	242501	33221	2	0	0	36	10:40	12:10
414440	242501	33228	2	0	0	36	10:40	12:10
414441	242501	33235	2	0	0	36	10:40	12:10
414442	242501	33130	3	0	0	36	12:40	14:10
414443	242501	33137	3	0	0	36	12:40	14:10
414444	242501	33144	3	0	0	36	12:40	14:10
414445	242501	33151	3	0	0	36	12:40	14:10
414446	242501	33158	3	0	0	36	12:40	14:10
414447	242501	33165	3	0	0	36	12:40	14:10
414448	242501	33172	3	0	0	36	12:40	14:10
414449	242501	33179	3	0	0	36	12:40	14:10
414450	242501	33186	3	0	0	36	12:40	14:10
414451	242501	33193	3	0	0	36	12:40	14:10
414452	242501	33200	3	0	0	36	12:40	14:10
414453	242501	33207	3	0	0	36	12:40	14:10
414454	242501	33214	3	0	0	36	12:40	14:10
414455	242501	33221	3	0	0	36	12:40	14:10
414456	242501	33228	3	0	0	36	12:40	14:10
414457	242501	33235	3	0	0	36	12:40	14:10
414458	242501	33130	4	0	0	36	14:20	15:50
414459	242501	33137	4	0	0	36	14:20	15:50
414460	242501	33144	4	0	0	36	14:20	15:50
414461	242501	33151	4	0	0	36	14:20	15:50
414462	242501	33158	4	0	0	36	14:20	15:50
414463	242501	33165	4	0	0	36	14:20	15:50
414464	242501	33172	4	0	0	36	14:20	15:50
414465	242501	33179	4	0	0	36	14:20	15:50
414466	242501	33186	4	0	0	36	14:20	15:50
414467	242501	33193	4	0	0	36	14:20	15:50
414468	242501	33200	4	0	0	36	14:20	15:50
414469	242501	33207	4	0	0	36	14:20	15:50
414470	242501	33214	4	0	0	36	14:20	15:50
414471	242501	33221	4	0	0	36	14:20	15:50
414472	242501	33228	4	0	0	36	14:20	15:50
414473	242501	33235	4	0	0	36	14:20	15:50
414474	242501	33138	4	0	0	27	14:20	15:50
414475	242501	33152	4	0	0	27	14:20	15:50
414476	242501	33166	4	0	0	27	14:20	15:50
414477	242501	33180	4	0	0	27	14:20	15:50
414478	242501	33194	4	0	0	27	14:20	15:50
414479	242501	33208	4	0	0	27	14:20	15:50
414480	242501	33222	4	0	0	27	14:20	15:50
414481	242501	33236	4	0	0	27	14:20	15:50
414482	242501	33132	4	0	0	26	14:20	15:50
414483	242501	33139	4	0	0	26	14:20	15:50
414484	242501	33146	4	0	0	26	14:20	15:50
414485	242501	33153	4	0	0	26	14:20	15:50
414486	242501	33160	4	0	0	26	14:20	15:50
414487	242501	33167	4	0	0	26	14:20	15:50
414488	242501	33174	4	0	0	26	14:20	15:50
414489	242501	33181	4	0	0	26	14:20	15:50
414490	242501	33188	4	0	0	26	14:20	15:50
414491	242501	33195	4	0	0	26	14:20	15:50
414492	242501	33202	4	0	0	26	14:20	15:50
414493	242501	33209	4	0	0	26	14:20	15:50
414494	242501	33216	4	0	0	26	14:20	15:50
414495	242501	33223	4	0	0	26	14:20	15:50
414496	242501	33230	4	0	0	26	14:20	15:50
414497	242501	33237	4	0	0	26	14:20	15:50
414498	242501	33133	1	0	0	32	09:00	10:30
414499	242501	33147	1	0	0	32	09:00	10:30
414500	242501	33161	1	0	0	32	09:00	10:30
414501	242501	33175	1	0	0	32	09:00	10:30
414502	242501	33189	1	0	0	32	09:00	10:30
414503	242501	33203	1	0	0	32	09:00	10:30
414504	242501	33217	1	0	0	32	09:00	10:30
414505	242501	33231	1	0	0	32	09:00	10:30
414506	242501	33133	2	0	0	32	10:40	12:10
414507	242501	33147	2	0	0	32	10:40	12:10
414508	242501	33161	2	0	0	32	10:40	12:10
414509	242501	33175	2	0	0	32	10:40	12:10
414510	242501	33189	2	0	0	32	10:40	12:10
414511	242501	33203	2	0	0	32	10:40	12:10
414512	242501	33217	2	0	0	32	10:40	12:10
414513	242501	33231	2	0	0	32	10:40	12:10
414514	242501	33133	3	0	0	32	12:40	13:00
414515	242501	33147	3	0	0	32	12:40	13:00
414516	242501	33161	3	0	0	32	12:40	13:00
414517	242501	33175	3	0	0	32	12:40	13:00
414518	242501	33189	3	0	0	32	12:40	13:00
414519	242501	33203	3	0	0	32	12:40	13:00
414520	242501	33217	3	0	0	32	12:40	13:00
414521	242501	33231	3	0	0	32	12:40	13:00
414522	242501	33140	1	0	0	32	09:00	10:30
414523	242501	33154	1	0	0	32	09:00	10:30
414524	242501	33168	1	0	0	32	09:00	10:30
414525	242501	33182	1	0	0	32	09:00	10:30
414526	242501	33196	1	0	0	32	09:00	10:30
414527	242501	33210	1	0	0	32	09:00	10:30
414528	242501	33224	1	0	0	32	09:00	10:30
414529	242501	33238	1	0	0	32	09:00	10:30
414530	242501	33140	2	0	0	32	10:40	12:10
414531	242501	33154	2	0	0	32	10:40	12:10
414532	242501	33168	2	0	0	32	10:40	12:10
414533	242501	33182	2	0	0	32	10:40	12:10
414534	242501	33196	2	0	0	32	10:40	12:10
414535	242501	33210	2	0	0	32	10:40	12:10
414536	242501	33224	2	0	0	32	10:40	12:10
414537	242501	33238	2	0	0	32	10:40	12:10
414538	242501	33140	3	0	0	32	12:40	14:10
414539	242501	33154	3	0	0	32	12:40	14:10
414540	242501	33168	3	0	0	32	12:40	14:10
414541	242501	33182	3	0	0	32	12:40	14:10
414542	242501	33196	3	0	0	32	12:40	14:10
414543	242501	33210	3	0	0	32	12:40	14:10
414544	242501	33224	3	0	0	32	12:40	14:10
414545	242501	33238	3	0	0	32	12:40	14:10
414546	242501	33140	4	0	0	32	14:20	15:50
414547	242501	33154	4	0	0	32	14:20	15:50
414548	242501	33168	4	0	0	32	14:20	15:50
414549	242501	33182	4	0	0	32	14:20	15:50
414550	242501	33196	4	0	0	32	14:20	15:50
414551	242501	33210	4	0	0	32	14:20	15:50
414552	242501	33224	4	0	0	32	14:20	15:50
414553	242501	33238	4	0	0	32	14:20	15:50
414554	242501	33140	5	0	0	32	16:20	17:00
414555	242501	33154	5	0	0	32	16:20	17:00
414556	242501	33168	5	0	0	32	16:20	17:00
414557	242501	33182	5	0	0	32	16:20	17:00
414558	242501	33196	5	0	0	32	16:20	17:00
414559	242501	33210	5	0	0	32	16:20	17:00
414560	242501	33224	5	0	0	32	16:20	17:00
414561	242501	33238	5	0	0	32	16:20	17:00
414562	242501	33134	3	0	0	34	12:40	14:10
414563	242501	33141	3	0	0	34	12:40	14:10
414564	242501	33148	3	0	0	34	12:40	14:10
414565	242501	33155	3	0	0	34	12:40	14:10
414566	242501	33162	3	0	0	34	12:40	14:10
414567	242501	33169	3	0	0	34	12:40	14:10
414568	242501	33176	3	0	0	34	12:40	14:10
414569	242501	33183	3	0	0	34	12:40	14:10
414570	242501	33190	3	0	0	34	12:40	14:10
414571	242501	33197	3	0	0	34	12:40	14:10
414572	242501	33204	3	0	0	34	12:40	14:10
414573	242501	33211	3	0	0	34	12:40	14:10
414574	242501	33218	3	0	0	34	12:40	14:10
414575	242501	33225	3	0	0	34	12:40	14:10
414576	242501	33232	3	0	0	34	12:40	14:10
414577	242501	33239	3	0	0	34	12:40	14:10
414578	242501	33134	4	0	0	33	14:20	15:50
414579	242501	33141	4	0	0	33	14:20	15:50
414580	242501	33148	4	0	0	33	14:20	15:50
414581	242501	33155	4	0	0	33	14:20	15:50
414582	242501	33162	4	0	0	33	14:20	15:50
414583	242501	33169	4	0	0	33	14:20	15:50
414584	242501	33176	4	0	0	33	14:20	15:50
414585	242501	33183	4	0	0	33	14:20	15:50
414586	242501	33190	4	0	0	33	14:20	15:50
414587	242501	33197	4	0	0	33	14:20	15:50
414588	242501	33204	4	0	0	33	14:20	15:50
414589	242501	33211	4	0	0	33	14:20	15:50
414590	242501	33218	4	0	0	33	14:20	15:50
414591	242501	33225	4	0	0	33	14:20	15:50
414592	242501	33232	4	0	0	33	14:20	15:50
414593	242501	33239	4	0	0	33	14:20	15:50
414594	242501	33134	5	0	0	35	16:20	17:50
414595	242501	33141	5	0	0	35	16:20	17:50
414596	242501	33148	5	0	0	35	16:20	17:50
414597	242501	33155	5	0	0	35	16:20	17:50
414598	242501	33162	5	0	0	35	16:20	17:50
414599	242501	33169	5	0	0	35	16:20	17:50
414600	242501	33176	5	0	0	35	16:20	17:50
414601	242501	33183	5	0	0	35	16:20	17:50
414602	242501	33190	5	0	0	35	16:20	17:50
414603	242501	33197	5	0	0	35	16:20	17:50
414604	242501	33204	5	0	0	35	16:20	17:50
414605	242501	33211	5	0	0	35	16:20	17:50
414606	242501	33218	5	0	0	35	16:20	17:50
414607	242501	33225	5	0	0	35	16:20	17:50
414608	242501	33232	5	0	0	35	16:20	17:50
414609	242501	33239	5	0	0	35	16:20	17:50
414610	242501	33158	3	0	0	37	12:40	14:10
414611	242501	33165	3	0	0	37	12:40	14:10
414612	242501	33172	3	0	0	37	12:40	14:10
414613	242501	33179	3	0	0	37	12:40	14:10
414614	242501	33130	5	0	0	38	16:20	17:50
414615	242501	33137	5	0	0	38	16:20	17:50
414616	242501	33144	5	0	0	38	16:20	17:50
414617	242501	33151	5	0	0	38	16:20	17:50
414618	242501	33158	5	0	0	38	16:20	17:50
414619	242501	33165	5	0	0	38	16:20	17:50
414620	242501	33172	5	0	0	38	16:20	17:50
414621	242501	33179	5	0	0	38	16:20	17:50
414622	242501	33186	5	0	0	38	16:20	17:50
414623	242501	33193	5	0	0	38	16:20	17:50
414624	242501	33200	5	0	0	38	16:20	17:50
414625	242501	33207	5	0	0	38	16:20	17:50
414626	242501	33214	5	0	0	38	16:20	17:50
414627	242501	33221	5	0	0	38	16:20	17:50
414628	242501	33228	5	0	0	38	16:20	17:50
414629	242501	33235	5	0	0	38	16:20	17:50
414630	242501	33130	6	0	0	38	18:00	19:30
414631	242501	33137	6	0	0	38	18:00	19:30
414632	242501	33144	6	0	0	38	18:00	19:30
414633	242501	33151	6	0	0	38	18:00	19:30
414634	242501	33158	6	0	0	38	18:00	19:30
414635	242501	33165	6	0	0	38	18:00	19:30
414636	242501	33172	6	0	0	38	18:00	19:30
414637	242501	33179	6	0	0	38	18:00	19:30
414638	242501	33186	6	0	0	38	18:00	19:30
414639	242501	33193	6	0	0	38	18:00	19:30
414640	242501	33200	6	0	0	38	18:00	19:30
414641	242501	33207	6	0	0	38	18:00	19:30
414642	242501	33214	6	0	0	38	18:00	19:30
414643	242501	33221	6	0	0	38	18:00	19:30
414644	242501	33228	6	0	0	38	18:00	19:30
414645	242501	33235	6	0	0	38	18:00	19:30
414646	242501	33131	1	0	0	24	09:00	10:30
414647	242501	33138	1	0	0	24	09:00	10:30
414648	242501	33145	1	0	0	24	09:00	10:30
414649	242501	33152	1	0	0	24	09:00	10:30
414650	242501	33159	1	0	0	24	09:00	10:30
414651	242501	33166	1	0	0	24	09:00	10:30
414652	242501	33173	1	0	0	24	09:00	10:30
414653	242501	33180	1	0	0	24	09:00	10:30
414654	242501	33187	1	0	0	24	09:00	10:30
414655	242501	33194	1	0	0	24	09:00	10:30
414656	242501	33201	1	0	0	24	09:00	10:30
414657	242501	33208	1	0	0	24	09:00	10:30
414658	242501	33215	1	0	0	24	09:00	10:30
414659	242501	33222	1	0	0	24	09:00	10:30
414660	242501	33229	1	0	0	24	09:00	10:30
414661	242501	33236	1	0	0	24	09:00	10:30
414662	242501	33131	2	0	0	24	10:40	12:10
414663	242501	33138	2	0	0	24	10:40	12:10
414664	242501	33145	2	0	0	24	10:40	12:10
414665	242501	33152	2	0	0	24	10:40	12:10
414666	242501	33159	2	0	0	24	10:40	12:10
414667	242501	33166	2	0	0	24	10:40	12:10
414668	242501	33173	2	0	0	24	10:40	12:10
414669	242501	33180	2	0	0	24	10:40	12:10
414670	242501	33187	2	0	0	24	10:40	12:10
414671	242501	33194	2	0	0	24	10:40	12:10
414672	242501	33201	2	0	0	24	10:40	12:10
414673	242501	33208	2	0	0	24	10:40	12:10
414674	242501	33215	2	0	0	24	10:40	12:10
414675	242501	33222	2	0	0	24	10:40	12:10
414676	242501	33229	2	0	0	24	10:40	12:10
414677	242501	33236	2	0	0	24	10:40	12:10
414678	242501	33131	3	0	0	24	12:40	14:10
414679	242501	33138	3	0	0	24	12:40	14:10
414680	242501	33145	3	0	0	24	12:40	14:10
414681	242501	33152	3	0	0	24	12:40	14:10
414682	242501	33159	3	0	0	24	12:40	14:10
414683	242501	33166	3	0	0	24	12:40	14:10
414684	242501	33173	3	0	0	24	12:40	14:10
414685	242501	33180	3	0	0	24	12:40	14:10
414686	242501	33187	3	0	0	24	12:40	14:10
414687	242501	33194	3	0	0	24	12:40	14:10
414688	242501	33201	3	0	0	24	12:40	14:10
414689	242501	33208	3	0	0	24	12:40	14:10
414690	242501	33215	3	0	0	24	12:40	14:10
414691	242501	33222	3	0	0	24	12:40	14:10
414692	242501	33229	3	0	0	24	12:40	14:10
414693	242501	33236	3	0	0	24	12:40	14:10
414694	242501	33131	4	0	0	24	14:20	15:50
414695	242501	33138	4	0	0	24	14:20	15:50
414696	242501	33145	4	0	0	24	14:20	15:50
414697	242501	33152	4	0	0	24	14:20	15:50
414698	242501	33159	4	0	0	24	14:20	15:50
414699	242501	33166	4	0	0	24	14:20	15:50
414700	242501	33173	4	0	0	24	14:20	15:50
414701	242501	33180	4	0	0	24	14:20	15:50
414702	242501	33187	4	0	0	24	14:20	15:50
414703	242501	33194	4	0	0	24	14:20	15:50
414704	242501	33201	4	0	0	24	14:20	15:50
414705	242501	33208	4	0	0	24	14:20	15:50
414706	242501	33215	4	0	0	24	14:20	15:50
414707	242501	33222	4	0	0	24	14:20	15:50
414708	242501	33229	4	0	0	24	14:20	15:50
414709	242501	33236	4	0	0	24	14:20	15:50
414710	242501	33132	3	0	0	29	12:40	14:10
414711	242501	33139	3	0	0	29	12:40	14:10
414712	242501	33146	3	0	0	29	12:40	14:10
414713	242501	33153	3	0	0	29	12:40	14:10
414714	242501	33160	3	0	0	29	12:40	14:10
414715	242501	33167	3	0	0	29	12:40	14:10
414716	242501	33174	3	0	0	29	12:40	14:10
414717	242501	33181	3	0	0	29	12:40	14:10
414718	242501	33188	3	0	0	29	12:40	14:10
414719	242501	33195	3	0	0	29	12:40	14:10
414720	242501	33202	3	0	0	29	12:40	14:10
414721	242501	33209	3	0	0	29	12:40	14:10
414722	242501	33216	3	0	0	29	12:40	14:10
414723	242501	33223	3	0	0	29	12:40	14:10
414724	242501	33230	3	0	0	29	12:40	14:10
414725	242501	33237	3	0	0	29	12:40	14:10
414726	242501	33132	4	0	0	29	14:20	15:50
414727	242501	33139	4	0	0	29	14:20	15:50
414728	242501	33146	4	0	0	29	14:20	15:50
414729	242501	33153	4	0	0	29	14:20	15:50
414730	242501	33160	4	0	0	29	14:20	15:50
414731	242501	33167	4	0	0	29	14:20	15:50
414732	242501	33174	4	0	0	29	14:20	15:50
414733	242501	33181	4	0	0	29	14:20	15:50
414734	242501	33188	4	0	0	29	14:20	15:50
414735	242501	33195	4	0	0	29	14:20	15:50
414736	242501	33202	4	0	0	29	14:20	15:50
414737	242501	33209	4	0	0	29	14:20	15:50
414738	242501	33216	4	0	0	29	14:20	15:50
414739	242501	33223	4	0	0	29	14:20	15:50
414740	242501	33230	4	0	0	29	14:20	15:50
414741	242501	33237	4	0	0	29	14:20	15:50
414742	242501	33132	5	0	0	30	16:20	17:50
414743	242501	33139	5	0	0	30	16:20	17:50
414744	242501	33146	5	0	0	30	16:20	17:50
414745	242501	33153	5	0	0	30	16:20	17:50
414746	242501	33160	5	0	0	30	16:20	17:50
414747	242501	33167	5	0	0	30	16:20	17:50
414748	242501	33174	5	0	0	30	16:20	17:50
414749	242501	33181	5	0	0	30	16:20	17:50
414750	242501	33188	5	0	0	30	16:20	17:50
414751	242501	33195	5	0	0	30	16:20	17:50
414752	242501	33202	5	0	0	30	16:20	17:50
414753	242501	33209	5	0	0	30	16:20	17:50
414754	242501	33216	5	0	0	30	16:20	17:50
414755	242501	33223	5	0	0	30	16:20	17:50
414756	242501	33230	5	0	0	30	16:20	17:50
414757	242501	33237	5	0	0	30	16:20	17:50
414758	242501	33134	1	0	0	32	09:00	10:30
414759	242501	33141	1	0	0	32	09:00	10:30
414760	242501	33148	1	0	0	32	09:00	10:30
414761	242501	33155	1	0	0	32	09:00	10:30
414762	242501	33162	1	0	0	32	09:00	10:30
414763	242501	33169	1	0	0	32	09:00	10:30
414764	242501	33176	1	0	0	32	09:00	10:30
414765	242501	33183	1	0	0	32	09:00	10:30
414766	242501	33190	1	0	0	32	09:00	10:30
414767	242501	33197	1	0	0	32	09:00	10:30
414768	242501	33204	1	0	0	32	09:00	10:30
414769	242501	33211	1	0	0	32	09:00	10:30
414770	242501	33218	1	0	0	32	09:00	10:30
414771	242501	33225	1	0	0	32	09:00	10:30
414772	242501	33232	1	0	0	32	09:00	10:30
414773	242501	33239	1	0	0	32	09:00	10:30
414774	242501	33134	2	0	0	32	10:40	12:10
414775	242501	33141	2	0	0	32	10:40	12:10
414776	242501	33148	2	0	0	32	10:40	12:10
414777	242501	33155	2	0	0	32	10:40	12:10
414778	242501	33162	2	0	0	32	10:40	12:10
414779	242501	33169	2	0	0	32	10:40	12:10
414780	242501	33176	2	0	0	32	10:40	12:10
414781	242501	33183	2	0	0	32	10:40	12:10
414782	242501	33190	2	0	0	32	10:40	12:10
414783	242501	33197	2	0	0	32	10:40	12:10
414784	242501	33204	2	0	0	32	10:40	12:10
414785	242501	33211	2	0	0	32	10:40	12:10
414786	242501	33218	2	0	0	32	10:40	12:10
414787	242501	33225	2	0	0	32	10:40	12:10
414788	242501	33232	2	0	0	32	10:40	12:10
414789	242501	33239	2	0	0	32	10:40	12:10
414790	242501	33134	3	0	0	32	12:40	14:10
414791	242501	33141	3	0	0	32	12:40	14:10
414792	242501	33148	3	0	0	32	12:40	14:10
414793	242501	33155	3	0	0	32	12:40	14:10
414794	242501	33162	3	0	0	32	12:40	14:10
414795	242501	33169	3	0	0	32	12:40	14:10
414796	242501	33176	3	0	0	32	12:40	14:10
414797	242501	33183	3	0	0	32	12:40	14:10
414798	242501	33190	3	0	0	32	12:40	14:10
414799	242501	33197	3	0	0	32	12:40	14:10
414800	242501	33204	3	0	0	32	12:40	14:10
414801	242501	33211	3	0	0	32	12:40	14:10
414802	242501	33218	3	0	0	32	12:40	14:10
414803	242501	33225	3	0	0	32	12:40	14:10
414804	242501	33232	3	0	0	32	12:40	14:10
414805	242501	33239	3	0	0	32	12:40	14:10
414806	242501	33134	4	0	0	32	14:20	15:50
414807	242501	33141	4	0	0	32	14:20	15:50
414808	242501	33148	4	0	0	32	14:20	15:50
414809	242501	33155	4	0	0	32	14:20	15:50
414810	242501	33162	4	0	0	32	14:20	15:50
414811	242501	33169	4	0	0	32	14:20	15:50
414812	242501	33176	4	0	0	32	14:20	15:50
414813	242501	33183	4	0	0	32	14:20	15:50
414814	242501	33190	4	0	0	32	14:20	15:50
414815	242501	33197	4	0	0	32	14:20	15:50
414816	242501	33204	4	0	0	32	14:20	15:50
414817	242501	33211	4	0	0	32	14:20	15:50
414818	242501	33218	4	0	0	32	14:20	15:50
414819	242501	33225	4	0	0	32	14:20	15:50
414820	242501	33232	4	0	0	32	14:20	15:50
414821	242501	33239	4	0	0	32	14:20	15:50
414822	242501	33134	5	0	0	32	16:20	17:50
414823	242501	33141	5	0	0	32	16:20	17:50
414824	242501	33148	5	0	0	32	16:20	17:50
414825	242501	33155	5	0	0	32	16:20	17:50
414826	242501	33162	5	0	0	32	16:20	17:50
414827	242501	33169	5	0	0	32	16:20	17:50
414828	242501	33176	5	0	0	32	16:20	17:50
414829	242501	33183	5	0	0	32	16:20	17:50
414830	242501	33190	5	0	0	32	16:20	17:50
414831	242501	33197	5	0	0	32	16:20	17:50
414832	242501	33204	5	0	0	32	16:20	17:50
414833	242501	33211	5	0	0	32	16:20	17:50
414834	242501	33218	5	0	0	32	16:20	17:50
414835	242501	33225	5	0	0	32	16:20	17:50
414836	242501	33232	5	0	0	32	16:20	17:50
414837	242501	33239	5	0	0	32	16:20	17:50
414838	242501	33131	1	0	0	24	09:00	10:30
414839	242501	33138	1	0	0	24	09:00	10:30
414840	242501	33145	1	0	0	24	09:00	10:30
414841	242501	33152	1	0	0	24	09:00	10:30
414842	242501	33159	1	0	0	24	09:00	10:30
414843	242501	33166	1	0	0	24	09:00	10:30
414844	242501	33173	1	0	0	24	09:00	10:30
414845	242501	33180	1	0	0	24	09:00	10:30
414846	242501	33187	1	0	0	24	09:00	10:30
414847	242501	33194	1	0	0	24	09:00	10:30
414848	242501	33201	1	0	0	24	09:00	10:30
414849	242501	33208	1	0	0	24	09:00	10:30
414850	242501	33215	1	0	0	24	09:00	10:30
414851	242501	33222	1	0	0	24	09:00	10:30
414852	242501	33229	1	0	0	24	09:00	10:30
414853	242501	33236	1	0	0	24	09:00	10:30
414854	242501	33131	2	0	0	24	10:40	12:10
414855	242501	33138	2	0	0	24	10:40	12:10
414856	242501	33145	2	0	0	24	10:40	12:10
414857	242501	33152	2	0	0	24	10:40	12:10
414858	242501	33159	2	0	0	24	10:40	12:10
414859	242501	33166	2	0	0	24	10:40	12:10
414860	242501	33173	2	0	0	24	10:40	12:10
414861	242501	33180	2	0	0	24	10:40	12:10
414862	242501	33187	2	0	0	24	10:40	12:10
414863	242501	33194	2	0	0	24	10:40	12:10
414864	242501	33201	2	0	0	24	10:40	12:10
414865	242501	33208	2	0	0	24	10:40	12:10
414866	242501	33215	2	0	0	24	10:40	12:10
414867	242501	33222	2	0	0	24	10:40	12:10
414868	242501	33229	2	0	0	24	10:40	12:10
414869	242501	33236	2	0	0	24	10:40	12:10
414870	242501	33131	3	0	0	24	12:40	14:10
414871	242501	33138	3	0	0	24	12:40	14:10
414872	242501	33145	3	0	0	24	12:40	14:10
414873	242501	33152	3	0	0	24	12:40	14:10
414874	242501	33159	3	0	0	24	12:40	14:10
414875	242501	33166	3	0	0	24	12:40	14:10
414876	242501	33173	3	0	0	24	12:40	14:10
414877	242501	33180	3	0	0	24	12:40	14:10
414878	242501	33187	3	0	0	24	12:40	14:10
414879	242501	33194	3	0	0	24	12:40	14:10
414880	242501	33201	3	0	0	24	12:40	14:10
414881	242501	33208	3	0	0	24	12:40	14:10
414882	242501	33215	3	0	0	24	12:40	14:10
414883	242501	33222	3	0	0	24	12:40	14:10
414884	242501	33229	3	0	0	24	12:40	14:10
414885	242501	33236	3	0	0	24	12:40	14:10
414886	242501	33131	4	0	0	24	14:20	15:50
414887	242501	33138	4	0	0	24	14:20	15:50
414888	242501	33145	4	0	0	24	14:20	15:50
414889	242501	33152	4	0	0	24	14:20	15:50
414890	242501	33159	4	0	0	24	14:20	15:50
414891	242501	33166	4	0	0	24	14:20	15:50
414892	242501	33173	4	0	0	24	14:20	15:50
414893	242501	33180	4	0	0	24	14:20	15:50
414894	242501	33187	4	0	0	24	14:20	15:50
414895	242501	33194	4	0	0	24	14:20	15:50
414896	242501	33201	4	0	0	24	14:20	15:50
414897	242501	33208	4	0	0	24	14:20	15:50
414898	242501	33215	4	0	0	24	14:20	15:50
414899	242501	33222	4	0	0	24	14:20	15:50
414900	242501	33229	4	0	0	24	14:20	15:50
414901	242501	33236	4	0	0	24	14:20	15:50
414902	242501	33134	1	0	0	32	09:00	10:30
414903	242501	33141	1	0	0	32	09:00	10:30
414904	242501	33148	1	0	0	32	09:00	10:30
414905	242501	33155	1	0	0	32	09:00	10:30
414906	242501	33162	1	0	0	32	09:00	10:30
414907	242501	33169	1	0	0	32	09:00	10:30
414908	242501	33176	1	0	0	32	09:00	10:30
414909	242501	33183	1	0	0	32	09:00	10:30
414910	242501	33190	1	0	0	32	09:00	10:30
414911	242501	33197	1	0	0	32	09:00	10:30
414912	242501	33204	1	0	0	32	09:00	10:30
414913	242501	33211	1	0	0	32	09:00	10:30
414914	242501	33218	1	0	0	32	09:00	10:30
414915	242501	33225	1	0	0	32	09:00	10:30
414916	242501	33232	1	0	0	32	09:00	10:30
414917	242501	33239	1	0	0	32	09:00	10:30
414918	242501	33134	2	0	0	32	10:40	12:10
414919	242501	33141	2	0	0	32	10:40	12:10
414920	242501	33148	2	0	0	32	10:40	12:10
414921	242501	33155	2	0	0	32	10:40	12:10
414922	242501	33162	2	0	0	32	10:40	12:10
414923	242501	33169	2	0	0	32	10:40	12:10
414924	242501	33176	2	0	0	32	10:40	12:10
414925	242501	33183	2	0	0	32	10:40	12:10
414926	242501	33190	2	0	0	32	10:40	12:10
414927	242501	33197	2	0	0	32	10:40	12:10
414928	242501	33204	2	0	0	32	10:40	12:10
414929	242501	33211	2	0	0	32	10:40	12:10
414930	242501	33218	2	0	0	32	10:40	12:10
414931	242501	33225	2	0	0	32	10:40	12:10
414932	242501	33232	2	0	0	32	10:40	12:10
414933	242501	33239	2	0	0	32	10:40	12:10
414934	242501	33134	3	0	0	32	12:40	14:10
414935	242501	33141	3	0	0	32	12:40	14:10
414936	242501	33148	3	0	0	32	12:40	14:10
414937	242501	33155	3	0	0	32	12:40	14:10
414938	242501	33162	3	0	0	32	12:40	14:10
414939	242501	33169	3	0	0	32	12:40	14:10
414940	242501	33176	3	0	0	32	12:40	14:10
414941	242501	33183	3	0	0	32	12:40	14:10
414942	242501	33190	3	0	0	32	12:40	14:10
414943	242501	33197	3	0	0	32	12:40	14:10
414944	242501	33204	3	0	0	32	12:40	14:10
414945	242501	33211	3	0	0	32	12:40	14:10
414946	242501	33218	3	0	0	32	12:40	14:10
414947	242501	33225	3	0	0	32	12:40	14:10
414948	242501	33232	3	0	0	32	12:40	14:10
414949	242501	33239	3	0	0	32	12:40	14:10
414950	242501	33134	4	0	0	32	14:20	15:50
414951	242501	33141	4	0	0	32	14:20	15:50
414952	242501	33148	4	0	0	32	14:20	15:50
414953	242501	33155	4	0	0	32	14:20	15:50
414954	242501	33162	4	0	0	32	14:20	15:50
414955	242501	33169	4	0	0	32	14:20	15:50
414956	242501	33176	4	0	0	32	14:20	15:50
414957	242501	33183	4	0	0	32	14:20	15:50
414958	242501	33190	4	0	0	32	14:20	15:50
414959	242501	33197	4	0	0	32	14:20	15:50
414960	242501	33204	4	0	0	32	14:20	15:50
414961	242501	33211	4	0	0	32	14:20	15:50
414962	242501	33218	4	0	0	32	14:20	15:50
414963	242501	33225	4	0	0	32	14:20	15:50
414964	242501	33232	4	0	0	32	14:20	15:50
414965	242501	33239	4	0	0	32	14:20	15:50
414966	242501	33134	5	0	0	32	16:20	17:50
414967	242501	33141	5	0	0	32	16:20	17:50
414968	242501	33148	5	0	0	32	16:20	17:50
414969	242501	33155	5	0	0	32	16:20	17:50
414970	242501	33162	5	0	0	32	16:20	17:50
414971	242501	33169	5	0	0	32	16:20	17:50
414972	242501	33176	5	0	0	32	16:20	17:50
414973	242501	33183	5	0	0	32	16:20	17:50
414974	242501	33190	5	0	0	32	16:20	17:50
414975	242501	33197	5	0	0	32	16:20	17:50
414976	242501	33204	5	0	0	32	16:20	17:50
414977	242501	33211	5	0	0	32	16:20	17:50
414978	242501	33218	5	0	0	32	16:20	17:50
414979	242501	33225	5	0	0	32	16:20	17:50
414980	242501	33232	5	0	0	32	16:20	17:50
414981	242501	33239	5	0	0	32	16:20	17:50
414982	242501	33137	1	0	0	32	09:00	10:30
414983	242501	33144	1	0	0	32	09:00	10:30
414984	242501	33151	1	0	0	32	09:00	10:30
414985	242501	33158	1	0	0	32	09:00	10:30
414986	242501	33165	1	0	0	32	09:00	10:30
414987	242501	33172	1	0	0	32	09:00	10:30
414988	242501	33179	1	0	0	32	09:00	10:30
414989	242501	33186	1	0	0	32	09:00	10:30
414990	242501	33193	1	0	0	32	09:00	10:30
414991	242501	33200	1	0	0	32	09:00	10:30
414992	242501	33207	1	0	0	32	09:00	10:30
414993	242501	33214	1	0	0	32	09:00	10:30
414994	242501	33221	1	0	0	32	09:00	10:30
414995	242501	33228	1	0	0	32	09:00	10:30
414996	242501	33235	1	0	0	32	09:00	10:30
414997	242501	33242	1	0	0	32	09:00	10:30
414998	242501	33137	2	0	0	32	10:40	12:10
414999	242501	33144	2	0	0	32	10:40	12:10
415000	242501	33151	2	0	0	32	10:40	12:10
415001	242501	33158	2	0	0	32	10:40	12:10
415002	242501	33165	2	0	0	32	10:40	12:10
415003	242501	33172	2	0	0	32	10:40	12:10
415004	242501	33179	2	0	0	32	10:40	12:10
415005	242501	33186	2	0	0	32	10:40	12:10
415006	242501	33193	2	0	0	32	10:40	12:10
415007	242501	33200	2	0	0	32	10:40	12:10
415008	242501	33207	2	0	0	32	10:40	12:10
415009	242501	33214	2	0	0	32	10:40	12:10
415010	242501	33221	2	0	0	32	10:40	12:10
415011	242501	33228	2	0	0	32	10:40	12:10
415012	242501	33235	2	0	0	32	10:40	12:10
415013	242501	33242	2	0	0	32	10:40	12:10
415014	242501	33137	3	0	0	32	12:40	14:10
415015	242501	33144	3	0	0	32	12:40	14:10
415016	242501	33151	3	0	0	32	12:40	14:10
415017	242501	33158	3	0	0	32	12:40	14:10
415018	242501	33165	3	0	0	32	12:40	14:10
415019	242501	33172	3	0	0	32	12:40	14:10
415020	242501	33179	3	0	0	32	12:40	14:10
415021	242501	33186	3	0	0	32	12:40	14:10
415022	242501	33193	3	0	0	32	12:40	14:10
415023	242501	33200	3	0	0	32	12:40	14:10
415024	242501	33207	3	0	0	32	12:40	14:10
415025	242501	33214	3	0	0	32	12:40	14:10
415026	242501	33221	3	0	0	32	12:40	14:10
415027	242501	33228	3	0	0	32	12:40	14:10
415028	242501	33235	3	0	0	32	12:40	14:10
415029	242501	33242	3	0	0	32	12:40	14:10
415030	242501	33137	4	0	0	32	14:20	15:50
415031	242501	33144	4	0	0	32	14:20	15:50
415032	242501	33151	4	0	0	32	14:20	15:50
415033	242501	33158	4	0	0	32	14:20	15:50
415034	242501	33165	4	0	0	32	14:20	15:50
415035	242501	33172	4	0	0	32	14:20	15:50
415036	242501	33179	4	0	0	32	14:20	15:50
415037	242501	33186	4	0	0	32	14:20	15:50
415038	242501	33193	4	0	0	32	14:20	15:50
415039	242501	33200	4	0	0	32	14:20	15:50
415040	242501	33207	4	0	0	32	14:20	15:50
415041	242501	33214	4	0	0	32	14:20	15:50
415042	242501	33221	4	0	0	32	14:20	15:50
415043	242501	33228	4	0	0	32	14:20	15:50
415044	242501	33235	4	0	0	32	14:20	15:50
415045	242501	33242	4	0	0	32	14:20	15:50
415046	242501	33137	5	0	0	32	16:20	17:50
415047	242501	33144	5	0	0	32	16:20	17:50
415048	242501	33151	5	0	0	32	16:20	17:50
415049	242501	33158	5	0	0	32	16:20	17:50
415050	242501	33165	5	0	0	32	16:20	17:50
415051	242501	33172	5	0	0	32	16:20	17:50
415052	242501	33179	5	0	0	32	16:20	17:50
415053	242501	33186	5	0	0	32	16:20	17:50
415054	242501	33193	5	0	0	32	16:20	17:50
415055	242501	33200	5	0	0	32	16:20	17:50
415056	242501	33207	5	0	0	32	16:20	17:50
415057	242501	33214	5	0	0	32	16:20	17:50
415058	242501	33221	5	0	0	32	16:20	17:50
415059	242501	33228	5	0	0	32	16:20	17:50
415060	242501	33235	5	0	0	32	16:20	17:50
415061	242501	33242	5	0	0	32	16:20	17:50
415062	242501	33138	1	0	0	39	09:00	10:30
415063	242501	33145	1	0	0	39	09:00	10:30
415064	242501	33152	1	0	0	39	09:00	10:30
415065	242501	33159	1	0	0	39	09:00	10:30
415066	242501	33166	1	0	0	39	09:00	10:30
415067	242501	33173	1	0	0	39	09:00	10:30
415068	242501	33180	1	0	0	39	09:00	10:30
415069	242501	33187	1	0	0	39	09:00	10:30
415070	242501	33194	1	0	0	39	09:00	10:30
415071	242501	33201	1	0	0	39	09:00	10:30
415072	242501	33208	1	0	0	39	09:00	10:30
415073	242501	33215	1	0	0	39	09:00	10:30
415074	242501	33222	1	0	0	39	09:00	10:30
415075	242501	33229	1	0	0	39	09:00	10:30
415076	242501	33236	1	0	0	39	09:00	10:30
415077	242501	33243	1	0	0	39	09:00	10:30
415078	242501	33138	2	0	0	40	10:40	12:10
415079	242501	33145	2	0	0	40	10:40	12:10
415080	242501	33152	2	0	0	40	10:40	12:10
415081	242501	33159	2	0	0	40	10:40	12:10
415082	242501	33166	2	0	0	40	10:40	12:10
415083	242501	33173	2	0	0	40	10:40	12:10
415084	242501	33180	2	0	0	40	10:40	12:10
415085	242501	33187	2	0	0	40	10:40	12:10
415086	242501	33194	2	0	0	40	10:40	12:10
415087	242501	33201	2	0	0	40	10:40	12:10
415088	242501	33208	2	0	0	40	10:40	12:10
415089	242501	33215	2	0	0	40	10:40	12:10
415090	242501	33222	2	0	0	40	10:40	12:10
415091	242501	33229	2	0	0	40	10:40	12:10
415092	242501	33236	2	0	0	40	10:40	12:10
415093	242501	33243	2	0	0	40	10:40	12:10
415094	242501	33138	3	0	0	40	12:20	13:50
415095	242501	33145	3	0	0	40	12:20	13:50
415096	242501	33152	3	0	0	40	12:20	13:50
415097	242501	33159	3	0	0	40	12:20	13:50
415098	242501	33166	3	0	0	40	12:20	13:50
415099	242501	33173	3	0	0	40	12:20	13:50
415100	242501	33180	3	0	0	40	12:20	13:50
415101	242501	33187	3	0	0	40	12:20	13:50
415102	242501	33194	3	0	0	40	12:20	13:50
415103	242501	33201	3	0	0	40	12:20	13:50
415104	242501	33208	3	0	0	40	12:20	13:50
415105	242501	33215	3	0	0	40	12:20	13:50
415106	242501	33222	3	0	0	40	12:20	13:50
415107	242501	33229	3	0	0	40	12:20	13:50
415108	242501	33236	3	0	0	40	12:20	13:50
415109	242501	33243	3	0	0	40	12:20	13:50
415110	242501	33145	4	0	0	39	14:20	15:50
415111	242501	33152	4	0	0	39	14:20	15:50
415112	242501	33159	4	0	0	39	14:20	15:50
415113	242501	33166	4	0	0	39	14:20	15:50
415114	242501	33173	4	0	0	39	14:20	15:50
415115	242501	33180	4	0	0	39	14:20	15:50
415116	242501	33187	4	0	0	39	14:20	15:50
415117	242501	33194	4	0	0	39	14:20	15:50
415118	242501	33201	4	0	0	39	14:20	15:50
415119	242501	33208	4	0	0	39	14:20	15:50
415120	242501	33215	4	0	0	39	14:20	15:50
415121	242501	33222	4	0	0	39	14:20	15:50
415122	242501	33229	4	0	0	39	14:20	15:50
415123	242501	33236	4	0	0	39	14:20	15:50
415124	242501	33243	4	0	0	39	14:20	15:50
415125	242501	33139	4	0	0	41	14:20	15:50
415126	242501	33146	4	0	0	41	14:20	15:50
415127	242501	33153	4	0	0	41	14:20	15:50
415128	242501	33160	4	0	0	41	14:20	15:50
415129	242501	33167	4	0	0	41	14:20	15:50
415130	242501	33174	4	0	0	41	14:20	15:50
415131	242501	33181	4	0	0	41	14:20	15:50
415132	242501	33188	4	0	0	41	14:20	15:50
415133	242501	33195	4	0	0	41	14:20	15:50
415134	242501	33202	4	0	0	41	14:20	15:50
415135	242501	33209	4	0	0	41	14:20	15:50
415136	242501	33216	4	0	0	41	14:20	15:50
415137	242501	33223	4	0	0	41	14:20	15:50
415138	242501	33230	4	0	0	41	14:20	15:50
415139	242501	33237	4	0	0	41	14:20	15:50
415140	242501	33244	4	0	0	41	14:20	15:50
415141	242501	33139	5	0	0	42	16:20	17:50
415142	242501	33146	5	0	0	42	16:20	17:50
415143	242501	33153	5	0	0	42	16:20	17:50
415144	242501	33160	5	0	0	42	16:20	17:50
415145	242501	33167	5	0	0	42	16:20	17:50
415146	242501	33174	5	0	0	42	16:20	17:50
415147	242501	33181	5	0	0	42	16:20	17:50
415148	242501	33188	5	0	0	42	16:20	17:50
415149	242501	33195	5	0	0	42	16:20	17:50
415150	242501	33202	5	0	0	42	16:20	17:50
415151	242501	33209	5	0	0	42	16:20	17:50
415152	242501	33216	5	0	0	42	16:20	17:50
415153	242501	33223	5	0	0	42	16:20	17:50
415154	242501	33230	5	0	0	42	16:20	17:50
415155	242501	33237	5	0	0	42	16:20	17:50
415156	242501	33244	5	0	0	42	16:20	17:50
415157	242501	33139	6	0	0	43	18:00	19:30
415158	242501	33146	6	0	0	43	18:00	19:30
415159	242501	33153	6	0	0	43	18:00	19:30
415160	242501	33160	6	0	0	43	18:00	19:30
415161	242501	33167	6	0	0	43	18:00	19:30
415162	242501	33174	6	0	0	43	18:00	19:30
415163	242501	33181	6	0	0	43	18:00	19:30
415164	242501	33188	6	0	0	43	18:00	19:30
415165	242501	33195	6	0	0	43	18:00	19:30
415166	242501	33202	6	0	0	43	18:00	19:30
415167	242501	33209	6	0	0	43	18:00	19:30
415168	242501	33216	6	0	0	43	18:00	19:30
415169	242501	33223	6	0	0	43	18:00	19:30
415170	242501	33230	6	0	0	43	18:00	19:30
415171	242501	33237	6	0	0	43	18:00	19:30
415172	242501	33244	6	0	0	43	18:00	19:30
415173	242501	33140	1	0	0	32	09:00	10:30
415174	242501	33147	1	0	0	32	09:00	10:30
415175	242501	33154	1	0	0	32	09:00	10:30
415176	242501	33161	1	0	0	32	09:00	10:30
415177	242501	33168	1	0	0	32	09:00	10:30
415178	242501	33175	1	0	0	32	09:00	10:30
415179	242501	33182	1	0	0	32	09:00	10:30
415180	242501	33189	1	0	0	32	09:00	10:30
415181	242501	33196	1	0	0	32	09:00	10:30
415182	242501	33203	1	0	0	32	09:00	10:30
415183	242501	33210	1	0	0	32	09:00	10:30
415184	242501	33217	1	0	0	32	09:00	10:30
415185	242501	33224	1	0	0	32	09:00	10:30
415186	242501	33231	1	0	0	32	09:00	10:30
415187	242501	33238	1	0	0	32	09:00	10:30
415188	242501	33245	1	0	0	32	09:00	10:30
415189	242501	33140	2	0	0	32	10:40	12:10
415190	242501	33147	2	0	0	32	10:40	12:10
415191	242501	33154	2	0	0	32	10:40	12:10
415192	242501	33161	2	0	0	32	10:40	12:10
415193	242501	33168	2	0	0	32	10:40	12:10
415194	242501	33175	2	0	0	32	10:40	12:10
415195	242501	33182	2	0	0	32	10:40	12:10
415196	242501	33189	2	0	0	32	10:40	12:10
415197	242501	33196	2	0	0	32	10:40	12:10
415198	242501	33203	2	0	0	32	10:40	12:10
415199	242501	33210	2	0	0	32	10:40	12:10
415200	242501	33217	2	0	0	32	10:40	12:10
415201	242501	33224	2	0	0	32	10:40	12:10
415202	242501	33231	2	0	0	32	10:40	12:10
415203	242501	33238	2	0	0	32	10:40	12:10
415204	242501	33245	2	0	0	32	10:40	12:10
415205	242501	33140	3	0	0	32	12:40	14:10
415206	242501	33147	3	0	0	32	12:40	14:10
415207	242501	33154	3	0	0	32	12:40	14:10
415208	242501	33161	3	0	0	32	12:40	14:10
415209	242501	33168	3	0	0	32	12:40	14:10
415210	242501	33175	3	0	0	32	12:40	14:10
415211	242501	33182	3	0	0	32	12:40	14:10
415212	242501	33189	3	0	0	32	12:40	14:10
415213	242501	33196	3	0	0	32	12:40	14:10
415214	242501	33203	3	0	0	32	12:40	14:10
415215	242501	33210	3	0	0	32	12:40	14:10
415216	242501	33217	3	0	0	32	12:40	14:10
415217	242501	33224	3	0	0	32	12:40	14:10
415218	242501	33231	3	0	0	32	12:40	14:10
415219	242501	33238	3	0	0	32	12:40	14:10
415220	242501	33245	3	0	0	32	12:40	14:10
415221	242501	33140	4	0	0	32	14:20	15:50
415222	242501	33147	4	0	0	32	14:20	15:50
415223	242501	33154	4	0	0	32	14:20	15:50
415224	242501	33161	4	0	0	32	14:20	15:50
415225	242501	33168	4	0	0	32	14:20	15:50
415226	242501	33175	4	0	0	32	14:20	15:50
415227	242501	33182	4	0	0	32	14:20	15:50
415228	242501	33189	4	0	0	32	14:20	15:50
415229	242501	33196	4	0	0	32	14:20	15:50
415230	242501	33203	4	0	0	32	14:20	15:50
415231	242501	33210	4	0	0	32	14:20	15:50
415232	242501	33217	4	0	0	32	14:20	15:50
415233	242501	33224	4	0	0	32	14:20	15:50
415234	242501	33231	4	0	0	32	14:20	15:50
415235	242501	33238	4	0	0	32	14:20	15:50
415236	242501	33245	4	0	0	32	14:20	15:50
415237	242501	33140	5	0	0	32	16:20	17:50
415238	242501	33147	5	0	0	32	16:20	17:50
415239	242501	33154	5	0	0	32	16:20	17:50
415240	242501	33161	5	0	0	32	16:20	17:50
415241	242501	33168	5	0	0	32	16:20	17:50
415242	242501	33175	5	0	0	32	16:20	17:50
415243	242501	33182	5	0	0	32	16:20	17:50
415244	242501	33189	5	0	0	32	16:20	17:50
415245	242501	33196	5	0	0	32	16:20	17:50
415246	242501	33203	5	0	0	32	16:20	17:50
415247	242501	33210	5	0	0	32	16:20	17:50
415248	242501	33217	5	0	0	32	16:20	17:50
415249	242501	33224	5	0	0	32	16:20	17:50
415250	242501	33231	5	0	0	32	16:20	17:50
415251	242501	33238	5	0	0	32	16:20	17:50
415252	242501	33245	5	0	0	32	16:20	17:50
415253	242501	33141	1	0	0	32	09:00	10:30
415254	242501	33148	1	0	0	32	09:00	10:30
415255	242501	33155	1	0	0	32	09:00	10:30
415256	242501	33162	1	0	0	32	09:00	10:30
415257	242501	33169	1	0	0	32	09:00	10:30
415258	242501	33176	1	0	0	32	09:00	10:30
415259	242501	33183	1	0	0	32	09:00	10:30
415260	242501	33190	1	0	0	32	09:00	10:30
415261	242501	33197	1	0	0	32	09:00	10:30
415262	242501	33204	1	0	0	32	09:00	10:30
415263	242501	33211	1	0	0	32	09:00	10:30
415264	242501	33218	1	0	0	32	09:00	10:30
415265	242501	33225	1	0	0	32	09:00	10:30
415266	242501	33232	1	0	0	32	09:00	10:30
415267	242501	33239	1	0	0	32	09:00	10:30
415268	242501	33246	1	0	0	32	09:00	10:30
415269	242501	33141	2	0	0	32	10:40	12:10
415270	242501	33148	2	0	0	32	10:40	12:10
415271	242501	33155	2	0	0	32	10:40	12:10
415272	242501	33162	2	0	0	32	10:40	12:10
415273	242501	33169	2	0	0	32	10:40	12:10
415274	242501	33176	2	0	0	32	10:40	12:10
415275	242501	33183	2	0	0	32	10:40	12:10
415276	242501	33190	2	0	0	32	10:40	12:10
415277	242501	33197	2	0	0	32	10:40	12:10
415278	242501	33204	2	0	0	32	10:40	12:10
415279	242501	33211	2	0	0	32	10:40	12:10
415280	242501	33218	2	0	0	32	10:40	12:10
415281	242501	33225	2	0	0	32	10:40	12:10
415282	242501	33232	2	0	0	32	10:40	12:10
415283	242501	33239	2	0	0	32	10:40	12:10
415284	242501	33246	2	0	0	32	10:40	12:10
415285	242501	33141	3	0	0	32	12:40	14:10
415286	242501	33148	3	0	0	32	12:40	14:10
415287	242501	33155	3	0	0	32	12:40	14:10
415288	242501	33162	3	0	0	32	12:40	14:10
415289	242501	33169	3	0	0	32	12:40	14:10
415290	242501	33176	3	0	0	32	12:40	14:10
415291	242501	33183	3	0	0	32	12:40	14:10
415292	242501	33190	3	0	0	32	12:40	14:10
415293	242501	33197	3	0	0	32	12:40	14:10
415294	242501	33204	3	0	0	32	12:40	14:10
415295	242501	33211	3	0	0	32	12:40	14:10
415296	242501	33218	3	0	0	32	12:40	14:10
415297	242501	33225	3	0	0	32	12:40	14:10
415298	242501	33232	3	0	0	32	12:40	14:10
415299	242501	33239	3	0	0	32	12:40	14:10
415300	242501	33246	3	0	0	32	12:40	14:10
415301	242501	33141	4	0	0	32	14:20	15:50
415302	242501	33148	4	0	0	32	14:20	15:50
415303	242501	33155	4	0	0	32	14:20	15:50
415304	242501	33162	4	0	0	32	14:20	15:50
415305	242501	33169	4	0	0	32	14:20	15:50
415306	242501	33176	4	0	0	32	14:20	15:50
415307	242501	33183	4	0	0	32	14:20	15:50
415308	242501	33190	4	0	0	32	14:20	15:50
415309	242501	33197	4	0	0	32	14:20	15:50
415310	242501	33204	4	0	0	32	14:20	15:50
415311	242501	33211	4	0	0	32	14:20	15:50
415312	242501	33218	4	0	0	32	14:20	15:50
415313	242501	33225	4	0	0	32	14:20	15:50
415314	242501	33232	4	0	0	32	14:20	15:50
415315	242501	33239	4	0	0	32	14:20	15:50
415316	242501	33246	4	0	0	32	14:20	15:50
415317	242501	33141	5	0	0	32	16:20	17:50
415318	242501	33148	5	0	0	32	16:20	17:50
415319	242501	33155	5	0	0	32	16:20	17:50
415320	242501	33162	5	0	0	32	16:20	17:50
415321	242501	33169	5	0	0	32	16:20	17:50
415322	242501	33176	5	0	0	32	16:20	17:50
415323	242501	33183	5	0	0	32	16:20	17:50
415324	242501	33190	5	0	0	32	16:20	17:50
415325	242501	33197	5	0	0	32	16:20	17:50
415326	242501	33204	5	0	0	32	16:20	17:50
415327	242501	33211	5	0	0	32	16:20	17:50
415328	242501	33218	5	0	0	32	16:20	17:50
415329	242501	33225	5	0	0	32	16:20	17:50
415330	242501	33232	5	0	0	32	16:20	17:50
415331	242501	33239	5	0	0	32	16:20	17:50
415332	242501	33246	5	0	0	32	16:20	17:50
415333	242501	33137	1	0	0	44	09:00	10:30
415334	242501	33144	1	0	0	44	09:00	10:30
415335	242501	33151	1	0	0	44	09:00	10:30
415336	242501	33158	1	0	0	44	09:00	10:30
415337	242501	33165	1	0	0	44	09:00	10:30
415338	242501	33172	1	0	0	44	09:00	10:30
415339	242501	33179	1	0	0	44	09:00	10:30
415340	242501	33186	1	0	0	44	09:00	10:30
415341	242501	33193	1	0	0	44	09:00	10:30
415342	242501	33200	1	0	0	44	09:00	10:30
415343	242501	33207	1	0	0	44	09:00	10:30
415344	242501	33214	1	0	0	44	09:00	10:30
415345	242501	33221	1	0	0	44	09:00	10:30
415346	242501	33228	1	0	0	44	09:00	10:30
415347	242501	33235	1	0	0	44	09:00	10:30
415348	242501	33242	1	0	0	44	09:00	10:30
415349	242501	33137	2	0	0	44	10:40	12:10
415350	242501	33144	2	0	0	44	10:40	12:10
415351	242501	33151	2	0	0	44	10:40	12:10
415352	242501	33158	2	0	0	44	10:40	12:10
415353	242501	33165	2	0	0	44	10:40	12:10
415354	242501	33172	2	0	0	44	10:40	12:10
415355	242501	33179	2	0	0	44	10:40	12:10
415356	242501	33186	2	0	0	44	10:40	12:10
415357	242501	33193	2	0	0	44	10:40	12:10
415358	242501	33200	2	0	0	44	10:40	12:10
415359	242501	33207	2	0	0	44	10:40	12:10
415360	242501	33214	2	0	0	44	10:40	12:10
415361	242501	33221	2	0	0	44	10:40	12:10
415362	242501	33228	2	0	0	44	10:40	12:10
415363	242501	33235	2	0	0	44	10:40	12:10
415364	242501	33242	2	0	0	44	10:40	12:10
415365	242501	33137	3	0	0	44	12:40	14:10
415366	242501	33144	3	0	0	44	12:40	14:10
415367	242501	33151	3	0	0	44	12:40	14:10
415368	242501	33158	3	0	0	44	12:40	14:10
415369	242501	33165	3	0	0	44	12:40	14:10
415370	242501	33172	3	0	0	44	12:40	14:10
415371	242501	33179	3	0	0	44	12:40	14:10
415372	242501	33186	3	0	0	44	12:40	14:10
415373	242501	33193	3	0	0	44	12:40	14:10
415374	242501	33200	3	0	0	44	12:40	14:10
415375	242501	33207	3	0	0	44	12:40	14:10
415376	242501	33214	3	0	0	44	12:40	14:10
415377	242501	33221	3	0	0	44	12:40	14:10
415378	242501	33228	3	0	0	44	12:40	14:10
415379	242501	33235	3	0	0	44	12:40	14:10
415380	242501	33242	3	0	0	44	12:40	14:10
415381	242501	33137	4	0	0	44	14:20	15:50
415382	242501	33144	4	0	0	44	14:20	15:50
415383	242501	33151	4	0	0	44	14:20	15:50
415384	242501	33158	4	0	0	44	14:20	15:50
415385	242501	33165	4	0	0	44	14:20	15:50
415386	242501	33172	4	0	0	44	14:20	15:50
415387	242501	33179	4	0	0	44	14:20	15:50
415388	242501	33186	4	0	0	44	14:20	15:50
415389	242501	33193	4	0	0	44	14:20	15:50
415390	242501	33200	4	0	0	44	14:20	15:50
415391	242501	33207	4	0	0	44	14:20	15:50
415392	242501	33214	4	0	0	44	14:20	15:50
415393	242501	33221	4	0	0	44	14:20	15:50
415394	242501	33228	4	0	0	44	14:20	15:50
415395	242501	33235	4	0	0	44	14:20	15:50
415396	242501	33242	4	0	0	44	14:20	15:50
415397	242501	33137	5	0	0	45	16:20	17:50
415398	242501	33151	5	0	0	45	16:20	17:50
415399	242501	33165	5	0	0	45	16:20	17:50
415400	242501	33179	5	0	0	45	16:20	17:50
415401	242501	33193	5	0	0	45	16:20	17:50
415402	242501	33207	5	0	0	45	16:20	17:50
415403	242501	33221	5	0	0	45	16:20	17:50
415404	242501	33235	5	0	0	45	16:20	17:50
415405	242501	33138	1	0	0	44	09:00	10:30
415406	242501	33145	1	0	0	44	09:00	10:30
415407	242501	33152	1	0	0	44	09:00	10:30
415408	242501	33159	1	0	0	44	09:00	10:30
415409	242501	33166	1	0	0	44	09:00	10:30
415410	242501	33173	1	0	0	44	09:00	10:30
415411	242501	33180	1	0	0	44	09:00	10:30
415412	242501	33187	1	0	0	44	09:00	10:30
415413	242501	33194	1	0	0	44	09:00	10:30
415414	242501	33201	1	0	0	44	09:00	10:30
415415	242501	33208	1	0	0	44	09:00	10:30
415416	242501	33215	1	0	0	44	09:00	10:30
415417	242501	33222	1	0	0	44	09:00	10:30
415418	242501	33229	1	0	0	44	09:00	10:30
415419	242501	33236	1	0	0	44	09:00	10:30
415420	242501	33243	1	0	0	44	09:00	10:30
415421	242501	33138	2	0	0	44	10:40	12:10
415422	242501	33145	2	0	0	44	10:40	12:10
415423	242501	33152	2	0	0	44	10:40	12:10
415424	242501	33159	2	0	0	44	10:40	12:10
415425	242501	33166	2	0	0	44	10:40	12:10
415426	242501	33173	2	0	0	44	10:40	12:10
415427	242501	33180	2	0	0	44	10:40	12:10
415428	242501	33187	2	0	0	44	10:40	12:10
415429	242501	33194	2	0	0	44	10:40	12:10
415430	242501	33201	2	0	0	44	10:40	12:10
415431	242501	33208	2	0	0	44	10:40	12:10
415432	242501	33215	2	0	0	44	10:40	12:10
415433	242501	33222	2	0	0	44	10:40	12:10
415434	242501	33229	2	0	0	44	10:40	12:10
415435	242501	33236	2	0	0	44	10:40	12:10
415436	242501	33243	2	0	0	44	10:40	12:10
415437	242501	33138	3	0	0	44	12:40	14:10
415438	242501	33145	3	0	0	44	12:40	14:10
415439	242501	33152	3	0	0	44	12:40	14:10
415440	242501	33159	3	0	0	44	12:40	14:10
415441	242501	33166	3	0	0	44	12:40	14:10
415442	242501	33173	3	0	0	44	12:40	14:10
415443	242501	33180	3	0	0	44	12:40	14:10
415444	242501	33187	3	0	0	44	12:40	14:10
415445	242501	33194	3	0	0	44	12:40	14:10
415446	242501	33201	3	0	0	44	12:40	14:10
415447	242501	33208	3	0	0	44	12:40	14:10
415448	242501	33215	3	0	0	44	12:40	14:10
415449	242501	33222	3	0	0	44	12:40	14:10
415450	242501	33229	3	0	0	44	12:40	14:10
415451	242501	33236	3	0	0	44	12:40	14:10
415452	242501	33243	3	0	0	44	12:40	14:10
415453	242501	33138	4	0	0	44	14:20	15:50
415454	242501	33145	4	0	0	44	14:20	15:50
415455	242501	33152	4	0	0	44	14:20	15:50
415456	242501	33159	4	0	0	44	14:20	15:50
415457	242501	33166	4	0	0	44	14:20	15:50
415458	242501	33173	4	0	0	44	14:20	15:50
415459	242501	33180	4	0	0	44	14:20	15:50
415460	242501	33187	4	0	0	44	14:20	15:50
415461	242501	33194	4	0	0	44	14:20	15:50
415462	242501	33201	4	0	0	44	14:20	15:50
415463	242501	33208	4	0	0	44	14:20	15:50
415464	242501	33215	4	0	0	44	14:20	15:50
415465	242501	33222	4	0	0	44	14:20	15:50
415466	242501	33229	4	0	0	44	14:20	15:50
415467	242501	33236	4	0	0	44	14:20	15:50
415468	242501	33243	4	0	0	44	14:20	15:50
415469	242501	33138	5	0	0	44	16:20	17:50
415470	242501	33145	5	0	0	44	16:20	17:50
415471	242501	33152	5	0	0	44	16:20	17:50
415472	242501	33159	5	0	0	44	16:20	17:50
415473	242501	33166	5	0	0	44	16:20	17:50
415474	242501	33173	5	0	0	44	16:20	17:50
415475	242501	33180	5	0	0	44	16:20	17:50
415476	242501	33187	5	0	0	44	16:20	17:50
415477	242501	33194	5	0	0	44	16:20	17:50
415478	242501	33201	5	0	0	44	16:20	17:50
415479	242501	33208	5	0	0	44	16:20	17:50
415480	242501	33215	5	0	0	44	16:20	17:50
415481	242501	33222	5	0	0	44	16:20	17:50
415482	242501	33229	5	0	0	44	16:20	17:50
415483	242501	33236	5	0	0	44	16:20	17:50
415484	242501	33243	5	0	0	44	16:20	17:50
415485	242501	33139	2	0	0	46	10:40	12:10
415486	242501	33146	2	0	0	46	10:40	12:10
415487	242501	33153	2	0	0	46	10:40	12:10
415488	242501	33160	2	0	0	46	10:40	12:10
415489	242501	33167	2	0	0	46	10:40	12:10
415490	242501	33174	2	0	0	46	10:40	12:10
415491	242501	33181	2	0	0	46	10:40	12:10
415492	242501	33188	2	0	0	46	10:40	12:10
415493	242501	33195	2	0	0	46	10:40	12:10
415494	242501	33202	2	0	0	46	10:40	12:10
415495	242501	33209	2	0	0	46	10:40	12:10
415496	242501	33216	2	0	0	46	10:40	12:10
415497	242501	33223	2	0	0	46	10:40	12:10
415498	242501	33230	2	0	0	46	10:40	12:10
415499	242501	33237	2	0	0	46	10:40	12:10
415500	242501	33244	2	0	0	46	10:40	12:10
415501	242501	33139	3	0	0	45	12:40	14:10
415502	242501	33153	3	0	0	45	12:40	14:10
415503	242501	33167	3	0	0	45	12:40	14:10
415504	242501	33181	3	0	0	45	12:40	14:10
415505	242501	33195	3	0	0	45	12:40	14:10
415506	242501	33209	3	0	0	45	12:40	14:10
415507	242501	33223	3	0	0	45	12:40	14:10
415508	242501	33237	3	0	0	45	12:40	14:10
415509	242501	33146	4	0	0	47	14:20	15:50
415510	242501	33160	4	0	0	47	14:20	15:50
415511	242501	33174	4	0	0	47	14:20	15:50
415512	242501	33188	4	0	0	47	14:20	15:50
415513	242501	33202	4	0	0	47	14:20	15:50
415514	242501	33216	4	0	0	47	14:20	15:50
415515	242501	33230	4	0	0	47	14:20	15:50
415516	242501	33244	4	0	0	47	14:20	15:50
415517	242501	33139	4	0	0	45	14:20	15:50
415518	242501	33153	4	0	0	45	14:20	15:50
415519	242501	33167	4	0	0	45	14:20	15:50
415520	242501	33181	4	0	0	45	14:20	15:50
415521	242501	33195	4	0	0	45	14:20	15:50
415522	242501	33209	4	0	0	45	14:20	15:50
415523	242501	33223	4	0	0	45	14:20	15:50
415524	242501	33237	4	0	0	45	14:20	15:50
415525	242501	33139	5	0	0	47	16:20	17:50
415526	242501	33146	5	0	0	47	16:20	17:50
415527	242501	33153	5	0	0	47	16:20	17:50
415528	242501	33160	5	0	0	47	16:20	17:50
415529	242501	33167	5	0	0	47	16:20	17:50
415530	242501	33174	5	0	0	47	16:20	17:50
415531	242501	33181	5	0	0	47	16:20	17:50
415532	242501	33188	5	0	0	47	16:20	17:50
415533	242501	33195	5	0	0	47	16:20	17:50
415534	242501	33202	5	0	0	47	16:20	17:50
415535	242501	33209	5	0	0	47	16:20	17:50
415536	242501	33216	5	0	0	47	16:20	17:50
415537	242501	33223	5	0	0	47	16:20	17:50
415538	242501	33230	5	0	0	47	16:20	17:50
415539	242501	33237	5	0	0	47	16:20	17:50
415540	242501	33244	5	0	0	47	16:20	17:50
415541	242501	33140	1	0	0	44	09:00	10:30
415542	242501	33147	1	0	0	44	09:00	10:30
415543	242501	33154	1	0	0	44	09:00	10:30
415544	242501	33161	1	0	0	44	09:00	10:30
415545	242501	33168	1	0	0	44	09:00	10:30
415546	242501	33175	1	0	0	44	09:00	10:30
415547	242501	33182	1	0	0	44	09:00	10:30
415548	242501	33189	1	0	0	44	09:00	10:30
415549	242501	33196	1	0	0	44	09:00	10:30
415550	242501	33203	1	0	0	44	09:00	10:30
415551	242501	33210	1	0	0	44	09:00	10:30
415552	242501	33217	1	0	0	44	09:00	10:30
415553	242501	33224	1	0	0	44	09:00	10:30
415554	242501	33231	1	0	0	44	09:00	10:30
415555	242501	33238	1	0	0	44	09:00	10:30
415556	242501	33245	1	0	0	44	09:00	10:30
415557	242501	33140	2	0	0	44	10:40	12:10
415558	242501	33147	2	0	0	44	10:40	12:10
415559	242501	33154	2	0	0	44	10:40	12:10
415560	242501	33161	2	0	0	44	10:40	12:10
415561	242501	33168	2	0	0	44	10:40	12:10
415562	242501	33175	2	0	0	44	10:40	12:10
415563	242501	33182	2	0	0	44	10:40	12:10
415564	242501	33189	2	0	0	44	10:40	12:10
415565	242501	33196	2	0	0	44	10:40	12:10
415566	242501	33203	2	0	0	44	10:40	12:10
415567	242501	33210	2	0	0	44	10:40	12:10
415568	242501	33217	2	0	0	44	10:40	12:10
415569	242501	33224	2	0	0	44	10:40	12:10
415570	242501	33231	2	0	0	44	10:40	12:10
415571	242501	33238	2	0	0	44	10:40	12:10
415572	242501	33245	2	0	0	44	10:40	12:10
415573	242501	33140	3	0	0	44	12:40	14:10
415574	242501	33147	3	0	0	44	12:40	14:10
415575	242501	33154	3	0	0	44	12:40	14:10
415576	242501	33161	3	0	0	44	12:40	14:10
415577	242501	33168	3	0	0	44	12:40	14:10
415578	242501	33175	3	0	0	44	12:40	14:10
415579	242501	33182	3	0	0	44	12:40	14:10
415580	242501	33189	3	0	0	44	12:40	14:10
415581	242501	33196	3	0	0	44	12:40	14:10
415582	242501	33203	3	0	0	44	12:40	14:10
415583	242501	33210	3	0	0	44	12:40	14:10
415584	242501	33217	3	0	0	44	12:40	14:10
415585	242501	33224	3	0	0	44	12:40	14:10
415586	242501	33231	3	0	0	44	12:40	14:10
415587	242501	33238	3	0	0	44	12:40	14:10
415588	242501	33245	3	0	0	44	12:40	14:10
415589	242501	33140	4	0	0	44	14:20	15:50
415590	242501	33147	4	0	0	44	14:20	15:50
415591	242501	33154	4	0	0	44	14:20	15:50
415592	242501	33161	4	0	0	44	14:20	15:50
415593	242501	33168	4	0	0	44	14:20	15:50
415594	242501	33175	4	0	0	44	14:20	15:50
415595	242501	33182	4	0	0	44	14:20	15:50
415596	242501	33189	4	0	0	44	14:20	15:50
415597	242501	33196	4	0	0	44	14:20	15:50
415598	242501	33203	4	0	0	44	14:20	15:50
415599	242501	33210	4	0	0	44	14:20	15:50
415600	242501	33217	4	0	0	44	14:20	15:50
415601	242501	33224	4	0	0	44	14:20	15:50
415602	242501	33231	4	0	0	44	14:20	15:50
415603	242501	33238	4	0	0	44	14:20	15:50
415604	242501	33245	4	0	0	44	14:20	15:50
415605	242501	33140	5	0	0	44	16:20	17:50
415606	242501	33147	5	0	0	44	16:20	17:50
415607	242501	33154	5	0	0	44	16:20	17:50
415608	242501	33161	5	0	0	44	16:20	17:50
415609	242501	33168	5	0	0	44	16:20	17:50
415610	242501	33175	5	0	0	44	16:20	17:50
415611	242501	33182	5	0	0	44	16:20	17:50
415612	242501	33189	5	0	0	44	16:20	17:50
415613	242501	33196	5	0	0	44	16:20	17:50
415614	242501	33203	5	0	0	44	16:20	17:50
415615	242501	33210	5	0	0	44	16:20	17:50
415616	242501	33217	5	0	0	44	16:20	17:50
415617	242501	33224	5	0	0	44	16:20	17:50
415618	242501	33231	5	0	0	44	16:20	17:50
415619	242501	33238	5	0	0	44	16:20	17:50
415620	242501	33245	5	0	0	44	16:20	17:50
415621	242501	33141	2	0	0	48	10:40	12:10
415622	242501	33148	2	0	0	48	10:40	12:10
415623	242501	33155	2	0	0	48	10:40	12:10
415624	242501	33162	2	0	0	48	10:40	12:10
415625	242501	33169	2	0	0	48	10:40	12:10
415626	242501	33176	2	0	0	48	10:40	12:10
415627	242501	33183	2	0	0	48	10:40	12:10
415628	242501	33190	2	0	0	48	10:40	12:10
415629	242501	33197	2	0	0	48	10:40	12:10
415630	242501	33204	2	0	0	48	10:40	12:10
415631	242501	33211	2	0	0	48	10:40	12:10
415632	242501	33218	2	0	0	48	10:40	12:10
415633	242501	33225	2	0	0	48	10:40	12:10
415634	242501	33232	2	0	0	48	10:40	12:10
415635	242501	33239	2	0	0	48	10:40	12:10
415636	242501	33246	2	0	0	48	10:40	12:10
415637	242501	33148	5	0	0	48	16:20	17:50
415638	242501	33162	5	0	0	48	16:20	17:50
415639	242501	33176	5	0	0	48	16:20	17:50
415640	242501	33190	5	0	0	48	16:20	17:50
415641	242501	33204	5	0	0	48	16:20	17:50
415642	242501	33218	5	0	0	48	16:20	17:50
415643	242501	33232	5	0	0	48	16:20	17:50
415644	242501	33246	5	0	0	48	16:20	17:50
\.


--
-- Data for Name: sc_rasp18_days; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp18_days (id, semcode, day, weekday, week) FROM stdin;
33130	242501	2025-02-10	1	1
33131	242501	2025-02-11	2	1
33132	242501	2025-02-12	3	1
33133	242501	2025-02-13	4	1
33134	242501	2025-02-14	5	1
33135	242501	2025-02-15	6	1
33136	242501	2025-02-16	0	1
33137	242501	2025-02-17	1	2
33138	242501	2025-02-18	2	2
33139	242501	2025-02-19	3	2
33140	242501	2025-02-20	4	2
33141	242501	2025-02-21	5	2
33142	242501	2025-02-22	6	2
33143	242501	2025-02-23	0	2
33144	242501	2025-02-24	1	3
33145	242501	2025-02-25	2	3
33146	242501	2025-02-26	3	3
33147	242501	2025-02-27	4	3
33148	242501	2025-02-28	5	3
33149	242501	2025-03-01	6	3
33150	242501	2025-03-02	0	3
33151	242501	2025-03-03	1	4
33152	242501	2025-03-04	2	4
33153	242501	2025-03-05	3	4
33154	242501	2025-03-06	4	4
33155	242501	2025-03-07	5	4
33156	242501	2025-03-08	6	4
33157	242501	2025-03-09	0	4
33158	242501	2025-03-10	1	5
33159	242501	2025-03-11	2	5
33160	242501	2025-03-12	3	5
33161	242501	2025-03-13	4	5
33162	242501	2025-03-14	5	5
33163	242501	2025-03-15	6	5
33164	242501	2025-03-16	0	5
33165	242501	2025-03-17	1	6
33166	242501	2025-03-18	2	6
33167	242501	2025-03-19	3	6
33168	242501	2025-03-20	4	6
33169	242501	2025-03-21	5	6
33170	242501	2025-03-22	6	6
33171	242501	2025-03-23	0	6
33172	242501	2025-03-24	1	7
33173	242501	2025-03-25	2	7
33174	242501	2025-03-26	3	7
33175	242501	2025-03-27	4	7
33176	242501	2025-03-28	5	7
33177	242501	2025-03-29	6	7
33178	242501	2025-03-30	0	7
33179	242501	2025-03-31	1	8
33180	242501	2025-04-01	2	8
33181	242501	2025-04-02	3	8
33182	242501	2025-04-03	4	8
33183	242501	2025-04-04	5	8
33184	242501	2025-04-05	6	8
33185	242501	2025-04-06	0	8
33186	242501	2025-04-07	1	9
33187	242501	2025-04-08	2	9
33188	242501	2025-04-09	3	9
33189	242501	2025-04-10	4	9
33190	242501	2025-04-11	5	9
33191	242501	2025-04-12	6	9
33192	242501	2025-04-13	0	9
33193	242501	2025-04-14	1	10
33194	242501	2025-04-15	2	10
33195	242501	2025-04-16	3	10
33196	242501	2025-04-17	4	10
33197	242501	2025-04-18	5	10
33198	242501	2025-04-19	6	10
33199	242501	2025-04-20	0	10
33200	242501	2025-04-21	1	11
33201	242501	2025-04-22	2	11
33202	242501	2025-04-23	3	11
33203	242501	2025-04-24	4	11
33204	242501	2025-04-25	5	11
33205	242501	2025-04-26	6	11
33206	242501	2025-04-27	0	11
33207	242501	2025-04-28	1	12
33208	242501	2025-04-29	2	12
33209	242501	2025-04-30	3	12
33210	242501	2025-05-01	4	12
33211	242501	2025-05-02	5	12
33212	242501	2025-05-03	6	12
33213	242501	2025-05-04	0	12
33214	242501	2025-05-05	1	13
33215	242501	2025-05-06	2	13
33216	242501	2025-05-07	3	13
33217	242501	2025-05-08	4	13
33218	242501	2025-05-09	5	13
33219	242501	2025-05-10	6	13
33220	242501	2025-05-11	0	13
33221	242501	2025-05-12	1	14
33222	242501	2025-05-13	2	14
33223	242501	2025-05-14	3	14
33224	242501	2025-05-15	4	14
33225	242501	2025-05-16	5	14
33226	242501	2025-05-17	6	14
33227	242501	2025-05-18	0	14
33228	242501	2025-05-19	1	15
33229	242501	2025-05-20	2	15
33230	242501	2025-05-21	3	15
33231	242501	2025-05-22	4	15
33232	242501	2025-05-23	5	15
33233	242501	2025-05-24	6	15
33234	242501	2025-05-25	0	15
33235	242501	2025-05-26	1	16
33236	242501	2025-05-27	2	16
33237	242501	2025-05-28	3	16
33238	242501	2025-05-29	4	16
33239	242501	2025-05-30	5	16
33240	242501	2025-05-31	6	16
33241	242501	2025-06-01	0	16
33242	242501	2025-06-02	1	17
33243	242501	2025-06-03	2	17
33244	242501	2025-06-04	3	17
33245	242501	2025-06-05	4	17
33246	242501	2025-06-06	5	17
33247	242501	2025-06-07	6	17
33248	242501	2025-06-08	0	17
33249	242501	2025-06-09	1	18
33250	242501	2025-06-10	2	18
33251	242501	2025-06-11	3	18
33252	242501	2025-06-12	4	18
33253	242501	2025-06-13	5	18
33254	242501	2025-06-14	6	18
33255	242501	2025-06-15	0	18
33256	242501	2025-06-16	1	19
33257	242501	2025-06-17	2	19
33258	242501	2025-06-18	3	19
33259	242501	2025-06-19	4	19
33260	242501	2025-06-20	5	19
33261	242501	2025-06-21	6	19
33262	242501	2025-06-22	0	19
33263	242501	2025-06-23	1	20
33264	242501	2025-06-24	2	20
33265	242501	2025-06-25	3	20
33266	242501	2025-06-26	4	20
33267	242501	2025-06-27	5	20
33268	242501	2025-06-28	6	20
33269	242501	2025-06-29	0	20
33270	242501	2025-06-30	1	21
33271	242501	2025-07-01	2	21
33272	242501	2025-07-02	3	21
33273	242501	2025-07-03	4	21
33274	242501	2025-07-04	5	21
33275	242501	2025-07-05	6	21
33276	242501	2025-07-06	0	21
33277	242501	2025-07-07	1	22
33278	242501	2025-07-08	2	22
33279	242501	2025-07-09	3	22
33280	242501	2025-07-10	4	22
33281	242501	2025-07-11	5	22
33282	242501	2025-07-12	6	22
33283	242501	2025-07-13	0	22
33284	242501	2025-07-14	1	23
33285	242501	2025-07-15	2	23
33286	242501	2025-07-16	3	23
33287	242501	2025-07-17	4	23
33288	242501	2025-07-18	5	23
33289	242501	2025-07-19	6	23
33290	242501	2025-07-20	0	23
33291	242501	2025-07-21	1	24
33292	242501	2025-07-22	2	24
33293	242501	2025-07-23	3	24
33294	242501	2025-07-24	4	24
33295	242501	2025-07-25	5	24
33296	242501	2025-07-26	6	24
33297	242501	2025-07-27	0	24
33298	242501	2025-07-28	1	25
33299	242501	2025-07-29	2	25
33300	242501	2025-07-30	3	25
33301	242501	2025-07-31	4	25
33302	242501	2025-08-01	5	25
33303	242501	2025-08-02	6	25
33304	242501	2025-08-03	0	25
33305	242501	2025-08-04	1	26
33306	242501	2025-08-05	2	26
33307	242501	2025-08-06	3	26
33308	242501	2025-08-07	4	26
33309	242501	2025-08-08	5	26
33310	242501	2025-08-09	6	26
33311	242501	2025-08-10	0	26
33312	242501	2025-08-11	1	27
33313	242501	2025-08-12	2	27
33314	242501	2025-08-13	3	27
33315	242501	2025-08-14	4	27
33316	242501	2025-08-15	5	27
33317	242501	2025-08-16	6	27
33318	242501	2025-08-17	0	27
33319	242501	2025-08-18	1	28
33320	242501	2025-08-19	2	28
33321	242501	2025-08-20	3	28
33322	242501	2025-08-21	4	28
33323	242501	2025-08-22	5	28
33324	242501	2025-08-23	6	28
33325	242501	2025-08-24	0	28
33326	242501	2025-08-25	1	29
33327	242501	2025-08-26	2	29
33328	242501	2025-08-27	3	29
33329	242501	2025-08-28	4	29
33330	242501	2025-08-29	5	29
33331	242501	2025-08-30	6	29
33332	242501	2025-08-31	0	29
\.


--
-- Data for Name: sc_rasp18_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp18_groups (id, rasp18_id, group_id, subgroup) FROM stdin;
496301	412682	0	0
496302	412683	0	0
496303	412684	0	0
496304	412685	0	0
496305	412686	0	0
496306	412687	0	0
496307	412688	0	0
496308	412689	0	0
496309	412690	0	0
496310	412691	0	0
496311	412692	0	0
496312	412693	0	0
496313	412694	0	0
496314	412695	0	0
496315	412696	0	0
496316	412697	0	0
496317	412698	0	0
496318	412699	0	0
496319	412700	0	0
496320	412701	0	0
496321	412702	0	0
496322	412703	0	0
496323	412704	0	0
496324	412705	0	0
496325	412706	0	0
496326	412707	0	0
496327	412708	0	0
496328	412709	0	0
496329	412710	0	0
496330	412711	0	0
496331	412712	0	0
496332	412713	0	0
496333	412714	0	1
496334	412715	0	1
496335	412716	0	1
496336	412717	0	1
496337	412718	0	1
496338	412719	0	1
496339	412720	0	1
496340	412721	0	1
496341	412722	0	1
496342	412723	0	1
496343	412724	0	1
496344	412725	0	1
496345	412726	0	1
496346	412727	0	1
496347	412728	0	1
496348	412729	0	1
496349	412730	0	2
496350	412731	0	2
496351	412732	0	2
496352	412733	0	2
496353	412734	0	2
496354	412735	0	2
496355	412736	0	2
496356	412737	0	2
496357	412738	0	2
496358	412739	0	2
496359	412740	0	2
496360	412741	0	2
496361	412742	0	2
496362	412743	0	2
496363	412744	0	2
496364	412745	0	2
496365	412746	0	0
496366	412747	0	0
496367	412748	0	0
496368	412749	0	0
496369	412750	0	0
496370	412751	0	0
496371	412752	0	0
496372	412753	0	0
496373	412754	0	0
496374	412755	0	0
496375	412756	0	0
496376	412757	0	0
496377	412758	0	0
496378	412759	0	0
496379	412760	0	0
496380	412761	0	0
496381	412762	0	0
496382	412763	0	0
496383	412764	0	0
496384	412765	0	0
496385	412766	0	0
496386	412767	0	0
496387	412768	0	0
496388	412769	0	0
496389	412770	0	0
496390	412771	0	0
496391	412772	0	0
496392	412773	0	0
496393	412774	0	0
496394	412775	0	0
496395	412776	0	0
496396	412777	0	0
496397	412778	0	0
496398	412779	0	0
496399	412780	0	0
496400	412781	0	0
496401	412782	0	0
496402	412783	0	0
496403	412784	0	0
496404	412785	0	0
496405	412786	0	0
496406	412787	0	0
496407	412788	0	0
496408	412789	0	0
496409	412790	0	0
496410	412791	0	0
496411	412792	0	0
496412	412793	0	0
496413	412794	0	0
496414	412795	0	0
496415	412796	0	0
496416	412797	0	0
496417	412798	0	0
496418	412799	0	0
496419	412800	0	0
496420	412801	0	0
496421	412802	0	0
496422	412803	0	0
496423	412804	0	0
496424	412805	0	0
496425	412806	0	0
496426	412807	0	0
496427	412808	0	0
496428	412809	0	0
496429	412810	0	0
496430	412811	0	0
496431	412812	0	0
496432	412813	0	0
496433	412814	0	0
496434	412815	0	0
496435	412816	0	0
496436	412817	0	0
496437	412818	0	0
496438	412819	0	0
496439	412820	0	0
496440	412821	0	0
496441	412822	0	0
496442	412823	0	0
496443	412824	0	0
496444	412825	0	0
496445	412826	0	0
496446	412827	0	0
496447	412828	0	0
496448	412829	0	0
496449	412830	0	0
496450	412831	0	0
496451	412832	0	0
496452	412833	0	0
496453	412834	0	0
496454	412835	0	0
496455	412836	0	0
496456	412837	0	0
496457	412838	0	0
496458	412839	0	0
496459	412840	0	0
496460	412841	0	0
496461	412842	0	0
496462	412843	0	0
496463	412844	0	0
496464	412845	0	0
496465	412846	0	0
496466	412847	0	0
496467	412848	0	0
496468	412849	0	0
496469	412850	0	0
496470	412851	0	0
496471	412852	0	0
496472	412853	0	0
496473	412854	0	0
496474	412855	0	0
496475	412856	0	0
496476	412857	0	0
496477	412858	0	0
496478	412859	0	0
496479	412860	0	0
496480	412861	0	0
496481	412862	0	0
496482	412863	0	0
496483	412864	0	0
496484	412865	0	0
496485	412866	0	0
496486	412867	0	0
496487	412868	0	0
496488	412869	0	0
496489	412870	0	0
496490	412871	0	0
496491	412872	0	0
496492	412873	0	0
496493	412874	0	0
496494	412875	0	0
496495	412876	0	0
496496	412877	0	0
496497	412878	0	0
496498	412879	0	0
496499	412880	0	0
496500	412881	0	0
496501	412882	0	0
496502	412883	0	0
496503	412884	0	0
496504	412885	0	0
496505	412886	0	0
496506	412887	0	0
496507	412888	0	0
496508	412889	0	0
496509	412890	0	0
496510	412891	0	0
496511	412892	0	0
496512	412893	0	0
496513	412894	0	0
496514	412895	0	0
496515	412896	0	0
496516	412897	0	0
496517	412898	0	0
496518	412899	0	0
496519	412900	0	0
496520	412901	0	0
496521	412902	0	0
496522	412903	0	0
496523	412904	0	0
496524	412905	0	0
496525	412906	0	1
496526	412907	0	1
496527	412908	0	1
496528	412909	0	1
496529	412910	0	1
496530	412911	0	1
496531	412912	0	1
496532	412913	0	1
496533	412914	0	1
496534	412915	0	1
496535	412916	0	1
496536	412917	0	1
496537	412918	0	1
496538	412919	0	1
496539	412920	0	1
496540	412921	0	1
496541	412922	0	0
496542	412923	0	0
496543	412924	0	0
496544	412925	0	0
496545	412926	0	0
496546	412927	0	0
496547	412928	0	0
496548	412929	0	0
496549	412930	0	0
496550	412931	0	0
496551	412932	0	0
496552	412933	0	0
496553	412934	0	0
496554	412935	0	0
496555	412936	0	0
496556	412937	0	0
496557	412938	0	0
496558	412939	0	0
496559	412940	0	0
496560	412941	0	0
496561	412942	0	0
496562	412943	0	0
496563	412944	0	0
496564	412945	0	0
496565	412946	0	0
496566	412947	0	0
496567	412948	0	0
496568	412949	0	0
496569	412950	0	0
496570	412951	0	0
496571	412952	0	0
496572	412953	0	0
496573	412954	0	0
496574	412955	0	0
496575	412956	0	0
496576	412957	0	0
496577	412958	0	0
496578	412959	0	0
496579	412960	0	0
496580	412961	0	0
496581	412962	0	0
496582	412963	0	0
496583	412964	0	0
496584	412965	0	0
496585	412966	0	0
496586	412967	0	0
496587	412968	0	0
496588	412969	0	0
496589	412970	0	1
496590	412971	0	1
496591	412972	0	1
496592	412973	0	1
496593	412974	0	1
496594	412975	0	1
496595	412976	0	1
496596	412977	0	1
496597	412978	0	2
496598	412979	0	2
496599	412980	0	2
496600	412981	0	2
496601	412982	0	2
496602	412983	0	2
496603	412984	0	2
496604	412985	0	2
496605	412986	0	2
496606	412987	0	2
496607	412988	0	2
496608	412989	0	2
496609	412990	0	2
496610	412991	0	2
496611	412992	0	2
496612	412993	0	2
496613	412994	0	2
496614	412995	0	2
496615	412996	0	2
496616	412997	0	2
496617	412998	0	2
496618	412999	0	2
496619	413000	0	2
496620	413001	0	2
496621	413002	1	0
496622	413003	1	0
496623	413004	1	0
496624	413005	1	0
496625	413006	1	0
496626	413007	1	0
496627	413008	1	0
496628	413009	1	0
496629	413010	1	0
496630	413011	1	0
496631	413012	1	0
496632	413013	1	0
496633	413014	1	0
496634	413015	1	0
496635	413016	1	0
496636	413017	1	0
496637	413018	1	0
496638	413019	1	0
496639	413020	1	0
496640	413021	1	0
496641	413022	1	0
496642	413023	1	0
496643	413024	1	0
496644	413025	1	0
496645	413026	1	0
496646	413027	1	0
496647	413028	1	0
496648	413029	1	0
496649	413030	1	0
496650	413031	1	0
496651	413032	1	0
496652	413033	1	0
496653	413034	1	0
496654	413035	1	0
496655	413036	1	0
496656	413037	1	0
496657	413038	1	0
496658	413039	1	0
496659	413040	1	0
496660	413041	1	0
496661	413042	1	0
496662	413043	1	0
496663	413044	1	0
496664	413045	1	0
496665	413046	1	0
496666	413047	1	0
496667	413048	1	0
496668	413049	1	0
496669	413050	1	0
496670	413051	1	0
496671	413052	1	0
496672	413053	1	0
496673	413054	1	0
496674	413055	1	0
496675	413056	1	0
496676	413057	1	0
496677	413058	1	0
496678	413059	1	0
496679	413060	1	0
496680	413061	1	0
496681	413062	1	0
496682	413063	1	0
496683	413064	1	0
496684	413065	1	0
496685	413066	1	0
496686	413067	1	0
496687	413068	1	0
496688	413069	1	0
496689	413070	1	0
496690	413071	1	0
496691	413072	1	0
496692	413073	1	0
496693	413074	1	0
496694	413075	1	0
496695	413076	1	0
496696	413077	1	0
496697	413078	1	0
496698	413079	1	0
496699	413080	1	0
496700	413081	1	0
496701	413082	1	0
496702	413083	1	0
496703	413084	1	0
496704	413085	1	0
496705	413086	1	0
496706	413087	1	0
496707	413088	1	0
496708	413089	1	0
496709	413090	1	0
496710	413091	1	0
496711	413092	1	0
496712	413093	1	0
496713	413094	1	0
496714	413095	1	0
496715	413096	1	0
496716	413097	1	0
496717	412762	1	0
496718	412763	1	0
496719	412764	1	0
496720	412765	1	0
496721	412766	1	0
496722	412767	1	0
496723	412768	1	0
496724	412769	1	0
496725	412770	1	0
496726	412771	1	0
496727	412772	1	0
496728	412773	1	0
496729	412774	1	0
496730	412775	1	0
496731	412776	1	0
496732	412777	1	0
496733	412778	1	0
496734	412779	1	0
496735	412780	1	0
496736	412781	1	0
496737	412782	1	0
496738	412783	1	0
496739	412784	1	0
496740	412785	1	0
496741	412786	1	0
496742	412787	1	0
496743	412788	1	0
496744	412789	1	0
496745	412790	1	0
496746	412791	1	0
496747	412792	1	0
496748	412793	1	0
496749	413098	1	0
496750	413099	1	0
496751	413100	1	0
496752	413101	1	0
496753	413102	1	0
496754	413103	1	0
496755	413104	1	0
496756	413105	1	0
496757	413106	1	0
496758	413107	1	0
496759	413108	1	0
496760	413109	1	0
496761	413110	1	0
496762	413111	1	0
496763	413112	1	0
496764	413113	1	0
496765	413114	1	0
496766	413115	1	0
496767	413116	1	0
496768	413117	1	0
496769	413118	1	0
496770	413119	1	0
496771	413120	1	0
496772	413121	1	0
496773	413122	1	0
496774	413123	1	0
496775	413124	1	0
496776	413125	1	0
496777	413126	1	0
496778	413127	1	0
496779	413128	1	0
496780	413129	1	0
496781	412810	1	0
496782	412811	1	0
496783	412812	1	0
496784	412813	1	0
496785	412814	1	0
496786	412815	1	0
496787	412816	1	0
496788	412817	1	0
496789	412818	1	0
496790	412819	1	0
496791	412820	1	0
496792	412821	1	0
496793	412822	1	0
496794	412823	1	0
496795	412824	1	0
496796	412825	1	0
496797	412826	1	0
496798	412827	1	0
496799	412828	1	0
496800	412829	1	0
496801	412830	1	0
496802	412831	1	0
496803	412832	1	0
496804	412833	1	0
496805	412834	1	0
496806	412835	1	0
496807	412836	1	0
496808	412837	1	0
496809	412838	1	0
496810	412839	1	0
496811	412840	1	0
496812	412841	1	0
496813	413130	1	1
496814	413131	1	1
496815	413132	1	1
496816	413133	1	1
496817	413134	1	1
496818	413135	1	1
496819	413136	1	1
496820	413137	1	1
496821	413138	1	1
496822	413139	1	1
496823	413140	1	1
496824	413141	1	1
496825	413142	1	1
496826	413143	1	1
496827	413144	1	1
496828	413145	1	1
496829	413146	1	2
496830	413147	1	2
496831	413148	1	2
496832	413149	1	2
496833	413150	1	2
496834	413151	1	2
496835	413152	1	2
496836	413153	1	2
496837	413154	1	2
496838	413155	1	2
496839	413156	1	2
496840	413157	1	2
496841	413158	1	2
496842	413159	1	2
496843	413160	1	2
496844	413161	1	2
496845	412874	1	0
496846	412875	1	0
496847	412876	1	0
496848	412877	1	0
496849	412878	1	0
496850	412879	1	0
496851	412880	1	0
496852	412881	1	0
496853	412882	1	0
496854	412883	1	0
496855	412884	1	0
496856	412885	1	0
496857	412886	1	0
496858	412887	1	0
496859	412888	1	0
496860	412889	1	0
496861	413162	1	1
496862	413163	1	1
496863	413164	1	1
496864	413165	1	1
496865	413166	1	1
496866	413167	1	1
496867	413168	1	1
496868	413169	1	1
496869	413170	1	1
496870	413171	1	1
496871	413172	1	1
496872	413173	1	1
496873	413174	1	1
496874	413175	1	1
496875	413176	1	1
496876	413177	1	1
496877	412938	1	0
496878	412939	1	0
496879	412940	1	0
496880	412941	1	0
496881	412942	1	0
496882	412943	1	0
496883	412944	1	0
496884	412945	1	0
496885	412946	1	0
496886	412947	1	0
496887	412948	1	0
496888	412949	1	0
496889	412950	1	0
496890	412951	1	0
496891	412952	1	0
496892	412953	1	0
496893	412954	1	0
496894	412955	1	0
496895	412956	1	0
496896	412957	1	0
496897	412958	1	0
496898	412959	1	0
496899	412960	1	0
496900	412961	1	0
496901	412962	1	0
496902	412963	1	0
496903	412964	1	0
496904	412965	1	0
496905	412966	1	0
496906	412967	1	0
496907	412968	1	0
496908	412969	1	0
496909	413178	1	2
496910	413179	1	2
496911	413180	1	2
496912	413181	1	2
496913	413182	1	2
496914	413183	1	2
496915	413184	1	2
496916	413185	1	2
496917	413186	1	2
496918	413187	1	2
496919	413188	1	2
496920	413189	1	2
496921	413190	1	2
496922	413191	1	2
496923	413192	1	2
496924	413193	1	2
496925	413194	1	0
496926	413195	1	0
496927	413196	1	0
496928	413197	1	0
496929	413198	1	0
496930	413199	1	0
496931	413200	1	0
496932	413201	1	0
496933	413202	2	1
496934	413203	2	1
496935	413204	2	1
496936	413205	2	1
496937	413206	2	1
496938	413207	2	1
496939	413208	2	1
496940	413209	2	1
496941	413210	2	1
496942	413211	2	1
496943	413212	2	1
496944	413213	2	1
496945	413214	2	1
496946	413215	2	1
496947	413216	2	1
496948	413217	2	1
496949	413218	2	2
496950	413219	2	2
496951	413220	2	2
496952	413221	2	2
496953	413222	2	2
496954	413223	2	2
496955	413224	2	2
496956	413225	2	2
496957	413226	2	2
496958	413227	2	2
496959	413228	2	2
496960	413229	2	2
496961	413230	2	2
496962	413231	2	2
496963	413232	2	2
496964	413233	2	2
496965	413234	2	1
496966	413235	2	1
496967	413236	2	1
496968	413237	2	1
496969	413238	2	1
496970	413239	2	1
496971	413240	2	1
496972	413241	2	1
496973	413242	2	1
496974	413243	2	1
496975	413244	2	1
496976	413245	2	1
496977	413246	2	1
496978	413247	2	1
496979	413248	2	1
496980	413249	2	1
496981	413250	2	2
496982	413251	2	2
496983	413252	2	2
496984	413253	2	2
496985	413254	2	2
496986	413255	2	2
496987	413256	2	2
496988	413257	2	2
496989	413258	2	2
496990	413259	2	2
496991	413260	2	2
496992	413261	2	2
496993	413262	2	2
496994	413263	2	2
496995	413264	2	2
496996	413265	2	2
496997	413266	2	0
496998	413267	2	0
496999	413268	2	0
497000	413269	2	0
497001	413270	2	0
497002	413271	2	0
497003	413272	2	0
497004	413273	2	0
497005	413274	2	0
497006	413275	2	0
497007	413276	2	0
497008	413277	2	0
497009	413278	2	0
497010	413279	2	0
497011	413280	2	0
497012	413281	2	0
497013	413282	2	0
497014	413283	2	0
497015	413284	2	0
497016	413285	2	0
497017	413286	2	0
497018	413287	2	0
497019	413288	2	0
497020	413289	2	0
497021	413290	2	0
497022	413291	2	0
497023	413292	2	0
497024	413293	2	0
497025	413294	2	0
497026	413295	2	0
497027	413296	2	0
497028	413297	2	0
497029	412762	2	0
497030	412763	2	0
497031	412764	2	0
497032	412765	2	0
497033	412766	2	0
497034	412767	2	0
497035	412768	2	0
497036	412769	2	0
497037	412770	2	0
497038	412771	2	0
497039	412772	2	0
497040	412773	2	0
497041	412774	2	0
497042	412775	2	0
497043	412776	2	0
497044	412777	2	0
497045	412778	2	0
497046	412779	2	0
497047	412780	2	0
497048	412781	2	0
497049	412782	2	0
497050	412783	2	0
497051	412784	2	0
497052	412785	2	0
497053	412786	2	0
497054	412787	2	0
497055	412788	2	0
497056	412789	2	0
497057	412790	2	0
497058	412791	2	0
497059	412792	2	0
497060	412793	2	0
497061	413298	2	0
497062	413299	2	0
497063	413300	2	0
497064	413301	2	0
497065	413302	2	0
497066	413303	2	0
497067	413304	2	0
497068	413305	2	0
497069	413306	2	0
497070	413307	2	0
497071	413308	2	0
497072	413309	2	0
497073	413310	2	0
497074	413311	2	0
497075	413312	2	0
497076	413313	2	0
497077	413314	2	0
497078	413315	2	0
497079	413316	2	0
497080	413317	2	0
497081	413318	2	0
497082	413319	2	0
497083	413320	2	0
497084	413321	2	0
497085	413322	2	0
497086	413323	2	0
497087	413324	2	0
497088	413325	2	0
497089	413326	2	0
497090	413327	2	0
497091	413328	2	0
497092	413329	2	0
497093	412810	2	0
497094	412811	2	0
497095	412812	2	0
497096	412813	2	0
497097	412814	2	0
497098	412815	2	0
497099	412816	2	0
497100	412817	2	0
497101	412818	2	0
497102	412819	2	0
497103	412820	2	0
497104	412821	2	0
497105	412822	2	0
497106	412823	2	0
497107	412824	2	0
497108	412825	2	0
497109	412826	2	0
497110	412827	2	0
497111	412828	2	0
497112	412829	2	0
497113	412830	2	0
497114	412831	2	0
497115	412832	2	0
497116	412833	2	0
497117	412834	2	0
497118	412835	2	0
497119	412836	2	0
497120	412837	2	0
497121	412838	2	0
497122	412839	2	0
497123	412840	2	0
497124	412841	2	0
497125	413330	2	0
497126	413331	2	0
497127	413332	2	0
497128	413333	2	0
497129	413334	2	0
497130	413335	2	0
497131	413336	2	0
497132	413337	2	0
497133	413338	2	0
497134	413339	2	0
497135	413340	2	0
497136	413341	2	0
497137	413342	2	0
497138	413343	2	0
497139	413344	2	0
497140	413345	2	0
497141	413346	2	0
497142	413347	2	0
497143	413348	2	0
497144	413349	2	0
497145	413350	2	0
497146	413351	2	0
497147	413352	2	0
497148	413353	2	0
497149	413354	2	0
497150	413355	2	0
497151	413356	2	0
497152	413357	2	0
497153	413358	2	0
497154	413359	2	0
497155	413360	2	0
497156	413361	2	0
497157	412874	2	0
497158	412875	2	0
497159	412876	2	0
497160	412877	2	0
497161	412878	2	0
497162	412879	2	0
497163	412880	2	0
497164	412881	2	0
497165	412882	2	0
497166	412883	2	0
497167	412884	2	0
497168	412885	2	0
497169	412886	2	0
497170	412887	2	0
497171	412888	2	0
497172	412889	2	0
497173	413362	2	0
497174	413363	2	0
497175	413364	2	0
497176	413365	2	0
497177	413366	2	0
497178	413367	2	0
497179	413368	2	0
497180	413369	2	0
497181	413370	2	0
497182	413371	2	0
497183	413372	2	0
497184	413373	2	0
497185	413374	2	0
497186	413375	2	0
497187	413376	2	0
497188	413377	2	0
497189	413378	2	0
497190	413379	2	0
497191	413380	2	0
497192	413381	2	0
497193	413382	2	0
497194	413383	2	0
497195	413384	2	0
497196	413385	2	0
497197	413386	2	0
497198	413387	2	0
497199	413388	2	0
497200	413389	2	0
497201	413390	2	0
497202	413391	2	0
497203	413392	2	0
497204	413393	2	0
497205	412938	2	0
497206	412939	2	0
497207	412940	2	0
497208	412941	2	0
497209	412942	2	0
497210	412943	2	0
497211	412944	2	0
497212	412945	2	0
497213	412946	2	0
497214	412947	2	0
497215	412948	2	0
497216	412949	2	0
497217	412950	2	0
497218	412951	2	0
497219	412952	2	0
497220	412953	2	0
497221	412954	2	0
497222	412955	2	0
497223	412956	2	0
497224	412957	2	0
497225	412958	2	0
497226	412959	2	0
497227	412960	2	0
497228	412961	2	0
497229	412962	2	0
497230	412963	2	0
497231	412964	2	0
497232	412965	2	0
497233	412966	2	0
497234	412967	2	0
497235	412968	2	0
497236	412969	2	0
497237	413194	2	0
497238	413195	2	0
497239	413196	2	0
497240	413197	2	0
497241	413198	2	0
497242	413199	2	0
497243	413200	2	0
497244	413201	2	0
497245	413394	3	1
497246	413395	3	1
497247	413396	3	1
497248	413397	3	1
497249	413398	3	1
497250	413399	3	1
497251	413400	3	1
497252	413401	3	1
497253	413402	3	1
497254	413403	3	1
497255	413404	3	1
497256	413405	3	1
497257	413406	3	1
497258	413407	3	1
497259	413408	3	1
497260	413409	3	1
497261	413410	3	2
497262	413411	3	2
497263	413412	3	2
497264	413413	3	2
497265	413414	3	2
497266	413415	3	2
497267	413416	3	2
497268	413417	3	2
497269	413418	3	2
497270	413419	3	2
497271	413420	3	2
497272	413421	3	2
497273	413422	3	2
497274	413423	3	2
497275	413424	3	2
497276	413425	3	2
497277	413426	3	0
497278	413427	3	0
497279	413428	3	0
497280	413429	3	0
497281	413430	3	0
497282	413431	3	0
497283	413432	3	0
497284	413433	3	0
497285	413434	3	0
497286	413435	3	0
497287	413436	3	0
497288	413437	3	0
497289	413438	3	0
497290	413439	3	0
497291	413440	3	0
497292	413441	3	0
497293	413442	3	0
497294	413443	3	0
497295	413444	3	0
497296	413445	3	0
497297	413446	3	0
497298	413447	3	0
497299	413448	3	0
497300	413449	3	0
497301	413450	3	0
497302	413451	3	0
497303	413452	3	0
497304	413453	3	0
497305	413454	3	0
497306	413455	3	0
497307	413456	3	0
497308	413457	3	0
497309	412762	3	0
497310	412763	3	0
497311	412764	3	0
497312	412765	3	0
497313	412766	3	0
497314	412767	3	0
497315	412768	3	0
497316	412769	3	0
497317	412770	3	0
497318	412771	3	0
497319	412772	3	0
497320	412773	3	0
497321	412774	3	0
497322	412775	3	0
497323	412776	3	0
497324	412777	3	0
497325	412778	3	0
497326	412779	3	0
497327	412780	3	0
497328	412781	3	0
497329	412782	3	0
497330	412783	3	0
497331	412784	3	0
497332	412785	3	0
497333	412786	3	0
497334	412787	3	0
497335	412788	3	0
497336	412789	3	0
497337	412790	3	0
497338	412791	3	0
497339	412792	3	0
497340	412793	3	0
497341	413458	3	0
497342	413459	3	0
497343	413460	3	0
497344	413461	3	0
497345	413462	3	0
497346	413463	3	0
497347	413464	3	0
497348	413465	3	0
497349	413466	3	0
497350	413467	3	0
497351	413468	3	0
497352	413469	3	0
497353	413470	3	0
497354	413471	3	0
497355	413472	3	0
497356	413473	3	0
497357	413474	3	0
497358	413475	3	0
497359	413476	3	0
497360	413477	3	0
497361	413478	3	0
497362	413479	3	0
497363	413480	3	0
497364	413481	3	0
497365	413482	3	0
497366	413483	3	0
497367	413484	3	0
497368	413485	3	0
497369	413486	3	0
497370	413487	3	0
497371	413488	3	0
497372	413489	3	0
497373	412810	3	0
497374	412811	3	0
497375	412812	3	0
497376	412813	3	0
497377	412814	3	0
497378	412815	3	0
497379	412816	3	0
497380	412817	3	0
497381	412818	3	0
497382	412819	3	0
497383	412820	3	0
497384	412821	3	0
497385	412822	3	0
497386	412823	3	0
497387	412824	3	0
497388	412825	3	0
497389	412826	3	0
497390	412827	3	0
497391	412828	3	0
497392	412829	3	0
497393	412830	3	0
497394	412831	3	0
497395	412832	3	0
497396	412833	3	0
497397	412834	3	0
497398	412835	3	0
497399	412836	3	0
497400	412837	3	0
497401	412838	3	0
497402	412839	3	0
497403	412840	3	0
497404	412841	3	0
497405	413490	3	0
497406	413491	3	0
497407	413492	3	0
497408	413493	3	0
497409	413494	3	0
497410	413495	3	0
497411	413496	3	0
497412	413497	3	0
497413	413498	3	0
497414	413499	3	0
497415	413500	3	0
497416	413501	3	0
497417	413502	3	0
497418	413503	3	0
497419	413504	3	0
497420	413505	3	0
497421	413506	3	0
497422	413507	3	0
497423	413508	3	0
497424	413509	3	0
497425	413510	3	0
497426	413511	3	0
497427	413512	3	0
497428	413513	3	0
497429	413514	3	0
497430	413515	3	0
497431	413516	3	0
497432	413517	3	0
497433	413518	3	0
497434	413519	3	0
497435	413520	3	0
497436	413521	3	0
497437	412874	3	0
497438	412875	3	0
497439	412876	3	0
497440	412877	3	0
497441	412878	3	0
497442	412879	3	0
497443	412880	3	0
497444	412881	3	0
497445	412882	3	0
497446	412883	3	0
497447	412884	3	0
497448	412885	3	0
497449	412886	3	0
497450	412887	3	0
497451	412888	3	0
497452	412889	3	0
497453	413522	3	0
497454	413523	3	0
497455	413524	3	0
497456	413525	3	0
497457	413526	3	0
497458	413527	3	0
497459	413528	3	0
497460	413529	3	0
497461	413530	3	0
497462	413531	3	0
497463	413532	3	0
497464	413533	3	0
497465	413534	3	0
497466	413535	3	0
497467	413536	3	0
497468	413537	3	0
497469	413538	3	0
497470	413539	3	0
497471	413540	3	0
497472	413541	3	0
497473	413542	3	0
497474	413543	3	0
497475	413544	3	0
497476	413545	3	0
497477	413546	3	0
497478	413547	3	0
497479	413548	3	0
497480	413549	3	0
497481	413550	3	0
497482	413551	3	0
497483	413552	3	0
497484	413553	3	0
497485	412938	3	0
497486	412939	3	0
497487	412940	3	0
497488	412941	3	0
497489	412942	3	0
497490	412943	3	0
497491	412944	3	0
497492	412945	3	0
497493	412946	3	0
497494	412947	3	0
497495	412948	3	0
497496	412949	3	0
497497	412950	3	0
497498	412951	3	0
497499	412952	3	0
497500	412953	3	0
497501	412954	3	0
497502	412955	3	0
497503	412956	3	0
497504	412957	3	0
497505	412958	3	0
497506	412959	3	0
497507	412960	3	0
497508	412961	3	0
497509	412962	3	0
497510	412963	3	0
497511	412964	3	0
497512	412965	3	0
497513	412966	3	0
497514	412967	3	0
497515	412968	3	0
497516	412969	3	0
497517	413194	3	0
497518	413195	3	0
497519	413196	3	0
497520	413197	3	0
497521	413198	3	0
497522	413199	3	0
497523	413200	3	0
497524	413201	3	0
497525	413554	3	1
497526	413555	3	1
497527	413556	3	1
497528	413557	3	1
497529	413558	3	1
497530	413559	3	1
497531	413560	3	1
497532	413561	3	1
497533	413562	3	1
497534	413563	3	1
497535	413564	3	1
497536	413565	3	1
497537	413566	3	1
497538	413567	3	1
497539	413568	3	1
497540	413569	3	1
497541	413570	3	2
497542	413571	3	2
497543	413572	3	2
497544	413573	3	2
497545	413574	3	2
497546	413575	3	2
497547	413576	3	2
497548	413577	3	2
497549	413578	3	2
497550	413579	3	2
497551	413580	3	2
497552	413581	3	2
497553	413582	3	2
497554	413583	3	2
497555	413584	3	2
497556	413585	3	2
497557	413586	4	0
497558	413587	4	0
497559	413588	4	0
497560	413589	4	0
497561	413590	4	0
497562	413591	4	0
497563	413592	4	0
497564	413593	4	0
497565	413594	4	0
497566	413595	4	0
497567	413596	4	0
497568	413597	4	0
497569	413598	4	0
497570	413599	4	0
497571	413600	4	0
497572	413601	4	0
497573	413602	4	0
497574	413603	4	0
497575	413604	4	0
497576	413605	4	0
497577	413606	4	0
497578	413607	4	0
497579	413608	4	0
497580	413609	4	0
497581	413610	4	0
497582	413611	4	0
497583	413612	4	0
497584	413613	4	0
497585	413614	4	0
497586	413615	4	0
497587	413616	4	0
497588	413617	4	0
497589	413618	4	0
497590	413619	4	0
497591	413620	4	0
497592	413621	4	0
497593	413622	4	0
497594	413623	4	0
497595	413624	4	0
497596	413625	4	0
497597	413626	4	0
497598	413627	4	0
497599	413628	4	0
497600	413629	4	0
497601	413630	4	0
497602	413631	4	0
497603	413632	4	0
497604	413633	4	0
497605	413634	4	0
497606	413635	4	0
497607	413636	4	0
497608	413637	4	0
497609	413638	4	0
497610	413639	4	0
497611	413640	4	0
497612	413641	4	0
497613	413642	4	0
497614	413643	4	0
497615	413644	4	0
497616	413645	4	0
497617	413646	4	0
497618	413647	4	0
497619	413648	4	0
497620	413649	4	0
497621	413650	4	0
497622	413651	4	0
497623	413652	4	0
497624	413653	4	0
497625	413654	4	0
497626	413655	4	0
497627	413656	4	0
497628	413657	4	0
497629	413658	4	0
497630	413659	4	0
497631	413660	4	0
497632	413661	4	0
497633	413662	4	0
497634	413663	4	0
497635	413664	4	0
497636	413665	4	0
497637	413666	4	0
497638	413667	4	0
497639	413668	4	0
497640	413669	4	0
497641	413670	4	0
497642	413671	4	0
497643	413672	4	0
497644	413673	4	0
497645	413674	4	0
497646	413675	4	0
497647	413676	4	0
497648	413677	4	0
497649	413678	4	0
497650	413679	4	0
497651	413680	4	0
497652	413681	4	0
497653	413682	4	0
497654	413683	4	0
497655	413684	4	0
497656	413685	4	0
497657	413686	4	0
497658	413687	4	0
497659	413688	4	0
497660	413689	4	0
497661	413690	4	0
497662	413691	4	0
497663	413692	4	0
497664	413693	4	0
497665	413694	4	0
497666	413695	4	0
497667	413696	4	0
497668	413697	4	0
497669	413698	4	0
497670	413699	4	0
497671	413700	4	0
497672	413701	4	0
497673	413702	4	0
497674	413703	4	0
497675	413704	4	0
497676	413705	4	0
497677	413706	4	0
497678	413707	4	0
497679	413708	4	0
497680	413709	4	0
497681	413710	4	0
497682	413711	4	0
497683	413712	4	0
497684	413713	4	0
497685	413714	4	0
497686	413715	4	0
497687	413716	4	0
497688	413717	4	0
497689	413718	4	0
497690	413719	4	0
497691	413720	4	0
497692	413721	4	0
497693	413722	4	0
497694	413723	4	0
497695	413724	4	0
497696	413725	4	0
497697	413726	4	0
497698	413727	4	0
497699	413728	4	0
497700	413729	4	0
497701	413730	4	0
497702	413731	4	0
497703	413732	4	0
497704	413733	4	0
497705	413734	4	0
497706	413735	4	0
497707	413736	4	0
497708	413737	4	0
497709	413738	4	0
497710	413739	4	0
497711	413740	4	0
497712	413741	4	0
497713	413742	4	0
497714	413743	4	0
497715	413744	4	0
497716	413745	4	0
497717	413746	4	0
497718	413747	4	0
497719	413748	4	0
497720	413749	4	0
497721	413750	4	0
497722	413751	4	0
497723	413752	4	0
497724	413753	4	0
497725	413754	4	0
497726	413755	4	0
497727	413756	4	0
497728	413757	4	0
497729	413758	4	0
497730	413759	4	0
497731	413760	4	0
497732	413761	4	0
497733	413762	4	0
497734	413763	4	0
497735	413764	4	0
497736	413765	4	0
497737	413766	4	0
497738	413767	4	0
497739	413768	4	0
497740	413769	4	0
497741	413770	4	0
497742	413771	4	0
497743	413772	4	0
497744	413773	4	0
497745	413774	4	0
497746	413775	4	0
497747	413776	4	0
497748	413777	4	0
497749	413778	4	0
497750	413779	4	0
497751	413780	4	0
497752	413781	4	0
497753	413782	4	0
497754	413783	4	0
497755	413784	4	0
497756	413785	4	0
497757	413786	4	0
497758	413787	4	0
497759	413788	4	0
497760	413789	4	0
497761	413790	4	0
497762	413791	4	0
497763	413792	4	0
497764	413793	4	0
497765	413794	4	0
497766	413795	4	0
497767	413796	4	0
497768	413797	4	0
497769	413798	4	0
497770	413799	4	0
497771	413800	4	0
497772	413801	4	0
497773	413802	4	0
497774	413803	4	0
497775	413804	4	0
497776	413805	4	0
497777	413806	4	0
497778	413807	4	0
497779	413808	4	0
497780	413809	4	0
497781	413810	4	0
497782	413811	4	0
497783	413812	4	0
497784	413813	4	0
497785	413814	4	0
497786	413815	4	0
497787	413816	4	0
497788	413817	4	0
497789	413818	4	0
497790	413819	4	0
497791	413820	4	0
497792	413821	4	0
497793	413822	4	0
497794	413823	4	0
497795	413824	4	0
497796	413825	4	0
497797	413826	4	0
497798	413827	4	0
497799	413828	4	0
497800	413829	4	0
497801	413830	4	0
497802	413831	4	0
497803	413832	4	0
497804	413833	4	0
497805	413834	4	0
497806	413835	4	0
497807	413836	4	0
497808	413837	4	0
497809	413838	4	0
497810	413839	4	0
497811	413840	4	0
497812	413841	4	0
497813	413842	4	0
497814	413843	4	0
497815	413844	4	0
497816	413845	4	0
497817	413846	4	0
497818	413847	4	0
497819	413848	4	0
497820	413849	4	0
497821	413850	4	0
497822	413851	4	0
497823	413852	4	0
497824	413853	4	0
497825	413854	4	0
497826	413855	4	0
497827	413856	4	0
497828	413857	4	0
497829	413586	5	0
497830	413587	5	0
497831	413588	5	0
497832	413589	5	0
497833	413590	5	0
497834	413591	5	0
497835	413592	5	0
497836	413593	5	0
497837	413594	5	0
497838	413595	5	0
497839	413596	5	0
497840	413597	5	0
497841	413598	5	0
497842	413599	5	0
497843	413600	5	0
497844	413601	5	0
497845	413858	5	0
497846	413859	5	0
497847	413860	5	0
497848	413861	5	0
497849	413862	5	0
497850	413863	5	0
497851	413864	5	0
497852	413865	5	0
497853	413866	5	0
497854	413867	5	0
497855	413868	5	0
497856	413869	5	0
497857	413870	5	0
497858	413871	5	0
497859	413872	5	0
497860	413873	5	0
497861	413874	5	0
497862	413875	5	0
497863	413876	5	0
497864	413877	5	0
497865	413878	5	0
497866	413879	5	0
497867	413880	5	0
497868	413881	5	0
497869	413882	5	0
497870	413883	5	0
497871	413884	5	0
497872	413885	5	0
497873	413886	5	0
497874	413887	5	0
497875	413888	5	0
497876	413889	5	0
497877	413890	5	0
497878	413891	5	0
497879	413892	5	0
497880	413893	5	0
497881	413894	5	0
497882	413895	5	0
497883	413896	5	0
497884	413897	5	0
497885	413898	5	0
497886	413899	5	0
497887	413900	5	0
497888	413901	5	0
497889	413902	5	0
497890	413903	5	0
497891	413904	5	0
497892	413905	5	0
497893	413666	5	0
497894	413667	5	0
497895	413668	5	0
497896	413669	5	0
497897	413670	5	0
497898	413671	5	0
497899	413672	5	0
497900	413673	5	0
497901	413674	5	0
497902	413675	5	0
497903	413676	5	0
497904	413677	5	0
497905	413678	5	0
497906	413679	5	0
497907	413680	5	0
497908	413681	5	0
497909	413906	5	0
497910	413907	5	0
497911	413908	5	0
497912	413909	5	0
497913	413910	5	0
497914	413911	5	0
497915	413912	5	0
497916	413913	5	0
497917	413914	5	0
497918	413915	5	0
497919	413916	5	0
497920	413917	5	0
497921	413918	5	0
497922	413919	5	0
497923	413920	5	0
497924	413921	5	0
497925	413922	5	0
497926	413923	5	0
497927	413924	5	0
497928	413925	5	0
497929	413926	5	0
497930	413927	5	0
497931	413928	5	0
497932	413929	5	0
497933	413698	5	0
497934	413699	5	0
497935	413700	5	0
497936	413701	5	0
497937	413702	5	0
497938	413703	5	0
497939	413704	5	0
497940	413705	5	0
497941	413930	5	0
497942	413931	5	0
497943	413932	5	0
497944	413933	5	0
497945	413934	5	0
497946	413935	5	0
497947	413936	5	0
497948	413937	5	0
497949	413938	5	0
497950	413939	5	0
497951	413940	5	0
497952	413941	5	0
497953	413942	5	0
497954	413943	5	0
497955	413944	5	0
497956	413945	5	0
497957	413946	5	0
497958	413947	5	0
497959	413948	5	0
497960	413949	5	0
497961	413950	5	0
497962	413951	5	0
497963	413952	5	0
497964	413953	5	0
497965	413954	5	0
497966	413955	5	0
497967	413956	5	0
497968	413957	5	0
497969	413958	5	0
497970	413959	5	0
497971	413960	5	0
497972	413961	5	0
497973	413962	5	0
497974	413963	5	0
497975	413964	5	0
497976	413965	5	0
497977	413966	5	0
497978	413967	5	0
497979	413968	5	0
497980	413969	5	0
497981	413746	5	0
497982	413747	5	0
497983	413748	5	0
497984	413749	5	0
497985	413750	5	0
497986	413751	5	0
497987	413752	5	0
497988	413753	5	0
497989	413754	5	0
497990	413755	5	0
497991	413756	5	0
497992	413757	5	0
497993	413758	5	0
497994	413759	5	0
497995	413760	5	0
497996	413761	5	0
497997	413762	5	0
497998	413763	5	0
497999	413764	5	0
498000	413765	5	0
498001	413766	5	0
498002	413767	5	0
498003	413768	5	0
498004	413769	5	0
498005	413770	5	0
498006	413771	5	0
498007	413772	5	0
498008	413773	5	0
498009	413774	5	0
498010	413775	5	0
498011	413776	5	0
498012	413777	5	0
498013	413970	5	0
498014	413971	5	0
498015	413972	5	0
498016	413973	5	0
498017	413974	5	0
498018	413975	5	0
498019	413976	5	0
498020	413977	5	0
498021	413786	5	0
498022	413787	5	0
498023	413788	5	0
498024	413789	5	0
498025	413790	5	0
498026	413791	5	0
498027	413792	5	0
498028	413793	5	0
498029	413794	5	0
498030	413795	5	0
498031	413796	5	0
498032	413797	5	0
498033	413798	5	0
498034	413799	5	0
498035	413800	5	0
498036	413801	5	0
498037	413978	5	0
498038	413979	5	0
498039	413980	5	0
498040	413981	5	0
498041	413982	5	0
498042	413983	5	0
498043	413984	5	0
498044	413985	5	0
498045	413986	5	0
498046	413987	5	0
498047	413988	5	0
498048	413989	5	0
498049	413990	5	0
498050	413991	5	0
498051	413992	5	0
498052	413993	5	0
498053	413994	5	0
498054	413995	5	0
498055	413996	5	0
498056	413997	5	0
498057	413998	5	0
498058	413999	5	0
498059	414000	5	0
498060	414001	5	0
498061	414002	5	0
498062	414003	5	0
498063	414004	5	0
498064	414005	5	0
498065	414006	5	0
498066	414007	5	0
498067	414008	5	0
498068	414009	5	0
498069	413818	5	0
498070	413819	5	0
498071	413820	5	0
498072	413821	5	0
498073	413822	5	0
498074	413823	5	0
498075	413824	5	0
498076	413825	5	0
498077	414010	5	0
498078	414011	5	0
498079	414012	5	0
498080	414013	5	0
498081	414014	5	0
498082	414015	5	0
498083	414016	5	0
498084	414017	5	0
498085	414018	5	0
498086	414019	5	0
498087	414020	5	0
498088	414021	5	0
498089	414022	5	0
498090	414023	5	0
498091	414024	5	0
498092	414025	5	0
498093	414026	5	0
498094	414027	5	0
498095	414028	5	0
498096	414029	5	0
498097	414030	5	0
498098	414031	5	0
498099	414032	5	0
498100	414033	5	0
498101	414034	6	0
498102	414035	6	0
498103	414036	6	0
498104	414037	6	0
498105	414038	6	0
498106	414039	6	0
498107	414040	6	0
498108	414041	6	0
498109	414042	6	0
498110	414043	6	0
498111	414044	6	0
498112	414045	6	0
498113	414046	6	0
498114	414047	6	0
498115	414048	6	0
498116	414049	6	0
498117	414050	6	0
498118	414051	6	0
498119	414052	6	0
498120	414053	6	0
498121	414054	6	0
498122	414055	6	0
498123	414056	6	0
498124	414057	6	0
498125	414058	6	0
498126	414059	6	0
498127	414060	6	0
498128	414061	6	0
498129	414062	6	0
498130	414063	6	0
498131	414064	6	0
498132	414065	6	0
498133	414066	6	0
498134	414067	6	0
498135	414068	6	0
498136	414069	6	0
498137	414070	6	0
498138	414071	6	0
498139	414072	6	0
498140	414073	6	0
498141	414074	6	0
498142	414075	6	0
498143	414076	6	0
498144	414077	6	0
498145	414078	6	0
498146	414079	6	0
498147	414080	6	0
498148	414081	6	0
498149	414082	6	0
498150	414083	6	0
498151	414084	6	0
498152	414085	6	0
498153	414086	6	0
498154	414087	6	0
498155	414088	6	0
498156	414089	6	0
498157	414090	6	0
498158	414091	6	0
498159	414092	6	0
498160	414093	6	0
498161	414094	6	0
498162	414095	6	0
498163	414096	6	0
498164	414097	6	0
498165	414098	6	0
498166	414099	6	0
498167	414100	6	0
498168	414101	6	0
498169	414102	6	0
498170	414103	6	0
498171	414104	6	0
498172	414105	6	0
498173	414106	6	0
498174	414107	6	0
498175	414108	6	0
498176	414109	6	0
498177	414110	6	0
498178	414111	6	0
498179	414112	6	0
498180	414113	6	0
498181	414114	6	0
498182	414115	6	0
498183	414116	6	0
498184	414117	6	0
498185	414118	6	0
498186	414119	6	0
498187	414120	6	0
498188	414121	6	0
498189	414122	6	0
498190	414123	6	0
498191	414124	6	0
498192	414125	6	0
498193	414126	6	0
498194	414127	6	0
498195	414128	6	0
498196	414129	6	0
498197	414130	6	0
498198	414131	6	0
498199	414132	6	0
498200	414133	6	0
498201	414134	6	0
498202	414135	6	0
498203	414136	6	0
498204	414137	6	0
498205	414138	6	0
498206	414139	6	0
498207	414140	6	0
498208	414141	6	0
498209	414142	6	0
498210	414143	6	0
498211	414144	6	0
498212	414145	6	0
498213	414146	6	0
498214	414147	6	0
498215	414148	6	0
498216	414149	6	0
498217	414150	6	0
498218	414151	6	0
498219	414152	6	0
498220	414153	6	0
498221	414154	6	0
498222	414155	6	0
498223	414156	6	0
498224	414157	6	0
498225	414158	6	0
498226	414159	6	0
498227	414160	6	0
498228	414161	6	0
498229	414162	6	0
498230	414163	6	0
498231	414164	6	0
498232	414165	6	0
498233	414166	6	0
498234	414167	6	0
498235	414168	6	0
498236	414169	6	0
498237	414170	6	0
498238	414171	6	0
498239	414172	6	0
498240	414173	6	0
498241	414174	6	0
498242	414175	6	0
498243	414176	6	0
498244	414177	6	0
498245	414178	6	0
498246	414179	6	0
498247	414180	6	0
498248	414181	6	0
498249	414182	6	0
498250	414183	6	0
498251	414184	6	0
498252	414185	6	0
498253	414186	6	0
498254	414187	6	0
498255	414188	6	0
498256	414189	6	0
498257	414190	6	0
498258	414191	6	0
498259	414192	6	0
498260	414193	6	0
498261	414194	6	0
498262	414195	6	0
498263	414196	6	0
498264	414197	6	0
498265	414198	6	0
498266	414199	6	0
498267	414200	6	0
498268	414201	6	0
498269	414202	6	0
498270	414203	6	0
498271	414204	6	0
498272	414205	6	0
498273	414206	6	0
498274	414207	6	0
498275	414208	6	0
498276	414209	6	0
498277	414210	6	0
498278	414211	6	0
498279	414212	6	0
498280	414213	6	0
498281	414214	6	0
498282	414215	6	0
498283	414216	6	0
498284	414217	6	0
498285	414218	6	0
498286	414219	6	0
498287	414220	6	0
498288	414221	6	0
498289	414222	6	0
498290	414223	6	0
498291	414224	6	0
498292	414225	6	0
498293	414226	6	0
498294	414227	6	0
498295	414228	6	0
498296	414229	6	0
498297	414230	6	0
498298	414231	6	0
498299	414232	6	0
498300	414233	6	0
498301	414234	6	0
498302	414235	6	0
498303	414236	6	0
498304	414237	6	0
498305	414238	6	0
498306	414239	6	0
498307	414240	6	0
498308	414241	6	0
498309	414242	6	0
498310	414243	6	0
498311	414244	6	0
498312	414245	6	0
498313	414246	6	0
498314	414247	6	0
498315	414248	6	0
498316	414249	6	0
498317	414250	6	0
498318	414251	6	0
498319	414252	6	0
498320	414253	6	0
498321	414254	6	0
498322	414255	6	0
498323	414256	6	0
498324	414257	6	0
498325	414258	6	0
498326	414259	6	0
498327	414260	6	0
498328	414261	6	0
498329	414262	6	0
498330	414263	6	0
498331	414264	6	0
498332	414265	6	0
498333	414266	6	0
498334	414267	6	0
498335	414268	6	0
498336	414269	6	0
498337	414270	6	0
498338	414271	6	0
498339	414272	6	0
498340	414273	6	0
498341	414274	6	0
498342	414275	6	0
498343	414276	6	0
498344	414277	6	0
498345	414278	6	0
498346	414279	6	0
498347	414280	6	0
498348	414281	6	0
498349	414282	6	0
498350	414283	6	0
498351	414284	6	0
498352	414285	6	0
498353	414286	6	0
498354	414287	6	0
498355	414288	6	0
498356	414289	6	0
498357	414290	6	0
498358	414291	6	0
498359	414292	6	0
498360	414293	6	0
498361	414294	6	0
498362	414295	6	0
498363	414296	6	0
498364	414297	6	0
498365	414298	6	0
498366	414299	6	0
498367	414300	6	0
498368	414301	6	0
498369	414302	6	0
498370	414303	6	0
498371	414304	6	0
498372	414305	6	0
498373	414306	6	0
498374	414307	6	0
498375	414308	6	0
498376	414309	6	0
498377	414310	6	0
498378	414311	6	0
498379	414312	6	0
498380	414313	6	0
498381	414314	6	0
498382	414315	6	0
498383	414316	6	0
498384	414317	6	0
498385	414318	6	0
498386	414319	6	0
498387	414320	6	0
498388	414321	6	0
498389	414322	6	0
498390	414323	6	0
498391	414324	6	0
498392	414325	6	0
498393	414326	6	0
498394	414327	6	0
498395	414328	6	0
498396	414329	6	0
498397	414330	6	0
498398	414331	6	0
498399	414332	6	0
498400	414333	6	0
498401	414334	6	0
498402	414335	6	0
498403	414336	6	0
498404	414337	6	0
498405	414338	6	0
498406	414339	6	0
498407	414340	6	0
498408	414341	6	0
498409	414342	6	0
498410	414343	6	0
498411	414344	6	0
498412	414345	6	0
498413	414346	6	0
498414	414347	6	0
498415	414348	6	0
498416	414349	6	0
498417	414350	6	0
498418	414351	6	0
498419	414352	6	0
498420	414353	6	0
498421	414354	6	0
498422	414355	6	0
498423	414356	6	0
498424	414357	6	0
498425	414358	6	0
498426	414359	6	0
498427	414360	6	0
498428	414361	6	0
498429	414362	6	0
498430	414363	6	0
498431	414364	6	0
498432	414365	6	0
498433	414366	6	0
498434	414367	6	0
498435	414368	6	0
498436	414369	6	0
498437	414370	6	0
498438	414371	6	0
498439	414372	6	0
498440	414373	6	0
498441	414374	6	0
498442	414375	6	0
498443	414376	6	0
498444	414377	6	0
498445	414378	6	0
498446	414379	6	0
498447	414380	6	0
498448	414381	6	0
498449	414382	6	0
498450	414383	6	0
498451	414384	6	0
498452	414385	6	0
498453	414386	6	0
498454	414387	6	0
498455	414388	6	0
498456	414389	6	0
498457	414390	6	0
498458	414391	6	0
498459	414392	6	0
498460	414393	6	0
498461	414394	6	0
498462	414395	6	0
498463	414396	6	0
498464	414397	6	0
498465	414398	6	0
498466	414399	6	0
498467	414400	6	0
498468	414401	6	0
498469	414402	6	0
498470	414403	6	0
498471	414404	6	0
498472	414405	6	0
498473	414406	6	0
498474	414407	6	0
498475	414408	6	0
498476	414409	6	0
498477	414410	7	0
498478	414411	7	0
498479	414412	7	0
498480	414413	7	0
498481	414414	7	0
498482	414415	7	0
498483	414416	7	0
498484	414417	7	0
498485	414418	7	0
498486	414419	7	0
498487	414420	7	0
498488	414421	7	0
498489	414422	7	0
498490	414423	7	0
498491	414424	7	0
498492	414425	7	0
498493	414426	7	0
498494	414427	7	0
498495	414428	7	0
498496	414429	7	0
498497	414430	7	0
498498	414431	7	0
498499	414432	7	0
498500	414433	7	0
498501	414434	7	0
498502	414435	7	0
498503	414436	7	0
498504	414437	7	0
498505	414438	7	0
498506	414439	7	0
498507	414440	7	0
498508	414441	7	0
498509	414442	7	0
498510	414443	7	0
498511	414444	7	0
498512	414445	7	0
498513	414446	7	0
498514	414447	7	0
498515	414448	7	0
498516	414449	7	0
498517	414450	7	0
498518	414451	7	0
498519	414452	7	0
498520	414453	7	0
498521	414454	7	0
498522	414455	7	0
498523	414456	7	0
498524	414457	7	0
498525	414458	7	0
498526	414459	7	0
498527	414460	7	0
498528	414461	7	0
498529	414462	7	0
498530	414463	7	0
498531	414464	7	0
498532	414465	7	0
498533	414466	7	0
498534	414467	7	0
498535	414468	7	0
498536	414469	7	0
498537	414470	7	0
498538	414471	7	0
498539	414472	7	0
498540	414473	7	0
498541	414098	7	0
498542	414099	7	0
498543	414100	7	0
498544	414101	7	0
498545	414102	7	0
498546	414103	7	0
498547	414104	7	0
498548	414105	7	0
498549	414106	7	0
498550	414107	7	0
498551	414108	7	0
498552	414109	7	0
498553	414110	7	0
498554	414111	7	0
498555	414112	7	0
498556	414113	7	0
498557	414114	7	0
498558	414115	7	0
498559	414116	7	0
498560	414117	7	0
498561	414118	7	0
498562	414119	7	0
498563	414120	7	0
498564	414121	7	0
498565	414474	7	0
498566	414475	7	0
498567	414476	7	0
498568	414477	7	0
498569	414478	7	0
498570	414479	7	0
498571	414480	7	0
498572	414481	7	0
498573	414130	7	0
498574	414131	7	0
498575	414132	7	0
498576	414133	7	0
498577	414134	7	0
498578	414135	7	0
498579	414136	7	0
498580	414137	7	0
498581	414138	7	0
498582	414139	7	0
498583	414140	7	0
498584	414141	7	0
498585	414142	7	0
498586	414143	7	0
498587	414144	7	0
498588	414145	7	0
498589	414146	7	0
498590	414147	7	0
498591	414148	7	0
498592	414149	7	0
498593	414150	7	0
498594	414151	7	0
498595	414152	7	0
498596	414153	7	0
498597	414154	7	0
498598	414155	7	0
498599	414156	7	0
498600	414157	7	0
498601	414158	7	0
498602	414159	7	0
498603	414160	7	0
498604	414161	7	0
498605	414162	7	0
498606	414163	7	0
498607	414164	7	0
498608	414165	7	0
498609	414166	7	0
498610	414167	7	0
498611	414168	7	0
498612	414169	7	0
498613	414170	7	0
498614	414171	7	0
498615	414172	7	0
498616	414173	7	0
498617	414174	7	0
498618	414175	7	0
498619	414176	7	0
498620	414177	7	0
498621	414178	7	0
498622	414179	7	0
498623	414180	7	0
498624	414181	7	0
498625	414182	7	0
498626	414183	7	0
498627	414184	7	0
498628	414185	7	0
498629	414186	7	0
498630	414187	7	0
498631	414188	7	0
498632	414189	7	0
498633	414190	7	0
498634	414191	7	0
498635	414192	7	0
498636	414193	7	0
498637	414194	7	0
498638	414195	7	0
498639	414196	7	0
498640	414197	7	0
498641	414198	7	0
498642	414199	7	0
498643	414200	7	0
498644	414201	7	0
498645	414202	7	0
498646	414203	7	0
498647	414204	7	0
498648	414205	7	0
498649	414206	7	0
498650	414207	7	0
498651	414208	7	0
498652	414209	7	0
498653	414482	7	0
498654	414483	7	0
498655	414484	7	0
498656	414485	7	0
498657	414486	7	0
498658	414487	7	0
498659	414488	7	0
498660	414489	7	0
498661	414490	7	0
498662	414491	7	0
498663	414492	7	0
498664	414493	7	0
498665	414494	7	0
498666	414495	7	0
498667	414496	7	0
498668	414497	7	0
498669	414226	7	0
498670	414227	7	0
498671	414228	7	0
498672	414229	7	0
498673	414230	7	0
498674	414231	7	0
498675	414232	7	0
498676	414233	7	0
498677	414234	7	0
498678	414235	7	0
498679	414236	7	0
498680	414237	7	0
498681	414238	7	0
498682	414239	7	0
498683	414240	7	0
498684	414241	7	0
498685	414498	7	0
498686	414499	7	0
498687	414500	7	0
498688	414501	7	0
498689	414502	7	0
498690	414503	7	0
498691	414504	7	0
498692	414505	7	0
498693	414506	7	0
498694	414507	7	0
498695	414508	7	0
498696	414509	7	0
498697	414510	7	0
498698	414511	7	0
498699	414512	7	0
498700	414513	7	0
498701	414514	7	0
498702	414515	7	0
498703	414516	7	0
498704	414517	7	0
498705	414518	7	0
498706	414519	7	0
498707	414520	7	0
498708	414521	7	0
498709	414522	7	0
498710	414523	7	0
498711	414524	7	0
498712	414525	7	0
498713	414526	7	0
498714	414527	7	0
498715	414528	7	0
498716	414529	7	0
498717	414530	7	0
498718	414531	7	0
498719	414532	7	0
498720	414533	7	0
498721	414534	7	0
498722	414535	7	0
498723	414536	7	0
498724	414537	7	0
498725	414538	7	0
498726	414539	7	0
498727	414540	7	0
498728	414541	7	0
498729	414542	7	0
498730	414543	7	0
498731	414544	7	0
498732	414545	7	0
498733	414546	7	0
498734	414547	7	0
498735	414548	7	0
498736	414549	7	0
498737	414550	7	0
498738	414551	7	0
498739	414552	7	0
498740	414553	7	0
498741	414554	7	0
498742	414555	7	0
498743	414556	7	0
498744	414557	7	0
498745	414558	7	0
498746	414559	7	0
498747	414560	7	0
498748	414561	7	0
498749	414306	7	0
498750	414307	7	0
498751	414308	7	0
498752	414309	7	0
498753	414310	7	0
498754	414311	7	0
498755	414312	7	0
498756	414313	7	0
498757	414314	7	0
498758	414315	7	0
498759	414316	7	0
498760	414317	7	0
498761	414318	7	0
498762	414319	7	0
498763	414320	7	0
498764	414321	7	0
498765	414322	7	0
498766	414323	7	0
498767	414324	7	0
498768	414325	7	0
498769	414326	7	0
498770	414327	7	0
498771	414328	7	0
498772	414329	7	0
498773	414330	7	0
498774	414331	7	0
498775	414332	7	0
498776	414333	7	0
498777	414334	7	0
498778	414335	7	0
498779	414336	7	0
498780	414337	7	0
498781	414338	7	0
498782	414339	7	0
498783	414340	7	0
498784	414341	7	0
498785	414342	7	0
498786	414343	7	0
498787	414344	7	0
498788	414345	7	0
498789	414562	7	0
498790	414563	7	0
498791	414564	7	0
498792	414565	7	0
498793	414566	7	0
498794	414567	7	0
498795	414568	7	0
498796	414569	7	0
498797	414570	7	0
498798	414571	7	0
498799	414572	7	0
498800	414573	7	0
498801	414574	7	0
498802	414575	7	0
498803	414576	7	0
498804	414577	7	0
498805	414578	7	0
498806	414579	7	0
498807	414580	7	0
498808	414581	7	0
498809	414582	7	0
498810	414583	7	0
498811	414584	7	0
498812	414585	7	0
498813	414586	7	0
498814	414587	7	0
498815	414588	7	0
498816	414589	7	0
498817	414590	7	0
498818	414591	7	0
498819	414592	7	0
498820	414593	7	0
498821	414594	7	0
498822	414595	7	0
498823	414596	7	0
498824	414597	7	0
498825	414598	7	0
498826	414599	7	0
498827	414600	7	0
498828	414601	7	0
498829	414602	7	0
498830	414603	7	0
498831	414604	7	0
498832	414605	7	0
498833	414606	7	0
498834	414607	7	0
498835	414608	7	0
498836	414609	7	0
498837	414394	7	0
498838	414395	7	0
498839	414396	7	0
498840	414397	7	0
498841	414398	7	0
498842	414399	7	0
498843	414400	7	0
498844	414401	7	0
498845	414402	7	0
498846	414403	7	0
498847	414404	7	0
498848	414405	7	0
498849	414406	7	0
498850	414407	7	0
498851	414408	7	0
498852	414409	7	0
498853	414610	8	0
498854	414611	8	0
498855	414612	8	0
498856	414613	8	0
498857	414614	8	0
498858	414615	8	0
498859	414616	8	0
498860	414617	8	0
498861	414618	8	0
498862	414619	8	0
498863	414620	8	0
498864	414621	8	0
498865	414622	8	0
498866	414623	8	0
498867	414624	8	0
498868	414625	8	0
498869	414626	8	0
498870	414627	8	0
498871	414628	8	0
498872	414629	8	0
498873	414630	8	0
498874	414631	8	0
498875	414632	8	0
498876	414633	8	0
498877	414634	8	0
498878	414635	8	0
498879	414636	8	0
498880	414637	8	0
498881	414638	8	0
498882	414639	8	0
498883	414640	8	0
498884	414641	8	0
498885	414642	8	0
498886	414643	8	0
498887	414644	8	0
498888	414645	8	0
498889	414646	8	0
498890	414647	8	0
498891	414648	8	0
498892	414649	8	0
498893	414650	8	0
498894	414651	8	0
498895	414652	8	0
498896	414653	8	0
498897	414654	8	0
498898	414655	8	0
498899	414656	8	0
498900	414657	8	0
498901	414658	8	0
498902	414659	8	0
498903	414660	8	0
498904	414661	8	0
498905	414662	8	0
498906	414663	8	0
498907	414664	8	0
498908	414665	8	0
498909	414666	8	0
498910	414667	8	0
498911	414668	8	0
498912	414669	8	0
498913	414670	8	0
498914	414671	8	0
498915	414672	8	0
498916	414673	8	0
498917	414674	8	0
498918	414675	8	0
498919	414676	8	0
498920	414677	8	0
498921	414678	8	0
498922	414679	8	0
498923	414680	8	0
498924	414681	8	0
498925	414682	8	0
498926	414683	8	0
498927	414684	8	0
498928	414685	8	0
498929	414686	8	0
498930	414687	8	0
498931	414688	8	0
498932	414689	8	0
498933	414690	8	0
498934	414691	8	0
498935	414692	8	0
498936	414693	8	0
498937	414694	8	0
498938	414695	8	0
498939	414696	8	0
498940	414697	8	0
498941	414698	8	0
498942	414699	8	0
498943	414700	8	0
498944	414701	8	0
498945	414702	8	0
498946	414703	8	0
498947	414704	8	0
498948	414705	8	0
498949	414706	8	0
498950	414707	8	0
498951	414708	8	0
498952	414709	8	0
498953	414710	8	0
498954	414711	8	0
498955	414712	8	0
498956	414713	8	0
498957	414714	8	0
498958	414715	8	0
498959	414716	8	0
498960	414717	8	0
498961	414718	8	0
498962	414719	8	0
498963	414720	8	0
498964	414721	8	0
498965	414722	8	0
498966	414723	8	0
498967	414724	8	0
498968	414725	8	0
498969	414726	8	0
498970	414727	8	0
498971	414728	8	0
498972	414729	8	0
498973	414730	8	0
498974	414731	8	0
498975	414732	8	0
498976	414733	8	0
498977	414734	8	0
498978	414735	8	0
498979	414736	8	0
498980	414737	8	0
498981	414738	8	0
498982	414739	8	0
498983	414740	8	0
498984	414741	8	0
498985	414742	8	0
498986	414743	8	0
498987	414744	8	0
498988	414745	8	0
498989	414746	8	0
498990	414747	8	0
498991	414748	8	0
498992	414749	8	0
498993	414750	8	0
498994	414751	8	0
498995	414752	8	0
498996	414753	8	0
498997	414754	8	0
498998	414755	8	0
498999	414756	8	0
499000	414757	8	0
499001	414758	8	0
499002	414759	8	0
499003	414760	8	0
499004	414761	8	0
499005	414762	8	0
499006	414763	8	0
499007	414764	8	0
499008	414765	8	0
499009	414766	8	0
499010	414767	8	0
499011	414768	8	0
499012	414769	8	0
499013	414770	8	0
499014	414771	8	0
499015	414772	8	0
499016	414773	8	0
499017	414774	8	0
499018	414775	8	0
499019	414776	8	0
499020	414777	8	0
499021	414778	8	0
499022	414779	8	0
499023	414780	8	0
499024	414781	8	0
499025	414782	8	0
499026	414783	8	0
499027	414784	8	0
499028	414785	8	0
499029	414786	8	0
499030	414787	8	0
499031	414788	8	0
499032	414789	8	0
499033	414790	8	0
499034	414791	8	0
499035	414792	8	0
499036	414793	8	0
499037	414794	8	0
499038	414795	8	0
499039	414796	8	0
499040	414797	8	0
499041	414798	8	0
499042	414799	8	0
499043	414800	8	0
499044	414801	8	0
499045	414802	8	0
499046	414803	8	0
499047	414804	8	0
499048	414805	8	0
499049	414806	8	0
499050	414807	8	0
499051	414808	8	0
499052	414809	8	0
499053	414810	8	0
499054	414811	8	0
499055	414812	8	0
499056	414813	8	0
499057	414814	8	0
499058	414815	8	0
499059	414816	8	0
499060	414817	8	0
499061	414818	8	0
499062	414819	8	0
499063	414820	8	0
499064	414821	8	0
499065	414822	8	0
499066	414823	8	0
499067	414824	8	0
499068	414825	8	0
499069	414826	8	0
499070	414827	8	0
499071	414828	8	0
499072	414829	8	0
499073	414830	8	0
499074	414831	8	0
499075	414832	8	0
499076	414833	8	0
499077	414834	8	0
499078	414835	8	0
499079	414836	8	0
499080	414837	8	0
499081	414610	9	0
499082	414611	9	0
499083	414612	9	0
499084	414613	9	0
499085	414614	9	0
499086	414615	9	0
499087	414616	9	0
499088	414617	9	0
499089	414618	9	0
499090	414619	9	0
499091	414620	9	0
499092	414621	9	0
499093	414622	9	0
499094	414623	9	0
499095	414624	9	0
499096	414625	9	0
499097	414626	9	0
499098	414627	9	0
499099	414628	9	0
499100	414629	9	0
499101	414630	9	0
499102	414631	9	0
499103	414632	9	0
499104	414633	9	0
499105	414634	9	0
499106	414635	9	0
499107	414636	9	0
499108	414637	9	0
499109	414638	9	0
499110	414639	9	0
499111	414640	9	0
499112	414641	9	0
499113	414642	9	0
499114	414643	9	0
499115	414644	9	0
499116	414645	9	0
499117	414838	9	0
499118	414839	9	0
499119	414840	9	0
499120	414841	9	0
499121	414842	9	0
499122	414843	9	0
499123	414844	9	0
499124	414845	9	0
499125	414846	9	0
499126	414847	9	0
499127	414848	9	0
499128	414849	9	0
499129	414850	9	0
499130	414851	9	0
499131	414852	9	0
499132	414853	9	0
499133	414854	9	0
499134	414855	9	0
499135	414856	9	0
499136	414857	9	0
499137	414858	9	0
499138	414859	9	0
499139	414860	9	0
499140	414861	9	0
499141	414862	9	0
499142	414863	9	0
499143	414864	9	0
499144	414865	9	0
499145	414866	9	0
499146	414867	9	0
499147	414868	9	0
499148	414869	9	0
499149	414870	9	0
499150	414871	9	0
499151	414872	9	0
499152	414873	9	0
499153	414874	9	0
499154	414875	9	0
499155	414876	9	0
499156	414877	9	0
499157	414878	9	0
499158	414879	9	0
499159	414880	9	0
499160	414881	9	0
499161	414882	9	0
499162	414883	9	0
499163	414884	9	0
499164	414885	9	0
499165	414886	9	0
499166	414887	9	0
499167	414888	9	0
499168	414889	9	0
499169	414890	9	0
499170	414891	9	0
499171	414892	9	0
499172	414893	9	0
499173	414894	9	0
499174	414895	9	0
499175	414896	9	0
499176	414897	9	0
499177	414898	9	0
499178	414899	9	0
499179	414900	9	0
499180	414901	9	0
499181	414710	9	0
499182	414711	9	0
499183	414712	9	0
499184	414713	9	0
499185	414714	9	0
499186	414715	9	0
499187	414716	9	0
499188	414717	9	0
499189	414718	9	0
499190	414719	9	0
499191	414720	9	0
499192	414721	9	0
499193	414722	9	0
499194	414723	9	0
499195	414724	9	0
499196	414725	9	0
499197	414726	9	0
499198	414727	9	0
499199	414728	9	0
499200	414729	9	0
499201	414730	9	0
499202	414731	9	0
499203	414732	9	0
499204	414733	9	0
499205	414734	9	0
499206	414735	9	0
499207	414736	9	0
499208	414737	9	0
499209	414738	9	0
499210	414739	9	0
499211	414740	9	0
499212	414741	9	0
499213	414742	9	0
499214	414743	9	0
499215	414744	9	0
499216	414745	9	0
499217	414746	9	0
499218	414747	9	0
499219	414748	9	0
499220	414749	9	0
499221	414750	9	0
499222	414751	9	0
499223	414752	9	0
499224	414753	9	0
499225	414754	9	0
499226	414755	9	0
499227	414756	9	0
499228	414757	9	0
499229	414902	9	0
499230	414903	9	0
499231	414904	9	0
499232	414905	9	0
499233	414906	9	0
499234	414907	9	0
499235	414908	9	0
499236	414909	9	0
499237	414910	9	0
499238	414911	9	0
499239	414912	9	0
499240	414913	9	0
499241	414914	9	0
499242	414915	9	0
499243	414916	9	0
499244	414917	9	0
499245	414918	9	0
499246	414919	9	0
499247	414920	9	0
499248	414921	9	0
499249	414922	9	0
499250	414923	9	0
499251	414924	9	0
499252	414925	9	0
499253	414926	9	0
499254	414927	9	0
499255	414928	9	0
499256	414929	9	0
499257	414930	9	0
499258	414931	9	0
499259	414932	9	0
499260	414933	9	0
499261	414934	9	0
499262	414935	9	0
499263	414936	9	0
499264	414937	9	0
499265	414938	9	0
499266	414939	9	0
499267	414940	9	0
499268	414941	9	0
499269	414942	9	0
499270	414943	9	0
499271	414944	9	0
499272	414945	9	0
499273	414946	9	0
499274	414947	9	0
499275	414948	9	0
499276	414949	9	0
499277	414950	9	0
499278	414951	9	0
499279	414952	9	0
499280	414953	9	0
499281	414954	9	0
499282	414955	9	0
499283	414956	9	0
499284	414957	9	0
499285	414958	9	0
499286	414959	9	0
499287	414960	9	0
499288	414961	9	0
499289	414962	9	0
499290	414963	9	0
499291	414964	9	0
499292	414965	9	0
499293	414966	9	0
499294	414967	9	0
499295	414968	9	0
499296	414969	9	0
499297	414970	9	0
499298	414971	9	0
499299	414972	9	0
499300	414973	9	0
499301	414974	9	0
499302	414975	9	0
499303	414976	9	0
499304	414977	9	0
499305	414978	9	0
499306	414979	9	0
499307	414980	9	0
499308	414981	9	0
499309	414982	10	1
499310	414983	10	1
499311	414984	10	1
499312	414985	10	1
499313	414986	10	1
499314	414987	10	1
499315	414988	10	1
499316	414989	10	1
499317	414990	10	1
499318	414991	10	1
499319	414992	10	1
499320	414993	10	1
499321	414994	10	1
499322	414995	10	1
499323	414996	10	1
499324	414997	10	1
499325	414998	10	1
499326	414999	10	1
499327	415000	10	1
499328	415001	10	1
499329	415002	10	1
499330	415003	10	1
499331	415004	10	1
499332	415005	10	1
499333	415006	10	1
499334	415007	10	1
499335	415008	10	1
499336	415009	10	1
499337	415010	10	1
499338	415011	10	1
499339	415012	10	1
499340	415013	10	1
499341	415014	10	1
499342	415015	10	1
499343	415016	10	1
499344	415017	10	1
499345	415018	10	1
499346	415019	10	1
499347	415020	10	1
499348	415021	10	1
499349	415022	10	1
499350	415023	10	1
499351	415024	10	1
499352	415025	10	1
499353	415026	10	1
499354	415027	10	1
499355	415028	10	1
499356	415029	10	1
499357	415030	10	1
499358	415031	10	1
499359	415032	10	1
499360	415033	10	1
499361	415034	10	1
499362	415035	10	1
499363	415036	10	1
499364	415037	10	1
499365	415038	10	1
499366	415039	10	1
499367	415040	10	1
499368	415041	10	1
499369	415042	10	1
499370	415043	10	1
499371	415044	10	1
499372	415045	10	1
499373	415046	10	1
499374	415047	10	1
499375	415048	10	1
499376	415049	10	1
499377	415050	10	1
499378	415051	10	1
499379	415052	10	1
499380	415053	10	1
499381	415054	10	1
499382	415055	10	1
499383	415056	10	1
499384	415057	10	1
499385	415058	10	1
499386	415059	10	1
499387	415060	10	1
499388	415061	10	1
499389	415062	10	1
499390	415063	10	1
499391	415064	10	1
499392	415065	10	1
499393	415066	10	1
499394	415067	10	1
499395	415068	10	1
499396	415069	10	1
499397	415070	10	1
499398	415071	10	1
499399	415072	10	1
499400	415073	10	1
499401	415074	10	1
499402	415075	10	1
499403	415076	10	1
499404	415077	10	1
499405	415078	10	1
499406	415079	10	1
499407	415080	10	1
499408	415081	10	1
499409	415082	10	1
499410	415083	10	1
499411	415084	10	1
499412	415085	10	1
499413	415086	10	1
499414	415087	10	1
499415	415088	10	1
499416	415089	10	1
499417	415090	10	1
499418	415091	10	1
499419	415092	10	1
499420	415093	10	1
499421	415094	10	1
499422	415095	10	1
499423	415096	10	1
499424	415097	10	1
499425	415098	10	1
499426	415099	10	1
499427	415100	10	1
499428	415101	10	1
499429	415102	10	1
499430	415103	10	1
499431	415104	10	1
499432	415105	10	1
499433	415106	10	1
499434	415107	10	1
499435	415108	10	1
499436	415109	10	1
499437	415110	10	1
499438	415111	10	1
499439	415112	10	1
499440	415113	10	1
499441	415114	10	1
499442	415115	10	1
499443	415116	10	1
499444	415117	10	1
499445	415118	10	1
499446	415119	10	1
499447	415120	10	1
499448	415121	10	1
499449	415122	10	1
499450	415123	10	1
499451	415124	10	1
499452	415125	10	1
499453	415126	10	1
499454	415127	10	1
499455	415128	10	1
499456	415129	10	1
499457	415130	10	1
499458	415131	10	1
499459	415132	10	1
499460	415133	10	1
499461	415134	10	1
499462	415135	10	1
499463	415136	10	1
499464	415137	10	1
499465	415138	10	1
499466	415139	10	1
499467	415140	10	1
499468	415141	10	1
499469	415142	10	1
499470	415143	10	1
499471	415144	10	1
499472	415145	10	1
499473	415146	10	1
499474	415147	10	1
499475	415148	10	1
499476	415149	10	1
499477	415150	10	1
499478	415151	10	1
499479	415152	10	1
499480	415153	10	1
499481	415154	10	1
499482	415155	10	1
499483	415156	10	1
499484	415157	10	1
499485	415158	10	1
499486	415159	10	1
499487	415160	10	1
499488	415161	10	1
499489	415162	10	1
499490	415163	10	1
499491	415164	10	1
499492	415165	10	1
499493	415166	10	1
499494	415167	10	1
499495	415168	10	1
499496	415169	10	1
499497	415170	10	1
499498	415171	10	1
499499	415172	10	1
499500	415173	10	1
499501	415174	10	1
499502	415175	10	1
499503	415176	10	1
499504	415177	10	1
499505	415178	10	1
499506	415179	10	1
499507	415180	10	1
499508	415181	10	1
499509	415182	10	1
499510	415183	10	1
499511	415184	10	1
499512	415185	10	1
499513	415186	10	1
499514	415187	10	1
499515	415188	10	1
499516	415189	10	1
499517	415190	10	1
499518	415191	10	1
499519	415192	10	1
499520	415193	10	1
499521	415194	10	1
499522	415195	10	1
499523	415196	10	1
499524	415197	10	1
499525	415198	10	1
499526	415199	10	1
499527	415200	10	1
499528	415201	10	1
499529	415202	10	1
499530	415203	10	1
499531	415204	10	1
499532	415205	10	1
499533	415206	10	1
499534	415207	10	1
499535	415208	10	1
499536	415209	10	1
499537	415210	10	1
499538	415211	10	1
499539	415212	10	1
499540	415213	10	1
499541	415214	10	1
499542	415215	10	1
499543	415216	10	1
499544	415217	10	1
499545	415218	10	1
499546	415219	10	1
499547	415220	10	1
499548	415221	10	1
499549	415222	10	1
499550	415223	10	1
499551	415224	10	1
499552	415225	10	1
499553	415226	10	1
499554	415227	10	1
499555	415228	10	1
499556	415229	10	1
499557	415230	10	1
499558	415231	10	1
499559	415232	10	1
499560	415233	10	1
499561	415234	10	1
499562	415235	10	1
499563	415236	10	1
499564	415237	10	1
499565	415238	10	1
499566	415239	10	1
499567	415240	10	1
499568	415241	10	1
499569	415242	10	1
499570	415243	10	1
499571	415244	10	1
499572	415245	10	1
499573	415246	10	1
499574	415247	10	1
499575	415248	10	1
499576	415249	10	1
499577	415250	10	1
499578	415251	10	1
499579	415252	10	1
499580	415253	10	1
499581	415254	10	1
499582	415255	10	1
499583	415256	10	1
499584	415257	10	1
499585	415258	10	1
499586	415259	10	1
499587	415260	10	1
499588	415261	10	1
499589	415262	10	1
499590	415263	10	1
499591	415264	10	1
499592	415265	10	1
499593	415266	10	1
499594	415267	10	1
499595	415268	10	1
499596	415269	10	1
499597	415270	10	1
499598	415271	10	1
499599	415272	10	1
499600	415273	10	1
499601	415274	10	1
499602	415275	10	1
499603	415276	10	1
499604	415277	10	1
499605	415278	10	1
499606	415279	10	1
499607	415280	10	1
499608	415281	10	1
499609	415282	10	1
499610	415283	10	1
499611	415284	10	1
499612	415285	10	1
499613	415286	10	1
499614	415287	10	1
499615	415288	10	1
499616	415289	10	1
499617	415290	10	1
499618	415291	10	1
499619	415292	10	1
499620	415293	10	1
499621	415294	10	1
499622	415295	10	1
499623	415296	10	1
499624	415297	10	1
499625	415298	10	1
499626	415299	10	1
499627	415300	10	1
499628	415301	10	1
499629	415302	10	1
499630	415303	10	1
499631	415304	10	1
499632	415305	10	1
499633	415306	10	1
499634	415307	10	1
499635	415308	10	1
499636	415309	10	1
499637	415310	10	1
499638	415311	10	1
499639	415312	10	1
499640	415313	10	1
499641	415314	10	1
499642	415315	10	1
499643	415316	10	1
499644	415317	10	1
499645	415318	10	1
499646	415319	10	1
499647	415320	10	1
499648	415321	10	1
499649	415322	10	1
499650	415323	10	1
499651	415324	10	1
499652	415325	10	1
499653	415326	10	1
499654	415327	10	1
499655	415328	10	1
499656	415329	10	1
499657	415330	10	1
499658	415331	10	1
499659	415332	10	1
499660	415333	10	2
499661	415334	10	2
499662	415335	10	2
499663	415336	10	2
499664	415337	10	2
499665	415338	10	2
499666	415339	10	2
499667	415340	10	2
499668	415341	10	2
499669	415342	10	2
499670	415343	10	2
499671	415344	10	2
499672	415345	10	2
499673	415346	10	2
499674	415347	10	2
499675	415348	10	2
499676	415349	10	2
499677	415350	10	2
499678	415351	10	2
499679	415352	10	2
499680	415353	10	2
499681	415354	10	2
499682	415355	10	2
499683	415356	10	2
499684	415357	10	2
499685	415358	10	2
499686	415359	10	2
499687	415360	10	2
499688	415361	10	2
499689	415362	10	2
499690	415363	10	2
499691	415364	10	2
499692	415365	10	2
499693	415366	10	2
499694	415367	10	2
499695	415368	10	2
499696	415369	10	2
499697	415370	10	2
499698	415371	10	2
499699	415372	10	2
499700	415373	10	2
499701	415374	10	2
499702	415375	10	2
499703	415376	10	2
499704	415377	10	2
499705	415378	10	2
499706	415379	10	2
499707	415380	10	2
499708	415381	10	2
499709	415382	10	2
499710	415383	10	2
499711	415384	10	2
499712	415385	10	2
499713	415386	10	2
499714	415387	10	2
499715	415388	10	2
499716	415389	10	2
499717	415390	10	2
499718	415391	10	2
499719	415392	10	2
499720	415393	10	2
499721	415394	10	2
499722	415395	10	2
499723	415396	10	2
499724	415397	10	2
499725	415398	10	2
499726	415399	10	2
499727	415400	10	2
499728	415401	10	2
499729	415402	10	2
499730	415403	10	2
499731	415404	10	2
499732	415405	10	2
499733	415406	10	2
499734	415407	10	2
499735	415408	10	2
499736	415409	10	2
499737	415410	10	2
499738	415411	10	2
499739	415412	10	2
499740	415413	10	2
499741	415414	10	2
499742	415415	10	2
499743	415416	10	2
499744	415417	10	2
499745	415418	10	2
499746	415419	10	2
499747	415420	10	2
499748	415421	10	2
499749	415422	10	2
499750	415423	10	2
499751	415424	10	2
499752	415425	10	2
499753	415426	10	2
499754	415427	10	2
499755	415428	10	2
499756	415429	10	2
499757	415430	10	2
499758	415431	10	2
499759	415432	10	2
499760	415433	10	2
499761	415434	10	2
499762	415435	10	2
499763	415436	10	2
499764	415437	10	2
499765	415438	10	2
499766	415439	10	2
499767	415440	10	2
499768	415441	10	2
499769	415442	10	2
499770	415443	10	2
499771	415444	10	2
499772	415445	10	2
499773	415446	10	2
499774	415447	10	2
499775	415448	10	2
499776	415449	10	2
499777	415450	10	2
499778	415451	10	2
499779	415452	10	2
499780	415453	10	2
499781	415454	10	2
499782	415455	10	2
499783	415456	10	2
499784	415457	10	2
499785	415458	10	2
499786	415459	10	2
499787	415460	10	2
499788	415461	10	2
499789	415462	10	2
499790	415463	10	2
499791	415464	10	2
499792	415465	10	2
499793	415466	10	2
499794	415467	10	2
499795	415468	10	2
499796	415469	10	2
499797	415470	10	2
499798	415471	10	2
499799	415472	10	2
499800	415473	10	2
499801	415474	10	2
499802	415475	10	2
499803	415476	10	2
499804	415477	10	2
499805	415478	10	2
499806	415479	10	2
499807	415480	10	2
499808	415481	10	2
499809	415482	10	2
499810	415483	10	2
499811	415484	10	2
499812	415485	10	2
499813	415486	10	2
499814	415487	10	2
499815	415488	10	2
499816	415489	10	2
499817	415490	10	2
499818	415491	10	2
499819	415492	10	2
499820	415493	10	2
499821	415494	10	2
499822	415495	10	2
499823	415496	10	2
499824	415497	10	2
499825	415498	10	2
499826	415499	10	2
499827	415500	10	2
499828	415501	10	2
499829	415502	10	2
499830	415503	10	2
499831	415504	10	2
499832	415505	10	2
499833	415506	10	2
499834	415507	10	2
499835	415508	10	2
499836	415509	10	2
499837	415510	10	2
499838	415511	10	2
499839	415512	10	2
499840	415513	10	2
499841	415514	10	2
499842	415515	10	2
499843	415516	10	2
499844	415517	10	2
499845	415518	10	2
499846	415519	10	2
499847	415520	10	2
499848	415521	10	2
499849	415522	10	2
499850	415523	10	2
499851	415524	10	2
499852	415525	10	2
499853	415526	10	2
499854	415527	10	2
499855	415528	10	2
499856	415529	10	2
499857	415530	10	2
499858	415531	10	2
499859	415532	10	2
499860	415533	10	2
499861	415534	10	2
499862	415535	10	2
499863	415536	10	2
499864	415537	10	2
499865	415538	10	2
499866	415539	10	2
499867	415540	10	2
499868	415157	10	2
499869	415158	10	2
499870	415159	10	2
499871	415160	10	2
499872	415161	10	2
499873	415162	10	2
499874	415163	10	2
499875	415164	10	2
499876	415165	10	2
499877	415166	10	2
499878	415167	10	2
499879	415168	10	2
499880	415169	10	2
499881	415170	10	2
499882	415171	10	2
499883	415172	10	2
499884	415541	10	2
499885	415542	10	2
499886	415543	10	2
499887	415544	10	2
499888	415545	10	2
499889	415546	10	2
499890	415547	10	2
499891	415548	10	2
499892	415549	10	2
499893	415550	10	2
499894	415551	10	2
499895	415552	10	2
499896	415553	10	2
499897	415554	10	2
499898	415555	10	2
499899	415556	10	2
499900	415557	10	2
499901	415558	10	2
499902	415559	10	2
499903	415560	10	2
499904	415561	10	2
499905	415562	10	2
499906	415563	10	2
499907	415564	10	2
499908	415565	10	2
499909	415566	10	2
499910	415567	10	2
499911	415568	10	2
499912	415569	10	2
499913	415570	10	2
499914	415571	10	2
499915	415572	10	2
499916	415573	10	2
499917	415574	10	2
499918	415575	10	2
499919	415576	10	2
499920	415577	10	2
499921	415578	10	2
499922	415579	10	2
499923	415580	10	2
499924	415581	10	2
499925	415582	10	2
499926	415583	10	2
499927	415584	10	2
499928	415585	10	2
499929	415586	10	2
499930	415587	10	2
499931	415588	10	2
499932	415589	10	2
499933	415590	10	2
499934	415591	10	2
499935	415592	10	2
499936	415593	10	2
499937	415594	10	2
499938	415595	10	2
499939	415596	10	2
499940	415597	10	2
499941	415598	10	2
499942	415599	10	2
499943	415600	10	2
499944	415601	10	2
499945	415602	10	2
499946	415603	10	2
499947	415604	10	2
499948	415605	10	2
499949	415606	10	2
499950	415607	10	2
499951	415608	10	2
499952	415609	10	2
499953	415610	10	2
499954	415611	10	2
499955	415612	10	2
499956	415613	10	2
499957	415614	10	2
499958	415615	10	2
499959	415616	10	2
499960	415617	10	2
499961	415618	10	2
499962	415619	10	2
499963	415620	10	2
499964	415621	10	2
499965	415622	10	2
499966	415623	10	2
499967	415624	10	2
499968	415625	10	2
499969	415626	10	2
499970	415627	10	2
499971	415628	10	2
499972	415629	10	2
499973	415630	10	2
499974	415631	10	2
499975	415632	10	2
499976	415633	10	2
499977	415634	10	2
499978	415635	10	2
499979	415636	10	2
499980	415637	10	2
499981	415638	10	2
499982	415639	10	2
499983	415640	10	2
499984	415641	10	2
499985	415642	10	2
499986	415643	10	2
499987	415644	10	2
\.


--
-- Data for Name: sc_rasp18_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp18_info (id, rasp18_id, kind, info) FROM stdin;
\.


--
-- Data for Name: sc_rasp18_move; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp18_move (id, rasp18_dest_id, src_day_id, src_pair, reason, comment) FROM stdin;
\.


--
-- Data for Name: sc_rasp18_preps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp18_preps (id, rasp18_id, prep_id) FROM stdin;
303137	412682	0
303138	412683	0
303139	412684	0
303140	412685	0
303141	412686	0
303142	412687	0
303143	412688	0
303144	412689	0
303145	412690	0
303146	412691	0
303147	412692	0
303148	412693	0
303149	412694	0
303150	412695	0
303151	412696	0
303152	412697	0
303153	412714	1
303154	412715	1
303155	412716	1
303156	412717	1
303157	412718	1
303158	412719	1
303159	412720	1
303160	412721	1
303161	412722	1
303162	412723	1
303163	412724	1
303164	412725	1
303165	412726	1
303166	412727	1
303167	412728	1
303168	412729	1
303169	412730	2
303170	412731	2
303171	412732	2
303172	412733	2
303173	412734	2
303174	412735	2
303175	412736	2
303176	412737	2
303177	412738	2
303178	412739	2
303179	412740	2
303180	412741	2
303181	412742	2
303182	412743	2
303183	412744	2
303184	412745	2
303185	412762	3
303186	412763	3
303187	412764	3
303188	412765	3
303189	412766	3
303190	412767	3
303191	412768	3
303192	412769	3
303193	412770	3
303194	412771	3
303195	412772	3
303196	412773	3
303197	412774	3
303198	412775	3
303199	412776	3
303200	412777	3
303201	412778	4
303202	412779	4
303203	412780	4
303204	412781	4
303205	412782	4
303206	412783	4
303207	412784	4
303208	412785	4
303209	412786	4
303210	412787	4
303211	412788	4
303212	412789	4
303213	412790	4
303214	412791	4
303215	412792	4
303216	412793	4
303217	412794	4
303218	412795	4
303219	412796	4
303220	412797	4
303221	412798	4
303222	412799	4
303223	412800	4
303224	412801	4
303225	412802	4
303226	412803	4
303227	412804	4
303228	412805	4
303229	412806	4
303230	412807	4
303231	412808	4
303232	412809	4
303233	412810	5
303234	412811	5
303235	412812	5
303236	412813	5
303237	412814	5
303238	412815	5
303239	412816	5
303240	412817	5
303241	412818	6
303242	412819	6
303243	412820	6
303244	412821	6
303245	412822	6
303246	412823	6
303247	412824	6
303248	412825	6
303249	412826	7
303250	412827	7
303251	412828	7
303252	412829	7
303253	412830	7
303254	412831	7
303255	412832	7
303256	412833	7
303257	412834	7
303258	412835	7
303259	412836	7
303260	412837	7
303261	412838	7
303262	412839	7
303263	412840	7
303264	412841	7
303265	412842	6
303266	412843	6
303267	412844	6
303268	412845	6
303269	412846	6
303270	412847	6
303271	412848	6
303272	412849	6
303273	412850	6
303274	412851	6
303275	412852	6
303276	412853	6
303277	412854	6
303278	412855	6
303279	412856	6
303280	412857	6
303281	412858	7
303282	412859	7
303283	412860	7
303284	412861	7
303285	412862	7
303286	412863	7
303287	412864	7
303288	412865	7
303289	412866	7
303290	412867	7
303291	412868	7
303292	412869	7
303293	412870	7
303294	412871	7
303295	412872	7
303296	412873	7
303297	412874	8
303298	412875	8
303299	412876	8
303300	412877	8
303301	412878	8
303302	412879	8
303303	412880	8
303304	412881	8
303305	412882	8
303306	412883	8
303307	412884	8
303308	412885	8
303309	412886	8
303310	412887	8
303311	412888	8
303312	412889	8
303313	412890	9
303314	412891	9
303315	412892	9
303316	412893	9
303317	412894	9
303318	412895	9
303319	412896	9
303320	412897	9
303321	412898	9
303322	412899	9
303323	412900	9
303324	412901	9
303325	412902	9
303326	412903	9
303327	412904	9
303328	412905	9
303329	412906	5
303330	412907	5
303331	412908	5
303332	412909	5
303333	412910	5
303334	412911	5
303335	412912	5
303336	412913	5
303337	412914	5
303338	412915	5
303339	412916	5
303340	412917	5
303341	412918	5
303342	412919	5
303343	412920	5
303344	412921	5
303345	412922	10
303346	412923	10
303347	412924	10
303348	412925	10
303349	412926	10
303350	412927	10
303351	412928	10
303352	412929	10
303353	412930	10
303354	412931	10
303355	412932	10
303356	412933	10
303357	412934	10
303358	412935	10
303359	412936	10
303360	412937	10
303361	412938	10
303362	412939	10
303363	412940	10
303364	412941	10
303365	412942	10
303366	412943	10
303367	412944	10
303368	412945	10
303369	412946	10
303370	412947	10
303371	412948	10
303372	412949	10
303373	412950	10
303374	412951	10
303375	412952	10
303376	412953	10
303377	412954	11
303378	412955	11
303379	412956	11
303380	412957	11
303381	412958	11
303382	412959	11
303383	412960	11
303384	412961	11
303385	412962	11
303386	412963	11
303387	412964	11
303388	412965	11
303389	412966	11
303390	412967	11
303391	412968	11
303392	412969	11
303393	412970	12
303394	412971	12
303395	412972	12
303396	412973	12
303397	412974	12
303398	412975	12
303399	412976	12
303400	412977	12
303401	412978	12
303402	412979	12
303403	412980	12
303404	412981	12
303405	412982	12
303406	412983	12
303407	412984	12
303408	412985	12
303409	412986	13
303410	412987	13
303411	412988	13
303412	412989	13
303413	412990	13
303414	412991	13
303415	412992	13
303416	412993	13
303417	412994	13
303418	412995	13
303419	412996	13
303420	412997	13
303421	412998	13
303422	412999	13
303423	413000	13
303424	413001	13
303425	413018	14
303426	413019	14
303427	413020	14
303428	413021	14
303429	413022	14
303430	413023	14
303431	413024	14
303432	413025	14
303433	413026	14
303434	413027	14
303435	413028	14
303436	413029	14
303437	413030	14
303438	413031	14
303439	413032	14
303440	413033	14
303441	413034	15
303442	413035	15
303443	413036	15
303444	413037	15
303445	413038	15
303446	413039	15
303447	413040	15
303448	413041	15
303449	413042	15
303450	413043	15
303451	413044	15
303452	413045	15
303453	413046	15
303454	413047	15
303455	413048	15
303456	413049	15
303457	413050	16
303458	413051	16
303459	413052	16
303460	413053	16
303461	413054	16
303462	413055	16
303463	413056	16
303464	413057	16
303465	413058	16
303466	413059	16
303467	413060	16
303468	413061	16
303469	413062	16
303470	413063	16
303471	413064	16
303472	413065	16
303473	413066	17
303474	413067	17
303475	413068	17
303476	413069	17
303477	413070	17
303478	413071	17
303479	413072	17
303480	413073	17
303481	413074	17
303482	413075	17
303483	413076	17
303484	413077	17
303485	413078	17
303486	413079	17
303487	413080	17
303488	413081	17
303489	413098	6
303490	413099	6
303491	413100	6
303492	413101	6
303493	413102	6
303494	413103	6
303495	413104	6
303496	413105	6
303497	413106	6
303498	413107	6
303499	413108	6
303500	413109	6
303501	413110	6
303502	413111	6
303503	413112	6
303504	413113	6
303505	413114	11
303506	413115	11
303507	413116	11
303508	413117	11
303509	413118	11
303510	413119	11
303511	413120	11
303512	413121	11
303513	413122	11
303514	413123	11
303515	413124	11
303516	413125	11
303517	413126	11
303518	413127	11
303519	413128	11
303520	413129	11
303521	413130	18
303522	413131	18
303523	413132	18
303524	413133	18
303525	413134	18
303526	413135	18
303527	413136	18
303528	413137	18
303529	413138	18
303530	413139	18
303531	413140	18
303532	413141	18
303533	413142	18
303534	413143	18
303535	413144	18
303536	413145	18
303537	413146	18
303538	413147	18
303539	413148	18
303540	413149	18
303541	413150	18
303542	413151	18
303543	413152	18
303544	413153	18
303545	413154	18
303546	413155	18
303547	413156	18
303548	413157	18
303549	413158	18
303550	413159	18
303551	413160	18
303552	413161	18
303553	413162	5
303554	413163	5
303555	413164	5
303556	413165	5
303557	413166	5
303558	413167	5
303559	413168	5
303560	413169	5
303561	413170	5
303562	413171	5
303563	413172	5
303564	413173	5
303565	413174	5
303566	413175	5
303567	413176	5
303568	413177	5
303569	413178	19
303570	413179	19
303571	413180	19
303572	413181	19
303573	413182	19
303574	413183	19
303575	413184	19
303576	413185	19
303577	413186	19
303578	413187	19
303579	413188	19
303580	413189	19
303581	413190	19
303582	413191	19
303583	413192	19
303584	413193	19
303585	413194	12
303586	413195	12
303587	413196	12
303588	413197	12
303589	413198	12
303590	413199	12
303591	413200	12
303592	413201	12
303593	413202	20
303594	413203	20
303595	413204	20
303596	413205	20
303597	413206	20
303598	413207	20
303599	413208	20
303600	413209	20
303601	413210	20
303602	413211	20
303603	413212	20
303604	413213	20
303605	413214	20
303606	413215	20
303607	413216	20
303608	413217	20
303609	413218	20
303610	413219	20
303611	413220	20
303612	413221	20
303613	413222	20
303614	413223	20
303615	413224	20
303616	413225	20
303617	413226	20
303618	413227	20
303619	413228	20
303620	413229	20
303621	413230	20
303622	413231	20
303623	413232	20
303624	413233	20
303625	413234	7
303626	413235	7
303627	413236	7
303628	413237	7
303629	413238	7
303630	413239	7
303631	413240	7
303632	413241	7
303633	413242	7
303634	413243	7
303635	413244	7
303636	413245	7
303637	413246	7
303638	413247	7
303639	413248	7
303640	413249	7
303641	413250	7
303642	413251	7
303643	413252	7
303644	413253	7
303645	413254	7
303646	413255	7
303647	413256	7
303648	413257	7
303649	413258	7
303650	413259	7
303651	413260	7
303652	413261	7
303653	413262	7
303654	413263	7
303655	413264	7
303656	413265	7
303657	413266	14
303658	413267	14
303659	413268	14
303660	413269	14
303661	413270	14
303662	413271	14
303663	413272	14
303664	413273	14
303665	413274	14
303666	413275	14
303667	413276	14
303668	413277	14
303669	413278	14
303670	413279	14
303671	413280	14
303672	413281	14
303673	413282	17
303674	413283	17
303675	413284	17
303676	413285	17
303677	413286	17
303678	413287	17
303679	413288	17
303680	413289	17
303681	413290	17
303682	413291	17
303683	413292	17
303684	413293	17
303685	413294	17
303686	413295	17
303687	413296	17
303688	413297	17
303689	413314	4
303690	413315	4
303691	413316	4
303692	413317	4
303693	413318	4
303694	413319	4
303695	413320	4
303696	413321	4
303697	413322	4
303698	413323	4
303699	413324	4
303700	413325	4
303701	413326	4
303702	413327	4
303703	413328	4
303704	413329	4
303705	413346	21
303706	413347	21
303707	413348	21
303708	413349	21
303709	413350	21
303710	413351	21
303711	413352	21
303712	413353	21
303713	413354	21
303714	413355	21
303715	413356	21
303716	413357	21
303717	413358	21
303718	413359	21
303719	413360	21
303720	413361	21
303721	413362	22
303722	413363	22
303723	413364	22
303724	413365	22
303725	413366	22
303726	413367	22
303727	413368	22
303728	413369	22
303729	413370	22
303730	413371	22
303731	413372	22
303732	413373	22
303733	413374	22
303734	413375	22
303735	413376	22
303736	413377	22
303737	413378	15
303738	413379	15
303739	413380	15
303740	413381	15
303741	413382	15
303742	413383	15
303743	413384	15
303744	413385	15
303745	413386	15
303746	413387	15
303747	413388	15
303748	413389	15
303749	413390	15
303750	413391	15
303751	413392	15
303752	413393	15
303753	413394	7
303754	413395	7
303755	413396	7
303756	413397	7
303757	413398	7
303758	413399	7
303759	413400	7
303760	413401	7
303761	413402	7
303762	413403	7
303763	413404	7
303764	413405	7
303765	413406	7
303766	413407	7
303767	413408	7
303768	413409	7
303769	413410	7
303770	413411	7
303771	413412	7
303772	413413	7
303773	413414	7
303774	413415	7
303775	413416	7
303776	413417	7
303777	413418	7
303778	413419	7
303779	413420	7
303780	413421	7
303781	413422	7
303782	413423	7
303783	413424	7
303784	413425	7
303785	413426	16
303786	413427	16
303787	413428	16
303788	413429	16
303789	413430	16
303790	413431	16
303791	413432	16
303792	413433	16
303793	413434	16
303794	413435	16
303795	413436	16
303796	413437	16
303797	413438	16
303798	413439	16
303799	413440	16
303800	413441	16
303801	413458	10
303802	413459	10
303803	413460	10
303804	413461	10
303805	413462	10
303806	413463	10
303807	413464	10
303808	413465	10
303809	413466	10
303810	413467	10
303811	413468	10
303812	413469	10
303813	413470	10
303814	413471	10
303815	413472	10
303816	413473	10
303817	413474	3
303818	413475	3
303819	413476	3
303820	413477	3
303821	413478	3
303822	413479	3
303823	413480	3
303824	413481	3
303825	413482	3
303826	413483	3
303827	413484	3
303828	413485	3
303829	413486	3
303830	413487	3
303831	413488	3
303832	413489	3
303833	413490	7
303834	413491	7
303835	413492	7
303836	413493	7
303837	413494	7
303838	413495	7
303839	413496	7
303840	413497	7
303841	413498	7
303842	413499	7
303843	413500	7
303844	413501	7
303845	413502	7
303846	413503	7
303847	413504	7
303848	413505	7
303849	413506	6
303850	413507	6
303851	413508	6
303852	413509	6
303853	413510	6
303854	413511	6
303855	413512	6
303856	413513	6
303857	413514	6
303858	413515	6
303859	413516	6
303860	413517	6
303861	413518	6
303862	413519	6
303863	413520	6
303864	413521	6
303865	413538	22
303866	413539	22
303867	413540	22
303868	413541	22
303869	413542	22
303870	413543	22
303871	413544	22
303872	413545	22
303873	413546	22
303874	413547	22
303875	413548	22
303876	413549	22
303877	413550	22
303878	413551	22
303879	413552	22
303880	413553	22
303881	413554	23
303882	413555	23
303883	413556	23
303884	413557	23
303885	413558	23
303886	413559	23
303887	413560	23
303888	413561	23
303889	413562	23
303890	413563	23
303891	413564	23
303892	413565	23
303893	413566	23
303894	413567	23
303895	413568	23
303896	413569	23
303897	413570	23
303898	413571	23
303899	413572	23
303900	413573	23
303901	413574	23
303902	413575	23
303903	413576	23
303904	413577	23
303905	413578	23
303906	413579	23
303907	413580	23
303908	413581	23
303909	413582	23
303910	413583	23
303911	413584	23
303912	413585	23
303913	413586	24
303914	413587	24
303915	413588	24
303916	413589	24
303917	413590	24
303918	413591	24
303919	413592	24
303920	413593	24
303921	413594	24
303922	413595	24
303923	413596	24
303924	413597	24
303925	413598	24
303926	413599	24
303927	413600	24
303928	413601	24
303929	413602	24
303930	413603	24
303931	413604	24
303932	413605	24
303933	413606	24
303934	413607	24
303935	413608	24
303936	413609	24
303937	413610	24
303938	413611	24
303939	413612	24
303940	413613	24
303941	413614	24
303942	413615	24
303943	413616	24
303944	413617	24
303945	413618	25
303946	413619	25
303947	413620	25
303948	413621	25
303949	413622	25
303950	413623	25
303951	413624	25
303952	413625	25
303953	413626	25
303954	413627	25
303955	413628	25
303956	413629	25
303957	413630	25
303958	413631	25
303959	413632	25
303960	413633	25
303961	413634	26
303962	413635	26
303963	413636	26
303964	413637	26
303965	413638	26
303966	413639	26
303967	413640	26
303968	413641	26
303969	413642	26
303970	413643	26
303971	413644	26
303972	413645	26
303973	413646	26
303974	413647	26
303975	413648	26
303976	413649	26
303977	413650	27
303978	413651	27
303979	413652	27
303980	413653	27
303981	413654	27
303982	413655	27
303983	413656	27
303984	413657	27
303985	413666	26
303986	413667	26
303987	413668	26
303988	413669	26
303989	413670	26
303990	413671	26
303991	413672	26
303992	413673	26
303993	413674	26
303994	413675	26
303995	413676	26
303996	413677	26
303997	413678	26
303998	413679	26
303999	413680	26
304000	413681	26
304001	413682	26
304002	413683	26
304003	413684	26
304004	413685	26
304005	413686	26
304006	413687	26
304007	413688	26
304008	413689	26
304009	413690	26
304010	413691	26
304011	413692	26
304012	413693	26
304013	413694	26
304014	413695	26
304015	413696	26
304016	413697	26
304017	413698	28
304018	413699	28
304019	413700	28
304020	413701	28
304021	413702	28
304022	413703	28
304023	413704	28
304024	413705	28
304025	413706	28
304026	413707	28
304027	413708	28
304028	413709	28
304029	413710	28
304030	413711	28
304031	413712	28
304032	413713	28
304033	413746	26
304034	413747	26
304035	413748	26
304036	413749	26
304037	413750	26
304038	413751	26
304039	413752	26
304040	413753	26
304041	413754	26
304042	413755	26
304043	413756	26
304044	413757	26
304045	413758	26
304046	413759	26
304047	413760	26
304048	413761	26
304049	413762	25
304050	413763	25
304051	413764	25
304052	413765	25
304053	413766	25
304054	413767	25
304055	413768	25
304056	413769	25
304057	413770	25
304058	413771	25
304059	413772	25
304060	413773	25
304061	413774	25
304062	413775	25
304063	413776	25
304064	413777	25
304065	413786	29
304066	413787	29
304067	413788	29
304068	413789	29
304069	413790	29
304070	413791	29
304071	413792	29
304072	413793	29
304073	413794	29
304074	413795	29
304075	413796	29
304076	413797	29
304077	413798	29
304078	413799	29
304079	413800	29
304080	413801	29
304081	413818	30
304082	413819	30
304083	413820	30
304084	413821	30
304085	413822	30
304086	413823	30
304087	413824	30
304088	413825	30
304089	413826	5
304090	413827	5
304091	413828	5
304092	413829	5
304093	413830	5
304094	413831	5
304095	413832	5
304096	413833	5
304097	413842	31
304098	413843	31
304099	413844	31
304100	413845	31
304101	413846	31
304102	413847	31
304103	413848	31
304104	413849	31
304105	413850	31
304106	413851	31
304107	413852	31
304108	413853	31
304109	413854	31
304110	413855	31
304111	413856	31
304112	413857	31
304113	413858	25
304114	413859	25
304115	413860	25
304116	413861	25
304117	413862	25
304118	413863	25
304119	413864	25
304120	413865	25
304121	413866	25
304122	413867	25
304123	413868	25
304124	413869	25
304125	413870	25
304126	413871	25
304127	413872	25
304128	413873	25
304129	413874	32
304130	413875	32
304131	413876	32
304132	413877	32
304133	413878	32
304134	413879	32
304135	413880	32
304136	413881	32
304137	413882	32
304138	413883	32
304139	413884	32
304140	413885	32
304141	413886	32
304142	413887	32
304143	413888	32
304144	413889	32
304145	413898	27
304146	413899	27
304147	413900	27
304148	413901	27
304149	413902	27
304150	413903	27
304151	413904	27
304152	413905	27
304153	413922	27
304154	413923	27
304155	413924	27
304156	413925	27
304157	413926	27
304158	413927	27
304159	413928	27
304160	413929	27
304161	413930	28
304162	413931	28
304163	413932	28
304164	413933	28
304165	413934	28
304166	413935	28
304167	413936	28
304168	413937	28
304169	413954	24
304170	413955	24
304171	413956	24
304172	413957	24
304173	413958	24
304174	413959	24
304175	413960	24
304176	413961	24
304177	413962	24
304178	413963	24
304179	413964	24
304180	413965	24
304181	413966	24
304182	413967	24
304183	413968	24
304184	413969	24
304185	413994	32
304186	413995	32
304187	413996	32
304188	413997	32
304189	413998	32
304190	413999	32
304191	414000	32
304192	414001	32
304193	414002	32
304194	414003	32
304195	414004	32
304196	414005	32
304197	414006	32
304198	414007	32
304199	414008	32
304200	414009	32
304201	414010	30
304202	414011	30
304203	414012	30
304204	414013	30
304205	414014	30
304206	414015	30
304207	414016	30
304208	414017	30
304209	414018	30
304210	414019	30
304211	414020	30
304212	414021	30
304213	414022	30
304214	414023	30
304215	414024	30
304216	414025	30
304217	414026	5
304218	414027	5
304219	414028	5
304220	414029	5
304221	414030	5
304222	414031	5
304223	414032	5
304224	414033	5
304225	414098	33
304226	414099	33
304227	414100	33
304228	414101	33
304229	414102	33
304230	414103	33
304231	414104	33
304232	414105	33
304233	414106	34
304234	414107	34
304235	414108	34
304236	414109	34
304237	414110	34
304238	414111	34
304239	414112	34
304240	414113	34
304241	414114	33
304242	414115	33
304243	414116	33
304244	414117	33
304245	414118	33
304246	414119	33
304247	414120	33
304248	414121	33
304249	414122	2
304250	414123	2
304251	414124	2
304252	414125	2
304253	414126	2
304254	414127	2
304255	414128	2
304256	414129	2
304257	414130	35
304258	414131	35
304259	414132	35
304260	414133	35
304261	414134	35
304262	414135	35
304263	414136	35
304264	414137	35
304265	414138	34
304266	414139	34
304267	414140	34
304268	414141	34
304269	414142	34
304270	414143	34
304271	414144	34
304272	414145	34
304273	414146	33
304274	414147	33
304275	414148	33
304276	414149	33
304277	414150	33
304278	414151	33
304279	414152	33
304280	414153	33
304281	414154	34
304282	414155	34
304283	414156	34
304284	414157	34
304285	414158	34
304286	414159	34
304287	414160	34
304288	414161	34
304289	414162	36
304290	414163	36
304291	414164	36
304292	414165	36
304293	414166	36
304294	414167	36
304295	414168	36
304296	414169	36
304297	414170	36
304298	414171	36
304299	414172	36
304300	414173	36
304301	414174	36
304302	414175	36
304303	414176	36
304304	414177	36
304305	414178	37
304306	414179	37
304307	414180	37
304308	414181	37
304309	414182	37
304310	414183	37
304311	414184	37
304312	414185	37
304313	414186	37
304314	414187	37
304315	414188	37
304316	414189	37
304317	414190	37
304318	414191	37
304319	414192	37
304320	414193	37
304321	414194	38
304322	414195	38
304323	414196	38
304324	414197	38
304325	414198	38
304326	414199	38
304327	414200	38
304328	414201	38
304329	414202	38
304330	414203	38
304331	414204	38
304332	414205	38
304333	414206	38
304334	414207	38
304335	414208	38
304336	414209	38
304337	414210	38
304338	414211	38
304339	414212	38
304340	414213	38
304341	414214	38
304342	414215	38
304343	414216	38
304344	414217	38
304345	414218	38
304346	414219	38
304347	414220	38
304348	414221	38
304349	414222	38
304350	414223	38
304351	414224	38
304352	414225	38
304353	414226	39
304354	414227	39
304355	414228	39
304356	414229	39
304357	414230	39
304358	414231	39
304359	414232	39
304360	414233	39
304361	414234	39
304362	414235	39
304363	414236	39
304364	414237	39
304365	414238	39
304366	414239	39
304367	414240	39
304368	414241	39
304369	414306	40
304370	414307	40
304371	414308	40
304372	414309	40
304373	414310	40
304374	414311	40
304375	414312	40
304376	414313	40
304377	414314	41
304378	414315	41
304379	414316	41
304380	414317	41
304381	414318	41
304382	414319	41
304383	414320	41
304384	414321	41
304385	414322	41
304386	414323	41
304387	414324	41
304388	414325	41
304389	414326	41
304390	414327	41
304391	414328	41
304392	414329	41
304393	414330	42
304394	414331	42
304395	414332	42
304396	414333	42
304397	414334	42
304398	414335	42
304399	414336	42
304400	414337	42
304401	414338	42
304402	414339	42
304403	414340	42
304404	414341	42
304405	414342	42
304406	414343	42
304407	414344	42
304408	414345	42
304409	414346	42
304410	414347	42
304411	414348	42
304412	414349	42
304413	414350	42
304414	414351	42
304415	414352	42
304416	414353	42
304417	414354	42
304418	414355	42
304419	414356	42
304420	414357	42
304421	414358	42
304422	414359	42
304423	414360	42
304424	414361	42
304425	414362	41
304426	414363	41
304427	414364	41
304428	414365	41
304429	414366	41
304430	414367	41
304431	414368	41
304432	414369	41
304433	414370	41
304434	414371	41
304435	414372	41
304436	414373	41
304437	414374	41
304438	414375	41
304439	414376	41
304440	414377	41
304441	414378	40
304442	414379	40
304443	414380	40
304444	414381	40
304445	414382	40
304446	414383	40
304447	414384	40
304448	414385	40
304449	414386	40
304450	414387	40
304451	414388	40
304452	414389	40
304453	414390	40
304454	414391	40
304455	414392	40
304456	414393	40
304457	414394	13
304458	414395	13
304459	414396	13
304460	414397	13
304461	414398	13
304462	414399	13
304463	414400	13
304464	414401	13
304465	414402	13
304466	414403	13
304467	414404	13
304468	414405	13
304469	414406	13
304470	414407	13
304471	414408	13
304472	414409	13
304473	414474	2
304474	414475	2
304475	414476	2
304476	414477	2
304477	414478	2
304478	414479	2
304479	414480	2
304480	414481	2
304481	414482	43
304482	414483	43
304483	414484	43
304484	414485	43
304485	414486	43
304486	414487	43
304487	414488	43
304488	414489	43
304489	414490	43
304490	414491	43
304491	414492	43
304492	414493	43
304493	414494	43
304494	414495	43
304495	414496	43
304496	414497	43
304497	414562	41
304498	414563	41
304499	414564	41
304500	414565	41
304501	414566	41
304502	414567	41
304503	414568	41
304504	414569	41
304505	414570	41
304506	414571	41
304507	414572	41
304508	414573	41
304509	414574	41
304510	414575	41
304511	414576	41
304512	414577	41
304513	414578	40
304514	414579	40
304515	414580	40
304516	414581	40
304517	414582	40
304518	414583	40
304519	414584	40
304520	414585	40
304521	414586	40
304522	414587	40
304523	414588	40
304524	414589	40
304525	414590	40
304526	414591	40
304527	414592	40
304528	414593	40
304529	414594	42
304530	414595	42
304531	414596	42
304532	414597	42
304533	414598	42
304534	414599	42
304535	414600	42
304536	414601	42
304537	414602	42
304538	414603	42
304539	414604	42
304540	414605	42
304541	414606	42
304542	414607	42
304543	414608	42
304544	414609	42
304545	414610	44
304546	414611	44
304547	414612	44
304548	414613	44
304549	414614	45
304550	414615	45
304551	414616	45
304552	414617	45
304553	414618	45
304554	414619	45
304555	414620	45
304556	414621	45
304557	414622	45
304558	414623	45
304559	414624	45
304560	414625	45
304561	414626	45
304562	414627	45
304563	414628	45
304564	414629	45
304565	414630	45
304566	414631	45
304567	414632	45
304568	414633	45
304569	414634	45
304570	414635	45
304571	414636	45
304572	414637	45
304573	414638	45
304574	414639	45
304575	414640	45
304576	414641	45
304577	414642	45
304578	414643	45
304579	414644	45
304580	414645	45
304581	414710	36
304582	414711	36
304583	414712	36
304584	414713	36
304585	414714	36
304586	414715	36
304587	414716	36
304588	414717	36
304589	414718	36
304590	414719	36
304591	414720	36
304592	414721	36
304593	414722	36
304594	414723	36
304595	414724	36
304596	414725	36
304597	414726	37
304598	414727	37
304599	414728	37
304600	414729	37
304601	414730	37
304602	414731	37
304603	414732	37
304604	414733	37
304605	414734	37
304606	414735	37
304607	414736	37
304608	414737	37
304609	414738	37
304610	414739	37
304611	414740	37
304612	414741	37
304613	414742	38
304614	414743	38
304615	414744	38
304616	414745	38
304617	414746	38
304618	414747	38
304619	414748	38
304620	414749	38
304621	414750	38
304622	414751	38
304623	414752	38
304624	414753	38
304625	414754	38
304626	414755	38
304627	414756	38
304628	414757	38
304629	415062	46
304630	415063	46
304631	415064	46
304632	415065	46
304633	415066	46
304634	415067	46
304635	415068	46
304636	415069	46
304637	415070	46
304638	415071	46
304639	415072	46
304640	415073	46
304641	415074	46
304642	415075	46
304643	415076	46
304644	415077	46
304645	415078	47
304646	415079	47
304647	415080	47
304648	415081	47
304649	415082	47
304650	415083	47
304651	415084	47
304652	415085	47
304653	415086	47
304654	415087	47
304655	415088	47
304656	415089	47
304657	415090	47
304658	415091	47
304659	415092	47
304660	415093	47
304661	415094	47
304662	415095	47
304663	415096	47
304664	415097	47
304665	415098	47
304666	415099	47
304667	415100	47
304668	415101	47
304669	415102	47
304670	415103	47
304671	415104	47
304672	415105	47
304673	415106	47
304674	415107	47
304675	415108	47
304676	415109	47
304677	415110	48
304678	415111	48
304679	415112	48
304680	415113	48
304681	415114	48
304682	415115	48
304683	415116	48
304684	415117	48
304685	415118	48
304686	415119	48
304687	415120	48
304688	415121	48
304689	415122	48
304690	415123	48
304691	415124	48
304692	415125	49
304693	415126	49
304694	415127	49
304695	415128	49
304696	415129	49
304697	415130	49
304698	415131	49
304699	415132	49
304700	415133	49
304701	415134	49
304702	415135	49
304703	415136	49
304704	415137	49
304705	415138	49
304706	415139	49
304707	415140	49
304708	415141	50
304709	415142	50
304710	415143	50
304711	415144	50
304712	415145	50
304713	415146	50
304714	415147	50
304715	415148	50
304716	415149	50
304717	415150	50
304718	415151	50
304719	415152	50
304720	415153	50
304721	415154	50
304722	415155	50
304723	415156	50
304724	415157	39
304725	415158	39
304726	415159	39
304727	415160	39
304728	415161	39
304729	415162	39
304730	415163	39
304731	415164	39
304732	415165	39
304733	415166	39
304734	415167	39
304735	415168	39
304736	415169	39
304737	415170	39
304738	415171	39
304739	415172	39
304740	415397	51
304741	415398	51
304742	415399	51
304743	415400	51
304744	415401	51
304745	415402	51
304746	415403	51
304747	415404	51
304748	415485	52
304749	415486	52
304750	415487	52
304751	415488	52
304752	415489	52
304753	415490	52
304754	415491	52
304755	415492	52
304756	415493	52
304757	415494	52
304758	415495	52
304759	415496	52
304760	415497	52
304761	415498	52
304762	415499	52
304763	415500	52
304764	415501	51
304765	415502	51
304766	415503	51
304767	415504	51
304768	415505	51
304769	415506	51
304770	415507	51
304771	415508	51
304772	415509	53
304773	415510	53
304774	415511	53
304775	415512	53
304776	415513	53
304777	415514	53
304778	415515	53
304779	415516	53
304780	415517	51
304781	415518	51
304782	415519	51
304783	415520	51
304784	415521	51
304785	415522	51
304786	415523	51
304787	415524	51
304788	415525	53
304789	415526	53
304790	415527	53
304791	415528	53
304792	415529	53
304793	415530	53
304794	415531	53
304795	415532	53
304796	415533	53
304797	415534	53
304798	415535	53
304799	415536	53
304800	415537	53
304801	415538	53
304802	415539	53
304803	415540	53
304804	415621	41
304805	415622	41
304806	415623	41
304807	415624	41
304808	415625	41
304809	415626	41
304810	415627	41
304811	415628	41
304812	415629	41
304813	415630	41
304814	415631	41
304815	415632	41
304816	415633	41
304817	415634	41
304818	415635	41
304819	415636	41
304820	415637	41
304821	415638	41
304822	415639	41
304823	415640	41
304824	415641	41
304825	415642	41
304826	415643	41
304827	415644	41
\.


--
-- Data for Name: sc_rasp18_rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp18_rooms (id, rasp18_id, room) FROM stdin;
339024	412682	А-206
339025	412683	А-206
339026	412684	А-206
339027	412685	А-206
339028	412686	А-206
339029	412687	А-206
339030	412688	А-206
339031	412689	А-206
339032	412690	А-206
339033	412691	А-206
339034	412692	А-206
339035	412693	А-206
339036	412694	А-206
339037	412695	А-206
339038	412696	А-206
339039	412697	А-206
339040	412698	И-309\nИ-308
339041	412699	И-309\nИ-308
339042	412700	И-309\nИ-308
339043	412701	И-309\nИ-308
339044	412702	И-309\nИ-308
339045	412703	И-309\nИ-308
339046	412704	И-309\nИ-308
339047	412705	И-309\nИ-308
339048	412706	И-309\nИ-308
339049	412707	И-309\nИ-308
339050	412708	И-309\nИ-308
339051	412709	И-309\nИ-308
339052	412710	И-309\nИ-308
339053	412711	И-309\nИ-308
339054	412712	И-309\nИ-308
339055	412713	И-309\nИ-308
339056	412714	Б-209-2
339057	412715	Б-209-2
339058	412716	Б-209-2
339059	412717	Б-209-2
339060	412718	Б-209-2
339061	412719	Б-209-2
339062	412720	Б-209-2
339063	412721	Б-209-2
339064	412722	Б-209-2
339065	412723	Б-209-2
339066	412724	Б-209-2
339067	412725	Б-209-2
339068	412726	Б-209-2
339069	412727	Б-209-2
339070	412728	Б-209-2
339071	412729	Б-209-2
339072	412730	Б-209-2
339073	412731	Б-209-2
339074	412732	Б-209-2
339075	412733	Б-209-2
339076	412734	Б-209-2
339077	412735	Б-209-2
339078	412736	Б-209-2
339079	412737	Б-209-2
339080	412738	Б-209-2
339081	412739	Б-209-2
339082	412740	Б-209-2
339083	412741	Б-209-2
339084	412742	Б-209-2
339085	412743	Б-209-2
339086	412744	Б-209-2
339087	412745	Б-209-2
339088	412746	ФОК
339089	412747	ФОК
339090	412748	ФОК
339091	412749	ФОК
339092	412750	ФОК
339093	412751	ФОК
339094	412752	ФОК
339095	412753	ФОК
339096	412754	ФОК
339097	412755	ФОК
339098	412756	ФОК
339099	412757	ФОК
339100	412758	ФОК
339101	412759	ФОК
339102	412760	ФОК
339103	412761	ФОК
339104	412762	А-13
339105	412763	А-13
339106	412764	А-13
339107	412765	А-13
339108	412766	А-13
339109	412767	А-13
339110	412768	А-13
339111	412769	А-13
339112	412770	А-13
339113	412771	А-13
339114	412772	А-13
339115	412773	А-13
339116	412774	А-13
339117	412775	А-13
339118	412776	А-13
339119	412777	А-13
339120	412778	А-13
339121	412779	А-13
339122	412780	А-13
339123	412781	А-13
339124	412782	А-13
339125	412783	А-13
339126	412784	А-13
339127	412785	А-13
339128	412786	А-13
339129	412787	А-13
339130	412788	А-13
339131	412789	А-13
339132	412790	А-13
339133	412791	А-13
339134	412792	А-13
339135	412793	А-13
339136	412794	А-217
339137	412795	А-217
339138	412796	А-217
339139	412797	А-217
339140	412798	А-217
339141	412799	А-217
339142	412800	А-217
339143	412801	А-217
339144	412802	А-217
339145	412803	А-217
339146	412804	А-217
339147	412805	А-217
339148	412806	А-217
339149	412807	А-217
339150	412808	А-217
339151	412809	А-217
339152	412810	А-1
339153	412811	А-1
339154	412812	А-1
339155	412813	А-1
339156	412814	А-1
339157	412815	А-1
339158	412816	А-1
339159	412817	А-1
339160	412818	А-13
339161	412819	А-13
339162	412820	А-13
339163	412821	А-13
339164	412822	А-13
339165	412823	А-13
339166	412824	А-13
339167	412825	А-13
339168	412826	А-13
339169	412827	А-13
339170	412828	А-13
339171	412829	А-13
339172	412830	А-13
339173	412831	А-13
339174	412832	А-13
339175	412833	А-13
339176	412834	А-13
339177	412835	А-13
339178	412836	А-13
339179	412837	А-13
339180	412838	А-13
339181	412839	А-13
339182	412840	А-13
339183	412841	А-13
339184	412842	А-328
339185	412843	А-328
339186	412844	А-328
339187	412845	А-328
339188	412846	А-328
339189	412847	А-328
339190	412848	А-328
339191	412849	А-328
339192	412850	А-328
339193	412851	А-328
339194	412852	А-328
339195	412853	А-328
339196	412854	А-328
339197	412855	А-328
339198	412856	А-328
339199	412857	А-328
339200	412858	А-173
339201	412859	А-173
339202	412860	А-173
339203	412861	А-173
339204	412862	А-173
339205	412863	А-173
339206	412864	А-173
339207	412865	А-173
339208	412866	А-173
339209	412867	А-173
339210	412868	А-173
339211	412869	А-173
339212	412870	А-173
339213	412871	А-173
339214	412872	А-173
339215	412873	А-173
339216	412874	А-1
339217	412875	А-1
339218	412876	А-1
339219	412877	А-1
339220	412878	А-1
339221	412879	А-1
339222	412880	А-1
339223	412881	А-1
339224	412882	А-1
339225	412883	А-1
339226	412884	А-1
339227	412885	А-1
339228	412886	А-1
339229	412887	А-1
339230	412888	А-1
339231	412889	А-1
339232	412890	А-173
339233	412891	А-173
339234	412892	А-173
339235	412893	А-173
339236	412894	А-173
339237	412895	А-173
339238	412896	А-173
339239	412897	А-173
339240	412898	А-173
339241	412899	А-173
339242	412900	А-173
339243	412901	А-173
339244	412902	А-173
339245	412903	А-173
339246	412904	А-173
339247	412905	А-173
339248	412906	Б-209-2
339249	412907	Б-209-2
339250	412908	Б-209-2
339251	412909	Б-209-2
339252	412910	Б-209-2
339253	412911	Б-209-2
339254	412912	Б-209-2
339255	412913	Б-209-2
339256	412914	Б-209-2
339257	412915	Б-209-2
339258	412916	Б-209-2
339259	412917	Б-209-2
339260	412918	Б-209-2
339261	412919	Б-209-2
339262	412920	Б-209-2
339263	412921	Б-209-2
339264	412922	Г-102
339265	412923	Г-102
339266	412924	Г-102
339267	412925	Г-102
339268	412926	Г-102
339269	412927	Г-102
339270	412928	Г-102
339271	412929	Г-102
339272	412930	Г-102
339273	412931	Г-102
339274	412932	Г-102
339275	412933	Г-102
339276	412934	Г-102
339277	412935	Г-102
339278	412936	Г-102
339279	412937	Г-102
339280	412938	А-13
339281	412939	А-13
339282	412940	А-13
339283	412941	А-13
339284	412942	А-13
339285	412943	А-13
339286	412944	А-13
339287	412945	А-13
339288	412946	А-13
339289	412947	А-13
339290	412948	А-13
339291	412949	А-13
339292	412950	А-13
339293	412951	А-13
339294	412952	А-13
339295	412953	А-13
339296	412954	А-13
339297	412955	А-13
339298	412956	А-13
339299	412957	А-13
339300	412958	А-13
339301	412959	А-13
339302	412960	А-13
339303	412961	А-13
339304	412962	А-13
339305	412963	А-13
339306	412964	А-13
339307	412965	А-13
339308	412966	А-13
339309	412967	А-13
339310	412968	А-13
339311	412969	А-13
339312	412970	Дист.
339313	412971	Дист.
339314	412972	Дист.
339315	412973	Дист.
339316	412974	Дист.
339317	412975	Дист.
339318	412976	Дист.
339319	412977	Дист.
339320	412978	Б-209-2
339321	412979	Б-209-2
339322	412980	Б-209-2
339323	412981	Б-209-2
339324	412982	Б-209-2
339325	412983	Б-209-2
339326	412984	Б-209-2
339327	412985	Б-209-2
339328	412986	Б-209-2
339329	412987	Б-209-2
339330	412988	Б-209-2
339331	412989	Б-209-2
339332	412990	Б-209-2
339333	412991	Б-209-2
339334	412992	Б-209-2
339335	412993	Б-209-2
339336	412994	Б-209-2
339337	412995	Б-209-2
339338	412996	Б-209-2
339339	412997	Б-209-2
339340	412998	Б-209-2
339341	412999	Б-209-2
339342	413000	Б-209-2
339343	413001	Б-209-2
339344	413002	И-307\nИ-308
339345	413003	И-307\nИ-308
339346	413004	И-307\nИ-308
339347	413005	И-307\nИ-308
339348	413006	И-307\nИ-308
339349	413007	И-307\nИ-308
339350	413008	И-307\nИ-308
339351	413009	И-307\nИ-308
339352	413010	И-307\nИ-308
339353	413011	И-307\nИ-308
339354	413012	И-307\nИ-308
339355	413013	И-307\nИ-308
339356	413014	И-307\nИ-308
339357	413015	И-307\nИ-308
339358	413016	И-307\nИ-308
339359	413017	И-307\nИ-308
339360	413018	А-174-б
339361	413019	А-174-б
339362	413020	А-174-б
339363	413021	А-174-б
339364	413022	А-174-б
339365	413023	А-174-б
339366	413024	А-174-б
339367	413025	А-174-б
339368	413026	А-174-б
339369	413027	А-174-б
339370	413028	А-174-б
339371	413029	А-174-б
339372	413030	А-174-б
339373	413031	А-174-б
339374	413032	А-174-б
339375	413033	А-174-б
339376	413034	Г-102
339377	413035	Г-102
339378	413036	Г-102
339379	413037	Г-102
339380	413038	Г-102
339381	413039	Г-102
339382	413040	Г-102
339383	413041	Г-102
339384	413042	Г-102
339385	413043	Г-102
339386	413044	Г-102
339387	413045	Г-102
339388	413046	Г-102
339389	413047	Г-102
339390	413048	Г-102
339391	413049	Г-102
339392	413050	А-218
339393	413051	А-218
339394	413052	А-218
339395	413053	А-218
339396	413054	А-218
339397	413055	А-218
339398	413056	А-218
339399	413057	А-218
339400	413058	А-218
339401	413059	А-218
339402	413060	А-218
339403	413061	А-218
339404	413062	А-218
339405	413063	А-218
339406	413064	А-218
339407	413065	А-218
339408	413066	Г-102
339409	413067	Г-102
339410	413068	Г-102
339411	413069	Г-102
339412	413070	Г-102
339413	413071	Г-102
339414	413072	Г-102
339415	413073	Г-102
339416	413074	Г-102
339417	413075	Г-102
339418	413076	Г-102
339419	413077	Г-102
339420	413078	Г-102
339421	413079	Г-102
339422	413080	Г-102
339423	413081	Г-102
339424	413082	ФОК
339425	413083	ФОК
339426	413084	ФОК
339427	413085	ФОК
339428	413086	ФОК
339429	413087	ФОК
339430	413088	ФОК
339431	413089	ФОК
339432	413090	ФОК
339433	413091	ФОК
339434	413092	ФОК
339435	413093	ФОК
339436	413094	ФОК
339437	413095	ФОК
339438	413096	ФОК
339439	413097	ФОК
339440	413098	А-203
339441	413099	А-203
339442	413100	А-203
339443	413101	А-203
339444	413102	А-203
339445	413103	А-203
339446	413104	А-203
339447	413105	А-203
339448	413106	А-203
339449	413107	А-203
339450	413108	А-203
339451	413109	А-203
339452	413110	А-203
339453	413111	А-203
339454	413112	А-203
339455	413113	А-203
339456	413114	А-207
339457	413115	А-207
339458	413116	А-207
339459	413117	А-207
339460	413118	А-207
339461	413119	А-207
339462	413120	А-207
339463	413121	А-207
339464	413122	А-207
339465	413123	А-207
339466	413124	А-207
339467	413125	А-207
339468	413126	А-207
339469	413127	А-207
339470	413128	А-207
339471	413129	А-207
339472	413130	Б-209-2
339473	413131	Б-209-2
339474	413132	Б-209-2
339475	413133	Б-209-2
339476	413134	Б-209-2
339477	413135	Б-209-2
339478	413136	Б-209-2
339479	413137	Б-209-2
339480	413138	Б-209-2
339481	413139	Б-209-2
339482	413140	Б-209-2
339483	413141	Б-209-2
339484	413142	Б-209-2
339485	413143	Б-209-2
339486	413144	Б-209-2
339487	413145	Б-209-2
339488	413146	Б-209-2
339489	413147	Б-209-2
339490	413148	Б-209-2
339491	413149	Б-209-2
339492	413150	Б-209-2
339493	413151	Б-209-2
339494	413152	Б-209-2
339495	413153	Б-209-2
339496	413154	Б-209-2
339497	413155	Б-209-2
339498	413156	Б-209-2
339499	413157	Б-209-2
339500	413158	Б-209-2
339501	413159	Б-209-2
339502	413160	Б-209-2
339503	413161	Б-209-2
339504	413162	Б-209-2
339505	413163	Б-209-2
339506	413164	Б-209-2
339507	413165	Б-209-2
339508	413166	Б-209-2
339509	413167	Б-209-2
339510	413168	Б-209-2
339511	413169	Б-209-2
339512	413170	Б-209-2
339513	413171	Б-209-2
339514	413172	Б-209-2
339515	413173	Б-209-2
339516	413174	Б-209-2
339517	413175	Б-209-2
339518	413176	Б-209-2
339519	413177	Б-209-2
339520	413178	Б-209-2
339521	413179	Б-209-2
339522	413180	Б-209-2
339523	413181	Б-209-2
339524	413182	Б-209-2
339525	413183	Б-209-2
339526	413184	Б-209-2
339527	413185	Б-209-2
339528	413186	Б-209-2
339529	413187	Б-209-2
339530	413188	Б-209-2
339531	413189	Б-209-2
339532	413190	Б-209-2
339533	413191	Б-209-2
339534	413192	Б-209-2
339535	413193	Б-209-2
339536	413194	Дист.
339537	413195	Дист.
339538	413196	Дист.
339539	413197	Дист.
339540	413198	Дист.
339541	413199	Дист.
339542	413200	Дист.
339543	413201	Дист.
339544	413202	ИВЦ-116
339545	413203	ИВЦ-116
339546	413204	ИВЦ-116
339547	413205	ИВЦ-116
339548	413206	ИВЦ-116
339549	413207	ИВЦ-116
339550	413208	ИВЦ-116
339551	413209	ИВЦ-116
339552	413210	ИВЦ-116
339553	413211	ИВЦ-116
339554	413212	ИВЦ-116
339555	413213	ИВЦ-116
339556	413214	ИВЦ-116
339557	413215	ИВЦ-116
339558	413216	ИВЦ-116
339559	413217	ИВЦ-116
339560	413218	ИВЦ-116
339561	413219	ИВЦ-116
339562	413220	ИВЦ-116
339563	413221	ИВЦ-116
339564	413222	ИВЦ-116
339565	413223	ИВЦ-116
339566	413224	ИВЦ-116
339567	413225	ИВЦ-116
339568	413226	ИВЦ-116
339569	413227	ИВЦ-116
339570	413228	ИВЦ-116
339571	413229	ИВЦ-116
339572	413230	ИВЦ-116
339573	413231	ИВЦ-116
339574	413232	ИВЦ-116
339575	413233	ИВЦ-116
339576	413234	Б-209-2
339577	413235	Б-209-2
339578	413236	Б-209-2
339579	413237	Б-209-2
339580	413238	Б-209-2
339581	413239	Б-209-2
339582	413240	Б-209-2
339583	413241	Б-209-2
339584	413242	Б-209-2
339585	413243	Б-209-2
339586	413244	Б-209-2
339587	413245	Б-209-2
339588	413246	Б-209-2
339589	413247	Б-209-2
339590	413248	Б-209-2
339591	413249	Б-209-2
339592	413250	Б-209-2
339593	413251	Б-209-2
339594	413252	Б-209-2
339595	413253	Б-209-2
339596	413254	Б-209-2
339597	413255	Б-209-2
339598	413256	Б-209-2
339599	413257	Б-209-2
339600	413258	Б-209-2
339601	413259	Б-209-2
339602	413260	Б-209-2
339603	413261	Б-209-2
339604	413262	Б-209-2
339605	413263	Б-209-2
339606	413264	Б-209-2
339607	413265	Б-209-2
339608	413266	А-173
339609	413267	А-173
339610	413268	А-173
339611	413269	А-173
339612	413270	А-173
339613	413271	А-173
339614	413272	А-173
339615	413273	А-173
339616	413274	А-173
339617	413275	А-173
339618	413276	А-173
339619	413277	А-173
339620	413278	А-173
339621	413279	А-173
339622	413280	А-173
339623	413281	А-173
339624	413282	Г-102
339625	413283	Г-102
339626	413284	Г-102
339627	413285	Г-102
339628	413286	Г-102
339629	413287	Г-102
339630	413288	Г-102
339631	413289	Г-102
339632	413290	Г-102
339633	413291	Г-102
339634	413292	Г-102
339635	413293	Г-102
339636	413294	Г-102
339637	413295	Г-102
339638	413296	Г-102
339639	413297	Г-102
339640	413298	И-304\nИ-305
339641	413299	И-304\nИ-305
339642	413300	И-304\nИ-305
339643	413301	И-304\nИ-305
339644	413302	И-304\nИ-305
339645	413303	И-304\nИ-305
339646	413304	И-304\nИ-305
339647	413305	И-304\nИ-305
339648	413306	И-304\nИ-305
339649	413307	И-304\nИ-305
339650	413308	И-304\nИ-305
339651	413309	И-304\nИ-305
339652	413310	И-304\nИ-305
339653	413311	И-304\nИ-305
339654	413312	И-304\nИ-305
339655	413313	И-304\nИ-305
339656	413314	А-217
339657	413315	А-217
339658	413316	А-217
339659	413317	А-217
339660	413318	А-217
339661	413319	А-217
339662	413320	А-217
339663	413321	А-217
339664	413322	А-217
339665	413323	А-217
339666	413324	А-217
339667	413325	А-217
339668	413326	А-217
339669	413327	А-217
339670	413328	А-217
339671	413329	А-217
339672	413330	ФОК
339673	413331	ФОК
339674	413332	ФОК
339675	413333	ФОК
339676	413334	ФОК
339677	413335	ФОК
339678	413336	ФОК
339679	413337	ФОК
339680	413338	ФОК
339681	413339	ФОК
339682	413340	ФОК
339683	413341	ФОК
339684	413342	ФОК
339685	413343	ФОК
339686	413344	ФОК
339687	413345	ФОК
339688	413346	А-203
339689	413347	А-203
339690	413348	А-203
339691	413349	А-203
339692	413350	А-203
339693	413351	А-203
339694	413352	А-203
339695	413353	А-203
339696	413354	А-203
339697	413355	А-203
339698	413356	А-203
339699	413357	А-203
339700	413358	А-203
339701	413359	А-203
339702	413360	А-203
339703	413361	А-203
339704	413362	А-328
339705	413363	А-328
339706	413364	А-328
339707	413365	А-328
339708	413366	А-328
339709	413367	А-328
339710	413368	А-328
339711	413369	А-328
339712	413370	А-328
339713	413371	А-328
339714	413372	А-328
339715	413373	А-328
339716	413374	А-328
339717	413375	А-328
339718	413376	А-328
339719	413377	А-328
339720	413378	А-177
339721	413379	А-177
339722	413380	А-177
339723	413381	А-177
339724	413382	А-177
339725	413383	А-177
339726	413384	А-177
339727	413385	А-177
339728	413386	А-177
339729	413387	А-177
339730	413388	А-177
339731	413389	А-177
339732	413390	А-177
339733	413391	А-177
339734	413392	А-177
339735	413393	А-177
339736	413394	Б-209-2
339737	413395	Б-209-2
339738	413396	Б-209-2
339739	413397	Б-209-2
339740	413398	Б-209-2
339741	413399	Б-209-2
339742	413400	Б-209-2
339743	413401	Б-209-2
339744	413402	Б-209-2
339745	413403	Б-209-2
339746	413404	Б-209-2
339747	413405	Б-209-2
339748	413406	Б-209-2
339749	413407	Б-209-2
339750	413408	Б-209-2
339751	413409	Б-209-2
339752	413410	Б-209-2
339753	413411	Б-209-2
339754	413412	Б-209-2
339755	413413	Б-209-2
339756	413414	Б-209-2
339757	413415	Б-209-2
339758	413416	Б-209-2
339759	413417	Б-209-2
339760	413418	Б-209-2
339761	413419	Б-209-2
339762	413420	Б-209-2
339763	413421	Б-209-2
339764	413422	Б-209-2
339765	413423	Б-209-2
339766	413424	Б-209-2
339767	413425	Б-209-2
339768	413426	А-218
339769	413427	А-218
339770	413428	А-218
339771	413429	А-218
339772	413430	А-218
339773	413431	А-218
339774	413432	А-218
339775	413433	А-218
339776	413434	А-218
339777	413435	А-218
339778	413436	А-218
339779	413437	А-218
339780	413438	А-218
339781	413439	А-218
339782	413440	А-218
339783	413441	А-218
339784	413442	ФОК
339785	413443	ФОК
339786	413444	ФОК
339787	413445	ФОК
339788	413446	ФОК
339789	413447	ФОК
339790	413448	ФОК
339791	413449	ФОК
339792	413450	ФОК
339793	413451	ФОК
339794	413452	ФОК
339795	413453	ФОК
339796	413454	ФОК
339797	413455	ФОК
339798	413456	ФОК
339799	413457	ФОК
339800	413458	А-318
339801	413459	А-318
339802	413460	А-318
339803	413461	А-318
339804	413462	А-318
339805	413463	А-318
339806	413464	А-318
339807	413465	А-318
339808	413466	А-318
339809	413467	А-318
339810	413468	А-318
339811	413469	А-318
339812	413470	А-318
339813	413471	А-318
339814	413472	А-318
339815	413473	А-318
339816	413474	Г-102
339817	413475	Г-102
339818	413476	Г-102
339819	413477	Г-102
339820	413478	Г-102
339821	413479	Г-102
339822	413480	Г-102
339823	413481	Г-102
339824	413482	Г-102
339825	413483	Г-102
339826	413484	Г-102
339827	413485	Г-102
339828	413486	Г-102
339829	413487	Г-102
339830	413488	Г-102
339831	413489	Г-102
339832	413490	А-173
339833	413491	А-173
339834	413492	А-173
339835	413493	А-173
339836	413494	А-173
339837	413495	А-173
339838	413496	А-173
339839	413497	А-173
339840	413498	А-173
339841	413499	А-173
339842	413500	А-173
339843	413501	А-173
339844	413502	А-173
339845	413503	А-173
339846	413504	А-173
339847	413505	А-173
339848	413506	А-328
339849	413507	А-328
339850	413508	А-328
339851	413509	А-328
339852	413510	А-328
339853	413511	А-328
339854	413512	А-328
339855	413513	А-328
339856	413514	А-328
339857	413515	А-328
339858	413516	А-328
339859	413517	А-328
339860	413518	А-328
339861	413519	А-328
339862	413520	А-328
339863	413521	А-328
339864	413522	И-315\nИ-317
339865	413523	И-315\nИ-317
339866	413524	И-315\nИ-317
339867	413525	И-315\nИ-317
339868	413526	И-315\nИ-317
339869	413527	И-315\nИ-317
339870	413528	И-315\nИ-317
339871	413529	И-315\nИ-317
339872	413530	И-315\nИ-317
339873	413531	И-315\nИ-317
339874	413532	И-315\nИ-317
339875	413533	И-315\nИ-317
339876	413534	И-315\nИ-317
339877	413535	И-315\nИ-317
339878	413536	И-315\nИ-317
339879	413537	И-315\nИ-317
339880	413538	А-328
339881	413539	А-328
339882	413540	А-328
339883	413541	А-328
339884	413542	А-328
339885	413543	А-328
339886	413544	А-328
339887	413545	А-328
339888	413546	А-328
339889	413547	А-328
339890	413548	А-328
339891	413549	А-328
339892	413550	А-328
339893	413551	А-328
339894	413552	А-328
339895	413553	А-328
339896	413554	Б-209-2
339897	413555	Б-209-2
339898	413556	Б-209-2
339899	413557	Б-209-2
339900	413558	Б-209-2
339901	413559	Б-209-2
339902	413560	Б-209-2
339903	413561	Б-209-2
339904	413562	Б-209-2
339905	413563	Б-209-2
339906	413564	Б-209-2
339907	413565	Б-209-2
339908	413566	Б-209-2
339909	413567	Б-209-2
339910	413568	Б-209-2
339911	413569	Б-209-2
339912	413570	Б-209-2
339913	413571	Б-209-2
339914	413572	Б-209-2
339915	413573	Б-209-2
339916	413574	Б-209-2
339917	413575	Б-209-2
339918	413576	Б-209-2
339919	413577	Б-209-2
339920	413578	Б-209-2
339921	413579	Б-209-2
339922	413580	Б-209-2
339923	413581	Б-209-2
339924	413582	Б-209-2
339925	413583	Б-209-2
339926	413584	Б-209-2
339927	413585	Б-209-2
339928	413586	А-13
339929	413587	А-13
339930	413588	А-13
339931	413589	А-13
339932	413590	А-13
339933	413591	А-13
339934	413592	А-13
339935	413593	А-13
339936	413594	А-13
339937	413595	А-13
339938	413596	А-13
339939	413597	А-13
339940	413598	А-13
339941	413599	А-13
339942	413600	А-13
339943	413601	А-13
339944	413602	А-215
339945	413603	А-215
339946	413604	А-215
339947	413605	А-215
339948	413606	А-215
339949	413607	А-215
339950	413608	А-215
339951	413609	А-215
339952	413610	А-215
339953	413611	А-215
339954	413612	А-215
339955	413613	А-215
339956	413614	А-215
339957	413615	А-215
339958	413616	А-215
339959	413617	А-215
339960	413618	А-107
339961	413619	А-107
339962	413620	А-107
339963	413621	А-107
339964	413622	А-107
339965	413623	А-107
339966	413624	А-107
339967	413625	А-107
339968	413626	А-107
339969	413627	А-107
339970	413628	А-107
339971	413629	А-107
339972	413630	А-107
339973	413631	А-107
339974	413632	А-107
339975	413633	А-107
339976	413634	А-217
339977	413635	А-217
339978	413636	А-217
339979	413637	А-217
339980	413638	А-217
339981	413639	А-217
339982	413640	А-217
339983	413641	А-217
339984	413642	А-217
339985	413643	А-217
339986	413644	А-217
339987	413645	А-217
339988	413646	А-217
339989	413647	А-217
339990	413648	А-217
339991	413649	А-217
339992	413650	А-213-м
339993	413651	А-213-м
339994	413652	А-213-м
339995	413653	А-213-м
339996	413654	А-213-м
339997	413655	А-213-м
339998	413656	А-213-м
339999	413657	А-213-м
340000	413658	А-13
340001	413659	А-13
340002	413660	А-13
340003	413661	А-13
340004	413662	А-13
340005	413663	А-13
340006	413664	А-13
340007	413665	А-13
340008	413666	А-13
340009	413667	А-13
340010	413668	А-13
340011	413669	А-13
340012	413670	А-13
340013	413671	А-13
340014	413672	А-13
340015	413673	А-13
340016	413674	А-13
340017	413675	А-13
340018	413676	А-13
340019	413677	А-13
340020	413678	А-13
340021	413679	А-13
340022	413680	А-13
340023	413681	А-13
340024	413682	А-215
340025	413683	А-215
340026	413684	А-215
340027	413685	А-215
340028	413686	А-215
340029	413687	А-215
340030	413688	А-215
340031	413689	А-215
340032	413690	А-215
340033	413691	А-215
340034	413692	А-215
340035	413693	А-215
340036	413694	А-215
340037	413695	А-215
340038	413696	А-215
340039	413697	А-215
340040	413698	А-182
340041	413699	А-182
340042	413700	А-182
340043	413701	А-182
340044	413702	А-182
340045	413703	А-182
340046	413704	А-182
340047	413705	А-182
340048	413706	Б-209-2
340049	413707	Б-209-2
340050	413708	Б-209-2
340051	413709	Б-209-2
340052	413710	Б-209-2
340053	413711	Б-209-2
340054	413712	Б-209-2
340055	413713	Б-209-2
340056	413714	ФОК
340057	413715	ФОК
340058	413716	ФОК
340059	413717	ФОК
340060	413718	ФОК
340061	413719	ФОК
340062	413720	ФОК
340063	413721	ФОК
340064	413722	ФОК
340065	413723	ФОК
340066	413724	ФОК
340067	413725	ФОК
340068	413726	ФОК
340069	413727	ФОК
340070	413728	ФОК
340071	413729	ФОК
340072	413730	???
340073	413731	???
340074	413732	???
340075	413733	???
340076	413734	???
340077	413735	???
340078	413736	???
340079	413737	???
340080	413738	???
340081	413739	???
340082	413740	???
340083	413741	???
340084	413742	???
340085	413743	???
340086	413744	???
340087	413745	???
340088	413746	А-13
340089	413747	А-13
340090	413748	А-13
340091	413749	А-13
340092	413750	А-13
340093	413751	А-13
340094	413752	А-13
340095	413753	А-13
340096	413754	А-13
340097	413755	А-13
340098	413756	А-13
340099	413757	А-13
340100	413758	А-13
340101	413759	А-13
340102	413760	А-13
340103	413761	А-13
340104	413762	А-13
340105	413763	А-13
340106	413764	А-13
340107	413765	А-13
340108	413766	А-13
340109	413767	А-13
340110	413768	А-13
340111	413769	А-13
340112	413770	А-13
340113	413771	А-13
340114	413772	А-13
340115	413773	А-13
340116	413774	А-13
340117	413775	А-13
340118	413776	А-13
340119	413777	А-13
340120	413778	А-13
340121	413779	А-13
340122	413780	А-13
340123	413781	А-13
340124	413782	А-13
340125	413783	А-13
340126	413784	А-13
340127	413785	А-13
340128	413786	Б-209
340129	413787	Б-209
340130	413788	Б-209
340131	413789	Б-209
340132	413790	Б-209
340133	413791	Б-209
340134	413792	Б-209
340135	413793	Б-209
340136	413794	Б-209
340137	413795	Б-209
340138	413796	Б-209
340139	413797	Б-209
340140	413798	Б-209
340141	413799	Б-209
340142	413800	Б-209
340143	413801	Б-209
340144	413802	А-61\n(МП-1)
340145	413803	А-61\n(МП-1)
340146	413804	А-61\n(МП-1)
340147	413805	А-61\n(МП-1)
340148	413806	А-61\n(МП-1)
340149	413807	А-61\n(МП-1)
340150	413808	А-61\n(МП-1)
340151	413809	А-61\n(МП-1)
340152	413810	А-231\n(МП-1)
340153	413811	А-231\n(МП-1)
340154	413812	А-231\n(МП-1)
340155	413813	А-231\n(МП-1)
340156	413814	А-231\n(МП-1)
340157	413815	А-231\n(МП-1)
340158	413816	А-231\n(МП-1)
340159	413817	А-231\n(МП-1)
340160	413818	А-175
340161	413819	А-175
340162	413820	А-175
340163	413821	А-175
340164	413822	А-175
340165	413823	А-175
340166	413824	А-175
340167	413825	А-175
340168	413826	Б-209-1
340169	413827	Б-209-1
340170	413828	Б-209-1
340171	413829	Б-209-1
340172	413830	Б-209-1
340173	413831	Б-209-1
340174	413832	Б-209-1
340175	413833	Б-209-1
340176	413834	И-201
340177	413835	И-201
340178	413836	И-201
340179	413837	И-201
340180	413838	И-201
340181	413839	И-201
340182	413840	И-201
340183	413841	И-201
340184	413842	Б-209-2
340185	413843	Б-209-2
340186	413844	Б-209-2
340187	413845	Б-209-2
340188	413846	Б-209-2
340189	413847	Б-209-2
340190	413848	Б-209-2
340191	413849	Б-209-2
340192	413850	Б-209-2
340193	413851	Б-209-2
340194	413852	Б-209-2
340195	413853	Б-209-2
340196	413854	Б-209-2
340197	413855	Б-209-2
340198	413856	Б-209-2
340199	413857	Б-209-2
340200	413858	А-107
340201	413859	А-107
340202	413860	А-107
340203	413861	А-107
340204	413862	А-107
340205	413863	А-107
340206	413864	А-107
340207	413865	А-107
340208	413866	А-107
340209	413867	А-107
340210	413868	А-107
340211	413869	А-107
340212	413870	А-107
340213	413871	А-107
340214	413872	А-107
340215	413873	А-107
340216	413874	Г-102
340217	413875	Г-102
340218	413876	Г-102
340219	413877	Г-102
340220	413878	Г-102
340221	413879	Г-102
340222	413880	Г-102
340223	413881	Г-102
340224	413882	Г-102
340225	413883	Г-102
340226	413884	Г-102
340227	413885	Г-102
340228	413886	Г-102
340229	413887	Г-102
340230	413888	Г-102
340231	413889	Г-102
340232	413890	И-201
340233	413891	И-201
340234	413892	И-201
340235	413893	И-201
340236	413894	И-201
340237	413895	И-201
340238	413896	И-201
340239	413897	И-201
340240	413898	А-13
340241	413899	А-13
340242	413900	А-13
340243	413901	А-13
340244	413902	А-13
340245	413903	А-13
340246	413904	А-13
340247	413905	А-13
340248	413906	И-313
340249	413907	И-313
340250	413908	И-313
340251	413909	И-313
340252	413910	И-313
340253	413911	И-313
340254	413912	И-313
340255	413913	И-313
340256	413914	И-313
340257	413915	И-313
340258	413916	И-313
340259	413917	И-313
340260	413918	И-313
340261	413919	И-313
340262	413920	И-313
340263	413921	И-313
340264	413922	А-213-м
340265	413923	А-213-м
340266	413924	А-213-м
340267	413925	А-213-м
340268	413926	А-213-м
340269	413927	А-213-м
340270	413928	А-213-м
340271	413929	А-213-м
340272	413930	Б-209-2
340273	413931	Б-209-2
340274	413932	Б-209-2
340275	413933	Б-209-2
340276	413934	Б-209-2
340277	413935	Б-209-2
340278	413936	Б-209-2
340279	413937	Б-209-2
340280	413938	ФОК
340281	413939	ФОК
340282	413940	ФОК
340283	413941	ФОК
340284	413942	ФОК
340285	413943	ФОК
340286	413944	ФОК
340287	413945	ФОК
340288	413946	ФОК
340289	413947	ФОК
340290	413948	ФОК
340291	413949	ФОК
340292	413950	ФОК
340293	413951	ФОК
340294	413952	ФОК
340295	413953	ФОК
340296	413954	А-215
340297	413955	А-215
340298	413956	А-215
340299	413957	А-215
340300	413958	А-215
340301	413959	А-215
340302	413960	А-215
340303	413961	А-215
340304	413962	А-215
340305	413963	А-215
340306	413964	А-215
340307	413965	А-215
340308	413966	А-215
340309	413967	А-215
340310	413968	А-215
340311	413969	А-215
340312	413970	А-13
340313	413971	А-13
340314	413972	А-13
340315	413973	А-13
340316	413974	А-13
340317	413975	А-13
340318	413976	А-13
340319	413977	А-13
340320	413978	А-61\n(МП-1)
340321	413979	А-61\n(МП-1)
340322	413980	А-61\n(МП-1)
340323	413981	А-61\n(МП-1)
340324	413982	А-61\n(МП-1)
340325	413983	А-61\n(МП-1)
340326	413984	А-61\n(МП-1)
340327	413985	А-61\n(МП-1)
340328	413986	А-350\n(МП-1)
340329	413987	А-350\n(МП-1)
340330	413988	А-350\n(МП-1)
340331	413989	А-350\n(МП-1)
340332	413990	А-350\n(МП-1)
340333	413991	А-350\n(МП-1)
340334	413992	А-350\n(МП-1)
340335	413993	А-350\n(МП-1)
340336	413994	А-107
340337	413995	А-107
340338	413996	А-107
340339	413997	А-107
340340	413998	А-107
340341	413999	А-107
340342	414000	А-107
340343	414001	А-107
340344	414002	А-107
340345	414003	А-107
340346	414004	А-107
340347	414005	А-107
340348	414006	А-107
340349	414007	А-107
340350	414008	А-107
340351	414009	А-107
340352	414010	Б-209-2
340353	414011	Б-209-2
340354	414012	Б-209-2
340355	414013	Б-209-2
340356	414014	Б-209-2
340357	414015	Б-209-2
340358	414016	Б-209-2
340359	414017	Б-209-2
340360	414018	Б-209-2
340361	414019	Б-209-2
340362	414020	Б-209-2
340363	414021	Б-209-2
340364	414022	Б-209-2
340365	414023	Б-209-2
340366	414024	Б-209-2
340367	414025	Б-209-2
340368	414026	Б-209-1
340369	414027	Б-209-1
340370	414028	Б-209-1
340371	414029	Б-209-1
340372	414030	Б-209-1
340373	414031	Б-209-1
340374	414032	Б-209-1
340375	414033	Б-209-1
340376	414098	Д-208
340377	414099	Д-208
340378	414100	Д-208
340379	414101	Д-208
340380	414102	Д-208
340381	414103	Д-208
340382	414104	Д-208
340383	414105	Д-208
340384	414106	ИВЦ-116
340385	414107	ИВЦ-116
340386	414108	ИВЦ-116
340387	414109	ИВЦ-116
340388	414110	ИВЦ-116
340389	414111	ИВЦ-116
340390	414112	ИВЦ-116
340391	414113	ИВЦ-116
340392	414114	ИВЦ-116
340393	414115	ИВЦ-116
340394	414116	ИВЦ-116
340395	414117	ИВЦ-116
340396	414118	ИВЦ-116
340397	414119	ИВЦ-116
340398	414120	ИВЦ-116
340399	414121	ИВЦ-116
340400	414122	Б-209-2
340401	414123	Б-209-2
340402	414124	Б-209-2
340403	414125	Б-209-2
340404	414126	Б-209-2
340405	414127	Б-209-2
340406	414128	Б-209-2
340407	414129	Б-209-2
340408	414130	Б-209-1
340409	414131	Б-209-1
340410	414132	Б-209-1
340411	414133	Б-209-1
340412	414134	Б-209-1
340413	414135	Б-209-1
340414	414136	Б-209-1
340415	414137	Б-209-1
340416	414138	ИВЦ-116
340417	414139	ИВЦ-116
340418	414140	ИВЦ-116
340419	414141	ИВЦ-116
340420	414142	ИВЦ-116
340421	414143	ИВЦ-116
340422	414144	ИВЦ-116
340423	414145	ИВЦ-116
340424	414146	Б-209
340425	414147	Б-209
340426	414148	Б-209
340427	414149	Б-209
340428	414150	Б-209
340429	414151	Б-209
340430	414152	Б-209
340431	414153	Б-209
340432	414154	Б-209
340433	414155	Б-209
340434	414156	Б-209
340435	414157	Б-209
340436	414158	Б-209
340437	414159	Б-209
340438	414160	Б-209
340439	414161	Б-209
340440	414162	Б-209
340441	414163	Б-209
340442	414164	Б-209
340443	414165	Б-209
340444	414166	Б-209
340445	414167	Б-209
340446	414168	Б-209
340447	414169	Б-209
340448	414170	Б-209
340449	414171	Б-209
340450	414172	Б-209
340451	414173	Б-209
340452	414174	Б-209
340453	414175	Б-209
340454	414176	Б-209
340455	414177	Б-209
340456	414178	Б-209
340457	414179	Б-209
340458	414180	Б-209
340459	414181	Б-209
340460	414182	Б-209
340461	414183	Б-209
340462	414184	Б-209
340463	414185	Б-209
340464	414186	Б-209
340465	414187	Б-209
340466	414188	Б-209
340467	414189	Б-209
340468	414190	Б-209
340469	414191	Б-209
340470	414192	Б-209
340471	414193	Б-209
340472	414194	Д-208
340473	414195	Д-208
340474	414196	Д-208
340475	414197	Д-208
340476	414198	Д-208
340477	414199	Д-208
340478	414200	Д-208
340479	414201	Д-208
340480	414202	Д-208
340481	414203	Д-208
340482	414204	Д-208
340483	414205	Д-208
340484	414206	Д-208
340485	414207	Д-208
340486	414208	Д-208
340487	414209	Д-208
340488	414210	А-329
340489	414211	А-329
340490	414212	А-329
340491	414213	А-329
340492	414214	А-329
340493	414215	А-329
340494	414216	А-329
340495	414217	А-329
340496	414218	А-329
340497	414219	А-329
340498	414220	А-329
340499	414221	А-329
340500	414222	А-329
340501	414223	А-329
340502	414224	А-329
340503	414225	А-329
340504	414226	Д-208
340505	414227	Д-208
340506	414228	Д-208
340507	414229	Д-208
340508	414230	Д-208
340509	414231	Д-208
340510	414232	Д-208
340511	414233	Д-208
340512	414234	Д-208
340513	414235	Д-208
340514	414236	Д-208
340515	414237	Д-208
340516	414238	Д-208
340517	414239	Д-208
340518	414240	Д-208
340519	414241	Д-208
340520	414306	А-15
340521	414307	А-15
340522	414308	А-15
340523	414309	А-15
340524	414310	А-15
340525	414311	А-15
340526	414312	А-15
340527	414313	А-15
340528	414314	А-11
340529	414315	А-11
340530	414316	А-11
340531	414317	А-11
340532	414318	А-11
340533	414319	А-11
340534	414320	А-11
340535	414321	А-11
340536	414322	А-11
340537	414323	А-11
340538	414324	А-11
340539	414325	А-11
340540	414326	А-11
340541	414327	А-11
340542	414328	А-11
340543	414329	А-11
340544	414330	А-11
340545	414331	А-11
340546	414332	А-11
340547	414333	А-11
340548	414334	А-11
340549	414335	А-11
340550	414336	А-11
340551	414337	А-11
340552	414338	А-11
340553	414339	А-11
340554	414340	А-11
340555	414341	А-11
340556	414342	А-11
340557	414343	А-11
340558	414344	А-11
340559	414345	А-11
340560	414346	А-107
340561	414347	А-107
340562	414348	А-107
340563	414349	А-107
340564	414350	А-107
340565	414351	А-107
340566	414352	А-107
340567	414353	А-107
340568	414354	А-107
340569	414355	А-107
340570	414356	А-107
340571	414357	А-107
340572	414358	А-107
340573	414359	А-107
340574	414360	А-107
340575	414361	А-107
340576	414362	Г-213
340577	414363	Г-213
340578	414364	Г-213
340579	414365	Г-213
340580	414366	Г-213
340581	414367	Г-213
340582	414368	Г-213
340583	414369	Г-213
340584	414370	Г-213
340585	414371	Г-213
340586	414372	Г-213
340587	414373	Г-213
340588	414374	Г-213
340589	414375	Г-213
340590	414376	Г-213
340591	414377	Г-213
340592	414378	А-217
340593	414379	А-217
340594	414380	А-217
340595	414381	А-217
340596	414382	А-217
340597	414383	А-217
340598	414384	А-217
340599	414385	А-217
340600	414386	А-217
340601	414387	А-217
340602	414388	А-217
340603	414389	А-217
340604	414390	А-217
340605	414391	А-217
340606	414392	А-217
340607	414393	А-217
340608	414394	А-1
340609	414395	А-1
340610	414396	А-1
340611	414397	А-1
340612	414398	А-1
340613	414399	А-1
340614	414400	А-1
340615	414401	А-1
340616	414402	Б-209
340617	414403	Б-209
340618	414404	Б-209
340619	414405	Б-209
340620	414406	Б-209
340621	414407	Б-209
340622	414408	Б-209
340623	414409	Б-209
340624	414474	Б-209-2
340625	414475	Б-209-2
340626	414476	Б-209-2
340627	414477	Б-209-2
340628	414478	Б-209-2
340629	414479	Б-209-2
340630	414480	Б-209-2
340631	414481	Б-209-2
340632	414482	А-222
340633	414483	А-222
340634	414484	А-222
340635	414485	А-222
340636	414486	А-222
340637	414487	А-222
340638	414488	А-222
340639	414489	А-222
340640	414490	А-222
340641	414491	А-222
340642	414492	А-222
340643	414493	А-222
340644	414494	А-222
340645	414495	А-222
340646	414496	А-222
340647	414497	А-222
340648	414562	Г-213
340649	414563	Г-213
340650	414564	Г-213
340651	414565	Г-213
340652	414566	Г-213
340653	414567	Г-213
340654	414568	Г-213
340655	414569	Г-213
340656	414570	Г-213
340657	414571	Г-213
340658	414572	Г-213
340659	414573	Г-213
340660	414574	Г-213
340661	414575	Г-213
340662	414576	Г-213
340663	414577	Г-213
340664	414578	А-217
340665	414579	А-217
340666	414580	А-217
340667	414581	А-217
340668	414582	А-217
340669	414583	А-217
340670	414584	А-217
340671	414585	А-217
340672	414586	А-217
340673	414587	А-217
340674	414588	А-217
340675	414589	А-217
340676	414590	А-217
340677	414591	А-217
340678	414592	А-217
340679	414593	А-217
340680	414594	А-107
340681	414595	А-107
340682	414596	А-107
340683	414597	А-107
340684	414598	А-107
340685	414599	А-107
340686	414600	А-107
340687	414601	А-107
340688	414602	А-107
340689	414603	А-107
340690	414604	А-107
340691	414605	А-107
340692	414606	А-107
340693	414607	А-107
340694	414608	А-107
340695	414609	А-107
340696	414610	База
340697	414611	База
340698	414612	База
340699	414613	База
340700	414614	Б-209
340701	414615	Б-209
340702	414616	Б-209
340703	414617	Б-209
340704	414618	Б-209
340705	414619	Б-209
340706	414620	Б-209
340707	414621	Б-209
340708	414622	Б-209
340709	414623	Б-209
340710	414624	Б-209
340711	414625	Б-209
340712	414626	Б-209
340713	414627	Б-209
340714	414628	Б-209
340715	414629	Б-209
340716	414630	Б-209
340717	414631	Б-209
340718	414632	Б-209
340719	414633	Б-209
340720	414634	Б-209
340721	414635	Б-209
340722	414636	Б-209
340723	414637	Б-209
340724	414638	Б-209
340725	414639	Б-209
340726	414640	Б-209
340727	414641	Б-209
340728	414642	Б-209
340729	414643	Б-209
340730	414644	Б-209
340731	414645	Б-209
340732	414710	Б-209
340733	414711	Б-209
340734	414712	Б-209
340735	414713	Б-209
340736	414714	Б-209
340737	414715	Б-209
340738	414716	Б-209
340739	414717	Б-209
340740	414718	Б-209
340741	414719	Б-209
340742	414720	Б-209
340743	414721	Б-209
340744	414722	Б-209
340745	414723	Б-209
340746	414724	Б-209
340747	414725	Б-209
340748	414726	Б-209
340749	414727	Б-209
340750	414728	Б-209
340751	414729	Б-209
340752	414730	Б-209
340753	414731	Б-209
340754	414732	Б-209
340755	414733	Б-209
340756	414734	Б-209
340757	414735	Б-209
340758	414736	Б-209
340759	414737	Б-209
340760	414738	Б-209
340761	414739	Б-209
340762	414740	Б-209
340763	414741	Б-209
340764	414742	А-316
340765	414743	А-316
340766	414744	А-316
340767	414745	А-316
340768	414746	А-316
340769	414747	А-316
340770	414748	А-316
340771	414749	А-316
340772	414750	А-316
340773	414751	А-316
340774	414752	А-316
340775	414753	А-316
340776	414754	А-316
340777	414755	А-316
340778	414756	А-316
340779	414757	А-316
340780	415062	Б-209-1
340781	415063	Б-209-1
340782	415064	Б-209-1
340783	415065	Б-209-1
340784	415066	Б-209-1
340785	415067	Б-209-1
340786	415068	Б-209-1
340787	415069	Б-209-1
340788	415070	Б-209-1
340789	415071	Б-209-1
340790	415072	Б-209-1
340791	415073	Б-209-1
340792	415074	Б-209-1
340793	415075	Б-209-1
340794	415076	Б-209-1
340795	415077	Б-209-1
340796	415078	Б-209-1
340797	415079	Б-209-1
340798	415080	Б-209-1
340799	415081	Б-209-1
340800	415082	Б-209-1
340801	415083	Б-209-1
340802	415084	Б-209-1
340803	415085	Б-209-1
340804	415086	Б-209-1
340805	415087	Б-209-1
340806	415088	Б-209-1
340807	415089	Б-209-1
340808	415090	Б-209-1
340809	415091	Б-209-1
340810	415092	Б-209-1
340811	415093	Б-209-1
340812	415094	Б-209-2
340813	415095	Б-209-2
340814	415096	Б-209-2
340815	415097	Б-209-2
340816	415098	Б-209-2
340817	415099	Б-209-2
340818	415100	Б-209-2
340819	415101	Б-209-2
340820	415102	Б-209-2
340821	415103	Б-209-2
340822	415104	Б-209-2
340823	415105	Б-209-2
340824	415106	Б-209-2
340825	415107	Б-209-2
340826	415108	Б-209-2
340827	415109	Б-209-2
340828	415110	База
340829	415111	База
340830	415112	База
340831	415113	База
340832	415114	База
340833	415115	База
340834	415116	База
340835	415117	База
340836	415118	База
340837	415119	База
340838	415120	База
340839	415121	База
340840	415122	База
340841	415123	База
340842	415124	База
340843	415125	???
340844	415126	???
340845	415127	???
340846	415128	???
340847	415129	???
340848	415130	???
340849	415131	???
340850	415132	???
340851	415133	???
340852	415134	???
340853	415135	???
340854	415136	???
340855	415137	???
340856	415138	???
340857	415139	???
340858	415140	???
340859	415141	Б-209-2
340860	415142	Б-209-2
340861	415143	Б-209-2
340862	415144	Б-209-2
340863	415145	Б-209-2
340864	415146	Б-209-2
340865	415147	Б-209-2
340866	415148	Б-209-2
340867	415149	Б-209-2
340868	415150	Б-209-2
340869	415151	Б-209-2
340870	415152	Б-209-2
340871	415153	Б-209-2
340872	415154	Б-209-2
340873	415155	Б-209-2
340874	415156	Б-209-2
340875	415157	Б-209-1
340876	415158	Б-209-1
340877	415159	Б-209-1
340878	415160	Б-209-1
340879	415161	Б-209-1
340880	415162	Б-209-1
340881	415163	Б-209-1
340882	415164	Б-209-1
340883	415165	Б-209-1
340884	415166	Б-209-1
340885	415167	Б-209-1
340886	415168	Б-209-1
340887	415169	Б-209-1
340888	415170	Б-209-1
340889	415171	Б-209-1
340890	415172	Б-209-1
340891	415397	А-215
340892	415398	А-215
340893	415399	А-215
340894	415400	А-215
340895	415401	А-215
340896	415402	А-215
340897	415403	А-215
340898	415404	А-215
\.


--
-- Data for Name: sc_rasp7; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp7 (id, semcode, version, disc_id, weekday, pair, weeksarray, weekstext) FROM stdin;
40358	242501	3	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40359	242501	3	1	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40360	242501	3	2	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40361	242501	3	2	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40362	242501	3	3	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40363	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40364	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40365	242501	3	5	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40366	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
40367	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
40368	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40369	242501	3	7	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40370	242501	3	8	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40371	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40372	242501	3	4	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40373	242501	3	6	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40374	242501	3	10	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40375	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40376	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40377	242501	3	11	6	1	{1,3,5,7,9,11,13,15}	Iн
40378	242501	3	11	6	1	{1,3,5,7,9,11,13,15}	Iн
40379	242501	3	6	6	2	{1,3,5,7,9,11,13,15}	Iн
40380	242501	3	6	6	3	{1,3,5,7,9,11,13,15}	Iн
40381	242501	3	1	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40382	242501	3	4	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40383	242501	3	8	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40384	242501	3	5	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40385	242501	3	12	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40386	242501	3	3	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40387	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40388	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40389	242501	3	7	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40390	242501	3	0	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40391	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
40392	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
40393	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40394	242501	3	2	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40395	242501	3	2	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40396	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40397	242501	3	6	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40398	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40399	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40400	242501	3	6	5	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40401	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
40402	242501	3	2	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40403	242501	3	2	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40404	242501	3	6	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40405	242501	3	6	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40406	242501	3	4	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40407	242501	3	12	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40408	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40409	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40410	242501	3	1	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40411	242501	3	5	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40412	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
40413	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
40414	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40415	242501	3	3	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40416	242501	3	7	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40417	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40418	242501	3	0	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40419	242501	3	8	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40420	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40421	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40422	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
40423	242501	3	6	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40424	242501	3	6	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40425	242501	3	5	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40426	242501	3	3	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40427	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40428	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40429	242501	3	12	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40430	242501	3	4	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40431	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
40432	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
40433	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40434	242501	3	8	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40435	242501	3	7	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40436	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40437	242501	3	1	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40438	242501	3	0	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40439	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40440	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40441	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
40442	242501	3	2	6	2	{2,4,6,8,10,12,14,16}	IIн
40443	242501	3	2	6	3	{2,4,6,8,10,12,14,16}	IIн
40444	242501	3	2	6	4	{2,4,6,8,10,12,14,16}	IIн
40445	242501	3	2	6	5	{2,4,6,8,10,12,14,16}	IIн
40446	242501	3	13	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40447	242501	3	14	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40501	242501	3	26	2	5	{2,4,6,8,10,12,14,16}	IIн
40448	242501	3	12	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40449	242501	3	15	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40450	242501	3	16	2	1	{1,3,5,7,9,11,13,15}	Iн
40451	242501	3	16	2	1	{2,4,6,8,10,12,14,16}	IIн
40452	242501	3	15	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40453	242501	3	15	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40454	242501	3	17	2	4	{2,4,6,8,10,12,14,16}	IIн
40455	242501	3	17	2	5	{2,4,6,8,10,12,14,16}	IIн
40456	242501	3	3	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40457	242501	3	18	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40458	242501	3	15	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40459	242501	3	12	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40460	242501	3	19	3	5	{2,4,6,8,10,12,14,16}	IIн
40461	242501	3	20	4	2	{2,4,6,8,10,12,14,16}	IIн
40462	242501	3	20	4	3	{2,4,6,8,10,12,14,16}	IIн
40463	242501	3	21	4	4	{1,3,5,7,9,11,13,15}	Iн
40464	242501	3	21	4	5	{1,3,5,7,9,11,13,15}	Iн
40465	242501	3	22	5	3	{1,3,5,7,9,11,13,15}	Iн
40466	242501	3	17	5	4	{1,3,5,7,9,11,13,15}	Iн
40467	242501	3	19	5	4	{2,4,6,8,10,12,14,16}	IIн
40468	242501	3	22	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40469	242501	3	13	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40470	242501	3	12	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40471	242501	3	15	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40472	242501	3	19	2	1	{1,3,5,7,9,11,13,15}	Iн
40473	242501	3	16	2	1	{2,4,6,8,10,12,14,16}	IIн
40474	242501	3	15	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40475	242501	3	18	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40476	242501	3	16	2	4	{1,3,5,7,9,11,13,15}	Iн
40477	242501	3	17	2	4	{2,4,6,8,10,12,14,16}	IIн
40478	242501	3	17	2	5	{1,3,5,7,9,11,13,15}	Iн
40479	242501	3	3	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40480	242501	3	14	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40481	242501	3	15	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40482	242501	3	12	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40483	242501	3	19	3	5	{2,4,6,8,10,12,14,16}	IIн
40484	242501	3	20	4	2	{2,4,6,8,10,12,14,16}	IIн
40485	242501	3	20	4	3	{2,4,6,8,10,12,14,16}	IIн
40486	242501	3	21	4	4	{1,3,5,7,9,11,13,15}	Iн
40487	242501	3	21	4	5	{1,3,5,7,9,11,13,15}	Iн
40488	242501	3	23	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40489	242501	3	22	5	3	{1,3,5,7,9,11,13,15}	Iн
40490	242501	3	22	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40491	242501	3	17	5	5	{1,3,5,7,9,11,13,15}	Iн
40492	242501	3	24	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40493	242501	3	24	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40494	242501	3	24	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40495	242501	3	24	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40496	242501	3	25	2	2	{2,4,6,8,10,12,14,16}	IIн
40497	242501	3	26	2	3	{1,3,5,7,9,11,13,15}	Iн
40498	242501	3	25	2	3	{2,4,6,8,10,12,14,16}	IIн
40499	242501	3	27	2	4	{1,3,5,7,9,11,13,15}	Iн
40500	242501	3	28	2	5	{1,3,5,7,9,11,13,15}	Iн
40502	242501	3	25	2	6	{1,3,5,7,9,11,13,15}	Iн
40503	242501	3	26	2	6	{2,4,6,8,10,12,14,16}	IIн
40504	242501	3	29	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40505	242501	3	29	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40506	242501	3	30	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40507	242501	3	26	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40508	242501	3	31	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40509	242501	3	32	4	1	{1,3,5,7,9,11,13,15}	Iн
40510	242501	3	32	4	2	{1,3,5,7,9,11,13,15}	Iн
40511	242501	3	32	4	3	{1,3,5,7,9,11,13,15}	Iн
40512	242501	3	32	4	1	{2,4,6,8,10,12,14,16}	IIн
40513	242501	3	32	4	2	{2,4,6,8,10,12,14,16}	IIн
40514	242501	3	32	4	3	{2,4,6,8,10,12,14,16}	IIн
40515	242501	3	32	4	4	{2,4,6,8,10,12,14,16}	IIн
40516	242501	3	32	4	5	{2,4,6,8,10,12,14,16}	IIн
40517	242501	3	33	4	4	{1,3,5,7,9,11,13,15}	Iн
40518	242501	3	34	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40519	242501	3	35	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40520	242501	3	35	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40521	242501	3	34	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40522	242501	3	33	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40523	242501	3	27	6	1	{1,3,5,7,9,11,13,15}	Iн
40524	242501	3	27	6	1	{2,4,6,8,10,12,14,16}	IIн
40525	242501	3	36	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40526	242501	3	36	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40527	242501	3	36	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40528	242501	3	36	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40529	242501	3	25	2	2	{2,4,6,8,10,12,14,16}	IIн
40530	242501	3	26	2	3	{1,3,5,7,9,11,13,15}	Iн
40531	242501	3	25	2	3	{2,4,6,8,10,12,14,16}	IIн
40532	242501	3	27	2	4	{2,4,6,8,10,12,14,16}	IIн
40533	242501	3	28	2	5	{1,3,5,7,9,11,13,15}	Iн
40534	242501	3	26	2	5	{2,4,6,8,10,12,14,16}	IIн
40535	242501	3	25	2	6	{1,3,5,7,9,11,13,15}	Iн
40536	242501	3	26	2	6	{2,4,6,8,10,12,14,16}	IIн
40537	242501	3	29	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40538	242501	3	29	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40539	242501	3	30	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40540	242501	3	26	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40541	242501	3	31	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40542	242501	3	32	4	1	{1,3,5,7,9,11,13,15}	Iн
40543	242501	3	32	4	2	{1,3,5,7,9,11,13,15}	Iн
40544	242501	3	32	4	3	{1,3,5,7,9,11,13,15}	Iн
40545	242501	3	32	4	1	{2,4,6,8,10,12,14,16}	IIн
40546	242501	3	32	4	2	{2,4,6,8,10,12,14,16}	IIн
40547	242501	3	32	4	3	{2,4,6,8,10,12,14,16}	IIн
40548	242501	3	32	4	4	{2,4,6,8,10,12,14,16}	IIн
40549	242501	3	32	4	5	{2,4,6,8,10,12,14,16}	IIн
40550	242501	3	33	4	4	{1,3,5,7,9,11,13,15}	Iн
40551	242501	3	34	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40552	242501	3	35	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40553	242501	3	34	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40554	242501	3	33	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40785	242501	3	32	4	2	{1,3,5,7,9,11,13,15}	Iн
40555	242501	3	35	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40556	242501	3	27	6	1	{1,3,5,7,9,11,13,15}	Iн
40557	242501	3	27	6	1	{2,4,6,8,10,12,14,16}	IIн
40558	242501	3	37	1	3	{5,6,7,8}	5-8
40559	242501	3	38	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40560	242501	3	38	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40561	242501	3	24	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40562	242501	3	24	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40563	242501	3	24	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40564	242501	3	24	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40565	242501	3	29	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40566	242501	3	29	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40567	242501	3	30	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40568	242501	3	32	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40569	242501	3	32	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40570	242501	3	32	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40571	242501	3	32	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40572	242501	3	32	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40573	242501	3	37	1	3	{5,6,7,8}	5-8
40574	242501	3	38	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40575	242501	3	38	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40576	242501	3	24	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40577	242501	3	24	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40578	242501	3	24	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40579	242501	3	24	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40580	242501	3	29	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40581	242501	3	29	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40582	242501	3	30	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40583	242501	3	32	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40584	242501	3	32	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40585	242501	3	32	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40586	242501	3	32	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40587	242501	3	32	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40588	242501	3	32	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40589	242501	3	32	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40590	242501	3	32	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40591	242501	3	32	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40592	242501	3	32	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40593	242501	3	39	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40594	242501	3	40	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40595	242501	3	40	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40596	242501	3	39	2	4	{3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40597	242501	3	41	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40598	242501	3	42	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40599	242501	3	43	3	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40600	242501	3	32	4	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40601	242501	3	32	4	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40602	242501	3	32	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40603	242501	3	32	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40604	242501	3	32	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40605	242501	3	32	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40606	242501	3	32	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40607	242501	3	32	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40608	242501	3	32	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40609	242501	3	32	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40610	242501	3	44	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40611	242501	3	44	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40612	242501	3	44	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40613	242501	3	44	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40614	242501	3	45	1	5	{2,4,6,8,10,12,14,16}	IIн
40615	242501	3	44	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40616	242501	3	44	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40617	242501	3	44	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40618	242501	3	44	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40619	242501	3	44	2	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40620	242501	3	46	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40621	242501	3	45	3	3	{2,4,6,8,10,12,14,16}	IIн
40622	242501	3	47	3	4	{1,3,5,7,9,11,13,15,17}	Iн
40623	242501	3	45	3	4	{2,4,6,8,10,12,14,16}	IIн
40624	242501	3	47	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40625	242501	3	43	3	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40626	242501	3	44	4	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40627	242501	3	44	4	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40628	242501	3	44	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40629	242501	3	44	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40630	242501	3	44	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40631	242501	3	48	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40632	242501	3	48	5	5	{1,3,5,7,9,11,13,15,17}	Iн
40633	242501	3	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40634	242501	3	1	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40635	242501	3	2	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40636	242501	3	2	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40637	242501	3	3	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40638	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40639	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40640	242501	3	5	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40641	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
40642	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
40643	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40644	242501	3	7	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40645	242501	3	8	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40646	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40647	242501	3	4	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40648	242501	3	6	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40649	242501	3	10	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40650	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40651	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40652	242501	3	11	6	1	{1,3,5,7,9,11,13,15}	Iн
40653	242501	3	11	6	1	{1,3,5,7,9,11,13,15}	Iн
40654	242501	3	6	6	2	{1,3,5,7,9,11,13,15}	Iн
40655	242501	3	6	6	3	{1,3,5,7,9,11,13,15}	Iн
40656	242501	3	1	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40657	242501	3	4	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40658	242501	3	8	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40659	242501	3	5	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40660	242501	3	12	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40661	242501	3	3	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40662	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40663	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40664	242501	3	7	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40665	242501	3	0	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40666	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
40667	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
40668	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40669	242501	3	2	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40670	242501	3	2	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40671	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40672	242501	3	6	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40673	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40674	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40675	242501	3	6	5	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40676	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
40677	242501	3	2	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40678	242501	3	2	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40679	242501	3	6	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40680	242501	3	6	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40681	242501	3	4	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40682	242501	3	12	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40683	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40684	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40685	242501	3	1	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40686	242501	3	5	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40687	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
40688	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
40689	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40690	242501	3	3	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40691	242501	3	7	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40692	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40693	242501	3	0	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40694	242501	3	8	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40695	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40696	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40697	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
40698	242501	3	6	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40699	242501	3	6	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40700	242501	3	5	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40701	242501	3	3	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40702	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40703	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40704	242501	3	12	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40705	242501	3	4	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40706	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
40707	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
40708	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40709	242501	3	8	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40710	242501	3	7	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40711	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40712	242501	3	1	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40713	242501	3	0	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40714	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40715	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40716	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
40717	242501	3	2	6	2	{2,4,6,8,10,12,14,16}	IIн
40718	242501	3	2	6	3	{2,4,6,8,10,12,14,16}	IIн
40719	242501	3	2	6	4	{2,4,6,8,10,12,14,16}	IIн
40720	242501	3	2	6	5	{2,4,6,8,10,12,14,16}	IIн
40721	242501	3	13	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40722	242501	3	14	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40723	242501	3	12	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40724	242501	3	15	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40725	242501	3	16	2	1	{1,3,5,7,9,11,13,15}	Iн
40726	242501	3	16	2	1	{2,4,6,8,10,12,14,16}	IIн
40727	242501	3	15	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40728	242501	3	15	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40729	242501	3	17	2	4	{2,4,6,8,10,12,14,16}	IIн
40730	242501	3	17	2	5	{2,4,6,8,10,12,14,16}	IIн
40731	242501	3	3	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40732	242501	3	18	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40733	242501	3	15	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40734	242501	3	12	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40735	242501	3	19	3	5	{2,4,6,8,10,12,14,16}	IIн
40736	242501	3	20	4	2	{2,4,6,8,10,12,14,16}	IIн
40737	242501	3	20	4	3	{2,4,6,8,10,12,14,16}	IIн
40738	242501	3	21	4	4	{1,3,5,7,9,11,13,15}	Iн
40739	242501	3	21	4	5	{1,3,5,7,9,11,13,15}	Iн
40740	242501	3	22	5	3	{1,3,5,7,9,11,13,15}	Iн
40741	242501	3	17	5	4	{1,3,5,7,9,11,13,15}	Iн
40742	242501	3	19	5	4	{2,4,6,8,10,12,14,16}	IIн
40743	242501	3	22	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40744	242501	3	13	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40745	242501	3	12	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40746	242501	3	15	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40747	242501	3	19	2	1	{1,3,5,7,9,11,13,15}	Iн
40748	242501	3	16	2	1	{2,4,6,8,10,12,14,16}	IIн
40749	242501	3	15	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40750	242501	3	18	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40751	242501	3	16	2	4	{1,3,5,7,9,11,13,15}	Iн
40752	242501	3	17	2	4	{2,4,6,8,10,12,14,16}	IIн
40753	242501	3	17	2	5	{1,3,5,7,9,11,13,15}	Iн
40754	242501	3	3	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40755	242501	3	14	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40756	242501	3	15	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40757	242501	3	12	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40758	242501	3	19	3	5	{2,4,6,8,10,12,14,16}	IIн
40759	242501	3	20	4	2	{2,4,6,8,10,12,14,16}	IIн
40760	242501	3	20	4	3	{2,4,6,8,10,12,14,16}	IIн
40761	242501	3	21	4	4	{1,3,5,7,9,11,13,15}	Iн
40762	242501	3	21	4	5	{1,3,5,7,9,11,13,15}	Iн
40763	242501	3	23	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40764	242501	3	22	5	3	{1,3,5,7,9,11,13,15}	Iн
40765	242501	3	22	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40766	242501	3	17	5	5	{1,3,5,7,9,11,13,15}	Iн
40767	242501	3	24	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40768	242501	3	24	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40769	242501	3	24	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40770	242501	3	24	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40771	242501	3	25	2	2	{2,4,6,8,10,12,14,16}	IIн
40772	242501	3	26	2	3	{1,3,5,7,9,11,13,15}	Iн
40773	242501	3	25	2	3	{2,4,6,8,10,12,14,16}	IIн
40774	242501	3	27	2	4	{1,3,5,7,9,11,13,15}	Iн
40775	242501	3	28	2	5	{1,3,5,7,9,11,13,15}	Iн
40776	242501	3	26	2	5	{2,4,6,8,10,12,14,16}	IIн
40777	242501	3	25	2	6	{1,3,5,7,9,11,13,15}	Iн
40778	242501	3	26	2	6	{2,4,6,8,10,12,14,16}	IIн
40779	242501	3	29	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40780	242501	3	29	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40781	242501	3	30	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40782	242501	3	26	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40783	242501	3	31	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40784	242501	3	32	4	1	{1,3,5,7,9,11,13,15}	Iн
40786	242501	3	32	4	3	{1,3,5,7,9,11,13,15}	Iн
40787	242501	3	32	4	1	{2,4,6,8,10,12,14,16}	IIн
40788	242501	3	32	4	2	{2,4,6,8,10,12,14,16}	IIн
40789	242501	3	32	4	3	{2,4,6,8,10,12,14,16}	IIн
40790	242501	3	32	4	4	{2,4,6,8,10,12,14,16}	IIн
40791	242501	3	32	4	5	{2,4,6,8,10,12,14,16}	IIн
40792	242501	3	33	4	4	{1,3,5,7,9,11,13,15}	Iн
40793	242501	3	34	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40794	242501	3	35	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40795	242501	3	35	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40796	242501	3	34	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40797	242501	3	33	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40798	242501	3	27	6	1	{1,3,5,7,9,11,13,15}	Iн
40799	242501	3	27	6	1	{2,4,6,8,10,12,14,16}	IIн
40800	242501	3	36	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40801	242501	3	36	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40802	242501	3	36	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40803	242501	3	36	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40804	242501	3	25	2	2	{2,4,6,8,10,12,14,16}	IIн
40805	242501	3	26	2	3	{1,3,5,7,9,11,13,15}	Iн
40806	242501	3	25	2	3	{2,4,6,8,10,12,14,16}	IIн
40807	242501	3	27	2	4	{2,4,6,8,10,12,14,16}	IIн
40808	242501	3	28	2	5	{1,3,5,7,9,11,13,15}	Iн
40809	242501	3	26	2	5	{2,4,6,8,10,12,14,16}	IIн
40810	242501	3	25	2	6	{1,3,5,7,9,11,13,15}	Iн
40811	242501	3	26	2	6	{2,4,6,8,10,12,14,16}	IIн
40812	242501	3	29	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40813	242501	3	29	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40814	242501	3	30	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40815	242501	3	26	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40816	242501	3	31	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40817	242501	3	32	4	1	{1,3,5,7,9,11,13,15}	Iн
40818	242501	3	32	4	2	{1,3,5,7,9,11,13,15}	Iн
40819	242501	3	32	4	3	{1,3,5,7,9,11,13,15}	Iн
40820	242501	3	32	4	1	{2,4,6,8,10,12,14,16}	IIн
40821	242501	3	32	4	2	{2,4,6,8,10,12,14,16}	IIн
40822	242501	3	32	4	3	{2,4,6,8,10,12,14,16}	IIн
40823	242501	3	32	4	4	{2,4,6,8,10,12,14,16}	IIн
40824	242501	3	32	4	5	{2,4,6,8,10,12,14,16}	IIн
40825	242501	3	33	4	4	{1,3,5,7,9,11,13,15}	Iн
40826	242501	3	34	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40827	242501	3	35	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40828	242501	3	34	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40829	242501	3	33	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40830	242501	3	35	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40831	242501	3	27	6	1	{1,3,5,7,9,11,13,15}	Iн
40832	242501	3	27	6	1	{2,4,6,8,10,12,14,16}	IIн
40833	242501	3	37	1	3	{5,6,7,8}	5-8
40834	242501	3	38	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40835	242501	3	38	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40836	242501	3	24	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40837	242501	3	24	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40838	242501	3	24	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40839	242501	3	24	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40840	242501	3	29	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40841	242501	3	29	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40842	242501	3	30	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40843	242501	3	32	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40844	242501	3	32	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40845	242501	3	32	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40846	242501	3	32	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40847	242501	3	32	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40848	242501	3	37	1	3	{5,6,7,8}	5-8
40849	242501	3	38	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40850	242501	3	38	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40851	242501	3	24	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40852	242501	3	24	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40853	242501	3	24	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40854	242501	3	24	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40855	242501	3	29	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40856	242501	3	29	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40857	242501	3	30	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40858	242501	3	32	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40859	242501	3	32	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40860	242501	3	32	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40861	242501	3	32	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40862	242501	3	32	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40863	242501	3	32	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40864	242501	3	32	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40865	242501	3	32	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40866	242501	3	32	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40867	242501	3	32	1	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40868	242501	3	39	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40869	242501	3	40	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40870	242501	3	40	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40871	242501	3	39	2	4	{3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40872	242501	3	41	3	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40873	242501	3	42	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40874	242501	3	43	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40875	242501	3	32	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40876	242501	3	32	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40877	242501	3	32	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40878	242501	3	32	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40879	242501	3	32	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40880	242501	3	32	5	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40881	242501	3	32	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40882	242501	3	32	5	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40883	242501	3	32	5	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40884	242501	3	32	5	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40885	242501	3	44	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40886	242501	3	44	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40887	242501	3	44	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40888	242501	3	44	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40889	242501	3	45	1	5	{2,4,6,8,10,12,14,16}	IIн
40890	242501	3	44	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40891	242501	3	44	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40892	242501	3	44	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40893	242501	3	44	2	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40894	242501	3	44	2	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40895	242501	3	46	3	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40896	242501	3	45	3	3	{2,4,6,8,10,12,14,16}	IIн
40897	242501	3	47	3	4	{3,5,7,9,11,13,15,17}	Iн
40898	242501	3	45	3	4	{2,4,6,8,10,12,14,16}	IIн
40899	242501	3	47	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40900	242501	3	43	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40901	242501	3	44	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40902	242501	3	44	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40903	242501	3	44	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40904	242501	3	44	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40905	242501	3	44	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40906	242501	3	48	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
40907	242501	3	48	5	5	{3,5,7,9,11,13,15,17}	Iн
40908	242501	3	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40909	242501	3	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40910	242501	3	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40911	242501	3	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40912	242501	3	1	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40913	242501	3	2	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40914	242501	3	2	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40915	242501	3	3	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40916	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40917	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40918	242501	3	5	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40919	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
40920	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
40921	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40922	242501	3	7	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40923	242501	3	8	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40924	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40925	242501	3	4	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40926	242501	3	6	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40927	242501	3	10	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40928	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40929	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40930	242501	3	11	6	1	{1,3,5,7,9,11,13,15}	Iн
40931	242501	3	11	6	1	{1,3,5,7,9,11,13,15}	Iн
40932	242501	3	6	6	2	{1,3,5,7,9,11,13,15}	Iн
40933	242501	3	6	6	3	{1,3,5,7,9,11,13,15}	Iн
40934	242501	3	1	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40935	242501	3	4	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40936	242501	3	8	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40937	242501	3	5	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40938	242501	3	12	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40939	242501	3	3	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40940	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40941	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40942	242501	3	7	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40943	242501	3	0	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40944	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
40945	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
40946	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40947	242501	3	2	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40948	242501	3	2	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40949	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40950	242501	3	6	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40951	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40952	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40953	242501	3	6	5	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40954	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
40955	242501	3	2	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40956	242501	3	2	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40957	242501	3	6	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40958	242501	3	6	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40959	242501	3	4	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40960	242501	3	12	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40961	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40962	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40963	242501	3	1	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40964	242501	3	5	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40965	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
40966	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
40967	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40968	242501	3	3	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40969	242501	3	7	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40970	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40971	242501	3	0	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40972	242501	3	8	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40973	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40974	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40975	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
40976	242501	3	6	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40977	242501	3	6	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40978	242501	3	5	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40979	242501	3	3	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40980	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40981	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40982	242501	3	12	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40983	242501	3	4	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40984	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
40985	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
40986	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40987	242501	3	8	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40988	242501	3	7	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40989	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40990	242501	3	1	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40991	242501	3	0	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40992	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40993	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
40994	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
40995	242501	3	2	6	2	{2,4,6,8,10,12,14,16}	IIн
40996	242501	3	2	6	3	{2,4,6,8,10,12,14,16}	IIн
40997	242501	3	2	6	4	{2,4,6,8,10,12,14,16}	IIн
40998	242501	3	2	6	5	{2,4,6,8,10,12,14,16}	IIн
40999	242501	3	13	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41000	242501	3	14	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41001	242501	3	12	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41002	242501	3	15	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41003	242501	3	16	2	1	{1,3,5,7,9,11,13,15}	Iн
41004	242501	3	16	2	1	{2,4,6,8,10,12,14,16}	IIн
41005	242501	3	15	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41006	242501	3	15	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41007	242501	3	17	2	4	{2,4,6,8,10,12,14,16}	IIн
41008	242501	3	17	2	5	{2,4,6,8,10,12,14,16}	IIн
41009	242501	3	3	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41010	242501	3	18	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41011	242501	3	15	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41012	242501	3	12	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41013	242501	3	19	3	5	{2,4,6,8,10,12,14,16}	IIн
41014	242501	3	20	4	2	{2,4,6,8,10,12,14,16}	IIн
41015	242501	3	20	4	3	{2,4,6,8,10,12,14,16}	IIн
41016	242501	3	21	4	4	{1,3,5,7,9,11,13,15}	Iн
41017	242501	3	21	4	5	{1,3,5,7,9,11,13,15}	Iн
41018	242501	3	22	5	3	{1,3,5,7,9,11,13,15}	Iн
41019	242501	3	17	5	4	{1,3,5,7,9,11,13,15}	Iн
41020	242501	3	19	5	4	{2,4,6,8,10,12,14,16}	IIн
41021	242501	3	22	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41022	242501	3	13	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41023	242501	3	12	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41024	242501	3	15	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41025	242501	3	19	2	1	{1,3,5,7,9,11,13,15}	Iн
41026	242501	3	16	2	1	{2,4,6,8,10,12,14,16}	IIн
41027	242501	3	15	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41028	242501	3	18	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41029	242501	3	16	2	4	{1,3,5,7,9,11,13,15}	Iн
41030	242501	3	17	2	4	{2,4,6,8,10,12,14,16}	IIн
41031	242501	3	17	2	5	{1,3,5,7,9,11,13,15}	Iн
41032	242501	3	3	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41033	242501	3	14	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41034	242501	3	15	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41035	242501	3	12	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41036	242501	3	19	3	5	{2,4,6,8,10,12,14,16}	IIн
41037	242501	3	20	4	2	{2,4,6,8,10,12,14,16}	IIн
41038	242501	3	20	4	3	{2,4,6,8,10,12,14,16}	IIн
41039	242501	3	21	4	4	{1,3,5,7,9,11,13,15}	Iн
41040	242501	3	21	4	5	{1,3,5,7,9,11,13,15}	Iн
41041	242501	3	23	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41042	242501	3	22	5	3	{1,3,5,7,9,11,13,15}	Iн
41043	242501	3	22	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41044	242501	3	17	5	5	{1,3,5,7,9,11,13,15}	Iн
41045	242501	3	24	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41046	242501	3	24	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41047	242501	3	24	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41048	242501	3	24	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41049	242501	3	25	2	2	{2,4,6,8,10,12,14,16}	IIн
41050	242501	3	26	2	3	{1,3,5,7,9,11,13,15}	Iн
41051	242501	3	25	2	3	{2,4,6,8,10,12,14,16}	IIн
41052	242501	3	27	2	4	{1,3,5,7,9,11,13,15}	Iн
41053	242501	3	28	2	5	{1,3,5,7,9,11,13,15}	Iн
41054	242501	3	26	2	5	{2,4,6,8,10,12,14,16}	IIн
41055	242501	3	25	2	6	{1,3,5,7,9,11,13,15}	Iн
41056	242501	3	26	2	6	{2,4,6,8,10,12,14,16}	IIн
41057	242501	3	29	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41058	242501	3	29	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41059	242501	3	30	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41060	242501	3	26	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41061	242501	3	31	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41062	242501	3	32	4	1	{1,3,5,7,9,11,13,15}	Iн
41063	242501	3	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41064	242501	3	1	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41065	242501	3	2	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41066	242501	3	2	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41067	242501	3	3	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41068	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41069	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41070	242501	3	5	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41071	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
41072	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
41073	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41074	242501	3	7	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41075	242501	3	8	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41076	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41077	242501	3	4	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41078	242501	3	6	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41079	242501	3	10	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41080	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41081	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41082	242501	3	11	6	1	{1,3,5,7,9,11,13,15}	Iн
41083	242501	3	11	6	1	{1,3,5,7,9,11,13,15}	Iн
41084	242501	3	6	6	2	{1,3,5,7,9,11,13,15}	Iн
41085	242501	3	6	6	3	{1,3,5,7,9,11,13,15}	Iн
41086	242501	3	1	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41087	242501	3	4	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41088	242501	3	8	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41089	242501	3	5	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41090	242501	3	12	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41091	242501	3	3	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41092	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41093	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41094	242501	3	7	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41095	242501	3	0	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41096	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
41097	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
41098	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41099	242501	3	2	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41100	242501	3	2	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41101	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41102	242501	3	6	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41103	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41104	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41105	242501	3	6	5	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41106	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
41107	242501	3	2	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41108	242501	3	2	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41109	242501	3	6	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41110	242501	3	6	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41111	242501	3	4	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41112	242501	3	12	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41113	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41114	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41115	242501	3	1	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41116	242501	3	5	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41117	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
41118	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
41119	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41120	242501	3	3	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41121	242501	3	7	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41122	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41123	242501	3	0	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41124	242501	3	8	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41125	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41126	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41127	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
41128	242501	3	6	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41129	242501	3	6	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41130	242501	3	5	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41131	242501	3	3	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41132	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41133	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41134	242501	3	12	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41135	242501	3	4	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41136	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
41137	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
41138	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41139	242501	3	8	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41140	242501	3	7	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41141	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41142	242501	3	1	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41143	242501	3	0	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41144	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41145	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41146	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
41147	242501	3	2	6	2	{2,4,6,8,10,12,14,16}	IIн
41148	242501	3	2	6	3	{2,4,6,8,10,12,14,16}	IIн
41149	242501	3	2	6	4	{2,4,6,8,10,12,14,16}	IIн
41150	242501	3	2	6	5	{2,4,6,8,10,12,14,16}	IIн
41151	242501	3	13	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41152	242501	3	14	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41153	242501	3	12	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41154	242501	3	15	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41155	242501	3	16	2	1	{1,3,5,7,9,11,13,15}	Iн
41156	242501	3	16	2	1	{2,4,6,8,10,12,14,16}	IIн
41157	242501	3	15	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41158	242501	3	15	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41159	242501	3	17	2	4	{2,4,6,8,10,12,14,16}	IIн
41160	242501	3	17	2	5	{2,4,6,8,10,12,14,16}	IIн
41161	242501	3	3	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41162	242501	3	18	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41163	242501	3	15	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41164	242501	3	12	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41165	242501	3	19	3	5	{2,4,6,8,10,12,14,16}	IIн
41166	242501	3	20	4	2	{2,4,6,8,10,12,14,16}	IIн
41167	242501	3	20	4	3	{2,4,6,8,10,12,14,16}	IIн
41168	242501	3	21	4	4	{1,3,5,7,9,11,13,15}	Iн
41169	242501	3	21	4	5	{1,3,5,7,9,11,13,15}	Iн
41170	242501	3	22	5	3	{1,3,5,7,9,11,13,15}	Iн
41171	242501	3	17	5	4	{1,3,5,7,9,11,13,15}	Iн
41172	242501	3	19	5	4	{2,4,6,8,10,12,14,16}	IIн
41173	242501	3	22	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41174	242501	3	13	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41175	242501	3	12	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41176	242501	3	15	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41177	242501	3	19	2	1	{1,3,5,7,9,11,13,15}	Iн
41178	242501	3	16	2	1	{2,4,6,8,10,12,14,16}	IIн
41179	242501	3	15	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41180	242501	3	18	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41181	242501	3	16	2	4	{1,3,5,7,9,11,13,15}	Iн
41182	242501	3	17	2	4	{2,4,6,8,10,12,14,16}	IIн
41183	242501	3	17	2	5	{1,3,5,7,9,11,13,15}	Iн
41184	242501	3	3	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41185	242501	3	14	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41186	242501	3	15	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41187	242501	3	12	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41188	242501	3	19	3	5	{2,4,6,8,10,12,14,16}	IIн
41189	242501	3	20	4	2	{2,4,6,8,10,12,14,16}	IIн
41190	242501	3	20	4	3	{2,4,6,8,10,12,14,16}	IIн
41191	242501	3	21	4	4	{1,3,5,7,9,11,13,15}	Iн
41192	242501	3	21	4	5	{1,3,5,7,9,11,13,15}	Iн
41193	242501	3	23	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41194	242501	3	22	5	3	{1,3,5,7,9,11,13,15}	Iн
41195	242501	3	22	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41196	242501	3	17	5	5	{1,3,5,7,9,11,13,15}	Iн
41197	242501	3	24	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41198	242501	3	24	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41199	242501	3	24	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41200	242501	3	24	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41201	242501	3	25	2	2	{2,4,6,8,10,12,14,16}	IIн
41202	242501	3	26	2	3	{1,3,5,7,9,11,13,15}	Iн
41203	242501	3	25	2	3	{2,4,6,8,10,12,14,16}	IIн
41204	242501	3	27	2	4	{1,3,5,7,9,11,13,15}	Iн
41205	242501	3	28	2	5	{1,3,5,7,9,11,13,15}	Iн
41206	242501	3	26	2	5	{2,4,6,8,10,12,14,16}	IIн
41207	242501	3	25	2	6	{1,3,5,7,9,11,13,15}	Iн
41208	242501	3	26	2	6	{2,4,6,8,10,12,14,16}	IIн
41209	242501	3	29	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41210	242501	3	29	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41211	242501	3	30	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41212	242501	3	26	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41213	242501	3	31	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41214	242501	3	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41215	242501	3	1	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41216	242501	3	2	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41217	242501	3	2	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41218	242501	3	3	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41219	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41220	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41221	242501	3	5	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41222	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
41223	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
41224	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41225	242501	3	7	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41226	242501	3	8	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41227	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41228	242501	3	4	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41229	242501	3	6	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41230	242501	3	10	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41231	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41232	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41233	242501	3	11	6	1	{1,3,5,7,9,11,13,15}	Iн
41234	242501	3	11	6	1	{1,3,5,7,9,11,13,15}	Iн
41235	242501	3	6	6	2	{1,3,5,7,9,11,13,15}	Iн
41236	242501	3	6	6	3	{1,3,5,7,9,11,13,15}	Iн
41237	242501	3	1	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41238	242501	3	4	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41239	242501	3	8	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41240	242501	3	5	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41241	242501	3	12	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41242	242501	3	3	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41243	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41244	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41245	242501	3	7	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41246	242501	3	0	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41247	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
41248	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
41249	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41250	242501	3	2	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41251	242501	3	2	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41252	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41253	242501	3	6	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41254	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41255	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41256	242501	3	6	5	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41257	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
41258	242501	3	2	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41259	242501	3	2	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41260	242501	3	6	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41261	242501	3	6	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41262	242501	3	4	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41263	242501	3	12	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41264	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41265	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41266	242501	3	1	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41267	242501	3	5	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41268	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
41269	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
41270	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41271	242501	3	3	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41272	242501	3	7	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41273	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41274	242501	3	0	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41275	242501	3	8	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41276	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41277	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41278	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
41279	242501	3	6	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41280	242501	3	6	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41281	242501	3	5	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41282	242501	3	3	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41283	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41284	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41285	242501	3	12	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41286	242501	3	4	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41287	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
41288	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
41289	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41290	242501	3	8	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41291	242501	3	7	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41292	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41293	242501	3	1	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41294	242501	3	0	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41295	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41296	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41297	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
41298	242501	3	2	6	2	{2,4,6,8,10,12,14,16}	IIн
41299	242501	3	2	6	3	{2,4,6,8,10,12,14,16}	IIн
41300	242501	3	2	6	4	{2,4,6,8,10,12,14,16}	IIн
41301	242501	3	2	6	5	{2,4,6,8,10,12,14,16}	IIн
41302	242501	3	13	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41303	242501	3	14	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41304	242501	3	12	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41359	242501	3	26	2	6	{2,4,6,8,10,12,14,16}	IIн
41305	242501	3	15	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41306	242501	3	16	2	1	{1,3,5,7,9,11,13,15}	Iн
41307	242501	3	16	2	1	{2,4,6,8,10,12,14,16}	IIн
41308	242501	3	15	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41309	242501	3	15	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41310	242501	3	17	2	4	{2,4,6,8,10,12,14,16}	IIн
41311	242501	3	17	2	5	{2,4,6,8,10,12,14,16}	IIн
41312	242501	3	3	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41313	242501	3	18	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41314	242501	3	15	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41315	242501	3	12	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41316	242501	3	19	3	5	{2,4,6,8,10,12,14,16}	IIн
41317	242501	3	20	4	2	{2,4,6,8,10,12,14,16}	IIн
41318	242501	3	20	4	3	{2,4,6,8,10,12,14,16}	IIн
41319	242501	3	21	4	4	{1,3,5,7,9,11,13,15}	Iн
41320	242501	3	21	4	5	{1,3,5,7,9,11,13,15}	Iн
41321	242501	3	22	5	3	{1,3,5,7,9,11,13,15}	Iн
41322	242501	3	17	5	4	{1,3,5,7,9,11,13,15}	Iн
41323	242501	3	19	5	4	{2,4,6,8,10,12,14,16}	IIн
41324	242501	3	22	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41325	242501	3	13	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41326	242501	3	12	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41327	242501	3	15	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41328	242501	3	19	2	1	{1,3,5,7,9,11,13,15}	Iн
41329	242501	3	16	2	1	{2,4,6,8,10,12,14,16}	IIн
41330	242501	3	15	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41331	242501	3	18	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41332	242501	3	16	2	4	{1,3,5,7,9,11,13,15}	Iн
41333	242501	3	17	2	4	{2,4,6,8,10,12,14,16}	IIн
41334	242501	3	17	2	5	{1,3,5,7,9,11,13,15}	Iн
41335	242501	3	3	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41336	242501	3	14	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41337	242501	3	15	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41338	242501	3	12	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41339	242501	3	19	3	5	{2,4,6,8,10,12,14,16}	IIн
41340	242501	3	20	4	2	{2,4,6,8,10,12,14,16}	IIн
41341	242501	3	20	4	3	{2,4,6,8,10,12,14,16}	IIн
41342	242501	3	21	4	4	{1,3,5,7,9,11,13,15}	Iн
41343	242501	3	21	4	5	{1,3,5,7,9,11,13,15}	Iн
41344	242501	3	23	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41345	242501	3	22	5	3	{1,3,5,7,9,11,13,15}	Iн
41346	242501	3	22	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41347	242501	3	17	5	5	{1,3,5,7,9,11,13,15}	Iн
41348	242501	3	24	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41349	242501	3	24	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41350	242501	3	24	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41351	242501	3	24	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41352	242501	3	25	2	2	{2,4,6,8,10,12,14,16}	IIн
41353	242501	3	26	2	3	{1,3,5,7,9,11,13,15}	Iн
41354	242501	3	25	2	3	{2,4,6,8,10,12,14,16}	IIн
41355	242501	3	27	2	4	{1,3,5,7,9,11,13,15}	Iн
41356	242501	3	28	2	5	{1,3,5,7,9,11,13,15}	Iн
41357	242501	3	26	2	5	{2,4,6,8,10,12,14,16}	IIн
41358	242501	3	25	2	6	{1,3,5,7,9,11,13,15}	Iн
41360	242501	3	29	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41361	242501	3	29	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41362	242501	3	30	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41363	242501	3	26	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41364	242501	3	31	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41365	242501	3	32	4	1	{1,3,5,7,9,11,13,15}	Iн
41366	242501	3	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41367	242501	3	1	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41368	242501	3	2	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41369	242501	3	2	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41370	242501	3	3	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41371	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41372	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41373	242501	3	5	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41374	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
41375	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
41376	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41377	242501	3	7	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41378	242501	3	8	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41379	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41380	242501	3	4	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41381	242501	3	6	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41382	242501	3	10	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41383	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41384	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41385	242501	3	11	6	1	{1,3,5,7,9,11,13,15}	Iн
41386	242501	3	11	6	1	{1,3,5,7,9,11,13,15}	Iн
41387	242501	3	6	6	2	{1,3,5,7,9,11,13,15}	Iн
41388	242501	3	6	6	3	{1,3,5,7,9,11,13,15}	Iн
41389	242501	3	1	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41390	242501	3	4	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41391	242501	3	8	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41392	242501	3	5	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41393	242501	3	12	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41394	242501	3	3	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41395	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41396	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41397	242501	3	7	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41398	242501	3	0	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41399	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
41400	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
41401	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41402	242501	3	2	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41403	242501	3	2	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41404	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41405	242501	3	6	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41406	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41407	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41408	242501	3	6	5	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41409	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
41410	242501	3	2	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41411	242501	3	2	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41412	242501	3	6	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41413	242501	3	6	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41414	242501	3	4	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41415	242501	3	12	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41416	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41417	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41418	242501	3	1	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41419	242501	3	5	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41420	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
41421	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
41422	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41423	242501	3	3	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41424	242501	3	7	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41425	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41426	242501	3	0	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41427	242501	3	8	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41428	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41429	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41430	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
41431	242501	3	6	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41432	242501	3	6	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41433	242501	3	5	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41434	242501	3	3	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41435	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41436	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41437	242501	3	12	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41438	242501	3	4	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41439	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
41440	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
41441	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41442	242501	3	8	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41443	242501	3	7	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41444	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41445	242501	3	1	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41446	242501	3	0	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41447	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41448	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41449	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
41450	242501	3	2	6	2	{2,4,6,8,10,12,14,16}	IIн
41451	242501	3	2	6	3	{2,4,6,8,10,12,14,16}	IIн
41452	242501	3	2	6	4	{2,4,6,8,10,12,14,16}	IIн
41453	242501	3	2	6	5	{2,4,6,8,10,12,14,16}	IIн
41454	242501	3	13	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41455	242501	3	14	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41456	242501	3	12	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41457	242501	3	15	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41458	242501	3	16	2	1	{1,3,5,7,9,11,13,15}	Iн
41459	242501	3	16	2	1	{2,4,6,8,10,12,14,16}	IIн
41460	242501	3	15	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41461	242501	3	15	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41462	242501	3	17	2	4	{2,4,6,8,10,12,14,16}	IIн
41463	242501	3	17	2	5	{2,4,6,8,10,12,14,16}	IIн
41464	242501	3	3	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41465	242501	3	18	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41466	242501	3	15	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41467	242501	3	12	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41468	242501	3	19	3	5	{2,4,6,8,10,12,14,16}	IIн
41469	242501	3	20	4	2	{2,4,6,8,10,12,14,16}	IIн
41470	242501	3	20	4	3	{2,4,6,8,10,12,14,16}	IIн
41471	242501	3	21	4	4	{1,3,5,7,9,11,13,15}	Iн
41472	242501	3	21	4	5	{1,3,5,7,9,11,13,15}	Iн
41473	242501	3	22	5	3	{1,3,5,7,9,11,13,15}	Iн
41474	242501	3	17	5	4	{1,3,5,7,9,11,13,15}	Iн
41475	242501	3	19	5	4	{2,4,6,8,10,12,14,16}	IIн
41476	242501	3	22	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41477	242501	3	13	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41478	242501	3	12	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41479	242501	3	15	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41480	242501	3	19	2	1	{1,3,5,7,9,11,13,15}	Iн
41481	242501	3	16	2	1	{2,4,6,8,10,12,14,16}	IIн
41482	242501	3	15	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41483	242501	3	18	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41484	242501	3	16	2	4	{1,3,5,7,9,11,13,15}	Iн
41485	242501	3	17	2	4	{2,4,6,8,10,12,14,16}	IIн
41486	242501	3	17	2	5	{1,3,5,7,9,11,13,15}	Iн
41487	242501	3	3	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41488	242501	3	14	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41489	242501	3	15	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41490	242501	3	12	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41491	242501	3	19	3	5	{2,4,6,8,10,12,14,16}	IIн
41492	242501	3	20	4	2	{2,4,6,8,10,12,14,16}	IIн
41493	242501	3	20	4	3	{2,4,6,8,10,12,14,16}	IIн
41494	242501	3	21	4	4	{1,3,5,7,9,11,13,15}	Iн
41495	242501	3	21	4	5	{1,3,5,7,9,11,13,15}	Iн
41496	242501	3	23	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41497	242501	3	22	5	3	{1,3,5,7,9,11,13,15}	Iн
41498	242501	3	22	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41499	242501	3	17	5	5	{1,3,5,7,9,11,13,15}	Iн
41500	242501	3	24	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41501	242501	3	24	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41502	242501	3	24	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41503	242501	3	24	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41504	242501	3	25	2	2	{2,4,6,8,10,12,14,16}	IIн
41505	242501	3	26	2	3	{1,3,5,7,9,11,13,15}	Iн
41506	242501	3	25	2	3	{2,4,6,8,10,12,14,16}	IIн
41507	242501	3	27	2	4	{1,3,5,7,9,11,13,15}	Iн
41508	242501	3	28	2	5	{1,3,5,7,9,11,13,15}	Iн
41509	242501	3	26	2	5	{2,4,6,8,10,12,14,16}	IIн
41510	242501	3	25	2	6	{1,3,5,7,9,11,13,15}	Iн
41511	242501	3	26	2	6	{2,4,6,8,10,12,14,16}	IIн
41512	242501	3	29	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41513	242501	3	29	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41514	242501	3	30	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41515	242501	3	26	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41516	242501	3	31	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41517	242501	3	32	4	1	{1,3,5,7,9,11,13,15}	Iн
41518	242501	3	32	4	2	{1,3,5,7,9,11,13,15}	Iн
41519	242501	3	32	4	3	{1,3,5,7,9,11,13,15}	Iн
41520	242501	3	32	4	1	{2,4,6,8,10,12,14,16}	IIн
41521	242501	3	32	4	2	{2,4,6,8,10,12,14,16}	IIн
41522	242501	3	32	4	3	{2,4,6,8,10,12,14,16}	IIн
41523	242501	3	32	4	4	{2,4,6,8,10,12,14,16}	IIн
41524	242501	3	32	4	5	{2,4,6,8,10,12,14,16}	IIн
41525	242501	3	33	4	4	{1,3,5,7,9,11,13,15}	Iн
41526	242501	3	34	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41527	242501	3	35	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41528	242501	3	35	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41529	242501	3	34	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41530	242501	3	33	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41531	242501	3	27	6	1	{1,3,5,7,9,11,13,15}	Iн
41532	242501	3	27	6	1	{2,4,6,8,10,12,14,16}	IIн
41533	242501	3	36	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41534	242501	3	36	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41535	242501	3	36	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41536	242501	3	36	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41537	242501	3	25	2	2	{2,4,6,8,10,12,14,16}	IIн
41538	242501	3	26	2	3	{1,3,5,7,9,11,13,15}	Iн
41539	242501	3	25	2	3	{2,4,6,8,10,12,14,16}	IIн
41540	242501	3	27	2	4	{2,4,6,8,10,12,14,16}	IIн
41541	242501	3	28	2	5	{1,3,5,7,9,11,13,15}	Iн
41542	242501	3	26	2	5	{2,4,6,8,10,12,14,16}	IIн
41543	242501	3	25	2	6	{1,3,5,7,9,11,13,15}	Iн
41544	242501	3	26	2	6	{2,4,6,8,10,12,14,16}	IIн
41545	242501	3	29	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41546	242501	3	29	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41547	242501	3	30	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41548	242501	3	26	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41549	242501	3	31	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41550	242501	3	32	4	1	{1,3,5,7,9,11,13,15}	Iн
41551	242501	3	32	4	2	{1,3,5,7,9,11,13,15}	Iн
41552	242501	3	32	4	3	{1,3,5,7,9,11,13,15}	Iн
41553	242501	3	32	4	1	{2,4,6,8,10,12,14,16}	IIн
41554	242501	3	32	4	2	{2,4,6,8,10,12,14,16}	IIн
41555	242501	3	32	4	3	{2,4,6,8,10,12,14,16}	IIн
41556	242501	3	32	4	4	{2,4,6,8,10,12,14,16}	IIн
41557	242501	3	32	4	5	{2,4,6,8,10,12,14,16}	IIн
41558	242501	3	33	4	4	{1,3,5,7,9,11,13,15}	Iн
41559	242501	3	34	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41560	242501	3	35	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41561	242501	3	34	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41562	242501	3	33	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41563	242501	3	35	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41564	242501	3	27	6	1	{1,3,5,7,9,11,13,15}	Iн
41565	242501	3	27	6	1	{2,4,6,8,10,12,14,16}	IIн
41566	242501	3	37	1	3	{5,6,7,8}	5-8
41567	242501	3	38	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41568	242501	3	38	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41569	242501	3	24	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41570	242501	3	24	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41571	242501	3	24	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41572	242501	3	24	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41573	242501	3	29	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41574	242501	3	29	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41575	242501	3	30	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41576	242501	3	32	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41577	242501	3	32	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41578	242501	3	32	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41579	242501	3	32	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41580	242501	3	32	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41581	242501	3	37	1	3	{5,6,7,8}	5-8
41582	242501	3	38	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41583	242501	3	38	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41584	242501	3	24	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41585	242501	3	24	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41586	242501	3	24	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41587	242501	3	24	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41588	242501	3	29	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41589	242501	3	29	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41590	242501	3	30	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41591	242501	3	32	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41592	242501	3	32	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41593	242501	3	32	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41594	242501	3	32	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41595	242501	3	32	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41596	242501	3	32	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41597	242501	3	32	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41598	242501	3	32	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41599	242501	3	32	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41600	242501	3	32	1	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41601	242501	3	39	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41602	242501	3	40	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41603	242501	3	40	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41604	242501	3	39	2	4	{3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41605	242501	3	41	3	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41606	242501	3	42	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41607	242501	3	43	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41608	242501	3	32	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41609	242501	3	32	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41610	242501	3	32	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41611	242501	3	32	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41612	242501	3	32	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41613	242501	3	32	5	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41614	242501	3	32	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41615	242501	3	32	5	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41616	242501	3	32	5	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41617	242501	3	32	5	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41618	242501	3	44	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41619	242501	3	44	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41620	242501	3	44	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41621	242501	3	44	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41622	242501	3	45	1	5	{2,4,6,8,10,12,14,16}	IIн
41623	242501	3	44	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41624	242501	3	44	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41625	242501	3	44	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41626	242501	3	44	2	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41627	242501	3	44	2	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41628	242501	3	46	3	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41629	242501	3	45	3	3	{2,4,6,8,10,12,14,16}	IIн
41630	242501	3	47	3	4	{3,5,7,9,11,13,15,17}	Iн
41631	242501	3	45	3	4	{2,4,6,8,10,12,14,16}	IIн
41632	242501	3	47	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41633	242501	3	43	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41634	242501	3	44	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41635	242501	3	44	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41636	242501	3	44	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41637	242501	3	44	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41638	242501	3	44	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41639	242501	3	48	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41640	242501	3	48	5	5	{3,5,7,9,11,13,15,17}	Iн
41641	242501	3	0	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41642	242501	3	1	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41643	242501	3	2	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41644	242501	3	2	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41645	242501	3	3	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41646	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41647	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41648	242501	3	5	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41649	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
41650	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
41651	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41652	242501	3	7	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41653	242501	3	8	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41654	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41655	242501	3	4	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41656	242501	3	6	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41657	242501	3	10	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41658	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41659	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41660	242501	3	11	6	1	{1,3,5,7,9,11,13,15}	Iн
41661	242501	3	11	6	1	{1,3,5,7,9,11,13,15}	Iн
41662	242501	3	6	6	2	{1,3,5,7,9,11,13,15}	Iн
41663	242501	3	6	6	3	{1,3,5,7,9,11,13,15}	Iн
41664	242501	3	1	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41665	242501	3	4	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41666	242501	3	8	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41667	242501	3	5	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41668	242501	3	12	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41669	242501	3	3	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41670	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41671	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41672	242501	3	7	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41673	242501	3	0	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41674	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
41675	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
41676	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41677	242501	3	2	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41678	242501	3	2	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41679	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41680	242501	3	6	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41681	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41682	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41683	242501	3	6	5	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41684	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
41685	242501	3	2	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41686	242501	3	2	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41687	242501	3	6	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41688	242501	3	6	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41689	242501	3	4	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41690	242501	3	12	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41691	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41692	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41693	242501	3	1	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41694	242501	3	5	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41695	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
41696	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
41697	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41698	242501	3	3	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41699	242501	3	7	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41700	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41701	242501	3	0	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41702	242501	3	8	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41703	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41704	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41705	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
41706	242501	3	6	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41707	242501	3	6	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41708	242501	3	5	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41709	242501	3	3	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41710	242501	3	4	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41711	242501	3	5	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41712	242501	3	12	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41713	242501	3	4	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41714	242501	3	6	3	5	{2,4,6,8,10,12,14,16}	IIн
41715	242501	3	7	4	2	{1,3,5,7,9,11,13,15}	Iн
41716	242501	3	8	4	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41717	242501	3	8	4	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41718	242501	3	7	4	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41719	242501	3	9	4	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41720	242501	3	1	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41721	242501	3	0	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41722	242501	3	10	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41723	242501	3	0	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41724	242501	3	2	6	1	{1,3,5,7,9,11,13,15}	Iн
41725	242501	3	2	6	2	{2,4,6,8,10,12,14,16}	IIн
41726	242501	3	2	6	3	{2,4,6,8,10,12,14,16}	IIн
41727	242501	3	2	6	4	{2,4,6,8,10,12,14,16}	IIн
41728	242501	3	2	6	5	{2,4,6,8,10,12,14,16}	IIн
41729	242501	3	13	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41730	242501	3	14	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41731	242501	3	12	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41732	242501	3	15	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41733	242501	3	16	2	1	{1,3,5,7,9,11,13,15}	Iн
41734	242501	3	16	2	1	{2,4,6,8,10,12,14,16}	IIн
41735	242501	3	15	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41736	242501	3	15	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41737	242501	3	17	2	4	{2,4,6,8,10,12,14,16}	IIн
41738	242501	3	17	2	5	{2,4,6,8,10,12,14,16}	IIн
41739	242501	3	3	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41740	242501	3	18	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41741	242501	3	15	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41742	242501	3	12	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41743	242501	3	19	3	5	{2,4,6,8,10,12,14,16}	IIн
41744	242501	3	20	4	2	{2,4,6,8,10,12,14,16}	IIн
41745	242501	3	20	4	3	{2,4,6,8,10,12,14,16}	IIн
41746	242501	3	21	4	4	{1,3,5,7,9,11,13,15}	Iн
41747	242501	3	21	4	5	{1,3,5,7,9,11,13,15}	Iн
41748	242501	3	22	5	3	{1,3,5,7,9,11,13,15}	Iн
41749	242501	3	17	5	4	{1,3,5,7,9,11,13,15}	Iн
41750	242501	3	19	5	4	{2,4,6,8,10,12,14,16}	IIн
41751	242501	3	22	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41752	242501	3	13	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41753	242501	3	12	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41754	242501	3	15	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41755	242501	3	19	2	1	{1,3,5,7,9,11,13,15}	Iн
41756	242501	3	16	2	1	{2,4,6,8,10,12,14,16}	IIн
41757	242501	3	15	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41758	242501	3	18	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41759	242501	3	16	2	4	{1,3,5,7,9,11,13,15}	Iн
41760	242501	3	17	2	4	{2,4,6,8,10,12,14,16}	IIн
41761	242501	3	17	2	5	{1,3,5,7,9,11,13,15}	Iн
41762	242501	3	3	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41763	242501	3	14	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41764	242501	3	15	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41765	242501	3	12	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41766	242501	3	19	3	5	{2,4,6,8,10,12,14,16}	IIн
41767	242501	3	20	4	2	{2,4,6,8,10,12,14,16}	IIн
41768	242501	3	20	4	3	{2,4,6,8,10,12,14,16}	IIн
41769	242501	3	21	4	4	{1,3,5,7,9,11,13,15}	Iн
41770	242501	3	21	4	5	{1,3,5,7,9,11,13,15}	Iн
41771	242501	3	23	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41772	242501	3	22	5	3	{1,3,5,7,9,11,13,15}	Iн
41773	242501	3	22	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41774	242501	3	17	5	5	{1,3,5,7,9,11,13,15}	Iн
41775	242501	3	24	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41776	242501	3	24	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41777	242501	3	24	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41778	242501	3	24	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41779	242501	3	25	2	2	{2,4,6,8,10,12,14,16}	IIн
41780	242501	3	26	2	3	{1,3,5,7,9,11,13,15}	Iн
41781	242501	3	25	2	3	{2,4,6,8,10,12,14,16}	IIн
41782	242501	3	27	2	4	{1,3,5,7,9,11,13,15}	Iн
41783	242501	3	28	2	5	{1,3,5,7,9,11,13,15}	Iн
41784	242501	3	26	2	5	{2,4,6,8,10,12,14,16}	IIн
41785	242501	3	25	2	6	{1,3,5,7,9,11,13,15}	Iн
41786	242501	3	26	2	6	{2,4,6,8,10,12,14,16}	IIн
41787	242501	3	29	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41788	242501	3	29	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41789	242501	3	30	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41790	242501	3	26	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41791	242501	3	31	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41792	242501	3	32	4	1	{1,3,5,7,9,11,13,15}	Iн
41793	242501	3	32	4	2	{1,3,5,7,9,11,13,15}	Iн
41794	242501	3	32	4	3	{1,3,5,7,9,11,13,15}	Iн
41795	242501	3	32	4	1	{2,4,6,8,10,12,14,16}	IIн
41796	242501	3	32	4	2	{2,4,6,8,10,12,14,16}	IIн
41797	242501	3	32	4	3	{2,4,6,8,10,12,14,16}	IIн
41798	242501	3	32	4	4	{2,4,6,8,10,12,14,16}	IIн
41799	242501	3	32	4	5	{2,4,6,8,10,12,14,16}	IIн
41800	242501	3	33	4	4	{1,3,5,7,9,11,13,15}	Iн
41801	242501	3	34	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41802	242501	3	35	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41803	242501	3	35	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41804	242501	3	34	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41805	242501	3	33	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41806	242501	3	27	6	1	{1,3,5,7,9,11,13,15}	Iн
41807	242501	3	27	6	1	{2,4,6,8,10,12,14,16}	IIн
41808	242501	3	36	1	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41809	242501	3	36	1	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41810	242501	3	36	1	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41811	242501	3	36	1	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41812	242501	3	25	2	2	{2,4,6,8,10,12,14,16}	IIн
41813	242501	3	26	2	3	{1,3,5,7,9,11,13,15}	Iн
41814	242501	3	25	2	3	{2,4,6,8,10,12,14,16}	IIн
41815	242501	3	27	2	4	{2,4,6,8,10,12,14,16}	IIн
41816	242501	3	28	2	5	{1,3,5,7,9,11,13,15}	Iн
41817	242501	3	26	2	5	{2,4,6,8,10,12,14,16}	IIн
41818	242501	3	25	2	6	{1,3,5,7,9,11,13,15}	Iн
41819	242501	3	26	2	6	{2,4,6,8,10,12,14,16}	IIн
41820	242501	3	29	3	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41821	242501	3	29	3	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41822	242501	3	30	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41823	242501	3	26	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41824	242501	3	31	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41825	242501	3	32	4	1	{1,3,5,7,9,11,13,15}	Iн
41826	242501	3	32	4	2	{1,3,5,7,9,11,13,15}	Iн
41827	242501	3	32	4	3	{1,3,5,7,9,11,13,15}	Iн
41828	242501	3	32	4	1	{2,4,6,8,10,12,14,16}	IIн
41829	242501	3	32	4	2	{2,4,6,8,10,12,14,16}	IIн
41830	242501	3	32	4	3	{2,4,6,8,10,12,14,16}	IIн
41831	242501	3	32	4	4	{2,4,6,8,10,12,14,16}	IIн
41832	242501	3	32	4	5	{2,4,6,8,10,12,14,16}	IIн
41833	242501	3	33	4	4	{1,3,5,7,9,11,13,15}	Iн
41834	242501	3	34	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41835	242501	3	35	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41836	242501	3	34	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41837	242501	3	33	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41838	242501	3	35	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41839	242501	3	27	6	1	{1,3,5,7,9,11,13,15}	Iн
41840	242501	3	27	6	1	{2,4,6,8,10,12,14,16}	IIн
41841	242501	3	37	1	3	{5,6,7,8}	5-8
41842	242501	3	38	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41843	242501	3	38	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41844	242501	3	24	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41845	242501	3	24	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41846	242501	3	24	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41847	242501	3	24	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41848	242501	3	29	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41849	242501	3	29	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41850	242501	3	30	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41851	242501	3	32	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41852	242501	3	32	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41853	242501	3	32	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41854	242501	3	32	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41855	242501	3	32	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41856	242501	3	37	1	3	{5,6,7,8}	5-8
41857	242501	3	38	1	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41858	242501	3	38	1	6	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41859	242501	3	24	2	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41860	242501	3	24	2	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41861	242501	3	24	2	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41862	242501	3	24	2	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41863	242501	3	29	3	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41864	242501	3	29	3	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41865	242501	3	30	3	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41866	242501	3	32	5	1	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41867	242501	3	32	5	2	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41868	242501	3	32	5	3	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41869	242501	3	32	5	4	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41870	242501	3	32	5	5	{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
41871	242501	3	32	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41872	242501	3	32	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41873	242501	3	32	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41874	242501	3	32	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41875	242501	3	32	1	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41876	242501	3	39	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41877	242501	3	40	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41878	242501	3	40	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41879	242501	3	39	2	4	{3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41880	242501	3	41	3	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41881	242501	3	42	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41882	242501	3	43	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41883	242501	3	32	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41884	242501	3	32	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41885	242501	3	32	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41886	242501	3	32	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41887	242501	3	32	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41888	242501	3	32	5	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41889	242501	3	32	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41890	242501	3	32	5	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41891	242501	3	32	5	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41892	242501	3	32	5	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41893	242501	3	44	1	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41894	242501	3	44	1	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41895	242501	3	44	1	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41896	242501	3	44	1	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41897	242501	3	45	1	5	{2,4,6,8,10,12,14,16}	IIн
41898	242501	3	44	2	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41899	242501	3	44	2	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41900	242501	3	44	2	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41901	242501	3	44	2	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41902	242501	3	44	2	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41903	242501	3	46	3	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41904	242501	3	45	3	3	{2,4,6,8,10,12,14,16}	IIн
41905	242501	3	47	3	4	{3,5,7,9,11,13,15,17}	Iн
41906	242501	3	45	3	4	{2,4,6,8,10,12,14,16}	IIн
41907	242501	3	47	3	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41908	242501	3	43	3	6	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41909	242501	3	44	4	1	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41910	242501	3	44	4	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41911	242501	3	44	4	3	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41912	242501	3	44	4	4	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41913	242501	3	44	4	5	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41914	242501	3	48	5	2	{2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
41915	242501	3	48	5	5	{3,5,7,9,11,13,15,17}	Iн
\.


--
-- Data for Name: sc_rasp7_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp7_groups (id, rasp7_id, group_id, subgroup) FROM stdin;
40349	40358	0	0
40350	40359	0	0
40351	40360	0	1
40352	40361	0	2
40353	40362	0	0
40354	40363	0	0
40355	40364	0	0
40356	40365	0	0
40357	40366	0	0
40358	40367	0	0
40359	40368	0	0
40360	40369	0	0
40361	40370	0	0
40362	40371	0	0
40363	40372	0	0
40364	40373	0	1
40365	40374	0	0
40366	40375	0	0
40367	40376	0	0
40368	40377	0	1
40369	40378	0	2
40370	40379	0	2
40371	40380	0	2
40372	40381	1	0
40373	40382	1	0
40374	40383	1	0
40375	40384	1	0
40376	40385	1	0
40377	40386	1	0
40378	40387	1	0
40379	40388	1	0
40380	40389	1	0
40381	40390	1	0
40382	40391	1	0
40383	40392	1	0
40384	40393	1	0
40385	40394	1	1
40386	40395	1	2
40387	40396	1	0
40388	40397	1	1
40389	40398	1	0
40390	40399	1	0
40391	40400	1	2
40392	40401	1	0
40393	40402	2	1
40394	40403	2	2
40395	40404	2	1
40396	40405	2	2
40397	40406	2	0
40398	40407	2	0
40399	40408	2	0
40400	40409	2	0
40401	40410	2	0
40402	40411	2	0
40403	40412	2	0
40404	40413	2	0
40405	40414	2	0
40406	40415	2	0
40407	40416	2	0
40408	40417	2	0
40409	40418	2	0
40410	40419	2	0
40411	40420	2	0
40412	40421	2	0
40413	40422	2	0
40414	40423	3	1
40415	40424	3	2
40416	40425	3	0
40417	40426	3	0
40418	40427	3	0
40419	40428	3	0
40420	40429	3	0
40421	40430	3	0
40422	40431	3	0
40423	40432	3	0
40424	40433	3	0
40425	40434	3	0
40426	40435	3	0
40427	40436	3	0
40428	40437	3	0
40429	40438	3	0
40430	40439	3	0
40431	40440	3	0
40432	40441	3	0
40433	40442	3	1
40434	40443	3	1
40435	40444	3	2
40436	40445	3	2
40437	40446	4	0
40438	40447	4	0
40439	40448	4	0
40440	40449	4	0
40441	40450	4	0
40442	40451	4	0
40443	40452	4	0
40444	40453	4	0
40445	40454	4	0
40446	40455	4	0
40447	40456	4	0
40448	40457	4	0
40449	40458	4	0
40450	40459	4	0
40451	40460	4	0
40452	40461	4	0
40453	40462	4	0
40454	40463	4	0
40455	40464	4	0
40456	40465	4	0
40457	40466	4	0
40458	40467	4	0
40459	40468	4	0
40460	40469	5	0
40461	40470	5	0
40462	40471	5	0
40463	40472	5	0
40464	40473	5	0
40465	40474	5	0
40466	40475	5	0
40467	40476	5	0
40468	40477	5	0
40469	40478	5	0
40470	40479	5	0
40471	40480	5	0
40472	40481	5	0
40473	40482	5	0
40474	40483	5	0
40475	40484	5	0
40476	40485	5	0
40477	40486	5	0
40478	40487	5	0
40479	40488	5	0
40480	40489	5	0
40481	40490	5	0
40482	40491	5	0
40483	40492	6	0
40484	40493	6	0
40485	40494	6	0
40486	40495	6	0
40487	40496	6	0
40488	40497	6	0
40489	40498	6	0
40490	40499	6	0
40491	40500	6	0
40492	40501	6	0
40493	40502	6	0
40494	40503	6	0
40495	40504	6	0
40496	40505	6	0
40497	40506	6	0
40498	40507	6	0
40499	40508	6	0
40500	40509	6	0
40501	40510	6	0
40502	40511	6	0
40503	40512	6	0
40504	40513	6	0
40505	40514	6	0
40506	40515	6	0
40507	40516	6	0
40508	40517	6	0
40509	40518	6	0
40510	40519	6	0
40511	40520	6	0
40512	40521	6	0
40513	40522	6	0
40514	40523	6	0
40515	40524	6	0
40516	40525	7	0
40517	40526	7	0
40518	40527	7	0
40519	40528	7	0
40520	40529	7	0
40521	40530	7	0
40522	40531	7	0
40523	40532	7	0
40524	40533	7	0
40525	40534	7	0
40526	40535	7	0
40527	40536	7	0
40528	40537	7	0
40529	40538	7	0
40530	40539	7	0
40531	40540	7	0
40532	40541	7	0
40533	40542	7	0
40534	40543	7	0
40535	40544	7	0
40536	40545	7	0
40537	40546	7	0
40538	40547	7	0
40539	40548	7	0
40540	40549	7	0
40541	40550	7	0
40542	40551	7	0
40543	40552	7	0
40544	40553	7	0
40545	40554	7	0
40546	40555	7	0
40547	40556	7	0
40548	40557	7	0
40549	40558	8	0
40550	40559	8	0
40551	40560	8	0
40552	40561	8	0
40553	40562	8	0
40554	40563	8	0
40555	40564	8	0
40556	40565	8	0
40557	40566	8	0
40558	40567	8	0
40559	40568	8	0
40560	40569	8	0
40561	40570	8	0
40562	40571	8	0
40563	40572	8	0
40564	40573	9	0
40565	40574	9	0
40566	40575	9	0
40567	40576	9	0
40568	40577	9	0
40569	40578	9	0
40570	40579	9	0
40571	40580	9	0
40572	40581	9	0
40573	40582	9	0
40574	40583	9	0
40575	40584	9	0
40576	40585	9	0
40577	40586	9	0
40578	40587	9	0
40579	40588	10	1
40580	40589	10	1
40581	40590	10	1
40582	40591	10	1
40583	40592	10	1
40584	40593	10	1
40585	40594	10	1
40586	40595	10	1
40587	40596	10	1
40588	40597	10	1
40589	40598	10	1
40590	40599	10	1
40591	40600	10	1
40592	40601	10	1
40593	40602	10	1
40594	40603	10	1
40595	40604	10	1
40596	40605	10	1
40597	40606	10	1
40598	40607	10	1
40599	40608	10	1
40600	40609	10	1
40601	40610	10	2
40602	40611	10	2
40603	40612	10	2
40604	40613	10	2
40605	40614	10	2
40606	40615	10	2
40607	40616	10	2
40608	40617	10	2
40609	40618	10	2
40610	40619	10	2
40611	40620	10	2
40612	40621	10	2
40613	40622	10	2
40614	40623	10	2
40615	40624	10	2
40616	40625	10	2
40617	40626	10	2
40618	40627	10	2
40619	40628	10	2
40620	40629	10	2
40621	40630	10	2
40622	40631	10	2
40623	40632	10	2
40624	40633	0	0
40625	40634	0	0
40626	40635	0	1
40627	40636	0	2
40628	40637	0	0
40629	40638	0	0
40630	40639	0	0
40631	40640	0	0
40632	40641	0	0
40633	40642	0	0
40634	40643	0	0
40635	40644	0	0
40636	40645	0	0
40637	40646	0	0
40638	40647	0	0
40639	40648	0	1
40640	40649	0	0
40641	40650	0	0
40642	40651	0	0
40643	40652	0	1
40644	40653	0	2
40645	40654	0	2
40646	40655	0	2
40647	40656	1	0
40648	40657	1	0
40649	40658	1	0
40650	40659	1	0
40651	40660	1	0
40652	40661	1	0
40653	40662	1	0
40654	40663	1	0
40655	40664	1	0
40656	40665	1	0
40657	40666	1	0
40658	40667	1	0
40659	40668	1	0
40660	40669	1	1
40661	40670	1	2
40662	40671	1	0
40663	40672	1	1
40664	40673	1	0
40665	40674	1	0
40666	40675	1	2
40667	40676	1	0
40668	40677	2	1
40669	40678	2	2
40670	40679	2	1
40671	40680	2	2
40672	40681	2	0
40673	40682	2	0
40674	40683	2	0
40675	40684	2	0
40676	40685	2	0
40677	40686	2	0
40678	40687	2	0
40679	40688	2	0
40680	40689	2	0
40681	40690	2	0
40682	40691	2	0
40683	40692	2	0
40684	40693	2	0
40685	40694	2	0
40686	40695	2	0
40687	40696	2	0
40688	40697	2	0
40689	40698	3	1
40690	40699	3	2
40691	40700	3	0
40692	40701	3	0
40693	40702	3	0
40694	40703	3	0
40695	40704	3	0
40696	40705	3	0
40697	40706	3	0
40698	40707	3	0
40699	40708	3	0
40700	40709	3	0
40701	40710	3	0
40702	40711	3	0
40703	40712	3	0
40704	40713	3	0
40705	40714	3	0
40706	40715	3	0
40707	40716	3	0
40708	40717	3	1
40709	40718	3	1
40710	40719	3	2
40711	40720	3	2
40712	40721	4	0
40713	40722	4	0
40714	40723	4	0
40715	40724	4	0
40716	40725	4	0
40717	40726	4	0
40718	40727	4	0
40719	40728	4	0
40720	40729	4	0
40721	40730	4	0
40722	40731	4	0
40723	40732	4	0
40724	40733	4	0
40725	40734	4	0
40726	40735	4	0
40727	40736	4	0
40728	40737	4	0
40729	40738	4	0
40730	40739	4	0
40731	40740	4	0
40732	40741	4	0
40733	40742	4	0
40734	40743	4	0
40735	40744	5	0
40736	40745	5	0
40737	40746	5	0
40738	40747	5	0
40739	40748	5	0
40740	40749	5	0
40741	40750	5	0
40742	40751	5	0
40743	40752	5	0
40744	40753	5	0
40745	40754	5	0
40746	40755	5	0
40747	40756	5	0
40748	40757	5	0
40749	40758	5	0
40750	40759	5	0
40751	40760	5	0
40752	40761	5	0
40753	40762	5	0
40754	40763	5	0
40755	40764	5	0
40756	40765	5	0
40757	40766	5	0
40758	40767	6	0
40759	40768	6	0
40760	40769	6	0
40761	40770	6	0
40762	40771	6	0
40763	40772	6	0
40764	40773	6	0
40765	40774	6	0
40766	40775	6	0
40767	40776	6	0
40768	40777	6	0
40769	40778	6	0
40770	40779	6	0
40771	40780	6	0
40772	40781	6	0
40773	40782	6	0
40774	40783	6	0
40775	40784	6	0
40776	40785	6	0
40777	40786	6	0
40778	40787	6	0
40779	40788	6	0
40780	40789	6	0
40781	40790	6	0
40782	40791	6	0
40783	40792	6	0
40784	40793	6	0
40785	40794	6	0
40786	40795	6	0
40787	40796	6	0
40788	40797	6	0
40789	40798	6	0
40790	40799	6	0
40791	40800	7	0
40792	40801	7	0
40793	40802	7	0
40794	40803	7	0
40795	40804	7	0
40796	40805	7	0
40797	40806	7	0
40798	40807	7	0
40799	40808	7	0
40800	40809	7	0
40801	40810	7	0
40802	40811	7	0
40803	40812	7	0
40804	40813	7	0
40805	40814	7	0
40806	40815	7	0
40807	40816	7	0
40808	40817	7	0
40809	40818	7	0
40810	40819	7	0
40811	40820	7	0
40812	40821	7	0
40813	40822	7	0
40814	40823	7	0
40815	40824	7	0
40816	40825	7	0
40817	40826	7	0
40818	40827	7	0
40819	40828	7	0
40820	40829	7	0
40821	40830	7	0
40822	40831	7	0
40823	40832	7	0
40824	40833	8	0
40825	40834	8	0
40826	40835	8	0
40827	40836	8	0
40828	40837	8	0
40829	40838	8	0
40830	40839	8	0
40831	40840	8	0
40832	40841	8	0
40833	40842	8	0
40834	40843	8	0
40835	40844	8	0
40836	40845	8	0
40837	40846	8	0
40838	40847	8	0
40839	40848	9	0
40840	40849	9	0
40841	40850	9	0
40842	40851	9	0
40843	40852	9	0
40844	40853	9	0
40845	40854	9	0
40846	40855	9	0
40847	40856	9	0
40848	40857	9	0
40849	40858	9	0
40850	40859	9	0
40851	40860	9	0
40852	40861	9	0
40853	40862	9	0
40854	40863	10	1
40855	40864	10	1
40856	40865	10	1
40857	40866	10	1
40858	40867	10	1
40859	40868	10	1
40860	40869	10	1
40861	40870	10	1
40862	40871	10	1
40863	40872	10	1
40864	40873	10	1
40865	40874	10	1
40866	40875	10	1
40867	40876	10	1
40868	40877	10	1
40869	40878	10	1
40870	40879	10	1
40871	40880	10	1
40872	40881	10	1
40873	40882	10	1
40874	40883	10	1
40875	40884	10	1
40876	40885	10	2
40877	40886	10	2
40878	40887	10	2
40879	40888	10	2
40880	40889	10	2
40881	40890	10	2
40882	40891	10	2
40883	40892	10	2
40884	40893	10	2
40885	40894	10	2
40886	40895	10	2
40887	40896	10	2
40888	40897	10	2
40889	40898	10	2
40890	40899	10	2
40891	40900	10	2
40892	40901	10	2
40893	40902	10	2
40894	40903	10	2
40895	40904	10	2
40896	40905	10	2
40897	40906	10	2
40898	40907	10	2
40899	40908	0	0
40900	40909	0	0
40901	40910	0	0
40902	40911	0	0
40903	40912	0	0
40904	40913	0	1
40905	40914	0	2
40906	40915	0	0
40907	40916	0	0
40908	40917	0	0
40909	40918	0	0
40910	40919	0	0
40911	40920	0	0
40912	40921	0	0
40913	40922	0	0
40914	40923	0	0
40915	40924	0	0
40916	40925	0	0
40917	40926	0	1
40918	40927	0	0
40919	40928	0	0
40920	40929	0	0
40921	40930	0	1
40922	40931	0	2
40923	40932	0	2
40924	40933	0	2
40925	40934	1	0
40926	40935	1	0
40927	40936	1	0
40928	40937	1	0
40929	40938	1	0
40930	40939	1	0
40931	40940	1	0
40932	40941	1	0
40933	40942	1	0
40934	40943	1	0
40935	40944	1	0
40936	40945	1	0
40937	40946	1	0
40938	40947	1	1
40939	40948	1	2
40940	40949	1	0
40941	40950	1	1
40942	40951	1	0
40943	40952	1	0
40944	40953	1	2
40945	40954	1	0
40946	40955	2	1
40947	40956	2	2
40948	40957	2	1
40949	40958	2	2
40950	40959	2	0
40951	40960	2	0
40952	40961	2	0
40953	40962	2	0
40954	40963	2	0
40955	40964	2	0
40956	40965	2	0
40957	40966	2	0
40958	40967	2	0
40959	40968	2	0
40960	40969	2	0
40961	40970	2	0
40962	40971	2	0
40963	40972	2	0
40964	40973	2	0
40965	40974	2	0
40966	40975	2	0
40967	40976	3	1
40968	40977	3	2
40969	40978	3	0
40970	40979	3	0
40971	40980	3	0
40972	40981	3	0
40973	40982	3	0
40974	40983	3	0
40975	40984	3	0
40976	40985	3	0
40977	40986	3	0
40978	40987	3	0
40979	40988	3	0
40980	40989	3	0
40981	40990	3	0
40982	40991	3	0
40983	40992	3	0
40984	40993	3	0
40985	40994	3	0
40986	40995	3	1
40987	40996	3	1
40988	40997	3	2
40989	40998	3	2
40990	40999	4	0
40991	41000	4	0
40992	41001	4	0
40993	41002	4	0
40994	41003	4	0
40995	41004	4	0
40996	41005	4	0
40997	41006	4	0
40998	41007	4	0
40999	41008	4	0
41000	41009	4	0
41001	41010	4	0
41002	41011	4	0
41003	41012	4	0
41004	41013	4	0
41005	41014	4	0
41006	41015	4	0
41007	41016	4	0
41008	41017	4	0
41009	41018	4	0
41010	41019	4	0
41011	41020	4	0
41012	41021	4	0
41013	41022	5	0
41014	41023	5	0
41015	41024	5	0
41016	41025	5	0
41017	41026	5	0
41018	41027	5	0
41019	41028	5	0
41020	41029	5	0
41021	41030	5	0
41022	41031	5	0
41023	41032	5	0
41024	41033	5	0
41025	41034	5	0
41026	41035	5	0
41027	41036	5	0
41028	41037	5	0
41029	41038	5	0
41030	41039	5	0
41031	41040	5	0
41032	41041	5	0
41033	41042	5	0
41034	41043	5	0
41035	41044	5	0
41036	41045	6	0
41037	41046	6	0
41038	41047	6	0
41039	41048	6	0
41040	41049	6	0
41041	41050	6	0
41042	41051	6	0
41043	41052	6	0
41044	41053	6	0
41045	41054	6	0
41046	41055	6	0
41047	41056	6	0
41048	41057	6	0
41049	41058	6	0
41050	41059	6	0
41051	41060	6	0
41052	41061	6	0
41053	41062	6	0
41054	41063	0	0
41055	41064	0	0
41056	41065	0	1
41057	41066	0	2
41058	41067	0	0
41059	41068	0	0
41060	41069	0	0
41061	41070	0	0
41062	41071	0	0
41063	41072	0	0
41064	41073	0	0
41065	41074	0	0
41066	41075	0	0
41067	41076	0	0
41068	41077	0	0
41069	41078	0	1
41070	41079	0	0
41071	41080	0	0
41072	41081	0	0
41073	41082	0	1
41074	41083	0	2
41075	41084	0	2
41076	41085	0	2
41077	41086	1	0
41078	41087	1	0
41079	41088	1	0
41080	41089	1	0
41081	41090	1	0
41082	41091	1	0
41083	41092	1	0
41084	41093	1	0
41085	41094	1	0
41086	41095	1	0
41087	41096	1	0
41088	41097	1	0
41089	41098	1	0
41090	41099	1	1
41091	41100	1	2
41092	41101	1	0
41093	41102	1	1
41094	41103	1	0
41095	41104	1	0
41096	41105	1	2
41097	41106	1	0
41098	41107	2	1
41099	41108	2	2
41100	41109	2	1
41101	41110	2	2
41102	41111	2	0
41103	41112	2	0
41104	41113	2	0
41105	41114	2	0
41106	41115	2	0
41107	41116	2	0
41108	41117	2	0
41109	41118	2	0
41110	41119	2	0
41111	41120	2	0
41112	41121	2	0
41113	41122	2	0
41114	41123	2	0
41115	41124	2	0
41116	41125	2	0
41117	41126	2	0
41118	41127	2	0
41119	41128	3	1
41120	41129	3	2
41121	41130	3	0
41122	41131	3	0
41123	41132	3	0
41124	41133	3	0
41125	41134	3	0
41126	41135	3	0
41127	41136	3	0
41128	41137	3	0
41129	41138	3	0
41130	41139	3	0
41131	41140	3	0
41132	41141	3	0
41133	41142	3	0
41134	41143	3	0
41135	41144	3	0
41136	41145	3	0
41137	41146	3	0
41138	41147	3	1
41139	41148	3	1
41140	41149	3	2
41141	41150	3	2
41142	41151	4	0
41143	41152	4	0
41144	41153	4	0
41145	41154	4	0
41146	41155	4	0
41147	41156	4	0
41148	41157	4	0
41149	41158	4	0
41150	41159	4	0
41151	41160	4	0
41152	41161	4	0
41153	41162	4	0
41154	41163	4	0
41155	41164	4	0
41156	41165	4	0
41157	41166	4	0
41158	41167	4	0
41159	41168	4	0
41160	41169	4	0
41161	41170	4	0
41162	41171	4	0
41163	41172	4	0
41164	41173	4	0
41165	41174	5	0
41166	41175	5	0
41167	41176	5	0
41168	41177	5	0
41169	41178	5	0
41170	41179	5	0
41171	41180	5	0
41172	41181	5	0
41173	41182	5	0
41174	41183	5	0
41175	41184	5	0
41176	41185	5	0
41177	41186	5	0
41178	41187	5	0
41179	41188	5	0
41180	41189	5	0
41181	41190	5	0
41182	41191	5	0
41183	41192	5	0
41184	41193	5	0
41185	41194	5	0
41186	41195	5	0
41187	41196	5	0
41188	41197	6	0
41189	41198	6	0
41190	41199	6	0
41191	41200	6	0
41192	41201	6	0
41193	41202	6	0
41194	41203	6	0
41195	41204	6	0
41196	41205	6	0
41197	41206	6	0
41198	41207	6	0
41199	41208	6	0
41200	41209	6	0
41201	41210	6	0
41202	41211	6	0
41203	41212	6	0
41204	41213	6	0
41205	41214	0	0
41206	41215	0	0
41207	41216	0	1
41208	41217	0	2
41209	41218	0	0
41210	41219	0	0
41211	41220	0	0
41212	41221	0	0
41213	41222	0	0
41214	41223	0	0
41215	41224	0	0
41216	41225	0	0
41217	41226	0	0
41218	41227	0	0
41219	41228	0	0
41220	41229	0	1
41221	41230	0	0
41222	41231	0	0
41223	41232	0	0
41224	41233	0	1
41225	41234	0	2
41226	41235	0	2
41227	41236	0	2
41228	41237	1	0
41229	41238	1	0
41230	41239	1	0
41231	41240	1	0
41232	41241	1	0
41233	41242	1	0
41234	41243	1	0
41235	41244	1	0
41236	41245	1	0
41237	41246	1	0
41238	41247	1	0
41239	41248	1	0
41240	41249	1	0
41241	41250	1	1
41242	41251	1	2
41243	41252	1	0
41244	41253	1	1
41245	41254	1	0
41246	41255	1	0
41247	41256	1	2
41248	41257	1	0
41249	41258	2	1
41250	41259	2	2
41251	41260	2	1
41252	41261	2	2
41253	41262	2	0
41254	41263	2	0
41255	41264	2	0
41256	41265	2	0
41257	41266	2	0
41258	41267	2	0
41259	41268	2	0
41260	41269	2	0
41261	41270	2	0
41262	41271	2	0
41263	41272	2	0
41264	41273	2	0
41265	41274	2	0
41266	41275	2	0
41267	41276	2	0
41268	41277	2	0
41269	41278	2	0
41270	41279	3	1
41271	41280	3	2
41272	41281	3	0
41273	41282	3	0
41274	41283	3	0
41275	41284	3	0
41276	41285	3	0
41277	41286	3	0
41278	41287	3	0
41279	41288	3	0
41280	41289	3	0
41281	41290	3	0
41282	41291	3	0
41283	41292	3	0
41284	41293	3	0
41285	41294	3	0
41286	41295	3	0
41287	41296	3	0
41288	41297	3	0
41289	41298	3	1
41290	41299	3	1
41291	41300	3	2
41292	41301	3	2
41293	41302	4	0
41294	41303	4	0
41295	41304	4	0
41296	41305	4	0
41297	41306	4	0
41298	41307	4	0
41299	41308	4	0
41300	41309	4	0
41301	41310	4	0
41302	41311	4	0
41303	41312	4	0
41304	41313	4	0
41305	41314	4	0
41306	41315	4	0
41307	41316	4	0
41308	41317	4	0
41309	41318	4	0
41310	41319	4	0
41311	41320	4	0
41312	41321	4	0
41313	41322	4	0
41314	41323	4	0
41315	41324	4	0
41316	41325	5	0
41317	41326	5	0
41318	41327	5	0
41319	41328	5	0
41320	41329	5	0
41321	41330	5	0
41322	41331	5	0
41323	41332	5	0
41324	41333	5	0
41325	41334	5	0
41326	41335	5	0
41327	41336	5	0
41328	41337	5	0
41329	41338	5	0
41330	41339	5	0
41331	41340	5	0
41332	41341	5	0
41333	41342	5	0
41334	41343	5	0
41335	41344	5	0
41336	41345	5	0
41337	41346	5	0
41338	41347	5	0
41339	41348	6	0
41340	41349	6	0
41341	41350	6	0
41342	41351	6	0
41343	41352	6	0
41344	41353	6	0
41345	41354	6	0
41346	41355	6	0
41347	41356	6	0
41348	41357	6	0
41349	41358	6	0
41350	41359	6	0
41351	41360	6	0
41352	41361	6	0
41353	41362	6	0
41354	41363	6	0
41355	41364	6	0
41356	41365	6	0
41357	41366	0	0
41358	41367	0	0
41359	41368	0	1
41360	41369	0	2
41361	41370	0	0
41362	41371	0	0
41363	41372	0	0
41364	41373	0	0
41365	41374	0	0
41366	41375	0	0
41367	41376	0	0
41368	41377	0	0
41369	41378	0	0
41370	41379	0	0
41371	41380	0	0
41372	41381	0	1
41373	41382	0	0
41374	41383	0	0
41375	41384	0	0
41376	41385	0	1
41377	41386	0	2
41378	41387	0	2
41379	41388	0	2
41380	41389	1	0
41381	41390	1	0
41382	41391	1	0
41383	41392	1	0
41384	41393	1	0
41385	41394	1	0
41386	41395	1	0
41387	41396	1	0
41388	41397	1	0
41389	41398	1	0
41390	41399	1	0
41391	41400	1	0
41392	41401	1	0
41393	41402	1	1
41394	41403	1	2
41395	41404	1	0
41396	41405	1	1
41397	41406	1	0
41398	41407	1	0
41399	41408	1	2
41400	41409	1	0
41401	41410	2	1
41402	41411	2	2
41403	41412	2	1
41404	41413	2	2
41405	41414	2	0
41406	41415	2	0
41407	41416	2	0
41408	41417	2	0
41409	41418	2	0
41410	41419	2	0
41411	41420	2	0
41412	41421	2	0
41413	41422	2	0
41414	41423	2	0
41415	41424	2	0
41416	41425	2	0
41417	41426	2	0
41418	41427	2	0
41419	41428	2	0
41420	41429	2	0
41421	41430	2	0
41422	41431	3	1
41423	41432	3	2
41424	41433	3	0
41425	41434	3	0
41426	41435	3	0
41427	41436	3	0
41428	41437	3	0
41429	41438	3	0
41430	41439	3	0
41431	41440	3	0
41432	41441	3	0
41433	41442	3	0
41434	41443	3	0
41435	41444	3	0
41436	41445	3	0
41437	41446	3	0
41438	41447	3	0
41439	41448	3	0
41440	41449	3	0
41441	41450	3	1
41442	41451	3	1
41443	41452	3	2
41444	41453	3	2
41445	41454	4	0
41446	41455	4	0
41447	41456	4	0
41448	41457	4	0
41449	41458	4	0
41450	41459	4	0
41451	41460	4	0
41452	41461	4	0
41453	41462	4	0
41454	41463	4	0
41455	41464	4	0
41456	41465	4	0
41457	41466	4	0
41458	41467	4	0
41459	41468	4	0
41460	41469	4	0
41461	41470	4	0
41462	41471	4	0
41463	41472	4	0
41464	41473	4	0
41465	41474	4	0
41466	41475	4	0
41467	41476	4	0
41468	41477	5	0
41469	41478	5	0
41470	41479	5	0
41471	41480	5	0
41472	41481	5	0
41473	41482	5	0
41474	41483	5	0
41475	41484	5	0
41476	41485	5	0
41477	41486	5	0
41478	41487	5	0
41479	41488	5	0
41480	41489	5	0
41481	41490	5	0
41482	41491	5	0
41483	41492	5	0
41484	41493	5	0
41485	41494	5	0
41486	41495	5	0
41487	41496	5	0
41488	41497	5	0
41489	41498	5	0
41490	41499	5	0
41491	41500	6	0
41492	41501	6	0
41493	41502	6	0
41494	41503	6	0
41495	41504	6	0
41496	41505	6	0
41497	41506	6	0
41498	41507	6	0
41499	41508	6	0
41500	41509	6	0
41501	41510	6	0
41502	41511	6	0
41503	41512	6	0
41504	41513	6	0
41505	41514	6	0
41506	41515	6	0
41507	41516	6	0
41508	41517	6	0
41509	41518	6	0
41510	41519	6	0
41511	41520	6	0
41512	41521	6	0
41513	41522	6	0
41514	41523	6	0
41515	41524	6	0
41516	41525	6	0
41517	41526	6	0
41518	41527	6	0
41519	41528	6	0
41520	41529	6	0
41521	41530	6	0
41522	41531	6	0
41523	41532	6	0
41524	41533	7	0
41525	41534	7	0
41526	41535	7	0
41527	41536	7	0
41528	41537	7	0
41529	41538	7	0
41530	41539	7	0
41531	41540	7	0
41532	41541	7	0
41533	41542	7	0
41534	41543	7	0
41535	41544	7	0
41536	41545	7	0
41537	41546	7	0
41538	41547	7	0
41539	41548	7	0
41540	41549	7	0
41541	41550	7	0
41542	41551	7	0
41543	41552	7	0
41544	41553	7	0
41545	41554	7	0
41546	41555	7	0
41547	41556	7	0
41548	41557	7	0
41549	41558	7	0
41550	41559	7	0
41551	41560	7	0
41552	41561	7	0
41553	41562	7	0
41554	41563	7	0
41555	41564	7	0
41556	41565	7	0
41557	41566	8	0
41558	41567	8	0
41559	41568	8	0
41560	41569	8	0
41561	41570	8	0
41562	41571	8	0
41563	41572	8	0
41564	41573	8	0
41565	41574	8	0
41566	41575	8	0
41567	41576	8	0
41568	41577	8	0
41569	41578	8	0
41570	41579	8	0
41571	41580	8	0
41572	41581	9	0
41573	41582	9	0
41574	41583	9	0
41575	41584	9	0
41576	41585	9	0
41577	41586	9	0
41578	41587	9	0
41579	41588	9	0
41580	41589	9	0
41581	41590	9	0
41582	41591	9	0
41583	41592	9	0
41584	41593	9	0
41585	41594	9	0
41586	41595	9	0
41587	41596	10	1
41588	41597	10	1
41589	41598	10	1
41590	41599	10	1
41591	41600	10	1
41592	41601	10	1
41593	41602	10	1
41594	41603	10	1
41595	41604	10	1
41596	41605	10	1
41597	41606	10	1
41598	41607	10	1
41599	41608	10	1
41600	41609	10	1
41601	41610	10	1
41602	41611	10	1
41603	41612	10	1
41604	41613	10	1
41605	41614	10	1
41606	41615	10	1
41607	41616	10	1
41608	41617	10	1
41609	41618	10	2
41610	41619	10	2
41611	41620	10	2
41612	41621	10	2
41613	41622	10	2
41614	41623	10	2
41615	41624	10	2
41616	41625	10	2
41617	41626	10	2
41618	41627	10	2
41619	41628	10	2
41620	41629	10	2
41621	41630	10	2
41622	41631	10	2
41623	41632	10	2
41624	41633	10	2
41625	41634	10	2
41626	41635	10	2
41627	41636	10	2
41628	41637	10	2
41629	41638	10	2
41630	41639	10	2
41631	41640	10	2
41632	41641	0	0
41633	41642	0	0
41634	41643	0	1
41635	41644	0	2
41636	41645	0	0
41637	41646	0	0
41638	41647	0	0
41639	41648	0	0
41640	41649	0	0
41641	41650	0	0
41642	41651	0	0
41643	41652	0	0
41644	41653	0	0
41645	41654	0	0
41646	41655	0	0
41647	41656	0	1
41648	41657	0	0
41649	41658	0	0
41650	41659	0	0
41651	41660	0	1
41652	41661	0	2
41653	41662	0	2
41654	41663	0	2
41655	41664	1	0
41656	41665	1	0
41657	41666	1	0
41658	41667	1	0
41659	41668	1	0
41660	41669	1	0
41661	41670	1	0
41662	41671	1	0
41663	41672	1	0
41664	41673	1	0
41665	41674	1	0
41666	41675	1	0
41667	41676	1	0
41668	41677	1	1
41669	41678	1	2
41670	41679	1	0
41671	41680	1	1
41672	41681	1	0
41673	41682	1	0
41674	41683	1	2
41675	41684	1	0
41676	41685	2	1
41677	41686	2	2
41678	41687	2	1
41679	41688	2	2
41680	41689	2	0
41681	41690	2	0
41682	41691	2	0
41683	41692	2	0
41684	41693	2	0
41685	41694	2	0
41686	41695	2	0
41687	41696	2	0
41688	41697	2	0
41689	41698	2	0
41690	41699	2	0
41691	41700	2	0
41692	41701	2	0
41693	41702	2	0
41694	41703	2	0
41695	41704	2	0
41696	41705	2	0
41697	41706	3	1
41698	41707	3	2
41699	41708	3	0
41700	41709	3	0
41701	41710	3	0
41702	41711	3	0
41703	41712	3	0
41704	41713	3	0
41705	41714	3	0
41706	41715	3	0
41707	41716	3	0
41708	41717	3	0
41709	41718	3	0
41710	41719	3	0
41711	41720	3	0
41712	41721	3	0
41713	41722	3	0
41714	41723	3	0
41715	41724	3	0
41716	41725	3	1
41717	41726	3	1
41718	41727	3	2
41719	41728	3	2
41720	41729	4	0
41721	41730	4	0
41722	41731	4	0
41723	41732	4	0
41724	41733	4	0
41725	41734	4	0
41726	41735	4	0
41727	41736	4	0
41728	41737	4	0
41729	41738	4	0
41730	41739	4	0
41731	41740	4	0
41732	41741	4	0
41733	41742	4	0
41734	41743	4	0
41735	41744	4	0
41736	41745	4	0
41737	41746	4	0
41738	41747	4	0
41739	41748	4	0
41740	41749	4	0
41741	41750	4	0
41742	41751	4	0
41743	41752	5	0
41744	41753	5	0
41745	41754	5	0
41746	41755	5	0
41747	41756	5	0
41748	41757	5	0
41749	41758	5	0
41750	41759	5	0
41751	41760	5	0
41752	41761	5	0
41753	41762	5	0
41754	41763	5	0
41755	41764	5	0
41756	41765	5	0
41757	41766	5	0
41758	41767	5	0
41759	41768	5	0
41760	41769	5	0
41761	41770	5	0
41762	41771	5	0
41763	41772	5	0
41764	41773	5	0
41765	41774	5	0
41766	41775	6	0
41767	41776	6	0
41768	41777	6	0
41769	41778	6	0
41770	41779	6	0
41771	41780	6	0
41772	41781	6	0
41773	41782	6	0
41774	41783	6	0
41775	41784	6	0
41776	41785	6	0
41777	41786	6	0
41778	41787	6	0
41779	41788	6	0
41780	41789	6	0
41781	41790	6	0
41782	41791	6	0
41783	41792	6	0
41784	41793	6	0
41785	41794	6	0
41786	41795	6	0
41787	41796	6	0
41788	41797	6	0
41789	41798	6	0
41790	41799	6	0
41791	41800	6	0
41792	41801	6	0
41793	41802	6	0
41794	41803	6	0
41795	41804	6	0
41796	41805	6	0
41797	41806	6	0
41798	41807	6	0
41799	41808	7	0
41800	41809	7	0
41801	41810	7	0
41802	41811	7	0
41803	41812	7	0
41804	41813	7	0
41805	41814	7	0
41806	41815	7	0
41807	41816	7	0
41808	41817	7	0
41809	41818	7	0
41810	41819	7	0
41811	41820	7	0
41812	41821	7	0
41813	41822	7	0
41814	41823	7	0
41815	41824	7	0
41816	41825	7	0
41817	41826	7	0
41818	41827	7	0
41819	41828	7	0
41820	41829	7	0
41821	41830	7	0
41822	41831	7	0
41823	41832	7	0
41824	41833	7	0
41825	41834	7	0
41826	41835	7	0
41827	41836	7	0
41828	41837	7	0
41829	41838	7	0
41830	41839	7	0
41831	41840	7	0
41832	41841	8	0
41833	41842	8	0
41834	41843	8	0
41835	41844	8	0
41836	41845	8	0
41837	41846	8	0
41838	41847	8	0
41839	41848	8	0
41840	41849	8	0
41841	41850	8	0
41842	41851	8	0
41843	41852	8	0
41844	41853	8	0
41845	41854	8	0
41846	41855	8	0
41847	41856	9	0
41848	41857	9	0
41849	41858	9	0
41850	41859	9	0
41851	41860	9	0
41852	41861	9	0
41853	41862	9	0
41854	41863	9	0
41855	41864	9	0
41856	41865	9	0
41857	41866	9	0
41858	41867	9	0
41859	41868	9	0
41860	41869	9	0
41861	41870	9	0
41862	41871	10	1
41863	41872	10	1
41864	41873	10	1
41865	41874	10	1
41866	41875	10	1
41867	41876	10	1
41868	41877	10	1
41869	41878	10	1
41870	41879	10	1
41871	41880	10	1
41872	41881	10	1
41873	41882	10	1
41874	41883	10	1
41875	41884	10	1
41876	41885	10	1
41877	41886	10	1
41878	41887	10	1
41879	41888	10	1
41880	41889	10	1
41881	41890	10	1
41882	41891	10	1
41883	41892	10	1
41884	41893	10	2
41885	41894	10	2
41886	41895	10	2
41887	41896	10	2
41888	41897	10	2
41889	41898	10	2
41890	41899	10	2
41891	41900	10	2
41892	41901	10	2
41893	41902	10	2
41894	41903	10	2
41895	41904	10	2
41896	41905	10	2
41897	41906	10	2
41898	41907	10	2
41899	41908	10	2
41900	41909	10	2
41901	41910	10	2
41902	41911	10	2
41903	41912	10	2
41904	41913	10	2
41905	41914	10	2
41906	41915	10	2
\.


--
-- Data for Name: sc_rasp7_preps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp7_preps (id, rasp7_id, prep_id) FROM stdin;
31042	40358	0
31043	40360	1
31044	40361	2
31045	40363	3
31046	40364	4
31047	40365	4
31048	40366	5
31049	40367	6
31050	40368	7
31051	40369	6
31052	40370	7
31053	40371	8
31054	40372	9
31055	40373	5
31056	40374	10
31057	40375	10
31058	40376	11
31059	40377	12
31060	40378	12
31061	40379	13
31062	40380	13
31063	40382	14
31064	40383	15
31065	40384	16
31066	40385	17
31067	40387	3
31068	40388	4
31069	40389	6
31070	40390	11
31071	40391	5
31072	40392	6
31073	40393	7
31074	40394	18
31075	40395	18
31076	40396	8
31077	40397	5
31078	40398	10
31079	40399	11
31080	40400	19
31081	40401	12
31082	40402	20
31083	40403	20
31084	40404	7
31085	40405	7
31086	40406	14
31087	40407	17
31088	40408	3
31089	40409	4
31090	40411	4
31091	40412	5
31092	40413	6
31093	40414	7
31094	40416	21
31095	40417	8
31096	40418	22
31097	40419	15
31098	40420	10
31099	40421	11
31100	40422	12
31101	40423	7
31102	40424	7
31103	40425	16
31104	40427	3
31105	40428	4
31106	40429	10
31107	40430	3
31108	40431	5
31109	40432	6
31110	40433	7
31111	40434	7
31112	40435	6
31113	40436	8
31114	40438	22
31115	40439	10
31116	40440	11
31117	40441	12
31118	40442	23
31119	40443	23
31120	40444	23
31121	40445	23
31122	40446	24
31123	40447	24
31124	40448	25
31125	40449	26
31126	40450	27
31127	40452	26
31128	40453	26
31129	40454	28
31130	40455	28
31131	40458	26
31132	40459	25
31133	40461	29
31134	40462	29
31135	40465	30
31136	40466	5
31137	40468	31
31138	40469	24
31139	40470	25
31140	40471	32
31141	40473	27
31142	40474	26
31143	40476	27
31144	40477	28
31145	40478	28
31146	40480	24
31147	40481	26
31148	40482	25
31149	40484	29
31150	40485	29
31151	40488	32
31152	40489	30
31153	40490	30
31154	40491	5
31155	40496	33
31156	40497	34
31157	40498	33
31158	40499	2
31159	40500	35
31160	40501	34
31161	40502	33
31162	40503	34
31163	40504	36
31164	40505	37
31165	40506	38
31166	40507	38
31167	40508	39
31168	40517	40
31169	40518	41
31170	40519	42
31171	40520	42
31172	40521	41
31173	40522	40
31174	40523	13
31175	40524	13
31176	40529	33
31177	40530	34
31178	40531	33
31179	40532	2
31180	40533	35
31181	40534	34
31182	40535	33
31183	40536	34
31184	40537	36
31185	40538	37
31186	40539	38
31187	40540	43
31188	40541	39
31189	40550	40
31190	40551	41
31191	40552	42
31192	40553	41
31193	40554	40
31194	40555	42
31195	40556	13
31196	40557	13
31197	40558	44
31198	40559	45
31199	40560	45
31200	40565	36
31201	40566	37
31202	40567	38
31203	40573	44
31204	40574	45
31205	40575	45
31206	40580	36
31207	40581	37
31208	40582	38
31209	40593	46
31210	40594	47
31211	40595	47
31212	40596	48
31213	40597	49
31214	40598	50
31215	40599	39
31216	40614	51
31217	40620	52
31218	40621	51
31219	40622	53
31220	40623	51
31221	40624	53
31222	40625	39
31223	40631	41
31224	40632	41
31225	40633	0
31226	40635	1
31227	40636	2
31228	40638	3
31229	40639	4
31230	40640	4
31231	40641	5
31232	40642	6
31233	40643	7
31234	40644	6
31235	40645	7
31236	40646	8
31237	40647	9
31238	40648	5
31239	40649	10
31240	40650	10
31241	40651	11
31242	40652	12
31243	40653	12
31244	40654	13
31245	40655	13
31246	40657	14
31247	40658	15
31248	40659	16
31249	40660	17
31250	40662	3
31251	40663	4
31252	40664	6
31253	40665	11
31254	40666	5
31255	40667	6
31256	40668	7
31257	40669	18
31258	40670	18
31259	40671	8
31260	40672	5
31261	40673	10
31262	40674	11
31263	40675	19
31264	40676	12
31265	40677	20
31266	40678	20
31267	40679	7
31268	40680	7
31269	40681	14
31270	40682	17
31271	40683	3
31272	40684	4
31273	40686	4
31274	40687	5
31275	40688	6
31276	40689	7
31277	40691	21
31278	40692	8
31279	40693	22
31280	40694	15
31281	40695	10
31282	40696	11
31283	40697	12
31284	40698	7
31285	40699	7
31286	40700	16
31287	40702	3
31288	40703	4
31289	40704	10
31290	40705	3
31291	40706	5
31292	40707	6
31293	40708	7
31294	40709	7
31295	40710	6
31296	40711	8
31297	40713	22
31298	40714	10
31299	40715	11
31300	40716	12
31301	40717	23
31302	40718	23
31303	40719	23
31304	40720	23
31305	40721	24
31306	40722	24
31307	40723	25
31308	40724	26
31309	40725	27
31310	40727	26
31311	40728	26
31312	40729	28
31313	40730	28
31314	40733	26
31315	40734	25
31316	40736	29
31317	40737	29
31318	40740	30
31319	40741	5
31320	40743	31
31321	40744	24
31322	40745	25
31323	40746	32
31324	40748	27
31325	40749	26
31326	40751	27
31327	40752	28
31328	40753	28
31329	40755	24
31330	40756	26
31331	40757	25
31332	40759	29
31333	40760	29
31334	40763	32
31335	40764	30
31336	40765	30
31337	40766	5
31338	40771	33
31339	40772	34
31340	40773	33
31341	40774	2
31342	40775	35
31343	40776	34
31344	40777	33
31345	40778	34
31346	40779	36
31347	40780	37
31348	40781	38
31349	40782	38
31350	40783	39
31351	40792	40
31352	40793	41
31353	40794	42
31354	40795	42
31355	40796	41
31356	40797	40
31357	40798	13
31358	40799	13
31359	40804	33
31360	40805	34
31361	40806	33
31362	40807	2
31363	40808	35
31364	40809	34
31365	40810	33
31366	40811	34
31367	40812	36
31368	40813	37
31369	40814	38
31370	40815	43
31371	40816	39
31372	40825	40
31373	40826	41
31374	40827	42
31375	40828	41
31376	40829	40
31377	40830	42
31378	40831	13
31379	40832	13
31380	40833	44
31381	40834	45
31382	40835	45
31383	40840	36
31384	40841	37
31385	40842	38
31386	40848	44
31387	40849	45
31388	40850	45
31389	40855	36
31390	40856	37
31391	40857	38
31392	40868	46
31393	40869	47
31394	40870	47
31395	40871	48
31396	40872	49
31397	40873	50
31398	40874	39
31399	40889	51
31400	40895	52
31401	40896	51
31402	40897	53
31403	40898	51
31404	40899	53
31405	40900	39
31406	40906	41
31407	40907	41
31408	40908	0
31409	40909	0
31410	40910	0
31411	40911	0
31412	40913	1
31413	40914	2
31414	40916	3
31415	40917	4
31416	40918	4
31417	40919	5
31418	40920	6
31419	40921	7
31420	40922	6
31421	40923	7
31422	40924	8
31423	40925	9
31424	40926	5
31425	40927	10
31426	40928	10
31427	40929	11
31428	40930	12
31429	40931	12
31430	40932	13
31431	40933	13
31432	40935	14
31433	40936	15
31434	40937	16
31435	40938	17
31436	40940	3
31437	40941	4
31438	40942	6
31439	40943	11
31440	40944	5
31441	40945	6
31442	40946	7
31443	40947	18
31444	40948	18
31445	40949	8
31446	40950	5
31447	40951	10
31448	40952	11
31449	40953	19
31450	40954	12
31451	40955	20
31452	40956	20
31453	40957	7
31454	40958	7
31455	40959	14
31456	40960	17
31457	40961	3
31458	40962	4
31459	40964	4
31460	40965	5
31461	40966	6
31462	40967	7
31463	40969	21
31464	40970	8
31465	40971	22
31466	40972	15
31467	40973	10
31468	40974	11
31469	40975	12
31470	40976	7
31471	40977	7
31472	40978	16
31473	40980	3
31474	40981	4
31475	40982	10
31476	40983	3
31477	40984	5
31478	40985	6
31479	40986	7
31480	40987	7
31481	40988	6
31482	40989	8
31483	40991	22
31484	40992	10
31485	40993	11
31486	40994	12
31487	40995	23
31488	40996	23
31489	40997	23
31490	40998	23
31491	40999	24
31492	41000	24
31493	41001	25
31494	41002	26
31495	41003	27
31496	41005	26
31497	41006	26
31498	41007	28
31499	41008	28
31500	41011	26
31501	41012	25
31502	41014	29
31503	41015	29
31504	41018	30
31505	41019	5
31506	41021	31
31507	41022	24
31508	41023	25
31509	41024	32
31510	41026	27
31511	41027	26
31512	41029	27
31513	41030	28
31514	41031	28
31515	41033	24
31516	41034	26
31517	41035	25
31518	41037	29
31519	41038	29
31520	41041	32
31521	41042	30
31522	41043	30
31523	41044	5
31524	41049	33
31525	41050	34
31526	41051	33
31527	41052	2
31528	41053	35
31529	41054	34
31530	41055	33
31531	41056	34
31532	41057	36
31533	41058	37
31534	41059	38
31535	41060	38
31536	41061	39
31537	41063	0
31538	41065	1
31539	41066	2
31540	41068	3
31541	41069	4
31542	41070	4
31543	41071	5
31544	41072	6
31545	41073	7
31546	41074	6
31547	41075	7
31548	41076	8
31549	41077	9
31550	41078	5
31551	41079	10
31552	41080	10
31553	41081	11
31554	41082	12
31555	41083	12
31556	41084	13
31557	41085	13
31558	41087	14
31559	41088	15
31560	41089	16
31561	41090	17
31562	41092	3
31563	41093	4
31564	41094	6
31565	41095	11
31566	41096	5
31567	41097	6
31568	41098	7
31569	41099	18
31570	41100	18
31571	41101	8
31572	41102	5
31573	41103	10
31574	41104	11
31575	41105	19
31576	41106	12
31577	41107	20
31578	41108	20
31579	41109	7
31580	41110	7
31581	41111	14
31582	41112	17
31583	41113	3
31584	41114	4
31585	41116	4
31586	41117	5
31587	41118	6
31588	41119	7
31589	41121	21
31590	41122	8
31591	41123	22
31592	41124	15
31593	41125	10
31594	41126	11
31595	41127	12
31596	41128	7
31597	41129	7
31598	41130	16
31599	41132	3
31600	41133	4
31601	41134	10
31602	41135	3
31603	41136	5
31604	41137	6
31605	41138	7
31606	41139	7
31607	41140	6
31608	41141	8
31609	41143	22
31610	41144	10
31611	41145	11
31612	41146	12
31613	41147	23
31614	41148	23
31615	41149	23
31616	41150	23
31617	41151	24
31618	41152	24
31619	41153	25
31620	41154	26
31621	41155	27
31622	41157	26
31623	41158	26
31624	41159	28
31625	41160	28
31626	41163	26
31627	41164	25
31628	41166	29
31629	41167	29
31630	41170	30
31631	41171	5
31632	41173	31
31633	41174	24
31634	41175	25
31635	41176	32
31636	41178	27
31637	41179	26
31638	41181	27
31639	41182	28
31640	41183	28
31641	41185	24
31642	41186	26
31643	41187	25
31644	41189	29
31645	41190	29
31646	41193	32
31647	41194	30
31648	41195	30
31649	41196	5
31650	41201	33
31651	41202	34
31652	41203	33
31653	41204	2
31654	41205	35
31655	41206	34
31656	41207	33
31657	41208	34
31658	41209	36
31659	41210	37
31660	41211	38
31661	41212	38
31662	41213	39
31663	41214	0
31664	41216	1
31665	41217	2
31666	41219	3
31667	41220	4
31668	41221	4
31669	41222	5
31670	41223	6
31671	41224	7
31672	41225	6
31673	41226	7
31674	41227	8
31675	41228	9
31676	41229	5
31677	41230	10
31678	41231	10
31679	41232	11
31680	41233	12
31681	41234	12
31682	41235	13
31683	41236	13
31684	41238	14
31685	41239	15
31686	41240	16
31687	41241	17
31688	41243	3
31689	41244	4
31690	41245	6
31691	41246	11
31692	41247	5
31693	41248	6
31694	41249	7
31695	41250	18
31696	41251	18
31697	41252	8
31698	41253	5
31699	41254	10
31700	41255	11
31701	41256	19
31702	41257	12
31703	41258	20
31704	41259	20
31705	41260	7
31706	41261	7
31707	41262	14
31708	41263	17
31709	41264	3
31710	41265	4
31711	41267	4
31712	41268	5
31713	41269	6
31714	41270	7
31715	41272	21
31716	41273	8
31717	41274	22
31718	41275	15
31719	41276	10
31720	41277	11
31721	41278	12
31722	41279	7
31723	41280	7
31724	41281	16
31725	41283	3
31726	41284	4
31727	41285	10
31728	41286	3
31729	41287	5
31730	41288	6
31731	41289	7
31732	41290	7
31733	41291	6
31734	41292	8
31735	41294	22
31736	41295	10
31737	41296	11
31738	41297	12
31739	41298	23
31740	41299	23
31741	41300	23
31742	41301	23
31743	41302	24
31744	41303	24
31745	41304	25
31746	41305	26
31747	41306	27
31748	41308	26
31749	41309	26
31750	41310	28
31751	41311	28
31752	41314	26
31753	41315	25
31754	41317	29
31755	41318	29
31756	41321	30
31757	41322	5
31758	41324	31
31759	41325	24
31760	41326	25
31761	41327	32
31762	41329	27
31763	41330	26
31764	41332	27
31765	41333	28
31766	41334	28
31767	41336	24
31768	41337	26
31769	41338	25
31770	41340	29
31771	41341	29
31772	41344	32
31773	41345	30
31774	41346	30
31775	41347	5
31776	41352	33
31777	41353	34
31778	41354	33
31779	41355	2
31780	41356	35
31781	41357	34
31782	41358	33
31783	41359	34
31784	41360	36
31785	41361	37
31786	41362	38
31787	41363	38
31788	41364	39
31789	41366	0
31790	41368	1
31791	41369	2
31792	41371	3
31793	41372	4
31794	41373	4
31795	41374	5
31796	41375	6
31797	41376	7
31798	41377	6
31799	41378	7
31800	41379	8
31801	41380	9
31802	41381	5
31803	41382	10
31804	41383	10
31805	41384	11
31806	41385	12
31807	41386	12
31808	41387	13
31809	41388	13
31810	41390	14
31811	41391	15
31812	41392	16
31813	41393	17
31814	41395	3
31815	41396	4
31816	41397	6
31817	41398	11
31818	41399	5
31819	41400	6
31820	41401	7
31821	41402	18
31822	41403	18
31823	41404	8
31824	41405	5
31825	41406	10
31826	41407	11
31827	41408	19
31828	41409	12
31829	41410	20
31830	41411	20
31831	41412	7
31832	41413	7
31833	41414	14
31834	41415	17
31835	41416	3
31836	41417	4
31837	41419	4
31838	41420	5
31839	41421	6
31840	41422	7
31841	41424	21
31842	41425	8
31843	41426	22
31844	41427	15
31845	41428	10
31846	41429	11
31847	41430	12
31848	41431	7
31849	41432	7
31850	41433	16
31851	41435	3
31852	41436	4
31853	41437	10
31854	41438	3
31855	41439	5
31856	41440	6
31857	41441	7
31858	41442	7
31859	41443	6
31860	41444	8
31861	41446	22
31862	41447	10
31863	41448	11
31864	41449	12
31865	41450	23
31866	41451	23
31867	41452	23
31868	41453	23
31869	41454	24
31870	41455	24
31871	41456	25
31872	41457	26
31873	41458	27
31874	41460	26
31875	41461	26
31876	41462	28
31877	41463	28
31878	41466	26
31879	41467	25
31880	41469	29
31881	41470	29
31882	41473	30
31883	41474	5
31884	41476	31
31885	41477	24
31886	41478	25
31887	41479	32
31888	41481	27
31889	41482	26
31890	41484	27
31891	41485	28
31892	41486	28
31893	41488	24
31894	41489	26
31895	41490	25
31896	41492	29
31897	41493	29
31898	41496	32
31899	41497	30
31900	41498	30
31901	41499	5
31902	41504	33
31903	41505	34
31904	41506	33
31905	41507	2
31906	41508	35
31907	41509	34
31908	41510	33
31909	41511	34
31910	41512	36
31911	41513	37
31912	41514	38
31913	41515	38
31914	41516	39
31915	41525	40
31916	41526	41
31917	41527	42
31918	41528	42
31919	41529	41
31920	41530	40
31921	41531	13
31922	41532	13
31923	41537	33
31924	41538	34
31925	41539	33
31926	41540	2
31927	41541	35
31928	41542	34
31929	41543	33
31930	41544	34
31931	41545	36
31932	41546	37
31933	41547	38
31934	41548	43
31935	41549	39
31936	41558	40
31937	41559	41
31938	41560	42
31939	41561	41
31940	41562	40
31941	41563	42
31942	41564	13
31943	41565	13
31944	41566	44
31945	41567	45
31946	41568	45
31947	41573	36
31948	41574	37
31949	41575	38
31950	41581	44
31951	41582	45
31952	41583	45
31953	41588	36
31954	41589	37
31955	41590	38
31956	41601	46
31957	41602	47
31958	41603	47
31959	41604	48
31960	41605	49
31961	41606	50
31962	41607	39
31963	41622	51
31964	41628	52
31965	41629	51
31966	41630	53
31967	41631	51
31968	41632	53
31969	41633	39
31970	41639	41
31971	41640	41
31972	41641	0
31973	41643	1
31974	41644	2
31975	41646	3
31976	41647	4
31977	41648	4
31978	41649	5
31979	41650	6
31980	41651	7
31981	41652	6
31982	41653	7
31983	41654	8
31984	41655	9
31985	41656	5
31986	41657	10
31987	41658	10
31988	41659	11
31989	41660	12
31990	41661	12
31991	41662	13
31992	41663	13
31993	41665	14
31994	41666	15
31995	41667	16
31996	41668	17
31997	41670	3
31998	41671	4
31999	41672	6
32000	41673	11
32001	41674	5
32002	41675	6
32003	41676	7
32004	41677	18
32005	41678	18
32006	41679	8
32007	41680	5
32008	41681	10
32009	41682	11
32010	41683	19
32011	41684	12
32012	41685	20
32013	41686	20
32014	41687	7
32015	41688	7
32016	41689	14
32017	41690	17
32018	41691	3
32019	41692	4
32020	41694	4
32021	41695	5
32022	41696	6
32023	41697	7
32024	41699	21
32025	41700	8
32026	41701	22
32027	41702	15
32028	41703	10
32029	41704	11
32030	41705	12
32031	41706	7
32032	41707	7
32033	41708	16
32034	41710	3
32035	41711	4
32036	41712	10
32037	41713	3
32038	41714	5
32039	41715	6
32040	41716	7
32041	41717	7
32042	41718	6
32043	41719	8
32044	41721	22
32045	41722	10
32046	41723	11
32047	41724	12
32048	41725	23
32049	41726	23
32050	41727	23
32051	41728	23
32052	41729	24
32053	41730	24
32054	41731	25
32055	41732	26
32056	41733	27
32057	41735	26
32058	41736	26
32059	41737	28
32060	41738	28
32061	41741	26
32062	41742	25
32063	41744	29
32064	41745	29
32065	41748	30
32066	41749	5
32067	41751	31
32068	41752	24
32069	41753	25
32070	41754	32
32071	41756	27
32072	41757	26
32073	41759	27
32074	41760	28
32075	41761	28
32076	41763	24
32077	41764	26
32078	41765	25
32079	41767	29
32080	41768	29
32081	41771	32
32082	41772	30
32083	41773	30
32084	41774	5
32085	41779	33
32086	41780	34
32087	41781	33
32088	41782	2
32089	41783	35
32090	41784	34
32091	41785	33
32092	41786	34
32093	41787	36
32094	41788	37
32095	41789	38
32096	41790	38
32097	41791	39
32098	41800	40
32099	41801	41
32100	41802	42
32101	41803	42
32102	41804	41
32103	41805	40
32104	41806	13
32105	41807	13
32106	41812	33
32107	41813	34
32108	41814	33
32109	41815	2
32110	41816	35
32111	41817	34
32112	41818	33
32113	41819	34
32114	41820	36
32115	41821	37
32116	41822	38
32117	41823	43
32118	41824	39
32119	41833	40
32120	41834	41
32121	41835	42
32122	41836	41
32123	41837	40
32124	41838	42
32125	41839	13
32126	41840	13
32127	41841	44
32128	41842	45
32129	41843	45
32130	41848	36
32131	41849	37
32132	41850	38
32133	41856	44
32134	41857	45
32135	41858	45
32136	41863	36
32137	41864	37
32138	41865	38
32139	41876	46
32140	41877	47
32141	41878	47
32142	41879	48
32143	41880	49
32144	41881	50
32145	41882	39
32146	41897	51
32147	41903	52
32148	41904	51
32149	41905	53
32150	41906	51
32151	41907	53
32152	41908	39
32153	41914	41
32154	41915	41
\.


--
-- Data for Name: sc_rasp7_rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sc_rasp7_rooms (id, rasp7_id, room) FROM stdin;
40354	40358	А-206
40355	40359	И-309\nИ-308
40356	40360	Б-209-2
40357	40361	Б-209-2
40358	40362	ФОК
40359	40363	А-13
40360	40364	А-13
40361	40365	А-217
40362	40366	А-1
40363	40367	А-13
40364	40368	А-13
40365	40369	А-328
40366	40370	А-173
40367	40371	А-1
40368	40372	А-173
40369	40373	Б-209-2
40370	40374	Г-102
40371	40375	А-13
40372	40376	А-13
40373	40377	Дист.
40374	40378	Б-209-2
40375	40379	Б-209-2
40376	40380	Б-209-2
40377	40381	И-307\nИ-308
40378	40382	А-174-б
40379	40383	Г-102
40380	40384	А-218
40381	40385	Г-102
40382	40386	ФОК
40383	40387	А-13
40384	40388	А-13
40385	40389	А-203
40386	40390	А-207
40387	40391	А-1
40388	40392	А-13
40389	40393	А-13
40390	40394	Б-209-2
40391	40395	Б-209-2
40392	40396	А-1
40393	40397	Б-209-2
40394	40398	А-13
40395	40399	А-13
40396	40400	Б-209-2
40397	40401	Дист.
40398	40402	ИВЦ-116
40399	40403	ИВЦ-116
40400	40404	Б-209-2
40401	40405	Б-209-2
40402	40406	А-173
40403	40407	Г-102
40404	40408	А-13
40405	40409	А-13
40406	40410	И-304\nИ-305
40407	40411	А-217
40408	40412	А-1
40409	40413	А-13
40410	40414	А-13
40411	40415	ФОК
40412	40416	А-203
40413	40417	А-1
40414	40418	А-328
40415	40419	А-177
40416	40420	А-13
40417	40421	А-13
40418	40422	Дист.
40419	40423	Б-209-2
40420	40424	Б-209-2
40421	40425	А-218
40422	40426	ФОК
40423	40427	А-13
40424	40428	А-13
40425	40429	А-318
40426	40430	Г-102
40427	40431	А-1
40428	40432	А-13
40429	40433	А-13
40430	40434	А-173
40431	40435	А-328
40432	40436	А-1
40433	40437	И-315\nИ-317
40434	40438	А-328
40435	40439	А-13
40436	40440	А-13
40437	40441	Дист.
40438	40442	Б-209-2
40439	40443	Б-209-2
40440	40444	Б-209-2
40441	40445	Б-209-2
40442	40446	А-13
40443	40447	А-215
40444	40448	А-107
40445	40449	А-217
40446	40450	А-213-м
40447	40451	А-13
40448	40452	А-13
40449	40453	А-215
40450	40454	А-182
40451	40455	Б-209-2
40452	40456	ФОК
40453	40457	???
40454	40458	А-13
40455	40459	А-13
40456	40460	А-13
40457	40461	Б-209
40458	40462	Б-209
40459	40463	А-61\n(МП-1)
40460	40464	А-231\n(МП-1)
40461	40465	А-175
40462	40466	Б-209-1
40463	40467	И-201
40464	40468	Б-209-2
40465	40469	А-13
40466	40470	А-107
40467	40471	Г-102
40468	40472	И-201
40469	40473	А-13
40470	40474	А-13
40471	40475	И-313
40472	40476	А-213-м
40473	40477	А-182
40474	40478	Б-209-2
40475	40479	ФОК
40476	40480	А-215
40477	40481	А-13
40478	40482	А-13
40479	40483	А-13
40480	40484	Б-209
40481	40485	Б-209
40482	40486	А-61\n(МП-1)
40483	40487	А-350\n(МП-1)
40484	40488	А-107
40485	40489	А-175
40486	40490	Б-209-2
40487	40491	Б-209-1
40488	40492	None
40489	40493	None
40490	40494	None
40491	40495	None
40492	40496	Д-208
40493	40497	ИВЦ-116
40494	40498	ИВЦ-116
40495	40499	Б-209-2
40496	40500	Б-209-1
40497	40501	ИВЦ-116
40498	40502	Б-209
40499	40503	Б-209
40500	40504	Б-209
40501	40505	Б-209
40502	40506	Д-208
40503	40507	А-329
40504	40508	Д-208
40505	40509	None
40506	40510	None
40507	40511	None
40508	40512	None
40509	40513	None
40510	40514	None
40511	40515	None
40512	40516	None
40513	40517	А-15
40514	40518	А-11
40515	40519	А-11
40516	40520	А-107
40517	40521	Г-213
40518	40522	А-217
40519	40523	А-1
40520	40524	Б-209
40521	40525	None
40522	40526	None
40523	40527	None
40524	40528	None
40525	40529	Д-208
40526	40530	ИВЦ-116
40527	40531	ИВЦ-116
40528	40532	Б-209-2
40529	40533	Б-209-1
40530	40534	ИВЦ-116
40531	40535	Б-209
40532	40536	Б-209
40533	40537	Б-209
40534	40538	Б-209
40535	40539	Д-208
40536	40540	А-222
40537	40541	Д-208
40538	40542	None
40539	40543	None
40540	40544	None
40541	40545	None
40542	40546	None
40543	40547	None
40544	40548	None
40545	40549	None
40546	40550	А-15
40547	40551	А-11
40548	40552	А-11
40549	40553	Г-213
40550	40554	А-217
40551	40555	А-107
40552	40556	А-1
40553	40557	Б-209
40554	40558	База
40555	40559	Б-209
40556	40560	Б-209
40557	40561	None
40558	40562	None
40559	40563	None
40560	40564	None
40561	40565	Б-209
40562	40566	Б-209
40563	40567	А-316
40564	40568	None
40565	40569	None
40566	40570	None
40567	40571	None
40568	40572	None
40569	40573	База
40570	40574	Б-209
40571	40575	Б-209
40572	40576	None
40573	40577	None
40574	40578	None
40575	40579	None
40576	40580	Б-209
40577	40581	Б-209
40578	40582	А-316
40579	40583	None
40580	40584	None
40581	40585	None
40582	40586	None
40583	40587	None
40584	40588	None
40585	40589	None
40586	40590	None
40587	40591	None
40588	40592	None
40589	40593	Б-209-1
40590	40594	Б-209-1
40591	40595	Б-209-2
40592	40596	База
40593	40597	???
40594	40598	Б-209-2
40595	40599	Б-209-1
40596	40600	None
40597	40601	None
40598	40602	None
40599	40603	None
40600	40604	None
40601	40605	None
40602	40606	None
40603	40607	None
40604	40608	None
40605	40609	None
40606	40610	None
40607	40611	None
40608	40612	None
40609	40613	None
40610	40614	А-215
40611	40615	None
40612	40616	None
40613	40617	None
40614	40618	None
40615	40619	None
40616	40620	None
40617	40621	None
40618	40622	None
40619	40623	None
40620	40624	None
40621	40625	Б-209-1
40622	40626	None
40623	40627	None
40624	40628	None
40625	40629	None
40626	40630	None
40627	40631	None
40628	40632	None
40629	40633	А-206
40630	40634	И-309\nИ-308
40631	40635	Б-209-2
40632	40636	Б-209-2
40633	40637	ФОК
40634	40638	А-13
40635	40639	А-13
40636	40640	А-217
40637	40641	А-1
40638	40642	А-13
40639	40643	А-13
40640	40644	А-328
40641	40645	А-173
40642	40646	А-1
40643	40647	А-173
40644	40648	Б-209-2
40645	40649	Г-102
40646	40650	А-13
40647	40651	А-13
40648	40652	Дист.
40649	40653	Б-209-2
40650	40654	Б-209-2
40651	40655	Б-209-2
40652	40656	И-307\nИ-308
40653	40657	А-174-б
40654	40658	Г-102
40655	40659	А-218
40656	40660	Г-102
40657	40661	ФОК
40658	40662	А-13
40659	40663	А-13
40660	40664	А-203
40661	40665	А-207
40662	40666	А-1
40663	40667	А-13
40664	40668	А-13
40665	40669	Б-209-2
40666	40670	Б-209-2
40667	40671	А-1
40668	40672	Б-209-2
40669	40673	А-13
40670	40674	А-13
40671	40675	Б-209-2
40672	40676	Дист.
40673	40677	ИВЦ-116
40674	40678	ИВЦ-116
40675	40679	Б-209-2
40676	40680	Б-209-2
40677	40681	А-173
40678	40682	Г-102
40679	40683	А-13
40680	40684	А-13
40681	40685	И-304\nИ-305
40682	40686	А-217
40683	40687	А-1
40684	40688	А-13
40685	40689	А-13
40686	40690	ФОК
40687	40691	А-203
40688	40692	А-1
40689	40693	А-328
40690	40694	А-177
40691	40695	А-13
40692	40696	А-13
40693	40697	Дист.
40694	40698	Б-209-2
40695	40699	Б-209-2
40696	40700	А-218
40697	40701	ФОК
40698	40702	А-13
40699	40703	А-13
40700	40704	А-318
40701	40705	Г-102
40702	40706	А-1
40703	40707	А-13
40704	40708	А-13
40705	40709	А-173
40706	40710	А-328
40707	40711	А-1
40708	40712	И-315\nИ-317
40709	40713	А-328
40710	40714	А-13
40711	40715	А-13
40712	40716	Дист.
40713	40717	Б-209-2
40714	40718	Б-209-2
40715	40719	Б-209-2
40716	40720	Б-209-2
40717	40721	А-13
40718	40722	А-215
40719	40723	А-107
40720	40724	А-217
40721	40725	А-213-м
40722	40726	А-13
40723	40727	А-13
40724	40728	А-215
40725	40729	А-182
40726	40730	Б-209-2
40727	40731	ФОК
40728	40732	???
40729	40733	А-13
40730	40734	А-13
40731	40735	А-13
40732	40736	Б-209
40733	40737	Б-209
40734	40738	А-61\n(МП-1)
40735	40739	А-231\n(МП-1)
40736	40740	А-175
40737	40741	Б-209-1
40738	40742	И-201
40739	40743	Б-209-2
40740	40744	А-13
40741	40745	А-107
40742	40746	Г-102
40743	40747	И-201
40744	40748	А-13
40745	40749	А-13
40746	40750	И-313
40747	40751	А-213-м
40748	40752	А-182
40749	40753	Б-209-2
40750	40754	ФОК
40751	40755	А-215
40752	40756	А-13
40753	40757	А-13
40754	40758	А-13
40755	40759	Б-209
40756	40760	Б-209
40757	40761	А-61\n(МП-1)
40758	40762	А-350\n(МП-1)
40759	40763	А-107
40760	40764	А-175
40761	40765	Б-209-2
40762	40766	Б-209-1
40763	40767	None
40764	40768	None
40765	40769	None
40766	40770	None
40767	40771	Д-208
40768	40772	ИВЦ-116
40769	40773	ИВЦ-116
40770	40774	Б-209-2
40771	40775	Б-209-1
40772	40776	ИВЦ-116
40773	40777	Б-209
40774	40778	Б-209
40775	40779	Б-209
40776	40780	Б-209
40777	40781	Д-208
40778	40782	А-329
40779	40783	Д-208
40780	40784	None
40781	40785	None
40782	40786	None
40783	40787	None
40784	40788	None
40785	40789	None
40786	40790	None
40787	40791	None
40788	40792	А-15
40789	40793	А-11
40790	40794	А-11
40791	40795	А-107
40792	40796	Г-213
40793	40797	А-217
40794	40798	А-1
40795	40799	Б-209
40796	40800	None
40797	40801	None
40798	40802	None
40799	40803	None
40800	40804	Д-208
40801	40805	ИВЦ-116
40802	40806	ИВЦ-116
40803	40807	Б-209-2
40804	40808	Б-209-1
40805	40809	ИВЦ-116
40806	40810	Б-209
40807	40811	Б-209
40808	40812	Б-209
40809	40813	Б-209
40810	40814	Д-208
40811	40815	А-222
40812	40816	Д-208
40813	40817	None
40814	40818	None
40815	40819	None
40816	40820	None
40817	40821	None
40818	40822	None
40819	40823	None
40820	40824	None
40821	40825	А-15
40822	40826	А-11
40823	40827	А-11
40824	40828	Г-213
40825	40829	А-217
40826	40830	А-107
40827	40831	А-1
40828	40832	Б-209
40829	40833	База
40830	40834	Б-209
40831	40835	Б-209
40832	40836	None
40833	40837	None
40834	40838	None
40835	40839	None
40836	40840	Б-209
40837	40841	Б-209
40838	40842	А-316
40839	40843	None
40840	40844	None
40841	40845	None
40842	40846	None
40843	40847	None
40844	40848	База
40845	40849	Б-209
40846	40850	Б-209
40847	40851	None
40848	40852	None
40849	40853	None
40850	40854	None
40851	40855	Б-209
40852	40856	Б-209
40853	40857	А-316
40854	40858	None
40855	40859	None
40856	40860	None
40857	40861	None
40858	40862	None
40859	40863	None
40860	40864	None
40861	40865	None
40862	40866	None
40863	40867	None
40864	40868	Б-209-1
40865	40869	Б-209-1
40866	40870	Б-209-2
40867	40871	База
40868	40872	???
40869	40873	Б-209-2
40870	40874	Б-209-1
40871	40875	None
40872	40876	None
40873	40877	None
40874	40878	None
40875	40879	None
40876	40880	None
40877	40881	None
40878	40882	None
40879	40883	None
40880	40884	None
40881	40885	None
40882	40886	None
40883	40887	None
40884	40888	None
40885	40889	А-215
40886	40890	None
40887	40891	None
40888	40892	None
40889	40893	None
40890	40894	None
40891	40895	None
40892	40896	None
40893	40897	None
40894	40898	None
40895	40899	None
40896	40900	Б-209-1
40897	40901	None
40898	40902	None
40899	40903	None
40900	40904	None
40901	40905	None
40902	40906	None
40903	40907	None
40904	40908	А-206
40905	40909	А-206
40906	40910	А-206
40907	40911	А-206
40908	40912	И-309\nИ-308
40909	40913	Б-209-2
40910	40914	Б-209-2
40911	40915	ФОК
40912	40916	А-13
40913	40917	А-13
40914	40918	А-217
40915	40919	А-1
40916	40920	А-13
40917	40921	А-13
40918	40922	А-328
40919	40923	А-173
40920	40924	А-1
40921	40925	А-173
40922	40926	Б-209-2
40923	40927	Г-102
40924	40928	А-13
40925	40929	А-13
40926	40930	Дист.
40927	40931	Б-209-2
40928	40932	Б-209-2
40929	40933	Б-209-2
40930	40934	И-307\nИ-308
40931	40935	А-174-б
40932	40936	Г-102
40933	40937	А-218
40934	40938	Г-102
40935	40939	ФОК
40936	40940	А-13
40937	40941	А-13
40938	40942	А-203
40939	40943	А-207
40940	40944	А-1
40941	40945	А-13
40942	40946	А-13
40943	40947	Б-209-2
40944	40948	Б-209-2
40945	40949	А-1
40946	40950	Б-209-2
40947	40951	А-13
40948	40952	А-13
40949	40953	Б-209-2
40950	40954	Дист.
40951	40955	ИВЦ-116
40952	40956	ИВЦ-116
40953	40957	Б-209-2
40954	40958	Б-209-2
40955	40959	А-173
40956	40960	Г-102
40957	40961	А-13
40958	40962	А-13
40959	40963	И-304\nИ-305
40960	40964	А-217
40961	40965	А-1
40962	40966	А-13
40963	40967	А-13
40964	40968	ФОК
40965	40969	А-203
40966	40970	А-1
40967	40971	А-328
40968	40972	А-177
40969	40973	А-13
40970	40974	А-13
40971	40975	Дист.
40972	40976	Б-209-2
40973	40977	Б-209-2
40974	40978	А-218
40975	40979	ФОК
40976	40980	А-13
40977	40981	А-13
40978	40982	А-318
40979	40983	Г-102
40980	40984	А-1
40981	40985	А-13
40982	40986	А-13
40983	40987	А-173
40984	40988	А-328
40985	40989	А-1
40986	40990	И-315\nИ-317
40987	40991	А-328
40988	40992	А-13
40989	40993	А-13
40990	40994	Дист.
40991	40995	Б-209-2
40992	40996	Б-209-2
40993	40997	Б-209-2
40994	40998	Б-209-2
40995	40999	А-13
40996	41000	А-215
40997	41001	А-107
40998	41002	А-217
40999	41003	А-213-м
41000	41004	А-13
41001	41005	А-13
41002	41006	А-215
41003	41007	А-182
41004	41008	Б-209-2
41005	41009	ФОК
41006	41010	???
41007	41011	А-13
41008	41012	А-13
41009	41013	А-13
41010	41014	Б-209
41011	41015	Б-209
41012	41016	А-61\n(МП-1)
41013	41017	А-231\n(МП-1)
41014	41018	А-175
41015	41019	Б-209-1
41016	41020	И-201
41017	41021	Б-209-2
41018	41022	А-13
41019	41023	А-107
41020	41024	Г-102
41021	41025	И-201
41022	41026	А-13
41023	41027	А-13
41024	41028	И-313
41025	41029	А-213-м
41026	41030	А-182
41027	41031	Б-209-2
41028	41032	ФОК
41029	41033	А-215
41030	41034	А-13
41031	41035	А-13
41032	41036	А-13
41033	41037	Б-209
41034	41038	Б-209
41035	41039	А-61\n(МП-1)
41036	41040	А-350\n(МП-1)
41037	41041	А-107
41038	41042	А-175
41039	41043	Б-209-2
41040	41044	Б-209-1
41041	41045	None
41042	41046	None
41043	41047	None
41044	41048	None
41045	41049	Д-208
41046	41050	ИВЦ-116
41047	41051	ИВЦ-116
41048	41052	Б-209-2
41049	41053	Б-209-1
41050	41054	ИВЦ-116
41051	41055	Б-209
41052	41056	Б-209
41053	41057	Б-209
41054	41058	Б-209
41055	41059	Д-208
41056	41060	А-329
41057	41061	Д-208
41058	41062	None
41059	41063	А-206
41060	41064	И-309\nИ-308
41061	41065	Б-209-2
41062	41066	Б-209-2
41063	41067	ФОК
41064	41068	А-13
41065	41069	А-13
41066	41070	А-217
41067	41071	А-1
41068	41072	А-13
41069	41073	А-13
41070	41074	А-328
41071	41075	А-173
41072	41076	А-1
41073	41077	А-173
41074	41078	Б-209-2
41075	41079	Г-102
41076	41080	А-13
41077	41081	А-13
41078	41082	Дист.
41079	41083	Б-209-2
41080	41084	Б-209-2
41081	41085	Б-209-2
41082	41086	И-307\nИ-308
41083	41087	А-174-б
41084	41088	Г-102
41085	41089	А-218
41086	41090	Г-102
41087	41091	ФОК
41088	41092	А-13
41089	41093	А-13
41090	41094	А-203
41091	41095	А-207
41092	41096	А-1
41093	41097	А-13
41094	41098	А-13
41095	41099	Б-209-2
41096	41100	Б-209-2
41097	41101	А-1
41098	41102	Б-209-2
41099	41103	А-13
41100	41104	А-13
41101	41105	Б-209-2
41102	41106	Дист.
41103	41107	ИВЦ-116
41104	41108	ИВЦ-116
41105	41109	Б-209-2
41106	41110	Б-209-2
41107	41111	А-173
41108	41112	Г-102
41109	41113	А-13
41110	41114	А-13
41111	41115	И-304\nИ-305
41112	41116	А-217
41113	41117	А-1
41114	41118	А-13
41115	41119	А-13
41116	41120	ФОК
41117	41121	А-203
41118	41122	А-1
41119	41123	А-328
41120	41124	А-177
41121	41125	А-13
41122	41126	А-13
41123	41127	Дист.
41124	41128	Б-209-2
41125	41129	Б-209-2
41126	41130	А-218
41127	41131	ФОК
41128	41132	А-13
41129	41133	А-13
41130	41134	А-318
41131	41135	Г-102
41132	41136	А-1
41133	41137	А-13
41134	41138	А-13
41135	41139	А-173
41136	41140	А-328
41137	41141	А-1
41138	41142	И-315\nИ-317
41139	41143	А-328
41140	41144	А-13
41141	41145	А-13
41142	41146	Дист.
41143	41147	Б-209-2
41144	41148	Б-209-2
41145	41149	Б-209-2
41146	41150	Б-209-2
41147	41151	А-13
41148	41152	А-215
41149	41153	А-107
41150	41154	А-217
41151	41155	А-213-м
41152	41156	А-13
41153	41157	А-13
41154	41158	А-215
41155	41159	А-182
41156	41160	Б-209-2
41157	41161	ФОК
41158	41162	???
41159	41163	А-13
41160	41164	А-13
41161	41165	А-13
41162	41166	Б-209
41163	41167	Б-209
41164	41168	А-61\n(МП-1)
41165	41169	А-231\n(МП-1)
41166	41170	А-175
41167	41171	Б-209-1
41168	41172	И-201
41169	41173	Б-209-2
41170	41174	А-13
41171	41175	А-107
41172	41176	Г-102
41173	41177	И-201
41174	41178	А-13
41175	41179	А-13
41176	41180	И-313
41177	41181	А-213-м
41178	41182	А-182
41179	41183	Б-209-2
41180	41184	ФОК
41181	41185	А-215
41182	41186	А-13
41183	41187	А-13
41184	41188	А-13
41185	41189	Б-209
41186	41190	Б-209
41187	41191	А-61\n(МП-1)
41188	41192	А-350\n(МП-1)
41189	41193	А-107
41190	41194	А-175
41191	41195	Б-209-2
41192	41196	Б-209-1
41193	41197	None
41194	41198	None
41195	41199	None
41196	41200	None
41197	41201	Д-208
41198	41202	ИВЦ-116
41199	41203	ИВЦ-116
41200	41204	Б-209-2
41201	41205	Б-209-1
41202	41206	ИВЦ-116
41203	41207	Б-209
41204	41208	Б-209
41205	41209	Б-209
41206	41210	Б-209
41207	41211	Д-208
41208	41212	А-329
41209	41213	Д-208
41210	41214	А-206
41211	41215	И-309\nИ-308
41212	41216	Б-209-2
41213	41217	Б-209-2
41214	41218	ФОК
41215	41219	А-13
41216	41220	А-13
41217	41221	А-217
41218	41222	А-1
41219	41223	А-13
41220	41224	А-13
41221	41225	А-328
41222	41226	А-173
41223	41227	А-1
41224	41228	А-173
41225	41229	Б-209-2
41226	41230	Г-102
41227	41231	А-13
41228	41232	А-13
41229	41233	Дист.
41230	41234	Б-209-2
41231	41235	Б-209-2
41232	41236	Б-209-2
41233	41237	И-307\nИ-308
41234	41238	А-174-б
41235	41239	Г-102
41236	41240	А-218
41237	41241	Г-102
41238	41242	ФОК
41239	41243	А-13
41240	41244	А-13
41241	41245	А-203
41242	41246	А-207
41243	41247	А-1
41244	41248	А-13
41245	41249	А-13
41246	41250	Б-209-2
41247	41251	Б-209-2
41248	41252	А-1
41249	41253	Б-209-2
41250	41254	А-13
41251	41255	А-13
41252	41256	Б-209-2
41253	41257	Дист.
41254	41258	ИВЦ-116
41255	41259	ИВЦ-116
41256	41260	Б-209-2
41257	41261	Б-209-2
41258	41262	А-173
41259	41263	Г-102
41260	41264	А-13
41261	41265	А-13
41262	41266	И-304\nИ-305
41263	41267	А-217
41264	41268	А-1
41265	41269	А-13
41266	41270	А-13
41267	41271	ФОК
41268	41272	А-203
41269	41273	А-1
41270	41274	А-328
41271	41275	А-177
41272	41276	А-13
41273	41277	А-13
41274	41278	Дист.
41275	41279	Б-209-2
41276	41280	Б-209-2
41277	41281	А-218
41278	41282	ФОК
41279	41283	А-13
41280	41284	А-13
41281	41285	А-318
41282	41286	Г-102
41283	41287	А-1
41284	41288	А-13
41285	41289	А-13
41286	41290	А-173
41287	41291	А-328
41288	41292	А-1
41289	41293	И-315\nИ-317
41290	41294	А-328
41291	41295	А-13
41292	41296	А-13
41293	41297	Дист.
41294	41298	Б-209-2
41295	41299	Б-209-2
41296	41300	Б-209-2
41297	41301	Б-209-2
41298	41302	А-13
41299	41303	А-215
41300	41304	А-107
41301	41305	А-217
41302	41306	А-213-м
41303	41307	А-13
41304	41308	А-13
41305	41309	А-215
41306	41310	А-182
41307	41311	Б-209-2
41308	41312	ФОК
41309	41313	???
41310	41314	А-13
41311	41315	А-13
41312	41316	А-13
41313	41317	Б-209
41314	41318	Б-209
41315	41319	А-61\n(МП-1)
41316	41320	А-231\n(МП-1)
41317	41321	А-175
41318	41322	Б-209-1
41319	41323	И-201
41320	41324	Б-209-2
41321	41325	А-13
41322	41326	А-107
41323	41327	Г-102
41324	41328	И-201
41325	41329	А-13
41326	41330	А-13
41327	41331	И-313
41328	41332	А-213-м
41329	41333	А-182
41330	41334	Б-209-2
41331	41335	ФОК
41332	41336	А-215
41333	41337	А-13
41334	41338	А-13
41335	41339	А-13
41336	41340	Б-209
41337	41341	Б-209
41338	41342	А-61\n(МП-1)
41339	41343	А-350\n(МП-1)
41340	41344	А-107
41341	41345	А-175
41342	41346	Б-209-2
41343	41347	Б-209-1
41344	41348	None
41345	41349	None
41346	41350	None
41347	41351	None
41348	41352	Д-208
41349	41353	ИВЦ-116
41350	41354	ИВЦ-116
41351	41355	Б-209-2
41352	41356	Б-209-1
41353	41357	ИВЦ-116
41354	41358	Б-209
41355	41359	Б-209
41356	41360	Б-209
41357	41361	Б-209
41358	41362	Д-208
41359	41363	А-329
41360	41364	Д-208
41361	41365	None
41362	41366	А-206
41363	41367	И-309\nИ-308
41364	41368	Б-209-2
41365	41369	Б-209-2
41366	41370	ФОК
41367	41371	А-13
41368	41372	А-13
41369	41373	А-217
41370	41374	А-1
41371	41375	А-13
41372	41376	А-13
41373	41377	А-328
41374	41378	А-173
41375	41379	А-1
41376	41380	А-173
41377	41381	Б-209-2
41378	41382	Г-102
41379	41383	А-13
41380	41384	А-13
41381	41385	Дист.
41382	41386	Б-209-2
41383	41387	Б-209-2
41384	41388	Б-209-2
41385	41389	И-307\nИ-308
41386	41390	А-174-б
41387	41391	Г-102
41388	41392	А-218
41389	41393	Г-102
41390	41394	ФОК
41391	41395	А-13
41392	41396	А-13
41393	41397	А-203
41394	41398	А-207
41395	41399	А-1
41396	41400	А-13
41397	41401	А-13
41398	41402	Б-209-2
41399	41403	Б-209-2
41400	41404	А-1
41401	41405	Б-209-2
41402	41406	А-13
41403	41407	А-13
41404	41408	Б-209-2
41405	41409	Дист.
41406	41410	ИВЦ-116
41407	41411	ИВЦ-116
41408	41412	Б-209-2
41409	41413	Б-209-2
41410	41414	А-173
41411	41415	Г-102
41412	41416	А-13
41413	41417	А-13
41414	41418	И-304\nИ-305
41415	41419	А-217
41416	41420	А-1
41417	41421	А-13
41418	41422	А-13
41419	41423	ФОК
41420	41424	А-203
41421	41425	А-1
41422	41426	А-328
41423	41427	А-177
41424	41428	А-13
41425	41429	А-13
41426	41430	Дист.
41427	41431	Б-209-2
41428	41432	Б-209-2
41429	41433	А-218
41430	41434	ФОК
41431	41435	А-13
41432	41436	А-13
41433	41437	А-318
41434	41438	Г-102
41435	41439	А-1
41436	41440	А-13
41437	41441	А-13
41438	41442	А-173
41439	41443	А-328
41440	41444	А-1
41441	41445	И-315\nИ-317
41442	41446	А-328
41443	41447	А-13
41444	41448	А-13
41445	41449	Дист.
41446	41450	Б-209-2
41447	41451	Б-209-2
41448	41452	Б-209-2
41449	41453	Б-209-2
41450	41454	А-13
41451	41455	А-215
41452	41456	А-107
41453	41457	А-217
41454	41458	А-213-м
41455	41459	А-13
41456	41460	А-13
41457	41461	А-215
41458	41462	А-182
41459	41463	Б-209-2
41460	41464	ФОК
41461	41465	???
41462	41466	А-13
41463	41467	А-13
41464	41468	А-13
41465	41469	Б-209
41466	41470	Б-209
41467	41471	А-61\n(МП-1)
41468	41472	А-231\n(МП-1)
41469	41473	А-175
41470	41474	Б-209-1
41471	41475	И-201
41472	41476	Б-209-2
41473	41477	А-13
41474	41478	А-107
41475	41479	Г-102
41476	41480	И-201
41477	41481	А-13
41478	41482	А-13
41479	41483	И-313
41480	41484	А-213-м
41481	41485	А-182
41482	41486	Б-209-2
41483	41487	ФОК
41484	41488	А-215
41485	41489	А-13
41486	41490	А-13
41487	41491	А-13
41488	41492	Б-209
41489	41493	Б-209
41490	41494	А-61\n(МП-1)
41491	41495	А-350\n(МП-1)
41492	41496	А-107
41493	41497	А-175
41494	41498	Б-209-2
41495	41499	Б-209-1
41496	41500	None
41497	41501	None
41498	41502	None
41499	41503	None
41500	41504	Д-208
41501	41505	ИВЦ-116
41502	41506	ИВЦ-116
41503	41507	Б-209-2
41504	41508	Б-209-1
41505	41509	ИВЦ-116
41506	41510	Б-209
41507	41511	Б-209
41508	41512	Б-209
41509	41513	Б-209
41510	41514	Д-208
41511	41515	А-329
41512	41516	Д-208
41513	41517	None
41514	41518	None
41515	41519	None
41516	41520	None
41517	41521	None
41518	41522	None
41519	41523	None
41520	41524	None
41521	41525	А-15
41522	41526	А-11
41523	41527	А-11
41524	41528	А-107
41525	41529	Г-213
41526	41530	А-217
41527	41531	А-1
41528	41532	Б-209
41529	41533	None
41530	41534	None
41531	41535	None
41532	41536	None
41533	41537	Д-208
41534	41538	ИВЦ-116
41535	41539	ИВЦ-116
41536	41540	Б-209-2
41537	41541	Б-209-1
41538	41542	ИВЦ-116
41539	41543	Б-209
41540	41544	Б-209
41541	41545	Б-209
41542	41546	Б-209
41543	41547	Д-208
41544	41548	А-222
41545	41549	Д-208
41546	41550	None
41547	41551	None
41548	41552	None
41549	41553	None
41550	41554	None
41551	41555	None
41552	41556	None
41553	41557	None
41554	41558	А-15
41555	41559	А-11
41556	41560	А-11
41557	41561	Г-213
41558	41562	А-217
41559	41563	А-107
41560	41564	А-1
41561	41565	Б-209
41562	41566	База
41563	41567	Б-209
41564	41568	Б-209
41565	41569	None
41566	41570	None
41567	41571	None
41568	41572	None
41569	41573	Б-209
41570	41574	Б-209
41571	41575	А-316
41572	41576	None
41573	41577	None
41574	41578	None
41575	41579	None
41576	41580	None
41577	41581	База
41578	41582	Б-209
41579	41583	Б-209
41580	41584	None
41581	41585	None
41582	41586	None
41583	41587	None
41584	41588	Б-209
41585	41589	Б-209
41586	41590	А-316
41587	41591	None
41588	41592	None
41589	41593	None
41590	41594	None
41591	41595	None
41592	41596	None
41593	41597	None
41594	41598	None
41595	41599	None
41596	41600	None
41597	41601	Б-209-1
41598	41602	Б-209-1
41599	41603	Б-209-2
41600	41604	База
41601	41605	???
41602	41606	Б-209-2
41603	41607	Б-209-1
41604	41608	None
41605	41609	None
41606	41610	None
41607	41611	None
41608	41612	None
41609	41613	None
41610	41614	None
41611	41615	None
41612	41616	None
41613	41617	None
41614	41618	None
41615	41619	None
41616	41620	None
41617	41621	None
41618	41622	А-215
41619	41623	None
41620	41624	None
41621	41625	None
41622	41626	None
41623	41627	None
41624	41628	None
41625	41629	None
41626	41630	None
41627	41631	None
41628	41632	None
41629	41633	Б-209-1
41630	41634	None
41631	41635	None
41632	41636	None
41633	41637	None
41634	41638	None
41635	41639	None
41636	41640	None
41637	41641	А-206
41638	41642	И-309\nИ-308
41639	41643	Б-209-2
41640	41644	Б-209-2
41641	41645	ФОК
41642	41646	А-13
41643	41647	А-13
41644	41648	А-217
41645	41649	А-1
41646	41650	А-13
41647	41651	А-13
41648	41652	А-328
41649	41653	А-173
41650	41654	А-1
41651	41655	А-173
41652	41656	Б-209-2
41653	41657	Г-102
41654	41658	А-13
41655	41659	А-13
41656	41660	Дист.
41657	41661	Б-209-2
41658	41662	Б-209-2
41659	41663	Б-209-2
41660	41664	И-307\nИ-308
41661	41665	А-174-б
41662	41666	Г-102
41663	41667	А-218
41664	41668	Г-102
41665	41669	ФОК
41666	41670	А-13
41667	41671	А-13
41668	41672	А-203
41669	41673	А-207
41670	41674	А-1
41671	41675	А-13
41672	41676	А-13
41673	41677	Б-209-2
41674	41678	Б-209-2
41675	41679	А-1
41676	41680	Б-209-2
41677	41681	А-13
41678	41682	А-13
41679	41683	Б-209-2
41680	41684	Дист.
41681	41685	ИВЦ-116
41682	41686	ИВЦ-116
41683	41687	Б-209-2
41684	41688	Б-209-2
41685	41689	А-173
41686	41690	Г-102
41687	41691	А-13
41688	41692	А-13
41689	41693	И-304\nИ-305
41690	41694	А-217
41691	41695	А-1
41692	41696	А-13
41693	41697	А-13
41694	41698	ФОК
41695	41699	А-203
41696	41700	А-1
41697	41701	А-328
41698	41702	А-177
41699	41703	А-13
41700	41704	А-13
41701	41705	Дист.
41702	41706	Б-209-2
41703	41707	Б-209-2
41704	41708	А-218
41705	41709	ФОК
41706	41710	А-13
41707	41711	А-13
41708	41712	А-318
41709	41713	Г-102
41710	41714	А-1
41711	41715	А-13
41712	41716	А-13
41713	41717	А-173
41714	41718	А-328
41715	41719	А-1
41716	41720	И-315\nИ-317
41717	41721	А-328
41718	41722	А-13
41719	41723	А-13
41720	41724	Дист.
41721	41725	Б-209-2
41722	41726	Б-209-2
41723	41727	Б-209-2
41724	41728	Б-209-2
41725	41729	А-13
41726	41730	А-215
41727	41731	А-107
41728	41732	А-217
41729	41733	А-213-м
41730	41734	А-13
41731	41735	А-13
41732	41736	А-215
41733	41737	А-182
41734	41738	Б-209-2
41735	41739	ФОК
41736	41740	???
41737	41741	А-13
41738	41742	А-13
41739	41743	А-13
41740	41744	Б-209
41741	41745	Б-209
41742	41746	А-61\n(МП-1)
41743	41747	А-231\n(МП-1)
41744	41748	А-175
41745	41749	Б-209-1
41746	41750	И-201
41747	41751	Б-209-2
41748	41752	А-13
41749	41753	А-107
41750	41754	Г-102
41751	41755	И-201
41752	41756	А-13
41753	41757	А-13
41754	41758	И-313
41755	41759	А-213-м
41756	41760	А-182
41757	41761	Б-209-2
41758	41762	ФОК
41759	41763	А-215
41760	41764	А-13
41761	41765	А-13
41762	41766	А-13
41763	41767	Б-209
41764	41768	Б-209
41765	41769	А-61\n(МП-1)
41766	41770	А-350\n(МП-1)
41767	41771	А-107
41768	41772	А-175
41769	41773	Б-209-2
41770	41774	Б-209-1
41771	41775	None
41772	41776	None
41773	41777	None
41774	41778	None
41775	41779	Д-208
41776	41780	ИВЦ-116
41777	41781	ИВЦ-116
41778	41782	Б-209-2
41779	41783	Б-209-1
41780	41784	ИВЦ-116
41781	41785	Б-209
41782	41786	Б-209
41783	41787	Б-209
41784	41788	Б-209
41785	41789	Д-208
41786	41790	А-329
41787	41791	Д-208
41788	41792	None
41789	41793	None
41790	41794	None
41791	41795	None
41792	41796	None
41793	41797	None
41794	41798	None
41795	41799	None
41796	41800	А-15
41797	41801	А-11
41798	41802	А-11
41799	41803	А-107
41800	41804	Г-213
41801	41805	А-217
41802	41806	А-1
41803	41807	Б-209
41804	41808	None
41805	41809	None
41806	41810	None
41807	41811	None
41808	41812	Д-208
41809	41813	ИВЦ-116
41810	41814	ИВЦ-116
41811	41815	Б-209-2
41812	41816	Б-209-1
41813	41817	ИВЦ-116
41814	41818	Б-209
41815	41819	Б-209
41816	41820	Б-209
41817	41821	Б-209
41818	41822	Д-208
41819	41823	А-222
41820	41824	Д-208
41821	41825	None
41822	41826	None
41823	41827	None
41824	41828	None
41825	41829	None
41826	41830	None
41827	41831	None
41828	41832	None
41829	41833	А-15
41830	41834	А-11
41831	41835	А-11
41832	41836	Г-213
41833	41837	А-217
41834	41838	А-107
41835	41839	А-1
41836	41840	Б-209
41837	41841	База
41838	41842	Б-209
41839	41843	Б-209
41840	41844	None
41841	41845	None
41842	41846	None
41843	41847	None
41844	41848	Б-209
41845	41849	Б-209
41846	41850	А-316
41847	41851	None
41848	41852	None
41849	41853	None
41850	41854	None
41851	41855	None
41852	41856	База
41853	41857	Б-209
41854	41858	Б-209
41855	41859	None
41856	41860	None
41857	41861	None
41858	41862	None
41859	41863	Б-209
41860	41864	Б-209
41861	41865	А-316
41862	41866	None
41863	41867	None
41864	41868	None
41865	41869	None
41866	41870	None
41867	41871	None
41868	41872	None
41869	41873	None
41870	41874	None
41871	41875	None
41872	41876	Б-209-1
41873	41877	Б-209-1
41874	41878	Б-209-2
41875	41879	База
41876	41880	???
41877	41881	Б-209-2
41878	41882	Б-209-1
41879	41883	None
41880	41884	None
41881	41885	None
41882	41886	None
41883	41887	None
41884	41888	None
41885	41889	None
41886	41890	None
41887	41891	None
41888	41892	None
41889	41893	None
41890	41894	None
41891	41895	None
41892	41896	None
41893	41897	А-215
41894	41898	None
41895	41899	None
41896	41900	None
41897	41901	None
41898	41902	None
41899	41903	None
41900	41904	None
41901	41905	None
41902	41906	None
41903	41907	None
41904	41908	Б-209-1
41905	41909	None
41906	41910	None
41907	41911	None
41908	41912	None
41909	41913	None
41910	41914	None
41911	41915	None
\.


--
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
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, first_name, middle_name, last_name, email, login, add_date, subgroup, locked) FROM stdin;
\.


--
-- Name: sc_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_department_id_seq', 1, false);


--
-- Name: sc_rasp18_days_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp18_days_id_seq', 33332, true);


--
-- Name: sc_rasp18_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp18_groups_id_seq', 499987, true);


--
-- Name: sc_rasp18_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp18_id_seq', 415644, true);


--
-- Name: sc_rasp18_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp18_info_id_seq', 1, false);


--
-- Name: sc_rasp18_move_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp18_move_id_seq', 1, false);


--
-- Name: sc_rasp18_preps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp18_preps_id_seq', 304827, true);


--
-- Name: sc_rasp18_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp18_rooms_id_seq', 340898, true);


--
-- Name: sc_rasp7_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp7_groups_id_seq', 41906, true);


--
-- Name: sc_rasp7_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp7_id_seq', 41915, true);


--
-- Name: sc_rasp7_preps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp7_preps_id_seq', 32154, true);


--
-- Name: sc_rasp7_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp7_rooms_id_seq', 41911, true);


--
-- Name: sc_rasp7_version_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_rasp7_version_seq', 1, false);


--
-- Name: sc_worktypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sc_worktypes_id_seq', 1, false);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 1, false);


--
-- Name: sc_department sc_department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_department
    ADD CONSTRAINT sc_department_pkey PRIMARY KEY (id);


--
-- Name: sc_disc sc_disc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_disc
    ADD CONSTRAINT sc_disc_pkey PRIMARY KEY (id);


--
-- Name: sc_group sc_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_group
    ADD CONSTRAINT sc_group_pkey PRIMARY KEY (id);


--
-- Name: sc_prep sc_prep_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_prep
    ADD CONSTRAINT sc_prep_pkey PRIMARY KEY (id);


--
-- Name: sc_rasp18_days sc_rasp18_days_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_days
    ADD CONSTRAINT sc_rasp18_days_pkey PRIMARY KEY (id);


--
-- Name: sc_rasp18_groups sc_rasp18_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_groups
    ADD CONSTRAINT sc_rasp18_groups_pkey PRIMARY KEY (id);


--
-- Name: sc_rasp18_info sc_rasp18_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_info
    ADD CONSTRAINT sc_rasp18_info_pkey PRIMARY KEY (id);


--
-- Name: sc_rasp18_move sc_rasp18_move_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_move
    ADD CONSTRAINT sc_rasp18_move_pkey PRIMARY KEY (id);


--
-- Name: sc_rasp18 sc_rasp18_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18
    ADD CONSTRAINT sc_rasp18_pkey PRIMARY KEY (id);


--
-- Name: sc_rasp18_preps sc_rasp18_preps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_preps
    ADD CONSTRAINT sc_rasp18_preps_pkey PRIMARY KEY (id);


--
-- Name: sc_rasp18_rooms sc_rasp18_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp18_rooms
    ADD CONSTRAINT sc_rasp18_rooms_pkey PRIMARY KEY (id);


--
-- Name: sc_rasp7_groups sc_rasp7_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp7_groups
    ADD CONSTRAINT sc_rasp7_groups_pkey PRIMARY KEY (id);


--
-- Name: sc_rasp7 sc_rasp7_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp7
    ADD CONSTRAINT sc_rasp7_pkey PRIMARY KEY (id);


--
-- Name: sc_rasp7_preps sc_rasp7_preps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp7_preps
    ADD CONSTRAINT sc_rasp7_preps_pkey PRIMARY KEY (id);


--
-- Name: sc_rasp7_rooms sc_rasp7_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_rasp7_rooms
    ADD CONSTRAINT sc_rasp7_rooms_pkey PRIMARY KEY (id);


--
-- Name: sc_worktypes sc_worktypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sc_worktypes
    ADD CONSTRAINT sc_worktypes_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

