## Material Design System (AI Guide)

This package provides a composable Material 3 design system built from a small set of brand seeds. It outputs semantic `SystemTokens`, component tokens, and base tokens, with helpers to wire them into Flutter apps.

### Key Concepts
- **ReferenceTokens**: 9 seed colors you provide. Single source of truth.
- **ThemeGenerator**: Strategy to derive `SystemTokens` from seeds. Includes `StandardLightThemeGenerator` and `StandardDarkThemeGenerator`.
- **SystemTokens**: Full semantic color palette (primary/onPrimary, surface, outline, success, etc.). Used to drive UI.
- **Base Tokens**: Reusable primitives for spacing, typography, elevation, shapes, motion.
- **Component Tokens**: M3-aware tokens for app bars, buttons, cards, chips, dialogs, FAB, navigation, surfaces, text fields.
- **MdTheme & MdThemeWidget**: Inherited providers for tokens. Use `MdTheme.of(context)` to access all tokens.
- **Responsive Utilities**: `ResponsiveValue<T>`, `BreakpointConfiguration`, and spacing helpers that accept `BuildContext`.

### Installation
Add the package to your `pubspec.yaml` and import:

```dart
import 'package:material_design_system/material_design_system.dart';
```

### Minimal Setup
1) Create seeds
```dart
final seeds = ReferenceTokens(
  primary: const Color(0xFF1877F2),
  secondary: const Color(0xFF3B5998),
  tertiary: const Color(0xFF8B9DC3),
  neutral: const Color(0xFFF0F2F5),
  neutralVariant: const Color(0xFFDFE3EE),
  error: const Color(0xFFB3261E),
  success: const Color(0xFF4CAF50),
  warning: const Color(0xFFFFC107),
  info: const Color(0xFF2196F3),
);
```

2) Generate tokens
```dart
final light = StandardLightThemeGenerator().generate(seeds: seeds);
final dark = StandardDarkThemeGenerator().generate(seeds: seeds);

// Use one or both. This package exposes a single MdThemeToken today.
final theme = MdThemeToken(sys: light);
```

3) Provide theme and build ThemeData
```dart
return MdTheme(
  data: theme,
  child: MaterialApp(
    theme: ThemeData.from(
      colorScheme: SystemTokenToColorSchemeConverter.convert(theme.sys, Brightness.light),
      useMaterial3: true,
    ),
    home: const HomePage(),
  ),
);
```

### Accessing Tokens
```dart
final md = MdTheme.of(context);

// System colors
final Color primary = md.sys.primary;
final Color outline = md.sys.outline;

// Spacing
final double gap = md.space.medium(context);
final EdgeInsets padding = md.space.allMedium(context);

// Typography
final TextStyle title = md.typ.getTitleLarge(context);

// Shapes / Elevation
final BorderRadius radius = md.sha.borderRadiusMedium;
final List<BoxShadow> shadows = md.elevation.getShadows(3);

// Component tokens
final Color cardBg = md.com.card.backgroundColor;
```

### Responsive Utilities
- `SpacingTokens` values accept an optional `BuildContext` to resolve `ResponsiveValue` under the hood.
- Configure breakpoints via `BreakpointConfiguration` if needed.

```dart
// Default breakpoints: mobile=600, tablet=1200, desktop=1920
final double pad = md.space.medium(context); // resolves per screen width
```

### Converting Tokens to ThemeData
Use the converter to ensure Material widgets align to your generated palette.

```dart
final scheme = SystemTokenToColorSchemeConverter.convert(md.sys, Brightness.light);
final themeData = ThemeData.from(colorScheme: scheme, useMaterial3: true);
```

### Widgets
- `MDGaps`: constant gap widgets: `MDGaps.sGap`, `MDGaps.mGap`, etc.
- `AppDividers`: predefined `Divider` variants:
  - `AppDividers.standard(context)` → uses `md.sys.outline`
  - `AppDividers.thin(context)` → `md.sys.outlineVariant`, thickness 0.5
  - `AppDividers.subtle(context)` → `md.sys.outlineVariant`
  - `AppDividers.thick(context)` → `md.sys.outline`
  - `AppDividers.spaced(context)` → `md.sys.outline` with vertical margin
  - `AppDividers.accent(context)` → `md.sys.primary`

### Export Surface
Public API via `material_design_system.dart`:
- Theme: `md_theme.dart`, `md_theme_widget.dart`, `md_theme_token.dart`
- Converters: `system_token_to_color_scheme_converter.dart`
- Generators: `theme_generator.dart`, `standard_light_theme_generator.dart`, `standard_dark_theme_generator.dart`
- Responsive: `breakpoint_configuration.dart`, `font_scaling_configuration.dart`, `responsive_tokens.dart`, `responsive_value.dart`, `screen_size_detector.dart`
- Tokens: `system_tokens.dart`, `reference_tokens.dart`, base tokens (spacing, shape, elevation, motion, typography, text styles), component tokens (app bar, button, card, chip, dialog, fab, navigation, surface, text field)
- Widgets: `gap.dart`

### Example (Putting It Together)
```dart
class DemoCard extends StatelessWidget {
  const DemoCard({super.key});
  @override
  Widget build(BuildContext context) {
    final md = MdTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: md.com.card.backgroundColor,
        border: Border.all(color: md.com.card.borderColor),
        borderRadius: md.sha.borderRadiusMedium,
        boxShadow: md.elevation.getShadows(2),
      ),
      padding: md.space.allMedium(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Title', style: md.com.card.titleTextStyle),
          MDGaps.sGap,
          Text('Subtitle', style: md.com.card.subtitleTextStyle),
          AppDividers.standard(context),
          Text('Body', style: md.typ.getBodyMedium(context)),
        ],
      ),
    );
  }
}
```

### Notes for AI Agents
- Prefer `MdTheme.of(context)` to access all tokens consistently.
- Use `SystemTokenToColorSchemeConverter` when building `ThemeData`.
- Spacing helpers require `BuildContext` for responsive resolution.
- If you add new components, follow the pattern in `ComponentTokens.from` so styles derive from `SystemTokens` and `TypographyTokens`.

### Repository Structure (lib)
- `theme/`: theme providers and token container
- `tokens/`: core token models and generators
- `src/`: internal converters, generators, responsive utilities
- `widgets/`: opinionated widgets using tokens


