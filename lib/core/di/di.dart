import 'package:get_it/get_it.dart';
import 'package:paralelism/features/home/view/home_controller.dart';

import '../../features/home/domain/use_cases/read_data_use_case.dart';

class Di {

  static GetIt getIt = GetIt.instance;

   static void registerDependencies() {
    final getIt = GetIt.instance;
    getIt.registerSingleton<ReadDataUseCase>(ReadDataUseCaseImpl());
    getIt.registerSingleton<HomeController>(HomeControllerImpl());
  }

}
