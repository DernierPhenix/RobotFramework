*** Settings ***
Library  Browser
Resource  ../resources/homepage_page.resource
Resource  ../resources/search_page.resource
Resource    ../resources/login_page.resource
Resource    ../resources/product_page.resource
Resource    ../resources/cart_page.resource
Resource    ../resources/services_voyages.resource
Variables   ../data/product.py

Test Setup  Given I am on the homepage   #Permet de lancer le navigateur et d'aller sur la page d'accueil pour chaque cas de test

*** Variables ***
${URL}  https://www.decathlon.fr
${search}  ballon
${email}  ""

*** Test Cases ***
Test 1
    No Operation 
Test 2
    When I search for "ballon"
    Then the search results contain the word "ballon"
    # Fill Text    xpath=//input[@type='search']    ballon
    # Click    xpath=//button[@type='submit']
    # # Press Keys    xpath=//button[@type='submit']    ENTER
    # Get Element States   id=search-suggestions-banner    contains    visible
    # Get Text    css=.searchText  contains  ${search}

Test 3 
    When I search for "basket"
    Then the search results contain the word "basket"

Test 4
    When I go to the login form
    Then I am on the login form
    When I try to connect with the email address "toto@yopmail;com"
    Then I have an error for a wrong email address
    
Test 5
    When I search for "${search}"
    Then the search results contain the word "${search}"
    And the selected sorting method is "Meilleures ventes"
    When I sort the list by "Note des clients"
    Then the selected sorting method is "Note des clients"
    When I sort the list by "Prix décroissants"
    Then the selected sorting method is "Prix décroissants"
    When I sort the list by "Remise décroissante"
    Then the selected sorting method is "Remise décroissante"

Test 6
    When I search for "${search}"
    Then the search results contain the word "${search}"
    When I open the first product page
    Then I am on the product page for "BALLON DE GYM RÉSISTANT - Swissball - 65 CM - Argent"
    When I add the product to the cart
    Then the product is added to the cart successfully
    When I go to the cart
    Then the cart is displayed
    And there are "1" product(s) in the cart
    And the product "BALLON DE GYM RÉSISTANT - Swissball - 65 CM - Argent" is in the cart

Test 7
    When I search for "8549582"
    And I add the product to the cart
    Then the product is added to the cart successfully
    When I close the cart popin
    When I search for "8336573"
    And I add the product to the cart
    And the product is added to the cart successfully
    Then I close the cart popin
    # Then I go to the cart

Test 8 
    When I search for "${search}"
    Then the search results contain the word "${search}"
    And the sellers are displayed correctly

Test 9
    When I search for "${search}"
    Then the search results contain the word "${search}"
    And There are "74" sellers listed

Test 10
    When I search for ${product}
    Then I am on the product page for ${product.name}

Test 11
    When I click on the button "Services & voyages"
    Then In the menu, I click on the link "Revendre mon materiel"
    And the popup appears
    Then I verify the content of the popup
    # And I close the popup
