Output assets/ezysh-demo.gif

Set FontSize 16
Set Width 1050
Set Height 580
Set Padding 18
Set Theme "Catppuccin Mocha"
Set WindowBar Colorful
Set TypingSpeed 60ms

Hide
Type "export PS1='❯ '"
Enter
Type "clear"
Enter
Show

Sleep 600ms

# 1. First scenario: Search by intent "kill port"
Type "ezy"
Sleep 400ms
Enter

Sleep 800ms
Type "kill port"
Sleep 2s
Enter

Sleep 800ms
Type "3000"
Sleep 800ms
Enter

Sleep 2.5s

# Clear for next scenario
Type "clear"
Enter
Sleep 600ms

# 2. Second scenario: Search by intent "docker clean"
Type "ezy"
Sleep 400ms
Enter

Sleep 800ms
Type "docker clean"
Sleep 2.5s
Enter

Sleep 2.5s
