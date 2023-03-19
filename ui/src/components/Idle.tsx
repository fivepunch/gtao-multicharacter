import { UserPlusIcon, TrashIcon, CursorArrowRaysIcon } from '@heroicons/react/24/solid';

import { SelectionMenu } from '@/components/SelectionMenu';

import { ResourceState } from '@/types/states';

function IdleOptions() {
  const onSelect = (): void => {
    window.game.emit('setResourceState', { state: ResourceState.SELECT });
  };

  const onCreate = (): void => {
    window.game.emit('setResourceState', { state: ResourceState.CREATE });
  };

  const onDelete = (): void => {
    window.game.emit('setResourceState', { state: ResourceState.DELETE });
  };

  return (
    <>
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
    </>
  );
}

export function Idle() {
  return <SelectionMenu options={<IdleOptions />} />
}
