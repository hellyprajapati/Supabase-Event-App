-- Sample Data Inserts

-- Users
insert into users (id, name, email) values
(gen_random_uuid(), 'Alice Johnson', 'alice@example.com'),
(gen_random_uuid(), 'Bob Smith', 'bob@example.com'),
(gen_random_uuid(), 'Charlie Brown', 'charlie@example.com'),
(gen_random_uuid(), 'Diana Prince', 'diana@example.com'),
(gen_random_uuid(), 'Ethan Hunt', 'ethan@example.com'),
(gen_random_uuid(), 'Fiona Gallagher', 'fiona@example.com'),
(gen_random_uuid(), 'George Miller', 'george@example.com'),
(gen_random_uuid(), 'Hannah Lee', 'hannah@example.com'),
(gen_random_uuid(), 'Ian Curtis', 'ian@example.com'),
(gen_random_uuid(), 'Jenna Davis', 'jenna@example.com');

-- Events
insert into events (id, title, description, date, city, created_by) values
(gen_random_uuid(), 'Tech Meetup', 'A meetup for tech enthusiasts.', '2025-09-01', 'New York', (select id from users where email='alice@example.com')),
(gen_random_uuid(), 'Music Festival', 'Live music by local bands.', '2025-09-10', 'Los Angeles', (select id from users where email='bob@example.com')),
(gen_random_uuid(), 'Startup Pitch', 'Entrepreneurs pitch their ideas.', '2025-09-15', 'San Francisco', (select id from users where email='charlie@example.com')),
(gen_random_uuid(), 'Art Exhibition', 'Modern art gallery exhibition.', '2025-09-20', 'Chicago', (select id from users where email='diana@example.com')),
(gen_random_uuid(), 'Food Fair', 'Local food tasting and market.', '2025-09-25', 'Austin', (select id from users where email='ethan@example.com'));

-- RSVPs (20 random entries)
insert into rsvps (user_id, event_id, status)
select u.id, e.id, status
from (select id from users limit 10) u
cross join (select id from events limit 5) e
join lateral (values ('Yes'), ('No'), ('Maybe')) v(status) on true
where random() < 0.2
limit 20;
