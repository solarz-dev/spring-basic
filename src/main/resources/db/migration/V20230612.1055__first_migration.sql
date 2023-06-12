--
-- PostgreSQL database dump
--

-- Dumped from database version 11.13
-- Dumped by pg_dump version 11.13

-- Started on 2023-06-12 10:54:59

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

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 649372)
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endereco (
    id bigint NOT NULL,
    cep character varying(255),
    logradouro character varying(255),
    name character varying(255),
    numero character varying(255)
);


ALTER TABLE public.endereco OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 649370)
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
-- TOC entry 2870 (class 0 OID 0)
-- Dependencies: 198
-- Name: endereco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.endereco_id_seq OWNED BY public.endereco.id;


--
-- TOC entry 201 (class 1259 OID 649383)
-- Name: forma_de_pagamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forma_de_pagamento (
    id bigint NOT NULL,
    name character varying(255),
    user_account_id bigint
);


ALTER TABLE public.forma_de_pagamento OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 649381)
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
-- TOC entry 2871 (class 0 OID 0)
-- Dependencies: 200
-- Name: forma_de_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forma_de_pagamento_id_seq OWNED BY public.forma_de_pagamento.id;


--
-- TOC entry 203 (class 1259 OID 649391)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 649389)
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
-- TOC entry 2872 (class 0 OID 0)
-- Dependencies: 202
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- TOC entry 196 (class 1259 OID 649362)
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
-- TOC entry 197 (class 1259 OID 649364)
-- Name: user_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_account (
    id bigint DEFAULT nextval('public.user_id_seq'::regclass) NOT NULL,
    name character varying(255),
    endereco_id bigint
);


ALTER TABLE public.user_account OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 649397)
-- Name: user_account_forma_de_pagamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_account_forma_de_pagamento (
    user_account_id bigint NOT NULL,
    forma_de_pagamento_id bigint NOT NULL
);


ALTER TABLE public.user_account_forma_de_pagamento OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 649400)
-- Name: user_account_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_account_roles (
    user_account_id bigint NOT NULL,
    roles_id bigint NOT NULL
);


ALTER TABLE public.user_account_roles OWNER TO postgres;

--
-- TOC entry 2713 (class 2604 OID 649375)
-- Name: endereco id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco ALTER COLUMN id SET DEFAULT nextval('public.endereco_id_seq'::regclass);


--
-- TOC entry 2714 (class 2604 OID 649386)
-- Name: forma_de_pagamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_de_pagamento ALTER COLUMN id SET DEFAULT nextval('public.forma_de_pagamento_id_seq'::regclass);


--
-- TOC entry 2715 (class 2604 OID 649394)
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 2858 (class 0 OID 649372)
-- Dependencies: 199
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.endereco (id, cep, logradouro, name, numero) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 649383)
-- Dependencies: 201
-- Data for Name: forma_de_pagamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forma_de_pagamento (id, name, user_account_id) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 649391)
-- Dependencies: 203
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, name) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 649364)
-- Dependencies: 197
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_account (id, name, endereco_id) FROM stdin;
0	Edvaldo	\N
1	Edvaldo	\N
\.


--
-- TOC entry 2863 (class 0 OID 649397)
-- Dependencies: 204
-- Data for Name: user_account_forma_de_pagamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_account_forma_de_pagamento (user_account_id, forma_de_pagamento_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 649400)
-- Dependencies: 205
-- Data for Name: user_account_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_account_roles (user_account_id, roles_id) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 0)
-- Dependencies: 198
-- Name: endereco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.endereco_id_seq', 1, false);


--
-- TOC entry 2874 (class 0 OID 0)
-- Dependencies: 200
-- Name: forma_de_pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forma_de_pagamento_id_seq', 1, false);


--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 202
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 1, false);


--
-- TOC entry 2876 (class 0 OID 0)
-- Dependencies: 196
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- TOC entry 2719 (class 2606 OID 649380)
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 649388)
-- Name: forma_de_pagamento forma_de_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_de_pagamento
    ADD CONSTRAINT forma_de_pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 649396)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 649406)
-- Name: user_account_forma_de_pagamento uk_4p3f9wy1s2dw81vbkh1kab4ds; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_forma_de_pagamento
    ADD CONSTRAINT uk_4p3f9wy1s2dw81vbkh1kab4ds UNIQUE (forma_de_pagamento_id);


--
-- TOC entry 2717 (class 2606 OID 649369)
-- Name: user_account user_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 649404)
-- Name: user_account_roles user_account_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_roles
    ADD CONSTRAINT user_account_roles_pkey PRIMARY KEY (user_account_id, roles_id);


--
-- TOC entry 2728 (class 2606 OID 649412)
-- Name: user_account fk89foqlb091rg9f5y60f5iatxi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT fk89foqlb091rg9f5y60f5iatxi FOREIGN KEY (endereco_id) REFERENCES public.endereco(id);


--
-- TOC entry 2731 (class 2606 OID 649422)
-- Name: user_account_forma_de_pagamento fkfmkmwuuyboenttmmf9xq91s81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_forma_de_pagamento
    ADD CONSTRAINT fkfmkmwuuyboenttmmf9xq91s81 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2732 (class 2606 OID 649427)
-- Name: user_account_roles fkhgw1hs27q8latvqis3h4u9hh0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_roles
    ADD CONSTRAINT fkhgw1hs27q8latvqis3h4u9hh0 FOREIGN KEY (roles_id) REFERENCES public.role(id);


--
-- TOC entry 2729 (class 2606 OID 649407)
-- Name: forma_de_pagamento fkisit7p8yo9ffj02r6wd7uusv0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_de_pagamento
    ADD CONSTRAINT fkisit7p8yo9ffj02r6wd7uusv0 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2733 (class 2606 OID 649432)
-- Name: user_account_roles fkpacca51k3kkqoqs0nbmyugdt2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_roles
    ADD CONSTRAINT fkpacca51k3kkqoqs0nbmyugdt2 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2730 (class 2606 OID 649417)
-- Name: user_account_forma_de_pagamento fktacp09ufxti83jkvnlvdwgdgy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_forma_de_pagamento
    ADD CONSTRAINT fktacp09ufxti83jkvnlvdwgdgy FOREIGN KEY (forma_de_pagamento_id) REFERENCES public.forma_de_pagamento(id);


-- Completed on 2023-06-12 10:55:00

--
-- PostgreSQL database dump complete
--

