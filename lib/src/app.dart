import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_eccommerce/src/blocs/category_product/category_product_bloc.dart';
import 'package:flutter_mini_eccommerce/src/cubit/change_color_cubit.dart';

import 'blocs/blocs.dart';
import 'screen/screens.dart';

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
          create: (context) => ChangeColorCubit(),
        ),
      ],
      child: BlocBuilder<ChangeColorCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            theme: state,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        },
      ),
      // child: const MaterialApp(
      //   title: 'Flutter',
      //   debugShowCheckedModeBanner: false,
      //   home: SplashScreen(),
      // ),
    );
  }
}
