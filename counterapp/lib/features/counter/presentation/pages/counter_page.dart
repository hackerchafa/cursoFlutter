import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/text_styles.dart';
import '../cubit/counter_cubit.dart';
import '../widgets/counter_buttons_group.dart';


class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterApp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: cubit.reset,
            tooltip: 'Reiniciar',
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, count) {
            final label = count == 1 ? 'click' : 'clicks';
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('$count', style: AppTextStyles.counterNumber),
                const SizedBox(height: 8),
                Text(label, style: AppTextStyles.counterLabel),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: CounterButtonsGroup(
          onIncrement: () => context.read<CounterCubit>().increment(),
          onDecrement: () => context.read<CounterCubit>().decrement(),
          onReset: () => context.read<CounterCubit>().reset(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
