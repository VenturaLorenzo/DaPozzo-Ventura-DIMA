import 'package:bloc_test/bloc_test.dart';
import 'package:dapozzo_ventura_app/business_logic/cubit/market_place_cubit.dart';
import 'package:dapozzo_ventura_app/data/models/sport_model.dart';
import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';
import 'package:dapozzo_ventura_app/data/repositories/vendor_repository.dart';
import 'package:dapozzo_ventura_app/states/market_place_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockVendorRepository extends Mock implements VendorRepository {}

class MockDatabase extends Mock implements DatabaseHelper {}

class MockVendor extends Mock implements Vendor {}

// Mock Bloc

void main() {
  mainCubit();
}

void mainCubit() {
  group('MarketPlace BLoc Test', () {
    Vendor vendor;
    MockVendorRepository repo;

    setUp(() {
      vendor = MockVendor();
      repo = MockVendorRepository();

      when(repo.getVendorsByFiters([], "", []))
          .thenAnswer((_) async => [vendor]);
    });
    tearDown(() {});

    test("initial state uninitialized", () {
      expect(MarketPlaceCubit(repo).state, MarketPlaceInitial());
    });

    test(
        'test that repository mock work as intended returning a list of vendor',
        () async {
      expect(await repo.getVendorsByFiters([], "", []), isA<List<Vendor>>());
    });

    blocTest("test that initialize() method return a Searced state with all empty values",
        build: () {
          return MarketPlaceCubit(repo);
        },
        act: (cubit) => cubit.initialize(),
        expect: [
          MarketPlaceLoadingState(),
          MarketPlaceSearched([vendor], [])
        ]);
    blocTest("test that searchCategory(cat) return a searched state where the current category search is cats",
        build: () {
          return MarketPlaceCubit(repo);
        },
        act: (MarketPlaceCubit cubit) => cubit.searchCategory(3),
        expect: [
          MarketPlaceLoadingState(),
          MarketPlaceSearched([vendor], [3])
        ]);
    blocTest("test that searchText(Text) return a searched state",
        build: () {
          return MarketPlaceCubit(repo);
        },
        act: (MarketPlaceCubit cubit) => cubit.searchText("test"),
        expect: [
          MarketPlaceLoadingState(),
          MarketPlaceSearched([vendor], [])
        ]);
    blocTest("test that searchSport(cat) return a searched state",
        build: () {
          return MarketPlaceCubit(repo);
        },
        act: (MarketPlaceCubit cubit) => cubit.searchSport(SportModel(id: 2,name: "calcio")),
        expect: [
          MarketPlaceLoadingState(),
          MarketPlaceSearched([vendor], [])
        ]);
    blocTest("test that searchCategory(cat1 ) plus searchCategorY(cat2) return a searched state where the current category search is [ cat1,cat2]",
        build: () {
          return MarketPlaceCubit(repo);
        },
        act: (MarketPlaceCubit cubit) {cubit.searchCategory(3);
        return cubit.searchCategory(4);},
        expect: [

          MarketPlaceLoadingState(),
          MarketPlaceSearched([vendor], [3,4]),

        ]);
    blocTest("test that searchCategory(cat1 ) plus searchCategorY(cat 1) return a searched state where the current category search is []",
        build: () {
           return MarketPlaceCubit(repo);
        },
        act: (MarketPlaceCubit cubit) {
      cubit.searchCategory(3);
      return cubit.searchCategory(3);},
        expect: [

          MarketPlaceLoadingState(),
          MarketPlaceSearched([vendor], []),

        ]);
    blocTest("test that calling restore from a searched state the output is a initialState",
        build: () {final cubit= MarketPlaceCubit(repo);
        cubit.searchCategory(4);
        return cubit;
        },
        act: (MarketPlaceCubit cubit) {
         // cubit.searchCategory(3);
          return cubit.restore();},
        expect: [

         MarketPlaceInitial()

        ]);
  });
}
