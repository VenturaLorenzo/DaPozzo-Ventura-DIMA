
import 'package:bloc/bloc.dart';
import 'package:dapozzo_ventura_app/data/models/size_model.dart';
import 'package:dapozzo_ventura_app/states/size_state.dart';

class SizeCubit extends Cubit<SizeState> {


  SizeCubit() : super(SizeStateUninitialized()) ;



  Future<void> setSize(String s) async {
    emit(SizeStateCurrent(s));
  }

  Future<void> reset() async {
    emit(SizeStateUninitialized());
  }
}