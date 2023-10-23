import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdvicerStateLoading());
      // executes the business logic
      // for example get and advise
      debugPrint('fake get advise triggered');
      await Future.delayed(const Duration(seconds: 3), () {});
      debugPrint('got advise');
      emit(const AdvicerStateLoaded(advice: 'fake advise to test bloc'));
      emit(const AdvicerStateError(message: 'error message'));
    });
  }
}
