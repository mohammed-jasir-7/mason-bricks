import 'dart:collection';



class FunctionApiRequest {
  final Future<void> Function() call;
  final Function? onSuccess;
  final Function? onError;
  final String id;

  FunctionApiRequest({
    required this.call,
    this.onSuccess,
    this.onError,
    required this.id,
  });
}

abstract class ApiQueue {
  void addToQueue(FunctionApiRequest request);
  Future<void> processQueue();
}

class ApiQueueImpl implements ApiQueue {
  final Queue<FunctionApiRequest> _queue = Queue<FunctionApiRequest>();

  @override
void addToQueue(FunctionApiRequest request) {
  final isDuplicate = _queue.any((r) => r.id == request.id);
  if (!isDuplicate) {
    print('Added: ${request.id}');
    _queue.add(request);
  } else {
    print('Skipped duplicate: ${request.id}');
  }
}



  @override
  Future<void> processQueue() async {

    while (_queue.isNotEmpty) {
      final request = _queue.removeFirst(); // safer: remove and use
      try {
        await request.call(); // retry logic
        request.onSuccess?.call();
        _queue.removeFirst();
      } catch (e) {
        request.onError?.call(e);
        break; // pause until next connectivity event
      }
    }
  }
}



