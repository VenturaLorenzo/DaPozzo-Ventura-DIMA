import 'dart:async';
import 'package:dapozzo_ventura_app/data/models/sport_model.dart';
import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';
import 'package:dapozzo_ventura_app/data/repositories/vendor_repository.dart';
import 'package:dapozzo_ventura_app/states/market_place_state.dart';
import '../events/market_place_event.dart';
import 'package:bloc/bloc.dart';

class MarketPlaceBloc extends Bloc<MarketPlaceEvent, MarketPlaceState> {
  List<Vendor> currentVendorsSearch = [];
  List<int> currentCategorySearch = [];
  List<SportModel> currentSportSearch = [];
  String currentTextSearch = "";

  @override
  MarketPlaceState get initialState => MarketPlaceLoadingState();

  @override
  Stream<MarketPlaceState> mapEventToState(MarketPlaceEvent event) async* {
    final dbHelper = DatabaseHelper.instance;

    if (event is MarketPlaceInit) {
      final List<Vendor> initialResult =
          await VendorRepository.getVendorsByTextAndCategory([], "");

      yield MarketPlaceInitial(initialResult);
    } else {
      if (event is MarketPlaceSearchCategory) {
        yield MarketPlaceLoadingState();
        await Future.delayed(Duration(milliseconds: 500));
        _updateCategories(event.categoryId);

        final List<Vendor> result =
            await VendorRepository.getVendorsByTextAndCategory(
                currentCategorySearch, currentTextSearch);
        //await dbHelper.queryVendors(name, categories);
        // per ora creo un market place vuoto e lo passo come risultato

        yield MarketPlaceSearched(result);
      } else {
        if (event is MarketPlaceSearchSport) {
          yield MarketPlaceLoadingState();
          await Future.delayed(Duration(milliseconds: 500));
          _updateSport(event.sport);

          yield MarketPlaceSearched(
              await VendorRepository.getVendorsByTextAndCategory(
                  currentCategorySearch, currentTextSearch));
        } else {
          if (event is MarketPlaceSearchText) {
            yield MarketPlaceLoadingState();
            await Future.delayed(Duration(milliseconds: 500));
            _updateText(event.text);

            yield MarketPlaceSearched(
                await VendorRepository.getVendorsByTextAndCategory(
                    currentCategorySearch, currentTextSearch));
          } else {
            if (event is MarketPlaceReset) {
              final List<Vendor> initialResult =
                  await VendorRepository.getAllVendors();
              _resetSearch();
              yield MarketPlaceInitial(initialResult);
            } else {
              yield MarketPlaceGeneralError("Unknown Action");
            }
          }
        }
      }
    }
  }

  void _updateCategories(int categoryId) {
    if (currentCategorySearch.contains(categoryId)) {
      currentCategorySearch.remove(categoryId);
    } else {
      currentCategorySearch.add(categoryId);
    }
    print("sto cercando i venditori con categoria " +
        currentCategorySearch.toString() +
        " ,sport " +
        currentSportSearch.toString() +
        " e testo : " +
        currentTextSearch);
  }

  void _updateSport(SportModel sport) {
    if (currentSportSearch.contains(sport)) {
      currentSportSearch.remove(sport);
    } else {
      currentSportSearch.add(sport);
    }
    print("sto cercando i venditori con categoria " +
        currentCategorySearch.toString() +
        " ,sport " +
        currentSportSearch.toString() +
        " e testo : " +
        currentTextSearch);
  }

  void _updateText(String text) {
    currentTextSearch = text;
    print("sto cercando i venditori con categoria " +
        currentCategorySearch.toString() +
        " ,sport " +
        currentSportSearch.toString() +
        " e testo : " +
        currentTextSearch);
  }

  void _resetSearch() {
    currentTextSearch = "";
    currentSportSearch = [];
    currentCategorySearch = [];
  }
}
