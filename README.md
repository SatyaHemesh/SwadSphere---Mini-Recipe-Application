# 🍳 SwadSphere — Mini Recipe Application

SwadSphere is a beautifully designed **Flutter-based recipe application** that allows users to explore, search, and save their favourite dishes with ease.  
This mini project provides a modern UI, quick navigation, and a seamless experience for food lovers.

---

## 🚀 Features

✨ **Core Highlights**
- 🥘 Browse a wide collection of recipes  
- 🔍 Search by recipe name, ingredient, or category  
- ❤️ Add/remove favorite recipes  
- 📸 High-quality recipe images  
- 🍽️ Step-by-step cooking instructions  
- 🕒 Real-time updates (if Firebase integrated)  
- 🌙 Supports both Light & Dark mode  

---

## 🛠️ Tech Stack

| Category | Technology |
|---------|------------|
| **Frontend** | Flutter (Dart) |
| **Backend / Data** | Firebase / Local JSON |
| **UI / UX** | Material Design, Responsive Layout |
| **IDE** | Android Studio / VS Code |

---

## 📁 Folder Structure

```
SwadSphere/
│
├── lib/
│   ├── models/            # Data models
│   ├── screens/           # UI screens (Home, Details, Favorites)
│   ├── widgets/           # Reusable UI components
│   ├── services/          # Firebase / API / Local Data
│   └── main.dart          # Entry point of the application
│
├── assets/
│   ├── images/            # Recipe images
│   └── recipes/           # Recipe JSON files
│
├── pubspec.yaml           # Flutter dependencies
├── README.md              # Project documentation
└── .gitignore             # Ignored files for Git
```

---

## ⚙️ Installation & Setup

Follow these steps to run SwadSphere locally:

### 1️⃣ Clone this repository
```bash
git clone https://github.com/SatyaHemesh/SwadSphere---Mini-Recipe-Application.git
```

### 2️⃣ Navigate into the project folder
```bash
cd SwadSphere---Mini-Recipe-Application
```

### 3️⃣ Install Flutter dependencies
```bash
flutter pub get
```

### 4️⃣ Run the application
```bash
flutter run
```

---

## 🧩 Dependencies Used

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  provider: ^6.0.5
  http: ^1.1.0
  firebase_core: ^3.1.0
  cloud_firestore: ^5.2.0
  shared_preferences: ^2.3.2
```

---

## 🧠 How It Works

1. Users browse recipes by category or search using keywords.  
2. Each recipe includes ingredients, cook time, and step-by-step instructions.  
3. Users can **favorite** any recipe to save it for later.  
4. Firebase (optional) syncs data in real-time if connected.  

---

## 📦 Build & Release

To generate a production build:

```bash
flutter build apk --release
```

The APK will be available at:

```
build/app/outputs/flutter-apk/app-release.apk
```

---

# 👥 Team Members

This project is collaboratively developed by a team of four:

| Name | GitHub Profile |
|------|----------------|
| **Vasala Akshaya** | https://github.com/Akshaya-1826/ |
| **A. Vinay Raj** | https://github.com/vinay-VR |
| **N.A. Tanish Namadevan** | https://github.com/Tedfeb17 |
| **R. Satya Hemesh** | https://github.com/SatyaHemesh |

🎓 B.Tech CSE — ACE Engineering College (Class of 2027)  
💻 Passionate about Flutter, Firebase, and Mobile App Development  

📧 Email (Team Lead): **satyahemesh2006@gmail.com**  
🌐 Portfolio (Lead): **https://satyahemesh.netlify.app**

---

## 🌟 Contributing

Contributions, issues, and feature requests are welcome!  
Visit the **Issues** tab to get started.

---

## 📝 License

This project is licensed under the **MIT License**.  
See the **LICENSE** file for more details.

---

## 💬 Acknowledgements

- Flutter & Dart documentation  
- Firebase by Google  
- Community packages from pub.dev  
- Recipe design inspiration from apps like **Yummly** & **Tasty**

---

> _“Good food is the foundation of genuine happiness.” — Auguste Escoffier_ 🍲 

