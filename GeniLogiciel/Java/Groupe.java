import java.util.*;

public class Groupe{
	
	private ArrayList<Etudiant> listEtu;
	private ArrayList<Voeu> voeux;
	
	public Groupe() {
		this.listEtu = new ArrayList();
		this.voeux = new ArrayList();
	}
	
	public void ajoutEtudiant(Etudiant e) {
		if(this.listEtu.size()>=5) {
			System.out.print("y'a trop de gadjo dans ton grp khoya");
		}
		else {
			this.listEtu.add(e);
		}
	}
	public void ajoutVoeu(Voeu v) {
		if(this.voeux.size()>=5) {
			System.out.print("ya tro pde voeux pd");
		}
		else {
			this.voeux.add(v);
		}
	}
}