import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  User? user;

  User? get _user{
    return user;
  }

AuthService(){
  firebaseAuth.authStateChanges().listen(authStateChangeSteamListner);
}

Future<bool> login(String email,String Password) async{
  try {
    final Cridential=await firebaseAuth.signInWithEmailAndPassword(email: email, password: Password);
    if (Cridential.user!= null){
      user=Cridential.user;
      return true;
    }
  } catch (e) {
    print(e);
  }
  return false;
}

Future<bool>singUp(String email,String password)async{
  try {
    final cridential=await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    if (cridential.user!= null) {
      user = cridential.user;
      return true;
    }
  } catch (e) {
    print(e);
  }
  return false;
}

Future<bool>logout()async{
  try {
    await firebaseAuth.signOut();
    return true;
  } catch (e) {
    print(e);
  }
  return false;
}

void authStateChangeSteamListner(User? _user){
  if (_user!=null) {
    user=_user;
  }
  else{
    user=null;
  }
}
}