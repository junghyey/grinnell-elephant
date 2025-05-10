# Sprint 3 Journal

## A summary of non-user-facing progress for this milestone.
For this milestone, the main non-user-facing progress involved setting up the structure for storing the task checklist using JSON files. Most of our work focused on UI development and feature implementation, which are very noticeable to users, so backend improvements were minimal. In the next sprint, we plan to incorporate more functionality of the app.

## Requirements Document
- In this sprint, we changed our requirements by adding user stories that were missing from Milestone 1, with a user story for a light user (guest) and a team user. For the team user, we made edits to Candice's persona to extend it to that team user. To view the changes, please navigate to this [commit comparison page](https://github.com/junghyey/grinnell-elephant/compare/1351792...45bff51).


## Manual testing in place of automated testing for part

- We did manual testing to check buttons and make sure the page shows for manual of the app. The reason is due to the limitations in automated testing support for SwiftUI navigation behavior. We used NavigationLink for buttons to navigate to different pages, but somehow the XCUITest is inconsistent with view states that are controlled internally. Since it is just a simple set of button testing, we thought it would be more time-efficient for manual testing.

- Moreover, we tried to run CI with our testing for macOS, but macOS builds require code signing, even for development builds. The error says "No signing certificate, Mac Development", which means we do not have a certificate. We have not purchased yet, but we ran the testing through Xcode IDE on each of our laptops.
- Since CI does not work, we added manual testing in the manual testing protocol document for the supplement. (check: manual_testing_protocol.md)

## Tag containing demo code
The tag named **sprint-3-initial-release** contains the demo code for the initial release
