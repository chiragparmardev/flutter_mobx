import 'package:flutter_demo_structure/ui/auth/store/auth_store.dart';

class DropDownData{
  final String title;
  final String subtitle;
  final String imgUrl;

  DropDownData(this.title, this.subtitle, this.imgUrl);
}

List<DropDownData> dropDownDataList = [
DropDownData(authStore.socialProfileRes!.data!.contactNumber.toString(), 'contact number', 'assets/image/phone.png'),
DropDownData(authStore.socialProfileRes!.data!.email.toString(), 'Email address', 'assets/image/email-outline.png'),
DropDownData(authStore.socialProfileRes!.data!.whatsappNumber.toString(), 'WhatsApp', 'assets/image/whatsapp.png'),
DropDownData(authStore.socialProfileRes!.data!.linkedinUrl.toString(), 'Linkedin', 'assets/image/linkdin.png'),
DropDownData(authStore.socialProfileRes!.data!.urnNumber.toString(), 'Website', 'assets/image/global-search.png'),
DropDownData(authStore.socialProfileRes!.data!.instagramUrl.toString(), 'Instagram', 'assets/image/instragram.png'),
];