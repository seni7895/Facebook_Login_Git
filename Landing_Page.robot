*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.facebook.com/
${Username}  sethu7895@gmail.com
${Password}  Sethu@123

*** Test Cases ***
Open_Page
    Open the Landing page
    [Documentation]  checking whether the fb login page open or not
    [Tags]  login Page
To verify whether the login accepts the empty value or not
    Accepts the empty value or not
    [Documentation]  checking whether it accepts the empty or not
    [Tags]  login Page
To verify whether it is login through valid pwd or not
    Valid Credential
    [Documentation]  checking whether it accepts the valid credentials or not
    [Tags]  login Page
To verify the if-else
    ${count}=  Get Element Count  //span[contains(@dir,'auto')]
    Run Keyword if  ${count} <= 100  keyword 1
    ...  Else If  ${count} > 100  Keyword 2

*** Keywords ***
Open the Landing Page
    Open Browser  ${URL}  chrome
    Maximize Browser Window
    Wait Until Element is Visible  //input[contains(@name,'email')]  10000
    ##Close Browser
Accepts the empty value or not
    Input Text  //input[contains(@name,'email')]  ${EMPTY}
    Input Text  //input[contains(@name,'pass')]  ${EMPTY}
    Click Button  //button[contains(@name,'login')]
    sleep  5s
    Element should be Visible  //div[contains(@class,'_9ay7')]
Valid Credential
    Input Text  //input[contains(@name,'email')]  ${Username}
    Input Text  //input[contains(@name,'pass')]  ${Password}
    Click Button  //button[contains(@name,'login')]
    Wait Until Element is Visible  //div[contains(@aria-label,"Messenger")]  10
    Element Should be Visible  //div[contains(@aria-label,"Messenger")]
    sleep  2s
    #Close Browser
Keyword 1
    Log to Console  "Successfully executed keyword 1"
    Close Browser
Keyword 2
    Log to Console  "Successfully executed keyword 2"
    Close Browser


