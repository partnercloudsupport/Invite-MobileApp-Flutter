import 'package:invite_vn/features/bloc.dart';
import 'package:rxdart/subjects.dart';

class LoadBloc extends Bloc {

  bool _isLoading = false;

  PublishSubject<bool> _loadingSubject = PublishSubject();

  Stream<bool> get loading => _loadingSubject.stream;

  bool isLoading() {
    if (_isLoading) return true;
    _isLoading = true;
    _loadingSubject.add(_isLoading);
    return false;
  }

  void isLoaded() {
    _isLoading = false;
    _loadingSubject.add(_isLoading);
  }

  @override
  void dispose() {
    _loadingSubject.close();
  }

}