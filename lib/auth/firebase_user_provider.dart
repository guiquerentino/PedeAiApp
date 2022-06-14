import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class PedeAiFirebaseUser {
  PedeAiFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

PedeAiFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PedeAiFirebaseUser> pedeAiFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<PedeAiFirebaseUser>((user) => currentUser = PedeAiFirebaseUser(user));
