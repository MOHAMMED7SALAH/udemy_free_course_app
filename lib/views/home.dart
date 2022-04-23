import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:udemyfreecourse/services/course.dart';
import 'package:udemyfreecourse/widgets/coursetile.dart';


import '../model/course_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<CategoryModel> categories = [];
  List<CourseModel> courses = [];

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // categories = getCategories();
    getCourseFromApi();
  }

  getCourseFromApi() async {
    CourseClass courseClass = CourseClass();
    await courseClass.getCourseFromApi();
    courses = courseClass.course;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar:  AppBar(
        elevation: 0,

        backgroundColor: Color(0xffFFFFFF),
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text(
                      "Hello, Geek",
                      style: GoogleFonts.notoSans(
                          fontSize: 16,
                          color: Color(0XFF747474),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Find and enjoy your Free Courses",
                      style: GoogleFonts.notoSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff232323)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: Lottie.asset("assets/smiley_loader.json",
    animate: true
    ),
              ),
              ////categories
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    
                    
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Courses",
                        style: GoogleFonts.notoSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff232323)),
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                          itemCount: courses.length,
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, int index) {
                            return CourseTile(
                              imageURL: courses[index].image,
                              title: courses[index].heading,
                              courseURL: courses[index].courseLink,
                              successRate: '',

                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
