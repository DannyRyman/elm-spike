-- module Name exposing (Model, Msg, update, view, subscriptions, initialState)

-- import Bootstrap.Navbar as Navbar
-- import Html exposing (..)

-- -- You need to keep track of the view state for the navbar in your model

-- type alias Model =
--     { navbarState : Navbar.State }


-- -- The navbar needs to know the initial window size, so the inital state for a navbar requires a command to be run by the Elm runtime

-- initialState : (Model, Cmd Msg)
-- initialState toMsg =
--     let
--         (navbarState, navbarCmd)
--             = Navbar.initialState NavbarMsg
--     in
--         ({ navbarState = navbarState }, navbarCmd )


-- -- Define a message for the navbar

-- type Msg
--     = NavbarMsg Navbar.State


-- -- You need to handle navbar messages in your update function to step the navbar state forward

-- update : Msg -> Model -> (Model, Cmd Msg)
-- update msg model =
--     case msg of
--         NavbarMsg state ->
--             ( { model | navbarState = state }, Cmd.none )

-- view : Model -> Html Msg
-- view model =
--     Navbar.config NavbarMsg
--         |> Navbar.withAnimation
--         |> Navbar.brand [ hr "#"] [ text "Brand"]
--         |> Navbar.items
--             [ Navbar.itemLink [hr "#"] [ text "Item 1"]
--             , Navbar.itemLink [hr "#"] [ text "Item 2"]
--             ]
--         |> Navbar.view model.navbarState

-- -- If you use animations as above or you use dropdowns in your navbar you need to configure subscriptions too

-- subscriptions : Model -> Sub Msg
-- subscriptions model =
--     Navbar.subscriptions model.navbarState NavbarMsg

import Html exposing (..)
import Bootstrap.Navbar as Navbar
import Bootstrap.CDN as CDN
import Html.Events exposing (onClick, onInput)

main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
    }


type alias Model = { message : String, navbarState : Navbar.State }

type Msg = ChangeMessage | ChangeText String | NavbarMsg Navbar.State

init : (Model, Cmd Msg)
init = 
    (Model modelInitialValue, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        ChangeMessage ->
            ({ model | message = "Updated Value" }, Cmd.none)

        ChangeText newContent ->
            ({ model | message = newContent }, Cmd.none)


-- -- <Navbar inverse fluid>
-- --       <Navbar.Header>
-- --         <Navbar.Brand>
-- --           <a href='#'>Primary Issuance Admin</a>
-- --         </Navbar.Brand>
-- --       </Navbar.Header>
-- --       {isFeatureEnabledOnClient(FEATURES.workflow) && props.userName &&
-- --         <div className='currentUser'>
-- --           {props.userName} ({props.groups.join(', ')})
-- --         </div>
-- --       }
-- --     </Navbar>

-- view : Model -> Html Msg
-- view model =
--     div []
--         [ CDN.stylesheet
--           , Navbar NavbarMsg
--           , input [ onInput ChangeText ] []
--           , br [] []
--           , text model.message
--           , button [ onClick ChangeMessage ] [ text "-" ]
--         ]

-- subscriptions : Model -> Sub Msg
-- subscriptions model =
--     Sub.none

-- modelInitialValue : String
-- modelInitialValue = "Initial value"

-- init : (Model, Cmd Msg)
-- init = 
--     (Model modelInitialValue, Cmd.none)
