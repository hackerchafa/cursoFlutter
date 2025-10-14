import '../../domain/repositories/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  int _value = 0;

  @override
  Future<int> getCounter() async {
    await Future.delayed(Duration(milliseconds: 100));
    return _value;
  }

  @override
  Future<void> saveCounter(int value) async {
    await Future.delayed(Duration(milliseconds: 50));
    _value = value;
  }
}
