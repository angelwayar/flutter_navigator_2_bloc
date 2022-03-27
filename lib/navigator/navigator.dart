import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigator_2/navigator/bloc/navegation_bloc.dart';
import 'package:navigator_2/navigator/navigator_setting.navigator.dart';
import 'package:navigator_2/navigator/route_page_manager.navigator.dart';

/*
 * Esta clase debería de manejar el stack de páginas que se tiene dentro de la aplicación
 * Sería bueno tener una clase que me de el estado actual "Página que se esta mostrando" de la app
*/
class PageStack {
  final List<Page> pages;

  const PageStack({required this.pages});
}

/*
  * Esta clase me ayuda a manejar la entrada y salida del stack 
  * Sería bueno tener los siguientes metodos dentro de esta clase:
  * Push, Pop --> Este metodo puede llevar ciertas restrinciones 
*/

class NavigationRouterDelegate extends RouterDelegate<NavigatorSetting>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigatorSetting> {
  NavigationRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> _navigatorKey;

  // final RouterPageManager _pageManager = RouterPageManager();

  /// Key del navegador
  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  /// Este metedo maneja el stack de la navegación
  @override
  Widget build(BuildContext context) {
    final _nav = BlocProvider.of<NavegationBloc>(context);
    return BlocConsumer<NavegationBloc, NavegationState>(
      bloc: _nav,
      listener: (context, state) {
        if (state is NavegationState) {
          if (state.typeView == ActionPage.ErrorMessage &&
              state.errorView != null) {
            showDialog(
              context: context,
              builder: (_) => state.errorView!,
            );
          }
        }
      },
      builder: (context, state) {
        return Navigator(
          key: _navigatorKey,
          pages: [
            if (state is NavegationState) ...state.pages,
          ],
          onPopPage: (route, result) {
            RootBackButtonDispatcher();
            if (!route.didPop(result)) return false;
            return true;
          },
        );
      },
    );
  }

  @override
  Future<bool> popRoute() {
    // TODO: implement popRoute
    throw UnimplementedError();
  }

  /// Con este metodo se debe de modificar el stack de pages,
  /// usualmente este metodo se utiliza para web
  @override
  Future<void> setNewRoutePath(NavigatorSetting configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
