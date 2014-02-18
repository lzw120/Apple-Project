import java.util.LinkedList;
import java.util.List;

/**
 * Calculates every palindrome between 1 and 10,000, and return the amount 
 * @author zewenli
 * @version 1.0
 */

public class Palindrome {

	/**
	 *  Count the amount of palindrome numbers between 1 to limit, including both 1 and limit.
	 *  @param limit
	 *  The upper bounds for finding the palindrome.
	 * 	@return
	 *  Amount of palindrome numbers
	 * */
	public static int countPalindrome(int limit) {
		// Save all palindrome number found into result.
		List<Integer> result = new LinkedList<Integer>();
		// Corner case when limit <= 9
		for (int i = 1; i <= Math.min(9, limit); i++) {
			result.add(i);
		}
		boolean finished = false;
		int prefix = 1;
		String[] digits = "0123456789".split("");
		// Start to generate palindrome digits below limit.
		while (!finished) {
			StringBuilder postfix = new StringBuilder("" + prefix).reverse();
			finished = true;
			for (int i = 0; i < digits.length; i++) {
				int palindromeNumber = Integer.parseInt("" + prefix + digits[i] + postfix);
				if (palindromeNumber <= limit) {
					result.add(palindromeNumber);
					finished = false;
				}
			}
			prefix++;
		}
		return result.size();
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int result = countPalindrome(10000);
		System.out.println(result);
	}

}
