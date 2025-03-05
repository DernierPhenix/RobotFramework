*** Settings ***
Library  Browser
Resource  ../resources/homepage_page.resource
Resource  ../resources/search_page.resource
Resource    ../resources/login_page.resource

*** Keywords ***
I am on the product page for "${name}"
    Get Text    css=h1    contains    ${name}

I add the product to the cart
    Click    css=.conversion-zone__purchase-cta

the product is added to the cart successfully
    #Get Element States    css=#popin-cross-sell [slot='title']    contains    visible
    Wait For Elements State    css=#popin-cross-sell [slot='title']    visible    15s

I go to the cart
    Click  css=[data-href='/checkout/cart']

I close the cart popin
    Click  css=.ecomm-sidepanel__close-btn

