# Guide: Using the Button Widgets

This guide explains how to use the pre-built and theme-aware button widgets provided in this package.

---

## 1. Philosophy

The button widgets are designed to be simple to use and automatically styled by the `MDTheme` provider. This ensures all buttons in your application are consistent by default.

- **Default Styling**: Buttons get their styles (colors, shapes, text styles) directly from the component tokens defined in your `MDTheme` (i.e., `md.com.button`).
- **Easy Customization**: For specific, one-off cases where a button needs to look different, you can use the `overrideConfig` parameter without having to create a new widget.

---

## 2. Available Buttons

This package includes the following button widgets:

- `PrimaryButton`: For high-emphasis actions. This is your standard, most commonly used button.
- `SecondaryButton`: For medium-emphasis actions, like secondary or alternative actions on a screen.
- `PrimaryButtonWithIcon`: A version of the primary button that includes a slot for an icon.

---

## 3. Basic Usage

Here is how to use each button in its most basic form.

### PrimaryButton

Use this for the main call-to-action on a screen.

```dart
PrimaryButton(
  onPressed: () => print('Primary Button Pressed!'),
  child: Text('Submit'),
),
```

### SecondaryButton

Use this for less prominent actions.

```dart
SecondaryButton(
  onPressed: () => print('Secondary Button Pressed!'),
  child: Text('Cancel'),
),
```

### PrimaryButtonWithIcon

This widget takes a `text` string and an `icon` widget. You can control the icon's position with `iconPosition`.

```dart
PrimaryButtonWithIcon(
  onPressed: () => print('Icon Button Pressed!'),
  text: 'Settings',
  icon: Icon(Icons.settings),
  iconPosition: ButtonIconPosition.left, // or .right
),
```

---

## 4. Common Properties

- `onPressed`: A `VoidCallback?` that is triggered when the button is tapped. If `null`, the button will be disabled.
- `child`: A `Widget` (usually a `Text` widget) to display inside the `PrimaryButton` and `SecondaryButton`.
- `text`: A `String` to display in the `PrimaryButtonWithIcon`.
- `icon`: A `Widget` (usually an `Icon`) to display in the `PrimaryButtonWithIcon`.
- `tooltip`: An optional `String` to show in a tooltip when the user long-presses the button.

---

## 5. Advanced Customization

While buttons are styled automatically by the theme, you can override almost any visual property for a specific instance using the `overrideConfig` parameter.

This parameter takes an `AppButtonConfig` object.

### AppButtonConfig Properties

You can override the following properties:

- `backgroundColor`: The button's background fill color.
- `foregroundColor`: The color of the button's content (the `child` or `text`/`icon`).
- `overlayColor`: The color of the ripple effect when the button is pressed.
- `elevation`: The height of the button's shadow.
- `padding`: The `EdgeInsetsGeometry` for the button's internal padding.
- `textStyle`: The `TextStyle` for the button's text.
- `side`: A `BorderSide` to create an outline (useful for `SecondaryButton`).
- `shape`: A `ShapeBorder` to define the button's shape (e.g., `RoundedRectangleBorder`).
- `iconGap`: The horizontal space between the icon and text in `PrimaryButtonWithIcon`.

### Example: Creating a Custom Button

Let's create a `PrimaryButton` with a custom background color, a circular shape, and different padding.

```dart
// Get the theme from context to access shape tokens
final md = MdTheme.of(context);

PrimaryButton(
  onPressed: () {},
  child: Text('Custom Style'),
  overrideConfig: AppButtonConfig(
    backgroundColor: Colors.green,
    shape: md.sha.shapeFull, // Use a circular shape from theme tokens
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
  ),
),
```

---

## 6. App-Wide Style Changes

The `overrideConfig` parameter is perfect for one-off customizations. 

If you want to change the style of **all** buttons across your app (e.g., making all `PrimaryButton`s green), you should do so by customizing the `ComponentTokens` when you create your `MdThemeToken`. 

For more details, refer to the `MDTHEME_GUIDE.md`.
