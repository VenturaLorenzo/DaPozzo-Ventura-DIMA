import 'package:bloc_test/bloc_test.dart';
import 'package:dapozzo_ventura_app/business_logic/cubit/quantity_cubit.dart';
import 'package:dapozzo_ventura_app/business_logic/cubit/size_cubit.dart';
import 'package:dapozzo_ventura_app/states/quantity_state.dart';
import 'package:dapozzo_ventura_app/states/size_state.dart';
import 'package:flutter_test/flutter_test.dart';


// Mock Bloc

void main() {
  mainCubit();
}

void mainCubit() {
  group('Quantity BLoc Test', () {
    QuantityCubit _quantityCubit;
    setUp(() {
      _quantityCubit = QuantityCubit();
    });
    tearDown(() {
      _quantityCubit.close();
    });
    test("initial state uninitialized", () {
      expect(_quantityCubit.state, QuantityStateUninitialized());
    });
    blocTest(
        "check current state, dovrebbe rispondere con un current state con valore 3",
        build: () => _quantityCubit,
        act: (cubit) => cubit.setQuantity(3),
        expect: [QuantityStateCurrent(3)]);

    blocTest(
        "if we set a current state we get a new current state with new value",
        build: () => _quantityCubit,
        act: (cubit) {cubit.setQuantity(3);cubit.setQuantity(4);},
        expect: [QuantityStateCurrent(3),QuantityStateCurrent(4)]);
    blocTest(
        "se resetto lo stato unitialized ottengo di nuovo lo stato unitialized",
        build: () => _quantityCubit,
        act: (cubit) {cubit.reset();},
        expect: [QuantityStateUninitialized()]);
    blocTest(
        "se setto lo stato a a un valore e poi resetto ottengo uno stato unitializzato",
        build: () => _quantityCubit,
        act: (cubit) {cubit.setQuantity(3);cubit.reset();},
        expect: [QuantityStateCurrent(3),QuantityStateUninitialized()]);

  });
}