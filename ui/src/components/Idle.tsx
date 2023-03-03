import { UserPlusIcon, TrashIcon, CursorArrowRaysIcon } from '@heroicons/react/24/solid';

import { Arrows } from '@/components/Arrows';
import { BottomMenu } from '@/components/BottomMenu';

import { ResourceState } from '@/types/states';

export function Idle() {
  const onSelect = (): void => {
    window.game.emit('setResourceState', ResourceState.SELECT);
  };

  const onCreate = (): void => {
    window.game.emit('setResourceState', ResourceState.CREATE);
  };

  const onDelete = (): void => {
    window.game.emit('setResourceState', ResourceState.DELETE);
  };

  return (
    <div className="w-screen h-screen text-white font-inter relative">
      <Arrows />
      <BottomMenu>
        <button
          type="button"
          className="uppercase font-semibold inline-flex items-center gap-2 transition-all hover:scale-105"
          onClick={onSelect}
        >
          <CursorArrowRaysIcon className="h-6 w-6" />
          Select character
        </button>
        <button
          type="button"
          className="uppercase font-semibold inline-flex items-center gap-2 transition-all hover:scale-105"
          onClick={onCreate}
        >
          <UserPlusIcon className="h-6 w-6" />
          Create character
        </button>
        <button
          type="button"
          className="uppercase font-semibold inline-flex items-center gap-2 transition-all hover:scale-105"
          onClick={onDelete}
        >
          <TrashIcon className="h-6 w-6" />
          Delete character
        </button>
      </BottomMenu>
    </div>
  );
}
