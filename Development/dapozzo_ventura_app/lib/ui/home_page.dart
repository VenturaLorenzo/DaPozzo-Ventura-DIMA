import 'package:dapozzo_ventura_app/blocs/market_place_bloc.dart';
import 'package:dapozzo_ventura_app/events/market_place_event.dart';
import 'package:dapozzo_ventura_app/models/category_model.dart';
import 'package:dapozzo_ventura_app/models/market_place_model.dart';
import 'package:dapozzo_ventura_app/models/sport_model.dart';
import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/states/market_place_state.dart';
import 'package:dapozzo_ventura_app/ui/vendor_list_widget.dart';
import 'package:dapozzo_ventura_app/ui/vendor_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _marketPlaceBloc = MarketPlaceBloc();

  final List<Category> categories = [
   Category(Icons.sentiment_very_dissatisfied,"felpa"),
    Category(Icons.search,"guanti"),
    Category(Icons.arrow_drop_down_circle,"scarpe"),
    Category(Icons.gesture,"pantaloni"),
    Category(Icons.polymer,"giacca"),
    Category(Icons.sentiment_very_dissatisfied,"calze"),
    Category(Icons.search,"intimo"),
    Category(Icons.arrow_drop_down_circle,"sciarpa"),
    Category(Icons.gesture,"cappello"),
  ];

  final List<Sport> sports = [
   Sport(Icons.sentiment_very_dissatisfied,"basket"),
  Sport(Icons.search,"calcio"),
  Sport(Icons.polymer,"golf"),
  Sport(Icons.gesture,"atletica"),
  Sport(Icons.arrow_drop_down_circle,"nuoto"),
  Sport(Icons.sentiment_very_dissatisfied,"pallavolo"),

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageCache.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/cart");
            },
            icon: Icon(Icons.shopping_cart),
          )
        ],
        title: Text("eQuip"),
      ),
      body: BlocProvider(
        builder: (BuildContext context) => _marketPlaceBloc,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(backgroundColor: Colors.white,
              floating: true,expandedHeight: 250,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(8,0 , 0, 0),child: Text("Categories",style: TextStyle(fontWeight: FontWeight.bold),)),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: categories.map((category) {
                          return Padding(
                              padding: EdgeInsets.fromLTRB(9, 0, 9, 0),
                              child: Icon(
                                category.icon,
                                size: 50,
                              ));
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(8,0 , 0, 0),child: Text("Sports",style: TextStyle(fontWeight: FontWeight.bold),)),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: sports.map((sport) {
                          return Padding(
                              padding: EdgeInsets.fromLTRB(9, 0, 9, 0),
                              child: InkWell(
                                onTap: (){},
                                child: Icon(
                                  sport.icon,
                                  size: 50,
                                ),
                              ));
                        }).toList(),
                      ),
                    ),
                    TextField(
                      onSubmitted: (typedText) {
                        _marketPlaceBloc.add(MarketPlaceSearch(typedText));
                      },style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,letterSpacing: 1,),
                      decoration: InputDecoration(labelText: "Search",),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<MarketPlaceBloc, MarketPlaceState>(
                builder: (context, state) {

                    List<Vendor> vendors;
                    if (state is MarketPlaceLoadingState) {
                      _marketPlaceBloc.add(MarketPlaceInit());
                      return SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state is MarketPlaceInitial) {
                      vendors = state.initialResult;
                      return SliverList(delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index){if(index < vendors.length){
                              return VendorCard(vendor:vendors[index],);
                              }else{ return null;}

                     }));
                    } else {
                      if (state is MarketPlaceSearched) {
                        vendors = state.result;
                        print(vendors);
                        return VendorList(vendors);
                      } else {
                        if (state is MarketPlaceGeneralError) {
                          return Text(state.error.toString());
                        }
                      }
                    }
                    return Text("Error");
                  }
              
            ),

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _marketPlaceBloc.close();
  }
}
