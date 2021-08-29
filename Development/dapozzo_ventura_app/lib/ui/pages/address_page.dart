import 'dart:ffi';

import 'package:dapozzo_ventura_app/business_logic/cubit/shipping_cubit.dart';
import 'package:dapozzo_ventura_app/data/models/shippingAddr_model.dart';
import 'package:dapozzo_ventura_app/states/shipping_state.dart';
import 'package:dapozzo_ventura_app/ui/lists/address_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../eQuip_appbar.dart';
import '../eQuip_navigator_menu.dart';

class AddressPage extends StatefulWidget {
  final double import;
  const AddressPage({Key key, this.import}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  double pageHeight;
  double pageWidth;
  double adressListHeight;
  double buttonRowHeight;

  @override
  Widget build(BuildContext context) {
    pageHeight = MediaQuery.of(context).size.height;
    pageWidth = MediaQuery.of(context).size.width;
    adressListHeight = pageHeight * 2 / 3;
    buttonRowHeight = pageHeight / 9;
    // filterBarHeight = MediaQuery.of(context).size.height / 3;
    // filterBarHeight = MediaQuery.of(context).size.height / 3;

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
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ShippingCubit, ShippingState>(
                builder: (context, state) {
                  if (state is ShippingNoAddressState) {
                    return Container(
                        height: adressListHeight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Non ci sono indirizzi salvati',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ));
                  }

                  if (state is ShippingLoadingState ||
                      state is ShippingInitState) {
                    return Container(
                      height: adressListHeight,
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black54),
                        ),
                      ),
                    );
                  }

                  if (state is ShippingLoadedState) {
                    return Container(
                      height: adressListHeight,
                      child: AddressSelection(
                        adresses: state.adresses,
                        import: widget.import,
                      ),
                    );
                  }

                  return (Column());
                },
              ),
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
                      child: Text("AGGIUNGI INDIRIZZO",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 16,
                              fontStyle: FontStyle.normal)),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/address",
                        );
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
