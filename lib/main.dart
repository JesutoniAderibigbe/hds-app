import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hds_app/firebase_options.dart';
import 'package:hds_app/provider/auth_provider.dart';
import 'package:hds_app/ui/pages/chat_page.dart';
import 'package:hds_app/ui/pages/email_page.dart';

import 'package:hds_app/ui/pages/name_page.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
        // TRY THIS: Try changing the color scheme here to a specific color
        // (to Colors.amber, perhaps?) and trigger a hot reload to see the
        // colors change.
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: WelcomePage()
      ),
    );
  }
}

