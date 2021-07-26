import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:job_searcher/models/job_model.dart';
import 'package:http/http.dart' as http;

class JobProvider with ChangeNotifier {
  Future<List<JobModel>> getJobs() async {
    try {
      var response = await http.get(
        Uri.parse('https://bwa-jobs.herokuapp.com/jobs'),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<JobModel> jobModel = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((element) {
          jobModel.add(
            JobModel.fromJson(element),
          );
        });

        return jobModel;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<JobModel>> getJobsByCategory(String category) async {
    try {
      var response = await http.get(
        Uri.parse('https://bwa-jobs.herokuapp.com/jobs?category=$category'),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<JobModel> jobModel = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((element) {
          jobModel.add(
            JobModel.fromJson(element),
          );
        });

        return jobModel;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}