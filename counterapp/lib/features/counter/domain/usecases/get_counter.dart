import '../repositories/counter_repository.dart';

class GetCounter {
  final CounterRepository repository;
  GetCounter({required this.repository});

  Future<int> call() async {
    return await repository.getCounter();
  }
}
