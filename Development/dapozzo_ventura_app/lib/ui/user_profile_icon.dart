import 'package:flutter/material.dart';
import 'package:dapozzo_ventura_app/global.dart';

class UserProfileIcon extends StatelessWidget {
  final double height;

  const UserProfileIcon({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Globals.currentUser != null && Globals.currentUser.image != null) {
      return Container(
        height: height,
        child: Padding(
          padding: EdgeInsets.all(height / 20),
          child: Column(
            children: [
              SizedBox(
                  height: height / 2,
                  width: height / 2,
                  child: Padding(
                      padding: EdgeInsets.all(height / 20),
                      child: ClipOval(
                        child: Image.network(
                          Globals.baseUrlImages + Globals.currentUser.image,
                          fit: BoxFit.cover,
                        ),
                      ))),
              Container(
                height: height / 10,
                child: Text(
                  Globals.currentUser.name,
                  style: TextStyle(
                    fontSize: height / 17,
                    color: Colors.blue[300],
                  ),
                ),
              ),
              Container(
                height: height / 10,
                child: Text(
                  Globals.currentUser.email,
                  style:
                      TextStyle(fontSize: height / 17, color: Colors.blue[200]),
                ),
              ),
              Container(
                height: height * 2 / 10,
                child: TextButton(
                  child: Text(
                    "LOGOUT",
                    style: TextStyle(
                        fontSize: height / 17,
                        color: Colors.blue[400],
                        decoration: TextDecoration.underline),
                  ),
                  onPressed: () {
                    Globals.currentUser = null;
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (Globals.currentUser != null && Globals.currentUser.image == null) {
      return Container(
        height: height,
        child: Padding(
          padding: EdgeInsets.all(height / 20),
          child: Column(
            children: [
              SizedBox(
                  height: height / 2,
                  width: height / 2,
                  child: Padding(
                      padding: EdgeInsets.all(height / 20),
                      child: ClipOval(
                        child: Image.network(
                          Globals.baseUrlImages + 'ProfiloIniziale.png',
                          fit: BoxFit.cover,
                        ),
                      ))),
              Container(
                height: height / 10,
                child: Text(
                  Globals.currentUser.name,
                  style: TextStyle(
                    fontSize: height / 17,
                    color: Colors.blue[300],
                  ),
                ),
              ),
              Container(
                height: height / 10,
                child: Text(
                  Globals.currentUser.email,
                  style:
                      TextStyle(fontSize: height / 17, color: Colors.blue[200]),
                ),
              ),
              Container(
                height: height * 2 / 10,
                child: TextButton(
                  child: Text(
                    "LOGOUT",
                    style: TextStyle(
                        fontSize: height / 17,
                        color: Colors.blue[400],
                        decoration: TextDecoration.underline),
                  ),
                  onPressed: () {
                    Globals.currentUser = null;
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
    if (Globals.currentUser == null) {
      return Container(
        height: height,
        child: Padding(
          padding: EdgeInsets.all(height / 20),
          child: Column(
            children: [
              SizedBox(
                  height: height / 2,
                  width: height / 2,
                  child: Padding(
                      padding: EdgeInsets.all(height / 20),
                      child: ClipOval(
                        child: Image.network(
                          Globals.baseUrlImages + 'ProfiloIniziale.png',
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
              Container(
                height: height * 2 / 10,
                child: TextButton(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontSize: height / 17,
                        color: Colors.blue[400],
                        decoration: TextDecoration.underline),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/login");
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
