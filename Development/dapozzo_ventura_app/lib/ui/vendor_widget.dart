import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VendorCard extends StatelessWidget {
  final Vendor vendor;
  final List<String> images = [
    "lib/assets/image2.jpg",
    "lib/assets/image2.jpg",
    "lib/assets/image2.jpg",
    "lib/assets/image2.jpg",
    "lib/assets/image2.jpg",
    "lib/assets/image2.jpg"
  ];

  VendorCard({Key key, this.vendor});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(5),
      child: Container(
        // height: 400,
        child: Column(
          children: [
            Container(
              height: 250,
              child:
                 Image(
                  image: AssetImage("lib/assets/image2.jpg"),fit: BoxFit.fill,
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
                initialRating: 3.2,
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
                      images.map((path) {
                        return Padding(padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                            child: Container(
                                child: FittedBox(fit: BoxFit.fill,
                                    child: Image.asset(
                                        path))));
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
