import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final commands = [
    'flutter pub add flutter_bloc',
    'flutter pub add http',
    'flutter pub add connectivity_plus',
    'dart pub add dartz',
    'dart pub add injectable',
    'flutter pub add get_it',
    'flutter pub add equatable',
    'dart pub add dev:build_runner',
    'dart pub add dev:injectable_generator',
    'flutter pub run build_runner watch --delete-conflicting-outputs --use-polling-watcher',
  ];

  for (final command in commands) {
    context.logger.info('🚀 Running: $command');
    final parts = command.split(' ');
    final result = await Process.run(
      parts.first,
      parts.sublist(1),
      workingDirectory: Directory.current.path,
    );
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  }

  context.logger.success('✅ All dependencies added successfully!');
}
