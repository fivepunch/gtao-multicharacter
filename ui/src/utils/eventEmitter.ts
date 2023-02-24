export type EventListener = (...parameters: any) => void;
export type Disposable = () => void;

export class EventEmitter {
  private listeners: Record<string, Set<EventListener>> = {};

  readonly addListener = (type: string, cb: EventListener): Disposable => {
    if (!this.listeners[type]) {
      this.listeners[type] = new Set();
    }

    this.listeners[type].add(cb);

    return () => this.listeners[type].delete(cb);
  };

  readonly removeListener = (type: string, cb: EventListener) => {
    if (!this.listeners[type]) return;

    this.listeners[type].delete(cb);
  };

  readonly emit = (type: string, ...parameters: unknown[]) => {
    if (!this.listeners[type]) return;

    for (const cb of this.listeners[type]) {
      cb(...parameters);
    }
  };
}
