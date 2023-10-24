part of 'advicer_cubit.dart';

sealed class AdvicerCubitState extends Equatable {
  const AdvicerCubitState();

  @override
  List<Object> get props => [];
}

final class AdvicerInitial extends AdvicerCubitState {
  const AdvicerInitial();

  @override
  String toString() => 'AdvicerInitial()';
}

final class AdvicerStateLoading extends AdvicerCubitState {
  const AdvicerStateLoading();

  @override
  String toString() => 'AdvicerStateLoading()';
}

final class AdvicerStateLoaded extends AdvicerCubitState {
  final String advice;

  const AdvicerStateLoaded({
    required this.advice,
  });

  @override
  List<Object> get props => [advice];

  @override
  String toString() => 'AdvicerStateLoaded(advice: $advice)';
}

final class AdvicerStateError extends AdvicerCubitState {
  final String message;

  const AdvicerStateError({
    required this.message,
  });

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'AdvicerStateError(message: $message)';
}
