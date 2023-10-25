import 'package:adviser/1_domain/entities/advice_entity.dart';
import 'package:adviser/1_domain/failures/failures.dart';
import 'package:adviser/1_domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceUsecase {
  final AdviceRepo adviceRepo;

  const AdviceUsecase({
    required this.adviceRepo,
  });
  Future<Either<Failure, AdviceEntity>> getAdvice() async =>
      adviceRepo.getAdviceFromDataSource();
}
