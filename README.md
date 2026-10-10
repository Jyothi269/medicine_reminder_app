# 💊 Medicine Reminder App

A simple Flutter-based Medicine Reminder App developed as a college project.

The application helps users keep track of their medicines by adding medicine details, dosage, and reminder time.

## 📱 Features

- Add medicine
- Enter medicine name
- Enter dosage
- Select reminder time
- View added medicines
- Delete medicines
- Simple and user-friendly interface

## 🛠️ Technologies Used

- Flutter
- Dart
- Android Studio
- Visual Studio Code
- Git
- GitHub

## 🎯 Objective

The main objective of this project is to develop a simple application that helps users organize their medicine schedules and remember their medicines on time.

## 🚀 How to Run

1. Clone the repository:

```bash
git clone https://github.com/Jyothi269/medicine_reminder_app.git
-------------------------------------------------------------------------------------------------
## : Exploring Flutter Widgets and Layouts using Row, Column and Stack

This experiment demonstrates the use of Flutter layout widgets such as Row, Column and Stack. In the Medicine Reminder App, Column is used to arrange the main content vertically, Row is used to arrange medicine information horizontally, and Stack is used to display a medicine icon with a notification badge.

### Output

"Row Column Stack Widgets" (screenshots/row_column_stack_widget.png)
---------------------------------------------------------------------------------------------------
## : Responsive UI using MediaQuery and LayoutBuilder

This experiment demonstrates responsive user interface design in Flutter using MediaQuery and LayoutBuilder. The Medicine Reminder App can adjust its layout according to the available screen size. MediaQuery is used to obtain screen dimensions, while LayoutBuilder is used to build the UI based on the available space.

### Output

"Responsive UI using MediaQuery and LayoutBuilder" (screenshots/responsive_ui_mediaquery_layoutbuilder.png)

--------------------------------------------------------------------------------------------------
Experiment: Navigation Between Screens

Implementation

The Navigator widget is used to open the Add Medicine screen from the Home Screen. The "Navigator.push()" method opens the new screen, while "Navigator.pop()" returns the user to the previous screen.

Output

"Navigation Between Screens" (screenshots/navigation_between_screens.png)

------------------------------------------------------------------------------------------------------
Experiment: State Management in Flutter

Implementation

The StatefulWidget manages the changing data in the application. The setState() method refreshes the user interface whenever the medicine list changes.

Output

"Medicine Reminder State Management" (screenshots/state_management.png)

---------------------------------------------------------------------------------------------------
Experiment: Custom Widgets and Themes in Flutter

Description

This experiment demonstrates how to create reusable custom widgets and apply themes in Flutter. Custom widgets help organize the user interface into smaller components that can be reused throughout the application. Themes provide a consistent appearance for text, buttons, colors, and other interface elements. In the Medicine Reminder App, a common color theme is used to maintain a consistent design.

Implementation

The MaterialApp widget defines the application's theme using ThemeData. Custom widgets can be created by extending StatelessWidget or StatefulWidget and reused wherever required.

Output

"Custom Widgets and Themes" (screenshots/custom_widgets_themes.png)