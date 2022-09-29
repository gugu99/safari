(function(window, undefined) {
  'use strict';

})(window);

function insertSearch(e) {
  if (window.event.keyCode == 13) {
		e.preventDefault();
      searchForm.submit();
  }
}

function insertComment(e) {
  if (window.event.keyCode == 13) {
		e.preventDefault();
      commentForm.submit();
  }
}