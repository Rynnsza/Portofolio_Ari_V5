-- Hapus tabel lama (opsional, hati-hati jika ada data penting)
-- DROP TABLE IF EXISTS public.portfolio_comments;

-- 1. Buat tabel portfolio_comments
CREATE TABLE IF NOT EXISTS public.portfolio_comments (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    content TEXT NOT NULL,
    user_name VARCHAR(15) NOT NULL,
    profile_image TEXT,
    is_pinned BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Aktifkan RLS
ALTER TABLE public.portfolio_comments ENABLE ROW LEVEL SECURITY;

-- 3. Hapus policy lama jika ada untuk menghindari konflik
DROP POLICY IF EXISTS "Enable read access for all users" ON public.portfolio_comments;
DROP POLICY IF EXISTS "Enable insert access for all users" ON public.portfolio_comments;

-- 4. Buat Policy: Izinkan semua orang (publik) untuk MEMBACA (SELECT) komentar
CREATE POLICY "Enable read access for all users"
ON public.portfolio_comments
FOR SELECT
USING (true);

-- 5. Buat Policy: Izinkan semua orang (publik) untuk MENAMBAH (INSERT) komentar
CREATE POLICY "Enable insert access for all users"
ON public.portfolio_comments
FOR INSERT
WITH CHECK (true);
