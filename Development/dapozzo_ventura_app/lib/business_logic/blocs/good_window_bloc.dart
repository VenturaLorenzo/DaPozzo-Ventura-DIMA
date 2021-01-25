import 'package:dapozzo_ventura_app/business_logic/events/good_window_event.dart';
import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/models/size_model.dart';
import 'package:dapozzo_ventura_app/data/repositories/color_repository.dart';
import 'package:dapozzo_ventura_app/data/repositories/good_image_repository.dart';
import 'package:dapozzo_ventura_app/data/repositories/size_repository.dart';
import 'package:dapozzo_ventura_app/states/good_window_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoodWindowBloc extends Bloc<GoodWindowEvent, GoodWindowState> {
  List<ColorModel> colors;
  List<SizeModel> sizes;
  GoodTypologyModel goodTypology;

  @override
  GoodWindowState get initialState => GoodWindowInitState();

  @override
  Stream<GoodWindowState> mapEventToState(GoodWindowEvent event) async* {
    if (event is GoodWindowEventInitialize) {
      colors = await ColorRepository.getGoodTypologyColors(event.goodTypology);
      sizes =
      await SizeRepository.getAvailableSizes(event.goodTypology, colors[0]);

      if (colors.isNotEmpty) {
        add(new GoodWindowEventFilterChange(event.goodTypology, colors[0]));
      } else {
        yield (new GoodWindowColorsNotFoundState());
      }
    }

    if (event is GoodWindowEventFilterChange) {
      yield new GoodWindowImageLoadingState(
          event.goodTypology, sizes, colors, event.selectedColor);
      var goodImages = await GoodImageRepository.getImages(
          event.goodTypology, event.selectedColor);

      if (goodImages.isNotEmpty) {
        yield GoodWindowImageLoadedState(
            event.goodTypology, sizes, colors, event.selectedColor, goodImages);
      } else {
        yield (new GoodWindowImagesNotFuondState());
      }
    }
  }
}
