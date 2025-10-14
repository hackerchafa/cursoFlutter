import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/counter/presentation/cubit/counter_cubit.dart';
import 'features/counter/presentation/pages/counter_page.dart';
import 'injection.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CounterCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CounterApp',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        home: const CounterPage(),
      ),
    );
  }
}
