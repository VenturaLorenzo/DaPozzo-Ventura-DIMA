import 'package:dapozzo_ventura_app/business_logic/cubit/market_place_cubit.dart';
import 'package:dapozzo_ventura_app/data/models/category_model.dart';
import 'package:dapozzo_ventura_app/data/models/sport_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    maxHeight = widget.maxHeight;
    maxselectionFiltersHeight = maxHeight * 3 / 8;
    maxTextFieldHeight = maxHeight / 4;
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          "Sports",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: maxselectionFiltersHeight * 3 / 4,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ToggleButtons(
                        color: Color.fromARGB(200, 0, 0, 0),
                        selectedColor: Colors.grey[50],
                        selectedBorderColor: Color.fromARGB(0, 0, 0, 0),
                        borderColor: Color.fromARGB(0, 0, 0, 0),
                        fillColor: Colors.grey[200],
                        children: widget.sports.map((sport) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: Image(
                              image: AssetImage("lib/assets/" + sport.icon),
                              height: maxselectionFiltersHeight * 3 / 4,
                            ),
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
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          "Categories",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: maxselectionFiltersHeight * 3 / 4,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ToggleButtons(
                        color: Color.fromARGB(200, 0, 0, 0),
                        selectedColor: Colors.green[300],
                        selectedBorderColor: Color.fromARGB(0, 0, 0, 0),
                        borderColor: Color.fromARGB(0, 0, 0, 0),
                        fillColor: Colors.grey[200],
                        children: widget.categories.map((cat) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child:
                                // SvgPicture.asset("lib/assets/" + cat.icon)
                                Image(
                              image: AssetImage(
                                "lib/assets/" + cat.icon,
                              ),
                              height: maxselectionFiltersHeight * 3 / 4,
                            ),
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
            Container(
              height: maxTextFieldHeight,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(4.0, 4.0),
                      blurRadius: 5.0,
                      spreadRadius: 1,
                    ),
                  ]),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Ricerca il Negozio che vuoi",
                  labelText: "Shops",
                  labelStyle: TextStyle(
                    fontSize: maxTextFieldHeight / 3,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                    color: Colors.black54,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(maxTextFieldHeight / 6),
                ),
                controller: _textController,
                onSubmitted: (typedText) {
                  if (previousText != typedText) {
                    previousText = typedText;
                    widget.marketPlaceCubit.searchText(typedText);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
