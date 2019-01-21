ACC.mirit = {

		 _autoload: [ "bindUpdateButton","bindDialog","bindUpdateRitButton","bindAddressData"],
		    
		    bindAddressData: function(){
		    	$("#u5070_input").val(ACC.addressCountry);
		    	$("#u5056_input").val(ACC.addressDep);
		    	$("#u5056_input").trigger( "change" );
		    	$("#u5058_input option").filter(function() {
		    	    return this.text == ACC.addressMun; 
		    	}).attr('selected', true);
		    	$("#u5058_input").trigger( "change" );
		    	$("#u5073_input").val(ACC.addressPC);
		    },

    bindUpdateButton: function () {
    $(document).on("click", "#certifNombButton", function (e) {
	        e.preventDefault();
	        
	        var data={};
	        
	        data.name1 = $("#primNom").val();
	        data.name2 = $("#segNom").val();
	        data.apellido1 = $("#primNom").val();
	        data.apellido2 = $("#segApe").val();
	        
	        $.ajax({
	            url: ACC.certifNombURL,
	            data: data,
	            type: "POST",
	            async: false,
	            success: function (data) {
	            	$( "#dialog" ).dialog( "open" );
	            	$("#textCertNom").html("No se puede certificar el nombre");
	            },
	            error: function () {
	            	$("#textCertNom").html("No se puede certificar el nombre");
	            }
	        });
	    });
    },
    
    
    bindUpdateRitButton: function () {
        $(document).on("click", "#updateRitButton", function (e) {
    	        e.preventDefault();
    	        
    	        var updateName = false;
    	        
    	        var hasErrors = false;
    	        
    	        //TODO: Call service to validet wheter we update name or no. Here we asume we can update it
    	        
    	        updateName = true;
    	        
    	        
    	        var newEmail = $("#newEmail").val().trim();
    	        var confirmNewEmail = $("#confirmNewEmail").val().trim();
    	        
    	        if(newEmail != "" || confirmNewEmail != "")
    	        {
    	        	//validate new email format
    	        	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    	        	if(!re.test(String(newEmail).toLowerCase()))
    	        	{
    	        		$("#newEmailErrors").removeClass("hidden");
        	        	$("#newEmail").parents(".form-group ").addClass("has-error");
        	        	$("#newEmailErrors").html("Indique una dirección de correo electrónico");
        	        	hasErrors = true;
    	        	}else
    	        	{
    	        		$("#newEmailErrors").addClass("hidden");
        	        	$("#newEmail").parents(".form-group ").removeClass("has-error");
        	        	hasErrors = false;
        	        	
        	        	 var emailData = {};
             	        emailData.mail = confirmNewEmail;
             	        
             	        $.ajax({
             	            url: ACC.validaEmailURL,
             	            data: emailData,
             	            type: "POST",
             	           async: false,
             	            success: function (data) {
             	            	if(data.isValidEmail == true)
         	            		{
             	            		$("#textCertNom").html("Nuevo Usuario Valido");
         	            		}else
             	            	{
         	            			$("#newEmailErrors").removeClass("hidden");
         	            			$("#newEmailErrors").html("Correo no disponible, por favor indique otro.");
         	        	        	$("#newEmail").parents(".form-group ").addClass("has-error");
         	        	        	hasErrors = true;
             	            	}
             	            },
             	            error: function () {
             	            	$("#textCertNom").html("Hubo un error al tratar de actualizar su RIT, por favor intentalo mas tarde.");
             	            }
             	        });
    	        	}
    	        	
    	        	if( newEmail != confirmNewEmail)
    	        	{
    	        		$("#confirmNewEmailErrors").removeClass("hidden");
        	        	$("#confirmNewEmail").parents(".form-group ").addClass("has-error");
        	        	$("#confirmNewEmailErrors").html("Correo y confirmación de correo no coinciden.");
        	        	hasErrors = true;
    	        	}else
    	        	{
    	        		{
        	        		$("#confirmNewEmailErrors").addClass("hidden");
            	        	$("#confirmNewEmail").parents(".form-group ").removeClass("has-error");
            	        	hasErrors = false;
        	        	}
    	        	}
    	        	
        	       
    	        	
    	       	}else
	       		{
    	       		$("#newEmailErrors").addClass("hidden");
    	        	$("#newEmail").parents(".form-group ").removeClass("has-error");
    	        	hasErrors = false;
    	       		
    	       		$("#confirmNewEmailErrors").addClass("hidden");
    	        	$("#confirmNewEmail").parents(".form-group ").removeClass("has-error");
    	        	hasErrors = false;
	       		}
    	        
    	        var currentPassword = $("#currentPassword").val().trim();
    	        var newPassword = $("#newPassword").val().trim();
    	        var confirmNewPassword = $("#confirmNewPassword").val().trim();
    	        
    	        if(currentPassword != "" || newPassword != "" || confirmNewPassword !=  "" )
	        	{
    	        	if(currentPassword == "")
	        		{
    	        		$("#currentPasswordErrors").removeClass("hidden");
        	        	$("#currentPassword").parents(".form-group ").addClass("has-error");
        	        	$("#currentPasswordErrors").html("Por favor introduce tu contraseña actual");
        	        	hasErrors = true;
	        		}else
        			{
	        			$("#currentPasswordErrors").addClass("hidden");
        	        	$("#currentPassword").parents(".form-group ").removeClass("has-error");
        	        	hasErrors = false;
        			}
        		
    	        	
    	        	if(/[a-z]/.test(newPassword) == false)
    	        	{
        	        	$("#newPassword").parents(".form-group ").addClass("has-error");
        	        	hasErrors = true;
    	        	}else
    	        	{
    	        		$("#newPassword").parents(".form-group ").removeClass("has-error");
        	        	hasErrors = false;
    	        	}
    	        	
    	        	if(/[A-Z]/.test(newPassword) == false)
    	        	{
        	        	$("#newPassword").parents(".form-group ").addClass("has-error");
        	        	hasErrors = true;
    	        	}else
    	        	{
    	        		$("#newPassword").parents(".form-group ").removeClass("has-error");
        	        	hasErrors = false;
    	        	}
    	        	
    	        	if(/[0-9]/.test(newPassword) == false)
    	        	{
        	        	$("#newPassword").parents(".form-group ").addClass("has-error");
        	        	hasErrors = true;
    	        	}else
    	        	{
    	        		$("#newPassword").parents(".form-group ").removeClass("has-error");
        	        	hasErrors = false;
    	        	}
    	        	
    	        	if(newPassword.length <8 || newPassword.length>16)
    	        	{
        	        	$("#newPassword").parents(".form-group ").addClass("has-error");
        	        	hasErrors = true;
    	        	}else
    	        	{
    	        		$("#newPassword").parents(".form-group ").removeClass("has-error");
        	        	hasErrors = false;
    	        	}
    	        
    	        	if(newPassword != confirmNewPassword)
    	        	{
    	        		$("#confirmNewPasswordErrors").removeClass("hidden");
        	        	$("#confirmNewPassword").parents(".form-group ").addClass("has-error");
        	        	hasError = true;
    	        	}
    	        	
    	        	
    	        	var passwordData = {};
        	        passwordData.passoword = currentPassword;
    	        	
        	        $.ajax({
    	            url: ACC.validaCurrentPasswrodURL,
    	            data: passwordData,
    	            type: "POST",
    	            async: false,
    	            success: function (data) {
    	            	$( "#dialog" ).dialog( "open" );
    	            	if(data.isValidPassword == true)
	            		{
    	            		$("#currentPasswordErrors").addClass("hidden");
            	        	$("#currentPassword").parents(".form-group ").removeClass("has-error");
            	        	hasErrors = false;
	            		}else
    	            	{
	            			$("#currentPasswordErrors").removeClass("hidden");
	        	        	$("#currentPassword").parents(".form-group ").addClass("has-error");
	        	        	$("#currentPasswordErrors").html("Contraseña actual incorrecta.");
	        	        	hasErrors = true;
    	            	}
    	            },
    	            error: function () {
    	            	$("#textCertNom").html("Hubo un error al tratar de actualizar su RIT, por favor intentalo mas tarde.");
    	            }
    	        });
        		
	        } 	
    	        
    	        
    	        
    	        
    	       
    	        if(hasErrors)
    	        {
    	        	$( "#dialog" ).dialog( "open" );
    	        	$("#textCertNom").html("Por favor corrije los errores señalados");
    	        }else
    	        {
    	        	 var updateRitData = {};
    	    	        updateRitData.email = $("#currentMail").val().trim();
    	    	        updateRitData.newEmailAddress =  $("#newEmail").val().trim();
    	    	        updateRitData.confirmNewEmailAddress =  $("#confirmNewEmail").val().trim();
    	    	        updateRitData.primNom =  $("#primNom").val().trim();
    	    	        updateRitData.segNom =  $("#segNom").val().trim();
    	    	        updateRitData.primApe =  $("#primApe").val().trim();
    	    	        updateRitData.segApe =  $("#segApe").val().trim();
    	    	        updateRitData.usoBuzon = $("#buzon").is(":checked");
    	    	        updateRitData.autoUsoInfo = $("#usoInformacion").is(":checked")
    	    	        
    	    	        
    	    	        $.ajax({
    	    	            url: ACC.updateRitURL,
    	    	            data: updateRitData,
    	    	            type: "POST",
    	    	            success: function (data) {
    	    	            	$( "#dialog" ).dialog( "open" );
    	    	            	if(data.ritUpdated == true)
    		            		{
    	    	            		$("#textCertNom").html("Tu RIT ha sido actualizado");
    		            		}else
    	    	            	{
    		            			$("#textCertNom").html("Hubo un error al tratar de actualizar tu RIT, por favor intentalo mas tarde.");
    	    	            	}
    	    	            },
    	    	            error: function () {
    	    	            	$("#textCertNom").html("Hubo un error al tratar de actualizar su RIT, por favor intentalo mas tarde.");
    	    	            }
    	    	        });
    	        }
    	        
    	        
    	    });
        },
    
    bindDialog: function(){
    	
    	$( "#dialog" ).dialog({ 
    		autoOpen: false, 
    		buttons: {
    			Ok: function() {
    				$( this ).dialog( "close" );
    			}
    	    } 
    	});
    	
    }

    

};