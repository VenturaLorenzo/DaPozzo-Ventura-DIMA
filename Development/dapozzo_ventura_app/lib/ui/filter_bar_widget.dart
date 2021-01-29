import 'package:dapozzo_ventura_app/business_logic/cubit/market_place_cubit.dart';
import 'package:dapozzo_ventura_app/data/models/category_model.dart';
import 'package:dapozzo_ventura_app/data/models/sport_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterBar extends StatefulWidget {
  final MarketPlaceCubit marketPlaceCubit;
  final List<CategoryModel> categories;
  final List<SportModel> sports;
  final double maxHeight;

  const FilterBar(
      {this.maxHeight, this.marketPlaceCubit, this.categories, this.sports});

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  String previousText = "";

  List<bool> isSelectedCat = [];
  List<bool> isSelectedSport = [];
  TextEditingController _textController;
  double maxHeight;
  double maxselectionFiltersHeight;
  double maxTextFieldHeight;

  @override
  void initState() {
    // TODO: implement initState
    _textController = TextEditingController();
    isSelectedCat = List.generate(widget.categories.length, (index) => false);
    isSelectedSport = List.generate(widget.sports.length, (index) => false);
    maxHeight = widget.maxHeight;
    maxselectionFiltersHeight = maxHeight * 3 / 8;
    maxTextFieldHeight = maxHeight / 4;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Container(
        height: maxHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: maxselectionFiltersHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: maxselectionFiltersHeight / 4,
                    child: Padding(padding: const EdgeInsets.fromLTRB(10, 0, 0, 0) ,
                      child: FittedBox(fit: BoxFit.fill,
                        child: Text(
                          "Sports",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(height:maxselectionFiltersHeight*3 / 4 ,
                    child: SingleChildScrollView(
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
                            size: maxselectionFiltersHeight * 3 / 4,
                          );
                        }).toList(),
                        onPressed: (int index) {
                          setState(() {
                            isSelectedSport[index] = !isSelectedSport[index];
                          });
                          widget.marketPlaceCubit
                              .searchSport(widget.sports[index]);
                        },
                        isSelected: isSelectedSport,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(

              height: maxselectionFiltersHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: maxselectionFiltersHeight / 4,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: FittedBox(fit: BoxFit.fill ,
                        child: Text(
                          "Categories",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(height: maxselectionFiltersHeight *3/ 4,
                    child: SingleChildScrollView(
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
                            size: maxselectionFiltersHeight * 3/4,
                          );
                        }).toList(),
                        onPressed: (int index) {
                          setState(() {
                            isSelectedCat[index] = !isSelectedCat[index];
                          });

                          widget.marketPlaceCubit
                              .searchCategory(widget.categories[index].id);
                        },
                        isSelected: isSelectedCat,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container( decoration: BoxDecoration(
                border: Border.all(color: Colors.black54)
            ),
              height: maxTextFieldHeight,
              child: TextField(
                controller: _textController,
                onSubmitted: (typedText) {
                  if (previousText != typedText) {
                    previousText = typedText;
                    widget.marketPlaceCubit.searchText(typedText);
                  }
                },
                style: TextStyle(fontSize: maxTextFieldHeight/3,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
                decoration: InputDecoration(
                isDense: true,
             contentPadding: EdgeInsets.all( maxTextFieldHeight/6),
                  labelText: "Search for a shop name",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
