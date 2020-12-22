import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:flutter/material.dart';

class GoodsTypologyItem extends StatelessWidget {
  final GoodTypologyModel goodsTypology;

  const GoodsTypologyItem({this.goodsTypology});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Container(
        height: 100,
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
        child: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, "/goodtypology",
                arguments: goodsTypology);
          },
          child: Row(children: [
            SizedBox(
                height: 100,
                width: 120,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2.5),
                      child: Image.network(
                        'https://www.laccademiabjj.it/images/Shop/' +
                            '${goodsTypology.image}',
                        fit: BoxFit.cover,
                      ),
                    ))),
            Expanded(
              child: SizedBox(
                  height: 100,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                child: Text(
                              '${goodsTypology.categoryName}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            )),
                            SizedBox(
                              child: Text(
                                '${goodsTypology.name}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      child: Expanded(
                                    child: Text(
                                      '${goodsTypology.description}',
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ))
                                ]),
                          ]))),
            ),
            SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    child: Center(
                        child: Text(
                      '${goodsTypology.price}' + '€',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.green,
                          fontSize: 20),
                    )),
                  ),
                  SizedBox(child: Icon(Icons.arrow_forward_ios))
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
