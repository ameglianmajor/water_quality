var ready;
ready = function () {
  $('.js-contaminant-table').addClass('tablesorter');
  $('.js-contaminant-table').tablesorter({
    sortList: [[3,1]],
  }); 
  // dialog for sign up
  var dialogParamObj = {
    autoOpen: false,
    width: 350,
    modal: true,
    resizable: false,
    draggable: false,
    closeOnEscape: true,
    open: function(event, ui) { $(".ui-dialog-titlebar-close", ui.dialog || ui).hide() }
  };

  var signUpDialog = $('.js-sign-up-dialog').dialog(dialogParamObj);
  var loginDialog = $('.js-login-dialog').dialog(dialogParamObj);
  var passwordResetDialog = $('.js-password-reset-dialog').dialog(dialogParamObj);
  var resetNoticeDialog = $('.js-reset-notice-dialog').dialog(dialogParamObj);
  var newPasswordDialog = $('.js-new-password-dialog').dialog(dialogParamObj);


  $('.not-a-real-class').click(function(event) {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    newPasswordDialog.dialog('open');
  });


  $('.js-password-reset-submit').click(function(event) {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    passwordResetDialog.dialog('close');
    resetNoticeDialog.dialog('open');
    $('.ui-dialog-titlebar-close').css({'visibility': 'visible', 'color': '#454545', 'font-size': '80%'})
                                  .text('X') 
                                  .click(function(){$('.ui-dialog-titlebar-close').css('visibility', 'hidden')});
  });

  // event hunder for click on log-in button
  $('.js-login-button, .js-has-account').click(function(event) {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    signUpDialog.dialog('close');
    loginDialog.dialog('open');
  });

  $('.js-join-button, .js-no-account').click(function(event) {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    loginDialog.dialog('close');
    signUpDialog.dialog('open');
  });

  $('.js-password-reset').click(function(event) {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    loginDialog.dialog('close');
    passwordResetDialog.dialog('open');
  });

  $('.js-sign-up-submit').click(function(event) {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var nameFirst = $('.js-user-name-first').val();
    var nameLast = $('.js-user-name-last').val();
    var password = $('.js-user-password').val();
    var passwordVerify = $('.js-user-password-verify').val();
    var email = $('.js-user-email').val();
    if (!nameFirst) {
      $('.js-sign-up-error').text('Please type in your name.');
    }
    else if (!nameLast) {
      $('.js-sign-up-error').text('Please type in your last name.');
    }
    else if (!validateEmail(email)) {
      $('.js-sign-up-error').text('Invalid email.');
    }
    else if (password !== passwordVerify) {
      $('.js-sign-up-error').text('Passwords don\'t match.');
    }
    else if (password.length < 6) {
      $('.js-sign-up-error').text('Password must be 6 or more charachters long.');
    }
    else {
      $('.js-sign-up-error').text('');
      signUpDialog.dialog('close'); 
      $("#new_user").submit();
    }
  });


  $('.js-new-password-submit').click(function(event) {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var password = $('.js-new-password-first').val();
    var passwordVerify = $('.js-new-password-second').val();
    if (password !== passwordVerify) {
      $('.js-new-password-error').text('Passwords don\'t match.');
    }
    else if (password.length < 6) {
      $('.js-new-password-error').text('Password must be 6 or more charachters long.');
    }
    else {
      $('.js-new-password-error').text('');
      newPasswordDialog.dialog('close');
    }
  });

  $('.login-submit').click(function(event) {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    $("#login-form").submit();
  });
  
}

function validateEmail(email) { 
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

$(document).ready(ready);
$(document).on('page:load', ready);
