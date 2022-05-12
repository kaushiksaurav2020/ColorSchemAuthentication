# ColorSchemeAuthentication (Description)-
The proposed system using new Authentication technique consists of 3 phases: registration phase, login phase and verification phase. During registration, user enters his password in first method or rates the colors in the second method. During login phase, the user has to enter the password based on the interface displayed on the screen. The system verifies the password entered by comparing with content of the password generated during registration.
Advantage:
1.	The Session passwords are passwords that are used only once
2.	The users input different passwords.
3.	The session passwords provide better security against dictionary and brute force attacks as password changes for every session.
MODULES-
1.	Pair-based Authentication scheme
2.	Hybrid Textual Authentication Scheme
3.	Registration 

Pair-based Authentication scheme Module:

During registration user submits his password. Maximum length of the password is 8 and it can be called as secret pass. The secret pass should contain even number of characters. Session passwords are generated based on this secret pass. During the login phase, when the user enters his username an interface consisting of a grid is displayed. The grid is of size 6 x 6 and it consists of alphabets and numbers. These are randomly placed on the grid and the interface changes every time. User has to enter the password depending upon the secret pass. User has to consider his secret pass in terms of pairs. The session password consists of alphabets and digits. The first letter in the pair is used to select the row and the second letter is used to select the column. The intersection letter is part of the session password. This is repeated for all pairs of secret pass.

Hybrid Textual Authentication Scheme Module:

The User should rate colors from 1 to 8 and he can remember it as “RLYOBGIP”. Same rating can be given to different colors. During the login phase, when the user enters his username an interface is displayed based on the colors selected by the user. The login interface consists of grid of size 8×8. This grid contains digits 1-8 placed randomly in grid cells. The interface also contains strips of colors. The color grid consists of 4 pairs of colors. Depending on the ratings given to colors, we get the session password.
Registration Module:

This module is used to registered user Details in three parts. They are Name authentication password, Color Priority Password and Other details. First, user is going to enter the normal password but it using capital A-Z letters and 0-9 Numbers. Second the user to put the color priority in six colors. 


