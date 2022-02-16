#  This is a work in progress

Most views are complete.  I just need to implement communication between the tableview and other views. This application is meant to be used with a film enlarger.  It allows one to create a test strip where each strip is a portion of an f/stop different.  Traditionally each strip is a constant number of seconds more than the previous one.  This doesn't make a lot of sense when we think about how a camera works.  A camera allows you to pick a shutter speed such as 1/30 or 1/60, but it doesn't allow you to do 1/61.  This is because a camera uses f/stops to determine the available shutter speeds.

** iOS concepts used in this app **

* SwiftUI

** TODO **

* Update the tableview when the user updates one of the four variables
* Either don't use action sheets or make the color scheme darker for use in the darkroom
