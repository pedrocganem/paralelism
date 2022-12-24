import 'dart:convert';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class ReadDataUseCase {
  Future<List<Map<String, dynamic>>> call();
}

class ReadDataUseCaseImpl implements ReadDataUseCase {


  Future<void> _readAndParseOnSeparedThread(SendPort p) async {
    final json = await rootBundle.loadString('assets/large-file.json');
    final data = jsonDecode(json) as List<dynamic>;
    final dataLength = data.length;
    debugPrint(dataLength.toString());
    Isolate.exit(p, data);
  }

  @override
  Future<List<Map<String, dynamic>>> call() async {
    final receivePort = ReceivePort();
    final stopWatch = Stopwatch()..start();
    await Isolate.spawn(_readAndParseOnSeparedThread, receivePort.sendPort);
    debugPrint('ReadDataUseCaseImpl: ${stopWatch.elapsedMilliseconds}ms');

    final data = await receivePort.first as List<dynamic>;
    final mappedData = data.map((e) => e as Map<String, dynamic>).toList();
    return mappedData;
  }

  // Write a function that reads data on a separated thread

}
