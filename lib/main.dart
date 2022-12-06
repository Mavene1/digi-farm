import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth/auth_page.dart';
import 'pages/layoutpage.dart';


// const supabaseURL = 'https://cofsiyieryhksfbkbskp.supabase.co';
// const supabaseKey =
//     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNvZnNpeWllcnloa3NmYmtic2twIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzAyNDAzOTYsImV4cCI6MTk4NTgxNjM5Nn0.84AjnK6ciJFgdVoOpD7520e9B91Ut9mIosUAKWiQDU8';
// final supabaseClient = SupabaseClient(supabaseURL, supabaseKey);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://cofsiyieryhksfbkbskp.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNvZnNpeWllcnloa3NmYmtic2twIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzAyNDAzOTYsImV4cCI6MTk4NTgxNjM5Nn0.84AjnK6ciJFgdVoOpD7520e9B91Ut9mIosUAKWiQDU8',
    debug: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<AuthState?>(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
        
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const Center(child: CircularProgressIndicator());
          // } else if (snapshot.hasError) {
          //   return const Center(child: Text('Something went wrong'));
          // }
          if (snapshot.hasData) {
            return const LayoutPage();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
