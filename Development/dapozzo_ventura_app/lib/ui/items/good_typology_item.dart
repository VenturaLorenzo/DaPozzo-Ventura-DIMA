import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:flutter/material.dart';

class GoodsTypologyItem extends StatelessWidget {
  final GoodTypologyModel goodsTypology;
  final itemHeight;
  const GoodsTypologyItem({this.itemHeight, this.goodsTypology});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Container(
        height: itemHeight,
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
        child: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, "/goodtypology",
                arguments: goodsTypology);
          },
          child: Row(children: [
            SizedBox(
                height: itemHeight,
                width: MediaQuery.of(context).size.width / 3,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(itemHeight / 18,
                        itemHeight / 36, itemHeight / 18, itemHeight / 36),
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
                  height: itemHeight,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(itemHeight / 36,
                          itemHeight / 36, itemHeight / 36, itemHeight / 36),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                child: Text(
                              '${goodsTypology.categoryName}',
                              style: TextStyle(
                                fontSize: itemHeight / 10,
                                fontWeight: FontWeight.w300,
                              ),
                            )),
                            SizedBox(
                              child: Text(
                                '${goodsTypology.name}',
                                style: TextStyle(
                                  fontSize: itemHeight / 8,
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
                                          fontSize: itemHeight / 8,
                                          fontWeight: FontWeight.w200,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ))
                                ]),
                          ]))),
            ),
            SizedBox(
              height: itemHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: itemHeight / 2,
                    child: Center(
                        child: Text(
                      '${goodsTypology.price}' + '€',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.green,
                          fontSize: itemHeight / 6),
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
