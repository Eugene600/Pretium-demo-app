# Pretium Finance App Mockup (Hiring Task)

This repository contains a Flutter project replicating the authentication flow (Splash Screen, Login, and Registration pages) and the landing page interface of the Pretium Finance mobile application. This project was completed as part of the first phase of the hiring process for a Flutter Developer position at Pretium Finance.

**Note:** This project focuses solely on the UI/UX replication and does not include any backend integration.

## Features Implemented

Based on the requirements of the task, the following core features have been implemented as mockups:

* **Splash Screen:** A basic splash screen to initiate the app flow.
* **Login Page:** A user interface for the login process.
* **Registration Page:** A user interface for the user registration process.
* **Landing Page:** A mockup of the main landing page interface after successful authentication.

## Enhancements and Improvements

In addition to the core requirements, I have implemented the following enhancements to demonstrate a deeper understanding of Flutter development best practices and to improve the quality of the mockup:

* **Material 3 Theme Integration:** The application has been styled using Flutter's Material 3 theming. This allows the app to leverage the latest Material Design guidelines and provides potential for adapting to the user's device theme settings while maintaining the application's distinct color scheme and branding.
* **Enhanced User Interface:** The design of the landing page and authentication screens has been given extra attention to be visually appealing, modern, and aligned with contemporary mobile application design trends.
* **Responsive Design:** The layouts for the authentication screens have been implemented with responsiveness in mind. This ensures that the user interface adapts gracefully to different screen sizes and orientations, providing an optimal user experience across a range of devices.
* **First-Time User Handling:** Implemented logic using `shared_preferences` to detect if the user is opening the application for the first time. This allows the app to intelligently decide whether to show an initial onboarding experience (like the splash screen leading to auth flow) or navigate directly to the landing page on subsequent opens.

## Getting Started

To run this project locally, follow these steps:

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/Eugene600/Pretium-demo-app.git](https://github.com/Eugene600/Pretium-demo-app.git)
    ```
2.  **Navigate to the project directory:**
    ```bash
    cd pretium
    ```
3.  **Get dependencies:**
    ```bash
    flutter pub get
    ```
4.  **Run the application:**
    ```bash
    flutter run
    ```

## Project Structure

Pretium-demo-app/
├── android/                  
├── assets/                    
│   └── images/                
├── ios/                       
├── lib/                       
│   ├── app_preference/        
│   ├── auth/                 
│   ├── display/               
│   ├── navigation/                      
│   └── main.dart              
├── linux/                     
├── macos/                     
├── test/                      
│   └── widget_test.dart
├── web/                       
├── windows/                  
├── .gitignore                
├── .metadata                  
├── analysis_options.yaml     
├── pubspec.yaml               
├── pubspec.lock               
└── README.md                 

## Contact

If you have any questions or feedback, please feel free to contact me at [eugene.mangi36@gmail.com](mailto:eugene.mangi36@gmail.com).
