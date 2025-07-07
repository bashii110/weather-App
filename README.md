# weather-App

📱 Overview
The Weather App is a Flutter-based mobile application that provides real-time weather information for any selected city. It fetches data using weather APIs and displays essential weather details such as temperature, humidity, wind speed, visibility, and sunrise/sunset timings. The app features a clean UI, interactive navigation, and supports adding multiple cities with swipe-based weather screens.

🚀 Features
🌍 Search and add cities to track weather.

🌡️ Real-time temperature and weather conditions.

💨 Displays wind speed, pressure, and visibility.

🌅 Sunrise and sunset timings.

📲 Swipe between selected cities for quick access.

🔄 Pull-to-refresh to update weather data.

🌓 Dynamic weather icons and background changes based on conditions.

🛠️ Built with Flutter and RESTful API integration.

🛑 Prerequisites
Flutter SDK

Dart

Android Studio 

Internet connection (for fetching live data)

🔧 Installation
Clone the repository


git clone https://github.com/your-username/weather-app-flutter.git
Navigate to the project directory


cd weather-app-flutter
Get the dependencies

flutter pub get
Run the app


flutter run
📂 Project Structure
plaintext
/lib
  ├── models/        # Weather data models
  ├── services/      # API service handlers
  ├── screens/       # App screens (Home, City List, etc.)
  ├── widgets/       # Custom UI widgets
  └── main.dart      # App entry point
🔑 API Integration
The app uses OpenWeatherMap API (or your selected API).

You need to add your API key in the API service file.


const String apiKey = 'Your Api Key';

🤝 Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

📃 License
This project is open-source and available under the MIT License.
