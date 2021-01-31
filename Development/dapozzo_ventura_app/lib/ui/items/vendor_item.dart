

import 'package:dapozzo_ventura_app/business_logic/cubit/vendor_cubit.dart';

import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VendorItem extends StatelessWidget {
  final Vendor vendor;
  final List<int> selectedCategories;
  double itemHeight;

  VendorItem({Key key, this.vendor, this.selectedCategories});

  @override
  Widget build(BuildContext context) {
    itemHeight= MediaQuery.of(context).size.height*2/3;
    return Padding(
      padding: EdgeInsets.fromLTRB(itemHeight/20,itemHeight/40,itemHeight/20,itemHeight/40,),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(8.0, 8.0),
                  blurRadius: 5.0,
                  spreadRadius: 2,
                ),
              ]),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  BlocProvider.of<VendorCubit>(context)
                      .initialize(selectedCategories, vendor);
                  Navigator.pushNamed(context, '/vendor', arguments: {
                    "vendor": vendor,
                    "preselectedCategories": selectedCategories
                  });
                },
                child: Container(
                    height: itemHeight/ 1.8,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      child: Image.network(
                        'https://www.laccademiabjj.it/images/sfondi/${vendor.image}',
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                    )),
              ),
              SizedBox(
                height:itemHeight/120,
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
                            fontSize: MediaQuery.of(context).size.height/25,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          initialRating: vendor.rating,
                          itemSize: MediaQuery.of(context).size.height/45,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.black87,
                          ),
                          onRatingUpdate: null,
                        ),
                        Text(
                          '${vendor.rating}',
                        ),
                      ],
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(20),
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
                                padding: EdgeInsets.fromLTRB(itemHeight/80,itemHeight/120, itemHeight/80,itemHeight/120),
                                child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<VendorCubit>(context)
                                          .initialize(
                                              selectedCategories, vendor);
                                      Navigator.pushNamed(context, '/vendor',
                                          arguments: {
                                            "vendor": vendor,
                                            "preselectedCategories":
                                                selectedCategories
                                          });
                                    },
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
