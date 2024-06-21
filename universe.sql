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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(40) NOT NULL,
    area_sqdeg numeric(7,3),
    rank_by_area integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    distance_from_earth_mpc numeric(5,4),
    distance_from_earth_rank integer,
    magnitude_bigm numeric(4,2)
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
    name character varying(30) NOT NULL,
    planet_id integer,
    orbital_period_days numeric(7,2),
    retrograde boolean
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
    name character varying(30) NOT NULL,
    star_id integer,
    num_moons integer,
    distance_from_sun_biggkm numeric(8,4),
    dwarf boolean
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    distance_from_sun_ly numeric(4,1),
    spectral_type text,
    northern_celestial_hemisphere boolean
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Hydra', 1302.844, 1);
INSERT INTO public.constellation VALUES (2, 'Virgo', 1294.428, 2);
INSERT INTO public.constellation VALUES (3, 'Ursa Major', 1279.660, 3);
INSERT INTO public.constellation VALUES (4, 'Cetus', 1231.411, 4);
INSERT INTO public.constellation VALUES (5, 'Hercules', 1225.148, 5);
INSERT INTO public.constellation VALUES (6, 'Eridanus', 1137.919, 6);
INSERT INTO public.constellation VALUES (7, 'Pegasus', 1120.794, 7);
INSERT INTO public.constellation VALUES (8, 'Draco', 1082.952, 8);
INSERT INTO public.constellation VALUES (9, 'Centaurus', 1060.422, 9);
INSERT INTO public.constellation VALUES (10, 'Aquarius', 979.854, 10);
INSERT INTO public.constellation VALUES (11, 'Ophiuchus', 948.340, 11);
INSERT INTO public.constellation VALUES (12, 'Leo', 946.964, 12);
INSERT INTO public.constellation VALUES (13, 'Boötes', 906.831, 13);
INSERT INTO public.constellation VALUES (14, 'Pisces', 889.417, 14);
INSERT INTO public.constellation VALUES (15, 'Sagittarius', 867.432, 15);
INSERT INTO public.constellation VALUES (16, 'Cygnus', 803.983, 16);
INSERT INTO public.constellation VALUES (17, 'Taurus', 797.249, 17);
INSERT INTO public.constellation VALUES (18, 'Camelopardalis', 756.828, 18);
INSERT INTO public.constellation VALUES (19, 'Andromeda', 722.278, 19);
INSERT INTO public.constellation VALUES (20, 'Puppis', 673.434, 20);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.0080, NULL, -20.80);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 0.0080, 1, -14.50);
INSERT INTO public.galaxy VALUES (3, 'Draco II', 0.0215, 2, -0.80);
INSERT INTO public.galaxy VALUES (4, 'Tucana III', 0.0229, 3, -1.30);
INSERT INTO public.galaxy VALUES (5, 'Segue 1', 0.0230, 4, -3.00);
INSERT INTO public.galaxy VALUES (6, 'Sagittarius Dwarf', 0.0240, 5, -12.67);
INSERT INTO public.galaxy VALUES (7, 'Hydrus I', 0.0276, 6, -4.71);
INSERT INTO public.galaxy VALUES (8, 'Carina III', 0.0278, 7, -2.40);
INSERT INTO public.galaxy VALUES (9, 'Ursa Major II Dwarf', 0.0300, 8, -4.20);
INSERT INTO public.galaxy VALUES (10, 'Triangulum II', 0.0300, 8, -1.80);
INSERT INTO public.galaxy VALUES (11, 'Reticulum II', 0.0314, 10, -3.10);
INSERT INTO public.galaxy VALUES (12, 'Segue 2', 0.0350, 11, -2.50);
INSERT INTO public.galaxy VALUES (13, 'Carina II', 0.0374, 12, -4.50);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 27.32, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.32, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1.26, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1.77, false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3.55, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 7.16, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 16.69, false);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 0.50, false);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 250.56, false);
INSERT INTO public.moon VALUES (10, 'Elara', 5, 259.64, false);
INSERT INTO public.moon VALUES (11, 'Vanth', 11, 9.54, false);
INSERT INTO public.moon VALUES (12, 'Charon', 10, 6.39, false);
INSERT INTO public.moon VALUES (13, 'Nix', 10, 24.85, false);
INSERT INTO public.moon VALUES (14, 'Hydra', 10, 38.20, false);
INSERT INTO public.moon VALUES (15, 'Kerberos', 10, 32.17, false);
INSERT INTO public.moon VALUES (16, 'Styx', 10, 20.16, false);
INSERT INTO public.moon VALUES (17, 'Weywot', 12, 12.44, false);
INSERT INTO public.moon VALUES (18, 'Dysnomia', 16, 15.79, false);
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 2.52, false);
INSERT INTO public.moon VALUES (20, 'Umbriel', 7, 4.14, false);
INSERT INTO public.moon VALUES (21, 'Titania', 7, 8.71, false);
INSERT INTO public.moon VALUES (22, 'Oberon', 7, 13.46, false);
INSERT INTO public.moon VALUES (23, 'Miranda', 7, 1.41, false);
INSERT INTO public.moon VALUES (24, 'Cordelia', 7, 0.34, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0, 0.0572, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0, 0.1081, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 0.1500, false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 2, 0.1425, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 95, 0.2290, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 146, 1.4200, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 28, 2.9000, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 16, 4.3500, false);
INSERT INTO public.planet VALUES (9, 'Ceres', 1, 0, 0.7240, true);
INSERT INTO public.planet VALUES (10, 'Pluto', 1, 5, 4.8000, true);
INSERT INTO public.planet VALUES (11, 'Orcus', 1, 1, 5.8600, true);
INSERT INTO public.planet VALUES (12, 'Quaoar', 1, 1, 6.5000, true);
INSERT INTO public.planet VALUES (13, 'Makemake', 1, 1, 7.9000, true);
INSERT INTO public.planet VALUES (14, 'Haumea', 1, 2, 8.8200, true);
INSERT INTO public.planet VALUES (15, 'Gonggong', 1, 1, 10.0000, true);
INSERT INTO public.planet VALUES (16, 'Eris', 1, 1, 14.5000, true);
INSERT INTO public.planet VALUES (17, 'Sedna', 1, 0, 135.0000, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 0.0, 'G2 V', NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 8.6, 'A0mA1 Va, DA2', false);
INSERT INTO public.star VALUES (3, 'Canopus', 1, 310.0, 'A9 II', false);
INSERT INTO public.star VALUES (4, 'Rigil Kentaurus & Toliman', 1, 4.3, 'G2 V, K1 V', false);
INSERT INTO public.star VALUES (5, 'Arcturus', 1, 37.0, 'K0 III', true);
INSERT INTO public.star VALUES (6, 'Vega', 1, 25.0, 'A0 Va', true);
INSERT INTO public.star VALUES (7, 'Capella', 1, 43.0, 'K0 III, G1 III', true);
INSERT INTO public.star VALUES (8, 'Rigel', 1, 860.0, 'B8 Ia', false);
INSERT INTO public.star VALUES (9, 'Procyon', 1, 11.0, 'F5 IV-V', true);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 20, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 13, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

