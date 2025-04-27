import Foundation

enum TimePeriod: CaseIterable {
    case daily
    case weekly
    case monthly

    var titleText: String {
        switch self {
        case .daily:
            return "Today's Expenses"
        case .weekly:
            return "This Week's Expenses"
        case .monthly:
            return "This Month's Expenses"
        }
    }

    var expenseAmount: Double {
        // Dummy values, you can hook real data later
        switch self {
        case .daily:
            return 120.50
        case .weekly:
            return 560.75
        case .monthly:
            return 2200.10
        }
    }

    var budgetLimit: Double {
        // Dummy budget limits
        switch self {
        case .daily:
            return 300
        case .weekly:
            return 1500
        case .monthly:
            return 6000
        }
    }

    var percentageUsed: Int {
        Int((expenseAmount / budgetLimit) * 100)
    }

    func next() -> TimePeriod {
        let all = TimePeriod.allCases
        if let currentIndex = all.firstIndex(of: self) {
            let nextIndex = (currentIndex + 1) % all.count
            return all[nextIndex]
        }
        return .daily
    }
}
