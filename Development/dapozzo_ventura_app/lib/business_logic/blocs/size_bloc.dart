import 'package:dapozzo_ventura_app/business_logic/events/size_event.dart';
import 'package:dapozzo_ventura_app/data/models/size_model.dart';
import 'package:dapozzo_ventura_app/data/repositories/size_repository.dart';
import 'package:dapozzo_ventura_app/states/size_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SizeBloc extends Bloc<SizeEvent, SizeState> {
  List<SizeModel> sizes=[];
  @override
  SizeState get initialState => SizeStateUninitialized();

  @override
  Stream<SizeState> mapEventToState(SizeEvent event) async* {
    if(event is SizeEventInitialize){
      sizes= await SizeRepository.getGoodTypologySizes(event.goodtype);
      yield SizeStateInitialized(sizes,sizes[0]);
    }else{
      if(event is SizeEventUninitialize){
        yield SizeStateUninitialized();
      }else{
        if(event is SizeEventSearch){
          yield SizeStateInitialized(sizes, event.size);
        }
      }
    }

  }
}
