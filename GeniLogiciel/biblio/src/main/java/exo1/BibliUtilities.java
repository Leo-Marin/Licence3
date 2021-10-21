package exo1;

import java.util.ArrayList;
 
public class BibliUtilities {
	
	
	
	public ArrayList<NoticeBibliographique> chercherNoticesConnexes(NoticeBibliographique ref){
		
		ArrayList<NoticeBibliographique> allNotice = new GlobalBibliographyAccess().noticesDuMemeAuteurQue(ref);
		ArrayList<NoticeBibliographique> rep = new ArrayList<>();
		int compt = 0;
		int i =0;
		while(compt<5 && i<allNotice.size()) {
			if(allNotice.get(i).getTitre()!=ref.getTitre()) {
				if(!rep.contains(allNotice.get(i))){
					rep.add(allNotice.get(i));
					compt++;
				}
			}
			i++;
		}
		return rep;
	}

}
