import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigator_2/pages/page_1.page.dart';
import 'package:navigator_2/navigator/bloc/navegation_bloc.dart';
import 'package:navigator_2/navigator/route_page_manager.navigator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nav = context.read<NavegationBloc>();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //* Se esta haciendo un push de la página que se quiere mostrar en pantalla
            _nav.add(
              const NavegationPush(
                page: ViewPage(
                  page: Page_1(),
                  actionPage: ActionPage.PushPage,
                  path: Path.page_1,
                ),
              ),
            );
          },
          child: Text('Page 1'),
        ),
      ),
    );
  }
}
