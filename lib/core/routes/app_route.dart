import 'package:flutter/material.dart';
import 'package:globaleyes/screens/Observation/observation_details.dart';
import 'package:globaleyes/screens/attended_session/attended_session.dart';
import 'package:globaleyes/screens/department_details/department_details.dart';
import 'package:globaleyes/screens/employee_safety_observation/employee_safety_observation.dart';
import 'package:globaleyes/screens/scaner/scanner_screen.dart';
import 'package:globaleyes/screens/select_department/select_department.dart';
import 'package:globaleyes/screens/training_session/training_session.dart';
import 'package:globaleyes/screens/user_company_details/user_company_details.dart';


class AppRoute {
  static const String splash = "/";
  static const String welcome = "welcome_screen";
  static const String scannerScreen = "scanner_screen";
  static const String userCompanyDetails = "user_company_details";
  static const String trainingSession = "training_session";
  static const String attendedSession = "attended_session";
  static const String employeeSafetyObservation = "employee_safety_observation";
  static const String selectDepartment = "select_department";
  static const String departmentDetails = "department_details";
  static const String observationDetails = "observation_details";


  static Route<dynamic> routes(RouteSettings settings) {
    if (settings.name == scannerScreen) {
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return ScannerScreen();
      });
    }else if (settings.name == userCompanyDetails) {
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return UserCompanyDetailsScreen();
      });
    }else if (settings.name == trainingSession) {
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return TrainingSession();
      });
    }else if (settings.name == attendedSession) {
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return AttendedSession();
      });
    }else if (settings.name == employeeSafetyObservation) {
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return EmployeeSafetyObservation();
      });
    }else if (settings.name == selectDepartment) {
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return SelectDepartment();
      });
    }else if (settings.name == departmentDetails) {
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return DepartmentDetails();
      });
    }else if (settings.name == observationDetails) {
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return ObservationDetails();
      });
    }else {
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return const Scaffold(
          body: Center(
            child: Text('Page Not Found'),
          ),
        );
      });
    }
  }
}
