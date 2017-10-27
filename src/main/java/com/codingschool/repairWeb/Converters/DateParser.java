package com.codingschool.repairWeb.Converters;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import static java.util.Locale.US;

public class DateParser {

    public static LocalDateTime dateFromPicker(String date){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy h:mm a", Locale.US);
        LocalDateTime result = LocalDateTime.parse(date, formatter);
        return result;
    }

}
