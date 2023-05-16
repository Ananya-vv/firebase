import 'package:firebase/image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class table extends StatefulWidget {
  const table({Key? key}) : super(key: key);

  @override
  State<table> createState() => _tableState();
}

class _tableState extends State<table> {

  final TextEditingController mail = TextEditingController();
  final TextEditingController pass = TextEditingController();
  Future<String?> login(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Success';
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      }
      else if (e.code == 'wrong-password') {
        return 'Wrong password provided for thet user';
      }
      else {
        return e.message;
      }
    }
    catch (e) {
      return e.toString();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: mail,
              decoration: InputDecoration(border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
                icon: Icon(Icons.mail)),),
            SizedBox(height: 10,),
            TextField(
              controller: pass,
              decoration: InputDecoration(border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
                icon: Icon(Icons.lock)),),
            SizedBox(height: 10,),
            TextButton(onPressed: () {login(email: mail.text, password: pass.text).then((value) =>
                Navigator.push(context, MaterialPageRoute(builder: (context)=>image())));},
              child: Text('submit', style: TextStyle(color: Colors.white),),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black)),),
          ],
        ),
      ),
    );
  }
}
