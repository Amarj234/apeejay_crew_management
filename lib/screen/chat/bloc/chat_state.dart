part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}
class ChatLoading extends ChatState {}
class ChatLoaded extends ChatState {
  final ChatHistory chatMessage;

  ChatLoaded(this.chatMessage);
}
class ChatError extends ChatState {
 final String error;

  ChatError(this.error);
}


class Isshowemoji extends ChatState {
  final bool show;

  Isshowemoji(this.show);
}
