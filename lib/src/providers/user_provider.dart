import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/environment/environment.dart';
import 'package:udemy_flutter_delivery/src/models/response_api.dart';
import 'package:udemy_flutter_delivery/src/models/user.dart';
import 'package:http/http.dart' as http;
class UsersProvider extends GetConnect{
  String url = Enviroment.API_URL +'api/users';

  User userSession = User.fromJson(GetStorage().read('user') ?? {});

  Future<Response> create(User user) async{
    Response response = await post(
        '$url/create',
        user.toJson(),
    headers: {
      'Content-Type':'application/json'
    }
    );
    return response;
  }

  Future<ResponseApi> update(User user) async{
    Response response = await put(
        '$url/updateWithoutImage',
        user.toJson(),
        headers: {
          'Content-Type':'application/json',
          'Authorization' :userSession.sessionToken?? ''
        }
    );
    if(response.body ==null){
      Get.snackbar("Erorr", 'Could not update infomation');
      return ResponseApi();
    }

    if(response.statusCode ==401){
      Get.snackbar("Erorr", 'You are not authorized to make this request');
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }
  Future<Stream> createWithImage(User user, File image) async {
    Uri uri = Uri.http(Enviroment.API_URL_OLD, '/api/users/createWithImage');
    final request = http.MultipartRequest('POST', uri);
    request.files.add(http.MultipartFile(
        'image',
        http.ByteStream(image.openRead().cast()),
        await image.length(),
        filename: basename(image.path)
    ));
    request.fields['user'] = json.encode(user);
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }
  Future<Stream> updateWithImage(User user, File image) async {
    Uri uri = Uri.http(Enviroment.API_URL_OLD, '/api/users/update');
    print('url: ${uri}');
    final request = http.MultipartRequest('PUT', uri);
    request.headers['Authorization']= userSession.sessionToken??'';
    request.files.add(http.MultipartFile(
        'image',
        http.ByteStream(image.openRead().cast()),
        await image.length(),
        filename: basename(image.path)
    ));
    request.fields['user'] = json.encode(user);
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }

  /*
  * GETX
  * */

  Future<ResponseApi> createUserWithImageGetX(User user, File image) async {
    FormData form = FormData({
      'image': MultipartFile(image, filename: basename(image.path)),
      'user': json.encode(user)
    });
    Response response = await post('$url/createWithImage', form);

    if(response.body== null){
      Get.snackbar('lỗi trong yêu cầu', 'Không thể tạo người dùng');
      return ResponseApi();
    }
    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }

  Future<ResponseApi> login(String email,String password) async {
    Response response = await post(
        '$url/login',
        {
          'email':email,
          'password':password
        },
        headers: {
          'Content-Type':'application/json'
        }
    );
    if(response.body== null){
      Get.snackbar('error', 'Yêu cầu không thể được thực hiện');
      return ResponseApi();
    }
    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }
}