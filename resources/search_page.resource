*** Settings ***
Library  Browser
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