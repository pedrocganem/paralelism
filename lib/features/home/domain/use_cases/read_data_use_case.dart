abstract class ReadDataUseCase {
  Future<Map<String, dynamic>> call();
}

class ReadDataUseCaseImpl implements ReadDataUseCase {
  @override
  Future<Map<String, dynamic>> call() async {
    return {};
  }
}
