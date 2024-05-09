part of 'available_bloc.dart';

@immutable
abstract class AvailableEvent {}


class Getavljob extends AvailableEvent{


}



class JobSearch extends AvailableEvent{
  final String val;
  JobSearch(this.val);

}


class QuickApply extends AvailableEvent{
final num id;
final BuildContext context;
final AvailableJob availableJob;
  QuickApply(this.id,this.context, this.availableJob);

}