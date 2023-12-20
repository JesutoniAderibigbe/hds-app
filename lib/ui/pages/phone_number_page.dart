import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:hds_app/provider/auth_provider.dart';
import 'package:hds_app/ui/pages/chat_page.dart';
import 'package:hds_app/ui/pages/details_page.dart';
import 'package:hds_app/ui/pages/email_page.dart';
import 'package:hds_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class PhoneNumberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Welcome!, ${userProvider.user?.name}')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('What is your Phone Number?'),
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
                            builder: (context) => ChatScreen()),
                      );
                    }),
              ),
              onChanged: (number) => userProvider.setPhoneNumber(number),
            ),
            // ElevatedButton(
            //   onPressed: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => DetailsPage()),
            //   ),
            //   child: Text('Next'),
            // ),
          ],
        ),
      ),
    );
  }
}
