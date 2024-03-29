import 'package:bloc/bloc.dart';

import '../../data/models/color_model.dart';
import '../../data/models/good_typology_model.dart';
import '../../data/models/size_model.dart';
import '../../data/models/vendor_model.dart';
import '../../data/repositories/color_repository.dart';
import '../../data/repositories/good_image_repository.dart';
import '../../data/repositories/size_repository.dart';
import '../../data/repositories/vendor_repository.dart';
import '../../states/good_window_state.dart';

class GoodWindwCubit extends Cubit<GoodWindowState> {
  List<ColorModel> colors;
  List<SizeModel> sizes;
  GoodTypologyModel goodTypology;
  List<Vendor> vendor;

  GoodWindwCubit() : super(GoodWindowInitState());

  Future<void> initialize(GoodTypologyModel goodTypology) async {
    if (state is GoodWindowInitState) {
      colors = await ColorRepository.getGoodTypologyColors(goodTypology);
      if (colors.isNotEmpty) {
        sizes = await SizeRepository.getAvailableSizes(goodTypology, colors[0]);
        vendor = await VendorRepository.getVendor(goodTypology);
        filterChange(goodTypology, colors[0]);
      } else {
        emit(GoodWindowColorsNotFoundState());
      }
    }
  }

  Future<void> filterChange(
      GoodTypologyModel goodTypology, ColorModel selectedColor) async {
    emit(GoodWindowImageLoadingState(
        goodTypology, sizes, colors, selectedColor, vendor[0]));

    var goodImages =
        await GoodImageRepository.getImages(goodTypology, selectedColor);
    sizes = await SizeRepository.getAvailableSizes(goodTypology, selectedColor);
    await Future.delayed(Duration(milliseconds: 500));

    if (goodImages.isNotEmpty) {
      if (sizes.isEmpty) {
        sizes.add(SizeModel(name: "none", id: 6));
      }

      emit(GoodWindowImageLoadedState(
          goodTypology, sizes, colors, selectedColor, vendor[0], goodImages));
    } else {
      emit(GoodWindowImagesNotFuondState());
    }
  }

  Future<void> reset() {
    sizes = [];
    goodTypology = null;
    colors = [];
    emit(GoodWindowInitState());
  }
}
