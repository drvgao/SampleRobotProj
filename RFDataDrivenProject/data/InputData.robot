
*** Variables ***
# Configuration
${BROWSER} =  chrome
${ENVIRONMENT} =  qa
&{BASE_URL}  demo=https://interactive.igtgames.com  dev=http://refdevinteractive1.dev.igt.com  qa=https://refqainteractive1.dev.igt.com
${IGAMING_URL} =  content/interactive/igaming/en.html
${ILOTTERY_URL} =  en-us/home.html

# Input Data
&{REGISTERED_USER}  User=intQA25  Password=Welcome1  ExpectedErrorMessage=You haven't signed up yet. Try a different email address or
&{UNREGISTERED_USER}  User=robotframeworktutorial  Password=TestPassword!  ExpectedErrorMessage=You haven't signed up yet. Try a different email address or
&{INVALID_PASSWORD_USER}  Email=bryan@bryanlamb.com  Password=TestPassword!  ExpectedErrorMessage=Please double check your password. It should be 6 or more characters with no spaces. If you don't remember it, you can
&{BLANK_CREDENTIALS_USER}  Email=#BLANK  Password=#BLANK  ExpectedErrorMessage=Please enter your email address and password.
&{GOOGLE_SEARCH_TERM}  Name=savitri  Content=biography  Criteria1=entirelife
${CSV_FILE_PATH} =  C:\\Users\\rdurgam\\git\\SampleRobotProj\\RFDataDrivenProject\\data\\users.csv
${JSON_FILE_PATH} =  C:\\Users\\rdurgam\\git\\SampleRobotProj\\RFDataDrivenProject\\data\\sample.json
