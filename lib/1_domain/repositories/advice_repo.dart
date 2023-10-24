import 'package:adviser/1_domain/entities/advice_entity.dart';
import 'package:adviser/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class AdviceRepo {
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource();
}
