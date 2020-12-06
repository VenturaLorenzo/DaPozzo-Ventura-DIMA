import 'package:dapozzo_ventura_app/events/vendor_event.dart';
import 'package:dapozzo_ventura_app/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/states/vendor_state.dart';
import 'package:bloc/bloc.dart';

import '../database_helper.dart';

class VendorBloc extends Bloc<VendorEvent, VendorState> {
  VendorState get initialState => VendorStateLoading();

  @override
  Stream<VendorState> mapEventToState(VendorEvent event) async* {
    final dbHelper = DatabaseHelper.instance;

    if (event is VendorEventInit) {
      print(event.vendor.name);
      final List<GoodTypology> initialResult =
          await dbHelper.queryAllGoodTypologies(event.vendor.name);
      yield VendorStateInitial(initialResult);
    } else {
      if (event is VendorEventSearch) {
        List<GoodTypology> result =
            await dbHelper.queryAllGoodTypeWith(event.vendor.name, event.query);

        yield VendorStateSearched(event.query, result);
      } else {
        if (event is VendorEventReset) {
          final List<GoodTypology> initialResult =
              await dbHelper.queryAllGoodTypologies(event.vendor.name);
          yield VendorStateInitial(initialResult);
        } else {
          yield VendorStateGeneralError("Unknown Action");
        }
      }
    }
  }
}
