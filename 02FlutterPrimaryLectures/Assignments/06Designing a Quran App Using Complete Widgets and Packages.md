### **Assignment: Designing a Quran App Using Complete Widgets and Packages**

---

**Objective:**  
Design a fully functional Quran App using Flutter, incorporating various widgets and packages covered in class. The app should include features such as Quran recitation, translations, and favorites while utilizing Flutter widgets like **Card**, **TextField**, **Audio packages**, **intl package**, **Google Fonts**, **Listing**, **IconButton**, **DropDown list**, **Custom Widgets**, **Custom Themes**, **Image Assets**, **Network Images**, **Splash Screen**, **Custom Fonts**, **Date and Time Picker**, **Wrap**, **GridView**, **Gradient**, **Expand**, **Columns**, **Colors**, **Rows**, **InkWell**, **Containers**, **TabBar**, **AppBar**, etc.

---

### **Project Requirements:**

1. **Splash Screen:**
   - Create a custom splash screen that appears when the app starts.
   - Use an image asset or a network image for the background.
   - Display a title and subtitle in the center using custom fonts.
   - Apply a gradient background and include a loading animation.

2. **Home Screen:**
   - Implement a TabBar with three main sections:
     - **Quran Recitation**: Display a list of Surahs.
     - **Translations**: List of available translations in different languages.
     - **Favorites**: Grid of favorite Surahs or Ayahs.
   - Include a Custom AppBar with navigation icons.

3. **Quran Recitation Section:**
   - Use a ListView with Card widgets to list all Surahs.
   - Each card should display the Surah name, number of Ayahs, and Revelation type (Makki/Madani).
   - Provide options for audio playback using the audio package.
   - Use Google Fonts for styling the text.
   - Create reusable custom widgets for list items and playback controls.

4. **Translations Section:**
   - Implement a DropDown list for selecting translation languages.
   - Display translation text below the selected Surah.
   - Apply custom themes to differentiate between selected and unselected Surahs.

5. **Favorites Section:**
   - Use a GridView to display favorite Surahs or Ayahs.
   - Allow user interaction using InkWell.

6. **Search Feature:**
   - Add a TextField at the top for searching Surahs by name or number.
   - Implement filtering functionality to update the ListView dynamically.

7. **Date and Time Feature:**
   - Use the intl package to localize date and time.
   - Implement a Date and Time Picker for selecting specific dates or setting reminders.

8. **Custom Themes and Fonts:**
   - Use Google Fonts for custom typography across the app.
   - Implement light and dark modes with different color schemes.

9. **Audio Playback Controls:**
   - Enable users to listen to Quranic recitations for each Surah.
   - Add playback controls (Play, Pause, Stop) using IconButton widgets.

10. **Expanded and Flexible Layouts:**
    - Use Wrap and Expanded widgets for responsive design.
    - Ensure proper layout adjustments using Columns, Rows, and Wrap for different screen sizes.

11. **AppBar:**
    - Create a custom AppBar with a title and navigation icons.

12. **Colors and Effects:**
    - Use the Colors class for defining primary and accent colors.
    - Apply BoxDecoration for card shadows, rounded corners, and gradients.

---

### **Packages to Use:**
- **audio_package**: For Quran recitation and audio controls.
- **intl**: For date and time localization.
- **google_fonts**: To apply custom fonts.
- **flutter_spinkit**: For loading animations on the splash screen (optional).

### **Bonus Features:**
- Add animations for smooth transitions between screens.
- Implement a bookmarking feature to save specific Ayahs or Surahs.

---

### **Submission Instructions:**
- **GitHub Submission**:
  1. Upload the complete project to GitHub.
  2. Include a README file that explains:
     - How to install and run the app.
     - The features included in the app.
     - Any additional details or notes.
  3. Provide screenshots or a screen recording of the app's functionality.

- **Documentation**:
  - Include brief documentation on the structure of the app and the widgets used.
  - Describe any custom widgets or packages utilized.

---

### **Grading Criteria**:
1. **Functionality** (50%): The app should work as described, with smooth navigation and functioning features.
2. **UI/UX Design** (20%): The app should have a clean, responsive design using themes, colors, and fonts effectively.
3. **Code Quality** (20%): The code should be clean, well-commented, and follow best practices.
4. **Bonus Features** (10%): Additional features like animations, bookmarking, or theme switcher will provide extra credit.

---

### **Deadline:**  
Submit the project on GitHub by **Saturday, 12th October 2024**.