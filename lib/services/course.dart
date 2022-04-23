import 'dart:convert';
import '../model/course_model.dart';
import 'package:http/http.dart' as http;

class CourseClass {
  List<CourseModel> course = [];

  Future<void> getCourseFromApi() async {

    var url = 'https://sumanjay.vercel.app/udemy';
    var response = await http.get(Uri.parse(url),headers: {'Access-Control-Allow-Origin': '*'});
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      jsonData.forEach((element) {
        CourseModel courseModel = CourseModel(
          heading: element['title'],
          image: element['image'],
          courseLink: element['link'], successRate: '',
        );
        course.add(courseModel);
      });
    }
    else{
      print(response.statusCode);
    }
  }
}

