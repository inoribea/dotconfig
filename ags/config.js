"use strict";
// Import
import Gdk from 'gi://Gdk';
import GLib from 'gi://GLib';
//import App from 'resource:///com/github/Aylur/ags/app.js'
//import * as Utils from 'resource:///com/github/Aylur/ags/utils.js'
// Stuff
import userOptions from './modules/.configuration/user_options.js';
import { firstRunWelcome, startBatteryWarningService } from './services/messages.js';
import { startAutoDarkModeService } from './services/darkmode.js';
// Widgets
import { Bar, BarCornerTopleft, BarCornerTopright } from './modules/bar/main.js';
import Cheatsheet from './modules/cheatsheet/main.js';
// import DesktopBackground from './modules/desktopbackground/main.js';
import Dock from './modules/dock/main.js';
import Corner from './modules/screencorners/main.js';
import Crosshair from './modules/crosshair/main.js';
import Indicator from './modules/indicators/main.js';
import Osk from './modules/onscreenkeyboard/main.js';
import Overview from './modules/overview/main.js';
import Session from './modules/session/main.js';
import SideLeft from './modules/sideleft/main.js';
import SideRight from './modules/sideright/main.js';
import { COMPILED_STYLE_DIR } from './init.js';

const range = (length, start = 1) => Array.from({ length }, (_, i) => i + start);
function forMonitors(widget) {
    const n = Gdk.Display.get_default()?.get_n_monitors() || 1;
    return range(n, 0).map(widget).flat(1);
}
function forMonitorsAsync(widget) {
    const n = Gdk.Display.get_default()?.get_n_monitors() || 1;
    return range(n, 0).forEach((n) => widget(n).catch(print))
}

import { Utils, App, Notifications } from './modules/utils/imports.js';
//import { Bar } from './modules/topbar.js';
import { MainMenu } from './modules/menus/MainMenu.js';
import { VolumeOSD } from './modules/on-screen/volume.js';
import MyNotifications from './modules/notifications/OSDNotifications.js';
import { PrayerTimesMenu } from './modules/menus/PrayerTimesMenu.js';
import ColorWidget from './modules/widgets/desktop/ColorsWidget.js';
import win20Widget from './modules/widgets/desktop/Win20Widget.js';
import materialWidget from './modules/widgets/desktop/MaterialYouOne.js';
import unicatWidget from './modules/widgets/desktop/UnicatWidget.js';
import blackHoleWidget from './modules/widgets/desktop/BlackHole.js';
import goldenWidget from './modules/widgets/desktop/Golden.js';
import harmonyWidget from './modules/widgets/desktop/Harmony.js';
import newCatWidget from './modules/widgets/desktop/NewCat.js';
import deerWidget from './modules/widgets/desktop/DeerWidget.js';
import circlesMusicWidget from './modules/widgets/desktop/Circles.js';
import whiteFlowerWidget from './modules/widgets/desktop/WhiteFlower.js';
import { CalendarMenu } from './modules/menus/CalendarMenu.js';
import settings from './modules/settings.js';
import { applauncher } from './modules/menus/ApplicationsMenu.js';

import {
    TopLeftCorner,
    TopRightCorner,
} from './modules/components/ScreenCorners.js';
import { languageLayoutOSD } from './modules/on-screen/KeyboardLayout.js';


// Start stuff
handleStyles(true);
startAutoDarkModeService().catch(print);
firstRunWelcome().catch(print);
startBatteryWarningService().catch(print)

const Windows = () => [
    // forMonitors(DesktopBackground),
    forMonitors(Crosshair),
    Overview(),
    forMonitors(Indicator),
    forMonitors(Cheatsheet),
    SideLeft(),
    SideRight(),
    forMonitors(Osk),
    forMonitors(Session),
    ...(userOptions.dock.enabled ? [forMonitors(Dock)] : []),
    ...(userOptions.appearance.fakeScreenRounding !== 0 ? [
        forMonitors((id) => Corner(id, 'top left', true)),
        forMonitors((id) => Corner(id, 'top right', true)),
        forMonitors((id) => Corner(id, 'bottom left', true)),
        forMonitors((id) => Corner(id, 'bottom right', true)),
    ] : []),
    ...(userOptions.appearance.barRoundCorners ? [
        forMonitors(BarCornerTopleft),
        forMonitors(BarCornerTopright),
    ] : []),
];

const CLOSE_ANIM_TIME = 210; // Longer than actual anim time to make sure widgets animate fully
const closeWindowDelays = {}; // For animations
for (let i = 0; i < (Gdk.Display.get_default()?.get_n_monitors() || 1); i++) {
    closeWindowDelays[`osk${i}`] = CLOSE_ANIM_TIME;
}

//App.config({
//    css: `${COMPILED_STYLE_DIR}/style.css`,
//    stackTraceOnError: true,
//    closeWindowDelay: closeWindowDelays,
//    windows: Windows().flat(1),
//});

// Stuff that don't need to be toggled. And they're async so ugh...
forMonitorsAsync(Bar);
// Bar().catch(print); // Use this to debug the bar. Single monitor only.

