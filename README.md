# Employee Management App

This project is a SwiftUI-based Employee Management App that fetches employee data from an API, displays it in a list, and provides options to copy or delete employee records using modern SwiftUI features.

## Features

1. **Dynamic Employee List:**
   - Uses `List` and `AsyncImage` for displaying employee data.
   - Each employee cell includes their name, age, salary, and profile image.
2. **Network Integration:**
   - Fetches employee data from a mock API using `Combine` and `URLSession`.
   - Displays a `ProgressView` while data is loading.
3. **Long Press Gestures:**
   - Allows actions like copying and deleting employees using `confirmationDialog`.
4. **MVVM Architecture:**
   - Separate `NetworkManager` for API interactions.
   - ViewModel-driven state management using `ObservableObject`.

## Prerequisites

- **Xcode:** Version 14.0 or higher.
- **iOS Deployment Target:** iOS 15.0 or higher.

## Setup Instructions

1. **Clone the Repository:**
   ```bash
   git clone <repository-url>
   cd EmployeeManagementApp
   ```

2. **Open the Project:**
   - Launch `SwiftUICombine.xcodeproj` in Xcode.

3. **Update Dependencies (if any):**
   - Ensure Combine framework is included (it's part of Swift).

4. **Run the App:**
   - Select an iPhone or iPad simulator in Xcode.
   - Press `Cmd+R` or click the Run button to build and run the app.

## API Endpoint

The app fetches data from a mock API:

```plaintext
https://a00407a8-f46e-407e-b684-5d949532e7fc.mock.pstmn.io/api/v1/employees
```

Response Example:
```json
{
  "status": "success",
  "data": [
    {
      "id": 1,
      "employee_name": "Tiger Nixon",
      "employee_salary": 320800,
      "employee_age": 61,
      "profile_image": ""
    }
  ],
  "message": "Successfully! All records has been fetched."
}
```

## Code Structure

- **`ContentView`:** Entry point of the app.
- **`HomeView`:** Main view that integrates the employee list and loading indicator.
- **`EmployeeList`:** A subview displaying the list of employees.
- **`EmployeeCell`:** Custom cell for individual employee data.
- **`EmployeeViewModel`:** Handles business logic and API integration.
- **`NetworkManager`:** Provides reusable network calls using Combine.
- **Models:**
  - `EmployeeResponse`: Handles API response decoding.
  - `Employee`: Represents an individual employee.

## Additional Notes

- **Error Handling:**
  - Basic error handling is implemented in the `NetworkManager` using custom `NetworkError` enum.
- **State Management:**
  - The app uses `@State` and `@StateObject` for managing state within views.
- **System Requirements:**
  - Supports iPhone and iPad with adaptive layouts.

## Future Improvements

1. Implement advanced error handling and retry mechanisms.
2. Add unit tests for `EmployeeViewModel` and `NetworkManager`.
3. Improve UI/UX with animations and better design.
4. Use persistent storage (e.g., CoreData or Realm) for offline support.

## Author

Developed by Harshit.
