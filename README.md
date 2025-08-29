# 🎉 Supabase Event App

A simple event management database where:

 - Users can register

 - Users can create events

 - Users can RSVP to events (Yes / No / Maybe)

Built with PostgreSQL / Supabase as backend.

---

# 📌 Features

👤 Users table → stores registered users.

🎟️ Events table → stores events created by users.

✅ RSVPs table → stores RSVP responses (Yes / No / Maybe).

🔗 Proper primary keys, foreign keys, and constraints.

🗑️ Cascade deletes → deleting a user or event also deletes related RSVPs.

📊 Sample data included: 10 users, 5 events, 20 RSVPs.

<img width="840" height="588" alt="Image" src="https://github.com/user-attachments/assets/edc8b8a7-0672-4b2f-8952-ad81ac56db3f" />

---

# 📂 Project Structure

📦 supabase-event-app
 ┣ 📜 supabase_event_schema.sql   # Schema (tables + constraints) <br>
 ┣ 📜 supabase_event_data.sql     # Sample data inserts <br>
 ┣ 📊 er_diagram.png              # ER diagram (Users, Events, RSVPs) <br>
 ┗ 📜 README.md                   # Documentation

---

# 🛠️ Setup Instructions

1. Create Database (Optional)
CREATE DATABASE event_app;
\c event_app;

2. Import Schema
\i supabase_event_schema.sql;

3. Insert Sample Data
\i supabase_event_data.sql;

---

# 🔎 Test Queries
1. Show all users
SELECT * FROM users;

2. Show all events
SELECT * FROM events;

3. Show all RSVPs
SELECT * FROM rsvps;

4. Join → Show RSVPs with user + event
SELECT u.name AS user_name, e.title AS event_title, r.status
FROM rsvps r
JOIN users u ON r.user_id = u.id
JOIN events e ON r.event_id = e.id
ORDER BY e.date, u.name;

5. Count RSVPs per event
SELECT e.title, r.status, COUNT(*) AS total
FROM rsvps r
JOIN events e ON r.event_id = e.id
GROUP BY e.title, r.status
ORDER BY e.title;

---

# 📊 ER Diagram

<img width="2018" height="1472" alt="Image" src="https://github.com/user-attachments/assets/632f1545-dc09-4e98-8bb1-747e380f54d7" />


# 🧹 Cascade Delete Example

Delete a user → their RSVPs also deleted:

DELETE FROM users WHERE name = 'Bob Smith';


Delete an event → its RSVPs also deleted:

DELETE FROM events WHERE title = 'Tech Conference 2025';

---

# 🚀 Next Steps (Bonus)

Build a Next.js app with Supabase:

Page 1 → List all upcoming events

Page 2 → RSVP to events (Yes/No/Maybe)

Deploy on Vercel and connect to Supabase backend.

---

# Thank you for visit! 
