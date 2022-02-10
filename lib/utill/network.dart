class EndPoint {
  static String server = 'https://appointmentjti.waserdajaya.store/';
  static String api = server + 'api/';

  //auth
  static String auth = api + 'auth';

  //user
  static String listUser = api + 'user/';
  static String detailUser = api + 'user/detail/';
  static String postUser = api + 'user/save/';
  static String deleteUser = api + 'user/delete/';

  //prodi
  static String listProdi = api + 'prodi';
  static String postProdi = api + 'prodi/save/';

  // event dosen
  static String listEvent = api + 'dosen/event/';
  static String detailEvent = api + 'dosen/event/';
  static String listJadwalDosen = api + 'mahasiswa/event/';
  static String createEvent = api + 'dosen/event/save/';
  static String deleteEvent = api + 'dosen/event/delete/';
  static String responEvent = api + 'dosen/event/konfirmasi_pengajuan/';

  //pengajuan
  static String listPengajuanByDosen = api + '/dosen/event/pengajuan/';
  static String createJadwal = api + 'mahasiswa/event/save_pengajuan';
  static String detailPengajuanByDosen = api + 'dosen/event/detail_data/';
  static String batalEventMahasiswa = api + 'mahasiswa/event/batal/';
  static String responEventMahasiswa = api + 'mahasiswa/event/batal/';

  //event mahasiswa
  static String listPengajuanEvent = api + 'mahasiswa/event/pengajuan/';
  static String detailPengajuanEvent = api + 'mahasiswa/event/detail_pengajuan/';

  //event dosen by mahasiswa
  static String listEventDosen = api + 'mahasiswa/event/';

  //chat
  static String listTopic = api + 'chat/';
  static String detailChat = api + 'chat/detail_chat';
  static String replyChat = api + 'chat/send';
  static String addTopic = api + 'chat/save/';
}
