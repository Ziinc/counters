-- This script was generated by the Schema Diff utility in pgAdmin 4
-- For the circular dependencies, the order in which Schema Diff writes the objects is not very sophisticated
-- and may require manual changes to the script to ensure changes are applied in the correct order.
-- Please report an issue for any failure with the reproduction steps.

CREATE TABLE IF NOT EXISTS public.counters
(
    id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    updated_at timestamp with time zone NOT NULL DEFAULT now(),
    name text COLLATE pg_catalog."default" NOT NULL,
    user_id uuid NOT NULL,
    CONSTRAINT counters_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.counters
    OWNER to postgres;

ALTER TABLE IF EXISTS public.counters
    ENABLE ROW LEVEL SECURITY;

GRANT ALL ON TABLE public.counters TO anon;

GRANT ALL ON TABLE public.counters TO authenticated;

GRANT ALL ON TABLE public.counters TO postgres;

GRANT ALL ON TABLE public.counters TO service_role;
CREATE POLICY "Enable crud for users based on user_id"
    ON public.counters
    AS PERMISSIVE
    FOR ALL
    TO public
    USING ((auth.uid() = user_id))
    WITH CHECK ((auth.uid() = user_id));
