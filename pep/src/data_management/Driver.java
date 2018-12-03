package data_management;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Collections;
import java.util.Set;
import java.util.stream.Collectors;

import javax.xml.bind.DatatypeConverter;

public class Driver {

	private static final byte salt[]=DatatypeConverter.parseHexBinary("DE358A58A8769EB4A370A7EE9EC54CDE76CE64C2");
	
	// Method createTeam
	public boolean createTeam(ArrayList<String> teilnehmermail, String projektpfad, String lehrstuhl,
			String projekttitel, String organisationseinheit) throws SQLException {

		String kennnummer = generateKennnummer(lehrstuhl);
		String sql = "Insert Into team (teamname_ID,teamnummer,projekttitel,projektpfad,organisationseinheitname_ID) Values('"
				+ kennnummer + "','" + kennnummer.substring(7, 9) + "','" + projekttitel + "','" + projektpfad + "','"
				+ organisationseinheit + "')";
		executeUpdate(sql);

		for (String t : teilnehmermail) {
			sql = "Insert Into teammap (accountname_ID,teamname_ID) Values('" + t + "','" + kennnummer + "')";
			executeUpdate(sql);
		}
		return true;
	}

	// Method setTeamLeader
	public boolean setTeamLeader(String mail) throws SQLException {
		String sql = "UPDATE account SET rollename_ID='Teamleiter' Where accountname_ID Like '" + mail + "'";
		return executeUpdate(sql);
	}

	// Method setPhaseDates
	public boolean setPhaseDates(String phasenName, String startDate, String endDate) throws SQLException {
		String sql = "UPDATE phase SET startDatum='" + startDate + "', endDatum='" + endDate + "' "
				+ "Where phasenname_ID Like '" + phasenName + "'";
		return executeUpdate(sql);
	}

	public boolean insertHashMap(String table, HashMap<String, String> hashMap) throws SQLException {
		Set<String> keys = hashMap.keySet();
		StringBuilder sql = new StringBuilder("INSERT INTO ");

		sql.append(table);
		sql.append(" (");
		sql.append(keys.stream().collect(Collectors.joining(",")));
		sql.append(") VALUES (");
		sql.append(String.join(",", Collections.nCopies(hashMap.size(), "?")));
		sql.append(");");

		return executeUpdate(sql.toString(), hashMap, keys);
	}

	// Method getMasterPassword

	public String getMasterPassword(String role) throws SQLException {
		if (role.equals("Juror"))
			return returnArrayList("Select masterpasswordJuror From projectconfiguration").get(0)
					.get("masterpasswordJuror");
		else if (role.equals("Tutor"))
			return returnArrayList("Select masterpasswordTutor From projectconfiguration").get(0)
					.get("masterpasswordTutor");
		else
			return null;
	}

	// Method logout
	public boolean logout(int sessionID) throws SQLException {
		String sql = "Delete From sessionmap Where sessionmapname_ID=" + sessionID;
		return executeUpdate(sql);
	}

	// Method login
	public String login(String mail, String password) throws SQLException {
		String sql = "Select activated From account Where accountname_ID Like '" + mail + "' And password Like '"
				+ password + "'";
		ArrayList<HashMap<String, String>> a = returnArrayList(sql);
		if (a.isEmpty()/* ||!Boolean.parseBoolean(a.get(0).get("activated")) */)
			return null;
		sql = "Insert Into sessionmap (accountname_ID) Values('" + mail + "')";
		executeUpdate(sql);
		sql = "Select sessionmapname_ID From sessionmap Where accountname_ID Like '" + mail + "'";
		return formatSessionID(returnArrayList(sql).get(0).get("sessionmapname_ID"));

	}

	// Method getRights
	public HashMap<String, String> getRights(int sessionID) throws SQLException {
		StringBuilder sql = new StringBuilder();
		sql.append("Select rolle.accessMarks,rolle.manageProject,rolle.seeAllGroupInformation,rolle.setupGroup ");
		sql.append("From sessionmap Inner Join account on sessionmap.accountname_ID = account.accountname_ID ");
		sql.append("Inner Join rolle on account.rollename_ID=rolle.rollename_ID Where sessionmapname_ID=");
		sql.append(sessionID);
		return returnArrayList(sql.toString()).get(0);
	}

	// Method getSubCat
	public ArrayList<HashMap<String, String>> getSubCat(String table, String iDA,  String iDV, String column) throws SQLException {
        String sql = "Select " + column + " From " + table + " Where " + iDA + " Like '" + iDV + "'";
        return returnArrayList(sql);
    }

	public ArrayList<HashMap<String, String>> getSubCat(String table, String iD) throws SQLException {
		String sql = "Select * From " + table + " Where " + table + "name_ID Like '" + iD + "'";
		return returnArrayList(sql);
	}

	public ArrayList<HashMap<String, String>> getSubCat(String table) throws SQLException {
		String sql = "Select * From " + table + " Where 1";
		return returnArrayList(sql);
	}

	// Method getCurrentPhase
	public String getCurrentPhase() throws SQLException {
		LocalDate localDate = LocalDate.now();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT phasename_ID FROM phase Where startDatum <= '");
		sql.append(localDate);
		sql.append("'And endDatum > '");
		sql.append(localDate);
		sql.append("'");
		ArrayList<HashMap<String, String>> list = returnArrayList(sql.toString());
		return list.isEmpty() ? null : list.get(0).get("phasename_ID");
	}

	////////////// Hilfsmethoden//////////////////////////////////
	// Method getConnection
	public Connection getConnection() throws SQLException {
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/pep_2018_sose_1?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"pep", "XO47mVNIr1qNrECj");
		return conn;
	}
	
	// Method returnArrayList
	public ArrayList<HashMap<String, String>> returnArrayList(String sql) throws SQLException {
		try (Connection c = getConnection();
				Statement statement = c.createStatement();
				ResultSet result = statement.executeQuery(sql)) {

			ResultSetMetaData resultSetMetaData = result.getMetaData();
			int r = resultSetMetaData.getColumnCount();
			ArrayList<HashMap<String, String>> arrayList = new ArrayList<>();
			HashMap<String, String> hashMap;
			while (result.next()) {
				hashMap = new HashMap<>();
				for (int i = 1; i <= r; i++)
					hashMap.put(resultSetMetaData.getColumnLabel(i), result.getString(i));

				arrayList.add(hashMap);
			}
			return arrayList;
		}
	}

	// Method formatSessionID
	public String formatSessionID(String sessionID) {
		while (sessionID.length() != 8)
			sessionID = "0" + sessionID;
		return sessionID;
	}

	// Method executeUpdate
	public boolean executeUpdate(String sql) throws SQLException {
		try (Connection c = getConnection(); Statement statement = c.createStatement();) {
			statement.executeUpdate(sql);
			return true;
		}
	}

	public boolean executeUpdate(String sql, HashMap <String, String> hashMap,Set<String> keys) throws SQLException {
		try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
			int i = 1;
			for (String key : keys)
				stmt.setString(i++, hashMap.get(key));
				
			stmt.execute();
			return true;
		}
	}

	// Method generateKennnummer
	public String generateKennnummer(String lehrstuhlName) throws SQLException {
		// Get Lehrstuhl
		String sql = "Select lehrstuhlnummer From lehrstuhl Where lehrstuhlname_ID like '" + lehrstuhlName + "'";
		String lehrstuhl = returnArrayList(sql).get(0).get("lehrstuhlnummer");
		//
		// getTeam
		sql = "Select count(*) As anzahl From team Where 1";
		String teamnummer = returnArrayList(sql).get(0).get("anzahl");
		int i = Integer.parseInt(teamnummer);
		while ((i + "").equals(teamnummer))
			i++;
		teamnummer = i + "";
		//
		return printKennnummer(lehrstuhl, teamnummer);
	}

	// Method printKennnummer
	public String printKennnummer(String lehrstuhl, String teamnummer) {
		LocalDate localDate = LocalDate.now();
		int l, t;
		l = Integer.parseInt(lehrstuhl);
		t = Integer.parseInt(teamnummer);
		return "L:" + (l < 10 ? "0" + l : l) + "|T:" + (t < 10 ? "0" + t : t) + "|Y:" + localDate.getYear();
	}
	
	public static String getHash(byte inputBytes[]) throws NoSuchAlgorithmException {
        MessageDigest messageDigest = MessageDigest.getInstance("SHA-512");
        messageDigest.reset();
        messageDigest.update(inputBytes);
        messageDigest.update(salt);
        byte digestedBytes[] = messageDigest.digest();
        return DatatypeConverter.printHexBinary(digestedBytes);
    }
}
