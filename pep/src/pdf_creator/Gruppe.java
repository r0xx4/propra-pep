package pdf_creator;


public class Gruppe {
	private int gruppennr;
	private int platz;
	private String desc;
	private String nam;
	
	public Gruppe(int gruppennrr, int platzz, String name, String descc)
	{
		gruppennr=gruppennrr;
		platz=platzz;
		desc=descc;
		nam=name;
	}
	public int getPlatz()
	{
		return platz;
	}
	public int getGruppennr()
	{
		return gruppennr;
	}
	public String getDisc()
	{
		return desc;
	}
	public String getName()
	{
		return nam;
	}
	
}

