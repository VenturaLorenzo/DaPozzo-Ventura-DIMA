import 'package:dapozzo_ventura_app/business_logic/blocs/good_window_bloc.dart';
import 'business_logic/blocs/cart_bloc.dart';
import 'business_logic/blocs/market_place_bloc.dart';
import 'business_logic/blocs/vendor_bloc.dart';
import 'data/providers/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/*

void main() async{
 List<String> images= await FrontImageRepository.getFrontTypologyImages(1);
print(images);

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
            create: (BuildContext context) => GoodWindowBloc(),
          ),

        ],
        child: MaterialApp(
          initialRoute: '/launch',
          onGenerateRoute: RouteGenerator.generateRoute,
        )),
  );
}
