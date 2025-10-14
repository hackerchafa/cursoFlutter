import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/injection.dart' as di;
import '../../domain/usecases/get_counter.dart';
import '../../domain/usecases/save_counter.dart';


class CounterCubit extends Cubit<int> {
  final GetCounter _getCounter;
  final SaveCounter _saveCounter;

  CounterCubit({required GetCounter getCounter, required SaveCounter saveCounter})
      : _getCounter = getCounter,
        _saveCounter = saveCounter,
        super(0) {
    _load();
  }


  Future<void> _load() async {
    final value = await _getCounter.call();
    emit(value);
  }


  void increment() {
    final newVal = state + 1;
    emit(newVal);
    _saveCounter.call(newVal);
  }


  void decrement() {
    if (state <= 0) return;
    final newVal = state - 1;
    emit(newVal);
    _saveCounter.call(newVal);
  }


  void reset() {
    emit(0);
    _saveCounter.call(0);
  }
}
