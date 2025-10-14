import 'package:get_it/get_it.dart';

import '../features/counter/data/repositories/counter_repository_impl.dart';
import '../features/counter/domain/repositories/counter_repository.dart';
import '../features/counter/domain/usecases/get_counter.dart';
import '../features/counter/domain/usecases/save_counter.dart';
import '../features/counter/presentation/cubit/counter_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Repository
  sl.registerLazySingleton<CounterRepository>(() => CounterRepositoryImpl());

  // UseCases (pass repository instance)
  sl.registerLazySingleton<GetCounter>(() => GetCounter(repository: sl()));
  sl.registerLazySingleton<SaveCounter>(() => SaveCounter(repository: sl()));

  // Cubit
  sl.registerFactory<CounterCubit>(() => CounterCubit(getCounter: sl(), saveCounter: sl()));
}
