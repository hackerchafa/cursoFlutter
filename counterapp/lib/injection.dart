import 'package:get_it/get_it.dart';

import 'features/counter/presentation/cubit/counter_cubit.dart';
import 'features/counter/domain/usecases/get_counter.dart';
import 'features/counter/domain/usecases/save_counter.dart';
import 'features/counter/data/repositories/counter_repository_impl.dart';
import 'features/counter/domain/repositories/counter_repository.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Repository
  // Repository (register under interface type)
  // create repository instance and register under interface
  final repo = CounterRepositoryImpl();
  getIt.registerLazySingleton<CounterRepository>(() => repo);

  // UseCases (explicit types) - create with repo instance to avoid early resolution
  final getCounterUC = GetCounter(repository: repo);
  final saveCounterUC = SaveCounter(repository: repo);
  getIt.registerLazySingleton<GetCounter>(() => getCounterUC);
  getIt.registerLazySingleton<SaveCounter>(() => saveCounterUC);

  // Cubit
  getIt.registerFactory<CounterCubit>(() => CounterCubit(getCounter: getIt<GetCounter>(), saveCounter: getIt<SaveCounter>()));
}
