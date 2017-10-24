//package com.codingschool.repairWeb;
//
//import com.codingschool.repairWeb.Domain.Repair;
//import com.codingschool.repairWeb.Domain.User;
//import com.codingschool.repairWeb.Domain.Vehicle;
//import com.codingschool.repairWeb.Repository.RepairRepository;
//import com.codingschool.repairWeb.Repository.UserRepository;
//import com.codingschool.repairWeb.Repository.VehicleRepository;
//import com.github.javafaker.Faker;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//
//import java.time.LocalDateTime;
//import java.util.concurrent.ThreadLocalRandom;
//
//@Component
//public class DataBasePopulator{
//
//    @Autowired
//    private UserRepository userRepository;
//
//    @Autowired
//    private VehicleRepository vehicleRepository;
//
//    @Autowired
//    private RepairRepository repairRepository;
//
//    @Autowired
//    public void DataLoader(UserRepository userRepository) {
//        this.userRepository = userRepository;
//        produceUsers(69);
//    }
//
//    public void produceUsers(int numberOfUsers) {
//
//        Faker faker = new Faker();
//        for (int i = 0; i < numberOfUsers; i++) {
//            String mail = faker.internet().emailAddress();
//            String afm = createAfm();
//            String firstName = faker.name().firstName();
//            String lastName = faker.name().lastName();
//            String streetAddress = faker.address().streetAddress();
//            User user = new User(mail, "asdf", afm, firstName, lastName, streetAddress, false);
//            userRepository.save(user);
//            produceVehicles(user);
//
//        }
//    }
//
//    //an array with car brands
//    String[] brands = {"Alfa Romeo","Abarth","Aston Martin","Audi","Arrinera","Acura","Aixam","AC","Bentley","BMW","Buick","Bugatti","Chevrolet","Cadillac","Chrysler","Corvette","Citroen","Dacia","Daihatsu","Dodge","Daewoo","Elfin","Fiat","Ferrari","GMC","Ford","Ginetta","Hyundai","Hummer","Honda","Holden","Isuzu","Infiniti","Land Rover","Lotus","Jeep","Lamborghini","Lexus","Lada","Lancia","Suzuki","Maserati","Jaguar","Mazda","Maybach","Mercedes Benz","Morgan Motor","Mini","Mitsubishi","Mustang","Nissan","Opel","Peugeot","Porsche","Rolls Royce","Perodua","Renault","Proton","Piaggio","Rover","Scania","Seat","Saab","Spyker","Skoda","Smart","Subaru","SsangYong","Suzuki","Shelby SuperCars","Tesla","Toyota","Tatra","Tramontana","UAZ","Volkswagen","Vandenbrink","Volvo","Venturi","Viper","ZAZ","ZiL"
//    };
//
//
//    //Produce random vehicles 1-5 for every user
//    private void produceVehicles(User user) {
//        int min = 1;
//        int max = 4;
//        int randomNum = ThreadLocalRandom.current().nextInt(min, max + 1);
//        for (int i = 0; i < randomNum; i++) {
//            Faker faker = new Faker();
//            String plate = createPlate();
//            int minBrand = 0;
//            int maxBrand = brands.length-1;
//            int brandChoice = ThreadLocalRandom.current().nextInt(minBrand, maxBrand + 1);
//            String color = faker.color().name();
//            Vehicle vehicle = new Vehicle(plate, brands[brandChoice], color, user);
//            vehicleRepository.save(vehicle);
//            produceRepairs(vehicle);
//        }
//    }
//
//    public void produceRepairs(Vehicle vehicle){
//        int min = 1;
//        int max = 4;
//        int randomNum = ThreadLocalRandom.current().nextInt(min, max + 1);
//        for (int i = 0; i < randomNum; i++) {
//            String status = "On The Way";
//            LocalDateTime dateTime = LocalDateTime.now();
//            LocalDateTime dateTimeToAdd;
//            int minHours = 10;
//            int maxHours = 8760;
//            int randomHours = ThreadLocalRandom.current().nextInt(minHours, maxHours + 1);
//            long hours = randomHours;
//            if(ThreadLocalRandom.current().nextBoolean()){
//                status = "Pending";
//                dateTimeToAdd = dateTime.plusHours(hours);
//            }
//            else{
//                dateTimeToAdd = dateTime.minusHours(hours);
//                status = "Completed";
//            }
//
//            Repair repair = new Repair(vehicle, dateTimeToAdd, status, 100);
//            repairRepository.save(repair);
//
//        }
//    }
//
//    public static String createPlate() {
//        //RandomThreeLetters
//        int min = 65;
//        int max = 90;
//        String result="";
//        for(int i=0;i<3;i++){
//            int a = ThreadLocalRandom.current().nextInt(min, max + 1);
//            result += Character.toString((char) a);
//        }
//        result+="-";
//        min = 1000;
//        max = 9999;
//        result += ThreadLocalRandom.current().nextInt(min, max + 1);
//        return result;
//    }
//
//    //Produce a random 9 digit number
//    //Future work: Produce a valid last check digit
//    private static String createAfm() {
//        String AFM = "";
//        int min = 100;
//        int max = 999;
//        int randomNum;
//        for (int i = 0; i < 3; i++) {
//            randomNum = ThreadLocalRandom.current().nextInt(min, max + 1);
//            AFM += randomNum;
//        }
//        return AFM;
//    }
//
//
//}
