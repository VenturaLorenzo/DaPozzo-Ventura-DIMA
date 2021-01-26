import 'package:bloc/bloc.dart';
import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/models/size_model.dart';
import 'package:dapozzo_ventura_app/data/repositories/color_repository.dart';
import 'package:dapozzo_ventura_app/data/repositories/good_image_repository.dart';
import 'package:dapozzo_ventura_app/data/repositories/size_repository.dart';
import 'package:dapozzo_ventura_app/states/good_window_state.dart';

class GoodWindwCubit extends Cubit<GoodWindowState> {
  List<ColorModel> colors;
  List<SizeModel> sizes;
  GoodTypologyModel goodTypology;

  GoodWindwCubit() : super(GoodWindowInitState());

  Future<void> initialize(GoodTypologyModel goodTypology) async {
    colors = await ColorRepository.getGoodTypologyColors(goodTypology);

    if (colors.isNotEmpty) {
      sizes = await SizeRepository.getAvailableSizes(goodTypology, colors[0]);

      filterChange(goodTypology, colors[0]);
    } else {
      emit(GoodWindowColorsNotFoundState());
    }
  }

  Future<void> filterChange(
      GoodTypologyModel goodTypology, ColorModel selectedColor) async {
    emit(GoodWindowImageLoadingState(
        goodTypology, sizes, colors, selectedColor));
    var goodImages =
    await GoodImageRepository.getImages(goodTypology, selectedColor);

    if (goodImages.isNotEmpty) {
      emit(GoodWindowImageLoadedState(
          goodTypology, sizes, colors, selectedColor, goodImages));
    } else {
      emit(GoodWindowImagesNotFuondState());
    }
  }


}
