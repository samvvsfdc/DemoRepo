public class accConCreation25June {
    
    @AuraEnabled
    public static void accConCreation(string accName, string conLastName){
        
        Account a =new Account();
        a.Name=accName;
        Insert a;
        
        Contact c=new Contact();
        c.lastName=conLastName;
        c.AccountId=a.Id;
        Insert c;
    }
    
      @AuraEnabled
    public static void accCreation(string accName, string phoneNumber){
        
        Account a =new Account();
        a.Name=accName;
        a.Phone=phoneNumber;
        Insert a;
    }

@AuraEnabled(cacheable=true)
    Public static contact conDataWire(){
        contact c=[select LastName,AccountId,Email from Contact Limit 1];
        return c;
    }

   @AuraEnabled
public static Id caseCreation(String origin, String status) {
    try {
        Case c = new Case();
        c.Origin = origin;
        c.Status = status;
        insert c;
        return c.Id;  // return the new Case Id
    } catch (Exception e) {
        // Throw a handled exception with a message that can be caught in LWC
        throw new AuraHandledException('Error creating Case: ' + e.getMessage());
    }
}

@AuraEnabled(cacheable=true)
    Public static List<Account> accDataWire(){
        List<Account> c=[select Name,Id,Active__c from Account];
        return c;
    }



     @AuraEnabled
    public static void sendCarTaxEmail(String name, String email, Decimal carPrice, Decimal tax) {
        String subject = 'Your Car Tax Details';
        String body = 'Hello ' + name + ',\n\n'
            + 'Thank you for using our Car Tax Calculator.\n\n'
            + 'Car Price: ₹' + carPrice + '\n'
            + 'Calculated Tax (18%): ₹' + tax + '\n\n'
            + 'Regards,\nCarTax Team';

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] { email });
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }

     @AuraEnabled
    public static Map<String, Decimal> sendCarTaxEmailApex(String name, String email, String carSelected) {
        Decimal carPrice = 0;
        Decimal tax = 0;
        Decimal total = 0;

        // Set car price based on selected car
        if (carSelected == 'BMW') {
            carPrice = 2000000;
        } else if (carSelected == 'AUDI') {
            carPrice = 7800000;
        } else if (carSelected == 'Hector') {
            carPrice = 808000;
        }

        // Calculate tax (18%) and total
        tax = carPrice * 0.18;
        total = carPrice + tax;

        // Compose email
        String body = 'Hello ' + name + ',\n\n' +
            'Thank you for using our Car Tax Calculator.\n\n' +
            'Selected Car: ' + carSelected + '\n' +
            'Car Price: ₹' + carPrice + '\n' +
            'Calculated Tax (18%): ₹' + tax + '\n' +
            'Total Price: ₹' + total + '\n\n' +
            'Regards,\nCarTax Team';

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] { email });
        mail.setSubject('Your Car Tax Details');
        mail.setPlainTextBody(body);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

        // Return values to LWC
        Map<String, Decimal> result = new Map<String, Decimal>{
            'carPrice' => carPrice,
            'tax' => tax,
            'total' => total
        };
        return result;
    }


@AuraEnabled(cacheable=true)
    Public static List<Contact> conData(Id acc){
        List<Contact> c=[select LastName,AccountId,Email from Contact where AccountId=:acc];
        return c;
    }

    @AuraEnabled(cacheable=true)
    Public static List<opportunity> oppData(Id acc){
        List<opportunity>  op=[select Name,AccountId,StageName from opportunity where AccountId=:acc];
        return op;
    }
    //comment
    
      
}