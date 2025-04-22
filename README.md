# 🎬 Movies App

A beautifully designed Flutter application that allows users to explore trending, popular, and top-rated movies with details fetched from the [TMDb API](https://www.themoviedb.org/documentation/api).
[LinkedIn Post](https://www.linkedin.com/posts/basmala-hesham-14791a247_flutter-dart-moviesapp-activity-7292585164713451522-8fao?utm_source=share&utm_medium=member_android&rcm=ACoAAD0usUcBNDIT8NT0GUW7WzzcfqyQVdhtr_8)

![Movies App Banner](https://github.com/user-attachments/assets/6e665761-e6d9-411f-be5e-29812836b42c)

---

## 📱 Features

- Browse trending, popular, and top-rated movies
- View movie details including rating, overview, and release date
- Search for movies by title
- Add movies to a personal Watchlist
- Responsive and modern UI using Flutter
- Follows clean architecture with BLoC pattern

---

## 📸 Screenshots

### 🏠 Home Page
![Home](https://github.com/user-attachments/assets/cb3e8469-6662-40fb-b431-75bdc80cfaa8)
![Home2](https://github.com/user-attachments/assets/1e6ffed5-a02f-4da2-837f-77a202ffae15)

### 🎬 Movie Details
![Details](https://github.com/user-attachments/assets/5aa3d0f2-02db-418c-8a69-aec36d8c011e)

### 🔍 Search
![Search1](https://github.com/user-attachments/assets/e202b30f-f269-463c-8b70-a8091ef1b9a9)
![Search2](https://github.com/user-attachments/assets/d49f010e-86d9-43e6-ba1d-190115ac53b6)

### 📂 Browse Categories
![Browse1](https://github.com/user-attachments/assets/f35f09a6-2abd-486c-ae64-eb09dd27fcaf)
![Browse2](https://github.com/user-attachments/assets/50b012c5-48d9-4b3f-b99a-fcb317cf1547)

### 📌 WatchList
![WatchList](https://github.com/user-attachments/assets/c191100a-ae50-4383-aa4c-05d8b2bd9631)

---

## 🧰 Tech Stack

- **Flutter** – UI toolkit
- **Dart** – Programming language
- **BLoC** – State management
- **Dio** – For API calls
- **TMDb API** – [The Movie Database](https://www.themoviedb.org/documentation/api)
- **GetIt** – Dependency injection

---

## 📁 Folder Structure

```markdown
## 📁 Folder Structure
```bash
lib/
│
├── core/                        # Core functionalities shared across the app
│   ├── errors/                 # Error handling and failure models
│   │   └── failures.dart
│   └── utils/                  # Utilities and shared components
│       ├── generated/          # (Typically for codegen outputs)
│       ├── widgets/            # Shared/reusable widgets
│       ├── api_service.dart    # Handles API requests
│       ├── app_styles.dart     # Global styling and theming
│       └── service_locator.dart# Dependency injection setup
│
├── features/                   # Feature-based module organization
│   └── browse/                 # Browse feature
│       ├── data/               # Data layer
│       │   ├── models/         # Model classes
│       │   └── repos/          # Repositories and data sources
│       └── presentation/       # UI layer
│           ├── manager/        # State management (e.g., Cubits)
│           │   ├── genre_cubit/
│           │   └── movies_list_cubit/
│           └── views/          # UI Views and Widgets
│               ├── widgets/
│               │   ├── browse_list_view.dart
│               │   └── browse_view.dart
│
├── home/                       # Home feature module
├── layout/                     # General layout components
├── search/                     # Search feature module
├── splash/                     # Splash screen module
└── watch_list/                 # Watch list feature module
```

---

## 🛠️ Setup Instructions

1. **Clone the repository:**

   ```bash
   git clone https://github.com/basmalahesham/movies_app.git
   cd movies_app
2. **Install dependencies**
   ```bash
   flutter pub get
3. **Add your TMDb API key:**
- Create a file or update the existing one (e.g., lib/core/utils/api_constants.dart)
- Replace the placeholder with your TMDb API key:
  ```bash
  static const apiKey = 'YOUR_API_KEY';
4. **Run the app:**
```bash
flutter run
  
---

## 📦 Packages Used

| Package                | Purpose                         |
|------------------------|----------------------------------|
| flutter_bloc           | State management (BLoC pattern) |
| dio                    | API requests                    |
| get_it                 | Dependency injection            |
| equatable              | Value equality for models       |
| cached_network_image   | Efficient image loading         |

---

## ✅ Prerequisites

- Flutter SDK (>=3.0.0)  
- Dart (>=2.17.0)  
- An IDE like VS Code or Android Studio  
- An API key from [TMDb](https://www.themoviedb.org/settings/api)

---

## 🔑 TMDb API Key Setup

1. Create a file called `.env` in the root of your project.  
2. Add your TMDb API key:

   ```env
   TMDB_API_KEY=your_api_key_here

---

## 🤝 Contributing

Contributions are welcome! Please open an issue or submit a pull request.

---

## 🙋‍♀️ Author

- **Basmala Hesham**
  - GitHub: https://github.com/basmalahesham
  - LinkedIn: https://www.linkedin.com/in/basmala-hesham-14791a247/


