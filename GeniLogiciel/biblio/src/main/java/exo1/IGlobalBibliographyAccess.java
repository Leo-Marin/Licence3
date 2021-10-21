package exo1;

import java.util.ArrayList;

public interface IGlobalBibliographyAccess {

	NoticeBibliographique getNoticeFromIsbn(String isbn) throws IncorrectIsbnException;

	ArrayList<NoticeBibliographique> noticesDuMemeAuteurQue(NoticeBibliographique ref);

	ArrayList<NoticeBibliographique> autresEditions(NoticeBibliographique ref);

}