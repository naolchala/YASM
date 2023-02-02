/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Exceptions;

public class UserDontExistException extends Exception {

	public UserDontExistException(String message) {
		super(message);
	}

	public UserDontExistException() {
		super("User Doesn't Exist");
	}
	
	
	
}
