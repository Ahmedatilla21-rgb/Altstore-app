import SwiftUI
import UserNotifications

struct AddReminderView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var title = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @State private var enableNotification = true

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Reminder Details")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                }
                
                Section(header: Text("Date & Time")) {
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: [.date, .hourAndMinute])
                }
                
                Section(header: Text("Notifications")) {
                    Toggle("Enable Notification", isOn: $enableNotification)
                }
            }
            .navigationTitle("New Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveReminder()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
    
    private func saveReminder() {
        let newReminder = ReminderEntity(context: viewContext)
        newReminder.id = UUID()
        newReminder.title = title
        newReminder.description = description
        newReminder.dueDate = dueDate
        newReminder.isCompleted = false
        newReminder.createdDate = Date()
        
        do {
            try viewContext.save()
            if enableNotification {
                scheduleNotification(for: newReminder)
            }
            presentationMode.wrappedValue.dismiss()
        } catch {
            print("Error saving reminder: \(error.localizedDescription)")
        }
    }
    
    private func scheduleNotification(for reminder: ReminderEntity) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                let content = UNMutableNotificationContent()
                content.title = reminder.title ?? "Reminder"
                content.body = reminder.description ?? "You have a reminder"
                content.sound = .default
                
                let trigger = UNCalendarNotificationTrigger(matching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: reminder.dueDate ?? Date()), repeats: false)
                let request = UNNotificationRequest(identifier: reminder.id?.uuidString ?? UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request) { error in
                    if let error = error {
                        print("Error scheduling notification: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
