(function(window, undefined) {
  'use strict';

})(window);

function insertComment(e) {
  if (window.event.keyCode == 13) {
		e.preventDefault();
      commentForm.submit();
  }
}