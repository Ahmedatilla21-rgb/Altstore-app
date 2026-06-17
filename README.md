# RemindMe - iOS Reminder App

A beautiful and functional iOS reminder app built with SwiftUI, designed for AltStore distribution.

## ✨ Features

- ✅ Create, edit, and delete reminders
- ✅ Set date and time for reminders
- ✅ Local notifications support
- ✅ Mark reminders as completed
- ✅ Clean, intuitive SwiftUI interface
- ✅ Persistent storage with CoreData
- ✅ iOS 15.0+ support

## 📋 Requirements

- iOS 15.0 or later
- Xcode 13.0 or later
- Swift 5.5 or later

## 📦 Installation

### Using Xcode
1. Clone this repository
2. Open `RemindMe.xcodeproj` in Xcode
3. Select your target device or simulator
4. Press `Cmd + R` to build and run

### Using AltStore
1. Build the app using Xcode
2. Create an IPA file
3. Add the IPA to AltStore
4. Install on your iOS device

## 📁 Project Structure

```
RemindMe/
├── Views/
│   ├── ContentView.swift          # Main view with reminder list
│   ├── AddReminderView.swift      # Add new reminder form
│   ├── EditReminderView.swift     # Edit existing reminder
│   └── ReminderRowView.swift      # Individual reminder row
├── Models/
│   └── ReminderEntity.swift       # Core Data model
├── Persistence/
│   └── PersistenceController.swift # CoreData setup
├── RemindMeApp.swift              # App entry point
└── Info.plist                     # App configuration
```

## 🎯 Usage

1. **Create a Reminder**: Tap the `+` button in the top right
2. **Edit a Reminder**: Tap on any reminder in the list
3. **Delete a Reminder**: Swipe left on a reminder and tap delete
4. **Mark as Complete**: Tap the circle icon next to a reminder
5. **Enable Notifications**: Toggle notifications when creating a reminder

## 🔔 Notifications

The app supports local push notifications. When creating a reminder:
1. Set the date and time
2. Toggle "Enable Notification"
3. You'll receive an alert at the scheduled time

## 🛠 Technologies Used

- **SwiftUI** - Modern UI framework
- **CoreData** - Local data persistence
- **UNUserNotificationCenter** - Push notifications
- **Swift** - Programming language

## 🚀 Future Enhancements

- [ ] Recurring reminders
- [ ] Reminder categories/tags
- [ ] Dark mode optimization
- [ ] Widgets support
- [ ] iCloud sync
- [ ] Custom notification sounds
- [ ] Voice reminders

## 📄 License

MIT License - feel free to use this project for personal or commercial purposes.

## 🤝 Support

For issues, feature requests, or improvements, please open an issue in the repository.

---

**Happy reminding! 📱✨**
