*** Settings ***
Library  Browser

*** Keywords ***
I am on the homepage
    Open Browser  https://www.decathlon.fr
    Get Element States    id=didomi-notice-agree-button  contains  visible
    Click    id=didomi-notice-agree-button
    Get Element States    id=didomi-notice-agree-button  contains  detached

I go to the login form
    Click    css=.tool--account a