import 'package:flutter/material.dart';
import 'package:dapozzo_ventura_app/global.dart';

class UserProfileIcon extends StatelessWidget {
  final double height;

  const UserProfileIcon({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Globals.currentUser != null) {
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
                        'https://www.laccademiabjj.it/images/Shop/' +
                            Globals.currentUser.image,
                        fit: BoxFit.cover,
                      ),
                    ))),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Text(
                Globals.currentUser.name,
                style: TextStyle(
                  color: Colors.blue[300],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Text(
                Globals.currentUser.email,
                style: TextStyle(color: Colors.blue[200]),
              ),
            ),
            TextButton(
              child: Text(
                "LOGOUT",
                style: TextStyle(
                    color: Colors.blue[400],
                    decoration: TextDecoration.underline),
              ),
              onPressed: () {
                Globals.currentUser = null;
                Globals.isLogged=false;
                if(Globals.googleSignIn.currentUser!= null){
                  Globals.googleSignIn.signOut();
                }
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ],
        ),
      );
    } else {
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
      );
    }
  }
}
