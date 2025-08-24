part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomePageState extends PageState {}

class MainMenuPageState extends PageState {}

class LoginPageState extends PageState {}

class NotesPageState extends PageState {
  final Notes value;
  NotesPageState(this.value);

  @override
  List<Object?> get props => [value];
}

class RegisterPageState extends PageState {}
