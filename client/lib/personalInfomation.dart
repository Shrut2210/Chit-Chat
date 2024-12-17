import 'dart:io';
import 'dart:developer';
import 'package:client/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> editProfile({required String profilePicture,required String name,required String bio,required String contact_no }) async {

  try {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('email');
      final response = await supabase
          .from('Admin')
          .select('*')
          .eq('email', token.toString());

      if (response == null) {
        log('Error fetching user data: ${response.toString()}');
        return 'User not found';
      }

      if (response.isNotEmpty) {
        final editData = await supabase
            .from('Admin')
            .update({
          'name': name,
          'profile_picture': profilePicture,
          'bio': bio,
          'contact_no': contact_no,
        }).eq('email', token.toString());

        if (editData.error != null) {
          log('Error updating data: ${editData.error!.message}');
          return "Retry!";
        } else {
          return "Data Updated Successfully";
        }
      } else {
        return 'Data Is Not Updated';
      }
  }
  catch (e) {
    return "Error: ${e.toString()}";
  }
}

Future<Map<String, String>> getProfileData() async {
  final Map<String, String> data = {
    'name' : '',
    'email' : '',
    'bio' : '',
    'contact_no' : '',
    'profile_picture' : ''
  };

  try {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('email');

    final response = await supabase.from('Admin').select('*').eq('email', token.toString()).limit(1).single();

    if(response.isNotEmpty) {
      data['name'] = response['name'] ?? '';
      data['email'] = response['email'] ?? '';
      data['bio'] = response['bio'] ?? '';
      data['contact_no'] = response['contact_no'] ?? '';
      data['profile_picture'] = response['profile_picture'] ?? '';
    }
  }
  catch (e) {
    print("Error");
  }

  return data;
}
