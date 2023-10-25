import 'package:adviser/1_domain/entities/advice_entity.dart';
import 'package:adviser/1_domain/failures/failures.dart';
import 'package:adviser/1_domain/usecases/advice_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

const generalFailureMessage = 'Oops, something gone wrong. Please try again!';
const serverFailureMessage = 'Oops, API Error. please try again!';
const cacheFailureMessage = 'Oops, cache failed. Please try again!';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  final AdviceUsecase adviceUsecase;
  AdvicerBloc({required this.adviceUsecase}) : super(const AdvicerInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(const AdvicerStateLoading());
      // executes the business logic
      // for example get and advise
      final failureOrAdviceEntity = await adviceUsecase.getAdvice();
      failureOrAdviceEntity.fold(
        (Failure failure) =>
            emit(AdvicerStateError(message: _mapFailureToMessage(failure))),
        (AdviceEntity adviceEntity) =>
            emit(AdvicerStateLoaded(advice: adviceEntity.advice)),
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
