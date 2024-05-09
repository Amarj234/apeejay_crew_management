part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class GetChathis extends ChatEvent{


}
class SendMessage extends ChatEvent{
  final String val;

  SendMessage(this.val);

}
