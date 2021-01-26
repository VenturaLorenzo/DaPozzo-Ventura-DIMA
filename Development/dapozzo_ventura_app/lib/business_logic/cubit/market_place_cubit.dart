import 'package:bloc/bloc.dart';
import 'package:dapozzo_ventura_app/data/models/sport_model.dart';
import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/data/repositories/vendor_repository.dart';
import 'package:dapozzo_ventura_app/states/market_place_state.dart';

class MarketPlaceCubit extends Cubit<MarketPlaceState>{

  List<Vendor> currentVendorsSearch = [];
  List<int> currentCategorySearch = [];
  List<int> currentSportSearch = [];
  String currentTextSearch = "";

  MarketPlaceCubit():super(MarketPlaceLoadingState());

  Future<void> initialize() async {
    final List<Vendor> initialResult =
        await VendorRepository.getVendorsByFiters([], "", []);

    emit(MarketPlaceSearched(initialResult, currentCategorySearch));
  }

  Future<void> searchCategory(int categoryId) async {
    emit(MarketPlaceLoadingState());
      await Future.delayed(Duration(milliseconds: 500));
      _updateCategories(categoryId);

      final List<Vendor> result = await VendorRepository.getVendorsByFiters(
          currentCategorySearch, currentTextSearch, currentSportSearch);
    emit(MarketPlaceSearched(result, currentCategorySearch));


  }
  Future<void> searchSport(SportModel sport) async {
    emit(MarketPlaceLoadingState());
    await Future.delayed(Duration(milliseconds: 500));
    _updateSport(sport);

    emit(MarketPlaceSearched(
        await VendorRepository.getVendorsByFiters(
        currentCategorySearch, currentTextSearch, currentSportSearch),
    currentCategorySearch));
  }
  Future<void> searchText(String text) async {
    emit( MarketPlaceLoadingState());
    await Future.delayed(Duration(milliseconds: 500));
    _updateText(text);

    emit(MarketPlaceSearched(
        await VendorRepository.getVendorsByFiters(currentCategorySearch,
            currentTextSearch, currentSportSearch),
        currentCategorySearch));
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
    if (currentSportSearch.contains(sport.id)) {
      currentSportSearch.remove(sport.id);
    } else {
      currentSportSearch.add(sport.id);
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
}