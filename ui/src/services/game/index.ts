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

  public async emit<T extends unknown>(endpoint: string, data = {}): Promise<T | undefined> {
    if (!__IS_CFX_NUI && this.mocks) {
      const mock = this.mocks[endpoint];

      return mock ? (mock(data) as T) : undefined;
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

  public mock<T>(type: string, cb: EventListener): T | unknown {
    if (__IS_CFX_NUI) return;

    if (!this.mocks) return;

    if (this.mocks && this.mocks[type]) {
      return;
    }

    this.mocks[type] = cb;
  }

  public fakeGameMessage(type: string, payload: unknown): void {
    if (__IS_CFX_NUI) return;

    window.dispatchEvent(
      new MessageEvent('message', {
        data: { type, payload },
      }),
    );
  }
}
