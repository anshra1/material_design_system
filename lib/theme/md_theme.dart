import 'package:flutter/material.dart';
import 'package:material_design_system/tokens/system_tokens.dart';

/// The abstract base class for all MdTheme data providers.
///
/// This allows the MdTheme widget to seamlessly handle different types of
/// theme data, such as a single theme or a light/dark pair.
abstract class MdTheme {
  /// Resolves the correct [SystemTokens] to use based on the build context.
  const MdTheme();
  SystemTokens resolve(BuildContext context);
}
