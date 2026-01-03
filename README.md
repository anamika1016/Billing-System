# Billing System

A Ruby on Rails 8 application for a billing system, allowing products management, generating invoices, and viewing purchase history.

## Features
- **Product Management**: CRUD functionality for products with stock tracking and tax percentages.
- **Billing Entry**: Dynamic form to add line items, calculate totals, and record payment denominations.
- **Invoicing**: Detailed itemized invoices with tax breakdowns and balance denomination calculations.
- **Email Invoicing**: Asynchronous email delivery of invoices to customers.
- **Purchase History**: View all past transactions.

## Setup
1. **Install Dependencies**: `bundle install`
2. **Database Setup**: `rails db:migrate`
3. **Seed Data**: `rails db:seed`
4. **Run Server**: `bin/rails server`

## Tech Stack
- Ruby 3.4.2
- Rails 8.0.4
- SQLite3
- Stimulus.js (for dynamic form interactions)
- Bootstrap 5 (for UI/UX)
