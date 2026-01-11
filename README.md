# CodeMaster - Coding Practice App

A modern Flutter application for learning programming through interactive coding challenges, featuring clean architecture, state management with Provider, and a sleek monochrome UI.

##  Features

### Core Features
- **Daily Challenges**: New coding problems every day to keep you practicing
- **Problem Categories**: Filter problems by difficulty (Easy, Medium, Hard) and category
- **Code Editor**: Built-in Python code editor with syntax highlighting
- **Solution Submission**: Submit solutions and get instant feedback
- **Hints System**: Get hints when stuck on a problem

### User Features
- **Authentication**: Secure login and registration with token-based sessions
- **User Profile**: View stats, rank, and solved problems count
- **Submission History**: Track all your past submissions
- **Leaderboard**: Compete with other users globally
- **Multi-language**: Support for English and Arabic

### UI/UX
- **Monochrome Theme**: Sleek black and white design
- **Responsive Layout**: Optimized for all screen sizes
- **Shimmer Loading**: Smooth loading animations
- **Modern Dialogs**: Beautiful confirmation dialogs and bottom sheets

##  Tech Stack

| Category | Technology |
|----------|------------|
| Framework | Flutter 3.10+ |
| State Management | Provider |
| Navigation | go_router |
| Networking | Dio |
| Local Storage | SharedPreferences |
| UI | flutter_screenutil, iconsax, shimmer |
| Fonts | Google Fonts |
| SVG | flutter_svg |

##  Project Structure

```
lib/
├── app/                    # App configuration
├── core/
│   ├── constants/          # App constants (images, etc.)
│   ├── l10n/               # Localization (EN/AR)
│   ├── network/            # API client (Dio setup)
│   ├── routes/             # App router (go_router)
│   ├── theme/              # Colors, dimensions, text styles
│   └── utils/              # Error handlers, validators
├── features/
│   ├── auth/               # Login, Register
│   │   ├── data/
│   │   ├── presentation/
│   │   └── providers/
│   ├── discover/           # Browse problems
│   │   ├── data/
│   │   ├── presentation/
│   │   └── providers/
│   ├── home/               # Dashboard, daily challenge
│   │   ├── controllers/
│   │   ├── data/
│   │   ├── presentation/
│   │   └── providers/
│   ├── onboarding/         # First-time user experience
│   │   ├── controllers/
│   │   ├── presentation/
│   │   └── providers/
│   ├── problems/           # Problem detail, solution
│   │   ├── controllers/
│   │   ├── data/
│   │   ├── presentation/
│   │   └── providers/
│   ├── profile/            # User profile, settings
│   │   ├── controllers/
│   │   ├── data/
│   │   ├── presentation/
│   │   └── providers/
│   └── splash/             # Splash screen
│       ├── presentation/
│       └── providers/
├── shared/
│   └── widgets/            # Reusable widgets (shimmer, etc.)
└── main.dart
```

##  API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/login` | User authentication |
| POST | `/register` | User registration |
| GET | `/exercises` | Get all problems |
| GET | `/exercises/{id}` | Get problem by ID |
| GET | `/categories` | Get problem categories |
| GET | `/daily-challenge` | Get daily challenge |
| POST | `/solutions` | Submit solution |
| GET | `/solutions/history` | Get submission history |
| GET | `/leaderboard` | Get leaderboard |
| GET | `/user/stats` | Get user statistics |
| GET | `/user/profile` | Get user profile |
| GET | `/exercises/{id}/hint` | Get problem hint |

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.10+
- Dart SDK 3.0+
- Android Studio / VS Code
- Backend API server running

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/codemaster.git
cd codemaster
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure API URL in `lib/core/network/api_client.dart`:
```dart
static const String baseUrl = 'http://YOUR_API_URL/api';
```

4. Run the app:
```bash
flutter run
```

##  Screens

| Screen | Description |
|--------|-------------|
| Splash | Animated splash with logo |
| Onboarding | 3-step introduction for new users |
| Login | User authentication |
| Register | New account creation |
| Home | Dashboard with daily challenge and recent problems |
| Discover | Browse and search all problems |
| Problem Detail | View problem description and submit solution |
| Profile | User stats, settings, and menu |
| Leaderboard | Global user rankings |
| History | Submission history |
| About | App information |

##  Theme

The app uses a monochrome theme with the following colors:

| Color | Hex | Usage |
|-------|-----|-------|
| Primary Black | `#000000` | Primary text, buttons |
| Primary White | `#FFFFFF` | Background, cards |
| Text Grey | `#888888` | Secondary text |
| Input Fill | `#F5F5F5` | Input backgrounds |
| Scaffold Background | `#FAFAFA` | Page backgrounds |

##  Localization

The app supports:
- 🇺🇸 English
- 🇸🇦 Arabic

Translations are managed in `lib/core/l10n/app_localizations.dart`

##  License

This project is for educational purposes.

##  Author

Developed as a final mobile project.
