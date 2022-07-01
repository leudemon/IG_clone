import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase/screens/authentication/loading%20screen.dart';
import 'package:flutter_firebase/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Authservice _auth = Authservice();
  final _formKey = GlobalKey<FormState>();
  late String email = '';
  late String password = '';
  String error = '';
  bool loading = false;
  @override
  @override
  Widget build(BuildContext context) {
    ThemeData(
      useMaterial3: true,
    );
    return loading
        ? const loadingWidget()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                "English(United States)",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              foregroundColor: Colors.black,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  Center(
                      child: Container(
                    height: 80,
                    width: 400,
                    padding: const EdgeInsets.all(10),
                    child: const FittedBox(
                        child: Image(
                            image: AssetImage('assets/images/thegram.png'))),
                  )),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        color: Colors.white70,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              TextFormField(
                                initialValue: email,
                                validator: (value) =>
                                    value!.isEmpty ? 'Enter an Email' : null,
                                onChanged: ((value) {
                                  setState(() {
                                    email = value.trim();
                                  });
                                }),
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0),
                                    filled: true,
                                    fillColor: Colors.grey[50],
                                    hintText: 'Email',
                                    prefixIcon: const Icon(Icons.person),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.grey,
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
                                initialValue: password,
                                validator: (value) => value!.length < 6
                                    ? 'Enter a valid password'
                                    : null,
                                onChanged: ((value) {
                                  password = value;
                                }),
                                obscureText: true,
                                decoration: InputDecoration(
                                    iconColor: Colors.black,
                                    contentPadding: const EdgeInsets.all(0),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                    ),
                                    prefixIconColor: Colors.grey,
                                    hintText: 'Password',
                                    filled: true,
                                    fillColor: Colors.grey[50],
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 0,
                                    )),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 0,
                                    ))),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                        onPressed: (() async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              loading = true;
                                              error = '';
                                            });
                                          }

                                          dynamic result = await _auth
                                              .signInEmail(email, password);
                                          if (mounted && result != null) {
                                            setState(() {
                                              loading = false;
                                              Navigator.pop(
                                                  context, '/sign in');
                                            });
                                          } else {
                                            setState(() {
                                              loading = false;
                                              error = 'wrong email or password';
                                            });
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  SimpleDialog(
                                                insetPadding:
                                                    const EdgeInsets.all(70),
                                                contentPadding:
                                                    const EdgeInsets.all(10),
                                                title: const Text(
                                                  "Incorrect credentials",
                                                  textAlign: TextAlign.center,
                                                ),
                                                children: [
                                                  const Center(
                                                    child: Text(
                                                      "The email or password you entered doesn't appear to belong to an account. please check your credentials and try again.",
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  TextButton(
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(),
                                                      child:
                                                          const Text('Okay')),
                                                  TextButton(
                                                      onPressed: () => Navigator
                                                          .pushReplacementNamed(
                                                              context,
                                                              '/sign up'),
                                                      child:
                                                          const Text('Sign up'))
                                                ],
                                              ),
                                            );
                                          }
                                        }),
                                        child: const Text('Log In')),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                error,
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 12),
                              ),
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
              child: BottomAppBar(
                child: Row(
                  children: [
                    const Spacer(),
                    const Text(
                      "Don't have an account?",
                    ),
                    TextButton(
                      child: const Text(" Sign Up"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign up');
                      },
                    ),
                    const Spacer()
                  ],
                ),
              ),
            ),
          );
  }
}
