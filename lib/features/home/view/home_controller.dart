import 'package:paralelism/core/di/di.dart';
import 'package:paralelism/features/home/domain/use_cases/read_data_use_case.dart';

abstract class HomeController {
  Future<List<Map<String, dynamic>>> readData();
}

class HomeControllerImpl implements HomeController {
  final _readDataUseCase = Di.instance.get<ReadDataUseCase>();

  @override
  Future<List<Map<String, dynamic>>> readData() async {
    final data = await _readDataUseCase();
    return data;
  }
}
