import 'package:flutter/material.dart';

class UserProfileIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 30, 5, 5),
      child: Column(
        children: [
          SizedBox(
              height: 125,
              width: 125,
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: ClipOval(
                    child: Image.network(
                      "https://media.gqitalia.it/photos/5ec3ca47a63ee8cb452d9ce4/master/pass/Avatar.jpg",
                      fit: BoxFit.cover,
                    ),
                  ))),
          Padding(
            padding: const EdgeInsets.all(1),
            child: Text(
              "Mario Rossi",
              style: TextStyle(
                color: Colors.blue[300],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1),
            child: Text(
              "mario.rossi@gmail.com",
              style: TextStyle(color: Colors.blue[200]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              "LOGOUT",
              style: TextStyle(
                  color: Colors.blue[200],
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
