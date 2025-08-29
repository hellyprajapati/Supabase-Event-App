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
 ┣ 📜 supabase_event_schema.sql   # Schema (tables + constraints)
 ┣ 📜 supabase_event_data.sql     # Sample data inserts
 ┣ 📊 er_diagram.png              # ER diagram (Users, Events, RSVPs)
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
---

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

# 🌐 Supabase Event App – Frontend

This is a Next.js + Supabase app that connects with the event management database.
It provides a minimal UI where:

 - 📅 Users can see all upcoming events

 - 🎟️ Users can RSVP (Yes / No / Maybe) to events

# 📌 Features

 - Fetch events from Supabase PostgreSQL

 - Display events in a clean UI

 - Allow users to RSVP with a simple form

 - Deployed on Vercel, connected to Supabase

# 🛠️ Tech Stack

 - Next.js 14 (React framework)

 - Supabase JS Client (database connection + auth)

 - TailwindCSS (styling)

 - Vercel (deployment)

# 📂 Project Structure
📦 frontend
 ┣ 📂 pages
 ┃ ┣ 📜 index.js         # Home page - list events
 ┃ ┣ 📜 rsvp.js          # RSVP page
 ┣ 📂 lib
 ┃ ┗ 📜 supabaseClient.js # Supabase connection
 ┣ 📜 package.json
 ┗ 📜 README.md

# ⚡ Setup Instructions
1. Clone Repository
git clone https://github.com/your-username/supabase-event-app.git
cd supabase-event-app/frontend

2. Install Dependencies
npm install

3. Configure Supabase

Create a .env.local file in the frontend/ folder:

NEXT_PUBLIC_SUPABASE_URL=your-supabase-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key

4. Run Locally
npm run dev


Visit 👉 http://localhost:3000

📊 Pages
🏠 / – Events List

Fetches events from events table

Displays event title, description, date, city

🎟️ /rsvp – RSVP Page

Dropdown to select event

Dropdown to select RSVP status (Yes / No / Maybe)

Stores response in rsvps table

# 🚀 Deployment
1. Push to GitHub
git add .
git commit -m "Frontend setup"
git push origin main

2. Deploy on Vercel

Go to Vercel

Import GitHub repo

Add environment variables (NEXT_PUBLIC_SUPABASE_URL, NEXT_PUBLIC_SUPABASE_ANON_KEY)

Deploy 🎉

📎 Deliverables

GitHub Repo → https://github.com/your-username/supabase-event-app

Live App on Vercel → https://supabase-event-app.vercel.app
