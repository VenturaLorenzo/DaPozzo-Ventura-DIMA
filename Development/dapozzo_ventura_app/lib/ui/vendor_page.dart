import 'package:dapozzo_ventura_app/blocs/vendor_bloc.dart';
import 'package:dapozzo_ventura_app/states/vendor_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorPage extends StatefulWidget {
  @override
  _VendorPageState createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  final _vendorBloc = VendorBloc();

  @override
  Widget build(BuildContext context) {
    final String vendor = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(vendor),
      ),
      body: BlocProvider(
        builder: (BuildContext context) => _vendorBloc,
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<VendorBloc, VendorState>(
                builder: (context, state) {
                  List<String> products;
                  if (state is VendorStateInitial) {
                    products = state.vendorList.products;
                    return Text(products.toString());
                  } else {
                    if (state is VendorStateSearched) {
                      products = state.result.products;
                      return Text(products.toString());
                    } else {
                      if (state is VendorStateGeneralError) {
                        return Text(state.error);
                      }
                    }
                    return Text("Error");
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
