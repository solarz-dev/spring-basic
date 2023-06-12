ALTER TABLE IF EXISTS public.endereco
    ADD COLUMN IF NOT EXISTS complemento character varying(255);