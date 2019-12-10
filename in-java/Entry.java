import java.time.LocalDateTime;

class Entry
{
	String dateTime;
	double price;

	public Entry(){}

	public Entry(double _price)
	{
		String[] rawDateTime = LocalDateTime.now().toString().split("T");
		String date = rawDateTime[0];
		String time = rawDateTime[1].substring(0,rawDateTime[1].indexOf("."));

		dateTime = date+" "+time;
		price = _price;
	}

	public String toString()
	{
		return dateTime+"\t"+price;
	}

	public static void main(String[] args)
	{
		System.out.println(new Entry(2.50));
	}
}
