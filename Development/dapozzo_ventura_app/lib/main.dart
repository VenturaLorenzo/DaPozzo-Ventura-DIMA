import 'package:dapozzo_ventura_app/business_logic/cubit/cart_cubit.dart';
import 'package:dapozzo_ventura_app/business_logic/cubit/good_window_cubit.dart';
import 'package:dapozzo_ventura_app/business_logic/cubit/vendor_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/cubit/market_place_cubit.dart';
import 'data/providers/route_generator.dart';
import 'package:flutter/material.dart';
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
            create: (BuildContext context) => MarketPlaceCubit(),
          ),
     BlocProvider(
            create: (BuildContext context) => CartCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => VendorCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => GoodWindwCubit(),
          ),

        ],
        child: MaterialApp(
          initialRoute: '/launch',
          onGenerateRoute: RouteGenerator.generateRoute,
        )),
  );
}
