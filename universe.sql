--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(80) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    is_spherical boolean NOT NULL
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
    name character varying(80) NOT NULL,
    planet_id integer NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    radius numeric NOT NULL,
    orbital_period_days integer NOT NULL
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
    name character varying(80) NOT NULL,
    star_id integer NOT NULL,
    planet_type_id integer NOT NULL,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    mass numeric NOT NULL
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    is_terrestrial boolean NOT NULL,
    typical_moons integer NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(80) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(20) NOT NULL,
    mass numeric NOT NULL,
    age_in_millions_of_years integer NOT NULL
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral galaxy containing our solar system.', 13600, 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy to the Milky Way.', 10000, 2537000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral galaxy in the Local Group.', 12000, 2730000, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Bright galaxy with a prominent central bulge.', 13000, 29350000, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Grand-design spiral galaxy interacting with a companion.', 9000, 31000000, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on spiral galaxy with extensive star-forming regions.', 12000, 21000000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 'Earths natural satellite.', false, 1737.4, 27);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Small inner moon of Mars.', false, 11.3, 0);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Small outer moon of Mars.', false, 6.2, 1);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Volcanically active moon of Jupiter.', false, 1821.6, 2);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Icy moon with a subsurface ocean.', false, 1560.8, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Largest moon in the Solar System.', false, 2634.1, 7);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Heavily cratered moon of Jupiter.', false, 2410.3, 17);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Moon with a dense atmosphere.', false, 2574.7, 16);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 'Icy moon of Saturn.', false, 763.8, 5);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 'Icy moon with active geysers.', false, 252.1, 1);
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 'Small cratered moon of Saturn.', false, 198.2, 1);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 'Icy moon with bright surface features.', false, 561.4, 3);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 'Icy moon with a large impact crater.', false, 531.1, 2);
INSERT INTO public.moon VALUES (14, 'Mirach b-I', 7, 'First recorded moon of Mirach b.', false, 410.0, 12);
INSERT INTO public.moon VALUES (15, 'Mirach b-II', 7, 'Second recorded moon of Mirach b.', false, 205.0, 25);
INSERT INTO public.moon VALUES (16, 'Mirach c-I', 8, 'First recorded moon of Mirach c.', false, 850.0, 30);
INSERT INTO public.moon VALUES (17, 'Mirach c-II', 8, 'Second recorded moon of Mirach c.', false, 620.0, 44);
INSERT INTO public.moon VALUES (18, 'Triangulum I-a', 9, 'Natural satellite of Triangulum I.', false, 380.0, 18);
INSERT INTO public.moon VALUES (19, 'Triangulum II-a', 10, 'Natural satellite of Triangulum II.', false, 540.0, 33);
INSERT INTO public.moon VALUES (20, 'Spica b-I', 11, 'Natural satellite of Spica b.', false, 970.0, 41);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 1, false, 4500, 0.055);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 1, false, 4500, 0.815);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, true, 4540, 1.000);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1, false, 4500, 0.107);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2, false, 4600, 317.800);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 2, false, 4600, 95.200);
INSERT INTO public.planet VALUES (7, 'Mirach b', 2, 3, false, 3300, 14.000);
INSERT INTO public.planet VALUES (8, 'Mirach c', 2, 2, false, 3300, 220.000);
INSERT INTO public.planet VALUES (9, 'Triangulum I', 3, 1, false, 5000, 0.900);
INSERT INTO public.planet VALUES (10, 'Triangulum II', 3, 3, false, 5000, 16.000);
INSERT INTO public.planet VALUES (11, 'Spica b', 4, 2, false, 12000, 250.000);
INSERT INTO public.planet VALUES (12, 'Pinwheel Prime', 6, 1, false, 4000, 1.200);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planet with a solid surface.', true, 1);
INSERT INTO public.planet_type VALUES (2, 'Gas giant', 'Large planet composed mainly of hydrogen and helium.', false, 80);
INSERT INTO public.planet_type VALUES (3, 'Ice giant', 'Planet rich in water, ammonia, and methane ices.', false, 15);
INSERT INTO public.planet_type VALUES (4, 'Dwarf planet', 'Small planetary body orbiting a star.', true, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1.000, 4600);
INSERT INTO public.star VALUES (2, 'Mirach', 2, 'M0III', 3.500, 3300);
INSERT INTO public.star VALUES (3, 'HD 105', 3, 'G0V', 1.100, 5000);
INSERT INTO public.star VALUES (4, 'Spica', 4, 'B1III', 11.400, 12000);
INSERT INTO public.star VALUES (5, 'M51-ULS-1', 5, 'B0', 20.000, 8000);
INSERT INTO public.star VALUES (6, 'NGC 5457-1', 6, 'F5V', 1.300, 4000);


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
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

