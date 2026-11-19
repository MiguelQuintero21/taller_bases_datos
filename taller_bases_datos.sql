--
-- PostgreSQL database dump
--

\restrict fsj6OMy8nwwvTNhT0zuPcLQ95dhdANidl1vdDgfi11lglpKad8bA0Vuq8PduOoy

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-19 14:49:28

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 230 (class 1259 OID 24938)
-- Name: clases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clases (
    id_clase integer NOT NULL,
    nombre character varying(50) NOT NULL,
    dia_semana character varying(20) NOT NULL,
    hora time without time zone NOT NULL,
    cupo integer NOT NULL,
    id_entrenador integer NOT NULL,
    estado character varying(20) DEFAULT 'activa'::character varying NOT NULL,
    CONSTRAINT chk_estado_clase CHECK (((estado)::text = ANY ((ARRAY['activa'::character varying, 'suspendida'::character varying])::text[]))),
    CONSTRAINT clases_cupo_check CHECK ((cupo > 0))
);


ALTER TABLE public.clases OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24937)
-- Name: clases_id_clase_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clases_id_clase_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clases_id_clase_seq OWNER TO postgres;

--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 229
-- Name: clases_id_clase_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clases_id_clase_seq OWNED BY public.clases.id_clase;


--
-- TOC entry 233 (class 1259 OID 24982)
-- Name: comparar_tipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comparar_tipos (
    como_texto character varying(10),
    como_numero integer
);


ALTER TABLE public.comparar_tipos OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 24927)
-- Name: entrenadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entrenadores (
    id_entrenador integer NOT NULL,
    nombre character varying(100) NOT NULL,
    especialidad character varying(50) NOT NULL,
    correo character varying(100) NOT NULL
);


ALTER TABLE public.entrenadores OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24926)
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entrenadores_id_entrenador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entrenadores_id_entrenador_seq OWNER TO postgres;

--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 227
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entrenadores_id_entrenador_seq OWNED BY public.entrenadores.id_entrenador;


--
-- TOC entry 222 (class 1259 OID 24869)
-- Name: fichas_medicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fichas_medicas (
    id_ficha integer NOT NULL,
    peso numeric(5,2) NOT NULL,
    estatura numeric(3,2) NOT NULL,
    lesiones text,
    id_socio integer NOT NULL,
    CONSTRAINT fichas_medicas_estatura_check CHECK ((estatura > (0)::numeric)),
    CONSTRAINT fichas_medicas_peso_check CHECK ((peso > (0)::numeric))
);


ALTER TABLE public.fichas_medicas OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24868)
-- Name: fichas_medicas_id_ficha_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fichas_medicas_id_ficha_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fichas_medicas_id_ficha_seq OWNER TO postgres;

--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 221
-- Name: fichas_medicas_id_ficha_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fichas_medicas_id_ficha_seq OWNED BY public.fichas_medicas.id_ficha;


--
-- TOC entry 232 (class 1259 OID 24957)
-- Name: inscripciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripciones (
    id_inscripcion integer NOT NULL,
    fecha date NOT NULL,
    id_socio integer NOT NULL,
    id_clase integer NOT NULL
);


ALTER TABLE public.inscripciones OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 24956)
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripciones_id_inscripcion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscripciones_id_inscripcion_seq OWNER TO postgres;

--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 231
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripciones_id_inscripcion_seq OWNED BY public.inscripciones.id_inscripcion;


--
-- TOC entry 226 (class 1259 OID 24904)
-- Name: membresias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.membresias (
    id_membresia integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    id_socio integer NOT NULL,
    id_plan integer NOT NULL,
    valor_pagado numeric(10,2) NOT NULL,
    CONSTRAINT chk_membresias_fechas CHECK ((fecha_fin >= fecha_inicio)),
    CONSTRAINT chk_membresias_valor_pagado CHECK ((valor_pagado > (0)::numeric)),
    CONSTRAINT membresias_check CHECK ((fecha_fin >= fecha_inicio))
);


ALTER TABLE public.membresias OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24903)
-- Name: membresias_id_membresia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.membresias_id_membresia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membresias_id_membresia_seq OWNER TO postgres;

--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 225
-- Name: membresias_id_membresia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.membresias_id_membresia_seq OWNED BY public.membresias.id_membresia;


--
-- TOC entry 235 (class 1259 OID 25022)
-- Name: ocupacion_clases; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ocupacion_clases AS
 SELECT c.id_clase,
    c.nombre AS clase,
    c.dia_semana,
    c.hora,
    c.cupo,
    count(i.id_inscripcion) AS inscritos
   FROM (public.clases c
     LEFT JOIN public.inscripciones i ON ((c.id_clase = i.id_clase)))
  WHERE ((c.estado)::text = 'activa'::text)
  GROUP BY c.id_clase, c.nombre, c.dia_semana, c.hora, c.cupo;


ALTER VIEW public.ocupacion_clases OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24891)
-- Name: planes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planes (
    id_plan integer NOT NULL,
    nombre character varying(50) NOT NULL,
    duracion_meses integer NOT NULL,
    precio numeric(10,2) NOT NULL,
    CONSTRAINT planes_duracion_meses_check CHECK ((duracion_meses > 0)),
    CONSTRAINT planes_precio_check CHECK ((precio >= (0)::numeric))
);


ALTER TABLE public.planes OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24890)
-- Name: planes_id_plan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planes_id_plan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planes_id_plan_seq OWNER TO postgres;

--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 223
-- Name: planes_id_plan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planes_id_plan_seq OWNED BY public.planes.id_plan;


--
-- TOC entry 220 (class 1259 OID 24854)
-- Name: socios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socios (
    id_socio integer NOT NULL,
    documento character varying(20) NOT NULL,
    nombre character varying(100) NOT NULL,
    telefono character varying(20) NOT NULL,
    correo character varying(100),
    acepta_whatsapp boolean DEFAULT false NOT NULL
);


ALTER TABLE public.socios OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24853)
-- Name: socios_id_socio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socios_id_socio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.socios_id_socio_seq OWNER TO postgres;

--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 219
-- Name: socios_id_socio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socios_id_socio_seq OWNED BY public.socios.id_socio;


--
-- TOC entry 234 (class 1259 OID 25017)
-- Name: socios_vencidos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.socios_vencidos AS
 SELECT s.id_socio,
    s.nombre,
    s.telefono,
    s.acepta_whatsapp,
    max(m.fecha_fin) AS fecha_vencimiento
   FROM (public.socios s
     JOIN public.membresias m ON ((s.id_socio = m.id_socio)))
  GROUP BY s.id_socio, s.nombre, s.telefono, s.acepta_whatsapp
 HAVING (max(m.fecha_fin) < CURRENT_DATE);


ALTER VIEW public.socios_vencidos OWNER TO postgres;

--
-- TOC entry 4904 (class 2604 OID 24941)
-- Name: clases id_clase; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases ALTER COLUMN id_clase SET DEFAULT nextval('public.clases_id_clase_seq'::regclass);


--
-- TOC entry 4903 (class 2604 OID 24930)
-- Name: entrenadores id_entrenador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores ALTER COLUMN id_entrenador SET DEFAULT nextval('public.entrenadores_id_entrenador_seq'::regclass);


--
-- TOC entry 4900 (class 2604 OID 24872)
-- Name: fichas_medicas id_ficha; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas ALTER COLUMN id_ficha SET DEFAULT nextval('public.fichas_medicas_id_ficha_seq'::regclass);


--
-- TOC entry 4906 (class 2604 OID 24960)
-- Name: inscripciones id_inscripcion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones ALTER COLUMN id_inscripcion SET DEFAULT nextval('public.inscripciones_id_inscripcion_seq'::regclass);


--
-- TOC entry 4902 (class 2604 OID 24907)
-- Name: membresias id_membresia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias ALTER COLUMN id_membresia SET DEFAULT nextval('public.membresias_id_membresia_seq'::regclass);


--
-- TOC entry 4901 (class 2604 OID 24894)
-- Name: planes id_plan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes ALTER COLUMN id_plan SET DEFAULT nextval('public.planes_id_plan_seq'::regclass);


--
-- TOC entry 4898 (class 2604 OID 24857)
-- Name: socios id_socio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios ALTER COLUMN id_socio SET DEFAULT nextval('public.socios_id_socio_seq'::regclass);


--
-- TOC entry 5106 (class 0 OID 24938)
-- Dependencies: 230
-- Data for Name: clases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clases (id_clase, nombre, dia_semana, hora, cupo, id_entrenador, estado) FROM stdin;
1	Spinning Matutino	Lunes	06:00:00	1	1	activa
2	Yoga Relax	Martes	08:00:00	15	2	activa
3	Funcional Advanced	Miércoles	18:00:00	10	1	activa
4	Spinning Nocturno	Jueves	19:00:00	20	1	suspendida
5	Pilates	Viernes	18:00:00	12	1	activa
\.


--
-- TOC entry 5109 (class 0 OID 24982)
-- Dependencies: 233
-- Data for Name: comparar_tipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comparar_tipos (como_texto, como_numero) FROM stdin;
800	800
1200	1200
95	95
\.


--
-- TOC entry 5104 (class 0 OID 24927)
-- Dependencies: 228
-- Data for Name: entrenadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entrenadores (id_entrenador, nombre, especialidad, correo) FROM stdin;
1	Marcela Rios	Spinning	marcela.rios@gimnasio.com
2	Esteban Quito	Yoga	esteban.quito@gimnasio.com
3	Roberto Gómez	Funcional	roberto.gomez@gimnasio.com
\.


--
-- TOC entry 5098 (class 0 OID 24869)
-- Dependencies: 222
-- Data for Name: fichas_medicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fichas_medicas (id_ficha, peso, estatura, lesiones, id_socio) FROM stdin;
1	60.50	1.65	Ninguna	1
2	75.00	1.78	Molestia leve en rodilla derecha	2
3	55.20	1.60	Ninguna	3
4	82.40	1.80	Lumbalgia leve	4
\.


--
-- TOC entry 5108 (class 0 OID 24957)
-- Dependencies: 232
-- Data for Name: inscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones (id_inscripcion, fecha, id_socio, id_clase) FROM stdin;
1	2026-11-02	1	1
2	2026-11-02	2	2
3	2026-11-03	3	2
4	2026-11-03	4	2
5	2026-11-04	5	2
6	2026-11-04	1	3
7	2026-11-05	2	3
8	2026-11-05	3	3
9	2026-11-06	4	4
10	2026-11-06	5	4
11	2026-11-08	4	3
12	2026-11-09	7	3
13	2026-11-10	7	2
14	2026-11-11	8	2
15	2026-11-19	1	5
\.


--
-- TOC entry 5102 (class 0 OID 24904)
-- Dependencies: 226
-- Data for Name: membresias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.membresias (id_membresia, fecha_inicio, fecha_fin, id_socio, id_plan, valor_pagado) FROM stdin;
1	2025-01-01	2025-02-01	1	1	90000.00
2	2025-02-01	2025-03-01	1	1	90000.00
3	2026-01-01	2026-04-01	2	2	210000.00
4	2026-11-01	2026-12-01	3	1	90000.00
5	2026-10-01	2027-10-01	4	3	800000.00
6	2026-11-10	2026-12-10	5	1	90000.00
7	2025-05-01	2025-06-01	6	1	90000.00
9	2026-09-10	2026-10-10	1	1	90000.00
10	2026-10-05	2027-01-05	3	2	220000.00
11	2026-02-01	2026-03-01	7	1	85000.00
12	2026-11-05	2026-12-05	8	1	90000.00
13	2026-11-15	2027-02-15	2	2	230000.00
14	2026-08-01	2027-08-01	5	3	810000.00
\.


--
-- TOC entry 5100 (class 0 OID 24891)
-- Dependencies: 224
-- Data for Name: planes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planes (id_plan, nombre, duracion_meses, precio) FROM stdin;
1	Mensual	1	90000.00
2	Trimestral	3	240000.00
3	Anual	12	850000.00
\.


--
-- TOC entry 5096 (class 0 OID 24854)
-- Dependencies: 220
-- Data for Name: socios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socios (id_socio, documento, nombre, telefono, correo, acepta_whatsapp) FROM stdin;
2	10102	Carlos Gómez	3102222222	\N	f
4	10104	Mateo Ruiz	3104444444	mateo.ruiz@email.com	f
6	10106	David Morales	3106666666	david.morales@email.com	f
1	10101	Ana Pérez	3209999999	ana.perez@email.com	t
3	10103	Lucía Torres	3103333333	lucia.torres@email.com	t
5	10105	Sofía Castro	3105555555	sofia.castro@email.com	t
7	10107	Valeria Gómez	3107777777	\N	t
8	10108	Andrés Silva	3108888888	andres.silva@email.com	f
\.


--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 229
-- Name: clases_id_clase_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clases_id_clase_seq', 5, true);


--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 227
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entrenadores_id_entrenador_seq', 3, true);


--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 221
-- Name: fichas_medicas_id_ficha_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fichas_medicas_id_ficha_seq', 4, true);


--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 231
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripciones_id_inscripcion_seq', 15, true);


--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 225
-- Name: membresias_id_membresia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.membresias_id_membresia_seq', 14, true);


--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 223
-- Name: planes_id_plan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planes_id_plan_seq', 3, true);


--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 219
-- Name: socios_id_socio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socios_id_socio_seq', 8, true);


--
-- TOC entry 4933 (class 2606 OID 24997)
-- Name: clases clases_dia_semana_hora_entrenador_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_dia_semana_hora_entrenador_key UNIQUE (dia_semana, hora, id_entrenador);


--
-- TOC entry 4935 (class 2606 OID 24950)
-- Name: clases clases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_pkey PRIMARY KEY (id_clase);


--
-- TOC entry 4931 (class 2606 OID 24936)
-- Name: entrenadores entrenadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_pkey PRIMARY KEY (id_entrenador);


--
-- TOC entry 4923 (class 2606 OID 24884)
-- Name: fichas_medicas fichas_medicas_id_socio_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_id_socio_key UNIQUE (id_socio);


--
-- TOC entry 4925 (class 2606 OID 24882)
-- Name: fichas_medicas fichas_medicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_pkey PRIMARY KEY (id_ficha);


--
-- TOC entry 4937 (class 2606 OID 24966)
-- Name: inscripciones inscripciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_pkey PRIMARY KEY (id_inscripcion);


--
-- TOC entry 4929 (class 2606 OID 24915)
-- Name: membresias membresias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_pkey PRIMARY KEY (id_membresia);


--
-- TOC entry 4927 (class 2606 OID 24902)
-- Name: planes planes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes
    ADD CONSTRAINT planes_pkey PRIMARY KEY (id_plan);


--
-- TOC entry 4917 (class 2606 OID 24867)
-- Name: socios socios_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_correo_key UNIQUE (correo);


--
-- TOC entry 4919 (class 2606 OID 24865)
-- Name: socios socios_documento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_documento_key UNIQUE (documento);


--
-- TOC entry 4921 (class 2606 OID 24863)
-- Name: socios socios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_pkey PRIMARY KEY (id_socio);


--
-- TOC entry 4939 (class 2606 OID 24968)
-- Name: inscripciones uk_socio_clase; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT uk_socio_clase UNIQUE (id_socio, id_clase);


--
-- TOC entry 4943 (class 2606 OID 24951)
-- Name: clases clases_id_entrenador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_id_entrenador_fkey FOREIGN KEY (id_entrenador) REFERENCES public.entrenadores(id_entrenador);


--
-- TOC entry 4940 (class 2606 OID 24998)
-- Name: fichas_medicas fichas_medicas_id_socio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_id_socio_fkey FOREIGN KEY (id_socio) REFERENCES public.socios(id_socio) ON DELETE CASCADE;


--
-- TOC entry 4944 (class 2606 OID 24974)
-- Name: inscripciones inscripciones_id_clase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_id_clase_fkey FOREIGN KEY (id_clase) REFERENCES public.clases(id_clase);


--
-- TOC entry 4945 (class 2606 OID 24969)
-- Name: inscripciones inscripciones_id_socio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_id_socio_fkey FOREIGN KEY (id_socio) REFERENCES public.socios(id_socio);


--
-- TOC entry 4941 (class 2606 OID 24921)
-- Name: membresias membresias_id_plan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_id_plan_fkey FOREIGN KEY (id_plan) REFERENCES public.planes(id_plan);


--
-- TOC entry 4942 (class 2606 OID 24916)
-- Name: membresias membresias_id_socio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_id_socio_fkey FOREIGN KEY (id_socio) REFERENCES public.socios(id_socio);


-- Completed on 2026-11-19 14:49:28

--
-- PostgreSQL database dump complete
--

\unrestrict fsj6OMy8nwwvTNhT0zuPcLQ95dhdANidl1vdDgfi11lglpKad8bA0Vuq8PduOoy

