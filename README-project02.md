# Project 02 — Storage, Filesystem & Backup Policy

**Skenario:** Server srv-kln-01 sudah berjalan (Project 01), tapi semua data masih
numpang di disk OS. Tidak ada monitoring disk dan tidak ada backup otomatis —
kalau disk penuh atau VM crash, data rekam medis klinik hilang permanen.

Project ini memisahkan disk data dari OS, mengotomasi monitoring, dan membangun
prosedur backup + disaster recovery.

---

## Apa yang Dikerjakan

### A — Disk & Filesystem
Menambah virtual disk 10 GB baru di VirtualBox tanpa reinstall sistem.
Disk dipartisi, diformat ext4, lalu di-mount ke `/data/` secara permanen via `/etc/fstab`.
Isi `/data/` dari Project 01 dipindahkan ke disk baru menggunakan `cp -a`.

### B — Monitoring Disk Otomatis
Script `disk-monitor.sh` berjalan tiap hari jam 07.00 via cron.
Script mengecek penggunaan semua disk — jika ada yang melebihi 80%, dicatat sebagai WARNING di log.

### C — Backup Otomatis
Script `backup.sh` berjalan tiap hari jam 02.00 via cron.
Backup dilakukan dengan `rsync` dari `/data/` ke `/backup/YYYY-MM-DD/`.
Rotasi otomatis: backup lebih dari 7 hari dihapus.

### D — Simulasi Disaster Recovery
Simulasi data hilang: folder `/data/medis/` dihapus, lalu di-restore dari backup.
Hasil di-diff untuk memastikan isi identik sebelum dan sesudah restore.

---

## RPO & RTO Klinik

| Parameter | Nilai | Artinya |
|-----------|-------|---------|
| RPO | 24 jam | Maksimal kehilangan data 1 hari (backup harian) |
| RTO | 2 jam | Sistem harus pulih dalam 2 jam setelah insiden |

Matriks RPO/RTO lengkap tersedia di [`RPO-RTO-matrix.csv`](./RPO-RTO-matrix.csv).

---

## Konfigurasi Storage

| Device | Mount Point | Ukuran | Isi |
|--------|-------------|--------|-----|
| `/dev/sda` | `/` (root) | 25 GB | OS + sistem (dari Project 01) |
| `/dev/sdb1` | `/data/` | 10 GB | Data klinik (disk baru) |

Entry `/etc/fstab` yang ditambahkan:
```
UUID=<uuid-sdb1>  /data  ext4  defaults  0  2
```

---

## Scripts

| Script | Lokasi | Jadwal Cron | Fungsi |
|--------|--------|-------------|--------|
| `disk-monitor.sh` | `/usr/local/bin/` | `0 7 * * *` (jam 07.00) | Cek penggunaan disk, catat WARNING jika > 80% |
| `backup.sh` | `/usr/local/bin/` | `0 2 * * *` (jam 02.00) | Backup `/data/` ke `/backup/`, rotasi 7 hari |

Log output:
- Monitoring: `/var/log/disk-monitor.log`
- Backup: `/var/log/backup.log`

---

## Hasil Verifikasi

- [x] Disk baru `/dev/sdb1` ter-mount di `/data/`
- [x] `/etc/fstab` dikonfigurasi — mount permanen setelah reboot
- [x] `disk-monitor.sh` berjalan dan menghasilkan log
- [x] `backup.sh` berjalan — folder backup terbuat di `/backup/`
- [x] Cron job aktif untuk kedua script
- [x] Simulasi restore berhasil — `diff /data/medis /backup/2026-06-17/medis` kosong (identik)

---

## Files

| File | Keterangan |
|------|------------|
| [whitepaper.md](./whitepaper.md) | Dokumen standar lengkap project ini |
| [commands-log.md](./commands-log.md) | Semua perintah + langkah implementasi |
| [RPO-RTO-matrix.csv](./RPO-RTO-matrix.csv) | Matriks RPO/RTO standar operasional klinik |
| [scripts/disk-monitor.sh](./scripts/disk-monitor.sh) | Script monitoring disk |
| [scripts/backup.sh](./scripts/backup.sh) | Script backup otomatis |
| [screenshots/](./screenshots/) | Bukti visual implementasi |

---

## Pelajaran yang Didapat

> Isi bagian ini setelah project selesai dengan kata-katamu sendiri.
> Contoh: error apa yang ditemui, kenapa terjadi, cara menyelesaikannya.

---

## Referensi

- [Ubuntu Docs — Storage Introduction](https://ubuntu.com/server/docs/storage-introduction)
- [Ubuntu Docs — Backups](https://ubuntu.com/server/docs/backups-introduction)
- `man fdisk` | `man mkfs.ext4` | `man fstab` | `man rsync` | `man crontab`

---

*Project sebelumnya → [Project 01: User Management](../project-01-user-management/)*  
*Project berikutnya → [Project 03: Networking Dasar](../project-03-networking/)*
