--Configuracion de la DB

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

-- UUID personalizado
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';

-- Table: public.Event

-- DROP TABLE IF EXISTS public."Event";

CREATE TABLE IF NOT EXISTS public."Event"
(
	id SERIAL PRIMARY KEY,
	title character varying COLLATE pg_catalog."default",
    description character varying COLLATE pg_catalog."default",
    place character varying COLLATE pg_catalog."default",
    coordinates point,
    starts_at timestamp without time zone,
    ends_at timestamp without time zone,
    capacity integer,
    user_creator_id integer NOT NULL,
    group_creator_id integer,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),
    deleted_at timestamp without time zone
)
--CREATE TABLE public."Event" (
--  id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
--  title character varying,
--    description character varying,
--    place character varying,
--    coordinates point,
--    starts_at timestamp without time zone,
--    ends_at timestamp without time zone,
--    capacity integer,
--    user_creator_id uuid NOT NULL,
--    group_creator_id uuid,
--    created_at timestamp without time zone DEFAULT now() NOT NULL,
--    updated_at timestamp without time zone DEFAULT now() NOT NULL,
--    deleted_at timestamp without time zone
--);

TABLESPACE pg_default;

COMMENT ON COLUMN public."Event".place
    IS 'Description about the place or reference to the place';

INSERT INTO public."Event" (
    title,
    description,
    place,
    coordinates,
    starts_at,
    ends_at,
    capacity,
    user_creator_id,
    group_creator_id,
    created_at,
    updated_at,
    deleted_at
) VALUES
-- Evento 1
('Fiesta de Verano', 'Una fiesta para celebrar el inicio del verano.', 'Playa Central', point(40.4168, -3.7038),
 TIMESTAMP '2025-07-01 18:00:00', TIMESTAMP '2025-07-01 23:59:00', 100, 1, 10,
 TIMESTAMP '2025-06-01 12:00:00', TIMESTAMP '2025-06-01 12:00:00', NULL),

-- Evento 2
('Hackathon Tech', 'Evento para desarrolladores con premios y desafíos.', 'Campus Tecnológico', point(41.3879, 2.1699),
 TIMESTAMP '2025-08-10 09:00:00', TIMESTAMP '2025-08-11 18:00:00', 200, 2, 20,
 TIMESTAMP '2025-06-05 15:30:00', TIMESTAMP '2025-06-05 15:30:00', NULL),

-- Evento 3
('Conferencia de Salud', 'Charlas sobre salud mental y bienestar.', 'Auditorio Sur', point(40.7128, -74.0060),
 TIMESTAMP '2025-09-15 10:00:00', TIMESTAMP '2025-09-15 17:00:00', 150, 3, NULL,
 TIMESTAMP '2025-06-10 09:00:00', TIMESTAMP '2025-06-10 09:00:00', NULL),

-- Evento 4
('Taller de Fotografía', 'Aprende técnicas fotográficas en exteriores.', 'Parque Nacional', point(48.8566, 2.3522),
 TIMESTAMP '2025-07-20 14:00:00', TIMESTAMP '2025-07-20 19:00:00', 50, 1, NULL,
 TIMESTAMP '2025-06-15 11:45:00', TIMESTAMP '2025-06-15 11:45:00', NULL),

-- Evento 5
('Concierto Acústico', 'Música en vivo en un ambiente íntimo.', 'Sala Indie', point(37.7749, -122.4194),
 TIMESTAMP '2025-10-05 20:00:00', TIMESTAMP '2025-10-05 23:00:00', 80, 4, 30,
 TIMESTAMP '2025-06-17 08:30:00', TIMESTAMP '2025-06-17 08:30:00', NULL);
