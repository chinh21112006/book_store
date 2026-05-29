package com.example.bookstore.service;

import com.example.bookstore.model.Book;
import com.example.bookstore.model.Category;
import com.example.bookstore.model.Author;
import com.example.bookstore.repository.BookRepository;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BookService {

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private AuthorService authorService;

    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }

    public Optional<Book> getBookById(Long id) {
        return bookRepository.findById(id);
    }

    public List<Book> getBooksByCategory(Category category) {
        return bookRepository.findByCategory(category);
    }

    public List<Book> getBooksByAuthor(Author author) {
        return bookRepository.findByAuthor(author);
    }

    @PostConstruct
    public void initData() {
        // Create Categories if they don't exist
        if (categoryService.getAllCategories().isEmpty()) {
            categoryService.saveCategory(new Category("Văn học cổ điển", "https://lh3.googleusercontent.com/aida-public/AB6AXuAAfLWWJQ5La_pSeD91fSdGCXdReLkfJFW2TxtQMUS7T1PAa77HiDd8zgxSS192j3AO-2vUK-VYTn2Ip-CTSjww51WkV5phE1tT2ufczD1DSEWk5wend8spzj_gPti6m9LTU8dbDbjwrd6DgrR8Gkh91K9FdsJiYPYl_nkxlAQNDL64LHR57MQgDpND7LyCLSc7M7pxw962iDsPXAHWmaatulMYJ5gAVlIE6KCp0XKGedOiX7iGWV75Vpj9P3YeMt9XD3u6QsZBcDcG", "Những tác phẩm kinh điển vượt thời gian."));
            categoryService.saveCategory(new Category("Kinh tế & Tài chính", "https://lh3.googleusercontent.com/aida-public/AB6AXuCpCwlUIyQy7jdMhB8asB8JN8EXDMvzwJiWiYc7qM2u6_kpv5WADIC4Acvl0mtgYWIp3MrHicWX4UFOoBMojkXqN5bSDAzXip8QU6Qt0l3_14f-Iv23QU_VjIYnHhWlY6i8l5aIVrgxYJ0FK_5j8RgOtYIbS6E1gbV76b1MHIYPUrgt6BBUD40yY5mjl1j7hkJ8fIAZ_8G2GcgeGxMAic156wQG5cciTX1tFuEa1GXODKy40BmTyAmEJljRihWAKxJi1Bq7F3xI4qHG", "Sách về kinh tế, tài chính và quản lý."));
            categoryService.saveCategory(new Category("Trinh thám & Bí ẩn", "https://lh3.googleusercontent.com/aida-public/AB6AXuB01XpFWWhMxkAfIksPoUDmJwsRP-MhqG5k4Jmnj6Y0nZUpIKwvxfCII3pKSjKrrTRUJn1lSoF1i0ZLmyNNMzZ9l410V4qlpe_5fgK06jY4jaFdrR8y-8H_K2He4vvwukKGO3R6q6yUDDEzN_poNoYZDvv63n8_Ivznaoq0Z1Jp-Ub7xcSpKP8HyKxaq4mH4-aYRQGsApS5pq9UneAhmyaARxQgvR7vf1MkmADQOBC8OkYgEnUzHciJDXigneGiGhZb1XPk2Tfk1pWO-b2CclC9bLxvTjaU_xnolEFRlsKNTYQ-imcA2uYMfA-2Rv7KLjZHH8HsIqHRLQ1W2NbLLPSbJd_sHBR0WcIqXrWh4I", "Những câu chuyện ly kỳ, đầy kịch tính."));
            categoryService.saveCategory(new Category("Thiếu nhi & Truyện tranh", "https://lh3.googleusercontent.com/aida-public/AB6AXuDYVlL4rDBuolxSi8gmi0pZm1e6IZkJyjfrnEfq9pIVuAOK4KbFLEuyPF6MuOg8aNXkl7rpdA-JYwnfCV1M5BkLzqmE5Hv6AbLhZpr-FBUqfZE95ghn8x-I7mQuoGRocVgGj4WsUOZsfITlRSzFFXX7UyrrOETmHTYPv5yq-uplmZSe6-94oJTHQewvTwY5Ckd3kx7TJoI9NqmmJtn5qTsaFlNtCMZRFNYyXtQj7yfclhbUv-YatRvjqIBMxHkKG39hZwIkYsr5pfBj", "Thế giới đầy màu sắc dành cho trẻ em."));
        }

        // Create Authors if they don't exist
        if (authorService.getAllAuthors().isEmpty()) {
            authorService.saveAuthor(new Author("Elena Vance", "Tác giả của những câu chuyện phiêu lưu khoa học viễn tưởng đầy kịch tính.", "https://lh3.googleusercontent.com/aida-public/AB6AXuC772hosOCiDljjb_qXgpvmJmUuKgQfaxB2kQM256Zkhwzxz38wnsC28itoYOHsUZkuvZlXfPogyek7xGenGawi11AnE1YuzHIR_7raENZFrw8Tgww01CJnZW2Iy4SdSPXnywWVNbZIPsEwsrhzyaXK-bfcUz8HpmgcDSii13TigfOg8Bw-YuQVR4poBWWZBU3ifo7Fqx_7lq7C4p26eRGZSdvNn1-fYLIu2RozKUobzvlFvuzypgsrYfZ2Bzq0UvcTyF2xtHV5EYSH"));
            authorService.saveAuthor(new Author("Minh Nhật", "Tác giả trẻ với những tác phẩm lãng mạn, sâu lắng về tình yêu và cuộc sống.", "https://lh3.googleusercontent.com/aida-public/AB6AXuB5AwDFUIIgTkY7EDtro656xDvc1GNKrB7MDJkBPeAurfFCNIZ58vSRpxcrBfr_q3WhAoEDzydJIqvChmzcu9y4KHkuLCgXblwAffNFPjdo9pyQsyk0MnKaCzeKKYiPr8ED0ETX45Bpurs0D4UO1iv01cTSimdJ6QG4thexIX0-2ExbN6SwqvHpC4_cOPY38zOYUTDYGJiH_sBc8voLiWfc3va9oHENtdd8fqbeSyE8gTDqJEyFVieLVwe4FWTCQHhAC0TQR4Y2Guko"));
            authorService.saveAuthor(new Author("Arthur Thorne", "Bậc thầy của thể loại trinh thám, với những vụ án hóc búa và bất ngờ.", "https://lh3.googleusercontent.com/aida-public/AB6AXuAAHMZfkfqLI1toB9sosIH0Cl0A98YsxKDS6XJXur1iNzlxxaWqyZ7cW8DsAUNxbTJoZhjfsOha9qWWGPsIizGv2JTHYoZyLKNRS0lRY9gx2wBHV2bdNOc4fa92d_yG6-tCzF5IBa2hPapR2fRPIa6b1UFFUD6UTGdfhfmUPbN1dZ-B78BLozcvdjZOiVLZIZ3BoxulsMrehRlT2mphS81dFVmwH5vUbrVMTBSM0E9WKZowQO2s9fN18cG4uJtMQcRTeVJfPLMm25m-"));
            authorService.saveAuthor(new Author("Linh Lan", "Chuyên viết truyện thiếu nhi với những câu chuyện cổ tích hiện đại, giàu ý nghĩa.", "https://lh3.googleusercontent.com/aida-public/AB6AXuDqYFYWQbEOlwRkg6GcUwOJUKrsuNzOAtg9wlbERNLFWE282RY5ht4bY7VBKSc5FJV7NNE6U-LM4uNAqZYW-gqcZaBn3Rjr1A0p1pgFVpTptIJgP3DaYbZvhx7tkYn6n6-0I9aAVDEr6avru-Q-K5K8itWqGKBnbKtrJnv9iQSG9ayOk6OzeAqtxww-wG_N8ZlSGB2Cc_nDkZVACK4dOoqaPbXr9hjvbJxR9EBAKUZYsT-JV1XH_XlzRStW5Qu8-1gVr5JKzP2bubf8o"));
        }

        // Get existing categories and authors to assign to books
        Category classic = categoryService.getAllCategories().stream().filter(c -> c.getName().equals("Văn học cổ điển")).findFirst().orElse(null);
        Category detective = categoryService.getAllCategories().stream().filter(c -> c.getName().equals("Trinh thám & Bí ẩn")).findFirst().orElse(null);
        Category children = categoryService.getAllCategories().stream().filter(c -> c.getName().equals("Thiếu nhi & Truyện tranh")).findFirst().orElse(null);

        Author elenaVance = authorService.getAllAuthors().stream().filter(a -> a.getName().equals("Elena Vance")).findFirst().orElse(null);
        Author minhNhat = authorService.getAllAuthors().stream().filter(a -> a.getName().equals("Minh Nhật")).findFirst().orElse(null);
        Author arthurThorne = authorService.getAllAuthors().stream().filter(a -> a.getName().equals("Arthur Thorne")).findFirst().orElse(null);
        Author linhLan = authorService.getAllAuthors().stream().filter(a -> a.getName().equals("Linh Lan")).findFirst().orElse(null);


        // Create Books if they don't exist
        if (bookRepository.count() == 0) {
            bookRepository.save(new Book("Bản Đồ Thiên Hà", elenaVance, 245000.0, 320000.0, "https://lh3.googleusercontent.com/aida-public/AB6AXuA7wrUg_LnHQo_RDmPALIuNYdoHFGujYAKoh4CntkYmkAfH4F4n42WzSL5RNOSG76ISD-GV36npUZnVFfe0p3LqVtaAYgGL3CT147VE4TBkFg2SQ0sIP8A83OyGIq-u8xdoQ_maKQoHiRLTI9K2MCVEsWr4P92trylgZZ7tG6FoZYl42OuAIP1rbfTtFM3PgYhwvRG-Q2Z7qIi4iagOjiPf6u-mxzibqoT96AgH5-mQTfZGTj0nEvWEjesFNCceHlXOH0It2xuCP8D2", "Một cuộc phiêu lưu xuyên không gian đầy kịch tính và bất ngờ.", classic));
            bookRepository.save(new Book("Mùa Trong Tâm Hồn", minhNhat, 189000.0, null, "https://lh3.googleusercontent.com/aida-public/AB6AXuAEVeJq03ZUKo8_QILAHvzsgll1ed4afKgTo179WYTpVykFmC_nh6ecQF39uheuIDjMRd9Nksr4Qdu8KsW_7Ulf1da7zR_ueMEaNY4vAUTpwyEvqU-cxstVL-3nPbEPqQjioqRiuL9ZS0zCgrtomPOVDtikKKsg5R8t9ETvOsNjBb--tC6OI6X8stbBpoZ_wIBXK8edkZ8XjPtw1QRWPBNJXDGrQr1VVBPL18wjYW7RT55bAbAM7iOtlX4rJbvyChT912ryYqyl0Jb", "Câu chuyện nhẹ nhàng về sự trưởng thành và tìm kiếm bản thân.", classic));
            bookRepository.save(new Book("Tiếng Vọng Đỏ", arthurThorne, 210000.0, null, "https://lh3.googleusercontent.com/aida-public/AB6AXuC9fWbpSl6Yw03a6radvbIE-rpf95F_VwniwOh3cAduECNqLmKu4E_n-qIQcjdQzVLmERb4TUY4jDwEU33PrvA3aamVsUGXH-u7QKcwiwBs2niJlMb9xBEWfpTWJnQ5Y3xcyFX6PDQeZqEotY1A7xPZNp4r1SN-cAxXlKEGzyvFv5vFn7EKzuGaqUuQHyLuRx1UIB23mnu8j7JLEHL67fmJ93pajH7YhxSJZ8-mltEwvXpVkPJHHj-7q194V6kXV33JXWoUuJ4Ix6zT", "Một vụ án mạng bí ẩn thách thức mọi suy luận.", detective));
            bookRepository.save(new Book("Sâu Trong Khu Rừng", linhLan, 155000.0, null, "https://lh3.googleusercontent.com/aida-public/AB6AXuA5kXl6rVkglyE2B1vNGxuH0boPFB1lKphMYLui5mVan22AXpAeQnmFSjCDavz779lS8FMn9VHzCg3-bFJQMI77q0-OUlGKjGecDBSSj0R51cBhl9y5Z5U_USdTnf5zBVPvftn4tQCUOUfZdytisg6lEwI9SgXkw742H2uWpepH6LwNLN8mVZ7GyXSnca1zRRh7keeJqwVoBcEVWDNqgJhkziqgop_TZsZEhP_4CFjvfXp5B6pAxQ5b-o16vbr9R17Yo5rwCDfxyzYb", "Cuộc phiêu lưu kỳ thú của một cô bé lạc vào khu rừng cổ tích.", children));
        }
    }
}
