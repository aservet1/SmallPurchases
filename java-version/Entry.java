import java.time.LocalDateTime;

class Entry
{
	String date;
	String time;
	double price;

	public Entry(){}

	public Entry(double price)
	{
		String[] datetime = LocalDateTime.now().toString().split("T");
		this.date = datetime[0];
		this.time = datetime[1].substring(0,datetime[1].indexOf("."));
		this.price = price;
	}

	public String toString()
	{
		return date+" "+time+"\t"+price;
	}

	public static void main(String[] args)
	{
		System.out.println(new Entry(2.50));
	}
}
