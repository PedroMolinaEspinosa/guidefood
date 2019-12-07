import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/sign_in.dart';
import 'package:guidefood/src/styles/colores.dart';
import 'package:guidefood/src/styles/estilo.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // if (getAuth().currentUser() != null) {
    //   Navigator.pushReplacementNamed(context, "favoritos");
    // }
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50),
              _signInButton(),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF7C00EA),
              Color(0xFFEA0027),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return Container(
      decoration: BoxDecoration(
        color: white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              blurRadius: 10,
              spreadRadius: 2,
              color: black20,
              offset: Offset(0.0, 2.0))
        ],
        borderRadius: BorderRadius.circular(40),
      ),
      child: OutlineButton(
        splashColor: Colors.grey,
        onPressed: () async {
          await signInWithGoogle()
              .then((FirebaseUser user) => Navigator.pushReplacementNamed(
                  context, "favoritos",
                  arguments: user))
              .catchError((e) => print(e));

          // whenComplete(() {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) {
          //         return FavoritosPage();
          //       },
          //     ),
          //   );
          // });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        highlightElevation: 0,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage("assets/images/google_logo.png"),
                  height: 35.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
