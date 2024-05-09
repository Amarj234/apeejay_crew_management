part of 'appliedjobs_bloc.dart';

@immutable
abstract class AppliedjobsState {}

class AppliedjobsInitial extends AppliedjobsState {}
class Appliedjobsload extends AppliedjobsState {}
class Appliedjobsloded extends AppliedjobsState {
  final AppliedJob appliedJob;

  Appliedjobsloded(this.appliedJob);
}
class AppliedjobsError extends AppliedjobsState {
 final String error;

  AppliedjobsError(this.error);
}
