import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigator_2/navigator/bloc/navegation_bloc.dart';
import 'package:navigator_2/navigator/route_page_manager.navigator.dart';
import 'package:navigator_2/pages/page_3.page.dart';
import 'package:navigator_2/pages/widgets/popup.widget.dart';

class Page_1 extends StatelessWidget {
  const Page_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nav = context.read<NavegationBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //TODO: Se debe enviar a la página 2
                print('PResss');
                _nav.add(
                  NavegationPush(
                    page: ViewPage(
                      page: Popup(),
                      actionPage: ActionPage.ErrorMessage,
                    ),
                  ),
                );
              },
              child: Text('popup'),
            ),
            ElevatedButton(
              onPressed: () {
                //TODO: Se debe enviar a la página 3
                _nav.add(
                  NavegationPush(
                    page: ViewPage(
                      page: Page_3(),
                      actionPage: ActionPage.PushPage,
                      path: Path.page_3,
                    ),
                  ),
                );
              },
              child: Text('Page 3'),
            ),
          ],
        ),
      ),
    );
  }
}
