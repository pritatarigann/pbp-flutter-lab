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


# **Tugas 8: Flutter Form**

## 🌻 **Perbedaaan Navigator.push dan Navigator.pushReplacement** 🌻

`Navigator.push` adalah suatu method yang digunakan untuk menimpa halaman sebelumnya dengan menambahkan rute atau page lain di atas page saat ini. Halaman baru ditampilkan di atas halaman sebelumnya. 
`Navigator.pushReplacement` adalah mengganti route yang ada di stack navigasi dengan route baru serta melakukan push page baru dan menghapus atau menghilangkan page/routing lama atau yang sebelumnya digunakan. Pada method `Navigator.push`, halaman sebelumnya masih dapat diakses jika sewaktu-waktu ingin diakses kembali. Berbeda halnya dengan `Navigator.pushReplacement` dimana page sebelumnya akan dihapus ketika page baru sudah ditambahkan sehingga page sebelumnya akan digantikan dengan page yang baru. Dengan begitu, halaman tidak dapat berpindahkan ke halaman sebelumnya.

## 🧭 **Widget yang Dipakai** 🧭

| No | Widget | Fungsi |
| -- | ------------- | ------------- |
| 1  | Card  | Membuat tampilan kotak-kotak dengan efek bayangan di tepi |
| 2  | TextButton | Menampilkan button yang dapat diberi tulisan |
| 3  | TextFormField  | Menampilkan fungsionalitas input text |
| 4  | Form  | Membuat fitur Form yang menerima input dari pengguna |
| 5  | Drawer  | Membuat fitur navigasi menuju page lain |
| 6  | DropdownButton  | Membuat button yang dapat memunculkan beberapa pilihan sebagai opsi input pemasukan atau pengeluaran |
| 7  | Expanded  | Mengatur size child widget agar mengisi tempat yang tersedia  |
| 8  | Dialog  | Menampilkan pop up window pada halaman aplikasi  |
| 9  | ListTile  | Menampilkan *single fixed-height row* yang menampung teks sebagai leading dan trailing  |
| 10  | ListView  | Menampilkan widget lain yang merupakan *child*-nya  |
| 11  | Padding  | Mengatur padding pada widget yang menjadi *child*-nya  |
| 12  | SizedBox  | Mengatur ukuran serta memberikan jarak antar widget  |

## 🏀 **Jenis-jenis event yang ada pada Flutter** 🏀

- onTap: event yang terjadi ketika widget di-*tap*.
- onPressed: event yang terjadi ketika widget di tekan.
- onChanged: event yang terjadi ketika widget diubah.
- onSaved: event yang terjadi ketika widget disimpan.
- onExit: event yang terjadi ketika ingin menutup aplikasi.

## 🎃 **Cara kerja Navigator dalam "mengganti" halaman aplikasi Flutter** 🎃

Navigator mengganti halaman dengan memanfaatkan sebuah Stack. Halaman yang ditampilkan di paling atas yang ditampilkan untuk user merupakan halaman yang terdapat pada top of stack. Mengganti halaman dapat memanfaatkan push untuk menimpa halaman sebelumnya, pushReplacement untuk mengganti halaman sebelumnya, pop untuk kembali ke halaman sebelumnya, dll. Navigator mengatur stack of route dengan menggunakan dua cara, yaitu `Navigator.push` dan `Navigator.pop`. Apabila user ingin berpindah ke halaman sebelumnya, dapat diterapkan operasi pop agar halaman yang pada saat itu berada paling atas dapat dikeluarkan sehingga halaman sebelumnya menggantikan posisinya menjadi top of stack. 

## 🏁 **Implementasi Checklist** 🏁
[x] Dengan menggunakan aplikasi counter_7 yang telah dibuat pada tugas sebelumnya, ditambahkan file `budget.dart`, `data.dart`, `drawer.dart`, dan `form.dart` ke dalam folder `lib`.

[x] Menambahkan tiga tombol navigasi pada `drawer.dart` untuk ke halaman counter, halaman form, halaman yang menampilkan data budget yang telah di-input melalui form.

```Dart 
  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 12,
        children: [
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              // close navigation drawer before
              Navigator.pop(context);
              // Route menu ke halaman form
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MyFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              // close navigation drawer before
              Navigator.pop(context);
              // Route menu ke halaman data budget
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MyDataPage()),
              );
            },
          ),
        ],
      ));
}
```

[x] Menambahkan models pada file baru `budget.dart` yang memanfaatkan struktur data seperti List untuk menyimpan data yang dibuat.
```Dart
class Budget {
  static List<Budget> budgets = [];
  String judul;
  int nominal;
  String tipe;
  DateTime date;

  Budget({
    required this.judul,
    required this.nominal,
    required this.tipe,
    required this.date,
  });

  static void addBudget({
    required judul,
    required nominal,
    required tipe,
    required date,
  }) {
    budgets.add(Budget(
      judul: judul,
      nominal: nominal,
      tipe: tipe,
      date: date,
    ));
  }
}
```

[x] Menambahkan file baru `data.dart` untuk menampilkan data budget semua judul, nominal, dan tipe budget yang telah ditambahkan pada form.

[x] Menambahkan file baru `form.dart` untuk membuat Form dan Elemen Input. Di halaman form, terdapat widget input judul, nominal, tipe, date, dan button untuk submit form. Dengan menginisialisasi variabel elemen input dengan tipe data String berupa judul budget, tipe data int berupa nominal budget, tipe budget dengan pilihan pemasukan dan pengeluaran serta menambahkan button untuk menyimpan budget.

[x] Menjalankan proyek program Flutter dengan `flutter run` pada `cmd`.

[x] Melakukan `add-commit-push` proyek ke repositori `pbp-flutter-lab`.

## 🧲 **Implementasi Bonus** 🧲

[x] Menambahkan elemen date picker pada halaman form.
```Dart
TextButton(
  onPressed: (() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2999),
    ).then((value) {
      setState(() {
        _date = value;
      });
    });
  }),
```
[x] Menampilkan elemen date (format bebas) pada setiap elemen budget yang ada pada halaman data budget.
```Dart
  child: ListTile(
      title: Text("${budget.judul}\n${budget.nominal}"),
      subtitle: Text(budget.date.toString().split(' ')[0]),
      trailing: Text(budget.tipe)),
);
}).toList(),
```
[x] Refactor widget Drawer ke sebuah file terpisah.
```Dart
Widget build(BuildContext context) => Drawer(
      child: SingleChildScrollView(
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildMenuItems(context),
            ]),
      ),
    );
```


# **Tugas 9: Integrasi Web Service pada Flutter**

##🧨 **Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?** 🧨


## 🎍 **Widget yang Dipakai** 🎍

## 🎐 **Mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter** 🎐



## 🏁 **Implementasi Checklist** 🏁
[x] Dengan menggunakan aplikasi counter_7 yang telah dibuat pada tugas sebelumnya, ditambahkan file `budget.dart`, `data.dart`, `drawer.dart`, dan `form.dart` ke dalam folder `lib`.

[x] Menambahkan tombol navigasi pada `drawer.dart` untuk ke halaman *mywatchlist*.

```
...
ListTile(
            title: const Text('My Watch List'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyWatchList()),
              );
            },
          ),
...
```

[x] Menambahkan models pada file baru `watchlist.dart` pada folder model.
```import 'dart:convert';

List<WatchList> watchListFromJson(String str) => List<WatchList>.from(json.decode(str).map((x) => WatchList.fromJson(x)));

String watchListToJson(List<WatchList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WatchList {
  WatchList({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  int pk;
  Fields fields;

  factory WatchList.fromJson(Map<String, dynamic> json) => WatchList(
    model: modelValues.map[json["model"]],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": modelValues.reverse[model],
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.watched,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  bool watched;
  String title;
  int rating;
  DateTime releaseDate;
  String review;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    watched: json["watched"],
    title: json["title"],
    rating: json["rating"],
    releaseDate: DateTime.parse(json["release_date"]),
    review: json["review"],
  );

  Map<String, dynamic> toJson() => {
    "watched": watched,
    "title": title,
    "rating": rating,
    "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "review": review,
  };
}

enum Model { MYWATCHLIST_MYWATCHLIST }

final modelValues = EnumValues({
  "mywatchlist.mywatchlist": Model.MYWATCHLIST_MYWATCHLIST
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
```

[x] Menambahkan file baru `mywatchlist.dart` untuk menampilkan list film.

[x] Menambahkan file baru `watchlist_detail.dart` untuk menampilkan detail dari film. Di halaman ini, akan ditampilkan judul, tahun rilis, ratig, status, dan review dari setiap film.

[x] Menjalankan proyek program Flutter dengan `flutter run` pada `cmd`.

[x] Melakukan `add-commit-push` proyek ke repositori `pbp-flutter-lab`.

## 🧲 **Implementasi Bonus** 🧲

[x] Menambahkan *checkbox* pada list film dengan menambah potongan kode berikut di file `mywatchlist.dart` .
```
...
Expanded(
      flex: 2,
      child: Checkbox(
        activeColor: Colors.blue,
        value: listOfWatched[index],
        onChanged: (value){
          setState(() {
            listOfWatched[index] = !listOfWatched[index];
          });
        },
      ),
    )
...
```
[x] Menambahkan warna pada *outline* di setiap list dengan menambahkan potongan kode berikut di `mywatchlist.dart`.
```...
else{
  return ListView.builder(
    itemCount: snapshot.data.length,
    itemBuilder: (_, index) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(
          color: ((listOfWatched[index])
          ? Colors.blue
          : Colors.red),
          width: 2
        )
...
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.