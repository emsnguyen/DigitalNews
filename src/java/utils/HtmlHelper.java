package utils;

/**
 *
 * @author lenovo
 */
public class HtmlHelper {
    public static String generateHyperlink(String searchQuery, int value, String displayText) {
        String link = "<a href=\"search?searchQuery=" + searchQuery + "&page=" + value
                + "\">" + displayText + "</a>";
        return link;
    }
    public static String paging(String searchQuery, int totalPage, int pageGap, int currentPage) {
        String result = "";
        if (currentPage > pageGap) {
            result += generateHyperlink(searchQuery, 1, "First");
        }
        for (int i = Math.max(currentPage-pageGap, 1); i < currentPage; i++) {
            result += generateHyperlink(searchQuery, i, "" + i);
        }
        result += "<a class=\"currentPage\">"+currentPage+"</a>";
        for (int i = currentPage+1; i < Math.min(currentPage+pageGap, totalPage); i++) {
            result += generateHyperlink(searchQuery, i, "" + i);
        }
        if (currentPage + pageGap < totalPage) {
            result += generateHyperlink(searchQuery, totalPage, "Last");
        }
        return result;
    }
    
}
