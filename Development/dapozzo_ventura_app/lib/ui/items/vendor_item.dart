import 'package:dapozzo_ventura_app/business_logic/blocs/vendor_bloc.dart';
import 'package:dapozzo_ventura_app/business_logic/events/vendor_event.dart';
import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VendorItem extends StatelessWidget {
  final Vendor vendor;
  final List<int> selectedCategories;


  VendorItem({Key key, this.vendor, this.selectedCategories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(4.0, 4.0),
                  blurRadius: 5.0,
                  spreadRadius: 1,
                ),
              ]),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  BlocProvider.of<VendorBloc>(context)
                      .add(VendorEventInit(vendor, selectedCategories));
                  Navigator.pushNamed(context, '/vendor', arguments: {
                    "vendor": vendor,
                    "preselectedCategories": selectedCategories
                  });
                },
                child: Container(
                    height: MediaQuery.of(context).size.height / 2.8,
                    child: ClipRRect(
                      child: Image.network(
                        'https://www.laccademiabjj.it/images/sfondi/${vendor.image}',
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                    )),
              ),
              SizedBox(
                height: 2.5,
                child: Container(
                  color: Colors.black87,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          initialRating: vendor.rating,
                          itemSize: 18,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.black87,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Text(
                          '${vendor.rating}',
                        ),
                      ],
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: GridView.count(
                            physics: ScrollPhysics(),
                            // Create a grid with 2 columns. If you change the scrollDirection to
                            // horizontal, this produces 2 rows.
                            crossAxisCount: 3,
                            //scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            // Generate 100 widgets that display their index in the List.
                            children: vendor.frontImages.map((path) {
                              return Padding(
                                padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                child: InkWell(
                                    onTap: () {},
                                    child: ClipRRect(
                                      child: Image.network(
                                        'https://www.laccademiabjj.it/images/Shop/$path',
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    )),
                              );
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
