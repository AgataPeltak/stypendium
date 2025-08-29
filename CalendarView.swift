import SwiftUI

struct CalendarView: View {
    @Binding var tasks: [TaskItem]
    @State private var selectedDate = Date()

    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Wybierz dzień", selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                    .padding()

                List {
                    ForEach(tasks.filter { Calendar.current.isDate($0.dueDate, inSameDayAs: selectedDate) }) { task in
                        VStack(alignment: .leading) {
                            Text(task.title).font(.headline)
                            Text(task.subject.name).font(.caption).foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Kalendarz")
        }
    }
}
