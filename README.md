# Material Design System

A Flutter package for creating a design system based on Material Design tokens.

## Serialization

The `ReferenceTokens` class supports JSON serialization and deserialization.

### `fromJson`

You can create a `ReferenceTokens` instance from a JSON object:

```dart
final json = {
  "primary": "#6750A4",
  "secondary": "#625B71",
  "tertiary": "#7D5260",
  "neutral": "#939094",
  "neutralVariant": "#CAC4D0",
  "error": "#B3261E"
};

final tokens = ReferenceTokens.fromJson(json);
```

### `toJson`

You can also convert a `ReferenceTokens` instance to a JSON object:

```dart
final tokens = ReferenceTokens(
  primary: Color(0xFF6750A4),
  secondary: Color(0xFF625B71),
  tertiary: Color(0xFF7D5260),
  neutral: Color(0xFF939094),
  neutralVariant: Color(0xFFCAC4D0),
  error: Color(0xFFB3261E),
);

final json = tokens.toJson();
```
