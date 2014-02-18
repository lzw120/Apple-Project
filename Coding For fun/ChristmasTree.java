import java.util.ArrayList;
import java.util.Random;

import javax.swing.SpringLayout.Constraints;


/** 
 * Draw a customized multiple level Christmas Tree.
 * MyChristmasTree looks like this(star may be replaced by random ASCII character):
 * A ChristmasTree consists of a list of SubTree, with a Trunk ended.
 * @author Zewen Li. 02/14/2014
 * @version 1.0
 * 
 * 
 * 
 * 
                                 *
                               *****
                             *********
                               *****
                             *********
                           *************
                         *****************
                             *********
                           *************
                         *****************
                       *********************
                     *************************
                           *************
                         *****************
                       *********************
                     *************************
                   *****************************
                 *********************************
                           *************
                           *************
                           *************
                           *************
                           *************
                           *************
 * 
 * */

public class ChristmasTree {
	/*
	 * A SubTree is similar to a triangle with multiple levels of nodes.
	 * */
	public class SubTree {
		// number for nodes in first level.
		private int initialNumber;
		// number of level for each TriangleCombination
		private int level;
		public SubTree(int number, int levels) {
			initialNumber = number;
			level = levels;
		}
		/**
		 * This method is used to draw a subTree level by level to the command line screen.
		 *  @param offset
		 *  offset is the number of white space needs to be placed for the 1st level
		 *  @return void
		*/
		public void display(int offset){
			int count = initialNumber;
			Random myRandom = new Random();
			for (int i = 0; i < level; i++) {
				StringBuilder content = new StringBuilder();
				for (int j = 0; j < offset; j++) {
					content.append(" ");
				}
				for (int j = 0; j < count; j++) {
					if (randomChar) {						
						// random generating ASCII character
						star = (char) (myRandom.nextInt(94) + 32);
					}
					content.append(star);
				}
				System.out.println(content.toString());
				count += starIncrease;
				offset -= whiteSpaceDecrease;
			}
		}
	}
	
	/* A Trunk is the base support for a Christmas Tree.
	 * */
	public class Trunk {
		// Decides how many levels for a trunk.
		private int level;
		// Records how many nodes in the first level.
		private int initialNumber;
		public Trunk(int newLevel, int newInitialNumber) {
			level = newLevel;
			initialNumber = newInitialNumber;
		}
		/**
		 * This method is called to draw a Trunk level by level to the command line screen.
		 *  @param offset
		 *  offset is the number of white space needs to be placed for the 1st level
		 *  @return void
		*/
		public void display(int offset) {
			Random myRandom = new Random();
			for (int i = 0; i < level; i++) {
				StringBuilder content = new StringBuilder();
				int count = initialNumber;
				for (int j = 0; j < offset; j++) {
					content.append(" ");
				}
				for (int j = 0; j < count; j++) {
					if (randomChar) {
						// random generating ASCII character
						star = (char) (myRandom.nextInt(94) + 32);						
					}
					content.append(star);
				}				
				System.out.println(content.toString());
			}
		}
	}
	
	
	// A Christmas Tree could consist of multiple SubTrees.
	private ArrayList<SubTree> treeCombinations;
	// A Christmas Tree has only one Trunk.
	private Trunk myTrunk;
	// Values for how many SubTree needed to combine a Christmas Tree.
	private int numOfTreeCombinations;
	// Specify number of stars for top level in 1st Sub Tree.
	private final int initialNumberOfStars = 1;
	// Specify initial number of levels for 1st Sub Tree.
	private final int initialNumberOfLevel = 3;
	/* Number for how many more stars to be added for next level. 
	   Invariant: This number needs to be a positive even number.
	*/
	private final int starIncrease = 4;
	// Number for how many less white space to be deleted for next level.
	private final int whiteSpaceDecrease = starIncrease/2;
	// Character used to draw
	private char star = '*';
	// True to randomize star character in ASCII chart, false for '*' by default.
	private boolean randomChar = false;
	
	public ChristmasTree(int numOfSubTrees) {
		numOfTreeCombinations = numOfSubTrees;
		int number = initialNumberOfStars;
		int level = initialNumberOfLevel;
		treeCombinations = new ArrayList<ChristmasTree.SubTree>();
		for (int i = 0; i < numOfTreeCombinations; i++) {
			SubTree subTreeCombination = new SubTree(number, level);
			treeCombinations.add(subTreeCombination);
			number += starIncrease;
			level++;
		}
		level--;
		number -= starIncrease;
		myTrunk = new Trunk(level, number);
	}
	
	/*
	 * This method is called to draw a ChristmasTree to the command line screen.
	 * It initially draws the SubTree, then draws the Trunk to finish.
	*/
	public void display() {
		// Assure enough white space needed.
		int offset = starIncrease*2*numOfTreeCombinations+1;
		for (int i = 0; i < treeCombinations.size(); i++) {
			treeCombinations.get(i).display(offset);
			offset -= whiteSpaceDecrease;
		}
		offset += whiteSpaceDecrease;
		myTrunk.display(offset);
	}
	
	public static void main(String[] args) {
		try {
			if (Integer.parseInt(args[0]) <= 0) {
				System.out.println("Please enter a positive integer.");
				return;
			}
		ChristmasTree tree = new ChristmasTree(Integer.parseInt(args[0]));
		tree.display();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Please enter a positive integer.");
		}
	}
}
