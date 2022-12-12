package com.example.book.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.book.models.Book;
import com.example.book.service.BookService;

@Controller
public class BookController {
//	passing in the service file for book
	@Autowired
	private BookService bookServ;
	
	
//	brining in session to check if the user is in session, or even logged in.
//	wont be able to access other pages that it shouldnt have access to.
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
//		checking if the userID is in session
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		} else {
//			if a userID is in session , it will continue to the dashboard page that will be showing the list 
//			which is the allBook() method in the bookServ file
		model.addAttribute("bookList", bookServ.allBooks());
		return "dashboard.jsp";
	}
}
	
	
//	create book
//	display the form
	@GetMapping("/book/new")
	public String displayBookForm(@ModelAttribute("newBook") Book book, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "hacker.jsp";
		} else {
		return "create.jsp";
		}
	}
	
//	make sure to check session on each file
//	use valid for form validation
//	pass in modelAttribute to the correct form 
//	the second variable name (in this case > book), you will pass that into the create method.

	
	@PostMapping("/book/new")
	public String createBook(@Valid @ModelAttribute("newBook") Book book,
			BindingResult result, Model model,HttpSession session) {
//		checking if the userID is in session

		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		} 
//		checking for errors on the file
		if(result.hasErrors()) {
			return "create.jsp";
		} 
		else {
//			no errors? it will continue to create the file from the method in the service file
			bookServ.createBook(book);
			return "redirect:/dashboard";
		}
		}
		

	
	@GetMapping("/display/book/{id}")
	public String displayBook(@PathVariable("id") Long id, Model model,HttpSession session) {
//		checking if the userID is in session

		if(session.getAttribute("userId") == null) {
			return "redirect:/";
			
		}  else {
		
//		using the get book method from the service file,  and passing in the PathVariable into the get book method
//			it will be associated with that id
		Book book = bookServ.getBook(id);
		
//		useing the "book" is for the jsp file name to access data with that name
//		the second book name after the comma, is to pass in the method of getBook.
		
//		now, with the second modelAttribute, im calling it "user" to be passed into jsp
//		attached to it is the book data, along with getUser method from the user service file -->
//		this will grab the book associated with that specific user
		model.addAttribute("book",book);
		model.addAttribute("user", book.getUser());
		return "display.jsp";
		}
	}
	
	
	
//	Request method for edit button
//	pass in id into the route to get the specific id, and bring in session and model model
	@RequestMapping("/book/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model,HttpSession session) {
//		checking if the userID is in session
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		} else {
//			naming foundBook and setting it to the service file and the get book method and passing in id
//			from the pathvariable
	    Book foundBook = bookServ.getBook(id);   // <--- path variable id
//	    assigning the attribute a name called "foundBook" to be passed into jsp
	    model.addAttribute("foundBook", foundBook); //<--- passing foundBook from above that carries the method
	    return "edit.jsp";
		}
	}
	
	
//	process edit form
	@PutMapping("/edit/{id}")
//	foundBook is the attribute to be passed into jsp form
	public String editBookForm(@Valid @ModelAttribute("foundBook")Book book, BindingResult result,HttpSession session) {
//		checking if the userID is in session
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		else {
			// editBook method from the bookServ file

			bookServ.editBook(book); //<--- book is the name in the parameter to be passed in
			return "redirect:/dashboard";
		}
	}


	
	
	@DeleteMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		bookServ.deleteBook(id);
		return "redirect:/dashboard";
	}
	
	
	}
	
	
	
