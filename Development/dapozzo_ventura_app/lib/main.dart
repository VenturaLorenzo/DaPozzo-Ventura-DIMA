import 'package:dapozzo_ventura_app/business_logic/blocs/good_typology_bloc.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';
import 'package:dapozzo_ventura_app/data/repositories/vendor_repository.dart';
import 'package:flutter/services.dart';
import 'business_logic/blocs/cart_bloc.dart';
import 'business_logic/blocs/market_place_bloc.dart';
import 'business_logic/blocs/vendor_bloc.dart';
import 'data/models/vendor_model.dart';
import 'data/providers/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
void main() async{
  var db= DatabaseHelper.instance;
  List<Map> colors= await db.getColorsByTypology(2);
print("sono arrivato qui");

  colors.forEach((element) {print(element['name']);});

}*/
void main() {
 // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.portraitUp]);
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => MarketPlaceBloc(),
          ),
          BlocProvider(
            create: (BuildContext context) => CartBloc(),
          ),
          BlocProvider(
            create: (BuildContext context) => VendorBloc(),
          ),
          BlocProvider(
            create: (BuildContext context) => GoodTypologyBloc(),
          )
        ],
        child: MaterialApp(
          initialRoute: '/launch',
          onGenerateRoute: RouteGenerator.generateRoute,
        )),
  );
}
