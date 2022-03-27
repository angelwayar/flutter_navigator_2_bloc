part of 'navegation_bloc.dart';

class NavegationState extends Equatable {
  final List<Page> pages;
  final Widget? errorView;
  final ActionPage typeView;

  const NavegationState({
    required this.pages,
    required this.typeView,
    this.errorView,
  });

  NavegationState copyWith({
    List<Page>? pages,
    Widget? errorView,
    ActionPage? typeView,
  }) {
    return NavegationState(
      pages: pages ?? this.pages,
      typeView: typeView ?? this.typeView,
      errorView: errorView ?? this.errorView,
    );
  }

  @override
  List<Object?> get props => [pages, typeView, errorView];
}
