import 'package:flutter/material.dart';
import 'package:material_design_system/generators/standard_dark_theme_generator.dart';
import 'package:material_design_system/generators/standard_light_theme_generator.dart';
import 'package:material_design_system/theme/md_theme_set.dart';
import 'package:material_design_system/converters/theme_data_converter.dart';
import 'package:material_design_system/theme/md_theme_widget.dart';
import 'package:material_design_system/tokens/material_base/reference_tokens.dart';
import 'package:material_design_system/tokens/reference_tokens.dart';
import 'package:material_design_system/tokens/system_tokens.dart';

void main() {
  // 1. Instantiate the desired generators.
  final lightGenerator = StandardLightThemeGenerator();
  final darkGenerator = StandardDarkThemeGenerator();

  // 2. Define the 9 seed colors for the LIGHT theme.
  final lightSeeds = ReferenceTokens(
    primary: const Color(0xFF6750A4),
    secondary: const Color(0xFF625B71),
    tertiary: const Color(0xFF7D5260),
    neutral: const Color(0xFF939094),
    neutralVariant: const Color(0xFF79747E),
    error: const Color(0xFFB3261E),
    success: const Color(0xFF2E7D32),
    warning: const Color(0xFFFFA000),
    info: const Color(0xFF1976D2),
  );

  // 3. Define the 9 seed colors for the DARK theme.
  final darkSeeds = ReferenceTokens(
    primary: const Color(0xFFD0BCFF),
    secondary: const Color(0xFFCCC2DC),
    tertiary: const Color(0xFFEFB8C8),
    neutral: const Color(0xFF939094),
    neutralVariant: const Color(0xFF79747E),
    error: const Color(0xFFF2B8B5),
    success: const Color(0xFF4CAF50),
    warning: const Color(0xFFFFC107),
    info: const Color(0xFF2196F3),
  );

  // 4. Generate the SystemTokens for both light and dark themes.
  final lightSystemTokens = lightGenerator.generate(seeds: lightSeeds);
  final darkSystemTokens = darkGenerator.generate(seeds: darkSeeds);

  // 5. Create a theme set data object using our new MdThemeSet class.
  final themeSet = MdThemeSet(
    light: lightSystemTokens,
    dark: darkSystemTokens,
  );

  runApp(MyApp(theme: themeSet));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.theme});

  final MdThemeSet theme;

  @override
  Widget build(BuildContext context) {
    // 6. Provide the theme set to the app using the new MdThemeWidget.
    return MdThemeWidget(
      data: theme,
      child: MaterialApp(
        title: 'Material Design System Example',
        // 7. Use the converter to create ThemeData for MaterialApp.
        theme: ThemeDataConverter.toThemeData(theme.light),
        darkTheme: ThemeDataConverter.toThemeData(theme.dark),
        themeMode: ThemeMode.system,
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 8. Access the design system tokens using the new MdThemeWidget.
    final SystemTokens tokens = MdThemeWidget.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MD System Showcase'),
        backgroundColor: tokens.primaryContainer,
        foregroundColor: tokens.onPrimaryContainer,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text('Color Palette', style: textTheme.headlineSmall),
          const SizedBox(height: 16.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              _ColorChip(name: 'Primary', color: tokens.primary),
              _ColorChip(name: 'On Primary', color: tokens.onPrimary),
              _ColorChip(name: 'Success', color: tokens.success),
              _ColorChip(name: 'On Success', color: tokens.onSuccess),
              _ColorChip(name: 'Warning', color: tokens.warning),
              _ColorChip(name: 'On Warning', color: tokens.onWarning),
              _ColorChip(name: 'Info', color: tokens.info),
              _ColorChip(name: 'On Info', color: tokens.onInfo),
              _ColorChip(name: 'Background', color: tokens.background),
              _ColorChip(name: 'On Background', color: tokens.onBackground),
              _ColorChip(name: 'Surface', color: tokens.surface),
              _ColorChip(name: 'On Surface', color: tokens.onSurface),
              _ColorChip(name: 'Error', color: tokens.error),
              _ColorChip(name: 'On Error', color: tokens.onError),
            ],
          ),
          const Divider(height: 32.0),
          Text('Standard Widgets', style: textTheme.headlineSmall),
          const SizedBox(height: 16.0),
          const Text(
            'These standard Flutter widgets are styled automatically '
            'because we provided the theme and darkTheme to MaterialApp.',
          ),
          const SizedBox(height: 16.0),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Standard Switch'),
                      Spacer(),
                      Switch(value: true, onChanged: null),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text('Standard Slider'),
                      Expanded(child: Slider(value: 0.5, onChanged: null)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: tokens.tertiary,
        foregroundColor: tokens.onTertiary,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ColorChip extends StatelessWidget {
  const _ColorChip({required this.name, required this.color});

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final onColor = color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    return Chip(
      label: Text(name, style: TextStyle(color: onColor)),
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: onColor.withOpacity(0.5)),
      ),
    );
  }
}