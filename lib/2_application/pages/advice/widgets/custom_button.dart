import 'package:adviser/2_application/pages/advice/bloc/advicer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return InkResponse(
      onTap: () {
        context.read<AdvicerBloc>().add(const AdviceRequestedEvent());
      },
      child: Material(
        elevation: 20.0,
        borderRadius: BorderRadius.circular(50.0),
        child: Container(
          decoration: BoxDecoration(
            color: themeData.colorScheme.secondary,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: Text(
              'Get Advice',
              style: themeData.textTheme.displayLarge,
            ),
          ),
        ),
      ),
    );
  }
}
