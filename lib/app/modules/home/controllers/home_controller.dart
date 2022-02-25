import 'package:get/get.dart';
import 'package:grpc/grpc.dart';

import '../../../../src/user.pbgrpc.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = false.obs;

  final channel = ClientChannel(
    '192.168.1.6',
    port: 3000,
    options: ChannelOptions(
      credentials: const ChannelCredentials.insecure(),
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );

  Future<UserResponse> insert() async {
    count.value = !count.value;
    final stub = ServerUserClient(channel);
    try {
      // insert
      final insert = await stub.insert(
        User(id: 10, name: "dasdasd", email: "Dicky@gmail.com"),
        options: CallOptions(compression: const GzipCodec()),
      );
      print(insert.toProto3Json());
      count.value = !count.value;
      return insert;
    } catch (e) {
      print('Caught error: $e');
    }

    return UserResponse(message: "");
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() async {
    // await channel.shutdown();
  }
}
