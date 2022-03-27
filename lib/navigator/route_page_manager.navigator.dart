import 'package:flutter/material.dart';

class Path {
  static const home = 'home';
  static const page_1 = 'page_1';
  static const page_2 = 'page_2';
  static const page_3 = 'page_3';
}

enum ActionPage {
  PushPage,
  RemovePage,
  ErrorMessage,
  SuccessMessage,
}

class ViewPage {
  final String? path;
  final Widget page;
  final ActionPage actionPage;

  const ViewPage({
    this.path,
    required this.page,
    required this.actionPage,
  });
}

/// Esta clase es la que se lanza a travéz del evento del bloc
class RouterPageManager {
  final ViewPage displayPage;
  static late List<Page> page = [];

  const RouterPageManager({required this.displayPage});

  //TODO: Esta clase se debe de encargar de manipular el stack
}
