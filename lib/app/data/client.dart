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

/// Dart implementation of the gRPC helloworld.Greeter client.
import 'package:grpc/grpc.dart';
// import '../src/generated/user.pbgrpc.dart';
import '../../src/user.pbgrpc.dart';

// import 'model_user.dart';

Future<ClientChannel> cientGrpc() async {
  final channel = ClientChannel(
    'localhost',
    port: 3000,
    options: ChannelOptions(
      credentials: const ChannelCredentials.insecure(),
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );
  // final stub = ServerUserClient(channel);

  // final UserFromArgs = User(
  //   id: int.parse(args[0]),
  //   name: args[1],
  //   email: args[2],
  // );

  // final UserIdFromArgs = UserId(
  //   id: int.parse(args[0]),
  // );

  // try {
  //   // insert
  //   // final insert = await stub.insert(
  //   //   UserFromArgs,
  //   //   options: CallOptions(compression: const GzipCodec()),
  //   // );
  //   // print(insert.toProto3Json());

  //   // final getList = await stub
  //   //     .list(
  //   //       Empty(),
  //   //       options: CallOptions(compression: const GzipCodec()),
  //   //     )
  //   //     .asStream();

  //   // getList.map((event) => print(event.toProto3Json()));

  //   // final get = await stub.get(
  //   //   UserIdFromArgs,
  //   //   options: CallOptions(
  //   //     compression: const GzipCodec(),
  //   //   ),
  //   // );

  //   print(get.toProto3Json());
  // } catch (e) {
  //   print('Caught error: $e');
  // }
  // await channel.shutdown();
  return channel;
}
