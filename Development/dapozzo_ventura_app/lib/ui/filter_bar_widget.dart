
import 'package:dapozzo_ventura_app/business_logic/events/market_place_event.dart';
import 'package:dapozzo_ventura_app/data/models/category_model.dart';
import 'package:dapozzo_ventura_app/data/models/sport_model.dart';
import 'package:flutter/material.dart';

class FilterBar extends StatefulWidget {
  final marketPlaceBloc;
  final List<CategoryModel> categories;
  final List<Sport> sports;

  const FilterBar({this.marketPlaceBloc,this.categories, this.sports});

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {



  List<bool> isSelectedCat =[];
  List<bool> isSelectedSport = [];
  TextEditingController _textController;
@override
  void initState() {
    // TODO: implement initState
  _textController = TextEditingController();
  isSelectedCat= List.generate(widget.categories.length, (index) => false);
  isSelectedSport= List.generate(widget.sports.length, (index) => false);

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
              children: widget.sports.map((sport) {
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

                });
                widget.marketPlaceBloc.add(MarketPlaceSearchSport(widget.sports[index]));

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
                      //cat.icon,
                      Icons.ac_unit,
                      size: 50,
                    ));
              }).toList(),
              onPressed: (int index) {
                setState(() {
                  isSelectedCat[index] = !isSelectedCat[index];

                });

                widget.marketPlaceBloc.add(MarketPlaceSearchCategory(widget.categories[index].id
                ));
              },
              isSelected: isSelectedCat,
            ),
          ),
          TextField(
            controller: _textController,
            onSubmitted: (typedText) {
              widget.marketPlaceBloc.add(MarketPlaceSearchText(typedText));
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
