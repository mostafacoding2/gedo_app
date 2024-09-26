import 'package:alzcare/features/health_care/domain/entites/test_entity.dart';
class TestModel extends TestEntite{
  const TestModel({required super.status, required super.code, required super.message, required super.data});
 factory TestModel.fromJson(Map<String, dynamic> json) =>TestModel(
     status: json['status'],
     code: json['code'],
     message: json['message'],
     data: json['data'] != null && json['data'] is Map<String, dynamic>
         ? DataTestModel.fromJson(json['data'])
         : null
     //data: json['data']!=null ? DataTestModel.fromJson(json['data']): null ,

 );
}
class DataTestModel extends DataTest{
const  DataTestModel({
    required super.user,
    required super.date,
    required super.testName,
    required super.laboratoryName,
    required super.attendingPhysician,
    required super.testImage,
    required super.Id
  });
factory DataTestModel.fromJson(Map<String, dynamic> json)=>DataTestModel(
    user: json['user'],
    date: json['date'],
    testName: json['testName'],
    laboratoryName: json['laboratoryName'],
    attendingPhysician: json['attendingPhysician'],
    Id: json['_id'],
     // testImage: json['testImage'],
  testImage: json['testImage'] != null && json['testImage'] is Map<String, dynamic>
      ? TestImageModel.fromJson(json['testImage'])
      : null,);
}
class TestImageModel extends TestImage{
  TestImageModel({required super.url, required super.publicId});
   factory TestImageModel.fromJson(Map<String, dynamic> json)=>TestImageModel(
       url: json['url'],
       publicId: json['publicId']
   );

}
