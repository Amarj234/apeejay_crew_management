part of 'rank_bloc.dart';

@immutable
abstract class RankState {
 final List<RankList> rankList;

  RankState({required this.rankList});
}

class RankInitial extends RankState {
  RankInitial({required super.rankList});
}
class RankLoad extends RankState {
  RankLoad({required super.rankList});
}




