import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        for i in 0..<5 {
            let newReminder = NSEntityDescription.insertNewObject(forEntityName: "ReminderEntity", into: viewContext) as! ReminderEntity
            newReminder.id = UUID()
            newReminder.title = "Sample Reminder \(i + 1)"
            newReminder.description = "This is a test reminder"
            newReminder.dueDate = Date().addingTimeInterval(Double(i * 86400))
            newReminder.isCompleted = false
            newReminder.createdDate = Date()
        }
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        return controller
    }()
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "RemindMe")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromTheParent = true
    }
}
