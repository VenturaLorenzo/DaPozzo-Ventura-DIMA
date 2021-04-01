import 'package:dapozzo_ventura_app/business_logic/cubit/cart_cubit.dart';
import 'package:dapozzo_ventura_app/business_logic/cubit/good_window_cubit.dart';
import 'package:dapozzo_ventura_app/business_logic/cubit/quantity_cubit.dart';
import 'package:dapozzo_ventura_app/business_logic/cubit/shipping_cubit.dart';
import 'package:dapozzo_ventura_app/business_logic/cubit/size_cubit.dart';
import 'package:dapozzo_ventura_app/business_logic/cubit/vendor_cubit.dart';
import 'package:dapozzo_ventura_app/data/repositories/goods_typology_repository.dart';
import 'package:dapozzo_ventura_app/data/repositories/vendor_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/cubit/market_place_cubit.dart';
import 'business_logic/route_generator.dart';
import 'package:flutter/material.dart';

/*

void main() async{
 List<String> images= await FrontImageRepository.getFrontTypologyImages(1);
print(images);

}*/
final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) =>
                MarketPlaceCubit(VendorRepository()),
          ),
          BlocProvider(
            create: (BuildContext context) => CartCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) =>
                VendorCubit(GoodsTypologyRepository()),
          ),
          BlocProvider(
            create: (BuildContext context) => GoodWindwCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => QuantityCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => SizeCubit(),
          ),
          BlocProvider(create: (BuildContext context) => ShippingCubit()),
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          initialRoute: '/launch',
          onGenerateRoute: RouteGenerator.generateRoute,
        )),
  );

  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
}
