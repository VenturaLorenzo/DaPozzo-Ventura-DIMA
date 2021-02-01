import 'package:flutter/material.dart';
import 'package:dapozzo_ventura_app/global.dart';

class UserProfileIcon extends StatelessWidget {
  final double height;

  const UserProfileIcon({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Padding(
        padding: EdgeInsets.all(height / 10),
        child: Column(
          children: [
            SizedBox(
                height: height / 2,
                width: height / 2,
                child: Padding(
                    padding: EdgeInsets.all(height / 20),
                    child: ClipOval(
                      child: Image.network(
                        "https://media.gqitalia.it/photos/5ec3ca47a63ee8cb452d9ce4/master/pass/Avatar.jpg",
                        fit: BoxFit.cover,
                      ),
                    ))),
            Container(
              height: height / 10,
              child: Text(
                "Mario Rossi",
                style: TextStyle(
                  fontSize: height / 17,
                  color: Colors.blue[300],
                ),
              ),
            ),
            Container(
              height: height / 10,
              child: Text(
                "mario.rossi@gmail.com",
                style:
                    TextStyle(fontSize: height / 17, color: Colors.blue[200]),
              ),
            ),
          TextButton(
              child: Text(
              "LOGIN",
                style: TextStyle(
                  color: Colors.blue[400],
                    decoration: TextDecoration.underline),
              ),
            onPressed: () {
              Navigator.pushNamed(context, "/login");
            },
            ),
          ],
        ),
      ),
    );
  }
}
