package Exceptions;

public class FormException extends Exception {

	String element;

	public FormException(String element, String message) {
		super(message);
		this.element = element;
	}

	public String getElement() {
		return element;
	}

}
