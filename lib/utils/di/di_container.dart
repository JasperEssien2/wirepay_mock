import 'package:get_it/get_it.dart';

import 'cubit_module.dart' as cubit_module;
import 'service_module.dart' as service_module;
import 'viewmodel_module.dart' as viewmodel_module;

void init(GetIt injector) {
  service_module.init(injector);
  viewmodel_module.init(injector);
  cubit_module.init(injector);
}
