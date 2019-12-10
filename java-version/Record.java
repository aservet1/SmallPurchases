import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.FileNotFoundException;
import java.util.Scanner;

//@TODO -- research Java/SQL interface (see some of your old TC3 files)
class Record // eventaully turn this to wrapping an SQL database not txt file
{
	String fileName; // exists object to reprsent SQL database?

	public Record(){}

	public Record(String _fileName)
	{
		fileName = _fileName;
	}

	public void add(Entry entry)
	{
		File file = new File(fileName);
		FileWriter recordWriter = null;
		try {
			recordWriter.append(entry.toString());
			recordWriter.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public boolean proceed()
	{
		Scanner keyboard = new Scanner(System.in);
		System.out.print("This will delete the record.\n"+
				"Are you sure?\n"+
				"Enter Y to proceed, N to exit the program: ");
		System.out.println();
		String response = keyboard.nextLine();
		while((response != "Y" || response != "y") && (response != "N" || response != "n")) {
			System.out.print("Invalid entry. Try again: (Y/N): ");
			response = keyboard.nextLine();
			System.out.println();
		}

		if (response == "Y" || response == "y") {
			return true;
		} else return false;
	}

	public void clear()
	{
		if (proceed()) {
			File file = new File(fileName);
			FileWriter recordWriter = null;
			try {
				recordWriter = new FileWriter(file);
				recordWriter.write("");
				recordWriter.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public String toString()
	{
		Scanner fileReader = null;
		String contents = null;
		try {
			fileReader = new Scanner(new File(fileName));
			fileReader.useDelimiter("\\Z");
			contents = fileReader.next();
			fileReader.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return contents;
	}

	public static void main(String[] args)
	{
		// havent tested any of the methods here yet lol
	}
}
