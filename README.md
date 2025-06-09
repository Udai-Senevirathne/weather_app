# Weather App

A real-time Flutter Weather App using the OpenWeather API.  
This project combines Flutter (Dart) for the main application UI with high-performance C++ modules, CMake for build management, and native code integration for a robust, cross-platform experience.

## Features

- Real-time weather updates for any location
- Beautiful and responsive Flutter UI
- Fetches data from the OpenWeather API
- Platform support for Android, iOS, desktop, and web
- Fast and efficient core logic via C++ modules
- Native integrations for iOS (Swift), web (HTML), and desktop (C, CMake)

## Technology Stack

- **Flutter / Dart:** Main application and UI
- **C++ / CMake / C:** Core weather logic and performance-critical components
- **Swift:** iOS-specific integrations
- **HTML:** Web build support

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [CMake](https://cmake.org/)
- [OpenWeather API Key](https://openweathermap.org/api)
- Platform toolchains (Xcode for iOS, Android Studio for Android, etc.)

### Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Udai-Senevirathne/weather_app.git
   cd weather_app
   ```

2. **Get Flutter dependencies:**
   ```bash
   flutter pub get
   ```

3. **Build native modules (C++):**
   ```bash
   mkdir build && cd build
   cmake ..
   make
   ```
   Make sure the built libraries are integrated with your Flutter project as per platform-specific instructions.

4. **Add your OpenWeather API Key:**  
   Set your API key in the appropriate configuration file or as an environment variable, as required by the app.

5. **Run the app:**
   ```bash
   flutter run
   ```
   
## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## Acknowledgements

- [Flutter](https://flutter.dev)
- [OpenWeather API](https://openweathermap.org/api)
- [CMake](https://cmake.org)
- All open-source contributors

---
*Built with ❤️ by Udai-Senevirathne and contributors.*
