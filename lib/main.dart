import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluther/login.dart';
import 'package:flutter/material.dart';
import 'package:fluther/feed.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RoteadorTela(),
      routes: {
        '/feed': (context) => Feed(user: FirebaseAuth.instance.currentUser!),
      },
    );
  }
}

class RoteadorTela extends StatelessWidget {
  const RoteadorTela({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Erro ao carregar dados'));
        } else if (snapshot.hasData && snapshot.data != null) {
          return Feed(user: snapshot.data!);
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
