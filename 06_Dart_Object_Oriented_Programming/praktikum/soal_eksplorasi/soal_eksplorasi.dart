class Book {
  int id;
  String title;
  String publisher;
  double price;
  String category;

  Book(this.id, this.title, this.publisher, this.price, this.category);

  @override
  String toString() {
    return 'ID: $id\nJudul: $title\nPenerbit: $publisher\nHarga: Rp $price\nKategori: $category\n';
  }
}

class BookStore {
  List<Book> books = [];
  int _nextId = 1;

  void addBook(String title, String publisher, double price, String category) {
    final book = Book(_nextId, title, publisher, price, category);
    books.add(book);
    _nextId++;
  }

  List<Book> getAllBooks() {
    return books;
  }

  bool removeBook(int id) {
    final bookIndex = books.indexWhere((book) => book.id == id);
    if (bookIndex != -1) {
      books.removeAt(bookIndex);
      return true;
    }
    return false;
  }
}

void main() {
  var bookStore = BookStore();

  // Menambahkan beberapa buku
  bookStore.addBook('Buku 1', 'Penerbit joni', 100.0, 'Fiksi');
  bookStore.addBook('Buku 2', 'Penerbit suparman', 75.0, 'Non-Fiksi');

  // Mendapatkan semua data buku
  final allBooks = bookStore.getAllBooks();
  print('Data semua buku:');
  allBooks.forEach((book) {
    print(book);
  });

  // Menghapus buku dengan ID tertentu
  final bookIdToRemove = 1;
  if (bookStore.removeBook(bookIdToRemove)) {
    print('Buku dengan ID $bookIdToRemove telah dihapus.');
  } else {
    print('Buku dengan ID $bookIdToRemove tidak ditemukan.');
  }

  // Mendapatkan data buku setelah penghapusan
  final remainingBooks = bookStore.getAllBooks();
  print('\nData buku setelah penghapusan:');
  remainingBooks.forEach((book) {
    print(book);
  });
}
