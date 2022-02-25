///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'user.pb.dart' as $0;
export 'user.pb.dart';

class ServerUserClient extends $grpc.Client {
  static final _$insert = $grpc.ClientMethod<$0.User, $0.UserResponse>(
      '/helloworld.ServerUser/Insert',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserResponse.fromBuffer(value));
  static final _$list = $grpc.ClientMethod<$0.Empty, $0.UserList>(
      '/helloworld.ServerUser/List',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserList.fromBuffer(value));
  static final _$get = $grpc.ClientMethod<$0.UserId, $0.User>(
      '/helloworld.ServerUser/Get',
      ($0.UserId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.User.fromBuffer(value));
  static final _$remove = $grpc.ClientMethod<$0.UserId, $0.UserResponse>(
      '/helloworld.ServerUser/Remove',
      ($0.UserId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserResponse.fromBuffer(value));

  ServerUserClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.UserResponse> insert($0.User request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$insert, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserList> list($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$list, request, options: options);
  }

  $grpc.ResponseFuture<$0.User> get($0.UserId request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserResponse> remove($0.UserId request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$remove, request, options: options);
  }
}

abstract class ServerUserServiceBase extends $grpc.Service {
  $core.String get $name => 'helloworld.ServerUser';

  ServerUserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.User, $0.UserResponse>(
        'Insert',
        insert_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($0.UserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.UserList>(
        'List',
        list_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.UserList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserId, $0.User>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserId.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserId, $0.UserResponse>(
        'Remove',
        remove_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserId.fromBuffer(value),
        ($0.UserResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.UserResponse> insert_Pre(
      $grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return insert(call, await request);
  }

  $async.Future<$0.UserList> list_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return list(call, await request);
  }

  $async.Future<$0.User> get_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserId> request) async {
    return get(call, await request);
  }

  $async.Future<$0.UserResponse> remove_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserId> request) async {
    return remove(call, await request);
  }

  $async.Future<$0.UserResponse> insert(
      $grpc.ServiceCall call, $0.User request);
  $async.Future<$0.UserList> list($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.User> get($grpc.ServiceCall call, $0.UserId request);
  $async.Future<$0.UserResponse> remove(
      $grpc.ServiceCall call, $0.UserId request);
}
