# 📝 Django Todo App

A simple multi-user Todo application built using Django.

Each user can:
- Register and log in
- Add personal todos
- View only their own todos
- Delete their todos
- Log out securely

All data is session-based and isolated per user.

---

## 🚀 Features

- 🔐 User Authentication (Signup/Login/Logout)
- 🗂️ Personal Todo List (per user)
- ➕ Add & 🗑️ Delete Todo items
- 📄 Clean and simple Django templating

---

## 📂 Project Structure

django-projects/
└── todo/
├── manage.py
├── todo/ # Project settings
└── todoapp/ # App with views, models, templates



---

## 🧑‍💻 How to Run This Project

### 🔁 Clone the Repository

```bash
git clone https://github.com/manojgowda593/django-projects.git
cd django-projects/todo



🐳 Option 1: Run using Docker
Make sure you have Docker installed and running.

docker build -t todo:latest .
docker run -p 8000:8000 todo:latest


Now open your browser and go to:
👉 http://localhost:8000/




🐍 Option 2: Run Locally using Python
Make sure you have Python 3 and pip installed.

# Optional: Create a virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install required packages
pip install -r requirements.txt  # Only if this file exists

# Apply migrations and run the server
python manage.py makemigrations
python manage.py migrate
python manage.py runserver


Now visit:
👉 http://127.0.0.1:8000/
