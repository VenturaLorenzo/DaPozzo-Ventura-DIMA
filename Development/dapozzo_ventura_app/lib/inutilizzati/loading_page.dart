import 'dart:async';

import 'package:dapozzo_ventura_app/blocs/market_place_bloc.dart';
import 'package:dapozzo_ventura_app/models/market_place_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/* questa sarà la pagina di caricamento
*  l'app parte chiamando questa pagina
*  quando questa pagina ha preso i dati che ha bisogno
* chiama un altro widget
*
*
* */


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


   @override
  void initState() {
    super.initState();
    getVendors();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: Text("Loading"),
            )
        );

  }

  void getVendors() async {
      MarketPlace instance= MarketPlace.getVendors(); // costruisco un oggetto (centro commerciale)
    // prendo i negozi del database con un asyc call tipo  : instance.getVendors();
    //poi vado alla pagina home passandogli l'oggetto marketplace

    Timer(Duration(seconds: 1), () { // qui ho aggiunto un timer per fare in modo da simulare la richiesta dati
      // inoltre in questo modo la pagina loading viene caricata prima di passare a home -> in caso contrario da errore
      Navigator.pushReplacementNamed(context,'/home' , arguments: instance);
    });



  }
}
