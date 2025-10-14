import '../repositories/counter_repository.dart';

class SaveCounter {
  final CounterRepository repository;
  SaveCounter({required this.repository});

  Future<void> call(int value) async {
    return await repository.saveCounter(value);
  }
}
