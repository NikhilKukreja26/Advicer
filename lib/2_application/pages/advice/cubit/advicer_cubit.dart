import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(const AdvicerInitial());

  Future<void> adviseRequested() async {
    emit(const AdvicerStateLoading());
    // executes the business logic
    // for example get and advise
    debugPrint('fake get advise triggered');
    await Future.delayed(const Duration(seconds: 3), () {});
    debugPrint('got advise');
    emit(const AdvicerStateLoaded(advice: 'fake advise to test cubit'));
    // emit(const AdvicerStateError(message: 'error message'));
  }
}
