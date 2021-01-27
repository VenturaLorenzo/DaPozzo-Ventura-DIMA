import 'package:bloc/bloc.dart';
import 'package:dapozzo_ventura_app/data/models/sport_model.dart';
import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/data/repositories/vendor_repository.dart';
import 'package:dapozzo_ventura_app/states/market_place_state.dart';

class MarketPlaceCubit extends Cubit<MarketPlaceState> {
  List<int> currentCategorySearch = [];
  List<int> currentSportSearch = [];
  String currentTextSearch = "";
  VendorRepository _vendorRepository;

  MarketPlaceCubit(this._vendorRepository) : super(MarketPlaceInitial());

  MarketPlaceState get initialState => MarketPlaceInitial();

  Future<void> restore() async{
    currentCategorySearch=[];
    currentSportSearch=[];
    currentTextSearch="";
    emit(MarketPlaceInitial());
  }
  Future<void> initialize() async {
   // _vendorRepository = VendorRepository();
    Future.delayed(Duration(milliseconds:  2000));
    emit(MarketPlaceLoadingState());

    final List<Vendor> initialResult =
        await _vendorRepository.getVendorsByFiters([], "", []);

    emit(MarketPlaceSearched(initialResult, currentCategorySearch));
  }

  Future<void> searchCategory(int categoryId) async {
    emit(MarketPlaceLoadingState());
    await Future.delayed(Duration(milliseconds: 500));
    _updateCategories(categoryId);

    final List<Vendor> result = await _vendorRepository.getVendorsByFiters(
        currentCategorySearch, currentTextSearch, currentSportSearch);
    emit(MarketPlaceSearched(result, currentCategorySearch));
  }

  Future<void> searchSport(SportModel sport) async {
    emit(MarketPlaceLoadingState());
    await Future.delayed(Duration(milliseconds: 500));
    _updateSport(sport);

    emit(MarketPlaceSearched(
        await _vendorRepository.getVendorsByFiters(
            currentCategorySearch, currentTextSearch, currentSportSearch),
        currentCategorySearch));
  }

  Future<void> searchText(String text) async {
    emit(MarketPlaceLoadingState());
    await Future.delayed(Duration(milliseconds: 500));
    _updateText(text);

    emit(MarketPlaceSearched(
        await _vendorRepository.getVendorsByFiters(
            currentCategorySearch, currentTextSearch, currentSportSearch),
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
