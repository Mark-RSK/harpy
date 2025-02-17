import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harpy/components/components.dart';
import 'package:harpy/harpy_widgets/harpy_widgets.dart';
import 'package:provider/provider.dart';

/// Provides the currently used [HarpyTheme] to its descendants.
class HarpyThemeProvider extends StatelessWidget {
  const HarpyThemeProvider({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProxyProvider2<ThemeBloc, Brightness, HarpyTheme>(
      update: (_, themeBloc, systemBrightness, __) {
        return systemBrightness == Brightness.light
            ? themeBloc.state.lightHarpyTheme
            : themeBloc.state.darkHarpyTheme;
      },
      builder: (context, _) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: context.watch<HarpyTheme>().systemUiStyle,
        child: child,
      ),
    );
  }
}
