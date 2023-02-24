import { EventEmitter, EventListener, Disposable } from '@/utils/eventEmitter';

export class GameService {
  private eventEmitter = new EventEmitter();
  private mocks?: Record<string, (...parameters: any) => unknown>;

  constructor() {
    if (!__IS_CFX_NUI) {
      this.mocks = {};
    }

    window.addEventListener('message', this.handleGameMessage.bind(this));
  }

  private handleGameMessage(e: MessageEvent): void {
    if (!e.data.type || !e.data.payload) return;

    if (Array.isArray(e.data.payload)) {
      return this.eventEmitter.emit(e.data.type, ...e.data.payload);
    }

    this.eventEmitter.emit(e.data.type, e.data.payload);
  }

  public async emit<T extends unknown>(endpoint: string, data = {}): Promise<T> {
    if (!__IS_CFX_NUI && this.mocks) {
      const mock = this.mocks[endpoint];

      return mock(data) as T;
    }

    const response = await fetch(`https://${GetParentResourceName()}/${endpoint}`, {
      method: 'post',
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: JSON.stringify(data),
    });

    return response.json();
  }

  public addEventListener(type: string, cb: EventListener): Disposable {
    return this.eventEmitter.addListener(type, cb);
  }

  public removeListener(type: string, cb: EventListener): void {
    return this.eventEmitter.removeListener(type, cb);
  }
}