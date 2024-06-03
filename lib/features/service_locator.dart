import 'package:app/core/logic/dio_helper.dart';
import 'package:app/features/categories/bloc.dart';
import 'package:app/features/login/bloc.dart';
import 'package:app/features/products/bloc.dart';
import 'package:app/features/sliders/bloc.dart';
import 'package:get_it/get_it.dart';

import 'app_info/bloc.dart';
import 'cart/bloc.dart';
import 'contact_us/bloc.dart';
import 'register/bloc.dart';
import 'update_cart_item/bloc.dart';


void initServiceLocator() {
  final container = GetIt.instance;

  container.registerSingleton(DioHelper());
  container.registerFactory(() => LoginBloc(GetIt.instance<DioHelper>()));
  container.registerFactory(() => RegisterBloc(GetIt.instance<DioHelper>()));
  container.registerFactory(() => ContactUsBloc(GetIt.instance<DioHelper>()));
  container.registerFactory(() => UpdateCartItemBloc(GetIt.instance<DioHelper>()));
  container.registerFactory(() => AppInfoBloc(GetIt.instance<DioHelper>())..add(GetAppInfoEvent()));
  container.registerFactory(() => CategoriesBloc(GetIt.instance<DioHelper>())..add(GetCategoriesEvent()));
  container.registerFactory(() => SliderBloc(GetIt.instance<DioHelper>())..add(GetSliderEvent()));
  container.registerFactory(() => ProductsBloc(GetIt.instance<DioHelper>())..add(GetProductsEvent()));
  container.registerFactory(() => CartBloc(GetIt.instance<DioHelper>())..add(GetCartEvent()));
}
