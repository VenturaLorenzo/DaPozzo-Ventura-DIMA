
import 'package:dapozzo_ventura_app/business_logic/events/market_place_event.dart';
import 'package:dapozzo_ventura_app/data/models/category_model.dart';
import 'package:dapozzo_ventura_app/data/models/sport_model.dart';
import 'package:flutter/material.dart';

class FilterBar extends StatefulWidget {
  final marketPlaceBloc;
  final List<CategoryModel> categories;
  const FilterBar({this.marketPlaceBloc,this.categories});

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  //final _marketPlaceBloc;

  String currentCategoryQuery = "";
  String currentSportQuery = "";
  String currentTextQuery = "";

  final List<Sport> sports = [
    Sport(Icons.sentiment_very_dissatisfied, "basket"),
    Sport(Icons.search, "calcio"),
    Sport(Icons.polymer, "golf"),
    Sport(Icons.gesture, "atletica"),
    Sport(Icons.arrow_drop_down_circle, "nuoto"),
    Sport(Icons.sentiment_very_dissatisfied, "pallavolo"),
  ];
  List<bool> isSelectedCat = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> isSelectedSport = [false, false, false, false, false, false];
  TextEditingController _textController;
@override
  void initState() {
    // TODO: implement initState
  _textController = TextEditingController();

  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Text(
                "Sports",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ToggleButtons(
              children: sports.map((sport) {
                return Padding(
                    padding: EdgeInsets.fromLTRB(9, 0, 9, 0),
                    child: Icon(
                      sport.icon,
                      size: 50,
                    ));
              }).toList(),
              onPressed: (int index) {
                setState(() {
                  isSelectedSport[index] = !isSelectedSport[index];
                  if (isSelectedSport[index]) {
                    currentSportQuery =
                        currentSportQuery + sports[index].name + ",";
                  } else {
                    currentSportQuery = currentSportQuery.replaceAll(
                        sports[index].name + ",", "");
                  }
                });
              },
              isSelected: isSelectedSport,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ToggleButtons(
              children: widget.categories.map((cat) {
                return Padding(
                    padding: EdgeInsets.fromLTRB(9, 0, 9, 0),
                    child: Icon(
                      cat.icon,
                      size: 50,
                    ));
              }).toList(),
              onPressed: (int index) {
                setState(() {
                  isSelectedCat[index] = !isSelectedCat[index];
                  if (isSelectedCat[index]) {
                    currentCategoryQuery =
                        currentCategoryQuery + widget.categories[index].name + ",";
                  } else {
                    currentCategoryQuery = currentCategoryQuery.replaceAll(
                        widget.categories[index].name + ",", "");
                  }
                });
                widget.marketPlaceBloc.add(MarketPlaceSearch(
                    currentTextQuery + "-" + currentCategoryQuery));
              },
              isSelected: isSelectedCat,
            ),
          ),
          TextField(
            controller: _textController,
            onSubmitted: (typedText) {
              currentTextQuery = typedText;
              widget.marketPlaceBloc.add(
                  MarketPlaceSearch(typedText + "-" + currentCategoryQuery));
            },
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
            decoration: InputDecoration(
              labelText: "Search for a shop name",
            ),
          ),
        ],
      ),
    );
  }
}
