--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.4

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

--
-- Name: app; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE TABLE public.math (
    "Unnamed: 0" bigint,
    school text,
    sex text,
    romantic text,
    age bigint,
    "Mjob" text,
    "Fjob" text,
    health bigint,
    studytime bigint,
    absences bigint,
    "G3" bigint
);


ALTER TABLE public.math OWNER TO postgres;

--
-- Name: portuguese; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.portuguese (
    "Unnamed: 0" bigint,
    school text,
    sex text,
    romantic text,
    age bigint,
    "Mjob" text,
    "Fjob" text,
    health bigint,
    studytime bigint,
    absences bigint,
    "G3" bigint
);


ALTER TABLE public.portuguese OWNER TO postgres;

--
-- Data for Name: math; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.math ("Unnamed: 0", school, sex, romantic, age, "Mjob", "Fjob", health, studytime, absences, "G3") FROM stdin;
\.
COPY public.math ("Unnamed: 0", school, sex, romantic, age, "Mjob", "Fjob", health, studytime, absences, "G3") FROM '/docker-entrypoint-initdb.d/3358.dat';

--
-- Data for Name: portuguese; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.portuguese ("Unnamed: 0", school, sex, romantic, age, "Mjob", "Fjob", health, studytime, absences, "G3") FROM stdin;
\.
COPY public.portuguese ("Unnamed: 0", school, sex, romantic, age, "Mjob", "Fjob", health, studytime, absences, "G3") FROM '/docker-entrypoint-initdb.d/3359.dat';

--
-- PostgreSQL database dump complete
--

