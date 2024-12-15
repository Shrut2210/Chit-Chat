import 'package:client/main.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

Future<String> sign_up({required String name,required String email,required String password}) async {
  print("loading...");
  try {
    var bytes = utf8.encode(password);
    var hashedPassword = sha256.convert(bytes).toString();
    final email_check = await supabase.from('Admin').select('*').eq('email', email);
    if (email_check != null && email_check.isNotEmpty) {
      return "User Exists";
    }
    else {
      await supabase.from('Admin').insert({
        'name' : name,
        'email' : email,
        'password' : hashedPassword
      });

      return "User Created Successfully";
    }
  }
  catch (e) {
    return "Error: ${e.toString()}";
  }
}

Future<String> log_in({required String email,required String password}) async {
  print("loading...");
  try {
    var bytes = utf8.encode(password);
    var hashedPassword = sha256.convert(bytes).toString();
    final response = await supabase
        .from('Admin')
        .select('*')
        .eq('email', email)
        .eq('password', hashedPassword);

    if (response != null && response.isNotEmpty) {
      return "User Logged In";
    } else {
      final emailCheck = await supabase.from('Admin').select('*').eq('email', email);

      if (emailCheck != null && emailCheck.isNotEmpty) {
        return "Incorrect Password";
      } else {
        return "Incorrect Email";
      }
    }
  } catch (e) {
    return "Error: ${e.toString()}";
  }
}