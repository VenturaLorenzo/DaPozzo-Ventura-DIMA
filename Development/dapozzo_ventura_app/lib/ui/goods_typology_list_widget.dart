import 'package:dapozzo_ventura_app/models/good_typology_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoodTypologyList extends StatelessWidget {
  final List<GoodTypology> goodTypologylist;

GoodTypologyList(this.goodTypologylist);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: goodTypologylist.length,
      itemBuilder: (context, index) => Card(
        child: Column(
          children: [SizedBox(height: 100,),
            RaisedButton(child: Text(goodTypologylist[index].toString()),onPressed: (){
              Navigator.pushNamed(context, "/goodtypology" , arguments: goodTypologylist[index]);
            },),
          ],
        ),
      ),
    );
  }
}