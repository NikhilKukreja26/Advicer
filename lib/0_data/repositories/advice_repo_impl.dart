import 'package:dartz/dartz.dart';

import 'package:adviser/0_data/datasources/advice_remote_data_source.dart';
import 'package:adviser/0_data/exceptions/exceptions.dart';
import 'package:adviser/1_domain/entities/advice_entity.dart';
import 'package:adviser/1_domain/failures/failures.dart';
import 'package:adviser/1_domain/repositories/advice_repo.dart';

class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDataSource adviceRemoteDataSource;
  const AdviceRepoImpl({
    required this.adviceRemoteDataSource,
  });

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource() async {
    try {
      final result = await adviceRemoteDataSource.getRandomAdviceFromApi();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
