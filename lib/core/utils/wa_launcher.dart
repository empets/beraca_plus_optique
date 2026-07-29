
import 'package:url_launcher/url_launcher.dart';

const _waNumber = '225XXXXXXXXXX';
const _waMsg =
    'Bonjour Beraca Plus, je souhaite obtenir des informations sur cette paire de lunettes.';

Future<void> launchWhatsApp() async {
  final url = Uri.parse(
    'https://wa.me/$_waNumber?text=${Uri.encodeComponent(_waMsg)}',
  );
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}