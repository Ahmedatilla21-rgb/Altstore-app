import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: ReminderEntity.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \ReminderEntity.dueDate, ascending: true)]
    ) private var reminders: FetchedResults<ReminderEntity>
    
    @State private var showAddReminder = false
    @State private var selectedReminder: ReminderEntity?

    var body: some View {
        NavigationView {
            ZStack {
                if reminders.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "calendar.badge.clock")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("No Reminders")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("Create a reminder to get started")
                            .foregroundColor(.gray)
                    }
                } else {
                    List {
                        ForEach(reminders) { reminder in
                            ReminderRowView(reminder: reminder)
                                .onTapGesture {
                                    selectedReminder = reminder
                                }
                        }
                        .onDelete(perform: deleteReminders)
                    }
                }
            }
            .navigationTitle("Reminders")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAddReminder = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $showAddReminder) {
                AddReminderView()
                    .environment(\.managedObjectContext, viewContext)
            }
            .sheet(item: $selectedReminder) { reminder in
                EditReminderView(reminder: reminder)
                    .environment(\.managedObjectContext, viewContext)
            }
        }
    }

    private func deleteReminders(offsets: IndexSet) {
        withAnimation {
            offsets.map { reminders[$0] }.forEach(viewContext.delete)
            try? viewContext.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
