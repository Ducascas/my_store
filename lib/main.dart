import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_store/my_store.dart';

void main() {
  runApp(const ProviderScope(child: MyStore()));
}
