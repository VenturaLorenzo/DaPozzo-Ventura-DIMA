import 'package:dapozzo_ventura_app/blocs/vendor_bloc.dart';
import 'package:dapozzo_ventura_app/events/vendor_event.dart';
import 'package:dapozzo_ventura_app/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/states/vendor_state.dart';
import 'package:dapozzo_ventura_app/ui/eQuip_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'goods_typology_list_widget.dart';

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
    print(vendor.name);
    _vendorBloc = BlocProvider.of<VendorBloc>(context);
    return Scaffold(
      appBar: EquipAppBar(title: "eQuip",),
      body:Column(children:[
      Expanded(
        child: BlocBuilder<VendorBloc, VendorState>(
          builder: (context, state) {
            List<GoodTypology> goodtypology;
            if (state is VendorStateLoading) {
              _vendorBloc.add(VendorEventInit(vendor));
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (state is VendorStateInitial) {
                goodtypology = state.goodtypology;
                return GoodTypologyList(goodtypology);
              } else {
                if (state is VendorStateSearched) {
                  goodtypology = state.result;
                  return GoodTypologyList(goodtypology);
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
