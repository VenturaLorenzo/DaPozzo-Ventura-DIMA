import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../lib/business_logic/cubit/vendor_cubit.dart';
import '../../lib/data/models/good_typology_model.dart';
import '../../lib/data/models/vendor_model.dart';
import '../../lib/data/repositories/goods_typology_repository.dart';
import '../../lib/states/vendor_state.dart';

class MockGoodTypologyRepository extends Mock
    implements GoodsTypologyRepository {}

class MockVendor extends Mock implements Vendor {}

class MockGoodTypology extends Mock implements GoodTypologyModel {}

// Mock Bloc

void main() {
  mainCubit();
}

void mainCubit() {
  group('MarketPlace BLoc Test', () {
    GoodTypologyModel good;
    MockGoodTypologyRepository repo;

    setUp(() {
      good = MockGoodTypology();
      repo = MockGoodTypologyRepository();

      when(repo.getGoodsTypologies([], -1, 1)).thenAnswer((_) async => [good]);
    });
    tearDown(() {});

    test("initial state uninitialized", () {
      expect(VendorCubit(repo).state, VendorStateInitial());
    });

    test('test that repository mock work as intended returning a list of goods',
        () async {
      expect(await repo.getGoodsTypologies([], -1, 1),
          isA<List<GoodTypologyModel>>());
    });

    blocTest(
        "test that initialize() method return a Searced state with all empty values",
        build: () {
          return VendorCubit(repo);
        },
        act: (VendorCubit cubit) => cubit.initialize([], MockVendor()),
        expect: [
          VendorStateLoading(),
          VendorStateSearched([good])
        ]);
    blocTest("test that search(filters) return a searched state ",
        build: () {
          return VendorCubit(repo);
        },
        act: (VendorCubit cubit) => cubit.search([], -1, 1),
        expect: [
          VendorStateLoading(),
          VendorStateSearched([good])
        ]);

    blocTest(
        "test that calling restore from a searched state the output is a initialState",
        build: () {
      final cubit = VendorCubit(repo);

      return cubit;
    }, act: (VendorCubit cubit) async {
      await cubit.search([], -1, 1);
      return await cubit.restore();
    }, expect: [
      VendorStateLoading(),
      VendorStateSearched([good]),
      VendorStateInitial()
    ]);
  });
}
