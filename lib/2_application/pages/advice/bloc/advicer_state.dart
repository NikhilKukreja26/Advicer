part of 'advicer_bloc.dart';

sealed class AdvicerState extends Equatable {
  const AdvicerState();

  @override
  List<Object> get props => [];
}

final class AdvicerInitial extends AdvicerState {}

final class AdvicerStateLoading extends AdvicerState {}

final class AdvicerStateLoaded extends AdvicerState {
  final String advice;

  const AdvicerStateLoaded({
    required this.advice,
  });
  @override
  List<Object> get props => [advice];
}

final class AdvicerStateError extends AdvicerState {
  final String message;

  const AdvicerStateError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
