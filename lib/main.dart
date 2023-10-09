import 'package:flutter/material.dart';
import 'package:fooder_app/pages/main_page.dart';
import 'package:fooder_app/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FooderApp());
}

class FooderApp extends StatelessWidget {
  const FooderApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = FooderTheme.dark();

    return MaterialApp(
      title: 'Fooder Demo',
      home: const Home(),
      theme: theme,
    );
  }
}
