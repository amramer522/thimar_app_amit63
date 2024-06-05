part of 'bloc.dart';
class OTPEvents{}
class VerifyOTPEvent extends OTPEvents{
  final String phone;

  VerifyOTPEvent({required this.phone});
}