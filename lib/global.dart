import 'package:get_storage/get_storage.dart';
import 'package:thai7/model/product.dart';

bool apiConnected = false;
String apiUserName = "tester";
String apiUserPassword = "tester";
String apiShopCode =
    "27dcEdktOoaSBYFmnN6G6ett4Jb"; // "27dcEdktOoaSBYFmnN6G6ett4Jb";
GetStorage appConfig = GetStorage('AppConfig');
bool isLoginProcess = false;
List<UnitModel> units = [];
List<ProductModel> products = [];
