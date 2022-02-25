// Copyright (c) 2018, the gRPC project authors. Please see the AUTHORS file
// for details. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Dart implementation of the gRPC helloworld.Greeter server.
import 'package:grpc/grpc.dart';
// import 'package:helloworld/src/generated/user.pbgrpc.dart';
import '../../../src/user.pbgrpc.dart';
import '../model/model_user.dart';

class GreeterService extends ServerUserServiceBase {
  final data = UserModel();

  @override
  Future<User> get(ServiceCall call, UserId request) async {
    return data.getData(request);
  }

  @override
  Future<UserResponse> insert(ServiceCall call, User request) async {
    return data.insert(request);
  }

  @override
  Future<UserList> list(ServiceCall call, Empty request) async {
    return data.listData();
  }

  @override
  Future<UserResponse> remove(ServiceCall call, UserId request) async {
    return data.remove(request);
  }
}

Future<void> main(List<String> args) async {
  final server = Server(
    [GreeterService()],
    const <Interceptor>[],
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 3000);
  print('Server listening on port ${server.port}...');
}
