
# Quest Checklist ✅

A simple **to-do list application** built with **Ruby on Rails 8** that helps you manage and track your quests (tasks) efficiently.  
The project leverages modern Rails features like **Turbo** and **Stimulus** for interactivity, styled with **TailwindCSS**, and tested with a comprehensive **RSpec test suite**.

---

## 🚀 Features
- Quest management: **Create, Read, Update, Delete**
- Status tracking: Toggle quests between active and completed
- Responsive and clean UI styled with **TailwindCSS**
- Hotwire (**Turbo + Stimulus**) frontend interactivity
- Full test coverage with **RSpec, Capybara, Minitest and SimpleCov**
- Continuous Integration with **GitHub Actions**

---

## 🛠️ Technology Stack
- **Ruby** 3.4.2  
- **Rails** 8.0.2  
- **PostgreSQL** database  
- **TailwindCSS** for styling  
- **Turbo & Stimulus** for frontend interactivity  

Optional:
- **Docker** for containerized development

---

## 📋 Prerequisites
Make sure you have installed:
- Ruby 3.4.0  
- PostgreSQL  
- Docker (optional, for containerized dev environment)  

---

## ⚡ Setup Instructions

1. **Clone the repository**
   ```bash
   git clonehttps://github.com/pparnfaa/my-academy-quest
   cd my-academy-test
2. **Install dependencies**
	```bash
	bundle install
3. **Setup the database**
	```bash
	touch .env 
	code .env
	```
	Add the following to `.env`
	```
	DB_USERNAME={your_user_progresql} 
	DB_PASSWORD={your_password_progresql}
	```		
	```
	docker compose up -d db
	```
4. **Start the development server**
	```
	bin/dev
	```
---

## 🧪 Running Tests
- **Run mini-test with:**
	```
	rails test
	```
	- **Check coverage with simplecov:**
		```
		open coverage/index.html
		```
- **Run system and integration tests with:**
	```
	bundle exec rspec spec/system/**
	bundle exec rspec spec/integration
	```