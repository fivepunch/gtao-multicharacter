import {
  UserPlusIcon,
  TrashIcon,
  CursorArrowRaysIcon,
} from "@heroicons/react/24/solid";

export function Select() {
  return (
    <div className="w-screen h-screen text-white font-inter relative">
      <div className="w-full flex justify-between absolute px-24 top-1/2 -translate-y-1/2">
        <button
          type="button"
          className="transition-all opacity-75 hover:opacity-100"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            strokeWidth="2"
            strokeLinecap="round"
            strokeLinejoin="round"
            className="h-24 w-24"
          >
            <polyline points="15 18 9 12 15 6"></polyline>
          </svg>
        </button>
        <button
          type="button"
          className="transition-all opacity-75 hover:opacity-100"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            strokeWidth="2"
            strokeLinecap="round"
            strokeLinejoin="round"
            className="h-24 w-24"
          >
            <polyline points="9 18 15 12 9 6"></polyline>
          </svg>
        </button>
      </div>
      <div className="h-32 w-full absolute bottom-0 bg-gradient-to-t from-black to-black/30">
        <div className="max-w-[1920px] w-full h-full flex items-center gap-16 px-24 py-4">
          <button
            type="button"
            className="uppercase font-semibold inline-flex items-center gap-2 transition-all hover:scale-105"
          >
            <CursorArrowRaysIcon className="h-6 w-6" />
            Select character
          </button>
          <button
            type="button"
            className="uppercase font-semibold inline-flex items-center gap-2 transition-all hover:scale-105"
          >
            <UserPlusIcon className="h-6 w-6" />
            Create character
          </button>
          <button
            type="button"
            className="uppercase font-semibold inline-flex items-center gap-2 transition-all hover:scale-105"
          >
            <TrashIcon className="h-6 w-6" />
            Delete character
          </button>
        </div>
      </div>
    </div>
  );
}
