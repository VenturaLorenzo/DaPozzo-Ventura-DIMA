import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/models/size_model.dart';
import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';

abstract class SizeEvent {}

class SizeEventInitialize extends SizeEvent {
 final GoodTypologyModel goodtype;

  SizeEventInitialize(this.goodtype);
}
class SizeEventSearch extends SizeEvent{
 final SizeModel size;
 SizeEventSearch(this.size);

}
class SizeEventUninitialize extends SizeEvent {


}


