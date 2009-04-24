function navigateTo(dest) {
	var supported_views = gadgets.views.getSupportedViews();
	gadgets.views.requestNavigateTo(supported_views[dest]);
  };


  /**
   * When called, this method asks the container to switch to the home
   */
function gotoHome() {
	navigateTo("home");
  };
  
  
  /**
   * When called, this method asks the container to switch to the canvas
   */
  function gotoCanvas() {
    navigateTo("canvas");
  };
