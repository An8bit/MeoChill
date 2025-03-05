# MeoChill - Movies App

![MeoChill Logo](https://via.placeholder.com/150?text=MeoChill)

## Overview

MeoChill is a modern Flutter-based movies application that provides an immersive experience for movie enthusiasts. Built with Flutter and Dart, this app allows users to browse, search, and discover information about movies and TV shows.

## Features

- **Movie Browsing**: Explore a vast collection of movies and TV shows
- **Interactive UI**: Swipe through movie cards with smooth animations
- **Detailed Information**: View comprehensive details about movies including cast, ratings, and reviews
- **Web Integration**: Access additional content through embedded web views
- **Caching**: Efficient loading with cached network images
- **Multilingual Support**: App localization for different languages
- **User Preferences**: Save and manage your favorite movies and settings

## Screenshots

*[Place your app screenshots here]*

## Tech Stack

- **Framework**: Flutter
- **State Management**: BLoC pattern with flutter_bloc
- **Database**: MongoDB (via mongo_dart)
- **UI Components**: 
  - Card Swiper for interactive movie browsing
  - Flutter SpinKit for loading animations
  - WebView for embedded web content
- **Storage**: SharedPreferences for local data persistence
- **Localization**: Flutter Localization for multi-language support

## Dependencies

- `flutter_bloc`: ^8.1.5
- `equatable`: ^2.0.5
- `card_swiper`: ^3.0.1
- `cached_network_image`: ^3.3.1
- `mongo_dart`: ^0.10.2
- `flutter_spinkit`: ^5.2.1
- `readmore`: ^3.0.0
- `webview_flutter`: ^4.8.0
- `shared_preferences`: ^2.2.3
- `flutter_localization`: ^0.2.0
- `flutter_widget_from_html`: ^0.15.1

## Getting Started

### Prerequisites

- Flutter SDK (version 3.3.4 or higher)
- Dart SDK (version 3.3.4 or higher)
- Android Studio / VS Code
- A physical device or emulator

### Installation

1. Clone the repository
   ```bash
   git clone https://github.com/An8bit/MeoChill.git
   ```

2. Navigate to the project directory
   ```bash
   cd MeoChill/meochill
   ```

3. Install dependencies
   ```bash
   flutter pub get
   ```

4. Run the app
   ```bash
   flutter run
   ```

## Project Structure

```
meochill/
├── assets/            # Contains app images and resources
├── lib/
│   ├── bloc/          # BLoC state management
│   ├── models/        # Data models
│   ├── screens/       # UI screens
│   ├── services/      # API and database services
│   ├── utils/         # Helper functions and utilities
│   └── widgets/       # Reusable UI components
└── pubspec.yaml       # Project dependencies
```

## Configuration

Make sure to set up your MongoDB connection in the appropriate configuration file before running the app.

## Future Enhancements

- User authentication system
- Personalized movie recommendations
- Offline movie viewing
- Social sharing features
- Enhanced search capabilities

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

- Developer: [An8bit](https://github.com/An8bit)
- Project Link: [https://github.com/An8bit/MeoChill](https://github.com/An8bit/MeoChill)

---

&copy; 2025 MeoChill. All rights reserved.
