import 'package:flutter/material.dart';
import 'package:material_design_system/material_design_system.dart';

void main() {
  // 1. Instantiate the desired generators.
  final lightGenerator = StandardLightThemeGenerator();
  final darkGenerator = StandardDarkThemeGenerator();

  // 2. Define the 9 seed colors for the LIGHT theme.
  final lightSeeds = ReferenceTokens(
    primary: const Color(0xFF1877F2), // Facebook Blue
    secondary: const Color(0xFF3B5998), // Chinese Blue
    tertiary: const Color(0xFF8B9DC3), // Ceil
    neutral: const Color(0xFFF0F2F5), // Athens Gray
    neutralVariant: const Color(0xFFDFE3EE), // Azureish White
    error: const Color(0xFFB3261E),
    success: const Color(0xFF4CAF50),
    warning: const Color(0xFFFFC107),
    info: const Color(0xFF2196F3),
  );

  // 4. Generate the SystemTokens for both light and dark themes.
  final lightSystemTokens = lightGenerator.generate(seeds: lightSeeds);

  // 5. Create a theme set data object using our new MdThemeSet class.
  final themeSet = MdThemeToken(sys: lightSystemTokens);

  runApp(MyApp(theme: themeSet));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.theme});

  final MdThemeToken theme;

  @override
  Widget build(BuildContext context) {
    // 6. Provide the theme set to the app using the new MdTheme provider.
    return MdTheme(
      data: theme,
      child: MaterialApp(
        title: 'Material Design System Example',
        // 7. Build ThemeData from ColorScheme converted from SystemTokens.
        theme: ThemeData.from(
          colorScheme: SystemTokenToColorSchemeConverter.convert(
            theme.sys,
            Brightness.light,
          ),
          useMaterial3: true,
        ),

        themeMode: ThemeMode.light,
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 8. Access all token groups via MdTheme.
    final md = MdTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: md.com.appBar.backgroundColor,
        foregroundColor: md.com.appBar.foregroundColor,
        titleTextStyle: md.com.appBar.titleTextStyle,
        surfaceTintColor: md.com.appBar.surfaceTintColor,
        shadowColor: md.com.appBar.shadowColor,
        title: const Text('MD System Showcase'),
      ),
      body: ListView(
        padding: EdgeInsets.all(md.space.medium(context)),
        children: [
          // System tokens demo
          Text('System Tokens', style: md.typ.getHeadlineSmall(context)),
          SizedBox(height: md.space.small(context)),
          Wrap(
            spacing: md.space.small(context),
            runSpacing: md.space.small(context),
            children: [
              _ColorChip(name: 'Primary', color: md.sys.primary),
              _ColorChip(name: 'On Primary', color: md.sys.onPrimary),
              _ColorChip(name: 'Success', color: md.sys.success),
              _ColorChip(name: 'On Success', color: md.sys.onSuccess),
              _ColorChip(name: 'Warning', color: md.sys.warning),
              _ColorChip(name: 'On Warning', color: md.sys.onWarning),
              _ColorChip(name: 'Info', color: md.sys.info),
              _ColorChip(name: 'On Info', color: md.sys.onInfo),
              _ColorChip(name: 'Background', color: md.sys.background),
              _ColorChip(name: 'On Background', color: md.sys.onBackground),
              _ColorChip(name: 'Surface', color: md.sys.surface),
              _ColorChip(name: 'On Surface', color: md.sys.onSurface),
              _ColorChip(name: 'Error', color: md.sys.error),
              _ColorChip(name: 'On Error', color: md.sys.onError),
            ],
          ),
          const Divider(height: 32.0),

          // Base tokens demo
          Text('Base Tokens', style: md.typ.getHeadlineSmall(context)),
          SizedBox(height: md.space.small(context)),

          // Typography
          Text('Typography: Headline Medium', style: md.typ.getHeadlineMedium(context)),
          SizedBox(height: md.space.small(context)),

          // Spacing + Shape + Elevation
          Container(
            padding: md.space.allMedium(context),
            decoration: BoxDecoration(
              color: md.sys.surface,
              borderRadius: md.sha.borderRadiusMedium,
              boxShadow: md.elevation.getShadows(3),
              border: Border.all(color: md.sys.outline),
            ),
            child: Text(
              'Container with spacing, shape, elevation',
              style: md.typ.getBodyMedium(context),
            ),
          ),
          SizedBox(height: md.space.medium(context)),

          // Motion
          _MotionDemo(
            duration: md.motion.durationMedium,
            curve: md.motion.curveStandard,
            color: md.sys.tertiary,
            onColor: md.sys.onTertiary,
          ),

          const Divider(height: 32.0),

          // Component tokens demo
          Text('Component Tokens', style: md.typ.getHeadlineSmall(context)),
          SizedBox(height: md.space.small(context)),

          // Card styled by component tokens
          Container(
            decoration: BoxDecoration(
              color: md.com.card.backgroundColor,
              borderRadius: md.sha.borderRadiusMedium,
              border: Border.all(color: md.com.card.borderColor),
            ),
            child: Padding(
              padding: md.space.allMedium(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Card Title', style: md.com.card.titleTextStyle),
                  SizedBox(height: md.space.small(context)),
                  Text(
                    'Card subtitle styled via component tokens',
                    style: md.com.card.subtitleTextStyle,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: md.space.medium(context)),

          // Button styled by component tokens
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  md.com.button.elevatedButtonBackgroundColor,
                ),
                foregroundColor: WidgetStatePropertyAll(
                  md.com.button.elevatedButtonForegroundColor,
                ),
                textStyle: WidgetStatePropertyAll(md.com.button.textStyle),
              ),
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: md.sys.tertiary,
        foregroundColor: md.sys.onTertiary,
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

class _MotionDemo extends StatefulWidget {
  const _MotionDemo({
    required this.duration,
    required this.curve,
    required this.color,
    required this.onColor,
  });

  final Duration duration;
  final Curve curve;
  final Color color;
  final Color onColor;

  @override
  State<_MotionDemo> createState() => _MotionDemoState();
}

class _MotionDemoState extends State<_MotionDemo> {
  bool _toggled = false;

  @override
  Widget build(BuildContext context) {
    final md = MdTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Motion: AnimatedContainer', style: md.typ.getTitleMedium(context)),
        SizedBox(height: md.space.small(context)),
        AnimatedContainer(
          duration: widget.duration,
          curve: widget.curve,
          width: _toggled ? 200 : 120,
          height: 48,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: md.sha.borderRadiusSmall,
          ),
          alignment: Alignment.center,
          child: Text('Tap to animate', style: TextStyle(color: widget.onColor)),
        ),
        SizedBox(height: md.space.small(context)),
        OutlinedButton(
          onPressed: () => setState(() => _toggled = !_toggled),
          child: const Text('Toggle'),
        ),
      ],
    );
  }
}
