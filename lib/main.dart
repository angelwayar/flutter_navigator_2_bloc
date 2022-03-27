import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigator_2/navigator/bloc/navegation_bloc.dart';
import 'package:navigator_2/navigator/navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _nav = NavegationBloc();

  /*
   * Se esta inicializando esta variable con Home para que sea la primera vista que sea vea 
   */
  // final PageStack pages = PageStack(
  //   pages: [
  //     MaterialPage(
  //       child: HomePage(),
  //     ),
  //   ],
  // );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _nav,
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Router(
          routerDelegate: NavigationRouterDelegate(),
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}
