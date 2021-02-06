import 'package:dapozzo_ventura_app/data/models/shippingAddr_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressSelection extends StatefulWidget {
  final List<ShippingAddrModel> addresses;

  const AddressSelection({Key key, this.addresses}) : super(key: key);

  @override
  _AddressSelectionState createState() => _AddressSelectionState();
}

class _AddressSelectionState extends State<AddressSelection> {
  ShippingAddrModel selectedValue;

  @override
  void initState() {
    super.initState();

    selectedValue = widget.addresses[0];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.addresses.length,
        itemBuilder: (context, index) {
          return Container(
            height: 30,
            child: Row(
              children: [
                Radio(
                    value: widget.addresses[index],
                    groupValue: selectedValue,
                    onChanged: (s) {
                      selectedValue = s;
                      setState(() {});
                    }),
                Text(widget.addresses[index].address)
              ],
            ),
          );
        });
  }
}
