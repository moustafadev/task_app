import 'dart:async';

import 'package:junior_test/blocs/base/BaseBloc.dart';
import 'package:junior_test/model/root_response.dart';
import 'package:junior_test/resources/api/repository.dart';
import 'package:rxdart/rxdart.dart';

class ActionsItemQueryBloc extends BaseBloc {
  final _controller = BehaviorSubject<RootResponse>();
  final _client = Repository();

  Stream<RootResponse> get shopItemContentStream => _controller.stream;

  void loadActionItemContent(int id) async {
    // 1
    final results = await _client.fetchActionInfo(id);
    addResultToController(_controller, results);
  }
  void loadAction(int page, int count) async {
    // 2
    final results = await _client.fetchActionInfoAll(page,count);
    addResultToController(_controller, results);
  }

  @override
  void dispose() {
    _controller.close();
  }

  BehaviorSubject<Object> getController() {
    return _controller;
  }
}
