import "phoenix_html"
import "bootstrap"
import "bootstrap4-notify"
import $ from "jquery"
import css from "../css/app.scss"
import "../../deps/phoenix_html"
import "@fortawesome/fontawesome-free/js/all"
import { Socket } from "phoenix"
import LiveSocket from "phoenix_live_view"
import Hooks from "./hook"
import "alpinejs"
import "./components/flash_message"
import runFontAwesome from "./fontawesome"

window.jQuery = $
window.$ = $

const feather = require("feather-icons")
feather.replace()

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, { hooks: Hooks, params: { _csrf_token: csrfToken } });
liveSocket.connect()

runFontAwesome();
