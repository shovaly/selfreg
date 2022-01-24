public without sharing class SelfRegisterApexController {
    public SelfRegisterApexController() {

    }

    @AuraEnabled
public static String sendEmail(string email) {
//Create Account
//Create Contact

//Define User - targetUser

String profileId = '00e4L000001ISkfQAG';
String roleEnum = null;
String accountId = ''; 


User u = new User();
u.Username = 'selfRegNewUswer@hawk.com';
u.Email = email;
u.FirstName = 'hawk';
u.LastName = 'user';
u.CommunityNickname = 'hawkuser';
u.ProfileId = profileId;
u.Alias = 'hku';


return System.UserManagement.initSelfRegistration(Auth.VerificationMethod.EMAIL, u);
}

@AuraEnabled
public static String verifyCodeforReg(String code, String verificationId) {
Auth.VerificationResult result = System.UserManagement.verifySelfRegistration(Auth.VerificationMethod.EMAIL, verificationId, code, 'commStartURL');
if (result.success == true) {
aura.redirect(result.redirect);
return result.message;
}
else{
return result.message;
}
}


@AuraEnabled
public static String passlesslogin(String userid) {
return System.UserManagement.initPasswordlessLogin(userid, Auth.VerificationMethod.EMAIL);
}

@AuraEnabled
public static String verifyCodeforLogin(String userid, String code, String verificationId) {
Auth.VerificationResult result = System.UserManagement.verifyPasswordlessLogin(userid, Auth.VerificationMethod.EMAIL, verificationId, code, '/comm1/s');
if (result.success == true) {
aura.redirect(result.redirect);
return result.message;
}
else{
return result.message;
}
}

}

