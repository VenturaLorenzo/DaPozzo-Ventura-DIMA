
import 'package:dapozzo_ventura_app/business_logic/blocs/vendor_bloc.dart';
import 'package:dapozzo_ventura_app/business_logic/events/vendor_event.dart';
import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VendorItem extends StatelessWidget {
  final Vendor vendor;
  final List<String> images = [
    "lib/assets/image2.jpg",
    "lib/assets/image2.jpg",
    "lib/assets/image2.jpg",
    "lib/assets/image2.jpg",
    "lib/assets/image2.jpg",
    "lib/assets/image2.jpg"
  ];

  VendorItem({Key key, this.vendor});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(5),
      child: Container(
        // height: 400,
        child: Column(
          children: [
            InkWell(
              onTap: (){
                BlocProvider.of<VendorBloc>(context).add(VendorEventInit(vendor));
              ;

                Navigator.pushNamed(context, '/vendor',arguments: vendor);
                },
              child: Container(
                height: 250,
                child:
                Image.network(
                  'https://www.laccademiabjj.it/images/sfondi/${vendor.image}',
                  fit: BoxFit.cover,
                ),
                ),
            ),

            SizedBox(
              height: 10,
              child: Container(
                color: Colors.black87,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black87, width: 2),
              ),
              child: Column(
                children: [
                Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    vendor.name,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
              RatingBar.builder(
                initialRating: vendor.rating,
                itemSize: 18,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) =>
                    Icon(
                      Icons.star,
                      color: Colors.black87,
                    ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: GridView.count(physics: ScrollPhysics(),
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 3,
                      //scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      // Generate 100 widgets that display their index in the List.
                      children:
                      [vendor.image].map((path) {
                        return Padding(padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                            child: InkWell(onTap: (){},
                              child: Container(
                                  child: FittedBox(fit: BoxFit.fill,
                                      child: Image.network(
                                        'https://www.laccademiabjj.it/images/sfondi/${vendor.image}',
                                        fit: BoxFit.cover,
                                      ),)),
                            ));
                      }).toList()),


                ),
              ),

          ],
        ),
      )
      ],
    )),
    );
  }
}
