--
-- PostgreSQL database dump
--

-- Dumped from database version 11.13
-- Dumped by pg_dump version 11.13

-- Started on 2023-06-21 10:28:36

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 649458)
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endereco (
    id bigint NOT NULL,
    cep character varying(255),
    logradouro character varying(255),
    name character varying(255),
    numero character varying(255),
    complemento character varying(255)
);


ALTER TABLE public.endereco OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 649464)
-- Name: endereco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.endereco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.endereco_id_seq OWNER TO postgres;

--
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 198
-- Name: endereco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.endereco_id_seq OWNED BY public.endereco.id;

--
-- TOC entry 199 (class 1259 OID 649466)
-- Name: forma_de_pagamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forma_de_pagamento (
    id bigint NOT NULL,
    name character varying(255),
    user_account_id bigint
);


ALTER TABLE public.forma_de_pagamento OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 649469)
-- Name: forma_de_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forma_de_pagamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forma_de_pagamento_id_seq OWNER TO postgres;

--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 200
-- Name: forma_de_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forma_de_pagamento_id_seq OWNED BY public.forma_de_pagamento.id;


--
-- TOC entry 207 (class 1259 OID 649594)
-- Name: privilege; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privilege (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.privilege OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 649592)
-- Name: privilege_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.privilege_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.privilege_id_seq OWNER TO postgres;

--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 206
-- Name: privilege_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.privilege_id_seq OWNED BY public.privilege.id;


--
-- TOC entry 201 (class 1259 OID 649471)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 649474)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 202
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- TOC entry 203 (class 1259 OID 649476)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 649478)
-- Name: user_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_account (
    id bigint DEFAULT nextval('public.user_id_seq'::regclass) NOT NULL,
    name character varying(255),
    endereco_id bigint,
    enabled boolean DEFAULT true,
    password character varying(255),
    username character varying(255),
    email character varying(255),
    last_name character varying(255)
);


ALTER TABLE public.user_account OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 649600)
-- Name: user_account_privileges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_account_privileges (
    user_account_id bigint NOT NULL,
    privileges_id bigint NOT NULL
);


ALTER TABLE public.user_account_privileges OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 649485)
-- Name: user_account_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_account_roles (
    user_account_id bigint NOT NULL,
    roles_id bigint NOT NULL
);


ALTER TABLE public.user_account_roles OWNER TO postgres;

--
-- TOC entry 2725 (class 2604 OID 649488)
-- Name: endereco id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco ALTER COLUMN id SET DEFAULT nextval('public.endereco_id_seq'::regclass);


--
-- TOC entry 2726 (class 2604 OID 649489)
-- Name: forma_de_pagamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_de_pagamento ALTER COLUMN id SET DEFAULT nextval('public.forma_de_pagamento_id_seq'::regclass);


--
-- TOC entry 2730 (class 2604 OID 649597)
-- Name: privilege id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilege ALTER COLUMN id SET DEFAULT nextval('public.privilege_id_seq'::regclass);


--
-- TOC entry 2727 (class 2604 OID 649490)
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 2876 (class 0 OID 649458)
-- Dependencies: 197
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.endereco (id, cep, logradouro, name, numero, complemento) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 649466)
-- Dependencies: 199
-- Data for Name: forma_de_pagamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forma_de_pagamento (id, name, user_account_id) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 649594)
-- Dependencies: 207
-- Data for Name: privilege; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privilege (id, name) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 649471)
-- Dependencies: 201
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, name) FROM stdin;
1	ADMIN
2	USER
\.


--
-- TOC entry 2883 (class 0 OID 649478)
-- Dependencies: 204
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_account (id, name, endereco_id, enabled, password, username, email, last_name) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 649600)
-- Dependencies: 208
-- Data for Name: user_account_privileges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_account_privileges (user_account_id, privileges_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 649485)
-- Dependencies: 205
-- Data for Name: user_account_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_account_roles (user_account_id, roles_id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 198
-- Name: endereco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.endereco_id_seq', 1, true);


--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 200
-- Name: forma_de_pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forma_de_pagamento_id_seq', 1, false);


--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 206
-- Name: privilege_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.privilege_id_seq', 1, false);


--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 202
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 2, true);


--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 203
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 6, true);


--
-- TOC entry 2735 (class 2606 OID 649492)
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);

--
-- TOC entry 2737 (class 2606 OID 649494)
-- Name: forma_de_pagamento forma_de_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_de_pagamento
    ADD CONSTRAINT forma_de_pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 649599)
-- Name: privilege privilege_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilege
    ADD CONSTRAINT privilege_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 649496)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 649500)
-- Name: user_account user_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 649604)
-- Name: user_account_privileges user_account_privileges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_privileges
    ADD CONSTRAINT user_account_privileges_pkey PRIMARY KEY (user_account_id, privileges_id);


--
-- TOC entry 2743 (class 2606 OID 649502)
-- Name: user_account_roles user_account_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_roles
    ADD CONSTRAINT user_account_roles_pkey PRIMARY KEY (user_account_id, roles_id);

--
-- TOC entry 2749 (class 2606 OID 649503)
-- Name: user_account fk89foqlb091rg9f5y60f5iatxi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT fk89foqlb091rg9f5y60f5iatxi FOREIGN KEY (endereco_id) REFERENCES public.endereco(id);


--
-- TOC entry 2752 (class 2606 OID 649605)
-- Name: user_account_privileges fk8jwvokkkd131sv3dxue34imix; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_privileges
    ADD CONSTRAINT fk8jwvokkkd131sv3dxue34imix FOREIGN KEY (privileges_id) REFERENCES public.privilege(id);


--
-- TOC entry 2750 (class 2606 OID 649513)
-- Name: user_account_roles fkhgw1hs27q8latvqis3h4u9hh0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_roles
    ADD CONSTRAINT fkhgw1hs27q8latvqis3h4u9hh0 FOREIGN KEY (roles_id) REFERENCES public.role(id);


--
-- TOC entry 2748 (class 2606 OID 649518)
-- Name: forma_de_pagamento fkisit7p8yo9ffj02r6wd7uusv0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_de_pagamento
    ADD CONSTRAINT fkisit7p8yo9ffj02r6wd7uusv0 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2751 (class 2606 OID 649523)
-- Name: user_account_roles fkpacca51k3kkqoqs0nbmyugdt2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_roles
    ADD CONSTRAINT fkpacca51k3kkqoqs0nbmyugdt2 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2753 (class 2606 OID 649610)
-- Name: user_account_privileges fkqdmkecokryvyd4febj3n5wfmy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_privileges
    ADD CONSTRAINT fkqdmkecokryvyd4febj3n5wfmy FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


-- Completed on 2023-06-21 10:28:36

--
-- PostgreSQL database dump complete
--

