# 📝 Quiz App

A feature-rich Flutter mobile application that delivers an interactive quiz experience with real-time questions fetched from the Open Trivia Database API.

## 🎯 Features

- **Dynamic Quiz Generation**: Fetches quiz questions from the Open Trivia Database API
- **Real-time Timer**: 15-second countdown timer for each question
- **Multiple Choice Questions**: Display questions with shuffled answer options
- **Score Tracking**: Keep track of user scores throughout the quiz
- **State Management**: Built with Flutter BLoC/Cubit for efficient state management
- **Clean Architecture**: Organized with clear separation of concerns (features, core, models)
- **Dark Theme**: Modern dark mode interface for comfortable viewing
- **Network Handling**: Robust DIO-based HTTP client with error handling
- **HTML Decoding**: Proper decoding of HTML entities in quiz questions and answers

## 🏗️ Project Structure

```
lib/
├── main.dart                    # App entry point
├── core/                        # Core application layer
│   ├── di/                      # Dependency injection setup
│   ├── models/                  # Data models
│   │   ├── quiz_question_model.dart
│   │   └── quiz_response_model.dart
│   ├── network/                 # Network configuration
│   │   └── remote/
│   │       ├── dio_helper.dart
│   │       └── endpoints.dart
│   ├── theme/                   # Theme configuration
│   └── utils/                   # Utility functions and constants
├── features/                    # Feature modules
│   └── quiz/                    # Quiz feature
│       ├── cubit/               # State management
│       │   ├── quiz_cubit.dart
│       │   └── quiz_state.dart
│       ├── screens/             # UI screens
│       │   └── quiz_screen.dart
│       └── widgets/             # Reusable widgets
```

## 📦 Dependencies

| Package              | Version | Purpose                          |
| -------------------- | ------- | -------------------------------- |
| `flutter_bloc`       | ^9.1.1  | State management                 |
| `bloc`               | ^9.2.0  | Business logic layer             |
| `get_it`             | ^9.2.0  | Service locator/DI               |
| `shared_preferences` | ^2.5.4  | Local data persistence           |
| `dio`                | ^5.9.0  | HTTP client                      |
| `dartz`              | ^0.10.1 | Functional programming utilities |
| `cupertino_icons`    | ^1.0.8  | iOS-style icons                  |

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.10.4 or higher)
- Dart SDK
- Android Studio or Xcode for platform-specific setup

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd quiz_app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the application**

   ```bash
   flutter run
   ```

4. **Build for release**
   - Android: `flutter build apk --release`
   - iOS: `flutter build ios --release`

## 🎮 How to Use

1. **Start the Quiz**: Launch the app to automatically fetch questions
2. **Answer Questions**: Select an answer from the multiple choices
3. **Beat the Timer**: You have 15 seconds to answer each question
4. **Track Progress**: Watch your score increase with each correct answer
5. **Complete Quiz**: Finish all questions to see your final score

## 🏛️ Architecture

The app follows **Clean Architecture** principles:

- **Presentation Layer**: Screens and widgets using Flutter BLoC
- **Business Logic Layer**: Cubit for state management and quiz logic
- **Data Layer**: Remote API integration with error handling
- **Core Layer**: Shared utilities, models, and configurations

### State Management Flow

```
QuizCubit (Business Logic)
    ↓
QuizState (States: Loading, Loaded, Error)
    ↓
Widget Rebuild
    ↓
UI Update
```

## 🔌 API Integration

The app integrates with the **Open Trivia Database API**:

- Base URL: Configured in `endpoints.dart`
- Fetches 10 random questions with different difficulties
- Handles HTML entities in questions and answers
- Implements error handling with `dartz` Either pattern

## 📱 Supported Platforms

- ✅ Android (API level 21+)
- ✅ iOS (11.0+)
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🔐 Environment Setup

### Android

- Ensure `local.properties` points to your Android SDK
- Configure signing in `key.properties` for release builds

### iOS

- Update iOS deployment target in Podfile if needed
- Configure development team in Xcode

## 📊 Project Statistics

- **SDK Version**: Dart 3.10.4+
- **App Version**: 1.0.0+1
- **Build System**: Gradle (Android), Xcode (iOS)

## 🛠️ Development Tools

- **Code Analysis**: Flutter lints enabled
- **State Management**: BLoC Observer for debugging
- **Dependency Injection**: GetIt for service location

## 📄 License

This project is private and not published to pub.dev.

## 🤝 Contributing

Feel free to fork and submit pull requests for bug fixes or feature improvements.

## 📞 Support

For issues or questions, please create an issue in the repository.

## 🎓 Learning Resources

- [Flutter Documentation](https://flutter.dev)
- [BLoC Library](https://bloclibrary.dev)
- [Open Trivia Database API](https://opentdb.com/api_config.php)
- [Flutter Best Practices](https://flutter.dev/docs/testing/best-practices)
