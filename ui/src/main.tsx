import React from "react";
import ReactDOM from "react-dom/client";

import { GameService } from "./services/game";
import { App } from "./app";

declare global {
  function GetParentResourceName(): string;

  interface Window {
    gameService: GameService;
  }

  var __IS_CFX_NUI: boolean;
}

window.__IS_CFX_NUI = "GetParentResourceName" in window;

window.gameService = new GameService();

ReactDOM.createRoot(document.getElementById("root") as HTMLElement).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
