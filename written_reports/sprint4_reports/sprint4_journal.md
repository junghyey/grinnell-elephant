##  External Documentation and Stakeholder Meetings

### Meeting 1
#### Who you met with
##### Name, occupation, and other relevant information about the stakeholder
- Hannah Kim, student biology major & statistics concentration. Not a long time mac user.
- Reviewed paper prototype
##### Date and time of the stakeholder meeting
- 04/22/2025 02:30pm - 3:00pm
##### Description of the test session and feedback
##### What was their behavior of interacting with the documentation?
1. Navigation to the app: When she opened the app, I told her to navigate to the manual/help page.
2. Navigation to the settings page: In the home screen, told her to navigate to the settings page
3. Changing themes in settings page: Prompted to change the themes
4. Purchasing Avatar in the collectible shop: Asked to navigate to collectible shop and try purchasing the avatar.
5. Read through the manual: Asked her to read all pages the manual till the end using the buttons
6. Adding to Widget: Asked her to add the elephant app to the widget bar just by manual explanation.
##### Did they succeed or get stuck?
- She succeeded in all 1-5, but since it was not clear what the widget bar is and there were no photos on how to add (and she is new to mac), so she could not success the task 6. 
##### What feedback did they provide about documentation?
- She said a picture or video of how to add widget to the widget bar would be helpful. The tester did not know what even widget bar is.
##### What questions did you ask, and what were the stakeholder's answers?
- I asked the if there is any buttons or other parts confusing
  - She said except for widget description everything was straightforward.
  - Additionally, she told us the time changing scroll in the settings page is not intuitivie. It does not show what time she is currently setting to if she scrolls.
- Is design suitable for readability and accesibility?
  - She said themes needed to be changed because only the background color changes and the font colors dont change. This makes letters hard to read
- Any other feedback
  - The homebutton crashes in the settings page.
  - The back button crashes in collectible shop for MacApp scheme.   


### Meeting 2



### Meeting 3

## Documentation Lab

**Note: Since we are small group (4 people only), we collaborated on code before. Therefore, our subgroups already shared knowledge on what we were working on and we used the same langauge. However, there was still room for imporvement in terms of documentation**


### Subgroup 1: Medhashree & Hyeyun

1. Teammate A: Medhashree, Teammate B: Hyeyun

ContentView, entire file

Teammate A (Medhashree) needs to adjust the header to include the main author(s) of the file, a description of the file, dependencies, and resources used when developing. Furthermore, the documentation in the code should include a small description of the scope of the code within "{...}

Teammate A made sure to include a description at the end of larger blocks of code within "{...}" that showed the responsibilities of the buttons. The inclusion of "TODO" comments were helpful as it is easy to find and has a note of what needs to be done.

Commit hash:
Github link:

2. Teammate A: Hyeyun, Teammate B: Medhashree

ManualView.swift, entire file

Teammat A (Mae) suggested: Adding description of the file, more documnation on the purpose of the function, documentation on what is happening (a line is sufficent) before each code block for each UI,
                          Add Todo for aesthetics part so that others can see what I have to work on/ and it is easily navigatble for others.
                          Spacing consistnet -- devleoper guideline on formaning (needed to be added).
                          You can put other referneces in each function on top and write where each used.

Helpful: Resources/References on the top & before each function (wehre we used it), comment after each "}" helpful to navigate the scope, but it would be more helpful to add what vstack belongs to (is it for button or not?) since
we have multiple vstacks.


Commit hash:
Github link:

### Subgroup 2: Candice & Gabby

1. Teammate A: Gabby, Teammate B: Candice

2. Reviewed SetingsView.swift file, 
- code snippet: ~lines 10-114~ within ~SettingsView~
- For sections where Gabby didn't give very descriptive or detailed documentation, she added more helpful comments that explained thoroughly how each part of the SettingsView was implemented. She included more description about where certain functions defined in the lower lines of the snippet (88-112) are coming from and how this compacting of functions at the end of SettingsView allowed for greater readability within the main SettingsView view.

Helpful: There were larger comments before long snippets of code that explained the functionality of the following lines, but for some lines where there wasn't enough description for a longer code line, we made changes to this by making sure those lines were descriptive enough.

Commit hash:
Github link:

3. Teammate A: Candice, Teammate B: Gabby

4. Review Utils.swift file, entire file

- Candice worked on re-usable functions and stucts, including Default Colors for theme changes as well as a default ElephantButton that can be used across various files. We discussed adding more documentation to the file for more descriptive explanations of each function and which files it mostly interacts with, like SettingsView.

Helpful: There are initial comment descriptions for each utility, describing what that utility performs as well as helpful function definitions describing what use that function/struct performs.

Commit hash:
Github link:
   
