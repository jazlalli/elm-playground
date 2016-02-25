import Mouse
import Graphics.Element exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

main : Signal Html
main =
  Signal.map render Mouse.position

render : (Int, Int) -> Html
render (x, y) =
  div [ coordContainer ]
    [
      div [ coord ] [ text <| prependCoord "x" x ]
    , div [ coord ] [ text <| prependCoord "y" y ]
    ]

prependCoord : String -> Int -> String
prependCoord axis value =
  axis ++ " = " ++ (appendUnit value)

appendUnit : Int -> String
appendUnit val =
  toString val ++ "px"

coordContainer : Attribute
coordContainer =
  style
    [ ("text-align", "center"),
      ("font-size", "24pt"),
      ("padding", "50px")
    ]

coord : Attribute
coord =
  style
    [ ("padding", "10px 0px")
    ]