// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailControler = TextEditingController();
  // final phoneNumberController = TextEditingController();
  final passwordControler = TextEditingController();
  final confirmPasswordControler = TextEditingController();
  late bool _passwordVisible;
  late bool _passVisible;

  final supaClient = Supabase.instance.client;

  Future<void> signUpUser() async {
    try {
      if (passwordConfirmed()) {
        await supaClient.auth.signUp(
          email: emailControler.text.trim(),
          // phone: phoneNumberController.text.trim(),
          password: passwordControler.text.trim(),
        );

        // ignore: empty_catches
      }
    }  catch (e) {
      print("Shida: $e");
    }
  }

  bool passwordConfirmed() {
    if (passwordControler.text.trim() == confirmPasswordControler.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    _passwordVisible = false;
    _passVisible = false;
    super.initState();
    
  }

  

  @override
  void dispose() {
    super.dispose();
    emailControler.dispose();
    // phoneNumberController.dispose();
    passwordControler.dispose();
    confirmPasswordControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.scale_rounded,
                  size: 40,
                  color: Colors.green,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Hello User,',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Register below!',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        controller: emailControler,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Email Address',
                          prefixIcon: Icon(Icons.mail, color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.grey[200],
                //       border: Border.all(color: Colors.green),
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.only(left: 15.0),
                //       child: TextField(
                //         controller: phoneNumberController,
                //         decoration: const InputDecoration(
                //           border: InputBorder.none,
                //           hintText: 'Enter Phone Number',
                //           prefixIcon: Icon(Icons.phone, color: Colors.green),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        controller: passwordControler,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter password',
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.green),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            icon: Icon(_passwordVisible
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded),
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        controller: confirmPasswordControler,
                        obscureText: !_passVisible,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm password',
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.green),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passVisible = !_passVisible;
                              });
                            },
                            icon: Icon(_passVisible
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded),
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUpUser,
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a Member?  ',
                      style: TextStyle(fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        'Log In!',
                        style: TextStyle(
                            color: Colors.green[700],
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
