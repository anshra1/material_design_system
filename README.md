A Flutter package for creating a design system based on Material Design tokens.

## Overview

This package provides a set of tools to create and use a design system based on Material Design tokens. It allows you to define a color palette using `ReferenceTokens`, generate a full set of `SystemTokens` for light and dark themes, and apply them to your Flutter application.

## Getting Started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  material_design_system: <latest_version>
```

Then, run `flutter pub get`.

## Usage

Here's a basic example of how to use this package to create and apply a custom theme.

### 1. Define your reference colors

Create an instance of `ReferenceTokens` with your brand colors. These are the seed colors for generating your theme.

```dart
import 'package:flutter/material.dart';
import 'package:material_design_system/material_design_system.dart';

final referenceTokens = ReferenceTokens(
  primary: const Color(0xFF6750A4),
  secondary: const Color(0xFF625B71),
  tertiary: const Color(0xFF7D5260),
  neutral: const Color(0xFF939094),
  neutralVariant: const Color(0xFFCAC4D0),
  error: const Color(0xFFB3261E),
  success: const Color(0xFF4CAF50),
  warning: const Color(0xFFFFC107),
  info: const Color(0xFF2196F3),
);
```

### 2. Generate SystemTokens for light and dark themes

Use a `ThemeGenerator` to create `SystemTokens` for both light and dark themes from your `referenceTokens`.

```dart
const lightThemeGenerator = StandardLightThemeGenerator();
final lightSystemTokens = lightThemeGenerator.generate(seeds: referenceTokens);

const darkThemeGenerator = StandardDarkThemeGenerator();
final darkSystemTokens = darkThemeGenerator.generate(seeds: referenceTokens);
```

### 3. Create ColorScheme from SystemTokens

Use the `SystemTokenToColorSchemeConverter` to create a `ColorScheme` from your `SystemTokens`.

```dart
const converter = SystemTokenToColorSchemeConverter();
final lightColorScheme = converter.convert(lightSystemTokens, Brightness.light);
final darkColorScheme = converter.convert(darkSystemTokens, Brightness.dark);
```

### 4. Create ThemeData

Create a `ThemeData` object from the `ColorScheme`.

```dart
final lightTheme = ThemeData(colorScheme: lightColorScheme);
final darkTheme = ThemeData(colorScheme: darkColorScheme);
```

### 5. Apply the theme to your app

Use the `MDTheme` widget to provide the themes and tokens to your application.

```dart
void main() {
  runApp(
    MDTheme(
      lightTheme: MDThemeSet(
        themeData: lightTheme,
        systemTokens: lightSystemTokens,
        componentTokens: ComponentTokens.from(system: lightSystemTokens, typography: TypographyTokens.from()),
      ),
      darkTheme: MDThemeSet(
        themeData: darkTheme,
        systemTokens: darkSystemTokens,
        componentTokens: ComponentTokens.from(system: darkSystemTokens, typography: TypographyTokens.from()),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Design System Demo',
      theme: MDTheme.of(context).themeData,
      home: const MyHomePage(),
    );
  }
}
```

### 6. Use tokens in your widgets

You can access the tokens from the `MDTheme` widget anywhere in your widget tree.

```dart
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final systemTokens = MDTheme.of(context).systemTokens;
    final componentTokens = MDTheme.of(context).componentTokens;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Design System'),
        backgroundColor: componentTokens.appBar.backgroundColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Primary Color',
              style: TextStyle(color: systemTokens.primary),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Tokens

This package provides three types of tokens:

### ReferenceTokens

These are the seed colors for your theme. You should define your brand colors here.

### SystemTokens

These are the full set of semantic color tokens for your theme, generated from the `ReferenceTokens`. They include colors for primary, secondary, tertiary, surface, background, error, etc.

### ComponentTokens

These are tokens for specific components like `AppBar`, `Button`, `Card`, etc. They are derived from `SystemTokens`.