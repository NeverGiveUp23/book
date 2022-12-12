package com.example.book.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.book.models.Book;
import com.example.book.repository.BookRepository;

@Service
public class BookService {
	private final BookRepository bookRepo;
	
	public BookService(BookRepository bookRepo) {
		this.bookRepo = bookRepo;
	}
	
//	List all books
	public List<Book> allBooks(){
		return bookRepo.findAll();
	}
	
	
//	create a book
	public Book createBook(Book book) {
		return bookRepo.save(book);
	}
	
//	retrieves one book
	public Book getBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
//		checking to see if book is in DB
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		}
		else {
			return null;
		}
	}
	
//	edit book
	public Book editBook(Book book) {
		return bookRepo.save(book);
	}
	
//	delete book
	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
	}
	
	


}
