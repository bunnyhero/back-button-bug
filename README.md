Description
-----------

On iOS 15+, modifying a view controller's `navigationItem` will append redundant `UIGestureRecognizer`s to the Back button. When the number of gesture recognizers gets into the thousands, tapping on the Back button can lock up the main thread for many seconds, which can result in the application being killed by the watchdog timer.

Steps to reproduce
------------------

1. Run this project on an iOS 15 device or simulator.
2. Tap the "Go" button to advance to the test view controller.
3. Tap the "Change Title 100 Times" button and the "Change Right Bar Item 100 Times" button many times.
4. (Optional) Tap the "Print Gesture Recognizers to Console" to see the myriad duplicate gesture recognizers in Xcode debug out.
4. Tap the "Back" button

### Expected results

- Gesture recognizer count remaining stable. Back button responsive. (This is what happens if you run the project on iOS 14.)

### Actual results
- Gesture recognizer count climbs continuously on each change. If the total number is high enough (thousands), the Back button responds very slowly.

Notes
-----

- Reproduced on iOS 15.1 as well as iOS 15.2 beta.
