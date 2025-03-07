*** Settings ***
Library           Browser

*** Variables ***
${URL}            https://www.decathlon.fr

*** Keywords ***
I click on the button "Services & voyages"
    Click    xpath=//button[@data-cs-override-id="CategoryItem_7"]

In the menu, I click on the link "Revendre mon materiel"
    Click    xpath=//a[@href="/second-life/buy-back#/funnel/product/category?opeco=opeco:MENUSERVICES_SECONDEVIE-reprise&type=opeco"]

the popup appears
    Get Text    xpath=//div[contains(text(), 'Comment ça marche?')]

I verify the content of the popup
    ${Identifier ton produit}=    Get Text    //div[normalize-space()='Identifier ton produit']
    Should Be Equal As Strings    ${Identifier ton produit}    Identifier ton produit   

    ${Faire un diagnostique}=    Get Text    //div[normalize-space()='Faire un diagnostique']
    Should Be Equal As Strings    ${Faire un diagnostique}    Faire un diagnostique    

    ${Selectionner un magasin}=    Get Text    //div[normalize-space()='Selectionner un magasin']
    Should Be Equal As Strings    ${Selectionner un magasin}    Selectionner un magasin    

    ${Confirmer ton offre}=    Get Text    //div[normalize-space()='Confirmer ton offre']
    Should Be Equal As Strings    ${Confirmer ton offre}    Confirmer ton offre    
    # Get Text    xpath=//div[normalize-space()='Faire un diagnostique']
    # Get Text    xpath=//div[normalize-space()='Selectionner un magasin']
    # Get Text    xpath=//div[normalize-space()='Confirmer ton offre']


I close the popup
    Click    xpath=//button[@id="bj9vjj1"]
    