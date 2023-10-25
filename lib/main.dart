import 'package:adviser/2_application/core/services/theme_service.dart';
import 'package:adviser/2_application/pages/advice/advice_page.dart';
import 'package:adviser/injection.dart';
import 'package:adviser/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    ChangeNotifierProvider<ThemeService>(
      create: (context) => ThemeService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (_, ThemeService themeService, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Advicer App',
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const AdviserPageWrapperProvider(),
        );
      },
    );
  }
}
