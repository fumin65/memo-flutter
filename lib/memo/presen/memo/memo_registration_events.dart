abstract class MemoRegistrationEvent {}

class SaveButtonPressed extends MemoRegistrationEvent {
  final String title;
  final String content;

  SaveButtonPressed(this.title, this.content);
}

class TitleChanged extends MemoRegistrationEvent {
  final String title;

  TitleChanged(this.title);
}
