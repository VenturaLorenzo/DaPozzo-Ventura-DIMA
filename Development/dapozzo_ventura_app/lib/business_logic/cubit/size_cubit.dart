import 'package:bloc/bloc.dart';
import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/repositories/size_repository.dart';
import 'package:dapozzo_ventura_app/states/size_state.dart';
import 'package:dapozzo_ventura_app/ui/size_selector.dart';

class SizeCubit extends Cubit<SizeState> {
  SizeCubit() : super(SizeStateUninitialized());

  Future<void> setSize(String s) async {
    emit(SizeStateCurrent(s));
  }

  Future<void> filterChange(
      GoodTypologyModel goodTypology, ColorModel selectedColor) async {
    var sizes =
        await SizeRepository.getAvailableSizes(goodTypology, selectedColor);
    var _currentsize = getSizesNames(sizes);
    emit(SizeStateCurrent(_currentsize[0]));
  }

  Future<void> reset() async {
    emit(SizeStateUninitialized());
  }
}
