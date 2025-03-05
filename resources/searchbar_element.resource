*** Settings ***
Library  Browser

*** Keywords ***
I search for "${search}"
    Fill Text    xpath=//input[@type='search']    ${search}
    Click    css=#search-bar button[type='submit']