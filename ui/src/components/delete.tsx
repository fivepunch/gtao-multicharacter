import { ArrowUturnLeftIcon } from '@heroicons/react/24/solid';

import { ResourceState } from '@/types/states';

export function Delete() {
  return (
    <button
      type="button"
      className="uppercase font-semibold inline-flex items-center gap-2 transition-all hover:scale-105"
      onClick={() =>
        window.game.emit('setResourceState', { state: ResourceState.IDLE, parameters: { setIntoSelection: false } })
      }
    >
      <ArrowUturnLeftIcon className="h-6 w-6" />
      Return
    </button>
  );
}
