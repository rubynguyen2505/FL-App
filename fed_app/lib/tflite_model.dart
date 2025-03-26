// import 'dart:convert';
// import 'dart:math';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
import 'package:tflite_flutter/tflite_flutter.dart';

class TensorFlowLiteModel {
  Interpreter? _interpreter;
  // Map<String, dynamic>? _tokenizer;
  List<List<double>>? _modelWeights;
  // int _dataCount = 1000; 

  // Load model and tokenizer
  Future<String> loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('assets/model.tflite');
      
      // String jsonString = await rootBundle.loadString('assets/tokenizer.json');
      // _tokenizer = jsonDecode(jsonString);
      
      _modelWeights = [];

      if (_interpreter == null) {
        return "Failed to load model and tokenizer.";
      } else {
        return "Model and tokenizer loaded successfully!";
      }
    } catch (e) {
      return "Failed to load model and tokenizer: $e";
    }
  }

  // // Getter for _modelWeights
  List<List<double>>? get modelWeights => _modelWeights;

  void close() {
    _interpreter?.close();
  }
}
