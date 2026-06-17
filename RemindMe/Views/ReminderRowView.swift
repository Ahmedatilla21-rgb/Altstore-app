import SwiftUI

struct ReminderRowView: View {
    @ObservedRealmObject var reminder: ReminderEntity
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(reminder.title ?? "Untitled")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                if let description = reminder.description, !description.isEmpty {
                    Text(description)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
                
                if let dueDate = reminder.dueDate {
                    HStack(spacing: 4) {
                        Image(systemName: "calendar")
                            .font(.caption)
                        Text(formatDate(dueDate))
                            .font(.caption)
                    }
                    .foregroundColor(.blue)
                }
            }
            
            Spacer()
            
            Image(systemName: reminder.isCompleted ? "checkmark.circle.fill" : "circle")
                .font(.title2)
                .foregroundColor(reminder.isCompleted ? .green : .gray)
        }
        .contentShape(Rectangle())
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
