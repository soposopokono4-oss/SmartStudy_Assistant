# SmartStudy – Assistant Lokal dengan Materi Manual

## Pembaruan
- Menu Assistant berisi Ringkas Materi, Latihan Soal, dan Materi Pelajaran.
- Pengguna dapat menambahkan materi sendiri (judul, mata pelajaran, isi), lalu menghapusnya.
- Materi tambahan tersimpan di localStorage browser/perangkat yang digunakan.
- Latihan soal dapat dibuat sebanyak 5, 10, atau 15 soal dengan bentuk campuran, pilihan ganda, benar/salah, isian singkat, atau uraian.
- Tingkat kesulitan dapat dipilih.
- Tidak memerlukan API key atau Edge Function AI.

## Catatan penyimpanan
Materi manual disimpan lokal di browser menggunakan localStorage. Materi tidak otomatis tersinkron ke perangkat lain dan dapat hilang jika data situs/browser dihapus. Ekspor/cadangkan materi secara terpisah sebelum membersihkan data browser.

## Supabase
File konfigurasi dan skema Supabase tetap disertakan karena fitur login dan sinkronisasi jadwal/tugas masih menggunakannya. Supabase tidak diperlukan untuk fitur Assistant lokal. Jangan menghapus tabel atau konfigurasi Supabase jika fitur akun dan sinkronisasi masih dipakai.

## Instalasi
Unggah seluruh isi folder ini ke repository GitHub Pages, lalu lakukan hard refresh (Ctrl+Shift+R). Jika PWA masih menampilkan versi lama, tutup aplikasi dan buka ulang setelah service worker diperbarui.


## Profil pengembang
Halaman Pengembang menampilkan foto dan biodata Muhammad Fajar Devandra serta Natanael Barzilai, siswa SMKN 1 Blitar jurusan Teknik Komputer dan Jaringan (TKJ), beserta tautan media sosial yang diberikan.
