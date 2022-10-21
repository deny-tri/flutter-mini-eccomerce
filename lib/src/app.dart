import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_eccommerce/src/blocs/blocs.dart';
import 'package:flutter_mini_eccommerce/src/cubit/cubits.dart';
import 'package:flutter_mini_eccommerce/src/screen/screens.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
        BlocProvider(
          create: (context) => ProductDetailBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryProductBloc(),
        ),
        BlocProvider(
          create: (context) => DarkThemeCubit(),
        ),
        BlocProvider(
          create: (context) => CheckLoginCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeColorProductCubit(),
        ),
      ],
      child: BlocBuilder<DarkThemeCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            theme: state,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
