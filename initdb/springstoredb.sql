--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

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
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    categoryname character varying(255),
    categorystatus integer
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categories ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: invalidated_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invalidated_tokens (
    id bigint NOT NULL,
    expiration_time timestamp(6) without time zone NOT NULL,
    token character varying(255) NOT NULL
);


ALTER TABLE public.invalidated_tokens OWNER TO postgres;

--
-- Name: invalidated_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.invalidated_tokens ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.invalidated_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    categoryid integer,
    createddate timestamp(6) without time zone,
    modifieddate timestamp(6) without time zone,
    productname character varying(255),
    productpicture character varying(255),
    unitinstock integer,
    unitprice numeric(10,2)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.products ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    role_name character varying(255) NOT NULL,
    CONSTRAINT roles_role_name_check CHECK (((role_name)::text = ANY ((ARRAY['USER'::character varying, 'MANAGER'::character varying, 'ADMIN'::character varying])::text[])))
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    username character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, categoryname, categorystatus) FROM stdin;
1	Mobile	1
2	Tablet	1
3	Smart Watch	1
4	Laptop	1
\.


--
-- Data for Name: invalidated_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invalidated_tokens (id, expiration_time, token) FROM stdin;
1	2024-07-19 21:09:06.62367	eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ1c2VyMSIsInJvbGVzIjpbIlVTRVIiXSwiZXhwIjoxNzIxNDg0Mzc3LCJpYXQiOjE3MjEzOTc5Nzd9.qL5SdxVcdIxg1ki8sgQ5-Gc9wgPvuL_xiaxRaByU8s1dmWrgKuQp6dBmh_ZN4MNKSXx8qKuEkuGeSwki3YGWSw
2	2024-07-19 21:11:30.726897	eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ1c2VyMSIsInJvbGVzIjpbIlVTRVIiXSwiZXhwIjoxNzIxNDg0Mzc3LCJpYXQiOjE3MjEzOTc5Nzd9.qL5SdxVcdIxg1ki8sgQ5-Gc9wgPvuL_xiaxRaByU8s1dmWrgKuQp6dBmh_ZN4MNKSXx8qKuEkuGeSwki3YGWSw
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, categoryid, createddate, modifieddate, productname, productpicture, unitinstock, unitprice) FROM stdin;
12	2	2024-08-22 03:57:30.88717	\N	Samsung tab s9	ea860dd4-4a24-450d-bcce-4a478d3d4ecd_Galaxy-Tab-S9-Beige-02.jpg	1	8500.00
11	1	2024-08-22 02:51:34.410266	\N	Samsung s24 ultra	e4df5439-2753-494b-a680-b6ecaecadf59_61cc420c-53d1-4c18-88c6-5be3300ec2f1.jpeg	10	24500.00
9	2	2024-08-01 23:24:13.222488	\N	iPad Pro 2024	dfe6bcb0-dd51-4554-99d4-f4580fb4b061_2e929449-b01c-46bb-a451-6c8671c0570e.jpg	10	19800.00
8	3	2024-08-01 20:45:50.726388	\N	Sample 2	4b66b375-7f16-43a0-8a97-449b25bc3345_4ec49899-62c6-444c-85a9-2ff83ca560b3.png	10	1200.00
7	3	2024-08-01 20:39:09.96631	\N	Apple watch 2024	2703225c-3d36-40d2-a13a-b32350baab28_smartwatch2.jpg	10	25400.00
5	3	2024-07-31 18:32:17.426192	\N	My Smart Watch	c14ec8a7-b79a-4892-a50d-6eb93d203ace_smartwatch1.jpg	1	12500.00
3	3	2024-07-18 22:01:39.660463	\N	Airpods Pro	dc7ec028-f2af-4fc1-bddb-9a28dadff984_91b7439b-95f5-47b4-9259-9a909087eb10.png	5	12500.00
2	2	2024-07-18 18:03:36.650354	\N	iPad Pro 2021	0811d644-1433-4c9c-b69d-a86a5c1fb2ab_78f116ff-ac81-412c-9f9a-867e517571aa.jpg	10	18500.00
1	1	2024-07-18 17:54:24.537623	\N	iPhone 13 Pro Max	66c81e8b-1776-499b-bf3a-7ef80bab7788_mobile1.jpg	1	56000.00
13	1	2024-09-11 15:51:20.174575	\N	iPhone 16 Pro	0b10cc8d-8f15-4128-8264-b26f4ba2b0d7_Apple-iPhone-16-Pro-hero-geo-240909_inline.jpg.large.jpg	10	39000.00
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, role_name) FROM stdin;
1	USER
2	MANAGER
3	ADMIN
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (user_id, role_id) FROM stdin;
1	1
1	2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, username) FROM stdin;
1	user1@email.com	$2a$10$8G/IXBV6XoTxbprOzHE3KOXcEVguPwiK41BHPB7PNGH2lW3K4c52i	user1
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 4, true);


--
-- Name: invalidated_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invalidated_tokens_id_seq', 2, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 13, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: invalidated_tokens invalidated_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invalidated_tokens
    ADD CONSTRAINT invalidated_tokens_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: users uk6dotkott2kjsp8vw4d0m25fb7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);


--
-- Name: roles uk716hgxp60ym1lifrdgp67xt5k; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT uk716hgxp60ym1lifrdgp67xt5k UNIQUE (role_name);


--
-- Name: users ukr43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT ukr43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: user_roles fkh8ciramu9cc9q3qcqiv4ue8a6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6 FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: user_roles fkhfh9dx7w3ubf1co1vdev94g3f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

