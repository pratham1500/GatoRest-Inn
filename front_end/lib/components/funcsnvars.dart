import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool isSignedIn = false;
final FirebaseAuth auth = FirebaseAuth.instance;
String errorText = "";
String? uid;
String? userEmail;

String adminEmail = "";
List<String> adminIds = [];

List<String> rIds = [];
List<String> rEmails = [];
List<Timestamp> rStart = [];
List<Timestamp> rEnd = [];
List<bool> rActive = [];

List<String> qids = [];
List<String> qnames = [];
List<String> qemails = [];
List<String> queries = [];

Future<User?> registerWithEmailPassword(String email, String password) async {
  User? user;

  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    user = userCredential.user;

    if (user != null) {
      isSignedIn = true;
      uid = user.uid;
      userEmail = user.email;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      errorText = 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      errorText = 'An account already exists for that email.';
    }
  } catch (e) {
    errorText = e.toString();
  }

  return user;
}

Future<User?> signInWithEmailPassword(String email, String password) async {
  User? user;

  try {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredential.user;

    if (user != null) {
      isSignedIn = true;
      uid = user.uid;
      userEmail = user.email;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      errorText = 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      errorText = 'Wrong password provided.';
    }
  }

  return user;
}

Future<void> signOut() async {
  await auth.signOut();
  isSignedIn = false;
  uid = null;
  userEmail = null;
}
