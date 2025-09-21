# Django Projects Repository

[![Python](https://img.shields.io/badge/Python-3.11-blue?logo=python)](https://www.python.org/)
[![Django](https://img.shields.io/badge/Django-4.2-green?logo=django)](https://www.djangoproject.com/)

This repository contains my personal Django projects for learning and practice. It demonstrates building web applications with Python and Django, including backend development, database management, and deployment using CI/CD workflows.

---

## Repository Structure

```text
django-projects/
 ├── todo/             # Django project folder
 ├── .github/          # GitHub workflows for CI/CD
 ├── .gitignore
 └── document.md       # Notes or documentation


CI/CD Workflows

This repository demonstrates two separate CI/CD approaches:
Main branch
Deploys the application automatically to an EC2 instance using GitHub Actions.

Terraform branch
Deploys the application to ECS by provisioning infrastructure with Terraform scripts.