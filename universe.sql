--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    galaxy_type character varying DEFAULT 'Spiral'::character varying NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth integer,
    is_spherical boolean
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
    name character varying NOT NULL,
    planet_id integer,
    is_spherical boolean,
    orbital_period_days numeric,
    discovered_by text,
    diameter_km integer
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
    name character varying NOT NULL,
    star_id integer,
    planet_type character varying NOT NULL,
    has_life boolean,
    age_in_millions_of_years integer,
    diameter_km integer
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
-- Name: space_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_mission (
    space_mission_id integer NOT NULL,
    name character varying NOT NULL,
    target_type character varying NOT NULL,
    target_id integer NOT NULL,
    launch_year integer,
    successful boolean
);


ALTER TABLE public.space_mission OWNER TO freecodecamp;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_mission_space_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_mission_space_mission_id_seq OWNER TO freecodecamp;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_mission_space_mission_id_seq OWNED BY public.space_mission.space_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    mass numeric NOT NULL,
    spectral_type character varying
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
-- Name: space_mission space_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission ALTER COLUMN space_mission_id SET DEFAULT nextval('public.space_mission_space_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Contains the Solar System', 'Spiral', 13600, 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy to the Milky Way', 'Spiral', 10000, 2537000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller member of the local group', 'Spiral', 10000, 3000000, true);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'A supergiant elliptical galaxy in the Virgo cluster', 'Elliptical', 13000, 53000000, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A galaxy with a bright nucleus and a large central bulge', 'Spiral', 10000, 29000000, true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Interacting grand-design spiral galaxy', 'Spiral', 10000, 23000000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (17, 'Charon', 3, true, 6.4, 'James Christy', 1212);
INSERT INTO public.moon VALUES (18, 'Nereid', 8, false, 360.1, 'Gerard Kuiper', 340);
INSERT INTO public.moon VALUES (19, 'Miranda', 7, true, 1.4, 'Voyager 2', 471);
INSERT INTO public.moon VALUES (20, 'Himalia', 5, false, 250.6, 'Charles Perrine', 140);
INSERT INTO public.moon VALUES (1, 'Moon', 3, true, 27.3, NULL, 3475);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 0.3, 'Asaph Hall', 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 1.3, 'Asaph Hall', 12);
INSERT INTO public.moon VALUES (4, 'Io', 5, true, 1.8, 'Galileo Galilei', 3643);
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, 3.5, 'Galileo Galilei', 3122);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, true, 7.1, 'Galileo Galilei', 5268);
INSERT INTO public.moon VALUES (7, 'Calistto', 5, true, 16.7, 'Galileo Galilei', 4820);
INSERT INTO public.moon VALUES (8, 'Titan', 6, true, 15.9, 'Christiaan Huygens', 5150);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, true, 1.4, 'William Herschel', 504);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, true, 0.9, 'William Herschel', 396);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, true, 4.5, 'Giovanni Cassini', 1528);
INSERT INTO public.moon VALUES (12, 'Titania', 7, true, 8.7, 'William Herschel', 1578);
INSERT INTO public.moon VALUES (13, 'Oberon', 7, true, 13.5, 'William Herschel', 1522);
INSERT INTO public.moon VALUES (14, 'Umbriel', 7, true, 4.1, 'William Lassell', 1169);
INSERT INTO public.moon VALUES (15, 'Triton', 8, true, 5.9, 'William Lassell', 2706);
INSERT INTO public.moon VALUES (16, 'Proteus', 8, false, 1.1, 'Voyager 2', 420);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 'Kepler-186f', 2, 'terrestrial', false, 4000, 13000);
INSERT INTO public.planet VALUES (10, 'Gliese 581c', 2, 'terrestrial', false, 5000, 11000);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 3, 'gas giant', false, 3000, 140000);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 4, 'terrestrial', false, 8000, 12000);
INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, 4500, 4879);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', false, 4500, 12104);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, 4500, 12742);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', false, 4500, 6779);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', false, 4500, 139820);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', false, 4500, 116460);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', false, 4500, 50724);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', false, 4500, 49244);


--
-- Data for Name: space_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_mission VALUES (1, 'Apollo 11', 'planet', 1, 1969, true);
INSERT INTO public.space_mission VALUES (2, 'Voyager 1', 'planet', 1, 1977, true);
INSERT INTO public.space_mission VALUES (3, 'Galileo Probe', 'moon', 3, 1995, true);
INSERT INTO public.space_mission VALUES (4, 'Solar Probe', 'star', 2, 2018, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, 'G2V');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 0.1221, 'M5.5Ve');
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 1.1, 'G2V');
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 1, 0.907, 'K1V');
INSERT INTO public.star VALUES (5, 'Barnards Star', 1, 0.144, 'M4Ve');
INSERT INTO public.star VALUES (6, 'Wolf 359', 1, 0.09, 'M6Ve');


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
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_mission_space_mission_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_mission space_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_name_key UNIQUE (name);


--
-- Name: space_mission space_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_pkey PRIMARY KEY (space_mission_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

