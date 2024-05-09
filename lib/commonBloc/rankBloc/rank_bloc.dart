import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../commonfun/api_request.dart';
import '../../model/rank_list_model.dart';

part 'rank_event.dart';
part 'rank_state.dart';

class RankBloc extends Bloc<RankEvent, RankState> {
  RankBloc() : super(RankInitial(rankList: [])) {
    on<GetRank>((event, emit) async {
      // TODO: implement event handler
      emit(RankInitial(rankList: []));
      try {
        var res = await Api().postReq({"category_id":event.id},"rank-list");
        RankListModel api = RankListModel.fromJson(jsonDecode(res!.body));

        emit(RankLoad( rankList: api.data!.rankList!));

      } catch (e) {

      }


    });
  }
}
