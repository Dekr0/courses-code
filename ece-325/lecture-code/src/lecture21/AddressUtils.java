package lecture21;

/**
 * Local classes are rarely used. It can make the code more readable if it is
 * used in
 */
public class AddressUtils {

    public static boolean arePhoneNumbersValid(String ph1, String ph2) {
        class PhoneNumber {
            private String ph;

            PhoneNumber(String ph) {
                this.ph = ph;
            }

            public boolean isValid() {
                String regex = "[^0-9]";
                String formattedNr = ph.replaceAll(regex, "");

                return formattedNr.length() == 10;
            }
        }

        PhoneNumber phoneNumber1 = new PhoneNumber(ph1);
        PhoneNumber phoneNumber2 = new PhoneNumber(ph2);

        return phoneNumber1.isValid() && phoneNumber2.isValid();
    }
}
