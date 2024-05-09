part of 'appliedjobs_bloc.dart';

@immutable
abstract class AppliedjobsEvent {}


class GetappliedJob extends AppliedjobsEvent{

}
class QuickRemove extends AppliedjobsEvent{
final num id;
final AppliedJob appliedJob;

  QuickRemove(this.id, this.appliedJob);
}
