# Linux Sysadmin Lab
**Pemilik:** bsantoso (IT Administrator Trainee)
**Skenario:** Klinik Pratama Sehat Bersama — klinik swasta skala kecil, ~20 karyawan
**Tujuan:** Membangun infrastruktur server Linux dari nol, mulai dari user management sampai CIS hardening

---

## Tentang Lab Ini

Lab ini adalah dokumentasi perjalanan belajar Linux sysadmin berbasis proyek nyata.
Semua project menggunakan tools gratis dan open source — tidak ada biaya apapun.

Setiap project punya:
- White paper (konteks, aturan, dan standar)
- commands-log.md (semua perintah + output before/after)
- Screenshots sebagai bukti implementasi
- Checklist verifikasi

---

## Environment

| Komponen | Spesifikasi |
|----------|-------------|
| Host | Windows, RAM 8 GB, SSD |
| Server VM | Ubuntu Server 22.04 LTS di VirtualBox |
| Workstation Admin | WSL2 Ubuntu 22.04 |
| Network | VirtualBox Host-Only (192.168.56.0/24) |
| Server IP | 192.168.56.10 (srv-kln-01) |

---

## Daftar Project

| Project | Topik | Status |
|---------|-------|--------|
| [Project 01](./project-01-user-management/) | Server Provisioning & User Management | 🔄 In Progress |
| Project 02 | Storage, Filesystem & Backup Policy | ⏳ Belum mulai |
| Project 03 | LAMP Stack & Intro Odoo ERP | ⏳ Belum mulai |
| Project 04 | Monitoring & Log Management | ⏳ Belum mulai |
| Project 05 | Backup Otomatis & Disaster Recovery | ⏳ Belum mulai |
| Project 06 | CIS Benchmark Hardening Ubuntu 22.04 | ⏳ Belum mulai |

---

## Referensi Utama

- [Ubuntu Server Guide](https://ubuntu.com/server/docs)
- [CIS Benchmark Ubuntu](https://www.cisecurity.org/benchmark/ubuntu_linux)
- [ArchWiki — Users and Groups](https://wiki.archlinux.org/title/Users_and_groups)
- [Linux PAM](https://www.linux-pam.org/Linux-PAM-html/)
- [WSL2 Docs](https://learn.microsoft.com/en-us/windows/wsl)

---

*Bagian dari persiapan magang — jalur Sysadmin & ERP Admin*
