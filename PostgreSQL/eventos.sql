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

-- Table: public.Event
CREATE TABLE IF NOT EXISTS public."Event"
(
    -- Versions 13 of Postgres onwards (we are using version 17) have a function to get random uuids v4, 
    -- so there is no need for the uuid-ossp extension. Besides, trying to use the extension was causing problems
    -- (perhaps it couldn't get installed fast enough to be ready by the time this line was called)
	id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
	title varchar NOT NULL,
    description varchar,
    place varchar NOT NULL,
    -- coordinates point,
    starts_at timestamp without time zone,
    ends_at timestamp without time zone,
    capacity integer,
    user_creator_id uuid NOT NULL,
    group_creator_id uuid,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),
    deleted_at timestamp without time zone
);

COMMENT ON COLUMN public."Event".place
    IS 'Description about the place or reference to the place';

INSERT INTO public."Event" (
    title,
    description,
    place,
    -- coordinates,
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
('Fiesta de Verano', 'Una fiesta para celebrar el inicio del verano.', 'Playa Central', -- point(40.4168, -3.7038),
 TIMESTAMP '2025-07-01 18:00:00', TIMESTAMP '2025-07-01 23:59:00', 100, '8eb1d638-213f-4001-8298-7c377e0f4096', 'a6233a85-3ec4-4bc0-8296-aefaee3c5a93',
 TIMESTAMP '2025-06-01 12:00:00', TIMESTAMP '2025-06-01 12:00:00', NULL),

-- Evento 2
('Hackathon Tech', 'Evento para desarrolladores con premios y desafíos.', 'Campus Tecnológico', -- point(41.3879, 2.1699),
 TIMESTAMP '2025-08-10 09:00:00', TIMESTAMP '2025-08-11 18:00:00', 200, '442ca924-3b8d-4ed6-ae9b-794b79cd30e9', 'cebe1b81-ed77-428a-b6e2-7dd1b50e0c06',
 TIMESTAMP '2025-06-05 15:30:00', TIMESTAMP '2025-06-05 15:30:00', NULL),

-- Evento 3
('Conferencia de Salud', 'Charlas sobre salud mental y bienestar.', 'Auditorio Sur', -- point(40.7128, -74.0060),
 TIMESTAMP '2025-09-15 10:00:00', TIMESTAMP '2025-09-15 17:00:00', 150, 'd00984bd-da8b-4849-a2e3-287d53d3acfc', NULL,
 TIMESTAMP '2025-06-10 09:00:00', TIMESTAMP '2025-06-10 09:00:00', NULL),

-- Evento 4
('Taller de Fotografía', 'Aprende técnicas fotográficas en exteriores.', 'Parque Nacional', -- point(48.8566, 2.3522),
 TIMESTAMP '2025-07-20 14:00:00', TIMESTAMP '2025-07-20 19:00:00', 50, '8eb1d638-213f-4001-8298-7c377e0f4096', NULL,
 TIMESTAMP '2025-06-15 11:45:00', TIMESTAMP '2025-06-15 11:45:00', NULL),

-- Evento 5
('Concierto Acústico', 'Música en vivo en un ambiente íntimo.', 'Sala Indie', -- point(37.7749, -122.4194),
 TIMESTAMP '2025-10-05 20:00:00', TIMESTAMP '2025-10-05 23:00:00', 80, '8734eb4f-c53d-4b0f-a792-300d3aabbbc4', 'b2021edd-8039-40cc-aad7-0291da58fa85',
 TIMESTAMP '2025-06-17 08:30:00', TIMESTAMP '2025-06-17 08:30:00', NULL);
