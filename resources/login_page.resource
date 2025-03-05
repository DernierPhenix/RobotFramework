*** Settings ***
Library  Browser

*** Keywords ***
I am on the login form
    Get Element States    id=form-sign-in    contains    visible

I try to connect with the email address "${email}"
    Fill Text    id=input-email    ${email}
    Click    id=lookup-btn

I have an error for a wrong email address
    Get Element States    css=.textfield-error-message    contains  visible