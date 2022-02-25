// import 'package:helloworld/src/generated/user.pbgrpc.dart';
import '../../../src/user.pbgrpc.dart';
class UserModel {
  // int? id;
  // String? nama;
  // String? email;

  // UserModel({this.id, this.nama, this.email});

  List<User> _list = [
    User(id: 1, name: 'Dicky', email: 'DickyDarmawan@gmail.com')
  ];

  final _berhasil = UserResponse(
    message: 'Berhasil',
  );

  final _gagal = UserResponse(
    message: 'Gagal',
  );

  // insert
  UserResponse insert(User request) {
    if (request.email.isEmpty && request.name.isEmpty) {
      return _gagal;
    }

    final id = _list.last.id;

    _list = [
      ..._list,
      User(
        id: id + 1,
        email: request.email,
        name: request.name,
      )
    ];
    return _berhasil;
  }

  // remove
  UserResponse remove(UserId request) {
    if (_list.isEmpty) {
      return _gagal;
    }

    _list.removeWhere(
      (e) => e.id == request.id,
    );

    return UserResponse(
      message: 'Berhasil',
    );
  }

  // get
  User getData(UserId request) {
    if (_list.isEmpty) {
      return User();
    }
    final getUser = _list.firstWhere((element) => element.id == request.id);
    return getUser;
  }

  // list
  UserList listData() {
    return UserList(listUser: [..._list]);
  }

  // UserRequest fromReqClient() {
  //   return UserRequest(
  //     email: email,
  //     name: nama,
  //     id: id,
  //   );
  // }
}
