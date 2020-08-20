import 'dart:io';

import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:home_party/components/roundedbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        color: Colors.black,
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  //Do something with the user input.
                  _email = value;
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter your email',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  //Do something with the user input.
                  _password = value;
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter your password.',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  title: 'Log In',
                  color: Colors.blueAccent,
                  onPressed: () async {
                    try {
                      setState(() {
                        showSpinner = true;
                      });
                      // final user = await _auth.signInWithEmailAndPassword(
                      //     email: _email, password: _password);
                      // if (user != null) {
                      //   Navigator.pushNamed(context, 'dashboard_screen');
                      // }
                      Navigator.pushNamed(context, 'dashboard_screen');
                    } catch (e) {
                      authProblems errorType;
                      if (Platform.isAndroid) {
                        switch (e.message) {
                          case 'There is no user record corresponding to this identifier. The user may have been deleted.':
                            errorType = authProblems.UserNotFound;
                            showAuthError(
                                'There is no user record corresponding to this identifier. The user may have been deleted.');
                            break;
                          case 'The password is invalid or the user does not have a password.':
                            showAuthError(
                                'The password is invalid or the user does not have a password.');
                            errorType = authProblems.PasswordNotValid;
                            break;
                          case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
                            showAuthError(
                                'A network error (such as timeout, interrupted connection or unreachable host) has occurred.');
                            errorType = authProblems.NetworkError;
                            break;
                          // ...
                          default:
                            showAuthError('Email or password incorrect');
                        }
                      } else if (Platform.isIOS) {
                        switch (e.code) {
                          case 'Error 17011':
                            errorType = authProblems.UserNotFound;
                            showAuthError(
                                'There is no user record corresponding to this identifier. The user may have been deleted.');
                            break;
                          case 'Error 17009':
                            errorType = authProblems.PasswordNotValid;
                            showAuthError(
                                'The password is invalid or the user does not have a password.');
                            break;
                          case 'Error 17020':
                            errorType = authProblems.NetworkError;
                            showAuthError(
                                'A network error (such as timeout, interrupted connection or unreachable host) has occurred.');
                            break;
                          // ...
                          default:
                            showAuthError('Email or password incorrect');
                        }
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> showAuthError(String errorMessage) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(errorMessage),
        );
      },
    );
  }
}

enum authProblems { UserNotFound, PasswordNotValid, NetworkError }
