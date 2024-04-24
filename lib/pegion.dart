import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class MyDataApi {
  @async
  ResponseData sendData(MyData data);
}

class MyData {
  String? name;
  int? age;
}

class ResponseData {
  String? name;
}
