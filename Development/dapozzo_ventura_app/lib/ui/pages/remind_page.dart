import 'package:dapozzo_ventura_app/business_logic/payment_server.dart';
import 'package:dapozzo_ventura_app/data/models/shippingAddr_model.dart';
import 'package:dapozzo_ventura_app/ui/pages/stripe_checkout_page.dart';
import 'package:flutter/material.dart';

import '../eQuip_appbar.dart';
import '../eQuip_navigator_menu.dart';

class RemindPage extends StatefulWidget {
  final ShippingAddrModel adress;
  final double import;
  const RemindPage({Key key, @required this.adress, @required this.import})
      : super(key: key);

  @override
  _RemindPageState createState() => _RemindPageState();
}

class _RemindPageState extends State<RemindPage> {
  double pageHeight;
  double pageWidth;
  double remindListHeight;
  double buttonRowHeight;

  @override
  Widget build(BuildContext context) {
    pageHeight = MediaQuery.of(context).size.height;
    pageWidth = MediaQuery.of(context).size.width;
    remindListHeight = pageHeight * 2 / 3;
    buttonRowHeight = pageHeight / 9;

    return Scaffold(
      appBar: EquipAppBar(
        withMenu: false,
        title: "eQuip",
      ),
      drawer: EquipNavigatorMenu(navigationTiles: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [],
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Text(
                        'Controlla correttezza dati',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Container(
                      width: pageWidth * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(8.0, 8.0),
                              blurRadius: 5.0,
                              spreadRadius: 2,
                            ),
                          ]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                            child: Text(
                              'IMPORTO:',
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '${widget.import}€',
                              style: TextStyle(
                                color: Colors.green[800],
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('SPEDIZIONE:',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                )),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                              child: Text(
                                ' ${widget.adress.address} ${widget.adress.appartNum} ${widget.adress.comune}',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          height: buttonRowHeight * 2 / 3,
                          width: pageWidth * 0.9,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(215, 1, 136, 73),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[300],
                                  offset: Offset(4.0, 4.0),
                                  blurRadius: 5.0,
                                  spreadRadius: 1,
                                ),
                              ]),
                          child: FlatButton(
                            child: Text("PAGA",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal)),
                            onPressed: () {
                              Server()
                                  .createCheckout(
                                      widget.import, "Pagamento eQuip")
                                  .then((value) => {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (_) =>
                                              CheckoutPage(sessionId: value),
                                        ))
                                      });
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
