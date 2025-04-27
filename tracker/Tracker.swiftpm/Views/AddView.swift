import SwiftUI

struct AddView: View {
    @EnvironmentObject var userProfile: UserProfile

    @State private var selectedTimePeriod: TimePeriod = .daily
    @State private var showModal: Bool = false
    @State private var selectedCategory: ExpenseCategory = .food

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(selectedTimePeriod.titleText)
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                        Text("$\(selectedTimePeriod.expenseAmount, specifier: "%.2f")")
                            .font(.system(size: 34, weight: .bold))

                        Text("(\(selectedTimePeriod.percentageUsed)%)")
                            .font(.subheadline)
                            .foregroundColor(selectedTimePeriod.percentageUsed >= 100 ? .red : .gray)
                    }
                }

                Spacer()

                Button(action: {
                    withAnimation {
                        selectedTimePeriod = selectedTimePeriod.next()
                    }
                }) {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
            }
            .padding()

            Spacer()

            // Button to trigger adding an expense
            Button(action: {
                showModal = true
            }) {
                Text("Add Expense")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }

            Spacer()

            Text("More features coming soon...")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding()
            
            Spacer()
        }
        .navigationTitle("Expenses")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showModal) {
            AddExpenseModalView(isPresented: $showModal, selectedCategory: $selectedCategory)
        }
    }
}

#Preview {
    AddView()
        .environmentObject(UserProfile())
}
