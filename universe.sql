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
    name character varying NOT NULL,
    brightest_star character varying,
    symbolism character varying,
    ra character varying,
    "dec" character varying,
    observed boolean,
    observation_desc text
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
    name character varying NOT NULL,
    vmag numeric,
    constellation character varying,
    messier_id character varying,
    ngc_id integer,
    observed boolean,
    observation_desc text,
    galaxy_type_id integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer[]
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    discovery_year character varying,
    observed boolean,
    observation_desc text
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
    num_of_moons integer,
    rings boolean,
    dwarf boolean,
    mean_temperature integer,
    atmosphere_composition character varying,
    distance_from_sun numeric,
    observed boolean,
    observation_desc text
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
    name character varying NOT NULL,
    vmag numeric,
    spectral_type character varying,
    distance_from_sun numeric,
    ra character varying,
    "dec" character varying,
    observed boolean,
    observation_desc text,
    galaxy_id integer
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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

INSERT INTO public.constellation VALUES (1, 'Canis Major', 'Sirius A', 'the greater dog', '06h 12.5m to 07h 27.5m', '−11.03° to −33.25°', false, '');
INSERT INTO public.constellation VALUES (2, 'Carina', 'Canopus', 'the keel', '06h 02m 59.7365s–11h 20m 37.4211s', '−50.7545471° to −75.6840134°', false, '');
INSERT INTO public.constellation VALUES (3, 'Boötes', 'Arcturus', 'the herdsman', '13h 36.1m to 15h 49.3m', '+7.36° to +55.1°', false, '');
INSERT INTO public.constellation VALUES (4, 'Centaurus', 'Alpha Centauri', 'the centaur', '11h 05m 20.9415s–15h 03m 11.1071s', '−29.9948788°–−64.6957885°', false, '');
INSERT INTO public.constellation VALUES (5, 'Lyra', 'Vega', 'lyre, harp', '18h 14m to 19h 28m ', '25.66° to 47.71°', false, '');
INSERT INTO public.constellation VALUES (6, 'Auriga', 'Capella', 'the charioteer', '04h 37m 54.4293s–07h 30m 56.1899s', '56.1648331°–27.8913116°', false, '');
INSERT INTO public.constellation VALUES (7, 'Orion', 'Rigel', 'Orion, the hunter', '5h', '+5°', false, '');
INSERT INTO public.constellation VALUES (8, 'Canis Minor', 'Procyon', 'the lesser dog', '07h 06.4m to 08h 11.4m', '13.22° to −0.36°', false, '');
INSERT INTO public.constellation VALUES (9, 'Aquila', 'Altair', 'the eagle', '18h 41m 18.2958s–20h 38m 23.7231s', '18.6882229°–−11.8664360°', false, '');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', -6.5, 'Sagittarius', '', NULL, false, '', NULL);
INSERT INTO public.galaxy VALUES (2, 'Large Megellanic Cloud', 0.9, 'Dorado/Mensa', '', NULL, false, '', NULL);
INSERT INTO public.galaxy VALUES (3, 'Small Megellanic Cloud', 2.7, 'Tucana', '', 292, false, '', NULL);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 3.4, 'Andromeda', 'M31', 224, false, '', NULL);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 5.7, 'Triangulum', 'M33', 598, false, '', NULL);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 6.84, 'Centaurus', '', 5128, false, '', NULL);
INSERT INTO public.galaxy VALUES (7, 'Bode’s', 6.94, 'Ursa Major', 'M81', 3031, false, '', NULL);
INSERT INTO public.galaxy VALUES (8, 'Sculptor', 8, 'Sculptor', '', 253, false, '', NULL);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'spiral', NULL);
INSERT INTO public.galaxy_type VALUES (2, 'elliptical', NULL);
INSERT INTO public.galaxy_type VALUES (3, 'lenticular', NULL);
INSERT INTO public.galaxy_type VALUES (4, 'irregular', NULL);
INSERT INTO public.galaxy_type VALUES (5, 'active', NULL);
INSERT INTO public.galaxy_type VALUES (6, 'seyfert', NULL);
INSERT INTO public.galaxy_type VALUES (7, 'quasars', NULL);
INSERT INTO public.galaxy_type VALUES (8, 'blazars', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 3, 'prehistoric', false, '');
INSERT INTO public.moon VALUES (2, 'io', 5, '1610', false, '');
INSERT INTO public.moon VALUES (3, 'europa', 5, '1610', false, '');
INSERT INTO public.moon VALUES (4, 'ganymede', 5, '1610', false, '');
INSERT INTO public.moon VALUES (5, 'callisto', 5, '1610', false, '');
INSERT INTO public.moon VALUES (6, 'mimas', 6, '1789', false, '');
INSERT INTO public.moon VALUES (7, 'enceladus', 6, '1789', false, '');
INSERT INTO public.moon VALUES (8, 'tethys', 6, '1684', false, '');
INSERT INTO public.moon VALUES (9, 'dione', 6, '1684', false, '');
INSERT INTO public.moon VALUES (10, 'rhea', 6, '1672', false, '');
INSERT INTO public.moon VALUES (11, 'titan', 6, '1655', false, '');
INSERT INTO public.moon VALUES (12, 'iapetus', 6, '1671', false, '');
INSERT INTO public.moon VALUES (13, 'methone', 6, '2004', false, '');
INSERT INTO public.moon VALUES (14, 'pallene', 6, '2004', false, '');
INSERT INTO public.moon VALUES (15, 'aegaeon', 6, '2009', false, '');
INSERT INTO public.moon VALUES (16, 'miranda', 7, '1948', false, '');
INSERT INTO public.moon VALUES (17, 'ariel', 7, '1851', false, '');
INSERT INTO public.moon VALUES (18, 'umbriel', 7, '1851', false, '');
INSERT INTO public.moon VALUES (19, 'titania', 7, '1787', false, '');
INSERT INTO public.moon VALUES (20, 'oberon', 7, '1787', false, '');
INSERT INTO public.moon VALUES (21, 'triton', 8, '1846', false, '');
INSERT INTO public.moon VALUES (22, 'charon', 10, '1978', false, '');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', 1, 0, false, false, 440, 'He, Na+, K+', 57909175, false, '');
INSERT INTO public.planet VALUES (2, 'venus', 1, 0, false, false, 730, 'Co2, N2, SO2', 108208930, false, '');
INSERT INTO public.planet VALUES (3, 'earth', 1, 1, false, false, 287, 'N2, O2, Ar, CO2', 149597890, false, '');
INSERT INTO public.planet VALUES (4, 'mars', 1, 2, false, false, 227, 'CO2, N2, Ar', 227936640, false, '');
INSERT INTO public.planet VALUES (5, 'jupiter', 1, 95, true, false, 152, 'H2, He', 778412010, false, '');
INSERT INTO public.planet VALUES (6, 'saturn', 1, 146, true, false, 134, 'H2, He', 1426725400, false, '');
INSERT INTO public.planet VALUES (7, 'uranus', 1, 28, true, false, 76, 'H2, He, CH4', 2870972200, false, '');
INSERT INTO public.planet VALUES (8, 'neptune', 1, 16, true, false, 73, 'H2, He, CH4', 4498252900, false, '');
INSERT INTO public.planet VALUES (9, 'ceres', 1, 0, false, true, 167, 'H2O', 413700000, false, '');
INSERT INTO public.planet VALUES (10, 'pluto', 1, 5, false, true, 40, 'N2, CH4, CO', 5906380000, false, '');
INSERT INTO public.planet VALUES (11, 'haumea', 1, 2, true, true, 50, 'unknown', 6484000000, false, '');
INSERT INTO public.planet VALUES (12, 'makemake', 1, 1, NULL, true, 30, 'N2, CH4', 6850000000, false, '');
INSERT INTO public.planet VALUES (13, 'eris', 1, 1, NULL, true, 30, 'N2, CH4', 10210000000, false, '');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sirius', -1.46, 'Main Sequence, A0', 8.6, '06h 45m 08.917s', '−16° 42′ 58.02″', false, '', 1);
INSERT INTO public.star VALUES (1, 'Sun', -26.74, 'Main Sequence, G2', 0, '286.13° (286° 7′ 48″)', '+63.87° (63° 52′ 12"N)', false, '', 1);
INSERT INTO public.star VALUES (3, 'Canopus', -0.74, 'Giant, A9', 310, '06h 23m 57.10988s', '−52° 41′ 44.3810″', false, '', 1);
INSERT INTO public.star VALUES (4, 'Arcturus', -0.05, 'Red Giant, K1', 37, '14h 15m 39.7s', '+19° 10′ 56″', false, '', 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 0.01, 'Main Sequence, A0', 4.34, '14h 39m 36.49400s', '−60° 50′ 02.3737″', false, '', 1);
INSERT INTO public.star VALUES (6, 'Vega', 0.03, 'Main Sequence, A0', 25, '18h 36m 56.33635s', '+38° 47′ 01.2802″', false, '', 1);
INSERT INTO public.star VALUES (7, 'Capella', 0.08, 'Giant, G3', 43, '05h 16m 41.35871s', '+45° 59′ 52.7693″', false, '', 1);
INSERT INTO public.star VALUES (8, 'Rigel', 0.13, 'Blue Supergiant, B8', 860, '05h 14m 32.27210s', '−08° 12′ 05.8981″', false, '', 1);
INSERT INTO public.star VALUES (9, 'Procyon', 0.37, 'Main Sequence, F5', 11, '07h 39m 18.11950s', '+05° 13′ 29.9552″', false, '', 1);
INSERT INTO public.star VALUES (10, 'Betelgeuse', 0.5, 'Red Supergiant, M1', 640, '05h 55m 10.30536s', '+07° 24′ 25.4304″', false, '', 1);
INSERT INTO public.star VALUES (11, 'Altair', 0.76, 'Main Sequence, A7', 17, '19h 50m 46.99855s', '+08° 52′ 05.9563″', false, '', 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy galaxy_type_rel; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_rel FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: moon planet_id_rel; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id_rel FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet star_rel; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_rel FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

