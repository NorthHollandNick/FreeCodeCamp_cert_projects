--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: dimensional_plane; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dimensional_plane (
    creator_name character varying(40) NOT NULL,
    age_in_million_years numeric(9,3) NOT NULL,
    creators_favorite boolean,
    dimensional_plane_id integer NOT NULL,
    name character varying(40)
);


ALTER TABLE public.dimensional_plane OWNER TO freecodecamp;

--
-- Name: dimensional_plane_plane_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dimensional_plane_plane_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dimensional_plane_plane_id_seq OWNER TO freecodecamp;

--
-- Name: dimensional_plane_plane_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dimensional_plane_plane_id_seq OWNED BY public.dimensional_plane.dimensional_plane_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    num_black_holes integer,
    history text,
    dimensional_plane_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer,
    is_boring boolean,
    has_rocks boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    star_id integer,
    weight_in_earths numeric(5,1),
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer,
    num_alien_races integer,
    will_become_supernova boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: dimensional_plane dimensional_plane_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dimensional_plane ALTER COLUMN dimensional_plane_id SET DEFAULT nextval('public.dimensional_plane_plane_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: dimensional_plane; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dimensional_plane VALUES ('SuperGod', 38591.213, false, 1, 'The Main Plane');
INSERT INTO public.dimensional_plane VALUES ('SuperGod', 24905.120, true, 2, 'The Most Awesome');
INSERT INTO public.dimensional_plane VALUES ('MegaMason', 37420.690, true, 3, 'The Shifty Zone');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxy A', 0, 'unknown', 1);
INSERT INTO public.galaxy VALUES (2, 'Galaxy B', 0, 'unknown', 1);
INSERT INTO public.galaxy VALUES (3, 'Galaxy C', 0, 'boring', 1);
INSERT INTO public.galaxy VALUES (4, 'Sexy Zone', 0, 'unspeakable', 2);
INSERT INTO public.galaxy VALUES (5, 'Zoomin Zone', 0, 'flexin awesome', 2);
INSERT INTO public.galaxy VALUES (6, 'Deep Dark', 13, 'conceived in sin', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Moon B', 1, true, true);
INSERT INTO public.moon VALUES (3, 'Moon C', 1, true, true);
INSERT INTO public.moon VALUES (4, 'Moon D', 1, true, true);
INSERT INTO public.moon VALUES (5, 'Moon E', 2, true, true);
INSERT INTO public.moon VALUES (6, 'Moon F', 2, true, true);
INSERT INTO public.moon VALUES (7, 'Moon G', 2, true, true);
INSERT INTO public.moon VALUES (8, 'Moon H', 2, true, true);
INSERT INTO public.moon VALUES (1, 'Moon A', 1, true, true);
INSERT INTO public.moon VALUES (9, 'Moon I', 3, true, true);
INSERT INTO public.moon VALUES (10, 'Moon J', 3, true, true);
INSERT INTO public.moon VALUES (11, 'Moon K', 3, true, true);
INSERT INTO public.moon VALUES (12, 'Moon L', 3, true, true);
INSERT INTO public.moon VALUES (13, 'Moon M', 4, true, true);
INSERT INTO public.moon VALUES (14, 'Moon N', 4, true, true);
INSERT INTO public.moon VALUES (15, 'Moon O', 4, true, true);
INSERT INTO public.moon VALUES (16, 'Moon P', 4, true, true);
INSERT INTO public.moon VALUES (17, 'Luna Lovely', 10, false, true);
INSERT INTO public.moon VALUES (18, 'Miss Diana', 10, false, true);
INSERT INTO public.moon VALUES (19, 'Gracious Lady', 9, false, true);
INSERT INTO public.moon VALUES (20, 'Goddess Softly', 6, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet A', 1, 4.2, true);
INSERT INTO public.planet VALUES (2, 'Planet B', 3, 23.0, false);
INSERT INTO public.planet VALUES (3, 'Planet C', 4, 5.3, false);
INSERT INTO public.planet VALUES (4, 'Planet D', 4, 34.8, false);
INSERT INTO public.planet VALUES (5, 'Planet E', 4, 591.7, false);
INSERT INTO public.planet VALUES (6, 'Much Wow', 6, 7.0, true);
INSERT INTO public.planet VALUES (7, 'Very Cool', 6, 7.0, true);
INSERT INTO public.planet VALUES (8, 'So Awe', 6, 7.0, true);
INSERT INTO public.planet VALUES (9, 'Many Thank', 6, 7.0, true);
INSERT INTO public.planet VALUES (10, 'Super Nice', 6, 7.0, true);
INSERT INTO public.planet VALUES (11, 'NewFound', 2, 0.1, false);
INSERT INTO public.planet VALUES (12, 'DarkOne', 5, 666.3, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star A', 1, 0, false);
INSERT INTO public.star VALUES (2, 'Star B', 1, 0, false);
INSERT INTO public.star VALUES (3, 'Star C', 1, 2, false);
INSERT INTO public.star VALUES (4, 'Star D', 2, 17, true);
INSERT INTO public.star VALUES (5, 'Star E', 3, 5, false);
INSERT INTO public.star VALUES (6, 'Lux Alfa', 4, 777, false);


--
-- Name: dimensional_plane_plane_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dimensional_plane_plane_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: dimensional_plane dimensional_plane_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dimensional_plane
    ADD CONSTRAINT dimensional_plane_pkey PRIMARY KEY (dimensional_plane_id);


--
-- Name: dimensional_plane dimensional_plane_plane_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dimensional_plane
    ADD CONSTRAINT dimensional_plane_plane_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_plane_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_plane_id_fkey FOREIGN KEY (dimensional_plane_id) REFERENCES public.dimensional_plane(dimensional_plane_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--



