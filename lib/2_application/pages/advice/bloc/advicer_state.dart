part of 'advicer_bloc.dart';

sealed class AdvicerState extends Equatable {
  const AdvicerState();

  @override
  List<Object> get props => [];
}

final class AdvicerInitial extends AdvicerState {
  const AdvicerInitial();

  @override
  String toString() => 'AdvicerInitial()';
}

final class AdvicerStateLoading extends AdvicerState {
  const AdvicerStateLoading();

  @override
  String toString() => 'AdvicerStateLoading()';
}

final class AdvicerStateLoaded extends AdvicerState {
  final String advice;

  const AdvicerStateLoaded({
    required this.advice,
  });

  @override
  List<Object> get props => [advice];

  @override
  String toString() => 'AdvicerStateLoaded(advice: $advice)';
}

final class AdvicerStateError extends AdvicerState {
  final String message;

  const AdvicerStateError({
    required this.message,
  });

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'AdvicerStateError(message: $message)';
}
