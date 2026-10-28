import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.WatchUi;

// Fixed 390x390 layout, recreated from Charles's Fenix 7 photograph.
// No configuration, sensors, communications, background service, or seconds.
class SimpleEpixView extends WatchUi.WatchFace {
    var _sleeping = false;
    var _days as Array<String> = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];

    function initialize() {
        WatchFace.initialize();
    }

    function onUpdate(dc) {
        var clock = System.getClockTime();
        var calendar = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        // Fixed 24-hour format, no leading zero on the hour, matching the
        // minimalist reference. Time zone follows the watch automatically.
        var text = clock.hour.format("%d") + ":" + clock.min.format("%02d");
        var date = _days[calendar.day_of_week - 1] + " " + calendar.day.format("%d");
        var font = Graphics.FONT_NUMBER_THAI_HOT;
        var center = 195;
        // Minute-wise pixel shift in AMOLED always-on mode prevents static
        // pixels; the face stays below Garmin's illuminated-pixel limit.
        var offsetX = 0;
        var offsetY = 0;
        if (_sleeping) {
            offsetX = (clock.min % 3) - 1;
            offsetY = ((clock.min / 3).toNumber() % 3) - 1;
        }
        var right = center + dc.getTextWidthInPixels(text, font) / 2;
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(_sleeping ? 0x777777 : Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(right + offsetX, 123 + offsetY, Graphics.FONT_XTINY, date, Graphics.TEXT_JUSTIFY_RIGHT);
        dc.setPenWidth(2);
        dc.drawLine(right - 120 + offsetX, 153 + offsetY, right + offsetX, 153 + offsetY);
        dc.drawText(center + offsetX, 161 + offsetY, font, text, Graphics.TEXT_JUSTIFY_CENTER);
    }

    function onEnterSleep() {
        _sleeping = true;
        WatchUi.requestUpdate();
    }

    function onExitSleep() {
        _sleeping = false;
        WatchUi.requestUpdate();
    }
}
