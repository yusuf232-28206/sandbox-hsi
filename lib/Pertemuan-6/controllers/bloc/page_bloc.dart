import 'package:bloc/bloc.dart';
import 'package:flutter_app/Pertemuan-6/services/database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

enum Pages { home, mainmenu, login, notes }

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(HomePageState()) {
    on<GoToHomePage>((event, emit) => emit(HomePageState()));
    on<GoToMainMenuPage>((event, emit) => emit(MainMenuPageState()));
    on<GoToLoginPage>((event, emit) => emit(LoginPageState()));
    on<GoToNotesPage>((event, emit) => emit(NotesPageState(event.value)));
    on<GoToRegisterPage>((event, emit) => emit(RegisterPageState()));
  }
}
