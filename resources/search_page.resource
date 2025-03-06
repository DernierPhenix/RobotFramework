*** Settings ***
Library  Browser
Library    Collections
Resource  ../resources/homepage_page.resource


*** Keywords ***
I search for "${search}"
    Fill Text    xpath=//input[@type='search']    ${search}
    Click    xpath=//button[@type='submit']
    
the search results contain the word "${search}"
    Get Element States   id=search-suggestions-banner    contains    visible
    Get Text    css=.searchText  contains  ${search}

# Vérifier que l'élément "Meilleurs ventes" est sélectionné par dafaut
the selected sorting method is "${sorting}"
    Get Selected Options    id=list-sort-select  label  contains  ${sorting}
# Sélectionner un élément dans la liste déroulante
I sort the list by "${sorting}"
    Select Options By    id=list-sort-select    label  contains  ${sorting}

I open the first product page
        Click    xpath=(//*[contains(concat(' ', normalize-space(@class), ' '), ' product-list ')]/*)[1]//a[./img]

the sellers are displayed correctly
# Création d'une liste de 5 éléments contenus dans une variable
    @{list}=  Create List  Decathlon  Balles de Sport  Sport & Go  Butyjana  Sportano EU
    
    ${count}=  Get Length  ${list}
    FOR    ${index}    IN RANGE    1    ${count + 1}
        Log    ${index}
        ${seller}=  Get From List    ${list}    ${index - 1}

        Get Text    xpath=(//summary[.//*[contains(text(), 'Filtrer par vendeurs')]]/following-sibling::div//a)[${index}]  contains  ${seller}
        
    END    

there are "${seller_count}" sellers listed
    # ${seller_count}=  Get Length  ${list}
    # Get Text    xpath=//summary[.//*[contains(text(), 'Filtrer par vendeurs')]]/following-sibling::div  contains  ${seller_count}

    @{list_on_page}=  Get Elements    xpath=(//summary[.//*[contains(text(), 'Filtrer par vendeurs')]]/following-sibling::div//a)

    @{list_of_sellers}=  Create List
    FOR    ${seller}    IN    @{list_on_page}
        Log  ${seller}
        ${text}=  Get Text    ${seller}
        Append To List    ${list_of_sellers}    ${text}
    END

    ${list_count}=  Get Length    ${list_of_sellers}    
    Should be equal As Integers  ${seller_count}  ${list_count}