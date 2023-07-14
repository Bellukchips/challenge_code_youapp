import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_test/application/observer/bloc_observer.dart';
import 'package:youapp_test/application/register/register_bloc.dart';
import 'package:youapp_test/injection.dart';

import 'presentation/core/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => getIt<RegisterBloc>(),
      )
    ],
    child: const App(),
  ));
}
