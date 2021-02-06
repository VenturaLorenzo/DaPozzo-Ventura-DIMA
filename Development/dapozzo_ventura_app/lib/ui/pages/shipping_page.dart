// import 'package:dapozzo_ventura_app/data/models/shippingAddr_model.dart';
// import 'package:dapozzo_ventura_app/ui/lists/address_selection.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// import '../eQuip_appbar.dart';

// class ShippingPage extends StatefulWidget {
//   @override
//   _ShippingPageState createState() => _ShippingPageState();
// }

// class _ShippingPageState extends State<ShippingPage> {
//   double textFieldHeight;

//   @override
//   Widget build(BuildContext context) {
//     textFieldHeight = MediaQuery.of(context).size.height / 10;
//     return Scaffold(
//         appBar: EquipAppBar(
//           withMenu: false,
//           title: 'Shipping Address',
//         ),
//         body: Column(children: [
//            AddressSelection(
//                   addresses: addresses,
//                 ),
//         ],),
//     );
//   }
// }

// class ShippingPage extends StatefulWidget {
//   final ShippingAddrModel addresses;

//   const ShippingPage({Key key,})
//       : super(key: key);

//   @override
//   _GoodWindowPageState createState() => _GoodWindowPageState();
// }

// class _GoodWindowPageState extends State<GoodWindowPage> {
//   GoodWindwCubit _goodWindowCubit;
//   QuantityCubit _quantityCubit;
//   SizeCubit _sizeCubit;
//   List<bool> isSelected;
//   GoodTypologyModel goodTypology;
//   double pageHeight;
//   double imageListHeight;
//   double selectionRowHeight;
//   double buttonRowHeight;

//   @override
//   void initState() {
//     super.initState();
//     //  _cartBloc = BlocProvider.of<CartBloc>(context);
//     _sizeCubit = BlocProvider.of<SizeCubit>(context);
//     _quantityCubit = BlocProvider.of<QuantityCubit>(context);

//     _goodWindowCubit = BlocProvider.of<GoodWindwCubit>(context);
//     goodTypology = widget.goodTypology;
//     _goodWindowCubit.initialize(goodTypology);
//   }

//   @override
//   void dispose() {
//     _goodWindowCubit.reset();

//     // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     pageHeight = MediaQuery.of(context).size.height;
//     imageListHeight = pageHeight * 2 / 3;
//     selectionRowHeight = pageHeight / 9;
//     buttonRowHeight = pageHeight / 9;
//     return Scaffold(
//       appBar: EquipAppBar(
//         withMenu: false,
//         title: goodTypology.name,
//       ),
//       body:
