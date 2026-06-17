import SwiftUI

struct EditReminderView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode
    
    @ObservedRealmObject var reminder: ReminderEntity
    
    @State private var title = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @State private var isCompleted = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Reminder Details")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    Toggle("Completed", isOn: $isCompleted)
                }
                
                Section(header: Text("Date & Time")) {
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: [.date, .hourAndMinute])
                }
            }
            .navigationTitle("Edit Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        updateReminder()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
            .onAppear {
                title = reminder.title ?? ""
                description = reminder.description ?? ""
                dueDate = reminder.dueDate ?? Date()
                isCompleted = reminder.isCompleted
            }
        }
    }
    
    private func updateReminder() {
        reminder.title = title
        reminder.description = description
        reminder.dueDate = dueDate
        reminder.isCompleted = isCompleted
        
        do {
            try viewContext.save()
            presentationMode.wrappedValue.dismiss()
        } catch {
            print("Error updating reminder: \(error.localizedDescription)")
        }
    }
}
