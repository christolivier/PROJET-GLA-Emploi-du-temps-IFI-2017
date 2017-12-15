package lectureExel;

import java.io. FileInputStream;
import java.io. IOException;
import java.io. InputStream;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql. Statement;
import java.util.ArrayList;
import java.util.Iterator;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import com.devops.db.DatabaseConnection;



public class ExcelReading {
	@SuppressWarnings("rawtypes")
	public static void main(String[] args) {
		// Déclaration des variables
		
		ArrayList<String> values= new ArrayList<String>();
		/*Connection connection;
		Statement statement;*/
		//recuperation
		try{
			InputStream input = new FileInputStream("emploi.xls");
			POIFSFileSystem fs = new POIFSFileSystem(input);
			HSSFWorkbook wb = new HSSFWorkbook(fs);
			HSSFSheet sheet = wb.getSheetAt(0);
			Iterator rows = sheet.rowIterator();
			
			while(rows.hasNext()){
				values.clear();
				HSSFRow row= (HSSFRow) rows.next();
				Iterator cells = row.cellIterator();
				
				while(cells.hasNext()){
					HSSFCell cell= (HSSFCell) cells.next();
					if(HSSFCell.CELL_TYPE_NUMERIC == cell.getCellType())
						values.add(Integer.toString((int) cell.getNumericCellValue()));
					else if(HSSFCell.CELL_TYPE_STRING == cell.getCellType())
						values.add(cell.getStringCellValue());
					
				}//mettre cath de while cell iici
				
				//connection 
				
				Connection connection = DatabaseConnection.getConnection();
				try {
					PreparedStatement ps =connection.prepareStatement(" INSERT INTO EMPLOI (COURSE_NAME, START_DATE, END_DATE,COLOR,UID) VALUES(?,?,?,?,?)");
					
					ps.setString(1, values.get(0));
					ps.setString(2, values.get(1));
					ps.setString(3, values.get(2));
					ps.setString(4, values.get(3));
					ps.setString(5, values.get(4));
					ps.executeUpdate();
					
					System.out.println("enregistrement effectuer");
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			} //mettre cath de while row iici
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
