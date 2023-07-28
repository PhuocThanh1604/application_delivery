import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/environment/environment.dart';
import 'package:udemy_flutter_delivery/src/models/response_api.dart';
import 'package:udemy_flutter_delivery/src/models/user.dart';

class UsersProvider extends GetConnect{
  String url = Enviroment.API_URL +'api/users';


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