/*=========================================================================================
	File Name: wizard-steps.js
	Description: wizard steps page specific js
	----------------------------------------------------------------------------------------
	Item Name: Stack - Responsive Admin Theme
	Author: PIXINVENT
	Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/

// Wizard tabs with numbers setup
$(".number-tab-steps").steps({
	headerTag: "h6",
	bodyTag: "fieldset",
	transitionEffect: "fade",
	titleTemplate: '<span class="step">#index#</span> #title#',
	labels: {
		finish: 'submit'
	},

	onFinished: function(event, currentIndex) {
		if ($('#workMemberName').val() == '') {
			alert('워크스페이스 멤버이름을 입력하세요');
			$('#workMemberName').focus();
			return;
		} else {
			$.ajax({
				url: '/member/workspaceCode',
				type: 'POST',
				success: function(json) {
					console.log(json);
					if (json != $('#workspaceCode').val()) {
						alert('잘못된코드입니다.');
						$('#memberEmail').focus();
						return;
					} else {
						alert('가입이완료되었습니다 승인이 될때까지 기다려주세요.');
						$('#addWorkspaceForm').submit();
					}
				}
			});
		}
	}
});

// Wizard tabs with icons setup
$(".icons-tab-steps").steps({
	headerTag: "h6",
	bodyTag: "fieldset",
	transitionEffect: "fade",
	titleTemplate: '<span class="step">#index#</span> #title#',
	labels: {
		finish: 'Submit'
	},
	onFinished: function(event, currentIndex) {
		alert("Form submitted.");
	}
});

// Vertical tabs form wizard setup
$(".vertical-tab-steps").steps({
	headerTag: "h6",
	bodyTag: "fieldset",
	transitionEffect: "fade",
	stepsOrientation: "vertical",
	titleTemplate: '<span class="step">#index#</span> #title#',
	labels: {
		finish: 'Submit'
	},
	onFinished: function(event, currentIndex) {
		alert("Form submitted.");
	}
});

// Validate steps wizard

// Show form
var form = $(".steps-validation").show();

$(".steps-validation").steps({
	headerTag: "h6",
	bodyTag: "fieldset",
	transitionEffect: "fade",
	titleTemplate: '<span class="step">#index#</span> #title#',
	labels: {
		finish: 'Submit'
	},
	onStepChanging: function(event, currentIndex, newIndex) {
		// Allways allow previous action even if the current form is not valid!
		if (currentIndex > newIndex) {
			return true;
		}
		// Forbid next action on "Warning" step if the user is to young
		if (newIndex === 3 && Number($("#age-2").val()) < 18) {
			return false;
		}
		// Needed in some cases if the user went back (clean up)
		if (currentIndex < newIndex) {
			// To remove error styles
			form.find(".body:eq(" + newIndex + ") label.error").remove();
			form.find(".body:eq(" + newIndex + ") .error").removeClass("error");
		}
		form.validate().settings.ignore = ":disabled,:hidden";
		return form.valid();
	},
	onFinishing: function(event, currentIndex) {
		form.validate().settings.ignore = ":disabled";
		return form.valid();
	},
	onFinished: function(event, currentIndex) {
		alert("Submitted!");
	}
});

// Initialize validation
$(".steps-validation").validate({
	ignore: 'input[type=hidden]', // ignore hidden fields
	errorClass: 'danger',
	successClass: 'success',
	highlight: function(element, errorClass) {
		$(element).removeClass(errorClass);
	},
	unhighlight: function(element, errorClass) {
		$(element).removeClass(errorClass);
	},
	errorPlacement: function(error, element) {
		error.insertAfter(element);
	},
	rules: {
		email: {
			email: true
		}
	}
});


// Initialize plugins
// ------------------------------

// Pick a date
$('.pickadate').pickadate();

// Date & Time Range
$('.datetime').daterangepicker({
	timePicker: true,
	timePickerIncrement: 30,
	locale: {
		format: 'MM/DD/YYYY h:mm A'
	}
});