import 'package:adviser/2_application/core/services/theme_service.dart';
import 'package:adviser/2_application/pages/advice/bloc/advicer_bloc.dart';
import 'package:adviser/2_application/pages/advice/widgets/advise_field.dart';
import 'package:adviser/2_application/pages/advice/widgets/custom_button.dart';
import 'package:adviser/2_application/pages/advice/widgets/error_message.dart';
import 'package:adviser/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AdviserPageWrapperProvider extends StatelessWidget {
  const AdviserPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdvicerBloc>(
      create: (context) => sl<AdvicerBloc>(),
      child: const AdvicePage(),
    );
  }
}

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
                child: BlocBuilder<AdvicerBloc, AdvicerState>(
                  builder: (context, state) {
                    if (state is AdvicerInitial) {
                      return Text(
                        'Your Advice is waiting for you!',
                        style: themeData.textTheme.displayLarge,
                        textAlign: TextAlign.center,
                      );
                    } else if (state is AdvicerStateLoading) {
                      return CircularProgressIndicator(
                        color: themeData.colorScheme.secondary,
                      );
                    } else if (state is AdvicerStateLoaded) {
                      return AdviseField(
                        advise: state.advice,
                      );
                    } else if (state is AdvicerStateError) {
                      return ErrorMessage(
                        message: state.message,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
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
