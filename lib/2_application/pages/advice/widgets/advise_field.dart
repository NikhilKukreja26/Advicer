import 'package:flutter/material.dart';

class AdviseField extends StatelessWidget {
  const AdviseField({
    super.key,
    required this.advise,
  });

  final String advise;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Material(
      elevation: 20.0,
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        decoration: BoxDecoration(
          color: themeData.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Text(
            ''' "$advise" ''',
            style: themeData.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
