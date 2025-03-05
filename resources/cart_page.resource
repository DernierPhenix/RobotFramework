*** Settings ***
Library  Browser

*** Keywords ***
the cart is displayed
    Get Text    css=h1    contains    Panier

there are "${count}" product(s) in the cart
    Get Element Count    css=.cart-line    ==    ${count}

the product "${name}" is in the cart
    Get Text    css=.cart-line a span    contains    ${name}