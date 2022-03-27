part of 'navegation_bloc.dart';

abstract class NavegationEvent extends Equatable {
  const NavegationEvent();

  @override
  List<Object> get props => [];
}

class NavegationPush extends NavegationEvent {
  final ViewPage page;

  const NavegationPush({required this.page});

  @override
  List<Object> get props => [page];
}
