<!-- a javascript file to be embedded in an html5 file -->
<script src="Resources/js/snap.svg-min.js"></script>
<script>
jQuery.noConflict(); // restore $ to its original state
jQuery(function($) { // use $ as a local alias for a jQuery object
    // this function is invoked after the document is loaded
    // all jQuery code goes here

    function handle_ie() {
      if (0) {
        // DOESN'T WORK!!
        // preferred method
        // remove the train animation element with id 'train-anim',
        // reset the starting x value to the appropriate non-animated position
        // so the train is centered in the header
        var IExmin = 70.7972972972972;
        var iexmin = IExmin.toString();

        var paper = Snap("#svg");
        var t = paper.select("#train");
        var bbox = t.getBBox();
        // need distance from xleft to iexmin
        var dist = IExmin - bbox.x;
        var sdist = dist.toString();
        var tstr = "translate(" + sdist + ",0)";
        t.transform(tstr);
      }
      else {
        // this does work in IE
        var paper = Snap("#svg");
        var a = paper.select("#train");
        a.remove();
        var t1 = paper.text(20, 20, "You are probably using Microsoft's Internet Explorer (IE) browser (version 11 or less).");
        var t2 = paper.text(20, 37, "It cannot show you the animated steam loco and tender in this scene.");
        var t3 = paper.text(20, 54, "Get the Chrome browser (see the link in 'Animations' below) to see the train and its movements!");
      }
    }

    // use Modernizr to test for SVG MIL (animation)
    if (!Modernizr.smil) {
      alert("WARNING:  Your browser does NOT support SVG animation.  Get Google Chrome!");
      handle_ie();
    }

    // use Modernizr to test for SVG path clipping
    if (!Modernizr.svgclippaths) {
      handle_ie();
      alert("WARNING:  Your browser does NOT support SVG clipping paths.  Get Google Chrome!");
    }

    function show_browser() {
      var s = "Your browser: ";
      var rversion = /version/i;
      jQuery.each(jQuery.browser, function(key, val) {
        // key will have either 'version' or the browser type
        //var t = i;
        if (!rversion.test(key)) {
          if (val) {
            s = s + key;
          }
        }
      });
      alert(s);
    }

    if (0) {
      handle_ie();
    }
});
</script>

