# 🐱 Flutter Authentication & API App

### A Flutter application with Supabase authentication, API integration, theme management, and interactive UI components

<p align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)
![HTTP](https://img.shields.io/badge/REST_API-009688?style=for-the-badge)
![Lottie](https://img.shields.io/badge/Lottie-FF6B6B?style=for-the-badge)
![Material UI](https://img.shields.io/badge/Material_Design-757575?style=for-the-badge)

</p>

---

## 📌 Project Overview

This project is a Flutter application implementing authentication, API integration, theme switching, and multi-page navigation.

The application uses **Supabase Authentication** for secure login and registration, fetches dynamic data through external APIs, and provides a responsive user experience with animated UI components.

---

## ✨ Features

### 🔐 Authentication

- User registration using email/password
- Secure login functionality
- Session persistence
- Automatic user redirection
- Logout support

### 🎨 Theme Management

- Dark mode
- Light mode
- Dynamic theme switching

### 🌐 API Integration

- Fetches dynamic data from external APIs
- JSON parsing and model conversion
- Asynchronous API handling

### 🧭 Navigation

- Bottom navigation bar
- Drawer navigation
- Multi-page architecture

### 🎭 UI Components

- Hero animations
- Lottie animations
- Responsive Material UI design

---

## 🏗 Application Architecture

```text
Start Page
      ↓
Check Session
      ↓

┌──────────────────┐
│ Session Exists ? │
└──────────────────┘

   ↓ Yes                    ↓ No

WidgetTree             Login/Register
     ↓
Bottom Navigation
     ↓
┌─────────────┬──────────────┐
│ Home        │ Profile      │
└─────────────┴──────────────┘

Drawer Menu
     ↓
About
Settings
Logout
```

---

## 📂 Project Structure

```text
lib/
│
├── data/
│   ├── classes/
│   │     └── facts.dart
│   │
│   └── notifiers.dart
│
├── services/
│     └── shared_preferences_service.dart
│
├── views/
│   └── pages/
│         ├── home_page.dart
│         ├── login_page.dart
│         ├── register_page.dart
│         ├── profile_page.dart
│         ├── settings_page.dart
│         ├── about_page.dart
│         └── start_page.dart
│
├── widgets/
│     ├── hero_widget.dart
│     ├── navbar_widget.dart
│     └── widget_tree.dart
│
└── main.dart
```

---

## 🛠 Tech Stack

### Frontend

- Flutter
- Dart
- Material Design

### Backend & Authentication

- Supabase Authentication

### API Integration

- HTTP Package
- REST APIs

### State Management

- ValueNotifier
- ValueListenableBuilder

### UI Libraries

- Lottie Animations

---

## ⚙️ Core Functionalities

### Authentication Flow

```dart
await supabase.auth.signInWithPassword(
    email: email,
    password: password,
);
```

Features:

- Email registration
- Password validation
- Session management
- Authentication state listener

---

### Theme State Management

```dart
ValueNotifier<bool> isDarkModeNotifier
```

Capabilities:

- Dynamic theme switching
- Global state updates
- Real-time UI updates

---

### API Data Fetching

```dart
Future<Fact> getData()
```

Features:

- HTTP requests
- Async data loading
- JSON serialization
- Error handling

---

## 🚀 Installation

Clone repository:

```bash
git clone https://github.com/K-u-r-a-m-a/project-one.git
```

Move into project directory:

```bash
cd project-one
```

Install dependencies:

```bash
flutter pub get
```

Run application:

```bash
flutter run
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.8
  lottie: ^3.3.2
  shared_preferences: ^2.5.4
  http: ^1.6.0
  supabase_flutter: ^2.12.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0
```

---

## 📁 Assets

```yaml
assets:
  - assets/images/
  - assets/lotties/
```

Assets used:

- 🖼 Images
- 🎭 Lottie animations

---

## 📸 Screenshots

Add screenshots here:

```md
![Login Screen](screenshots/login.png)

![Home Screen](screenshots/home.png)

![Profile Screen](screenshots/profile.png)
```

---

## 🔮 Future Improvements

- User profile editing
- Password reset
- Remember me functionality
- Push notifications
- Database integration
- Better state management using Riverpod/Bloc
- Profile image upload
- Form validation improvements
- Secure environment variables using dotenv
- Better architecture using Repository Pattern

---

## 🧑‍💻 Developer

**Kushal Rao M**

B.Tech Computer Science Engineering  
Bennett University

---

## ⭐ If you found this useful, consider giving the repository a star.
