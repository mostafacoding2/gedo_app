import 'package:equatable/equatable.dart';
class TestEntite extends Equatable  {
 final String status;
 final int code;
 final String message;
 final DataTest? data;

 const TestEntite({ required this.status,required this.code,required this.message,required this.data});
  @override
  // TODO: implement props
  List<Object?> get props => [data,message,status,code];
}
class DataTest  extends Equatable{
  final  String user;
  final String date;
  final String testName;
  final String laboratoryName;
  final String attendingPhysician;
  final TestImage ?testImage;
  final  String Id;
  const  DataTest({
        required this.user,
        required  this.date,
        required this.testName,
        required this.laboratoryName,
        required this.attendingPhysician,
        required this.testImage,
        required this.Id,
      });
  @override
  // TODO: implement props
  List<Object?> get props => [   user,
  date,
   testName,
   laboratoryName,
   attendingPhysician,
   testImage,
   Id];
}

class TestImage  extends Equatable{
 final String url;
 final dynamic publicId;

const  TestImage({ required this.url, required this.publicId});

  @override
  // TODO: implement props
  List<Object?> get props => [url,publicId];

}

