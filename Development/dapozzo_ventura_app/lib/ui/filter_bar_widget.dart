import 'package:dapozzo_ventura_app/blocs/market_place_bloc.dart';
import 'package:dapozzo_ventura_app/events/market_place_event.dart';
import 'package:dapozzo_ventura_app/models/category_model.dart';
import 'package:dapozzo_ventura_app/models/sport_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterBar extends StatefulWidget {
  final marketPlaceBloc;

  const FilterBar({this.marketPlaceBloc});

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  //final _marketPlaceBloc;

  String currentCategoryQuery = "";
  String currentSportQuery = "";
  String currentTextQuery = "";
  final List<Category> categories = [
    Category(Icons.sentiment_very_dissatisfied, "felpa"),
    Category(Icons.search, "guanti"),
    Category(Icons.arrow_drop_down_circle, "scarpe"),
    Category(Icons.gesture, "pantaloni"),
    Category(Icons.polymer, "giacca"),
    Category(Icons.sentiment_very_dissatisfied, "calze"),
    Category(Icons.search, "intimo"),
    Category(Icons.arrow_drop_down_circle, "sciarpa"),
    Category(Icons.gesture, "cappello"),
  ];
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
              children: categories.map((cat) {
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
                        currentCategoryQuery + categories[index].name + ",";
                  } else {
                    currentCategoryQuery = currentCategoryQuery.replaceAll(
                        categories[index].name + ",", "");
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
