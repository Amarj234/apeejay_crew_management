part of 'available_bloc.dart';

@immutable
abstract class AvailableState {}

class AvailableInitial extends AvailableState {}

class Availablejobload extends AvailableState {}
class jobdetailsload extends AvailableState {}

class AvailableLoded extends AvailableState {
final AvailableJob availableJob;

  AvailableLoded(this.availableJob);
}

class SearchJobLoded extends AvailableState {
final AvailableJob availableJob;
SearchJobLoded(this.availableJob);
}

class AvailableError extends AvailableState {
  final String error;

  AvailableError(this.error);
}

class AvailableSnac extends AvailableState {
  final String error;

  AvailableSnac(this.error);
}
