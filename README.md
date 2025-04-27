# Tracker App

**Tracker App** is a personal finance app built using SwiftUI. It helps users keep track of their expenses, manage budgets, and add new expenses with ease. This app allows users to view their expenses by daily, weekly, or monthly categories and provides a clean, easy-to-use interface.

## Features

- **Home View**: Displays user information, account cards, budget progress bars, and a list of recent expenses.
- **Add Expense**: Users can add new expenses by selecting a category, entering a title, description, and amount.
- **Time Period Selector**: Toggle between daily, weekly, and monthly budget views.
- **Expense Categories**: Expenses are categorized by type (e.g., Housing, Food, Transport, Personal), with different icons and colors for each.
- **Responsive Design**: The app is designed to be responsive and is optimized for both iPhones and iPads.

## App Structure

### Main Components:

1. **Home View**:
   - Displays the user's name.
   - Swipable account cards that show account balances and bank details.
   - Progress bar showing the user's budget consumption.
   - List of recent expenses, which can be filtered by time.

2. **Add Expense View**:
   - Allows users to add a new expense by selecting a category, entering a title, description, and amount.
   - Provides a modal view to select the category of the expense.

### Expense Categories:

- **Housing**: Represented with a house icon, purple color.
- **Food**: Represented with a cart icon, orange color.
- **Transport**: Represented with a car icon, blue color.
- **Personal**: Represented with a person icon, pink color.

### Time Period Selector:
- Users can switch between **daily**, **weekly**, and **monthly** budget views using a button in the top right corner.

## Technologies Used

- **SwiftUI**: Framework for building the app's user interface.
- **Xcode**: The development environment used to build the app.

## Requirements

- iOS 14.0 or later.
- Xcode 12.0 or later.

## Installation

### Clone the repository:

```bash
git clone https://github.com/yourusername/TrackerApp.git
cd TrackerApp
