import 'package:get/get.dart';

import 'package:teledintistry/app/modules/add_queue/bindings/add_queue_binding.dart';
import 'package:teledintistry/app/modules/add_queue/views/add_queue_view.dart';
import 'package:teledintistry/app/modules/agenda_dokter/bindings/agenda_dokter_binding.dart';
import 'package:teledintistry/app/modules/agenda_dokter/views/agenda_dokter_view.dart';
import 'package:teledintistry/app/modules/chat_room/bindings/chat_room_binding.dart';
import 'package:teledintistry/app/modules/chat_room/views/chat_room_view.dart';
import 'package:teledintistry/app/modules/chats/bindings/chats_binding.dart';
import 'package:teledintistry/app/modules/chats/views/chats_view.dart';
import 'package:teledintistry/app/modules/complete_daftar_program/bindings/complete_daftar_program_binding.dart';
import 'package:teledintistry/app/modules/complete_daftar_program/views/complete_daftar_program_view.dart';
import 'package:teledintistry/app/modules/daftar_artikel/bindings/daftar_artikel_binding.dart';
import 'package:teledintistry/app/modules/daftar_artikel/views/daftar_artikel_view.dart';
import 'package:teledintistry/app/modules/daftar_program/bindings/daftar_program_binding.dart';
import 'package:teledintistry/app/modules/daftar_program/views/daftar_program_view.dart';
import 'package:teledintistry/app/modules/detail_pasien/bindings/detail_pasien_binding.dart';
import 'package:teledintistry/app/modules/detail_pasien/views/detail_pasien_view.dart';
import 'package:teledintistry/app/modules/e_resep_dokter/bindings/e_resep_dokter_binding.dart';
import 'package:teledintistry/app/modules/e_resep_dokter/views/e_resep_dokter_view.dart';
import 'package:teledintistry/app/modules/histories/bindings/histories_binding.dart';
import 'package:teledintistry/app/modules/histories/views/histories_view.dart';
import 'package:teledintistry/app/modules/home/bindings/home_binding.dart';
import 'package:teledintistry/app/modules/home/views/home_view.dart';
import 'package:teledintistry/app/modules/home_doctor/bindings/home_doctor_binding.dart';
import 'package:teledintistry/app/modules/home_doctor/views/home_doctor_view.dart';
import 'package:teledintistry/app/modules/info_program/bindings/info_program_binding.dart';
import 'package:teledintistry/app/modules/info_program/views/info_program_view.dart';
import 'package:teledintistry/app/modules/list_pasien/bindings/list_pasien_binding.dart';
import 'package:teledintistry/app/modules/list_pasien/views/list_pasien_view.dart';
import 'package:teledintistry/app/modules/login/bindings/login_binding.dart';
import 'package:teledintistry/app/modules/login/views/login_view.dart';
import 'package:teledintistry/app/modules/main/bindings/main_binding.dart';
import 'package:teledintistry/app/modules/main/views/main_view.dart';
import 'package:teledintistry/app/modules/main_doctor/bindings/main_doctor_binding.dart';
import 'package:teledintistry/app/modules/main_doctor/views/main_doctor_view.dart';
import 'package:teledintistry/app/modules/notifikasi/bindings/notifikasi_binding.dart';
import 'package:teledintistry/app/modules/notifikasi/views/notifikasi_view.dart';
import 'package:teledintistry/app/modules/odontogram/bindings/odontogram_binding.dart';
import 'package:teledintistry/app/modules/odontogram/views/odontogram_view.dart';
import 'package:teledintistry/app/modules/on_boarding/bindings/on_boarding_binding.dart';
import 'package:teledintistry/app/modules/on_boarding/views/on_boarding_view.dart';
import 'package:teledintistry/app/modules/pasien_terdaftar/bindings/pasien_terdaftar_binding.dart';
import 'package:teledintistry/app/modules/pasien_terdaftar/views/pasien_terdaftar_view.dart';
import 'package:teledintistry/app/modules/preview_odontogram/bindings/preview_odontogram_binding.dart';
import 'package:teledintistry/app/modules/preview_odontogram/views/preview_odontogram_view.dart';
import 'package:teledintistry/app/modules/profile/bindings/profile_binding.dart';
import 'package:teledintistry/app/modules/profile/views/profile_view.dart';
import 'package:teledintistry/app/modules/register/bindings/register_binding.dart';
import 'package:teledintistry/app/modules/register/views/register_view.dart';
import 'package:teledintistry/app/modules/rujukan/bindings/rujukan_binding.dart';
import 'package:teledintistry/app/modules/rujukan/views/rujukan_view.dart';
import 'package:teledintistry/app/modules/view_file_pdf/bindings/view_file_pdf_binding.dart';
import 'package:teledintistry/app/modules/view_file_pdf/views/view_file_pdf_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.CHATS,
      page: () => ChatsView(),
      binding: ChatsBinding(),
    ),
    GetPage(
      name: _Paths.HISTORIES,
      page: () => HistoriesView(),
      binding: HistoriesBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADD_QUEUE,
      page: () => AddQueueView(),
      binding: AddQueueBinding(),
    ),
    GetPage(
      name: _Paths.INFO_PROGRAM,
      page: () => InfoProgramView(),
      binding: InfoProgramBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR_PROGRAM,
      page: () => DaftarProgramView(),
      binding: DaftarProgramBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR_ARTIKEL,
      page: () => DaftarArtikelView(),
      binding: DaftarArtikelBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_DOCTOR,
      page: () => MainDoctorView(),
      binding: MainDoctorBinding(),
    ),
    GetPage(
      name: _Paths.HOME_DOCTOR,
      page: () => HomeDoctorView(),
      binding: HomeDoctorBinding(),
    ),
    GetPage(
      name: _Paths.ODONTOGRAM,
      page: () => OdontogramView(),
      binding: OdontogramBinding(),
    ),
    GetPage(
      name: _Paths.AGENDA_DOKTER,
      page: () => AgendaDokterView(),
      binding: AgendaDokterBinding(),
    ),
    GetPage(
      name: _Paths.E_RESEP_DOKTER,
      page: () => EResepDokterView(),
      binding: EResepDokterBinding(),
    ),
    GetPage(
      name: _Paths.LIST_PASIEN,
      page: () => ListPasienView(),
      binding: ListPasienBinding(),
    ),
    GetPage(
      name: _Paths.COMPLETE_DAFTAR_PROGRAM,
      page: () => CompleteDaftarProgramView(),
      binding: CompleteDaftarProgramBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.PREVIEW_ODONTOGRAM,
      page: () => PreviewOdontogramView(),
      binding: PreviewOdontogramBinding(),
    ),
    GetPage(
      name: _Paths.RUJUKAN,
      page: () => RujukanView(),
      binding: RujukanBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_ROOM,
      page: () => ChatRoomView(),
      binding: ChatRoomBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI,
      page: () => NotifikasiView(),
      binding: NotifikasiBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_FILE_PDF,
      page: () => ViewFilePdfView(),
      binding: ViewFilePdfBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PASIEN,
      page: () => DetailPasienView(),
      binding: DetailPasienBinding(),
    ),
    GetPage(
      name: _Paths.PASIEN_TERDAFTAR,
      page: () => PasienTerdaftarView(),
      binding: PasienTerdaftarBinding(),
    ),
  ];
}
