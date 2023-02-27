
package Utils;

import Exceptions.FormException;


public class FormValidator {

	private static boolean checkNotEmpty(String field) {
		if (field.isEmpty() || field.length() == 0 || field == null) {
			return false;
		}
		return true;
	}

	private static boolean checkLength(String field, int len) {
		if (field.length() < len) {
			return false;
		}
		return true;
	}

	public static void validateEmail(String email) throws FormException {
		if (!checkNotEmpty(email) || !email.contains("@")) {
			throw new FormException("email", "Please, Enter a valid email");
		}
	}

	public static void validatePassword(String password) throws FormException {

		if (!checkNotEmpty(password)) {
			throw new FormException("password", "Please, Enter your password");
		}

		if (!checkLength(password, 6)) {
			throw new FormException("password", "Password should be more than 5 characters");
		}
	}

	public static void validateEmpty(String value, String field, String msg) throws FormException {
		if (!checkNotEmpty(value)) {
			throw new FormException(field, msg);
		}
	}

	public static void validateLength(String value, int len, String field, String msg) throws FormException {
		if (!checkLength(value, len)) {
			throw new FormException(field, msg);
		}
	}
	
	public static void validateMatch(String val1, String val2, String field, String msg) throws FormException {
		if (!val1.equals(val2)) {
			throw new FormException(field, msg);
		}
	}
	
	public static String escapeContent(String content) {
		content = content.replaceAll("<", "&lt;");
		content = content.replaceAll(">", "&gt;");
		content = content.replaceAll(String.valueOf('"'), "&qout;");
		content = content.replaceAll("'", "&qout;");
		return content;
	}

}
