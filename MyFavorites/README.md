# My Favorites - iOS TableView Application

A UIKit-based iOS application that displays favorite items across four categories using a custom UITableView implementation. This project demonstrates fundamental iOS development concepts including table views, custom cells, Auto Layout, and UI design principles.

## 📱 Features

- **4 Sections** with 5 items each:
  - 🎬 Favorite Movies
  - 🎵 Favorite Music (Albums/Artists/Songs)
  - 📚 Favorite Books
  - 🎓 Favorite University Courses

- **Custom Table View Cell** with:
  - Image View (SF Symbols)
  - Title Label
  - Subtitle Label
  - Review Label (multi-line text)

- **Custom Section Headers** with:
  - Emoji icons for each category
  - Bold, styled titles
  - Rounded background containers

- **Auto Layout** implementation:
  - Zero constraint warnings
  - Dynamic cell heights
  - Responsive to different screen sizes

## 🏗️ Project Structure

```
MyFavorites/
├── FavoriteItem.swift              # Data model for favorite items
├── FavoriteTableViewCell.swift     # Custom table view cell
├── ViewController.swift             # Main view controller with table view
├── AppDelegate.swift                # App delegate
├── SceneDelegate.swift              # Scene delegate
└── Base.lproj/
    └── Main.storyboard              # Storyboard (minimal setup)
```

## 🎨 Design Features

- **Visual Hierarchy**: Clear distinction between title, subtitle, and review text
- **Spacing**: Proper padding and margins (12-16pt)
- **Colors**: System colors that support light/dark mode
- **Typography**: Appropriate font sizes and weights
- **Polish**: Rounded corners, card-style cells, and custom section headers

## 📋 Requirements

- iOS 15.0 or higher
- Xcode 13.0 or higher
- Swift 5.5 or higher

## 🚀 Getting Started

1. Open `MyFavorites.xcodeproj` in Xcode
2. Select your target device or simulator
3. Build and run the project (⌘R)

## 🛠️ Implementation Details

### Custom Cell Layout

The `FavoriteTableViewCell` implements a custom layout with:

- **Image View**: 80x80 points, rounded corners, leading margin 16pt
- **Title Label**: Semibold, 18pt font, aligned with image top
- **Subtitle Label**: Regular, 14pt font, 4pt below title
- **Review Label**: Regular, 14pt font, 8pt below subtitle, multi-line

### Auto Layout Constraints

All constraints are properly configured with:
- Content hugging priorities set appropriately
- Content compression resistance priorities configured
- No constraint conflicts or warnings
- Dynamic height support using `UITableView.automaticDimension`

### Data Model

The `FavoriteItem` struct contains:
- `title`: String - Primary identifier
- `subtitle`: String - Secondary information
- `review`: String - Personal review (2-3 lines)
- `imageName`: String - SF Symbol name

## 📸 Screenshots

*Note: Screenshots should be added here showing:*
1. *Main table view with all sections*
2. *Close-up of a custom cell*
3. *Custom section headers*

## ✅ Assignment Checklist

### Code Quality
- [x] Clean, readable code with proper naming conventions
- [x] Comments for complex logic
- [x] No force unwrapping except where necessary
- [x] Proper use of optionals
- [x] No compiler warnings
- [x] No Auto Layout constraint warnings

### Project Structure
- [x] Organized file structure (separate files for models, cells, view controllers)
- [x] Custom cell in separate `.swift` file
- [x] Model classes/structs in separate file
- [x] Clear separation of concerns

### UITableView Implementation
- [x] `numberOfSections(in:)` → Returns 4
- [x] `tableView(_:numberOfRowsInSection:)` → Returns 5 for each section
- [x] `tableView(_:cellForRowAt:)` → Configures and returns custom cell
- [x] `tableView(_:titleForHeaderInSection:)` → Returns section titles
- [x] `tableView(_:heightForRowAt:)` → Uses `UITableView.automaticDimension`

### Custom Cell Design
- [x] Image View with proper constraints
- [x] Title Label with proper constraints
- [x] Subtitle Label with proper constraints
- [x] Review Label with proper constraints (multi-line)
- [x] All elements properly laid out

### Auto Layout Constraints
- [x] Valid constraints with zero warnings
- [x] Dynamic heights working correctly
- [x] Proper priority settings
- [x] Compression resistance configured
- [x] Content hugging priorities set

### Bonus Tasks
- [x] Custom section header views
- [x] Custom background color for headers
- [x] Larger, bold title text
- [x] Emoji icons for each category
- [x] Proper height and spacing

## 📚 Resources

- [Apple's UITableView Documentation](https://developer.apple.com/documentation/uikit/uitableview)
- [Auto Layout Guide](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/)
- [Human Interface Guidelines - Lists and Tables](https://developer.apple.com/design/human-interface-guidelines/lists-and-tables)
- [SF Symbols](https://developer.apple.com/sf-symbols/)

## 👤 Author

Nursultan Tolegen

## 📄 License

This project is created for educational purposes as part of an iOS development assignment.

---

**Built with ❤️ using UIKit and Swift**

