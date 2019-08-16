package addrToken;
import java.util.ArrayList;
import java.util.List;

public class addrDivide {
	public List<String> addrTokensGet(String addr) {

		String[] addrToken = null;
		List<String> addrTokens = new ArrayList<String>();

		if ((addrToken = addr.split("\\s+")) != null) {	
			addrTokens.add(addrToken[2]);
			addrTokens.add(addrToken[3]);
		}
		
		return addrTokens;
	}
	
}
