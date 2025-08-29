-- Supabase Event App Schema

-- Drop tables if they exist (for recreation)
drop table if exists rsvps cascade;
drop table if exists events cascade;
drop table if exists users cascade;

-- Users Table
create table users (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    email text unique not null,
    created_at timestamp with time zone default now()
);

-- Events Table
create table events (
    id uuid primary key default gen_random_uuid(),
    title text not null,
    description text,
    date date not null,
    city text,
    created_by uuid references users(id) on delete set null
);

-- RSVPs Table
create table rsvps (
    id uuid primary key default gen_random_uuid(),
    user_id uuid references users(id) on delete cascade,
    event_id uuid references events(id) on delete cascade,
    status text check (status in ('Yes', 'No', 'Maybe')) not null,
    unique(user_id, event_id)
);
