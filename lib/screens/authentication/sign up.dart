import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase/screens/authentication/loading%20screen.dart';
import 'package:flutter_firebase/services/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final Authservice _auth = Authservice();
  final _formKey = GlobalKey<FormState>();
  late String? email;
  late String? password;
  bool loading = false;
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? const loadingWidget()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        color: Colors.white70,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) =>
                                    value!.isEmpty ? 'Enter an Email' : null,
                                onChanged: ((value) {
                                  setState(() {
                                    email = value;
                                  });
                                }),
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(5),
                                    hintText: 'Email',
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    //prefixIcon: Icon(Icons.person),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0,
                                    )),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 0,
                                    ))),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                validator: (value) => value!.length < 6
                                    ? 'Enter a valid password'
                                    : null,
                                onChanged: ((value) {
                                  password = value;
                                }),
                                obscureText: false,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: const EdgeInsets.all(5),
                                    hintText: 'Password',
                                    //prefixIcon: Icon(Icons.person),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0,
                                    )),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 0,
                                    ))),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                        onPressed: (() async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              error = '';
                                              loading = true;
                                            });
                                            dynamic result = await _auth
                                                .signUpNew(email!, password!);
                                            if (result != null) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Sign Up Succesfull')));
                                              Navigator.popAndPushNamed(
                                                  context, '/sign in');
                                            }
                                            setState(() {
                                              error = 'User already exists';
                                              loading = false;
                                            });
                                          }

                                          // if (result == null) {
                                          //   print(
                                          //       'failed to sign you in... sorry :( ');
                                          // } else {
                                          //   print('sign in successful');
                                          //   print(result.uid);
                                          // }
                                        }),
                                        child: const Text('Sign Up')),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                error,
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black54)],
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                      style: BorderStyle.solid, width: 0, color: Colors.grey),
                ),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  const Text(
                    "Already have an account?",
                  ),
                  TextButton(
                    child: const Text(" Sign In"),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/sign in');
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
  }
}
