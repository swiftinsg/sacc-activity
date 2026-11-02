import SwiftUI

struct AddPointsView: View {
    @Binding var groups: [ActivityGroup]

    @State private var pointsToAdd: [String: Int] = [:]
    @State private var filterByAdding = false

    var body: some View {
        VStack {
            ScrollView(.vertical) {
                VStack {
                    ForEach(shownGroups) { group in
                        GroupBox {
                            HStack {
                                HStack {
                                    Text(group.groupName)
                                    Spacer()
                                    Text("\(group.points) Points")
                                }
                                .containerRelativeFrame(.horizontal, count: 5, span: 2, spacing: 0)
                                .padding(.trailing, 20)

                                HStack {
                                    TextField(
                                        "Points",
                                        value: bindingPointsToAdd(for: group.groupName),
                                        formatter: pointsFormatter
                                    )
                                    .multilineTextAlignment(.leading)
                                    .textFieldStyle(.roundedBorder)

                                    Button("+100") {
                                        withAnimation {
                                            add(points: 100, to: group.groupName)
                                        }
                                    }
                                }
                            }
                        }
                    }

                    if shownGroups.isEmpty {
                        ContentUnavailableView("No Groups", systemImage: "person.fill.questionmark")
                    }
                }
            }

            Divider()

            Button {
                withAnimation {
                    groups = groups.map(addingPoints)
                    pointsToAdd = [:]
                    filterByAdding = false
                }
            } label: {
                Text("Apply Points to ^[\(editedGroupCount) Group](inflect: true)")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(20)
        .toolbar {
            Button {
                filterByAdding.toggle()
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle" + (filterByAdding ? ".fill" : ""))
            }
            .accessibilityLabel(filterByAdding ? "Show all groups" : "Show edited groups")
        }
    }

    private var shownGroups: [ActivityGroup] {
        guard filterByAdding else { return groups }
        return groups.filter { pointsToAdd[$0.groupName, default: 0] != 0 }
    }

    private var editedGroupCount: Int {
        pointsToAdd.values.filter { $0 != 0 }.count
    }

    private var pointsFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }

    private func bindingPointsToAdd(for groupName: String) -> Binding<Int> {
        Binding {
            pointsToAdd[groupName, default: 0]
        } set: { newValue in
            pointsToAdd[groupName] = newValue
        }
    }

    private func add(points: Int, to groupName: String) {
        pointsToAdd[groupName, default: 0] += points
    }

    private func addingPoints(to group: ActivityGroup) -> ActivityGroup {
        var updatedGroup = group
        updatedGroup.points += pointsToAdd[group.groupName, default: 0]
        return updatedGroup
    }
}

#Preview {
    AddPointsView(groups: .constant((1...9).map {
        ActivityGroup(
            groupId: "group-\($0)",
            groupName: "Group \($0)",
            points: .random(in: 1...40) * 100
        )
    }))
}
