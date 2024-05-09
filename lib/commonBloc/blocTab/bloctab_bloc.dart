
import 'package:bloc/bloc.dart';
import "package:meta/meta.dart";

part 'bloctab_event.dart';

part 'bloctab_state.dart';



class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  LandingPageBloc() : super(const LandingPageInitial(tabIndex: 0)) {
    on<LandingPageEvent>((event, emit) {
      if (event is TabChange) {
        emit(LandingPageInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
