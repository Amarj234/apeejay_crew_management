part of 'rank_bloc.dart';

@immutable
abstract class RankEvent {
}


class GetRank extends RankEvent{
final String id;

  GetRank(this.id);

}
