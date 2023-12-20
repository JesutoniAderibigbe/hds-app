import 'package:flutter/material.dart';
import 'package:hds_app/provider/auth_provider.dart';
import 'package:hds_app/ui/pages/email_page.dart';
import 'package:hds_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Welcome!')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(

         
          children: [

            SizedBox(
              height: 170.0,
            ),

            Text('Let\'s create a secret bond! Katty wants to know you', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.grey),),

        //    RiveAnimation.network(
        //   'https://cdn.rive.app/animations/vehicles.riv',
        // ),

        SizedBox(
              height: 50.0,
            ),

            Text('What is your name?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),

            SizedBox(
              height: 200.0,
            ),
            TextField(
               decoration: InputDecoration(
                 hintText: 'You can also type...',
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
                            builder: (context) => EmailPage()),
                      );
                    }),
              ),
              onChanged: (name) => userProvider.setName(name),
            ),
            // ElevatedButton(
            //   onPressed: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => EmailPage()),
            //   ),
            //   child: Text('Next'),
            // ),
          ],
        ),
      ),
    );
  }
}
