/*
 * This file includes a series of definitions so that the Cojurescript code
 * can access the Phoenix API.
 */

//Bindings for Phoenix
var Phoenix = function() {}

Phoenix.reload = function() {}
Phoenix.bind = function(key, modifiers, callback) {}
Phoenix.on = function(event, callback) {}
Phoenix.log = function(message) {}
Phoenix.notify = function(message) {}

//Bindings for Application handling.
var App = function() {}

App.launch = function(appName) {}
App.focused = function() {}
App.all = function() {}

App.processIdentifier = function() {}
App.bundleIdentifier = function() {}
App.name = function() {}
App.isActive = function() {}
App.isHidden = function() {}
App.isTerminated = function() {}
App.mainWindow = function() {}
App.windows = function() {}
App.activate = function() {}
App.focus = function() {}
App.show = function() {}
App.hide = function() {}
App.terminate = function() {}

//Windows bindings
var Window = function() {}

Window.all = function() {}
Window.focused = function() {}
Window.recent = function() {}
Window.others = function() {}

Window.frame = function() {}
Window.topLeft = function() {}
Window.size = function() {}
//@param frame is type Rect.
Window.setFrame = function(frame) {}
//@param point is of type Point
Window.setTopLeft = function(point) {}
//@param size is of type Size
Window.setSize = function(size) {}
Window.maximize = function() {}
Window.minimize = function() {}
Window.unminimize = function() {}
Window.screen = function() {}
Window.app = function() {}
Window.isNormal = function() {}
Window.focus = function() {}
Window.focusClosestNeighbor = function() {}
Window.neighbors = function() {}
Window.title = function() {}
Window.isMinimized = function() {}


//Screen bindings
var Screen = function() {}
Screen.frameInRectangle = function() {}
Screen.flippedVisibleFrame = function() {}
Screen.main = function() {}
Screen.next = function() {}
Screen.previous = function() {}
Screen.all = function() {}
Screen.windows = function() {}

//Model bindings
var Model = function() {}

Model.origin = function() {}
Model.duration = function() {}
Model.message = function() {}

Model.frame = function() {}
Model.show = function() {}
Model.close = function() {}

//Key bindings
var Key = function() {}

Key.on = function(key, modifiers, callback) {}
