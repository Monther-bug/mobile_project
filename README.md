# Final Mobile Project - Coding Practice App

A modern, responsive Flutter application designed for coding practice, featuring secure authentication and a premium monochrome UI.

![Splash & Login](https://via.placeholder.com/800x400?text=App+Screenshots+Placeholder)

## 🚀 Features

-   **Authentication**:
    -   Secure Login and Registration flows.
    -   Integrated with PHP Backend API.
    -   Token-based session management.
    -   Form validation and error handling.
-   **UI/UX**:
    -   **Monochrome Theme**: A sleek, high-contrast Black & White design.
    -   **Responsive Layout**: Optimized for various screen sizes using `flutter_screenutil`.
    -   **Animations**: Engaging Splash Screen with elastic transitions.
    -   **Custom Widgets**: Reusable components (`GlassContainer`, `PrimaryButton`, `CustomTextField`) for consistency.
-   **Assets**:
    -   High-quality icons using `iconsax`.

## 🛠️ Tech Stack

-   **Framework**: [Flutter](https://flutter.dev/) (Dart)
-   **State Management**: [Provider](https://pub.dev/packages/provider)
-   **Networking**: [Dio](https://pub.dev/packages/dio) with Interceptors
-   **Storage**: [Shared Preferences](https://pub.dev/packages/shared_preferences) (Token Persistence)
-   **UI Utils**:
    -   `flutter_screenutil` (Responsiveness)
    -   `iconsax` (Icons)

## 🔌 API Configuration

The application connects to a remote backend for authentication.

-   **Base URL**: `http://10.14.111.39:8000/api`
-   **Endpoints**:
    -   `POST /login`: Authenticate user.
    -   `POST /register`: Create new account.

*Note: Ensure your device/emulator can access the specified IP address.*

## 📂 Project Structure

```
lib/
├── core/
│   ├── network/       # API Client (Dio setup)
│   └── theme/         # AppColors, AppDimens, AppTextStyles
├── features/
│   ├── auth/          # Login & Register Logic/UI
│   │   ├── data/      # Models & DataSources
│   │   ├── presentation/
│   │   └── providers/ # State Management
│   └── splash/        # Splash Screen
├── shared/
│   └── widgets/       # Reusable UI Components
└── main.dart          # Entry point & App Configuration
```

## 🏁 Getting Started

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/yourusername/final_mobile_project.git
    ```

2.  **Install Dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Run the App**:
    ```bash
    flutter run
    ```

## 📝 License

This project is for educational purposes.
