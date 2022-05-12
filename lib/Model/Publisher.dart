import 'package:sql_project_part3/Model/Address.dart';

class Publisher{
  int publisherId;
  String name;
  String email;
  String phone;
  String foundationDate;

  Publisher(
      {required this.publisherId,
        required this.name,
        required this.email,
        required this.phone,
        required this.foundationDate,
   });

}