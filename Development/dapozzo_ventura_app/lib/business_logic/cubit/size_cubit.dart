import 'package:bloc/bloc.dart';
import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/models/size_model.dart';
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
    List<SizeModel> sizesModels =
        await SizeRepository.getAvailableSizes(goodTypology, selectedColor);
    List<String> sizes = getSizesNames(sizesModels);
    if(sizes.isNotEmpty){
      emit(SizeStateCurrent(sizes[0]));

    }else{
      emit(SizeStateCurrent("none"));

    }
  }

  Future<void> reset() async {
    emit(SizeStateUninitialized());
  }
}
