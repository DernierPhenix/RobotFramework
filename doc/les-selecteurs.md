# Les sélecteurs

## Sélecteur en CSS :
Pour sélectionner
- un élément par rapport à son nom de balise : `nomdebalise`
- un élement avec un attribut "id" : `#monid`
- un élément avec une class : `.maclass`
- un attribut name : `[name='lavaleur']`

Un élément par rapport à un autre :
- un élément qui a un ancètre précis : `ancètre élément`
- un élément avec un parent direct précis : `parent > élément`

## Sélecteur en XPATH
Pour chercher un élément à la racine : `/élément`
Pour chercher un élément peu importe son emplacement : `//élément`

Pour sélectionner
- un élément par rapport à son nom de balise : `//nomdebalise`
- un élement avec un attribut "id" : `//élément[@id="monid"]`
- un élément avec une class : `//élément[@class="ma ou mes classes"]` => `//élément[contains(@class, "maclass")]`
- un élément avec une class précise : `//élément[contains(concat(" ", normalize-space(@class), " "), " maclass ")]`
- un élément peu importe son nom de balise avec attribut name : `//*[@name='lavaleur']`


Un élément par rapport à un autre :
- un élément qui a un ancètre précis : `//ancètre//élément`
- un élément avec un parent direct précis : `//parent/élément`

## Next level

- un élément qui comme nom de balise 'article' avec un attribut 'data-id' égal à '22':
  - CSS : `article[data-id='22']`
  - XPTAH : `//article[@data-id='22']`

- un élément qui comme parent un balise 'article'. Cet élément a comme attribut 'href' égal à '/cart':
  - CSS : `article > [href='/cart']`
  - XPATH : `//article/*[@href='/cart']`