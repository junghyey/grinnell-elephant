# Sprint 3 Journal

## A summary of non-user-facing progress for this milestone.
For this milestone, the main non-user-facing progress involved setting up structure for storing task checklist using JSON files. Most of our work focused on UI development and feature implmentation, which are very noticeable to users,so backend improvements were minimal. In the next sprint, we plan to incorporate more functionality of the app.

## Requirements Document
- In this sprint, we changed our requirements by adding user stories that were missing from Milestone 1, with a user story for a light user (guest) and a team user. For the team user, we made edits to Candice's persona to extend it as that team user. To view the changes, please navigate to this [commit comparison page](https://github.com/junghyey/grinnell-elephant/compare/1351792..45bff51?diff=unified&w=).


## Manual testing in place of automated testing for part

- We did manual testing for checking buttons and make sure page show for manual of the app. The reason is because of the limitations in automated testing support for SwiftUI navigation behavior. We used NavigationLink for buttons to navigate to different pages but somehow the XCUITest is inconsistent with view states that is controlled internally. Since it is just simple sets of button testing, we though it would be more time-efficient for manually testing.

- Moreover, we tried to run CI with our testing for macOS, but macOS builds require code signing, even for development builds. The error says "No signing certificate "Mac Development"", which basically means we do not have certificate. We have not purchased yet, but we ran the testing through xcode IDE in each of us laptop.
- Since CI does not work, we added manual testing in the manual testing protocol document for the supplment.
