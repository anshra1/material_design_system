## Button System Specification

### Goals
- Centralize all visual styling and behavior knobs in a single configuration object (`AppButtonConfig`).
- Make public widgets (e.g., `PrimaryButton`) thin views that accept content and behavior only.
- Drive defaults from theming (`AppButtonThemes`), allow opt-in overrides via `overrideConfig`.

### Button Types
- Primary (high emphasis)
- Secondary (medium emphasis)
- Tertiary / Text (low emphasis) — optional future
- Destructive — optional variant per type

### Configuration Model (`AppButtonConfig`)
- backgroundColor: Color?
- foregroundColor: Color?
- overlayColor: Color?
- elevation: double?
- padding: EdgeInsetsGeometry?
- textStyle: TextStyle?
- side: BorderSide?
- shape: ShapeBorder?
- iconGap: double? (space between icon and text)

Rules:
- Widgets do not define styling fields; they rely on `AppButtonConfig`.
- Missing values cascade: overrideConfig → theme factory (`AppButtonThemes`) → Material defaults.

### Theme Factories (`AppButtonThemes`)
- `primary(context)`: high-emphasis defaults
- `secondary(context)`: medium-emphasis defaults
- Provide sensible defaults for `iconGap`, `shape`, and `textStyle` from ThemeData.

### Widget API (`PrimaryButton`)
- Props: onPressed, text (or child), icon, iconPosition, tooltipText, size, overrideConfig.
- No visual styling props on the widget. All styling flows from config/theme.
- Precedence: overrideConfig > theme base.

### Material Integration
- Build `ButtonStyle` using `MaterialStateProperty.*`.
- Map `AppButtonConfig` values to the corresponding style fields.

### Migration Guidance
- Remove old styling params from widgets. Use `overrideConfig` instead.
- If a styling need is missing, add it to `AppButtonConfig` and set its defaults in `AppButtonThemes`.

### Future Considerations
- Loading state (progress indicator placement, min width)
- Size variants (small/medium/large) via presets in themes
- Accessibility tap target enforcement (min size)
- Icon-only buttons via the same config model


