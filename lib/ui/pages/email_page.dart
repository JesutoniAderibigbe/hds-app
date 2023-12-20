import 'package:flutter/material.dart';

import 'package:hds_app/provider/auth_provider.dart';
import 'package:hds_app/ui/pages/phone_number_page.dart';
import 'package:hds_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class EmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Welcome!, ${userProvider.user?.name}.')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'What is your email?',
              style: TextStyle(fontSize: 20.0),
            ),

            SizedBox(
              height: 200.0,
            ),
            TextField(
              decoration: InputDecoration(
                // hintText: 'Enter your email',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PhoneNumberPage()),
                      );
                    }),
              ),
              onChanged: (email) => userProvider.setEmail(email),
            ),
            // ElevatedButton(
            //   onPressed: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => PhoneNumberPage()),
            //   ),
            //   child: Text('Next'),
            // ),
          ],
        ),
      ),
    );
  }
}
