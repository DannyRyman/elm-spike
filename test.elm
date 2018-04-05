import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Bootstrap.Form as Form
import Bootstrap.Form.Select as Select
import List exposing (map)

main : Program Never Model Msg
main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }

-- MODEL
type alias Model = Int

model : Model
model =
  0

-- UPDATE
type Msg
  = Increment
  | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

-- VIEW
view : Model -> Html Msg
view model =
  div [] [
    Html.node "link" [ Html.Attributes.rel "stylesheet", Html.Attributes.href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" ] [],
    header "Company Administration",
    div [style [ ("padding-left", "15px"), ("padding-right", "15px"), ("padding-top", "15px") ]] [
      companySelect,
      button [ onClick Decrement ] [ text "-" ],
      div [] [ text (toString model) ],
     button [ onClick Increment ] [ text "+" ]
    ]
  ]

-- Bootstrap components
header : String -> Html Msg
header title =
  nav [ class "navbar navbar-expand-lg navbar-dark bg-dark" ]
  [
    a [ class "navbar-brand", href "#" ] [ text title ]
  ]

companySelect : Html Msg
companySelect =
  Form.group [] [
    lookup [
      ("alpha-bank", "Alpha Bank"),
      ("bankco", "Bankco Bank")
    ]
  ]

lookup : List ( String, String ) -> Html msg
lookup items =
  Select.select [] (List.map (\(v, t) -> Select.item [ value v ] [ text t ]) items)
