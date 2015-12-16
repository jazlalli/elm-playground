import Window
import Debug
import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)


main : Signal Element
main =
  Signal.map displaySquares Window.dimensions

displaySquares : (Int, Int) -> Element
displaySquares (w, h) =
  let screenSize = if (w < h) then w else h
      squareSize = (toFloat screenSize) / 8
  in
    [-3..4]
      |> List.map createRow
      |> List.concat
      |> List.map (createSquare squareSize)
      |> collage w h

createRow : Int -> List (Int, Int)
createRow idx =
  [-3..4]
    |> List.map (\x -> (x, idx))

createSquare : Float -> (Int, Int) -> Form
createSquare size (x, y) =
  let color = if ((x+y) % 2 == 0) then black else white
  in
    square size
      |> filled color
      |> move ((moveSquare size x), (moveSquare size y))

moveSquare : Float -> Int -> Float
moveSquare size idx =
  (toFloat idx) * (size) - (size/2)

black : Color
black =
  rgba 0 0 0 1

white : Color
white =
  rgba 245 245 245 1