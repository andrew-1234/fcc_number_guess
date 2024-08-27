--
-- PostgreSQL database dump
--

-- Dumped from database version 12.19 (Ubuntu 12.19-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.19 (Ubuntu 12.19-0ubuntu0.20.04.1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: logs; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.logs (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.logs OWNER TO freecodecamp;

--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.logs VALUES ('user_1724743873562', 2, 626);
INSERT INTO public.logs VALUES ('user_1724743873563', 5, 676);
INSERT INTO public.logs VALUES ('andrew', 5, 2);
INSERT INTO public.logs VALUES ('bob', 1, 1);
INSERT INTO public.logs VALUES ('jane', 1, 6);
INSERT INTO public.logs VALUES ('user_1724743759635', 2, 214);
INSERT INTO public.logs VALUES ('user_1724743759636', 5, 62);
INSERT INTO public.logs VALUES ('user_1724743848628', 2, 599);
INSERT INTO public.logs VALUES ('user_1724743848629', 5, 130);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

