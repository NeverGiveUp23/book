package com.example.book.service;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.example.book.models.LoginUser;
import com.example.book.models.User;
import com.example.book.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;
	
	
	public User register(User newUser, BindingResult result) {
		
//		optional list checking if user is in DB
		Optional<User> optionalUser = userRepo.findByEmail(newUser.getEmail());
//		logic if user email is already in DB
		if(optionalUser.isPresent()) {
			result.rejectValue("email", "unique", "This email is already registered");
		}
//		if password does not match the confirm password
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("password", "matches", "This confirm password does not match");
		}
		if(result.hasErrors()) {
			return null;
		}
//		hashing the password
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
//		setting the hash password
		newUser.setPassword(hashed);
//		saving the user to the DB
		userRepo.save(newUser);
		return newUser;
	}
	
	
	public User login(LoginUser newLogin, BindingResult result) {
//		optional list checking if user is in DB
		Optional<User> optionalUser = userRepo.findByEmail(newLogin.getEmail());
//		logic if user  is  in DB
		if(!optionalUser.isPresent()) {
//			reject value is a built in method , checking if the email is even in the DB, if the user exists
			result.rejectValue("email", "unigue", "This email is not present");
			return null;
		}
//		assigning user to the get() method that will grab the specific user
		User user = optionalUser.get();
//		checking if the password matches the one in the DB
		if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid Password");
		}
		
		if(result.hasErrors()) {
			return null;
		}
		return user;
	}
	
	
//	find one user
	public User oneUser(Long id) {
//		optional list to get the one user when a post or etc is a link
		Optional<User> optionalUser = userRepo.findById(id);
//		if present in the DB, it will get that specific post or user
		if(optionalUser.isPresent()) {
			return optionalUser.get();
		}
		else {
			return null;
		}
	}


}
