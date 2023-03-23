# GTAO Multicharacter

Embrace the spirit of Los Santos, @#$% those cute apartments.

**GTAO Multicharacter** is an open-source example of [Fivepunch Multicharacter](https://forum.cfx.re/t/standalone-fivepunch-multicharacter/5013987), a fully customizable, well documented, and lore friendly multicharacter script.

The code contained in this repository is just an example of what can be done using the resource API.

Check the documentation to explore all your possibilities.

## Useful links

- [Fivepunch store](https://fivepunch.tebex.io)
- [Fivepunch documentation](https://docs.fivepunch.io/resources/fivepunch-multicharacter)
- [Fivepunch Discord](http://discord.fivepunch.io)
- [Fivepunch website](https://fivepunch.io)

## Preview (click to see the video)

[![Preview video](https://cdn-cf-east.streamable.com/image/ugne2h-screenshot556771.jpg?Expires=1679624423632&Key-Pair-Id=APKAIEYUVEN4EVB2OKEQ&Signature=UU~3BIKj6If043j~zU9LX3FPNlC7sN7i5a89qOOnv7si5qLPg7-HLiStUm7a8~6pb~I17D2aPmSaAXj568WanAxEXpHr7Ih8wvKLh7rTvfsmcV1YfWMkTpEmQD8fmtmfOyHDL3Zbx9eS5RQb~u1brRiN64MRNHYC5UARs3gsOyTdr2afEfUD~5Jz1kuZkE~8~E-CvkhvE7eXUqcE8nHoTjGXmDDnu8De0BSF5tn1y~wtdb-GY5SOrd18imiyWBi0tyoNcRSNd5vNGJIy-pyl3SOduC2B1KdcOaTGr2RNiVkqav8kdPR0M14-GU7wcCRT44uJglOyAD2XGOGBRC0YZQ__)](https://streamable.com/ugne2h)

## Framework support

The resource provides framework support for the default server recipe of each framework. If you're having trouble using custom resources, see the forum post for frequent snippets and support.

Feel free to contribute or provide help on the forums. :)

### ESX
GTAO Multicharacter uses default ESX resources as dependencies like `skinchanger`, `esx_skin` and `esx_identity`.

### QB-Core
GTAO Multicharacter uses default QB-Core resources as dependencies like `qb-clothing`.

## Installation

This resource has two dependencies, [fivepunch-multicharacter](https://forum.cfx.re/t/standalone-fivepunch-multicharacter/5013987) and [oxmysql](https://github.com/overextended/oxmysql). Make sure they're both installed before continuing.

*Fivepunch Multicharacter is a paid resource, [purchase it here](https://fivepunch.tebex.io/package/5504485). You'll need it to GTAO Multicharacter work properly.

### All frameworks

1. Download the latest version of **GTAO Multicharacter** from the releases section.
2. Drag the `gtao-multicharacter` folder to your resources directory.
3. Add `ensure gtao-multicharacter` to your `server.cfg`.

### QB-Core specific

1. Remove `qb-multicharacter` from your `server.cfg` or delete the resource folder inside `[resources]/[qb]`
2. Remove the following codeblock in [qb-interior](https://github.com/qbcore-framework/qb-interior/blob/82555d64297ae90045bfa4831e38ab28fdd36f91/client/main.lua#L71):
    ```lua
      if IsNew then
          SetTimeout(750, function()
              TriggerEvent('qb-clothes:client:CreateFirstCharacter')
              IsNew = false
          end)
      end
    ```

### ESX specific

1. Remove the `client_scripts { 'client/*.lua' }` entry from `esx_multicharacter` fxmanifest.lua. Yes, just `client_scripts`, keep `shared_scripts`.

    GTAO Multicharacter re-utilizes the server side resources of `esx_multicharacter` to have maximum compatibility with the framework.

## License

This project uses a custom license. See the [LICENSE](./LICENSE) file for more details.
