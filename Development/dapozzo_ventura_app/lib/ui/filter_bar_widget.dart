import 'package:dapozzo_ventura_app/business_logic/cubit/market_place_cubit.dart';
import 'package:dapozzo_ventura_app/data/models/category_model.dart';
import 'package:dapozzo_ventura_app/data/models/sport_model.dart';
import 'package:flutter/material.dart';

class FilterBar extends StatefulWidget {
  final MarketPlaceCubit marketPlaceCubit;
  final List<CategoryModel> categories;
  final List<SportModel> sports;

  const FilterBar({this.marketPlaceCubit, this.categories, this.sports});

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  List<bool> isSelectedCat = [];
  List<bool> isSelectedSport = [];
  TextEditingController _textController;
  @override
  void initState() {
    // TODO: implement initState
    _textController = TextEditingController();
    isSelectedCat = List.generate(widget.categories.length, (index) => false);
    isSelectedSport = List.generate(widget.sports.length, (index) => false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: Text(
              "Sports",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ToggleButtons(
              color: Color.fromARGB(200, 0, 0, 0),
              selectedColor: Color.fromARGB(100, 0, 0, 0),
              selectedBorderColor: Color.fromARGB(0, 0, 0, 0),
              borderColor: Color.fromARGB(0, 0, 0, 0),
              fillColor: Color.fromARGB(0, 0, 0, 0),
              children: widget.sports.map((sport) {
                return Icon(
                  Icons.favorite,
                  size: MediaQuery.of(context).size.width / 7,
                );
              }).toList(),
              onPressed: (int index) {
                setState(() {
                  isSelectedSport[index] = !isSelectedSport[index];
                });
                widget.marketPlaceCubit.searchSport(widget.sports[index]);
              },
              isSelected: isSelectedSport,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ToggleButtons(
              color: Color.fromARGB(200, 0, 0, 0),
              selectedColor: Color.fromARGB(100, 0, 0, 0),
              selectedBorderColor: Color.fromARGB(0, 0, 0, 0),
              borderColor: Color.fromARGB(0, 0, 0, 0),
              fillColor: Color.fromARGB(0, 0, 0, 0),
              children: widget.categories.map((cat) {
                return Icon(
                  //cat.icon,
                  Icons.ac_unit,
                  size: 50,
                );
              }).toList(),
              onPressed: (int index) {
                setState(() {
                  isSelectedCat[index] = !isSelectedCat[index];
                });

                widget.marketPlaceCubit.searchCategory(widget.categories[index].id);
              },
              isSelected: isSelectedCat,
            ),
          ),
          TextField(
            controller: _textController,
            onSubmitted: (typedText) {
              widget.marketPlaceCubit.searchText(typedText);
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
