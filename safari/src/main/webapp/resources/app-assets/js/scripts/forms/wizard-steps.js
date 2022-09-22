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
		finish: '제출'
	},

	onFinished: function(event, currentIndex) {
		var reg_email = RegExp(/^[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\w+\.)+\w+$/);

		var grpl = $('input[name=workMemberEmail]').length;
		//배열 생성
		var grparr = new Array(grpl);
		//배열에 값 주입

		if ($('#workName').val() == '') {
			alert('워크스페이스이름을 입력하세요');
			$('#workName').focus();
			return;
		} else if ($('#workMemberName').val() == '') {
			alert('워크스페이스멤버이름을 입력하세요');
			$('#workMemberName').focus();
			return;
		} else if ($('#workMemberEmail').val() != '') {
			for (var i = 0; i < grpl; i++) {
				console.log(i);
				console.log(grpl);
				if (!reg_email.test($("input[name='workMemberEmail']").eq(i).val())) {
					alert('이메일형식을 확인해주세요.\nexample@example.com');
					console.log($("input[name='workMemberEmail']").eq(i).val());
					return;
				} else if ($('#workMemberEmail').val() != '') {
					$.ajax({
						async: false,
						url: '/safari/existEmail',
						type: 'POST',
						data: { workMemberEmail: $("input[name='workMemberEmail']").eq(i).val() },
						success: function(json) {
							if (json != '존재하는이메일') {
								alert(i + 1 + '번쨰칸은 가입하지 않는 아이디입니다');
								return;
							} else if (json == '존재하는이메일' && i == grpl - 1) {
								alert('제출완료');
								$('#addWorkspaceForm').submit();
							}
						}
					});
				}
			}
		} else {
			alert('제출완료');
			$('#addWorkspaceForm').submit();
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