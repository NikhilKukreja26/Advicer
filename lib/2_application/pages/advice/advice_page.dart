import 'package:adviser/2_application/core/services/theme_service.dart';
import 'package:adviser/2_application/pages/advice/widgets/advise_field.dart';
import 'package:adviser/2_application/pages/advice/widgets/custom_button.dart';
import 'package:adviser/2_application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advicer',
          style: themeData.textTheme.displayLarge,
        ),
        actions: [
          Consumer<ThemeService>(
            builder: (_, ThemeService themeService, __) {
              return Switch.adaptive(
                value: themeService.isDarkModeOn,
                onChanged: (_) => themeService.toggleTheme(),
              );
            },
          ),
          //
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                  child: ErrorMessage(message: 'Oops Something went wrong!')
                  //     AdviseField(
                  //   advise: 'example advise - your day will be good!',
                  // )

                  //     CircularProgressIndicator(
                  //   color: themeData.colorScheme.secondary,
                  // )

                  // Text(
                  //   'Your Advice is waiting for you!',
                  //   style: themeData.textTheme.displayLarge,
                  //   textAlign: TextAlign.center,
                  // ),
                  ),
            ),
            const SizedBox(
              height: 200,
              child: Center(child: CustomButton()),
            ),
          ],
        ),
      ),
    );
  }
}
