import 'package:flutter/material.dart';
import 'package:material_design_system/material_design_system.dart';
import 'package:material_design_system/src/theme_data_converter.dart';

void main() {
  // TODO: Source of input list not provided. Should I mock or will you supply it?
  // Using fallback seed colors for now. Replace with your brand's seed colors.
  final seedColors = SeedColors.fallback();

  final brandThemeData = BrandThemeData.fromSeeds(seedColors);

  runApp(MyApp(brandThemeData: brandThemeData));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.brandThemeData});

  final BrandThemeData brandThemeData;

  @override
  Widget build(BuildContext context) {
    return BrandTheme(
      data: brandThemeData,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Material Design System Demo',
            theme: ThemeDataConverter.toThemeData(brandThemeData.light),
            darkTheme: ThemeDataConverter.toThemeData(brandThemeData.dark),
            themeMode: ThemeMode.system,
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = BrandTheme.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Design System Showcase')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text('Theme Showcase', style: textTheme.headlineMedium),
          const SizedBox(height: 16.0),
          const Text(
            'This app demonstrates the theming capabilities of the custom '
            'design system. Default Flutter widgets are automatically styled '
            'by converting the system tokens into a ThemeData object.',
          ),
          const Divider(height: 32.0),
          _buildColorPalette(context),
          const Divider(height: 32.0),
          _buildWidgetExamples(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildColorPalette(BuildContext context) {
    final tokens = BrandTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color Palette (from BrandTheme.of(context))',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16.0),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            _ColorChip(name: 'Primary', color: tokens.primary),
            _ColorChip(name: 'On Primary', color: tokens.onPrimary),
            _ColorChip(name: 'Primary Container', color: tokens.primaryContainer),
            _ColorChip(name: 'On Primary Container', color: tokens.onPrimaryContainer),
            _ColorChip(name: 'Secondary', color: tokens.secondary),
            _ColorChip(name: 'On Secondary', color: tokens.onSecondary),
            _ColorChip(name: 'Tertiary', color: tokens.tertiary),
            _ColorChip(name: 'On Tertiary', color: tokens.onTertiary),
            _ColorChip(name: 'Background', color: tokens.background),
            _ColorChip(name: 'On Background', color: tokens.onBackground),
            _ColorChip(name: 'Surface', color: tokens.surface),
            _ColorChip(name: 'On Surface', color: tokens.onSurface),
            _ColorChip(name: 'Error', color: tokens.error),
            _ColorChip(name: 'On Error', color: tokens.onError),
          ],
        ),
      ],
    );
  }

  Widget _buildWidgetExamples(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Widget Examples', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16.0),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('This is a Card widget.'),
                const SizedBox(height: 8.0),
                const Text('Its background and text colors are derived from the theme.'),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {}, child: const Text('Text Button')),
                    const SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Elevated Button'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        const Chip(
          avatar: CircleAvatar(child: Text('A')),
          label: Text('This is a Chip'),
        ),
      ],
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
