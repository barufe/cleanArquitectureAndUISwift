# Casos de uso

## Mostrar listas de cryptomonedas globales

Como usuario, quiero poder consultar las crypto globales ordenadas por capitalizacion de mercado (Market cap)

GIVEN Tengo la app iniciada
WHEN accedo a la vista global
THEN veo un listado de crypto globales
AND información básica de cada crypto (nombre, simbolo, precio, cambio de precio últimas 24h, volumen últimas 24h, capitalización de mercado)

-Entities
    Cryptocurrency
        Id
        Name
        Symbol
        Price
        Price24
        Vulume24
        MarketCap
        
-Use cases
    Get Global List
    
## Ver el historial de precios de una cryptomodeda

Como usuario, quiero poder consultar el historial del precio de una crypto
GIVEN Estoy en la vista global
WHEN accede al detalle de una cryptomodena 
THEN veo la información básico (nombre, symbol, precio, cambio de precio últimas 24h, volumen últimas 24h, capitalización de mercado)

GIVEN Estoy en la vista del detalle de una cryptomodena 
WHEN selecciono el rango de días del historico de precios (30 días, 90 días, 180 días y 1 año)
THEN veo el historial de precios para ese rango de días (30 días, 90 días, 180 días y 1 año) con precio y fecha

-Entities
    Cryptocurrency
        Id
        Name
        Symbol
        Price
        Price24
        Vulume24
        MarketCap
    
    CryptocurrencyPriceHistory
        Prices
        
      DataPoint
        Price
        Date

-Use cases
    Get Price History
    

## Mostrar lista de todas las cryptomonedas 

Como usuario, quiero poder consultar la lista de todas las cryto disponibles en orden alfabético.
Como usuario, quiero poder buscar la cryto que me interese introduciendo el nombre o el simbolo. 

GIVEN Tengo la app iniciada
WHEN Accedo a la vista con todas las cryptos
THEN Veo un listado de todas las crypto disponiblesy su simbolo

GIVEN Estoy en la vista de todas las crytos
WHEN Introduzco un texto en la busqueda
THEN Veo un listado de todas las cryptos disponibles cuyo nombre o simbolo contienen el texto introducido.

- Entities
    CryptocurrencyBasicInfo
        id
        name
        symbol
        
- Use Cases 
    Get cryto list
    Search crypto by name or symbol
    =
