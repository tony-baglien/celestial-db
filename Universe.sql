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
-- Name: discoverer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.discoverer (
    discoverer_id integer NOT NULL,
    age_in_years integer,
    height_in_inches numeric,
    home_planet character varying(30),
    name character varying(30) NOT NULL
);


ALTER TABLE public.discoverer OWNER TO freecodecamp;

--
-- Name: discoverers_discoverer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.discoverers_discoverer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discoverers_discoverer_id_seq OWNER TO freecodecamp;

--
-- Name: discoverers_discoverer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.discoverers_discoverer_id_seq OWNED BY public.discoverer.discoverer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text NOT NULL,
    discovery_year integer NOT NULL,
    discoverer character varying(30)
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
    name character varying(30),
    description text NOT NULL,
    discovery_year integer NOT NULL,
    discoverer character varying(30),
    planet_id integer
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
    name character varying(30),
    description text NOT NULL,
    discovery_year integer NOT NULL,
    discoverer character varying(30),
    star_id integer,
    has_life boolean NOT NULL,
    has_freshwater boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planey_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planey_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planey_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    description text NOT NULL,
    discovery_year integer NOT NULL,
    discoverer character varying(30),
    galaxy_id integer,
    discoverer_id integer
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
-- Name: discoverer discoverer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer ALTER COLUMN discoverer_id SET DEFAULT nextval('public.discoverers_discoverer_id_seq'::regclass);


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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planey_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: discoverer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.discoverer VALUES (1, 72, 70.5, 'Earh', 'Sir Edmund Halbury');
INSERT INTO public.discoverer VALUES (2, 48, 65.3, 'Earth', 'Dr. Eliza Hartwell');
INSERT INTO public.discoverer VALUES (3, 56, 68.2, 'Earth', 'Prof. Kenju Takamura');
INSERT INTO public.discoverer VALUES (4, 63, 62.7, 'Earh', 'Henrietta Caldwell');
INSERT INTO public.discoverer VALUES (5, 50, 71.8, 'Mars', 'Dr. Nikolai Vespero');
INSERT INTO public.discoverer VALUES (6, NULL, NULL, 'Earth', 'Hubble Space Telescope Team');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andovian Spiral', 'Stunning Spiral Galaxy', 1892, 'Dr.Eliza Hartwell');
INSERT INTO public.galaxy VALUES (2, 'Vortax Nebulon', 'An irregular chaotic galaxy', 1978, 'Prof. Kenji Takamura');
INSERT INTO public.galaxy VALUES (3, 'Crimson Veil', 'A massive barred spiral galaxy', 2005, 'Astronomer Henrietta Caldwell');
INSERT INTO public.galaxy VALUES (4, 'Celestra Majoris', 'A dwarf elliptical galaxy', 1923, 'Hubble Space Telescope Team');
INSERT INTO public.galaxy VALUES (5, 'Xylarian Void Nexus', 'A rare lenticular galaxy', 1987, 'Dr.Amelia Corwin');
INSERT INTO public.galaxy VALUES (6, 'Lumora Cascade', 'A breathtaking ring galaxy', 1961, 'Dr. Nikolai Vespero');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lyrieth', 'A crater-filled moon', 1915, 'Dr. Eliza Hartwell', 3);
INSERT INTO public.moon VALUES (2, 'Drelos', 'A dark, rocky moon with iron-rich surface features.', 1926, 'Henrietta Caldwell', 5);
INSERT INTO public.moon VALUES (3, 'Carvenis', 'A volcanic moon with massive geysers ejecting water vapor.', 1984, 'Prof. Kenji Takamura', 8);
INSERT INTO public.moon VALUES (4, 'Tylora', 'A tidally locked moon covered with thick layers of methane ice.', 2007, 'Dr. Nikolai Vespero', 10);
INSERT INTO public.moon VALUES (5, 'Zanthor', 'A small, irregularly shaped moon with a dusty surface', 1973, 'Hubbe Space Telescope Team', 12);
INSERT INTO public.moon VALUES (6, 'Ascaris', 'A luminous moon reflecting high levels of light due to its icy composition.', 1903, 'Sir Edmund Halbury', 2);
INSERT INTO public.moon VALUES (7, 'Lamuneth', 'A dense moon with a silicate-rich crust and visible tectonic ridges', 1949, 'Prof. Kenji Takamura', 6);
INSERT INTO public.moon VALUES (8, 'Vorannis', 'A heavily cratered moon with a think exosphere', 1865, 'Henrietta Caldwell', 4);
INSERT INTO public.moon VALUES (9, 'Nyxara', 'A moon with large ice caps and faint auroras near its poles.', 1966, 'Dr. Eliza Hartwell', 7);
INSERT INTO public.moon VALUES (10, 'Orinthas', 'A gas-covered moon orbiting close to a gas giant, causing tidal heating.', 2020, 'Hubble Telescope Team', 9);
INSERT INTO public.moon VALUES (11, 'Pyralis', 'A volcanic moon with a glowing magma surface visible from orbit.', 1888, 'Sir Edmund Halbury', 11);
INSERT INTO public.moon VALUES (12, 'Selvaria', 'A medium-sized moon with rolling plains and ancient riverbeds', 1956, 'Dr. Nikolai Vespero', 1);
INSERT INTO public.moon VALUES (13, 'Venax', 'A barren moon with a dense network of ridges and valleys.', 1933, 'Prof. Kenji Takamura', 8);
INSERT INTO public.moon VALUES (14, 'Crythos', 'An icy moon with towering crystalline formations on its surface.', 2005, 'Hubble Space Telescope Team', 3);
INSERT INTO public.moon VALUES (15, 'Fariona', 'A dense moon with reflective mineral deposits scattered across its terrain.', 1897, 'Hennrietta Caldwell', 5);
INSERT INTO public.moon VALUES (16, 'Alveris', 'A moon with alternating light and dark regions due to unique albedo patterns.', 1978, 'Dr. Eliza Hartwell', 2);
INSERT INTO public.moon VALUES (17, 'Grethar', 'A rocky, dimly lit moon in a synchronous orbit with its parent planet.', 1919, 'Prof. Kenji Takamura', 10);
INSERT INTO public.moon VALUES (18, 'Lysenth', 'A moon with intricate patterns of canyons etched by ancient flows.', 1938, 'Sir Edmund Halbury', 7);
INSERT INTO public.moon VALUES (19, 'Myrona', 'A frozen moon with a dense methane atmosphere and occasional surface storms', 1982, 'Dr. Nikolai Vespero', 6);
INSERT INTO public.moon VALUES (20, 'Sylora', 'A cratered moon with deposits of silicate minerals and an irregular shape.', 2003, 'Hubble Space Telescope Team', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 'Noventis Prime', 'A super-Earth with rocky terrain and active tectonics', 1964, 'Prof. Kenji Takamura', 1, false, true);
INSERT INTO public.planet VALUES (10, 'Krython IX', 'A frigid exoplanet with a carbon dioxide-rich atmosphere', 1874, 'Sir Edmund Halbury', 1, false, false);
INSERT INTO public.planet VALUES (11, 'Silvaris', 'A temperate planet with silver-hued vegetation', 2009, 'Dr. Nikolai Vespero', 1, true, true);
INSERT INTO public.planet VALUES (12, 'Obscura Minor', 'A dimly lit rogue planet drifting through interstellar space.', 2018, 'Hubble Space Telescope Team', 1, false, false);
INSERT INTO public.planet VALUES (4, 'Voltara III', 'A volcanic planet with an atmosphere of sulfur and methane', 1867, 'Sir Edmund Halbury', 2, false, false);
INSERT INTO public.planet VALUES (5, 'Cyanthos', 'A gas giant with vibrant blue storms', 1912, 'Henrietta Caldwell', 3, false, false);
INSERT INTO public.planet VALUES (1, 'Turalis Prime', 'A rockey planet with vast deserts and an arid atmosphere', 1901, 'Dr.Eliza Hartwell', 6, false, false);
INSERT INTO public.planet VALUES (2, 'Zenthara IV', 'A lush, Earth-like planet', 1985, 'Prof. Kenji Takamura', 6, true, true);
INSERT INTO public.planet VALUES (3, 'Aurion Delta', 'An icy world', 2022, 'Hubble Space Telescope Team', 6, false, true);
INSERT INTO public.planet VALUES (6, 'Miranthis', 'A tidally locked planet with one habitable twilight zone.', 1958, 'Dr. Nikolai Vespero', 5, true, false);
INSERT INTO public.planet VALUES (7, 'Corvenis Beta', 'A barren planet with massive networks.', 1923, 'Dr. Eliza Hartwell', 6, false, false);
INSERT INTO public.planet VALUES (8, 'Eryndor', 'A water-dominated planet with vast freswater seas.', 2015, 'Hubble Space Telescope Team', 5, true, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Ardentis Prime', 'A massive blue giant star', 1784, 'Sir Edmund Halbury', 1, NULL);
INSERT INTO public.star VALUES (2, 'Solvoria Minor', 'A small,dim red dwarf style', 1937, 'Dr. Eliza Hartwell', 3, NULL);
INSERT INTO public.star VALUES (3, 'Vegaustra', 'A luminous white star', 1899, 'Prof. Kenji Takamura', 2, NULL);
INSERT INTO public.star VALUES (4, 'Crimson Ember', 'A red supergiant', 1926, 'Hennrietta Caldwell', 2, NULL);
INSERT INTO public.star VALUES (5, 'Xylanthia Spark', 'A young T Tauri star', 1998, 'Hubble Space Telescope Team', 4, NULL);
INSERT INTO public.star VALUES (6, 'Polarisor Apex', 'A rare yellow hypergiant', 1984, 'Dr. Nikolai Vespero', 5, NULL);


--
-- Name: discoverers_discoverer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.discoverers_discoverer_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planey_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: discoverer discoverers_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT discoverers_name_key UNIQUE (name);


--
-- Name: discoverer discoverers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT discoverers_pkey PRIMARY KEY (discoverer_id);


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
-- Name: star star_discoverer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_discoverer_id_fkey FOREIGN KEY (discoverer_id) REFERENCES public.discoverer(discoverer_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

