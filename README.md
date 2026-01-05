# Billing System

A modern Ruby on Rails 8 application for a billing system, allowing for efficient product management, dynamic bill generation, and detailed purchase history.

## 🚀 Features
- **Product Management**: Complete CRUD functionality with stock tracking and tax configuration.
- **Dynamic Billing**: Real-time total calculation based on cash denominations.
- **Detailed Invoices**: Automatically generated receipts with itemized tax breakdowns.
- **Asynchronous Emailing**: Automatic invoice delivery via background jobs.
- **Purchase History**: Centralized log of all customer transactions.

## 🛠 Tech Stack
- **Ruby**: 3.4.2
- **Rails**: 8.0.4
- **Database**: SQLite3
- **Frontend**: Stimulus.js & Bootstrap 5

## ⚙️ Setup Instructions

### 1. Prerequisites
Ensure you have Ruby 3.4.2 and Bundler installed.

### 2. Install Dependencies
```bash
bundle install
```

### 3. Database Initialization
```bash
rails db:migrate
rails db:seed
```

### 4. Running the Application
```bash
bin/rails server
```
Access the app at `http://localhost:3000`.

## 🔒 Configuration
Database paths and sensitive environment variables are managed through Rails standard configuration files. Ensure `storage/` directory is writable.
