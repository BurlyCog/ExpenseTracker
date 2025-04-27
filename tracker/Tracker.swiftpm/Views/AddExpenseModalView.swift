import SwiftUI

struct AddExpenseModalView: View {
    @Binding var isPresented: Bool
    @Binding var selectedCategory: ExpenseCategory
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var amount: String = ""

    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Add Expense")
                    .font(.title2)
                    .bold()

                // Category Picker
                Picker("Select Category", selection: $selectedCategory) {
                    ForEach(ExpenseCategory.allCases, id: \.self) { category in
                        Text(category.title).tag(category)
                    }
                }
                .pickerStyle(MenuPickerStyle())

                // Title Text Field
                TextField("Expense Title", text: $title)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                // Description Text Field
                TextField("Description", text: $description)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                // Amount Text Field
                TextField("Amount", text: $amount)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                // Submit Button
                Button(action: {
                    // Call an action to save the expense
                    print("Expense Added: \(title), \(description), $\(amount) in category \(selectedCategory.title)")
                    isPresented = false // Close modal after submitting
                }) {
                    Text("Add Expense")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
            .frame(maxWidth: 400)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 20)
            .padding(.top)
        }
        .background(Color.black.opacity(0.5).edgesIgnoringSafeArea(.all))
        .onTapGesture {
            // Close the modal when tapping outside
            isPresented = false
        }
    }
}

