import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userProfile: UserProfile

    @State private var selectedAccountIndex = 0
    @State private var selectedBudgetType: BudgetType = .daily

    let accounts: [Account] = Account.sampleAccounts
    let expenses: [Expense] = Expense.sampleExpenses

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            // Hello {username}
            Text("Hello, \(userProfile.username.isEmpty ? "User" : userProfile.username)!")
                .font(.title2)
                .bold()
                .padding(.horizontal)

            // Account Cards with Swipe Indicator
            VStack(spacing: 15) {
                TabView(selection: $selectedAccountIndex) {
                    ForEach(accounts.indices, id: \.self) { index in
                        AccountCardView(account: accounts[index])
                            .padding(.horizontal)
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 200)

                // Swipe Indicator (Dynamic Dots)
                HStack(spacing: 8) {
                    ForEach(accounts.indices, id: \.self) { index in
                        Circle()
                            .fill(index == selectedAccountIndex ? Color.blue : Color.gray.opacity(0.5))
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.top, 5)
            }
            .padding(.top)

            // Budget Section
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("\(selectedBudgetType.title) Budget")
                        .font(.title3)
                        .bold()

                    Spacer()

                    Button(action: {
                        withAnimation {
                            selectedBudgetType = selectedBudgetType.next()
                        }
                    }) {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.title3)
                            .foregroundColor(.blue)
                    }
                }

                BudgetProgressView(currentExpense: 750, budgetLimit: selectedBudgetType.budgetLimit)
            }
            .padding(.horizontal)

            // Recent Expenses Section Title
            Text("Recent Expenses")
                .font(.title3)
                .bold()
                .padding(.horizontal)

            // Expense List (Scrollable)
            ScrollView {
                ExpenseListView(expenses: expenses)
                    .padding(.horizontal)
            }
            .frame(maxHeight: .infinity) // Expense list scrolls independently
        }
        .padding(.top)
        .background(Color.white)
    }
}

#Preview {
    HomeView()
        .environmentObject(UserProfile())
}
