import 'package:new_flutter_app/data/repository.dart';
import 'package:new_flutter_app/model/model.dart';

class ViewModel {
  Future<NewsResponse> getResponse() {
    return Repository().fetchNews();
  }
}
