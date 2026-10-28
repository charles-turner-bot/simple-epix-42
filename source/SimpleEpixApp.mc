import Toybox.Application;
import Toybox.WatchUi;

class SimpleEpixApp extends Application.AppBase {
    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() {
        return [ new SimpleEpixView() ];
    }
}
