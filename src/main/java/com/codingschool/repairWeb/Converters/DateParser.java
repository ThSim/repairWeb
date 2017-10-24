package com.codingschool.repairWeb.Converters;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateParser {

    public static LocalDateTime dateFromPicker(String date){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy h:mm a");
        LocalDateTime result = LocalDateTime.parse(date, formatter);
        return result;
    }

}
