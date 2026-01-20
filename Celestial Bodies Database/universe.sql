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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(20) NOT NULL,
    discovery_year integer NOT NULL,
    description text,
    galaxy_id integer,
    is_active boolean NOT NULL
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(20) NOT NULL,
    description text,
    distance_from_earth numeric(12,2) NOT NULL
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
    name character varying(20) NOT NULL,
    radius numeric(10,2),
    description text,
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
    name character varying(30) NOT NULL,
    planet_type character varying(20) NOT NULL,
    has_life boolean NOT NULL,
    description text,
    star_id integer
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
    solar_mass numeric(10,2),
    age_millions_years integer,
    galaxy_id integer NOT NULL
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 1974, 'Supermassive black hole at the center of the Milky Way', 1, true);
INSERT INTO public.black_hole VALUES (2, 'M87*', 2019, 'First black hole ever imaged', 6, true);
INSERT INTO public.black_hole VALUES (3, 'Cygnus X-1', 1964, 'Stellar-mass black hole in a binary system', 1, true);
INSERT INTO public.black_hole VALUES (4, 'V404 Cygni', 1989, 'Black hole binary system', 1, true);
INSERT INTO public.black_hole VALUES (5, 'LMC X-1', 1971, 'Black hole located in the Large Magellanic Cloud', 7, true);
INSERT INTO public.black_hole VALUES (6, 'LMC X-3', 1983, 'X-ray binary black hole', 7, true);
INSERT INTO public.black_hole VALUES (7, 'NGC 1277 BH', 2012, 'Extremely massive black hole', 11, true);
INSERT INTO public.black_hole VALUES (8, 'Holmberg 15A BH', 2011, 'One of the most massive black holes known', 11, true);
INSERT INTO public.black_hole VALUES (9, 'TON 618', 1957, 'Ultramassive black hole', 11, true);
INSERT INTO public.black_hole VALUES (10, 'IC 1101 BH', 2015, 'Central black hole of IC 1101', 11, true);
INSERT INTO public.black_hole VALUES (11, 'NGC 4889 BH', 2011, 'Supermassive black hole in Coma Cluster', 11, true);
INSERT INTO public.black_hole VALUES (12, 'NGC 1600 BH', 2016, 'Massive nearby black hole', 11, true);
INSERT INTO public.black_hole VALUES (13, 'Abell 1201 BH', 2020, 'Detected via gravitational lensing', 11, false);
INSERT INTO public.black_hole VALUES (14, 'ESO 243-49 HLX-1', 2009, 'Intermediate-mass black hole candidate', 18, true);
INSERT INTO public.black_hole VALUES (15, 'M32 BH', 2000, 'Central black hole of M32 galaxy', 2, true);
INSERT INTO public.black_hole VALUES (16, 'NGC 4395 BH', 2005, 'Low-mass active black hole', 1, true);
INSERT INTO public.black_hole VALUES (17, 'NGC 404 BH', 2010, 'Low-activity black hole', 1, false);
INSERT INTO public.black_hole VALUES (18, 'NGC 6240 BH1', 2014, 'One of two merging black holes', 15, true);
INSERT INTO public.black_hole VALUES (19, 'NGC 6240 BH2', 2014, 'Second merging black hole', 15, true);
INSERT INTO public.black_hole VALUES (20, 'Centaurus A BH', 2001, 'Active black hole in Centaurus A', 9, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our home galaxy', 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Nearest large spiral galaxy', 2537000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Member of the Local Group', 3000000.00);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 'Galaxy with well-defined spiral arms', 23000000.00);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 'Galaxy with a large central bulge', 29000000.00);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 'Galaxy containing a supermassive black hole', 53000000.00);
INSERT INTO public.galaxy VALUES (7, 'Large Magellanic Cloud', 'Irregular', 'Satellite galaxy of the Milky Way', 163000.00);
INSERT INTO public.galaxy VALUES (8, 'Small Magellanic Cloud', 'Irregular', 'Nearby dwarf galaxy', 200000.00);
INSERT INTO public.galaxy VALUES (9, 'Centaurus A', 'Elliptical', 'Strong radio galaxy', 13000000.00);
INSERT INTO public.galaxy VALUES (10, 'Pinwheel', 'Spiral', 'Large face-on spiral galaxy', 21000000.00);
INSERT INTO public.galaxy VALUES (11, 'IC 1101', 'Elliptical', 'One of the largest known galaxies', 1040000000.00);
INSERT INTO public.galaxy VALUES (12, 'NGC 1300', 'Barred Spiral', 'Classic barred spiral galaxy', 61000000.00);
INSERT INTO public.galaxy VALUES (13, 'NGC 4414', 'Spiral', 'Flocculent spiral galaxy', 62000000.00);
INSERT INTO public.galaxy VALUES (14, 'Hoag Object', 'Ring', 'Nearly perfect ring galaxy', 600000000.00);
INSERT INTO public.galaxy VALUES (15, 'Tadpole', 'Spiral', 'Galaxy with a long tidal tail', 420000000.00);
INSERT INTO public.galaxy VALUES (16, 'Cartwheel', 'Ring', 'Galaxy formed by a collision', 500000000.00);
INSERT INTO public.galaxy VALUES (17, 'Sculptor', 'Spiral', 'Member of the Sculptor Group', 12000000.00);
INSERT INTO public.galaxy VALUES (18, 'NGC 6744', 'Spiral', 'Galaxy similar to the Milky Way', 30000000.00);
INSERT INTO public.galaxy VALUES (19, 'Messier 81', 'Spiral', 'Bright nearby spiral galaxy', 12000000.00);
INSERT INTO public.galaxy VALUES (20, 'Messier 82', 'Irregular', 'Starburst galaxy', 12000000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737.40, 'Natural satellite of Earth', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.10, 'Larger moon of Mars', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.20, 'Smaller moon of Mars', 4);
INSERT INTO public.moon VALUES (4, 'Io', 1821.60, 'Most volcanically active moon', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1560.80, 'Moon with subsurface ocean', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634.10, 'Largest moon in the solar system', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410.30, 'Heavily cratered icy moon', 5);
INSERT INTO public.moon VALUES (8, 'Titan', 2574.70, 'Moon with a dense atmosphere', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 252.10, 'Moon with ice geysers', 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 198.20, 'Moon with a large impact crater', 6);
INSERT INTO public.moon VALUES (11, 'Triton', 1353.40, 'Moon with retrograde orbit', 8);
INSERT INTO public.moon VALUES (12, 'Oberon', 761.40, 'Outer moon of Uranus', 7);
INSERT INTO public.moon VALUES (13, 'Titania', 788.90, 'Largest moon of Uranus', 7);
INSERT INTO public.moon VALUES (14, 'Miranda', 235.80, 'Moon with extreme terrain', 7);
INSERT INTO public.moon VALUES (15, 'Charon', 606.00, 'Largest moon of Pluto', 8);
INSERT INTO public.moon VALUES (16, 'Nix', 49.80, 'Small irregular moon', 8);
INSERT INTO public.moon VALUES (17, 'Hydra', 43.00, 'Outer moon of Pluto', 8);
INSERT INTO public.moon VALUES (18, 'Dione', 561.40, 'Icy moon of Saturn', 6);
INSERT INTO public.moon VALUES (19, 'Rhea', 763.80, 'Second-largest moon of Saturn', 6);
INSERT INTO public.moon VALUES (20, 'Iapetus', 734.50, 'Moon with two-tone coloration', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', false, 'Closest planet to the Sun', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', false, 'Hottest planet in the solar system', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', true, 'Only known planet with life', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', false, 'Known as the Red Planet', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', false, 'Largest planet in the solar system', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', false, 'Famous for its ring system', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', false, 'Planet with an extreme axial tilt', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', false, 'Planet with the strongest winds', 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Terrestrial', false, 'Closest known exoplanet', 2);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 'Super-Earth', false, 'Earth-like exoplanet candidate', 3);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'Gas Giant', false, 'Hot Jupiter exoplanet', 3);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 'Terrestrial', false, 'Located in the habitable zone', 4);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1e', 'Terrestrial', false, 'Potentially supports liquid water', 4);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1f', 'Terrestrial', false, 'Rocky exoplanet', 4);
INSERT INTO public.planet VALUES (15, 'Gliese 581g', 'Super-Earth', false, 'Habitable zone candidate', 5);
INSERT INTO public.planet VALUES (16, 'Kepler-22b', 'Super-Earth', false, 'Exoplanet in habitable zone', 6);
INSERT INTO public.planet VALUES (17, 'Kepler-69c', 'Super-Earth', false, 'Possible atmosphere detected', 7);
INSERT INTO public.planet VALUES (18, 'Kepler-62f', 'Super-Earth', false, 'Cold rocky exoplanet', 8);
INSERT INTO public.planet VALUES (19, 'LHS 1140 b', 'Super-Earth', false, 'High-density rocky planet', 9);
INSERT INTO public.planet VALUES (20, 'Ross 128 b', 'Terrestrial', false, 'Nearby temperate exoplanet', 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.00, 4600, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 0.12, 4500, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 2.02, 300, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 11.60, 8000, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 21.00, 8000, 1);
INSERT INTO public.star VALUES (6, 'Vega', 2.10, 455, 1);
INSERT INTO public.star VALUES (7, 'Alpha Centauri A', 1.10, 5000, 1);
INSERT INTO public.star VALUES (8, 'Alpha Centauri B', 0.91, 5000, 1);
INSERT INTO public.star VALUES (9, 'Barnards Star', 0.14, 10000, 1);
INSERT INTO public.star VALUES (10, 'Wolf 359', 0.09, 8000, 1);
INSERT INTO public.star VALUES (11, 'UY Scuti', 7.00, 9000, 1);
INSERT INTO public.star VALUES (12, 'Polaris', 5.40, 70, 1);
INSERT INTO public.star VALUES (13, 'Deneb', 19.00, 10000, 1);
INSERT INTO public.star VALUES (14, 'Altair', 1.79, 1200, 1);
INSERT INTO public.star VALUES (15, 'Fomalhaut', 1.92, 440, 1);
INSERT INTO public.star VALUES (16, 'Arcturus', 1.08, 7100, 1);
INSERT INTO public.star VALUES (17, 'Spica', 10.25, 12, 1);
INSERT INTO public.star VALUES (18, 'Antares', 12.40, 11000, 1);
INSERT INTO public.star VALUES (19, 'Canopus', 8.00, 25, 1);
INSERT INTO public.star VALUES (20, 'Aldebaran', 1.16, 6500, 1);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 20, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_id_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_id_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

