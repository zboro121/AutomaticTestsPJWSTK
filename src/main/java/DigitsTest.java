package main.java;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;
  
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class DigitsTest {

    private static final String filePath = "digits.json";

    public static void main(String[] args) throws IOException, ParseException {

        try (FileReader reader = new FileReader(ClassLoader.getSystemResource(filePath).getFile())) {
            // read the json file


            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject) jsonParser.parse(reader);

            // get details 
            int digit = (int) jsonObject.get("digit");
            System.out.println("The digit is: " + digit);

            // get a number from the JSON object
            long id = (long) jsonObject.get("id");
            System.out.println("The id is: " + id);
            }

        } 
   }


