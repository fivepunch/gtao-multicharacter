import { ArrowUturnLeftIcon } from '@heroicons/react/24/solid';

import { Arrows } from '@/components/Arrows';
import { BottomMenu } from '@/components/BottomMenu';

import { ResourceState } from '@/shared/states';

export function Delete() {
  return (
    <div className="w-screen h-screen text-white font-inter relative">
      <Arrows />
      <BottomMenu>
        <button
          type="button"
          className="uppercase font-semibold inline-flex items-center gap-2 transition-all hover:scale-105"
          onClick={() => window.game.emit('setResourceState', ResourceState.IDLE)}
        >
          <ArrowUturnLeftIcon className="h-6 w-6" />
          Voltar
        </button>
      </BottomMenu>
    </div>
  );
}
