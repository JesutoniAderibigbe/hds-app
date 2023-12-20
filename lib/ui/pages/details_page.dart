import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hds_app/provider/auth_provider.dart';
import 'package:hds_app/ui/pages/email_page.dart';
import 'package:hds_app/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String verificationId = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  var receivedID = '';

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    if (userProvider.user == null) {
      // Handle missing user information
      return Text('Error: User data missing!');
    }

    final user = userProvider.user!;
    final _auth = FirebaseAuth.instance;
    var verificationId = "";

    return Scaffold(
      appBar: AppBar(title: Text('We are helping you create an account with us')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.person, size: 24.0),
                    const SizedBox(width: 12.0),
                    Text(user.name,
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    Icon(Icons.email, size: 24.0),
                    const SizedBox(width: 12.0),
                    Text(user.email,
                        style: const TextStyle(
                            fontSize: 10.0, fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    Icon(Icons.phone, size: 24.0),
                    const SizedBox(width: 12.0),
                    Text(user.phoneNumber,
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () =>
                      verifyUserPhoneNumber(user.phoneNumber),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Verify Phone Number'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verifyUserPhoneNumber(String phoneNumber) {
    auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
    await auth.signInWithCredential(credential).then(
        (value) => print('Logged In Successfully'),
    );
},
       verificationFailed: (FirebaseAuthException e) {
    print(e.code);
},
         codeSent: (String verificationId, int? resendToken) {
        receivedID = verificationId;
       
        },codeAutoRetrievalTimeout: (String verificationId) {
    print('TimeOut');
}, 
    );
}

  Future<void> verifyOTPCode(String otpController) async {
PhoneAuthCredential credential = PhoneAuthProvider.credential(
    verificationId: receivedID,
    smsCode: otpController,
);
await auth
    .signInWithCredential(credential)
    .then((value) => print('User Login In Successful'));
}


  
}
