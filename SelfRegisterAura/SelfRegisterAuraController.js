({
    handleSendEmail: function (component, event, helpler) {
       
    var emailValue = component.get("v.emailInput");
    var action = component.get("c.sendEmail");
    action.setParams({ email : emailValue });

    action.setCallback(this, function(response) {
        var state = response.getState();
        if (state === "SUCCESS") {
            component.set("v.isFirstStage", false);
            component.set("v.verificationId", response.getReturnValue());            
        }
        else if (state === "INCOMPLETE") {
        }
        else if (state === "ERROR") {
            var errors = response.getError();
            if (errors) {
                if (errors[0] && errors[0].message) {
                    console.log("Error message: " + 
                             errors[0].message);
                }
            } else {
                console.log("Unknown error");
            }
        }
    });
    $A.enqueueAction(action);
    },
    handleRegVerify: function (component, event, helpler) {
    var codeInput = component.get("v.codeInput");
    var verificationId = component.get("v.verificationId");
    var action = component.get("c.verifyCodeforReg");
    action.setParams({ code : codeInput,verificationId : verificationId });
    action.setCallback(this, function(response) {
        debugger;
        var state = response.getState();
        if (state === "SUCCESS") {     
        }
        else if (state === "INCOMPLETE") {
        }
        else if (state === "ERROR") {
            var errors = response.getError();
            if (errors) {
                if (errors[0] && errors[0].message) {
                    console.log("Error message: " + 
                             errors[0].message);
                }
            } else {
                console.log("Unknown error");
            }
        }
    });
    $A.enqueueAction(action);
    },
    })