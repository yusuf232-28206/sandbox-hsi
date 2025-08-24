part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GoToHomePage extends PageEvent {}

class GoToMainMenuPage extends PageEvent {}

class GoToLoginPage extends PageEvent {}

class GoToNotesPage extends PageEvent {
  final Notes value;
  GoToNotesPage(this.value);

  @override
  List<Object?> get props => [value];
}

class GoToRegisterPage extends PageEvent {}
