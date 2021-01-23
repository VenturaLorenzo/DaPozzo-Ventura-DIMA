import 'package:dapozzo_ventura_app/business_logic/blocs/good_typology_bloc.dart';
import 'package:dapozzo_ventura_app/business_logic/blocs/size_bloc.dart';
import 'package:dapozzo_ventura_app/data/models/cart_model.dart';
import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';
import 'package:dapozzo_ventura_app/data/repositories/goods_typology_repository.dart';
import 'package:dapozzo_ventura_app/data/repositories/vendor_repository.dart';
import 'package:flutter/services.dart';
import 'business_logic/blocs/cart_bloc.dart';
import 'business_logic/blocs/market_place_bloc.dart';
import 'business_logic/blocs/vendor_bloc.dart';
import 'data/models/vendor_model.dart';
import 'data/providers/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async{
 List<GoodTypologyModel> types=await   GoodsTypologyRepository.getGoodsTypologies([],-1, 1);
  types.forEach((element) {print(element.toString() +"\n");});
  GoodTypologyModel g=GoodTypologyModel(id: 1,name: "Easy",price: 15,categoryId: 1,gender: 0);
  GoodModel g1= GoodModel(type: types[0],size: "Medium",quantity: 5,color: ColorModel(name: "red"),images: []);
  GoodModel g2=GoodModel(type: types[1],size: "Medium",quantity: 1,color: ColorModel(name: "red"),images: []);
  CartModel cart= CartModel(products: [g1]);
 print(cart.toString());

 cart.addProduct(g1);

  print(cart.toString());
print(g1);
 cart.addProduct(g1);

 print(cart.toString());

}/*
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
          ),
          BlocProvider(
            create: (BuildContext context) => SizeBloc(),
          )
        ],
        child: MaterialApp(
          initialRoute: '/launch',
          onGenerateRoute: RouteGenerator.generateRoute,
        )),
  );
}
*/