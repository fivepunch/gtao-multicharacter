import { GameService } from './services/game';

declare global {
  function GetParentResourceName(): string;

  interface Window {
    game: GameService;
  }

  var __IS_CFX_NUI: boolean;
}

window.__IS_CFX_NUI = 'GetParentResourceName' in window;

window.game = new GameService();
