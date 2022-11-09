# **Tugas 7: Elemen Dasar Flutter**

Nama    : Prita Elisabeth Laura Tarigan

NPM     : 2106751190


## 🪗**Jelaskan apa yang dimaksud dengan *stateless widget* dan *stateful widget* dan jelaskan perbedaan dari keduanya** 🪗

*Stateless widget* adalah widget yang bersifat statis. Pada *Stateless widget*, state dari widget tersebut tidak dapat diubah setelah widget tersebut dibuat. Contohnya adalah Icon, IconButton, dan Text. 
*Stateful widget* adalah widget yang bersifat dinamis. Pada *Stateful widget*, state dari widget tersebut dapat diubah setelah widget tersebut dibuat. Jika terjadi event sebagai hasil interaksi oleh user, maka widget tersebut dapat memperbarui tampilannya sebagai respons dari pemicu tersebut. Contohnya adalah *Checkbox*, *Radio*, *Slider*, dan *Form*. 

## 🎲 **Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya** 🎲

| No | Widget | Fungsi |
| -- | ------------- | ------------- |
| 1  | AppBar | Menampilkan bar aplikasi yang berisi title |
| 2  | Center  | Agar posisi widget berada di tengah  |
| 3  | Column  | Menampilkan widget-widget secara vertikal |
| 4  | Container  | Membungkus widget lain sehingga dapat diberikan nilai margin, padding, dan dekorasi |
| 5  | FloatingActionButton  | Membuat button yang dapat dimodifikasi event di dalamnya |
| 6  | Icon  | Menggunakan icon yang telah disediakan |
| 7  | MaterialApp  | Mengatur segala route dan theme dari aplikasi |
| 8  | Row  | Menampilkan widget-widget secara horizontal |
| 9  | Scaffold  | Membuat sebuah halaman pada flutter  |
| 10 | Spacer  | Membuat jarak antar widget |
| 11 | Text  | Menampilkan sebuah teks biasa |


## 🚦 **Apa fungsi dari `setState()`?  Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.** 🚦

`setState()` hanya dipanggil di *Stateful Widget*. 
Ketika *state* dari widget berubah, maka *state* object akan memanggil fungsi `setState()` untuk memberitahu widget bahwa ada object yang berubah pada state, sehingga *framework* akan *re-build* pada widget tersebut.

Pada aplikasi counter_7, terdapat dua fitur yang mengimplementasikan `setState()` , yaitu:
- *Incerement*
`setState()` berpengaruh pada variabel counter. Saat tombol + (increment) diklik, maka akan dipanggil fungsi `setState()` untuk memberitahu bahwa terjadi perubahan pada *state* sehingga method `_incrementCounter` akan di-run kembali, `onPressed: _incrementCounter`. Kemudian variabel counter akan ditambah sebanyak satu satuan.
- *Decrement*
Saat tombol - (decrement) diklik, maka akan dipanggil fungsi `setState()` untuk memberitahu bahwa terjadi perubahan pada *state* sehingga method `_decrementCounter` akan di-*run* kembali, `onPressed: _decrementCounter`. Kemudian variabel counter akan dikurangi sebanyak satu satuan.

## 🧭 **Jelaskan perbedaan antara `const` dengan `final`.** 🧭

Dart memiliki sifat variabel *immutable*, yaitu variabel yang tidak bisa berubah setelah diinisialisasi. Variabel *immutable* dapat dideklarasikan dengan keyword `final` dan `const`. Keyword `final` dan `const` membuat perilaku variabel menjadi tidak dapat diubah setelah diinisialisasi sehingga tidak ada operasi apa pun yang dilakukan pada variabel tersebut untuk mengubah nilainya. 

`final` dapat digunakan untuk mendeklarasi variabel *immutable* yang nilai variabelnya sudah atau belum diketahui pada saat waktu kompilasi atau nilai variabel `final` akan diketahui pada saat eksekusi. Sementara, `const` dapat digunakan untuk mendeklarasi variabel *immutable* yang nilainya konstan dan harus sudah diketahui pada saat waktu kompilasi berjalan. Dengan kata lain, nilai dari variabel `const` harus sudah di-*assign* secara langsung.

## 🏁 **Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas dan Bonus** 🏁

[x] **Membuat sebuah program Flutter baru dengan nama counter_7** dengan cara membuka terminal dan masuk ke direktori sesuai dengan keinginan, lalu menjalankan perintah `flutter create counter_7`.

[x] **Mengubah tampilan program menjadi seperti pada soal.**
Untuk menampilkan tampilan program menjadi seperti pada soal, kita inisiasikan home dan membuat class `MyHomePage` dengan pengaturan `title: 'Program Counter'`. Untuk tampilan konten body akan diatur pada implementasi poin berikutnya.

[x] **Mengimplementasikan logika berikut pada program**

**1. Tombol + menambahkan angka sebanyak satu satuan.** 
Pertama-tama, deklarasikan variabel counter `int _counter = 0;`. Kemudian, buat method untuk menambahkan angka sebanyak satu satuan. Ketika tombol + diklik, maka fungsi `setState()` akan dipanggil dari method berikut ini. 
```
void _incrementCounter() {
    setState(() {
      _counter++;
    });
}
```

**2. Tombol - mengurangi angka sebanyak satu satuan.** 
Buat method untuk mengurangi angka sebanyak satu satuan. Ketika tombol - diklik, maka fungsi `setState()` akan dipanggil dari method berikut ini. 
```
void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
}
```

**3. Apabila counter bernilai ganjil, maka teks indikator berubah menjadi "GANJIL" dengan warna biru.**
```
else ...[
    const Text(
        'GANJIL',
        style: TextStyle(color: Colors.blue),
    )
]
```
Jika hasil modulo counter dengan 2 tidak sama dengan nol (kondisi lainnya dari poin 4), maka teks yang ditampilkan adalah "GANJIL" dan diberi atribut *style* dengan warna biru. 

**4. Apabila counter bernilai genap, maka teks indikator berubah menjadi "GENAP" dengan warna merah.**
```
if (_counter % 2 == 0) ...[
    const Text(
        'GENAP',
        style: TextStyle(color: Colors.red),
    )
]
```
Jika hasil modulo counter dengan 2 sama dengan nol, maka teks yang ditampilkan adalah "GENAP" dan diberi atribut *style* dengan warna merah. 

**5. Angka 0 dianggap sebagai angka genap.** 
Jika counter bernilai 0, maka akan masuk ke kondisi poin 4 karena `0 % 2 == 0` dan teks yang ditampilkan adalah "GENAP". 

**6. BONUS: Menyembunyikan/menghilangkan tombol - apabila counter bernilai 0.**
```
if (_counter != 0) ...[
    FloatingActionButton(
        onPressed: _decrementCounter,
        tooltip: 'Decrement',
        child: const Icon(Icons.remove))
], 
const Spacer(),
    FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add))
])
```
Jika nilai counter tidak sama dengan 0, maka tombol yang akan ditampilkan adalah tombol + dan -. Sementara, jika nilai counter sama dengan 0, maka tombol yang akan ditampilkan hanya tombol +.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.