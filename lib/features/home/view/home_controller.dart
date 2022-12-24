import 'package:paralelism/core/di/di.dart';
import 'package:paralelism/features/home/domain/use_cases/read_data_use_case.dart';

abstract class HomeController {
  Future<Map<String, dynamic>> readData();
}

class HomeControllerImpl implements HomeController {
  final _readDataUseCase = Di.getIt.get<ReadDataUseCase>();

  @override
  Future<Map<String, dynamic>> readData() async {
    return {};
  }
}
