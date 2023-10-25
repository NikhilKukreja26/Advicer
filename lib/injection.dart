import 'package:adviser/0_data/datasources/advice_remote_data_source.dart';
import 'package:adviser/0_data/repositories/advice_repo_impl.dart';
import 'package:adviser/1_domain/repositories/advice_repo.dart';
import 'package:adviser/1_domain/usecases/advice_usecase.dart';
import 'package:adviser/2_application/pages/advice/bloc/advicer_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance; //* sl == Service Locator

Future<void> init() async {
  //! Application Layer
  // * Factory = Every time a new/fresh instance of that class
  sl.registerFactory<AdvicerBloc>(() => AdvicerBloc(adviceUsecase: sl()));

  // ! Domain Layer
  sl.registerFactory<AdviceUsecase>(() => AdviceUsecase(adviceRepo: sl()));

  // ! Data Layer
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDataSource: sl()));

  sl.registerFactory<AdviceRemoteDataSource>(
      () => AdviceRemoteDataSourceImpl(client: sl()));

  // ! External
  sl.registerFactory<http.Client>(() => http.Client());
}
