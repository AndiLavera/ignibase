--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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
-- Name: apps; Type: TABLE; Schema: public; Owner: cannvi
--

CREATE TABLE public.apps (
    id integer NOT NULL,
    name character varying(254),
    uuid character varying(254),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.apps OWNER TO cannvi;

--
-- Name: apps_id_seq; Type: SEQUENCE; Schema: public; Owner: cannvi
--

CREATE SEQUENCE public.apps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_id_seq OWNER TO cannvi;

--
-- Name: apps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cannvi
--

ALTER SEQUENCE public.apps_id_seq OWNED BY public.apps.id;


--
-- Name: apps_users; Type: TABLE; Schema: public; Owner: cannvi
--

CREATE TABLE public.apps_users (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer,
    app_id integer
);


ALTER TABLE public.apps_users OWNER TO cannvi;

--
-- Name: apps_users_id_seq; Type: SEQUENCE; Schema: public; Owner: cannvi
--

CREATE SEQUENCE public.apps_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_users_id_seq OWNER TO cannvi;

--
-- Name: apps_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cannvi
--

ALTER SEQUENCE public.apps_users_id_seq OWNED BY public.apps_users.id;


--
-- Name: migration_versions; Type: TABLE; Schema: public; Owner: cannvi
--

CREATE TABLE public.migration_versions (
    id integer NOT NULL,
    version character varying(17) NOT NULL
);


ALTER TABLE public.migration_versions OWNER TO cannvi;

--
-- Name: migration_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: cannvi
--

CREATE SEQUENCE public.migration_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migration_versions_id_seq OWNER TO cannvi;

--
-- Name: migration_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cannvi
--

ALTER SEQUENCE public.migration_versions_id_seq OWNED BY public.migration_versions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: cannvi
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(254),
    password_digest character varying(254),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    full_name character varying(254),
    old_password character varying(254),
    preferences json
);


ALTER TABLE public.users OWNER TO cannvi;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: cannvi
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO cannvi;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cannvi
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: apps id; Type: DEFAULT; Schema: public; Owner: cannvi
--

ALTER TABLE ONLY public.apps ALTER COLUMN id SET DEFAULT nextval('public.apps_id_seq'::regclass);


--
-- Name: apps_users id; Type: DEFAULT; Schema: public; Owner: cannvi
--

ALTER TABLE ONLY public.apps_users ALTER COLUMN id SET DEFAULT nextval('public.apps_users_id_seq'::regclass);


--
-- Name: migration_versions id; Type: DEFAULT; Schema: public; Owner: cannvi
--

ALTER TABLE ONLY public.migration_versions ALTER COLUMN id SET DEFAULT nextval('public.migration_versions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: cannvi
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: apps apps_pkey; Type: CONSTRAINT; Schema: public; Owner: cannvi
--

ALTER TABLE ONLY public.apps
    ADD CONSTRAINT apps_pkey PRIMARY KEY (id);


--
-- Name: apps_users apps_users_pkey; Type: CONSTRAINT; Schema: public; Owner: cannvi
--

ALTER TABLE ONLY public.apps_users
    ADD CONSTRAINT apps_users_pkey PRIMARY KEY (id);


--
-- Name: migration_versions migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: cannvi
--

ALTER TABLE ONLY public.migration_versions
    ADD CONSTRAINT migration_versions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: cannvi
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: apps_users fk_cr_606d320c60; Type: FK CONSTRAINT; Schema: public; Owner: cannvi
--

ALTER TABLE ONLY public.apps_users
    ADD CONSTRAINT fk_cr_606d320c60 FOREIGN KEY (app_id) REFERENCES public.apps(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: apps_users fk_cr_8491421a8f; Type: FK CONSTRAINT; Schema: public; Owner: cannvi
--

ALTER TABLE ONLY public.apps_users
    ADD CONSTRAINT fk_cr_8491421a8f FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

