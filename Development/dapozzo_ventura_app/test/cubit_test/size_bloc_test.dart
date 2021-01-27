import 'package:bloc_test/bloc_test.dart';
import 'package:dapozzo_ventura_app/business_logic/cubit/size_cubit.dart';
import 'package:dapozzo_ventura_app/states/size_state.dart';
import 'package:flutter_test/flutter_test.dart';


// Mock Bloc

void main() {
  mainCubit();
}

void mainCubit() {
  group('whenListen', () {
    SizeCubit _sizeCubit;
    setUp(() {
      _sizeCubit = SizeCubit();
    });
    tearDown(() {
      _sizeCubit.close();
    });
    test("initial state uninitialized", () {
      expect(_sizeCubit.state, SizeStateUninitialized());
    });

    blocTest(
        "check that when we set size to s it is actual setted",
        build: () => _sizeCubit,
        act: (cubit) => cubit.setSize("S"),
        expect: [SizeStateCurrent("S")]);
    blocTest(
        "if we set a current state we get a new current state with new value",
        build: () => _sizeCubit,
        act: (cubit) {cubit.setSize("S"); cubit.setSize("M");},
        expect: [SizeStateCurrent("S"),SizeStateCurrent("M")]);
    blocTest(
        "se resetto lo stato unitialized ottengo di nuovo lo stato unitialized",
        build: () => _sizeCubit,
        act: (cubit) {cubit.reset();},
        expect: [SizeStateUninitialized()]);
    blocTest(
        "se setto lo stato a a un valore e poi resetto ottengo uno stato unitializzato",
        build: () => _sizeCubit,
        act: (cubit) {cubit.setSize("S");cubit.reset();},
        expect: [SizeStateCurrent("S"),SizeStateUninitialized()]);

  });
}
