-- Jalankan seluruh SQL ini di Supabase Dashboard > SQL Editor > New query.
-- Satu baris data untuk setiap user yang login. Row Level Security mencegah user
-- membaca atau mengubah jadwal/tugas milik user lain.
create table if not exists public.study_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  schedules jsonb not null default '[]'::jsonb,
  tasks jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now(),
  constraint schedules_is_array check (jsonb_typeof(schedules) = 'array'),
  constraint tasks_is_array check (jsonb_typeof(tasks) = 'array')
);

alter table public.study_data enable row level security;

drop policy if exists "Users can read own study data" on public.study_data;
create policy "Users can read own study data"
  on public.study_data for select to authenticated
  using (auth.uid() = user_id);

drop policy if exists "Users can insert own study data" on public.study_data;
create policy "Users can insert own study data"
  on public.study_data for insert to authenticated
  with check (auth.uid() = user_id);

drop policy if exists "Users can update own study data" on public.study_data;
create policy "Users can update own study data"
  on public.study_data for update to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

grant select, insert, update on public.study_data to authenticated;
