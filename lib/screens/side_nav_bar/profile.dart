import 'package:flutter/material.dart';

import '../../models/user_login_model.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Hero(
              tag: "user_profile_pic",
              child: Image(
                image: AssetImage('assets/images/male_photo_placeholder.jpeg'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              UserLoginModel.getEmail,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              UserLoginModel.getPassword,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
