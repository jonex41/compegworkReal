
class Model{

  String _id;
  Map<String, dynamic> _list;

  Model(this._id, this._list);

  Map<String, dynamic> get list => _list;

  set list(Map<String, dynamic> value) {
    _list = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  @override
  String toString() {
    return 'Model{_id: $_id, _list: $_list}';
  }
}