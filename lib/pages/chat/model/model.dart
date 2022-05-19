// ignore_for_file: prefer_typing_uninitialized_variables, unused_field

class Users{
  String user;
  final isOnline;
  final img;
  final time;
  Users(this.user, this.isOnline, this.img, this.time);
  static List<Users> getUser() => [
    Users("Natnael", true, "https://picsum.photos/200/300", (DateTime.now())),
    Users("Fkadu", false, "https://picsum.photos/200/300", DateTime.now()),
    Users("Dawit", false, "https://picsum.photos/200/300", DateTime.now()),
    Users("Hailu", true, "https://picsum.photos/200/300", DateTime.now()),
    Users("Eyob", true, "https://picsum.photos/200/300", DateTime.now())
  ];
}