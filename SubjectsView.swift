import SwiftUI

struct SubjectsView: View {
    @Binding var subjects: [Subject]
    @Binding var tasks: [TaskItem]
    @State private var subjectName = ""
    @State private var selectedColor = "Blue"
    
    let colors = ["Red", "Green", "Blue", "Orange", "Purple"]

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Dodaj przedmiot")) {
                        TextField("Nazwa przedmiotu", text: $subjectName)
                        Picker("Kolor", selection: $selectedColor) {
                            ForEach(colors, id: \.self) { color in
                                Text(color)
                            }
                        }
                        Button("Dodaj") {
                            let newSubject = Subject(name: subjectName, color: selectedColor)
                            subjects.append(newSubject)
                            subjectName = ""
                        }
                        .disabled(subjectName.isEmpty)
                    }
                }
                
                List {
                    ForEach(subjects) { subject in
                        NavigationLink(destination: SubjectDetailView(subject: subject, tasks: $tasks)) {
                            HStack {
                                Circle()
                                    .fill(Color(subject.color))
                                    .frame(width: 12, height: 12)
                                Text(subject.name)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        subjects.remove(atOffsets: indexSet)
                    }
                }
            }
            .navigationTitle("Przedmioty")
        }
    }
}
