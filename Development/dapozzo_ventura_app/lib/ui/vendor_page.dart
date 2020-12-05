import 'package:dapozzo_ventura_app/blocs/vendor_bloc.dart';
import 'package:dapozzo_ventura_app/events/vendor_event.dart';
import 'package:dapozzo_ventura_app/models/product_model.dart';
import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/states/vendor_state.dart';
import 'package:dapozzo_ventura_app/ui/eQuip_appbar.dart';
import 'package:dapozzo_ventura_app/ui/product_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorPage extends StatefulWidget {
  @override
  _VendorPageState createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  var _vendorBloc;

  @override
  Widget build(BuildContext context) {
    final Vendor vendor = ModalRoute
        .of(context)
        .settings
        .arguments;
    _vendorBloc = BlocProvider.of<VendorBloc>(context);
    return Scaffold(
      appBar: EquipAppBar(title: "eQuip",),
      body:Column(children:[
      Expanded(
        child: BlocBuilder<VendorBloc, VendorState>(
          builder: (context, state) {
            List<Product> products;
            if (state is VendorStateLoading) {
              _vendorBloc.add(VendorEventInit(vendor));
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (state is VendorStateInitial) {
                products = state.products;
                return ProductList(products);
              } else {
                if (state is VendorStateSearched) {
                  products = state.result;
                  return ProductList(products);
                } else {
                  if (state is VendorStateGeneralError) {
                    return Text(state.error);
                  }
                }
              }
              return Text("Error");
            }
          },
        ),
      ),
      ],
      )
    );
  }
}
