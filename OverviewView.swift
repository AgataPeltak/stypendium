import SwiftUI

struct OverviewView: View {
    @Binding var tasks: [TaskItem]

    var body: some View {
        NavigationView {
            List {
                ForEach(tasks.sorted(by: { $0.dueDate < $1.dueDate })) { task in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(task.title)
                                .font(.headline)
                            Text(task.subject.name)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text(task.dueDate.formatted(date: .abbreviated, time: .omitted))
                    }
                }
            }
            .navigationTitle("Wszystkie zadania")
        }
    }
}
