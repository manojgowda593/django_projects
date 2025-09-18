# 📝 Django Todo App

A simple multi-user Todo application built using Django. This app allows users to manage their personal todo lists securely, with each user's data isolated and session-based. Users can register, log in, add, view, and delete their own todos, ensuring a clean and private experience.

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

## 🔄 CI/CD Pipeline

The CI/CD pipeline is triggered whenever code is committed to the Terraform branch inside the todo folder.

### CI Steps:
- Checkout the code from the repository.
- Build a Docker image tagged with the GitHub SHA.
- Scan the Docker image for vulnerabilities.
- Push the Docker image to DockerHub.

### CD Steps:
- Login to AWS using access and secret keys.
- Execute the Terraform script included in the project.
- Terraform provisions the following resources:
  - VPC
  - RDS (deployed in private subnet across 2 Availability Zones)
  - ECS (deployed across 2 Availability Zones)
  - AWS Secret Manager
  - CloudWatch
  - ALB (Application Load Balancer for accessing the application)
  - IAM roles and policies
- The application running on ECS is accessible only through the ALB.

### Best Practices Followed:
- Deploying the database (RDS) to a private subnet for enhanced security.
- Storing database credentials in AWS Secrets Manager.
- Storing Terraform state files in an S3 backend.
- Using GitHub secrets for sensitive CI/CD variables.
- Prioritizing security and high availability in the infrastructure design.

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
