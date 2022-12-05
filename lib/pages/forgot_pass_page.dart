// ignore_for_file: avoid_print


import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailControler = TextEditingController();

  @override
  void dispose() {
    emailControler.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await Supabase.instance.client.auth.resetPasswordForEmail(emailControler.text.trim());
          showDialog(
        context: context,
        builder: ((context) {
          return const AlertDialog(
            content: Text('Password reset link sent! Check your email.'),
            
          );
        }),
      );
    }  catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            content: Text(e.toString()),
          );
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Enter your email to receive the password reset link.'),
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
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: passwordReset,
            color: Colors.green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const Text('Reset Password'),
          )
        ],
      ),
    );
  }
}
