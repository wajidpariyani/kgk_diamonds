# KGK Diamonds

## Overview

The **KGK Diamonds** app is a Flutter application for browsing and filtering diamonds. The app allows users to apply filters to search for diamonds based on various attributes such as carat, shape, color, clarity, and lab. It integrates with **Hive for persistent storage** and uses the **BLoC (Business Logic Component) pattern** for state management.

## Features

### 1. **Filter Page**

- Users can filter diamonds based on:
    - Carat (From & To)
    - Lab
    - Shape
    - Color
    - Clarity
- "Search" button applies filters and navigates to the **Result Page**.

### 2. **Result Page**

- Displays the filtered diamonds in a **ListView**.
- Each item shows all diamond details.
- Users can **sort diamonds by**:
    - Final Price (Ascending/Descending)
    - Carat Weight (Ascending/Descending)
- Users can **add/remove diamonds** from the cart directly.

### 3. **Cart Page (Persistent Storage)**

- Displays all diamonds added to the cart.
- Users can remove diamonds from the cart.
- **Cart data is persistent** (data remains after app restart).
- Summary statistics:
    - **Total Carat**
    - **Total Price**
    - **Average Price**
    - **Average Discount**

## Technical Implementation

### 1. **State Management: BLoC**

- The app follows the **BLoC (Business Logic Component) pattern** to handle state efficiently.
- Ensures separation of concerns and better scalability.

### 2. **Data Storage: Hive**

- The dataset (100 diamonds) is stored as Dart models in `data.dart`.
- Cart data is persisted using **Hive**, a lightweight and fast NoSQL database for Flutter.

### 3. **Project Structure**

```
kgk_diamonds/
│── main.dart              # Entry point of the application
│── data.dart              # Contains diamond dataset as Dart models
│── blocs/
│   ├── filter/
│   │   ├── filter_bloc.dart     # Manages filtering logic
│   │   ├── filter_event.dart    # Defines filter events
│   │   ├── filter_state.dart    # Defines filter states
│   ├── cart/
│   │   ├── cart_bloc.dart       # Manages cart logic
│   │   ├── cart_event.dart      # Defines cart events
│   │   ├── cart_state.dart      # Defines cart states
│── screens/
│   ├── filter_page.dart   # UI for filtering diamonds
│   ├── result_page.dart   # UI for displaying filtered diamonds
│   ├── cart_page.dart     # UI for cart management
│── models/
│   ├── diamond.dart       # Diamond model class
│── utils/
│   ├── storage_helper.dart # Handles cart data persistence with Hive
│── components/
│   ├── diamond_card.dart  # Reusable widget for displaying diamond details
```

##
