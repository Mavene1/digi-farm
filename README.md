# digi_farmers

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Flutter Supabase Sample Project

This Flutter project demonstrates how to integrate Supabase for authentication and database services. Supabase is an open-source alternative to Firebase with a focus on simplicity and extensibility.

## Getting Started

1. **Create a Supabase Account:**
   Visit [Supabase](https://supabase.io/) and create an account if you don't have one. Once logged in, create a new project and set up a database.

2. **Configure Supabase:**
   Obtain your Supabase project URL and API key. Update the `lib/constants.dart` file with your Supabase project details.

   ```dart
   const supabaseUrl = 'YOUR_SUPABASE_URL';
   const supabaseKey = 'YOUR_SUPABASE_API_KEY';
   
Install dependencies: flutter pub get

Features
Authentication:

Sign up with email and password.
Sign in with email and password.
Sign out.
Database Services:

Create new records.
Read records.
Update existing records.
Delete records.

Directory Structure
lib/
|-- auth/
|   |-- auth_service.dart       # Handles authentication using Supabase.
|-- models/
|   |-- user_model.dart         # User data model.
|-- screens/
|   |-- home_screen.dart        # Home screen with CRUD operations.
|   |-- login_screen.dart       # Login screen.
|   |-- signup_screen.dart      # Signup screen.
|-- services/
|   |-- database_service.dart   # Handles database services using Supabase.
|-- constants.dart              # Supabase configuration constants.
|-- main.dart                   # Main entry point of the app.
