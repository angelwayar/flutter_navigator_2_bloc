import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:navigator_2/pages/home.page.dart';
import 'package:navigator_2/navigator/route_page_manager.navigator.dart';
part 'navegation_event.dart';
part 'navegation_state.dart';

class NavegationBloc extends Bloc<NavegationEvent, NavegationState> {
  NavegationBloc()
      : super(
          NavegationState(
            pages: [
              MaterialPage(
                child: HomePage(),
              ),
            ],
            typeView: ActionPage.PushPage,
          ),
        ) {
    on<NavegationPush>(_navegation);
  }

  _navegation(NavegationPush event, Emitter<NavegationState> emit) {
    if (state is NavegationState) {
      print(
          'La cantidad de páginas que se encuentran en el stack ${state.pages.length + 1}');

      if (event.page.actionPage == ActionPage.ErrorMessage) {
        emit(
          state.copyWith(
            typeView: event.page.actionPage,
            errorView: event.page.page,
          ),
        );
      } else {
        emit(
          state.copyWith(
            pages: [
              ...state.pages,
              MaterialPage(child: event.page.page),
            ],
            typeView: event.page.actionPage,
          ),
        );
      }
    }
  }
}
