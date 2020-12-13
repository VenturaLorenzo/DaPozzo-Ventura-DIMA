
import 'business_logic/blocs/cart_bloc.dart';
import 'business_logic/blocs/market_place_bloc.dart';
import 'business_logic/blocs/vendor_bloc.dart';
import 'data/providers/route_generator.dart';



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/*
void main() async{

  print(CategoryModel(Icons.ac_unit,"ciao").name==CategoryModel(Icons.ac_unit,"ciao").name);

}
*/
void main() => runApp(
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
            )
          ],
          child: MaterialApp(
            initialRoute: '/launch',
           onGenerateRoute: RouteGenerator.generateRoute,
          )),
    );
