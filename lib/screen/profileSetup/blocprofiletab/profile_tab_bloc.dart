
import "package:bloc/bloc.dart" show Bloc;
import 'package:meta/meta.dart';

part 'profile_tab_event.dart';
part 'profile_tab_state.dart';

class ProfileTabBloc extends Bloc<ProfileTabEvent, ProfileTabState> {
  ProfileTabBloc() : super(const ProfileTabInitial(tabIndex: 0)) {
    on<ProfileTabEvent>((event, emit) {
      // TODO: implement event handler
      if (event is TabChange) {
        emit(ProfileTabInitial(tabIndex: event.tabIndex));
      }

    });
  }
}
