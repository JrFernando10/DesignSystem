
# Design System MVP

This project showcases a design system for typography, color, and spacing, developed using Xcode 13.2.1. It's designed as a Minimum Viable Product (MVP) to demonstrate the use of various design elements.

## Typography

- The design system includes a variety of font styles that can be easily utilized throughout the app.
- Fonts are defined as enums, allowing for a clean and maintainable way to access and use them in your UI components.

### Example of Font Usage
```swift
let titleLabel = UILabel()
titleLabel.font = Font.nunitoExtraBold.font(size: 24)
titleLabel.text = "Title Text"
```

## Color

- The design system provides a set of predefined colors to maintain a consistent look and feel across the application.
- Colors can be accessed through an enum, making it straightforward to apply them to UI elements.

### Example of Color Usage
```swift
let view = UIView()
view.backgroundColor = .ds(.grey200)
```

## Spacing

- Spacing tokens are defined to ensure consistent spacing throughout the UI.
- Spacing can be applied using the defined enums for various layout needs.

### Example of Spacing Usage
```swift
let spacingValue = CGFloat.dsSpacing(.token200)
```

## Contribution

If you wish to contribute to this project, feel free to fork the repository and submit a pull request. All contributions are welcome!

For contributions or issues, please contact me via:
- Email: [fernandojuniior18@gmail.com](mailto:fernandojuniior18@gmail.com)
- LinkedIn: [Fernando Junior](https://www.linkedin.com/in/fernando-junior-5831ba170/)
